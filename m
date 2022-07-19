Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7AB30579A5C
	for <lists+qemu-devel@lfdr.de>; Tue, 19 Jul 2022 14:13:52 +0200 (CEST)
Received: from localhost ([::1]:54628 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oDm6n-0000cU-Tb
	for lists+qemu-devel@lfdr.de; Tue, 19 Jul 2022 08:13:49 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51882)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1oDm4N-0004vw-P9
 for qemu-devel@nongnu.org; Tue, 19 Jul 2022 08:11:19 -0400
Received: from mail-wr1-x429.google.com ([2a00:1450:4864:20::429]:44782)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1oDm4M-0001lg-0N
 for qemu-devel@nongnu.org; Tue, 19 Jul 2022 08:11:19 -0400
Received: by mail-wr1-x429.google.com with SMTP id bk26so21274754wrb.11
 for <qemu-devel@nongnu.org>; Tue, 19 Jul 2022 05:11:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=0ETA/mDbYhq/UKc8mSgAXpRi3qw9ZajpFxGpuDQmECA=;
 b=pjRScg81sOpxeHDV2gj/WY7amhwmdAz5lOXZIUSO4maz9uNprEfztim7cIpDBO+kBx
 ndbF3vCip/DqGky9Ls/Vobba8pdIOr9BHpYTun66eDSVmAiVMUmGN+GLSUF1tjntdNfW
 NcbOYWCbdiZ/Ye9SKHzI4ZuKxbCn3mRBqI3IyqD+JGf2ECA1TpWRdssGh9hcsiwIKPX/
 R3aAVmeejcuI128+ioJadeWfu3S2i77Dt3wkoA+jy9Dd0eK0Dy+j9CKAW38Jdj795w82
 2NER3XIbAFA+2pvHpDH8pLQop7GgnaBObIF4v54HtC24qZLsBuyYG8IrIb61kN0HWti6
 BqxA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=0ETA/mDbYhq/UKc8mSgAXpRi3qw9ZajpFxGpuDQmECA=;
 b=Vl3McLHG7sI6C2wg0z24csKPyKocx1u+dPrM6Pbp2glTq1+V+Nrqhv+xzu3jGIMMSo
 TSSh7gUs/XGvZpbmNwIgaoI2ckU0GAjOOzCpmNq752+vG98TSxcKjx2EW1Rlh5NRQGyN
 EtgeVdB5ZulWgMp9oSoIHuBUai6e5OqiB001aHW8vLr0UIoGJX1quqPoxhaQNJ7u+4Kr
 RlLA94xSPeNJtsFZ+2HugjfHhRsZG6PV3G5FuX+0QYZjwj9dqzICb56fyQh8Bzv8Ltq7
 JjBpayw6t5SyV0mk4mHeFbMdjnURDVBny3jQWl5wSNWEH0r/UCdfMU2Q0FH1m25mPlbs
 6Igw==
X-Gm-Message-State: AJIora+LvVEWwzTveip/khqeaJxSMl2pCqmoLpJeFa3iUWaoB/rc4Wnl
 M62fgq17aOpJoUYqibDGaxBcXUVHVuFZzg==
X-Google-Smtp-Source: AGRyM1vHpWIFmryRkJtg67b+268GgOT2DO3XId+d2McqGh6y7gjWBQUiMMgXq+zbbXJ6qpFRiFNXdg==
X-Received: by 2002:adf:cf0a:0:b0:21e:2970:bade with SMTP id
 o10-20020adfcf0a000000b0021e2970bademr4583652wrj.455.1658232676729; 
 Tue, 19 Jul 2022 05:11:16 -0700 (PDT)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [2001:8b0:1d0::2])
 by smtp.gmail.com with ESMTPSA id
 m21-20020a05600c4f5500b0039c5ab7167dsm22111287wmq.48.2022.07.19.05.11.16
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 19 Jul 2022 05:11:16 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-devel@nongnu.org
Cc: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
Subject: [PATCH 4/4] semihosting: Fix handling of buffer in TARGET_SYS_TMPNAM
Date: Tue, 19 Jul 2022 13:11:10 +0100
Message-Id: <20220719121110.225657-5-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220719121110.225657-1-peter.maydell@linaro.org>
References: <20220719121110.225657-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::429;
 envelope-from=peter.maydell@linaro.org; helo=mail-wr1-x429.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

The TARGET_SYS_TMPNAM implementation has two bugs spotted by
Coverity:
 * confusion about whether 'len' has the length of the string
   including or excluding the terminating NUL means we
   lock_user() len bytes of memory but memcpy() len + 1 bytes
 * In the error-exit cases we forget to free() the buffer
   that asprintf() returned to us

Resolves: Coverity CID 1490285, 1490289
Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 semihosting/arm-compat-semi.c | 13 +++++++++++--
 1 file changed, 11 insertions(+), 2 deletions(-)

diff --git a/semihosting/arm-compat-semi.c b/semihosting/arm-compat-semi.c
index d12288fc806..e741674238f 100644
--- a/semihosting/arm-compat-semi.c
+++ b/semihosting/arm-compat-semi.c
@@ -504,16 +504,25 @@ void do_common_semihosting(CPUState *cs)
         GET_ARG(1);
         GET_ARG(2);
         len = asprintf(&s, "/tmp/qemu-%x%02x", getpid(), (int)arg1 & 0xff);
+        if (len < 0) {
+            common_semi_set_ret(cs, -1);
+            break;
+        }
+
+        /* Allow for trailing NUL */
+        len++;
         /* Make sure there's enough space in the buffer */
-        if (len < 0 || len >= arg2) {
+        if (len > arg2) {
+            free(s);
             common_semi_set_ret(cs, -1);
             break;
         }
         p = lock_user(VERIFY_WRITE, arg0, len, 0);
         if (!p) {
+            free(s);
             goto do_fault;
         }
-        memcpy(p, s, len + 1);
+        memcpy(p, s, len);
         unlock_user(p, arg0, len);
         free(s);
         common_semi_set_ret(cs, 0);
-- 
2.25.1


