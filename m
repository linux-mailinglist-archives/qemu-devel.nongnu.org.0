Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B7981325F60
	for <lists+qemu-devel@lfdr.de>; Fri, 26 Feb 2021 09:47:39 +0100 (CET)
Received: from localhost ([::1]:50474 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lFYmg-00026S-O4
	for lists+qemu-devel@lfdr.de; Fri, 26 Feb 2021 03:47:38 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:41946)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1lFY8D-0001vk-1A
 for qemu-devel@nongnu.org; Fri, 26 Feb 2021 03:05:49 -0500
Received: from mail-wr1-x429.google.com ([2a00:1450:4864:20::429]:37622)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1lFY8B-0004D7-6m
 for qemu-devel@nongnu.org; Fri, 26 Feb 2021 03:05:48 -0500
Received: by mail-wr1-x429.google.com with SMTP id v15so7679204wrx.4
 for <qemu-devel@nongnu.org>; Fri, 26 Feb 2021 00:05:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=AAtYqOemksZdw5g1rYUo9+pu9VW+WxY7JUlFmC94moo=;
 b=bkf9dZiwsls4VYuiVjip7YfhL8TV8JmZcZmhwiX/fbspjaoVQx+G9ooTF7zpgf+WvK
 QLJOZPDpk0EoDUr8PFHvuXhcePJevp4skPD6rpp7269xCT1LSyGVwipYjNrQEADou15F
 83nsyJLyrOxafKBCIIdMF/DqwUgccbTZ5QZ/GZS77bdi7QBSyhTxgq8ZF8mHpB8hZBY7
 V2yT5khUPZAP+DwQNK6Z9BxgOGQVJSrwWhRjUDeWUN6xNFetHjNHBlsKzW14lMlLhWu9
 k7qB2CjJ+g6EmM5kyGlpaa2hl4HqM0THDOc3gycShVQpoR5wwZEUZ2bLMtgSLjgf4855
 lHLQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=AAtYqOemksZdw5g1rYUo9+pu9VW+WxY7JUlFmC94moo=;
 b=Ciz2OFzUPjd1Avcjd1WI+JLmIYhOceae3oRg4qbA7zqePFvVLYbhzhmKMN3oWb32VE
 xa9qCahHWFU9fgJCU0TE5QFwOUHzaplMWhmphCta6ZYx+7cJofcivHrDRjlDVZ+fRasY
 0ELsZa8vUrNpgvePVH2eynKpz7ZtH5I9qfvAyjFlUPj2Q79B9FQYs0dkjmsixxgE+a54
 FaDT9W/5RURFmlFURsOyeYxlcYBqjd7btdrg3CKR4P/JSVKKWVzYfJoTS0zxvt4pQmH7
 z6eAobrwHQIRg48ZPpAHC2ZgfZfpXPJKvQ9ti9coSXxUBvxkxmDlaQL9pBn9VLjA6Md6
 O6GQ==
X-Gm-Message-State: AOAM531DUncfwjIOQCC6DaJkDAYu8RPvj3xRBq/1OCIs+vSiAVJeM+1L
 PAHptWg5YQ7SFVh2qSzVS45eJ40cWTg=
X-Google-Smtp-Source: ABdhPJz69KW8Du/Kh4zrcn3oGpUseErXg05YR4NnGQraPq8XtHyL+9TDpGOyx0hdFTlGiNToTR4RDA==
X-Received: by 2002:adf:b641:: with SMTP id i1mr1825442wre.295.1614326745285; 
 Fri, 26 Feb 2021 00:05:45 -0800 (PST)
Received: from avogadro.lan ([2001:b07:6468:f312:c8dd:75d4:99ab:290a])
 by smtp.gmail.com with ESMTPSA id n66sm10700830wmn.25.2021.02.26.00.05.44
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 26 Feb 2021 00:05:44 -0800 (PST)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 27/29] vl: deprecate -writeconfig
Date: Fri, 26 Feb 2021 09:05:24 +0100
Message-Id: <20210226080526.651705-28-pbonzini@redhat.com>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20210226080526.651705-1-pbonzini@redhat.com>
References: <20210226080526.651705-1-pbonzini@redhat.com>
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



