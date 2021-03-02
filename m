Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6989432A987
	for <lists+qemu-devel@lfdr.de>; Tue,  2 Mar 2021 19:36:06 +0100 (CET)
Received: from localhost ([::1]:40990 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lH9sL-0006k2-Ck
	for lists+qemu-devel@lfdr.de; Tue, 02 Mar 2021 13:36:05 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:60026)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1lH9Js-0006VC-Pv
 for qemu-devel@nongnu.org; Tue, 02 Mar 2021 13:00:28 -0500
Received: from mail-ed1-x52e.google.com ([2a00:1450:4864:20::52e]:35354)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1lH9Jq-0007vy-VO
 for qemu-devel@nongnu.org; Tue, 02 Mar 2021 13:00:28 -0500
Received: by mail-ed1-x52e.google.com with SMTP id p1so21907562edy.2
 for <qemu-devel@nongnu.org>; Tue, 02 Mar 2021 10:00:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=RS4z4CliqNFXcrkm+yUYwPeRoFg4GG6y/KETvIYpm3E=;
 b=HBTlPowyWAjUakVgvp+ROTdM7lm2h+WdSADyscyZfXFMXskW8i50Xinh06ahKyXk68
 lRIRJ6glbprwqIU3SZ/a1yiFNTEF1vOatgUh+3/NX8LmO6ufYSKsKpJVQBJy0chWbk1X
 wUVtKhIstAJZZQNWMHwS3ipBlNZNAjXYVwxJQfsgpetXtbqAic6w1Ssld9PZFYOaFCBb
 oZ4JTXd1fi5JPjWNBnGs6hyNEwoTrAnMPcustWQxa/U7bl1aCzvGoLCVY6yXpYKuiarW
 gzUjMpK7/w2fSNA2RxTR/RmEow2MxiVz+UoN7Vb74PnhM7hiaNz+lUAUzTErR29wcptj
 /yRw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :mime-version:content-transfer-encoding;
 bh=RS4z4CliqNFXcrkm+yUYwPeRoFg4GG6y/KETvIYpm3E=;
 b=fYgeM1egIRrPQp5iNG6OIpYMTFwO+zi5GVckjrLIv8n4VXetM7Q1vngIYw8p8Yrf77
 Wo19pDoAa94ehJ4T8zQnWo58LIFYoUanI4UrV4HmD9Ykp6ABV/wMh72eMHMxQGygktLp
 iJYyTmLo2DmFab+hD9DKUe9MZQWCOG/m6fAIzN/SiF9tWQOoVN9097eOP8POs5W5z9ea
 R/HPhc9ecZvSvJvYaa0OmDB1I79sH+RSl0xMDInrX2BYYuQS8YXzZFBq5+WnRwMM/gyc
 2NHWAuZD8lWxSiHltppT7Kz2lA4bFUKW+uTBnk2HznqCOWcGzh5y/Yw0R6sUAYK4Kq+Q
 KUAw==
X-Gm-Message-State: AOAM532bkCsOC0kOW+V/PgFUBpER6BW0qm5ZmNLeniA4xtio2uvLvnHI
 WEJY16segbGd0ImH9SE3EWUXy/xBZ6A=
X-Google-Smtp-Source: ABdhPJyDs90P/bFQTdphVOLp3dMduSYx938ea/lA/GWI+MziU8n1rEDd3Vb8vI8wdEcOK8gUNAKLYA==
X-Received: by 2002:a50:bf42:: with SMTP id g2mr21698394edk.101.1614708024742; 
 Tue, 02 Mar 2021 10:00:24 -0800 (PST)
Received: from avogadro.redhat.com ([2001:b07:6468:f312:c8dd:75d4:99ab:290a])
 by smtp.gmail.com with ESMTPSA id
 q20sm9060267ejs.41.2021.03.02.10.00.23
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 02 Mar 2021 10:00:24 -0800 (PST)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v3] vl: deprecate -writeconfig
Date: Tue,  2 Mar 2021 19:00:23 +0100
Message-Id: <20210302180023.54555-1-pbonzini@redhat.com>
X-Mailer: git-send-email 2.29.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::52e;
 envelope-from=paolo.bonzini@gmail.com; helo=mail-ed1-x52e.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.25,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.25,
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
Cc: armbru@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

The functionality of -writeconfig is limited and the code
does not even try to detect cases where it prints incorrect
syntax (for example if values have a quote in them, since
qemu_config_parse does not support any kind of escaping)
so remove it.

Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
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
index b219ce1f35..10bd8a10a3 100644
--- a/softmmu/vl.c
+++ b/softmmu/vl.c
@@ -3356,6 +3356,7 @@ void qemu_init(int argc, char **argv, char **envp)
             case QEMU_OPTION_writeconfig:
                 {
                     FILE *fp;
+                    warn_report("-writeconfig is deprecated and will go away without a replacement");
                     if (strcmp(optarg, "-") == 0) {
                         fp = stdout;
                     } else {
-- 
2.29.2


