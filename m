Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3B2B5325039
	for <lists+qemu-devel@lfdr.de>; Thu, 25 Feb 2021 14:15:30 +0100 (CET)
Received: from localhost ([::1]:34402 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lFGUL-00065Z-5F
	for lists+qemu-devel@lfdr.de; Thu, 25 Feb 2021 08:15:29 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:41178)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1lFGSI-0005e6-CK
 for qemu-devel@nongnu.org; Thu, 25 Feb 2021 08:13:22 -0500
Received: from mail-wr1-x429.google.com ([2a00:1450:4864:20::429]:38381)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1lFGSF-0002rR-Mf
 for qemu-devel@nongnu.org; Thu, 25 Feb 2021 08:13:22 -0500
Received: by mail-wr1-x429.google.com with SMTP id b3so5196382wrj.5
 for <qemu-devel@nongnu.org>; Thu, 25 Feb 2021 05:13:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=MbsoLQFwInmdENcxJ16sNNx84VDwnIYnxW5efETgz28=;
 b=lKlBZdUXb5juPFCLORZZJhy0BNvnUvUsHCSIfTWsPD5Wdjoj0s20OqKb/ab2bgMaxr
 2tm8d7qG4j008JbG7da27fwDToay9lxDRY0R+8jqecsV6Rvzu0MxK3DeNxnLkE1KOIpY
 bE8NvFaLKv6kXi8oBoFfuas4T4npZOdBKyInMdgzV+oX6agD03U0HRXj10DtaCYo6Aop
 RHQPb+Sr5+TBAbB1rD7sisO8yXgPCXfj8KewSlcxpNORAsU6G4cMqFbsJTuAZ0XoPMuw
 64PCuYmUXUm4ayHchewBmF/J0MF8EV+ry1RSaFzD/JbwXX1MgZ17ugWudKGGE/Ndrg86
 c+Sw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :mime-version:content-transfer-encoding;
 bh=MbsoLQFwInmdENcxJ16sNNx84VDwnIYnxW5efETgz28=;
 b=T6W2VvEbxxyg9UyNH3g4gTwCbJyNc2/Yjp5n/xrGMVWQQ2qGbv+4mRlp50uCo/5lPo
 G0pbIslzBw7L/vddwSE0IYNTd5hQ82l92ZGntZrdm1nzBhvAOFAywX3jihKslHVxG4ZO
 Kai05RmPkPKl5Nhbme0EL2BpfY45N2yUrekt4eJnFXku0UuEktH/C/DtMxiDt+5x3+rq
 5IgiKHPeG2+PUvchLYbfCBtKwFnqbEQXFsP1GnuC9vG+YqIEWE/UB3bCrrhlIUsS6J9d
 RVoYI5URwNmIsq+4xc+gahsOzJ9QJzFu6zOZS3uPpY7LgUL4ieky3iNlFBf38fX7fQYq
 wN4g==
X-Gm-Message-State: AOAM530NmKS/TNvWPKTQnG4LegWKQZeZcsL9oWE5QUyPTbZ1gSlVFESY
 YzaoEPra/vBu5FRhi3OQ8W4LkyNlmUQ=
X-Google-Smtp-Source: ABdhPJxppvUDtt+DWrqtTK3/DEm/ovW3arZTDj/16com4ERkIe+CWAYmwlD1B3dGLbTrdJhwbMDQfg==
X-Received: by 2002:adf:e548:: with SMTP id z8mr3574518wrm.246.1614258797639; 
 Thu, 25 Feb 2021 05:13:17 -0800 (PST)
Received: from avogadro.lan ([2001:b07:6468:f312:c8dd:75d4:99ab:290a])
 by smtp.gmail.com with ESMTPSA id v9sm8489922wrt.76.2021.02.25.05.13.16
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 25 Feb 2021 05:13:17 -0800 (PST)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v2] vl: deprecate -writeconfig
Date: Thu, 25 Feb 2021 14:13:16 +0100
Message-Id: <20210225131316.631940-1-pbonzini@redhat.com>
X-Mailer: git-send-email 2.29.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::429;
 envelope-from=paolo.bonzini@gmail.com; helo=mail-wr1-x429.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.249,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: berrange@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

The functionality of -writeconfig is limited and the code
does not even try to detect cases where it prints incorrect
syntax (for example if values have a quote in them, since
qemu_config_parse does not support any kind of escaping)
so remove it.

Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
        v1->v2: drop option from manual, mention that there is no replacement
---
 docs/system/deprecated.rst | 7 +++++++
 qemu-options.hx            | 7 +------
 softmmu/vl.c               | 1 +
 3 files changed, 9 insertions(+), 6 deletions(-)

diff --git a/docs/system/deprecated.rst b/docs/system/deprecated.rst
index 2fcac7861e..561c916da2 100644
--- a/docs/system/deprecated.rst
+++ b/docs/system/deprecated.rst
@@ -146,6 +146,13 @@ library enabled as a cryptography provider.
 Neither the ``nettle`` library, or the built-in cryptography provider are
 supported on FIPS enabled hosts.
 
+``-writeconfig`` (since 6.0)
+'''''''''''''''''''''''''''''
+
+The ``-writeconfig`` option is not able to serialize the entire contents
+of the QEMU command line.  It is thus considered a failed experiment
+and deprecated, with no current replacement.
+
 QEMU Machine Protocol (QMP) commands
 ------------------------------------
 
diff --git a/qemu-options.hx b/qemu-options.hx
index 34be5a7a2d..252db9357c 100644
--- a/qemu-options.hx
+++ b/qemu-options.hx
@@ -4335,13 +4335,8 @@ SRST
 ERST
 DEF("writeconfig", HAS_ARG, QEMU_OPTION_writeconfig,
     "-writeconfig <file>\n"
-    "                read/write config file\n", QEMU_ARCH_ALL)
+    "                read/write config file (deprecated)\n", QEMU_ARCH_ALL)
 SRST
-``-writeconfig file``
-    Write device configuration to file. The file can be either filename
-    to save command line and device configuration into file or dash
-    ``-``) character to print the output to stdout. This can be later
-    used as input file for ``-readconfig`` option.
 ERST
 
 DEF("no-user-config", 0, QEMU_OPTION_nouserconfig,
diff --git a/softmmu/vl.c b/softmmu/vl.c
index b219ce1f35..6d8393b6f7 100644
--- a/softmmu/vl.c
+++ b/softmmu/vl.c
@@ -3356,6 +3356,7 @@ void qemu_init(int argc, char **argv, char **envp)
             case QEMU_OPTION_writeconfig:
                 {
                     FILE *fp;
+                    warn_report("-writeconfig is deprecated.  It will go away in QEMU 6.2 with no replacement");
                     if (strcmp(optarg, "-") == 0) {
                         fp = stdout;
                     } else {
-- 
2.29.2


