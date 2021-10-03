Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 639DE42041B
	for <lists+qemu-devel@lfdr.de>; Sun,  3 Oct 2021 23:43:44 +0200 (CEST)
Received: from localhost ([::1]:57772 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mX9Go-00084R-Ue
	for lists+qemu-devel@lfdr.de; Sun, 03 Oct 2021 17:43:42 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:56366)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philipp.tomsich@vrull.eu>)
 id 1mX9G1-0007O7-4z
 for qemu-devel@nongnu.org; Sun, 03 Oct 2021 17:42:53 -0400
Received: from mail-lf1-x130.google.com ([2a00:1450:4864:20::130]:39600)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philipp.tomsich@vrull.eu>)
 id 1mX9Fy-0000EV-Tr
 for qemu-devel@nongnu.org; Sun, 03 Oct 2021 17:42:52 -0400
Received: by mail-lf1-x130.google.com with SMTP id n8so7953010lfk.6
 for <qemu-devel@nongnu.org>; Sun, 03 Oct 2021 14:42:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=vrull-eu.20210112.gappssmtp.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=l3IwrmhKYHOfZ+rT79f9aEpSgQwVthSHCLu34YnwWDw=;
 b=45Z/x5U8LyMcphtJdDpyKhhto3TQO+UYQmR4lCre7S4Yh5oygiN8jyvZhAHdxoBxgO
 sIb38IKVlXbWdxpGzi9lz5JimeWh2WJYdbFGqWp4wbxsPc7v1FC5O+D2VmX9TPQawchT
 0yBhMwm9qOC6ym2j3mubNonUnM/a0y50+hkm2Te4xbuDxt2G8qKsgqneXC9QY86CZ7iF
 NUuvqVGbvkHoHsfGtjR6znemPw/WJ/Nj4qrW7u0YY32EEkQE2PBH0mI3r8VIyoKadIPt
 3lkuCcplRXSgUq8IpKL5g8C+qsun3AyHH8VLUUg6ON+g1U6JctPIZPatjNwfOarbVmj/
 3XvQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=l3IwrmhKYHOfZ+rT79f9aEpSgQwVthSHCLu34YnwWDw=;
 b=ZTZEKUV0D9BOAQafzurTkDb2lOSWxh7dSlAskrkDyzpPS32rI564RkHiY9FrdWuCf3
 BHR0WaqJz769w4lbYGqZ0jRrochyxInX8LIZn48EVIagqoHROTjJIgPfvpF07GpCZ74s
 ueL8LeviIkUSAE8pSsYZdJrwC++vmNtxR9efAYKdvJNl2T43thYxaEnGY3FhJGMb3rke
 vqSZAZ6xk9aC/n14NTaDEHcL0RGIkrzKvTJ+CRerMLVW6CJb9SMfYPyIZ1vDSn26dqSA
 2bBfZjvt5LIa0ZIBS47mX+FJly61B8xfEO8wqFUeWl9H8AWvPV0iTOwAZPu2IjqCTceC
 /SyA==
X-Gm-Message-State: AOAM530Sk1rTwmQcETYmoFWIRDCLK9HwnMyMSsyxnisSNKy4T2pQcQiI
 QGr6awXu0N62f0a9V+SG+4eeUzGw3lDlQ8w4
X-Google-Smtp-Source: ABdhPJxjcugOJT1+DMZsrvfk06Ao6buqNcoE9k3sU0G3plOdH2or4o5UgM6VKfAGp3VoF0oEoq+lmw==
X-Received: by 2002:a2e:140d:: with SMTP id u13mr11508791ljd.298.1633297366874; 
 Sun, 03 Oct 2021 14:42:46 -0700 (PDT)
Received: from localhost.localdomain ([2a01:4f9:3a:1e26::2])
 by smtp.gmail.com with ESMTPSA id l14sm191772lfe.124.2021.10.03.14.42.46
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 03 Oct 2021 14:42:46 -0700 (PDT)
From: Philipp Tomsich <philipp.tomsich@vrull.eu>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 1/2] tcg: add dup_const_tl wrapper
Date: Sun,  3 Oct 2021 23:42:42 +0200
Message-Id: <20211003214243.3813425-1-philipp.tomsich@vrull.eu>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::130;
 envelope-from=philipp.tomsich@vrull.eu; helo=mail-lf1-x130.google.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: Richard Henderson <richard.henderson@linaro.org>,
 Alistair Francis <alistair.francis@wdc.com>,
 Philipp Tomsich <philipp.tomsich@vrull.eu>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

dup_const always generates a uint64_t, which may exceed the size of a
target_long (generating warnings with recent-enough compilers).

To ensure that we can use dup_const both for 64bit and 32bit targets,
this adds dup_const_tl, which either maps back to dup_const (for 64bit
targets) or provides a similar implementation using 32bit constants.

Signed-off-by: Philipp Tomsich <philipp.tomsich@vrull.eu>

---

Changes in v2:
- Changed dup_const_tl to enforce the sanity check with
  qemu_build_not_reached as requested in the review.

 include/tcg/tcg.h | 12 ++++++++++++
 1 file changed, 12 insertions(+)

diff --git a/include/tcg/tcg.h b/include/tcg/tcg.h
index 44ccd86f3e..1bb6c0ce3e 100644
--- a/include/tcg/tcg.h
+++ b/include/tcg/tcg.h
@@ -1272,6 +1272,18 @@ uint64_t dup_const(unsigned vece, uint64_t c);
         : (qemu_build_not_reached_always(), 0))                    \
      : dup_const(VECE, C))
 
+#if TARGET_LONG_BITS == 64
+# define dup_const_tl  dup_const
+#else
+# define dup_const_tl(VECE, C)                                     \
+    (__builtin_constant_p(VECE)                                    \
+     ? (  (VECE) == MO_8  ? 0x01010101ul * (uint8_t)(C)            \
+        : (VECE) == MO_16 ? 0x00010001ul * (uint16_t)(C)           \
+        : (VECE) == MO_32 ? 0x00000001ul * (uint32_t)(C)           \
+        : (qemu_build_not_reached_always(), 0))                    \
+     :  (target_long)dup_const(VECE, C))
+#endif
+
 /*
  * Memory helpers that will be used by TCG generated code.
  */
-- 
2.25.1


