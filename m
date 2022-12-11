Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 294476494D3
	for <lists+qemu-devel@lfdr.de>; Sun, 11 Dec 2022 16:29:43 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p4OFh-0006FN-3t; Sun, 11 Dec 2022 10:28:29 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1p4OFS-00067f-6o
 for qemu-devel@nongnu.org; Sun, 11 Dec 2022 10:28:14 -0500
Received: from mail-oi1-x22f.google.com ([2607:f8b0:4864:20::22f])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1p4OFP-0007Sy-N5
 for qemu-devel@nongnu.org; Sun, 11 Dec 2022 10:28:13 -0500
Received: by mail-oi1-x22f.google.com with SMTP id e205so9048135oif.11
 for <qemu-devel@nongnu.org>; Sun, 11 Dec 2022 07:28:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=r88aN3ONQOrYoR5TjuSp7kfzVMmJ7L52pXjl2Gd7WK4=;
 b=uK/dKTWOHnTcP03XcZTPj69DyaOBaJbRklf7sJKLe2TLOnHOA3s9xA64k5ECI7WFbq
 4o66oRFt/VDHJSzo6aeqqytrPd1f31QcLXkkVjOsIntmVApa57j2Nvuyd9WJZ/d28nIM
 290HU7LqhlwWD/4OdhghNsxt7GNgtmqJ/39PG1XSPY3iYUq8GG9Au5GNuJIqiIZcpuys
 Z8Q0znyn1MnGcsa2YyA/i534jJCeppIRT5ZukfLC+knbW86f7F40YwQAvYvZtEMeksZo
 Wag+1LMORqn+b2NSOaMrVdKPlKiQh4EeBtoaHkOaJwQeJyOmev9J/APGPl5qOscul8Es
 3jtA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=r88aN3ONQOrYoR5TjuSp7kfzVMmJ7L52pXjl2Gd7WK4=;
 b=obmcXVXjYTQf9Nzn3lMMHbAN/Q9wVXG9C5rXrUhrAfgJ/J1zrNKiH08Bv5WxKfQhs0
 avg4a3OCCi2f8ViJs3QeqjdE8uDQhLR42vTUVDOXikcOWsX2NP+Dn3FoiBtPnBrHXKld
 m7ndabo1ehGwsz2R1GVw9b3jtqBEM9jLxS+8Q03x8fZtSWpfaNPZ6abgxbc6/0ETQ/HB
 maCPHxlSGJ53k62aW72k+UAuDqoQUA14CAQGQRtkVdFUAtv7oQckVI3jZVZ5Pzce30gd
 jKMFn1XC15AVHc0uFgdAkav++VrsBk9CXlalbQofgLCcvxStpMV5JNywsOBKyXegNvFo
 KLeA==
X-Gm-Message-State: ANoB5pn1AFUhjeDJ1WcYIaN7j8aA1hRn5J/wShj3/2JFje8pufVJaE4b
 zBly0l5slF09SvPs68v8lBnmUDpMxz1obxX2ZUU=
X-Google-Smtp-Source: AA0mqf4fteRsqijt6v6bKnhQzvEJIC42DdnsR9MeIqP1xi2g+cAwjHEW3+akBbCeBeP87gzayv8qcA==
X-Received: by 2002:a05:6808:210d:b0:359:e30c:d86a with SMTP id
 r13-20020a056808210d00b00359e30cd86amr8783183oiw.8.1670772490528; 
 Sun, 11 Dec 2022 07:28:10 -0800 (PST)
Received: from stoup.. ([2806:102e:18:2efc:7b4f:f28b:eca6:b583])
 by smtp.gmail.com with ESMTPSA id
 q24-20020a056830233800b006708d2cd8bcsm938140otg.65.2022.12.11.07.28.09
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 11 Dec 2022 07:28:10 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-s390x@nongnu.org,
	Ilya Leoshkevich <iii@linux.ibm.com>
Subject: [PATCH v2 05/27] tests/tcg/s390x: Add bal.S
Date: Sun, 11 Dec 2022 09:27:40 -0600
Message-Id: <20221211152802.923900-6-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20221211152802.923900-1-richard.henderson@linaro.org>
References: <20221211152802.923900-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::22f;
 envelope-from=richard.henderson@linaro.org; helo=mail-oi1-x22f.google.com
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


