Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 79F2B6AB474
	for <lists+qemu-devel@lfdr.de>; Mon,  6 Mar 2023 02:58:32 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pZ06H-000484-PP; Sun, 05 Mar 2023 20:57:21 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pZ06F-00046D-D3
 for qemu-devel@nongnu.org; Sun, 05 Mar 2023 20:57:15 -0500
Received: from mail-pf1-x42a.google.com ([2607:f8b0:4864:20::42a])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pZ06D-0003I4-U7
 for qemu-devel@nongnu.org; Sun, 05 Mar 2023 20:57:15 -0500
Received: by mail-pf1-x42a.google.com with SMTP id a7so4764262pfx.10
 for <qemu-devel@nongnu.org>; Sun, 05 Mar 2023 17:57:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1678067832;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=Bb1MvQENYvqwlCsbLz4Q8O0K4bvqjmgK92p9rz/GLeU=;
 b=kupcKo6JPyAPlg1eWkBYKaD/AbifcgsbO4jsMG9gJCqO1p+GrRMlKV5pfs0y4+c1gv
 JO34AVUzjfji7+YFKh3i7zOJpX+qOYPF7YWTNpGu0uIwaWXbGi5ftg6XPw4+8BL34rfn
 UvDvrzXSAWd9Xf9riaR9kPVze4CmqHCjirgiLFQy00JZK8IFYPqsgbOT0fKNwfxgQkPG
 E9FDVmFWYBm2OKcN1x1CHvJIdfYADhpWH6A7j4oMCoKclxSWSD722HJgYU7mdxnwQ3hr
 Ff2NHDOwHMNvaHUS9HvyFdWtEpH67KCfvqrZIP8phSEgLyha20qbb3QM9VQkEAXboTgh
 MVbA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1678067832;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=Bb1MvQENYvqwlCsbLz4Q8O0K4bvqjmgK92p9rz/GLeU=;
 b=X+iJ+uD9wOToknWCgEG2mRIPosBhdh3GVfmI2X1c5oZ88sLo+aSh2Vw0xk3b4uGtvS
 WxSjSNxS3xCr2yJXATJUljLWO4bySQqs3P0tZtmbICT/an2h3NM+0iDPmDTT8Ksr1o9t
 Bhhu7MZT4WolCUlLn2OvIL5IwWh/7BUZRloLDw+dCjmgsHKzNCrNj4PyzhamI6T/fYar
 JsyrVEW6NcE5LeYEYVLIa4/dStncFUlWtlSpkPTQZTfxu7ygIC2xEFVA35zYVv32NK0E
 ZyAVqYUoMFcl7598L/IZcfP2n3PYjk1/t3+k/VFQrhO6eBa4GUn/Ae6kZGiyES5x1fCl
 D1LA==
X-Gm-Message-State: AO0yUKX9f/GlvTc122mdDbAb8UoUPeX2K2kLUVGoACoVu+axWP0E13pY
 x7/ir9P0j1/JM3bIGKI53BqKxYDLvS1yIDDSwmrgnQ==
X-Google-Smtp-Source: AK7set9Iml6+iq1nGwThPXPqzQdcYfUGmlSi68U8Z/LtaipgTblZHvCCx0CzoZ/9q2bBaDDhrsz8xQ==
X-Received: by 2002:aa7:9583:0:b0:5a9:b7e3:2ed6 with SMTP id
 z3-20020aa79583000000b005a9b7e32ed6mr10140523pfj.17.1678067832308; 
 Sun, 05 Mar 2023 17:57:12 -0800 (PST)
Received: from stoup.. ([2602:ae:154a:9f01:87cc:49bb:2900:c08b])
 by smtp.gmail.com with ESMTPSA id
 g23-20020aa78197000000b0061949fe3beasm2921056pfi.22.2023.03.05.17.57.11
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 05 Mar 2023 17:57:11 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: pbonzini@redhat.com
Subject: [PATCH v2 1/5] tcg: Do not elide memory barriers for !CF_PARALLEL
Date: Sun,  5 Mar 2023 17:57:06 -0800
Message-Id: <20230306015710.1868853-2-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230306015710.1868853-1-richard.henderson@linaro.org>
References: <20230306015710.1868853-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::42a;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x42a.google.com
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

The virtio devices require proper memory ordering between
the vcpus and the iothreads.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 tcg/tcg-op.c | 10 +++++++---
 1 file changed, 7 insertions(+), 3 deletions(-)

diff --git a/tcg/tcg-op.c b/tcg/tcg-op.c
index 77658a88f0..75fdcdaac7 100644
--- a/tcg/tcg-op.c
+++ b/tcg/tcg-op.c
@@ -102,9 +102,13 @@ void tcg_gen_br(TCGLabel *l)
 
 void tcg_gen_mb(TCGBar mb_type)
 {
-    if (tcg_ctx->gen_tb->cflags & CF_PARALLEL) {
-        tcg_gen_op1(INDEX_op_mb, mb_type);
-    }
+    /*
+     * It is tempting to elide the barrier in a single-threaded context
+     * (i.e. !(cflags & CF_PARALLEL)), however, even with a single cpu
+     * we have i/o threads running in parallel, and lack of memory order
+     * can result in e.g. virtio queue entries being read incorrectly.
+     */
+    tcg_gen_op1(INDEX_op_mb, mb_type);
 }
 
 /* 32 bit ops */
-- 
2.34.1


