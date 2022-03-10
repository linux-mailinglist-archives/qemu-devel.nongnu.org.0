Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 126654D5149
	for <lists+qemu-devel@lfdr.de>; Thu, 10 Mar 2022 19:33:53 +0100 (CET)
Received: from localhost ([::1]:56820 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nSNbk-0007uV-4O
	for lists+qemu-devel@lfdr.de; Thu, 10 Mar 2022 13:33:52 -0500
Received: from eggs.gnu.org ([209.51.188.92]:46604)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1nSNYR-0007qQ-Th; Thu, 10 Mar 2022 13:30:27 -0500
Received: from [2607:f8b0:4864:20::231] (port=46673
 helo=mail-oi1-x231.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1nSNYQ-0006Pp-4b; Thu, 10 Mar 2022 13:30:27 -0500
Received: by mail-oi1-x231.google.com with SMTP id b188so6782931oia.13;
 Thu, 10 Mar 2022 10:30:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=N8vGdVA12v95pIs/OkYXJiyfWLqaWfgn05gmgW7IhmQ=;
 b=HzbNbQIo5V2y//Z5DrCgLQ1x4uTF+y5X+6GdvkRWF9Yrs6ztM7TYxn9OTpnRo4/bj/
 ep3RPLisAQ7arxLnzEe+A+wOP1ajXao+MDikm81fRLIzicE28E+r3jbqOQhbWizRyFpR
 n8fs+Rt07kjYBX0IS8SCN1W7JnyeN8izTVNp3XcZ3H39v+fbAWBrIZIxQfJLmjW61l4W
 oLelSFk1794mnsu/nMmoOgPTd0GXlaOP5ruWFWPM2wFzJGdR/t0jrWsPAoM69/JrtgMT
 pWSWRWArkzToBKAtaKDenoPvzxheuze41V1k7sOi+ugr2Y/vjDN+8Jubg2l4JAYtf8sP
 tY5w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=N8vGdVA12v95pIs/OkYXJiyfWLqaWfgn05gmgW7IhmQ=;
 b=NHAOt5jvw/agM78q5E3IXIbTfcz3Dua3ErDQZ6Gu+OWwAUB9vJ0n7aTPmXkkir2//U
 dJEycjbmHRyYSZ391abIU8JFd8mTTQVv//4hXE1P4or5Ud9KZTqEdeRrJp5T9UE3ZmSq
 dKwYbRuW3Pyr5NDMQ+hMrcaIazm24Ov89C3eb6btR1eRIuw5pxNSKc0mvzB6+4xqxTlk
 zDW5MyLE+murppvhhNISeGIQe6gmdtrPKlS/5Qd6nQh0wDe+oD18HGdnqHNM0j4k0ITb
 YqSv60B7Rvt4eVzbdKroUpQ4wWkCRfmICyWqp1cvWODvRyKDZxOvcBkQ2Kw4z4DjLHTk
 zw4Q==
X-Gm-Message-State: AOAM531BxvKQX5pLfE7Ot5XuIw3jCqkhUsfcz2vq0MWjTIliqLVfiU+i
 QnaJaPI02aVNdHrFoSao3FVXRu85POs=
X-Google-Smtp-Source: ABdhPJziX9Hy0BjTRCdINs27LjLEeT4mFTA59uCgnaCApOhL0JR7WbFzOPsSz+C6v2u2HN3vEx4Jdw==
X-Received: by 2002:a05:6808:2018:b0:2da:20c:4aff with SMTP id
 q24-20020a056808201800b002da020c4affmr10203623oiw.38.1646937024647; 
 Thu, 10 Mar 2022 10:30:24 -0800 (PST)
Received: from rekt.ibmuc.com ([2804:431:c7c6:5655:fd2a:accf:db6c:e4fd])
 by smtp.gmail.com with ESMTPSA id
 a7-20020a4aae47000000b0031d17643eaasm2763175oon.22.2022.03.10.10.30.22
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 10 Mar 2022 10:30:24 -0800 (PST)
From: Daniel Henrique Barboza <danielhb413@gmail.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 1/9] avocado/boot_linux_console.py: check TCG accel in
 test_ppc_g3beige()
Date: Thu, 10 Mar 2022 15:30:03 -0300
Message-Id: <20220310183011.110391-2-danielhb413@gmail.com>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220310183011.110391-1-danielhb413@gmail.com>
References: <20220310183011.110391-1-danielhb413@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::231
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::231;
 envelope-from=danielhb413@gmail.com; helo=mail-oi1-x231.google.com
X-Spam_score_int: -3
X-Spam_score: -0.4
X-Spam_bar: /
X-Spam_report: (-0.4 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 FREEMAIL_ENVFROM_END_DIGIT=0.25, FREEMAIL_FROM=0.001, PDS_HP_HELO_NORDNS=0.659,
 RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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
Cc: farosas@linux.ibm.com, Daniel Henrique Barboza <danielhb413@gmail.com>,
 qemu-ppc@nongnu.org, clg@kaod.org, muriloo@linux.ibm.com,
 david@gibson.dropbear.id.au
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

This test breaks when run in an IBM POWER host with a QEMU compiled
with --disable-tcg and the ppc-softmmu target.

One thing to note is that the error message explictly mentions kvm_pr
support:

Command: ./qemu-system-ppc -display none -vga none (...)
-machine g3beige (...)
        Output: ioctl(KVM_CREATE_VM) failed: 22 Invalid argument
PPC KVM module is not loaded. Try modprobe kvm_pr.
qemu-system-ppc: failed to initialize kvm: Invalid argument

The host was running kvm_hv, not kvm_pr, and the machine failed to load.

Unfortunately we don't have a way to detect whether the KVM module loaded
is kvm_hv or kvm_pr - we do a check for /dev/kvm to detect KVM support but
both modules create this file so that's not helpful.

Let's skip this test for now until we have a way of detecting kvm_pr support in the host.

Reported-by: Murilo Opsfelder Araujo <muriloo@linux.ibm.com>
Signed-off-by: Daniel Henrique Barboza <danielhb413@gmail.com>
---
 tests/avocado/boot_linux_console.py | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/tests/avocado/boot_linux_console.py b/tests/avocado/boot_linux_console.py
index 6d6e748572..2f8d8e2fe6 100644
--- a/tests/avocado/boot_linux_console.py
+++ b/tests/avocado/boot_linux_console.py
@@ -1213,7 +1213,13 @@ def test_ppc_g3beige(self):
         """
         :avocado: tags=arch:ppc
         :avocado: tags=machine:g3beige
+        :avocado: tags=accel:tcg
         """
+        # TODO: g3beige works with kvm_pr but we don't have a
+        # reliable way ATM (e.g. looking at /proc/modules) to detect
+        # whether we're running kvm_hv or kvm_pr. For now let's
+        # disable this test if we don't have TCG support.
+        self.require_accelerator("tcg")
         tar_hash = 'e0b872a5eb8fdc5bed19bd43ffe863900ebcedfc'
         self.vm.add_args('-M', 'graphics=off')
         self.do_test_advcal_2018('15', tar_hash, 'invaders.elf')
-- 
2.35.1


