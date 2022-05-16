Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id ADD8A528C07
	for <lists+qemu-devel@lfdr.de>; Mon, 16 May 2022 19:33:38 +0200 (CEST)
Received: from localhost ([::1]:52928 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nqebB-0003w9-RA
	for lists+qemu-devel@lfdr.de; Mon, 16 May 2022 13:33:37 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:55490)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1nqdyc-00072l-3w; Mon, 16 May 2022 12:53:56 -0400
Received: from mail-ot1-x330.google.com ([2607:f8b0:4864:20::330]:39544)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1nqdyY-0004jb-61; Mon, 16 May 2022 12:53:45 -0400
Received: by mail-ot1-x330.google.com with SMTP id
 z15-20020a9d65cf000000b00605f064482cso10445103oth.6; 
 Mon, 16 May 2022 09:53:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=zCe6NHhLiF0+F7HHkirak470jel11NIdMJKVIPkP5tM=;
 b=fRp3hVhXAdD2+3GThTmIf00nu0r8rK/bXiJrHlcTCQu5oL8NAPK2VID+TKvqsUOVz8
 jEKoUMipeQ44ldMHyP6xGSdcjmOxCu7HXw8rY3Lm3PBKKQxxrpoXusm+2l8rrm+uVBUs
 Jm29eapt/paHfiDatbh046YMfPIIHXmuskrvZ82GJ8BXigCtepR3uja3mddIUI2P3gD/
 cXhkkW8pcLdNF/dbcsMhEN6qGTHN+u5+YN9Zca3/suIo8i/BtI1732KGSajxowAuVdxi
 U7V8gX/rr55QjT/AVtayn7bkuE8opFthvokq95e3Kkfr/B85R7479sqduw+1DaMG6rCl
 7xdw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=zCe6NHhLiF0+F7HHkirak470jel11NIdMJKVIPkP5tM=;
 b=y8SbTgmmGskjMWX8mN5ouZTgEqiZrAp2jQY/Tq3IdTvlZJBAkBEBrAvkvX57NTUTMt
 PNdVemGngToQLE0XYAvORELnGqCV6dYNw5KgKBFXUf78UK/hGWehIjqGbsrCGXcAt6jO
 DICjEvFYoRfPzBt7yPrMEosFu/XfgSc6+bMYLlJuC7Z30+FVA+DJ+ylx563M5Gz+a7va
 kOx0GWzlqLxNjE42BDX0d4zE38Xy4Ato62a7XCSBTnxxMYVz3L7UOUkl7m2hpklL3f2k
 SGbeQRtVJeGK3LhVxiSkI2ksoPHXxPFrGKI5sUyPWk+7nMqIk/tKttGu6vlf4/Igae7S
 3eXQ==
X-Gm-Message-State: AOAM5304I7JzNSBywTqetgDr0eawz8ULte42Y0X6IfJ2h63+pFC1B95h
 5hm3MttotzAxvRxVjWw7T7/MZGwZ5aM=
X-Google-Smtp-Source: ABdhPJyS9BaKiNh58fFTjBd0avbW/SkgAiq+vGGsEzGznN3j73i12MnuSEnZ9ML3ZbUPbMMNYAUxIQ==
X-Received: by 2002:a9d:1b09:0:b0:606:e384:138e with SMTP id
 l9-20020a9d1b09000000b00606e384138emr6119432otl.141.1652720018236; 
 Mon, 16 May 2022 09:53:38 -0700 (PDT)
Received: from balboa.ibmuc.com ([191.193.151.26])
 by smtp.gmail.com with ESMTPSA id
 z14-20020a056870e30e00b000e686d13889sm5780731oad.35.2022.05.16.09.53.35
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 16 May 2022 09:53:38 -0700 (PDT)
From: Daniel Henrique Barboza <danielhb413@gmail.com>
To: qemu-devel@nongnu.org
Cc: qemu-ppc@nongnu.org, david@gibson.dropbear.id.au, clg@kaod.org,
 jsnow@redhat.com, crosa@redhat.com, f4bug@amsat.org, wainersm@redhat.com,
 bleal@redhat.com, Daniel Henrique Barboza <danielhb413@gmail.com>
Subject: [PATCH 3/5] avocado/multiprocess.py: use tags=machine:pc|virt
Date: Mon, 16 May 2022 13:53:19 -0300
Message-Id: <20220516165321.872394-4-danielhb413@gmail.com>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20220516165321.872394-1-danielhb413@gmail.com>
References: <20220516165321.872394-1-danielhb413@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::330;
 envelope-from=danielhb413@gmail.com; helo=mail-ot1-x330.google.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 FREEMAIL_ENVFROM_END_DIGIT=0.25, FREEMAIL_FROM=0.001,
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

Assigning the machine type via the avocado tag will set self.machine
from QEMUSystemTest and avoid the need to set the machine type by using
self.vm.add_args().

do_test() was changed to receive a 'machine_opts' that will allow the
aarch64 test to pass the additional '-machine gic-version=3' parameter
it requires.

Signed-off-by: Daniel Henrique Barboza <danielhb413@gmail.com>
---
 tests/avocado/multiprocess.py | 14 ++++++++------
 1 file changed, 8 insertions(+), 6 deletions(-)

diff --git a/tests/avocado/multiprocess.py b/tests/avocado/multiprocess.py
index 80a3b8f442..9a7cc6becb 100644
--- a/tests/avocado/multiprocess.py
+++ b/tests/avocado/multiprocess.py
@@ -19,7 +19,7 @@ class Multiprocess(QemuSystemTest):
     KERNEL_COMMON_COMMAND_LINE = 'printk.time=0 '
 
     def do_test(self, kernel_url, initrd_url, kernel_command_line,
-                machine_type):
+                machine_opts=None):
         """Main test method"""
         self.require_accelerator('kvm')
 
@@ -43,7 +43,8 @@ def do_test(self, kernel_url, initrd_url, kernel_command_line,
 
         # Create proxy process
         self.vm.set_console()
-        self.vm.add_args('-machine', machine_type)
+        if machine_opts:
+            self.vm.add_args('-machine', machine_opts)
         self.vm.add_args('-accel', 'kvm')
         self.vm.add_args('-cpu', 'host')
         self.vm.add_args('-object',
@@ -67,6 +68,7 @@ def do_test(self, kernel_url, initrd_url, kernel_command_line,
     def test_multiprocess_x86_64(self):
         """
         :avocado: tags=arch:x86_64
+        :avocado: tags=machine:pc
         """
         kernel_url = ('https://archives.fedoraproject.org/pub/archive/fedora'
                       '/linux/releases/31/Everything/x86_64/os/images'
@@ -76,12 +78,12 @@ def test_multiprocess_x86_64(self):
                       '/pxeboot/initrd.img')
         kernel_command_line = (self.KERNEL_COMMON_COMMAND_LINE +
                                'console=ttyS0 rdinit=/bin/bash')
-        machine_type = 'pc'
-        self.do_test(kernel_url, initrd_url, kernel_command_line, machine_type)
+        self.do_test(kernel_url, initrd_url, kernel_command_line)
 
     def test_multiprocess_aarch64(self):
         """
         :avocado: tags=arch:aarch64
+        :avocado: tags=machine:virt
         """
         kernel_url = ('https://archives.fedoraproject.org/pub/archive/fedora'
                       '/linux/releases/31/Everything/aarch64/os/images'
@@ -91,5 +93,5 @@ def test_multiprocess_aarch64(self):
                       '/pxeboot/initrd.img')
         kernel_command_line = (self.KERNEL_COMMON_COMMAND_LINE +
                                'rdinit=/bin/bash console=ttyAMA0')
-        machine_type = 'virt,gic-version=3'
-        self.do_test(kernel_url, initrd_url, kernel_command_line, machine_type)
+        machine_opts = 'gic-version=3'
+        self.do_test(kernel_url, initrd_url, kernel_command_line, machine_opts)
-- 
2.32.0


