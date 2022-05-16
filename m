Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id EB687528BA4
	for <lists+qemu-devel@lfdr.de>; Mon, 16 May 2022 19:12:37 +0200 (CEST)
Received: from localhost ([::1]:55640 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nqeGr-0000Qv-2o
	for lists+qemu-devel@lfdr.de; Mon, 16 May 2022 13:12:37 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:55494)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1nqdyc-00072m-FF; Mon, 16 May 2022 12:53:57 -0400
Received: from mail-oa1-x33.google.com ([2001:4860:4864:20::33]:41483)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1nqdya-0004jm-UA; Mon, 16 May 2022 12:53:46 -0400
Received: by mail-oa1-x33.google.com with SMTP id
 586e51a60fabf-edf9ddb312so20903849fac.8; 
 Mon, 16 May 2022 09:53:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=zjPwgG7Uozx59CsKqY2HRFz6jk2tqMNNSJVd3GOd5Ak=;
 b=lrO2w5bry3y/TWETNAWQwstF8WdvUFkepz7ny/NBsuA59nqFUKogU+5CB+uiaSi5FE
 Q4RokVh5z98YM+Jc97cGEtM0sBUD6Mz3AkacvyKy8NsFXhe3vzFpX+IayijhZuYqfhcb
 weVc8xO7gOCQQEwcYARDqoNllFkRTyoAwkO0jZqwB34LyzvIkL8snPLHKBkxlRe0iba1
 DHtc/3A7fzWcNHfP/kLPgLp7txcKiRwJvMDxwiAMO3VonIfFWF5XUfcLqsJEqvR6fwvN
 jDFT1CZHaHMtkMP44IgZAPCDzIEFmHRldq4kQAXiRzxeQpkMxCNsf6G3R3yL+KWkzTwB
 EEOw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=zjPwgG7Uozx59CsKqY2HRFz6jk2tqMNNSJVd3GOd5Ak=;
 b=G/obPqvkd8iFrlTt2xEpHPlwDMwN4dPnz5hjcIeAruJ8CmMn4lUj9zFmuIm2IC7pvq
 dit4OW09YBIsAkfbY3SC57jboOE46on3cuABRCEnENj8ld2VwsZYMbTyTuay6ZaM9dvW
 ASKjkRGk/X9rSDmLM6xYBTLe79qZQeI4H+JFE9eN9j3VVwMwEJOlnjf/A+11n19SYAzV
 EsJi9r9EJFGghC/WSz/KRwNEdX+SG2/EpPDBZr19+YnpF6M014JbGHGB0ids2v8fRABM
 Yya2f2EPvOfeDduEcxALDRJAYr6CpJCPiZ7b5yITvRTjRwl3t0IGeeO+ZDjIbS58miUR
 0PTQ==
X-Gm-Message-State: AOAM530wdRji9CXWmmM1ATrQW/H3KStLWJEHg0XIfs5RySspKlad91tt
 QwuFa9mlV6TgrqJdSLAR85Z6WZLX1uE=
X-Google-Smtp-Source: ABdhPJwtdax3X3qht4egNMWMCPHcDajGXx5stHzjXe0m4gyfyyTi5hgM9ys645Hn4e+AAS5Sws8rRg==
X-Received: by 2002:a05:6871:8a5:b0:f1:8d80:b5d4 with SMTP id
 r37-20020a05687108a500b000f18d80b5d4mr5098464oaq.133.1652720021397; 
 Mon, 16 May 2022 09:53:41 -0700 (PDT)
Received: from balboa.ibmuc.com ([191.193.151.26])
 by smtp.gmail.com with ESMTPSA id
 z14-20020a056870e30e00b000e686d13889sm5780731oad.35.2022.05.16.09.53.38
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 16 May 2022 09:53:41 -0700 (PDT)
From: Daniel Henrique Barboza <danielhb413@gmail.com>
To: qemu-devel@nongnu.org
Cc: qemu-ppc@nongnu.org, david@gibson.dropbear.id.au, clg@kaod.org,
 jsnow@redhat.com, crosa@redhat.com, f4bug@amsat.org, wainersm@redhat.com,
 bleal@redhat.com, Daniel Henrique Barboza <danielhb413@gmail.com>
Subject: [PATCH 4/5] avocado/boot_linux.py: avocado tag fixes in
 BootLinuxAarch64
Date: Mon, 16 May 2022 13:53:20 -0300
Message-Id: <20220516165321.872394-5-danielhb413@gmail.com>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20220516165321.872394-1-danielhb413@gmail.com>
References: <20220516165321.872394-1-danielhb413@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2001:4860:4864:20::33;
 envelope-from=danielhb413@gmail.com; helo=mail-oa1-x33.google.com
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

BootLinuxAarch64 is already setting machine:virt in the avocado tags,
meaning that we don't need to add '-machine virt' via add_args().

It's also adding an extra '-machine gic-version=2' parameter via an
avocado tag, which is not ideal because:

- it prevents self.machine from QEMUSystemTest to be set since there are
multiple 'machine' avocado tests being set;

- the tests are using different 'gic-version' setting, meaning that
we're still needing to add '-machine gic-version=N' via add_args()
regardless.

Removing the 'machine=gic-version=2' tag allows us to set 'self.machine'
without adding extra work.

Signed-off-by: Daniel Henrique Barboza <danielhb413@gmail.com>
---
 tests/avocado/boot_linux.py | 7 +++----
 1 file changed, 3 insertions(+), 4 deletions(-)

diff --git a/tests/avocado/boot_linux.py b/tests/avocado/boot_linux.py
index ee584d2fdf..1fbedbab5c 100644
--- a/tests/avocado/boot_linux.py
+++ b/tests/avocado/boot_linux.py
@@ -61,7 +61,6 @@ class BootLinuxAarch64(LinuxTest):
     """
     :avocado: tags=arch:aarch64
     :avocado: tags=machine:virt
-    :avocado: tags=machine:gic-version=2
     """
 
     def add_common_args(self):
@@ -80,7 +79,7 @@ def test_virt_tcg_gicv2(self):
         self.require_accelerator("tcg")
         self.vm.add_args("-accel", "tcg")
         self.vm.add_args("-cpu", "max,lpa2=off")
-        self.vm.add_args("-machine", "virt,gic-version=2")
+        self.vm.add_args("-machine", "gic-version=2")
         self.add_common_args()
         self.launch_and_wait(set_up_ssh_connection=False)
 
@@ -93,7 +92,7 @@ def test_virt_tcg_gicv3(self):
         self.require_accelerator("tcg")
         self.vm.add_args("-accel", "tcg")
         self.vm.add_args("-cpu", "max,lpa2=off")
-        self.vm.add_args("-machine", "virt,gic-version=3")
+        self.vm.add_args("-machine", "gic-version=3")
         self.add_common_args()
         self.launch_and_wait(set_up_ssh_connection=False)
 
@@ -104,7 +103,7 @@ def test_virt_kvm(self):
         """
         self.require_accelerator("kvm")
         self.vm.add_args("-accel", "kvm")
-        self.vm.add_args("-machine", "virt,gic-version=host")
+        self.vm.add_args("-machine", "gic-version=host")
         self.add_common_args()
         self.launch_and_wait(set_up_ssh_connection=False)
 
-- 
2.32.0


