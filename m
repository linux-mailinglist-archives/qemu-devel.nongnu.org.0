Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6402066314F
	for <lists+qemu-devel@lfdr.de>; Mon,  9 Jan 2023 21:19:53 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pEyRh-0002wu-TJ; Mon, 09 Jan 2023 15:08:37 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pEyRd-0002u6-Se
 for qemu-devel@nongnu.org; Mon, 09 Jan 2023 15:08:34 -0500
Received: from mail-pl1-x630.google.com ([2607:f8b0:4864:20::630])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pEyRa-0007NI-TI
 for qemu-devel@nongnu.org; Mon, 09 Jan 2023 15:08:33 -0500
Received: by mail-pl1-x630.google.com with SMTP id v23so5855920plo.1
 for <qemu-devel@nongnu.org>; Mon, 09 Jan 2023 12:08:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=r88aN3ONQOrYoR5TjuSp7kfzVMmJ7L52pXjl2Gd7WK4=;
 b=xHQNKg03MFa7/NWec9s6cpOWpWb8d4oaW/AQ94/5VspkPQi+FvlDdp2JKH4vxWProL
 37KHSGfLvgYulVcD+O+krpWWc8W/Din5gyU9IlFuEPV11CjqVOhA8Kbg6ZwjeRDeQByQ
 iJIejEQkeskmJqvT5FaQSocWbejupv8tSInlIm+cnFEmdwAvbc9kUD33mbzQytetTfDs
 bhzDZo0E0KVkJrMtdb7v67ps8WIHxkkc8onBCQh/i00F84FUfy/rYlbo8QCAaVJGXSdD
 7ad9skwLg8Hc16ishWleblDtRIdb8H3EKwcoSl+rLNX2mn6f+eMglfikVV6iPWwIjOXJ
 FRRA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=r88aN3ONQOrYoR5TjuSp7kfzVMmJ7L52pXjl2Gd7WK4=;
 b=RS9tD1URgxoTqDSeh8nXal3+072QlkY/OsYT+MSxW2Z/KL6/0AEWVh8NtZSh91iPp5
 THmlwDzTT267Bt6fGbkRf1kPpWWyo7JsMYn+X1UgHAcDrQRRgsfyXZh79XAa7aBufsrG
 rCsUQeZMSkS0NAhoSi1xGist2povA00DB3NUOo8Ya47tsWiBo8gSTe/wpHiJC8/6U0Ao
 Qq9AMG0Rv6+GMqE9sQUupwQT5IDWJzQkOUNyk27bgSp+heyc8hoK8vBwlZVFW1M3O/l6
 wyk60haq+AkBjyqvBoxfUjwRLQIvbRpDYYyZ6T5eDQsgwQagQGHwolSnbGt1q+Bzh13k
 +baQ==
X-Gm-Message-State: AFqh2krEZOlS1Fl9sf/RjPmM5za6CQgH1EhMexUPIRZLHMYPduKmn0PB
 iB7kcR5eynR5xKocJcvROUOE5AnfU0ck2Nzl
X-Google-Smtp-Source: AMrXdXvhBIltYEmKgEK1hhpIAYOfzEPi1V2pL09tlPHZVCivlXlsuW1AWEmj4XyHVWQ8bRSq9k5D/g==
X-Received: by 2002:a17:90b:2684:b0:227:203d:4d70 with SMTP id
 pl4-20020a17090b268400b00227203d4d70mr3022358pjb.32.1673294908398; 
 Mon, 09 Jan 2023 12:08:28 -0800 (PST)
Received: from stoup.. ([2602:47:d48c:8101:158e:facf:7a46:ba9f])
 by smtp.gmail.com with ESMTPSA id
 l2-20020a17090a384200b0022727d4af8dsm577574pjf.48.2023.01.09.12.08.27
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 09 Jan 2023 12:08:27 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-s390x@nongnu.org,
	Ilya Leoshkevich <iii@linux.ibm.com>
Subject: [PATCH v3 05/27] tests/tcg/s390x: Add bal.S
Date: Mon,  9 Jan 2023 12:07:57 -0800
Message-Id: <20230109200819.3916395-6-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230109200819.3916395-1-richard.henderson@linaro.org>
References: <20230109200819.3916395-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::630;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x630.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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

From: Ilya Leoshkevich <iii@linux.ibm.com>

Add a small test to prevent regressions.

Signed-off-by: Ilya Leoshkevich <iii@linux.ibm.com>
Message-Id: <20221103130011.2670186-1-iii@linux.ibm.com>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 tests/tcg/s390x/Makefile.softmmu-target |  1 +
 tests/tcg/s390x/bal.S                   | 24 ++++++++++++++++++++++++
 2 files changed, 25 insertions(+)
 create mode 100644 tests/tcg/s390x/bal.S

diff --git a/tests/tcg/s390x/Makefile.softmmu-target b/tests/tcg/s390x/Makefile.softmmu-target
index a34fa68473..295df08491 100644
--- a/tests/tcg/s390x/Makefile.softmmu-target
+++ b/tests/tcg/s390x/Makefile.softmmu-target
@@ -7,3 +7,4 @@ QEMU_OPTS=-action panic=exit-failure -kernel
 		-Wl,--build-id=none $< -o $@
 
 TESTS += unaligned-lowcore
+TESTS += bal
diff --git a/tests/tcg/s390x/bal.S b/tests/tcg/s390x/bal.S
new file mode 100644
index 0000000000..e54d8874ff
--- /dev/null
+++ b/tests/tcg/s390x/bal.S
@@ -0,0 +1,24 @@
+    .org 0x200                         /* lowcore padding */
+    .globl _start
+_start:
+    lpswe start24_psw
+_start24:
+    lgrl %r0,initial_r0
+    lgrl %r1,expected_r0
+    bal %r0,0f
+0:
+    cgrjne %r0,%r1,1f
+    lpswe success_psw
+1:
+    lpswe failure_psw
+    .align 8
+start24_psw:
+    .quad 0x160000000000,_start24      /* 24-bit mode, cc = 1, pm = 6 */
+initial_r0:
+    .quad 0x1234567887654321
+expected_r0:
+    .quad 0x1234567896000000 + 0b      /* ilc = 2, cc = 1, pm = 6 */
+success_psw:
+    .quad 0x2000000000000,0xfff        /* see is_special_wait_psw() */
+failure_psw:
+    .quad 0x2000000000000,0            /* disabled wait */
-- 
2.34.1


