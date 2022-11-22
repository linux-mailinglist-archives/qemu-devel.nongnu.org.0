Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6F6226348D8
	for <lists+qemu-devel@lfdr.de>; Tue, 22 Nov 2022 21:59:44 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1oxaL0-0007Jn-5m; Tue, 22 Nov 2022 15:57:50 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1oxaKx-0007HW-DM
 for qemu-devel@nongnu.org; Tue, 22 Nov 2022 15:57:47 -0500
Received: from mail-pf1-x433.google.com ([2607:f8b0:4864:20::433])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1oxaKv-0003UI-Ra
 for qemu-devel@nongnu.org; Tue, 22 Nov 2022 15:57:47 -0500
Received: by mail-pf1-x433.google.com with SMTP id 140so15481306pfz.6
 for <qemu-devel@nongnu.org>; Tue, 22 Nov 2022 12:57:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=H9jFu9uG41whHckncNnQfwXtObMjZa4oIQS9COdwadA=;
 b=DhhY/KpJvtdCO5i/VsPniYETfljZvdg+k8O6XQuFPrr8Sm33Fzt1JqfS3YOEjkxkkg
 mIvnPd5WnL+R3yZxYETNnz0ew8nFejLCE8DxDRmaMAAoQwyhtJJCfkg1spCcRZ0FnaXE
 wI4MtXyQ87hvktRrQu56Ae3UDxyHdl73xR+eE/mvLKIQsWBRPMIjOBEKGbEqgqUqgQSu
 ol7Jxi7xFX6atGOelABRbAzbAYur7/XSqMeKiqh/x/qU6T13/FpJ7lW0UiVF2ateUdpl
 J0PVBn/bEzsHxyRtWP573Z0dTSsmB/MUbfU4SmlFWRosq2EM4ZUVDkfKgoWph/rLgue7
 FAPQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=H9jFu9uG41whHckncNnQfwXtObMjZa4oIQS9COdwadA=;
 b=Wj3sclpxeF9R4TTYAF5WLTfULKh+L0u5FOwfXg5vJaSQVFEXE2ZElCZBL/F/e0MFRT
 /B71EYQDF6aAx+wnYrGHlO4l5H7k2GYHn5yZIp/sP7X3GwMq8oyMyN8Oajv4yltDnkFa
 WquGYB4mD37EqWogvVuIH46CYwl0H3kDMmtfW2seOSDN5bRXBeLH9TEGlQpYHz/SjMic
 RXvYVzYVUCOJsaQfoasmNHPeILEgNbhp7KQaNZsss8OX5uPMptuQ9ieYaqqH8Ik533I8
 CdHTJPLrvyHG60dq1vZgfmyxpaU2DDGF+OHAOD+i/EIMWi7Nyu7QJjCD2spF+2DKcgqX
 Ommg==
X-Gm-Message-State: ANoB5plHbqttCZNGZp94xg8LoGUL4DQiHXjyMh9/THql91m+dYFJ+nfk
 oFPW8tZ1PlNRodozge+tCoRvJrbrXlMEtg==
X-Google-Smtp-Source: AA0mqf4XsNu4iYWk6stTKrn9nftqK0TN80y1myy/5rhs88oU0xqxLvjaZrt3NCEB0GAZfIgHFhKokQ==
X-Received: by 2002:a05:6a00:4c11:b0:56d:93d8:d81a with SMTP id
 ea17-20020a056a004c1100b0056d93d8d81amr5976984pfb.14.1669150664538; 
 Tue, 22 Nov 2022 12:57:44 -0800 (PST)
Received: from stoup.. ([2602:47:d48a:1201:90f5:6f8b:e78a:4a0])
 by smtp.gmail.com with ESMTPSA id
 d19-20020a170903209300b00186fa988a13sm12383807plc.166.2022.11.22.12.57.43
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 22 Nov 2022 12:57:44 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: pbonzini@redhat.com, philmd@linaro.org, alex.bennee@linaro.org,
 Daniel Henrique Barboza <danielhb413@gmail.com>
Subject: [PATCH v2 3/7] target/ppc: Use QEMU_IOTHREAD_LOCK_GUARD in
 ppc_maybe_interrupt
Date: Tue, 22 Nov 2022 12:57:35 -0800
Message-Id: <20221122205739.603510-4-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20221122205739.603510-1-richard.henderson@linaro.org>
References: <20221122205739.603510-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::433;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x433.google.com
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

Reviewed-by: Paolo Bonzini <pbonzini@redhat.com>
Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>
Reviewed-by: Daniel Henrique Barboza <danielhb413@gmail.com>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/ppc/excp_helper.c | 11 +----------
 1 file changed, 1 insertion(+), 10 deletions(-)

diff --git a/target/ppc/excp_helper.c b/target/ppc/excp_helper.c
index 94adcb766b..8591bb3f73 100644
--- a/target/ppc/excp_helper.c
+++ b/target/ppc/excp_helper.c
@@ -2163,22 +2163,13 @@ static int ppc_next_unmasked_interrupt(CPUPPCState *env)
 void ppc_maybe_interrupt(CPUPPCState *env)
 {
     CPUState *cs = env_cpu(env);
-    bool locked = false;
-
-    if (!qemu_mutex_iothread_locked()) {
-        locked = true;
-        qemu_mutex_lock_iothread();
-    }
+    QEMU_IOTHREAD_LOCK_GUARD();
 
     if (ppc_next_unmasked_interrupt(env)) {
         cpu_interrupt(cs, CPU_INTERRUPT_HARD);
     } else {
         cpu_reset_interrupt(cs, CPU_INTERRUPT_HARD);
     }
-
-    if (locked) {
-        qemu_mutex_unlock_iothread();
-    }
 }
 
 #if defined(TARGET_PPC64)
-- 
2.34.1


