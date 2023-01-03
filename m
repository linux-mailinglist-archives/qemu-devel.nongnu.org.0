Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D0BB965C62A
	for <lists+qemu-devel@lfdr.de>; Tue,  3 Jan 2023 19:26:03 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pClrY-0008Sl-D9; Tue, 03 Jan 2023 13:18:14 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pClqU-0008G3-Rw
 for qemu-devel@nongnu.org; Tue, 03 Jan 2023 13:17:22 -0500
Received: from mail-yw1-x1135.google.com ([2607:f8b0:4864:20::1135])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pClqT-00058C-7W
 for qemu-devel@nongnu.org; Tue, 03 Jan 2023 13:17:06 -0500
Received: by mail-yw1-x1135.google.com with SMTP id
 00721157ae682-466c5fb1c39so435115537b3.10
 for <qemu-devel@nongnu.org>; Tue, 03 Jan 2023 10:17:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=HqfB1rYBt/JJ41xGurvUZv7qvN+1zDd4tBuTAwoD6lU=;
 b=zs4hdB3aSZm8LzCLXbA6Sy8Uf8FVVVBtqTNGp3VVazoS9u0699s3XU0BdCxhOqLwBU
 yspbF9lpf/HYTnvJ9RBF15TvytUGwCoQmZ7RWz2qMmHEoqA8FrB1jC3YGf6j7S0SfoIg
 Qoz6e7CeWKZ3b7spH6gl/w9hUvxoKI4Bj9GT2pvVzCQQ11gMFJit/OZiMQkkgKK2NKo0
 8NJ5TVI6LwLZuqufIKfESq1GxzYVR8RXJmmvBIlwv43OWYYMUPui+n26rNYbN+db2kKC
 QYDv42X33J54/EKrF5B7tWfG6I2aL5yN1I+nwQJUkRPzNPJ4kMo9yfnCN2sBgcAKzDcl
 kn4Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=HqfB1rYBt/JJ41xGurvUZv7qvN+1zDd4tBuTAwoD6lU=;
 b=0Ndkl0SWkMwoCvCiTz9ZKZO67Nntb0n+GPntqdQ3jePLSJ2f95CkOWcP/2iDvwllH1
 t63qG71apgmkrd/3QqXe5pmgimxiFYm7weIh2avzyfVwIqGU0NxBUSJSFjwTVoVIJ1Or
 Y5b4h5YPE84VdupBdMEL1S71MZU0iOeXxBhoUbDkL2jAx8XSUfYrDtnfxO3J+g2Qg/OL
 ErJyKYy/oe8TNhq9E9qU0oUF3ckAI1Wm/OvyjT72iBhmmN5BE0TgJz+IPJpIIVxKSpXO
 mzscScvzAs0QN2Cs4ce//ljsrNV/VDZtnYOotMqZyjZpZxEgJ6PO/aM9y2ihB0y2+GZt
 sjWQ==
X-Gm-Message-State: AFqh2koaZHalrSvZj4Bica9GCEryHmzPusTDZch/SAd4pwb1HWoOfTXz
 HSDXKsr45Gi+1kl5lKlAiPbBmuCfE0Ri89lQpS4=
X-Google-Smtp-Source: AMrXdXvKzVspLZdCJW/OXViT8x/MXmMVcCeq95JHl7YKTcNIUuKp2T9kMvcf502/S9t3H9kjed7p4g==
X-Received: by 2002:a81:6ac1:0:b0:4ad:5c08:7e6a with SMTP id
 f184-20020a816ac1000000b004ad5c087e6amr4071306ywc.39.1672769823506; 
 Tue, 03 Jan 2023 10:17:03 -0800 (PST)
Received: from stoup.. ([2607:fb90:8060:51a2:184b:6e49:c396:be2])
 by smtp.gmail.com with ESMTPSA id
 v2-20020a05620a440200b006fed2788751sm23042354qkp.76.2023.01.03.10.17.01
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 03 Jan 2023 10:17:03 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: pbonzini@redhat.com, berrange@redhat.com, eduardo@habkost.net,
 armbru@redhat.com, ajones@ventanamicro.com, alex.bennee@linaro.org
Subject: [RFC PATCH 04/40] target/arm: Remove aarch64_cpu_finalizefn
Date: Tue,  3 Jan 2023 10:16:10 -0800
Message-Id: <20230103181646.55711-5-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230103181646.55711-1-richard.henderson@linaro.org>
References: <20230103181646.55711-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1135;
 envelope-from=richard.henderson@linaro.org; helo=mail-yw1-x1135.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

If the instance_finalize hook is NULL, the hook is not called.
There is no need to install an empty function.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/cpu64.c | 5 -----
 1 file changed, 5 deletions(-)

diff --git a/target/arm/cpu64.c b/target/arm/cpu64.c
index 2cf2ca4ce5..611b233d23 100644
--- a/target/arm/cpu64.c
+++ b/target/arm/cpu64.c
@@ -1351,10 +1351,6 @@ static void aarch64_cpu_set_aarch64(Object *obj, bool value, Error **errp)
     }
 }
 
-static void aarch64_cpu_finalizefn(Object *obj)
-{
-}
-
 static gchar *aarch64_gdb_arch_name(CPUState *cs)
 {
     return g_strdup("aarch64");
@@ -1412,7 +1408,6 @@ static const TypeInfo aarch64_cpu_type_info = {
     .name = TYPE_AARCH64_CPU,
     .parent = TYPE_ARM_CPU,
     .instance_size = sizeof(ARMCPU),
-    .instance_finalize = aarch64_cpu_finalizefn,
     .abstract = true,
     .class_size = sizeof(AArch64CPUClass),
     .class_init = aarch64_cpu_class_init,
-- 
2.34.1


