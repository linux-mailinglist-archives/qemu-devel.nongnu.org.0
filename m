Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4A361444484
	for <lists+qemu-devel@lfdr.de>; Wed,  3 Nov 2021 16:17:27 +0100 (CET)
Received: from localhost ([::1]:45162 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1miI10-0000Xl-Dw
	for lists+qemu-devel@lfdr.de; Wed, 03 Nov 2021 11:17:26 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51914)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1miHoz-0003GZ-30
 for qemu-devel@nongnu.org; Wed, 03 Nov 2021 11:05:01 -0400
Received: from mail-wr1-x429.google.com ([2a00:1450:4864:20::429]:46078)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1miHov-0000XZ-Ld
 for qemu-devel@nongnu.org; Wed, 03 Nov 2021 11:04:59 -0400
Received: by mail-wr1-x429.google.com with SMTP id o14so4006715wra.12
 for <qemu-devel@nongnu.org>; Wed, 03 Nov 2021 08:04:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=u7iqy7Uf8mq7g7Jz4N88Qi8VKXab3PvmqBI8z9TAMeA=;
 b=ctEuR1VMd3kGKF+YZfO7SnhfkETlZM3+28iHcsSi/yXT56NRIDNxD4KRDEjkBMEsMo
 S7l9ZIPTXFTD0tfnwdAcOyI+8FuxS+K6oO3zmBo3ehQQP9eKYaYfbjFd16JwIXzgMKlv
 78DyyVliaDtL2v1LeiOrXPSKuF92wh79MZ92Uo4B/gY63Smk3fsrCHpogpBwzqCfZArx
 XE1yQcakx1CCokoA4i4izKfhe7kipCjrbfVepb5sF0svqo+mOLGiaE9dAuXBg7VbjXV9
 2+uBZnjTRt8w3OtBIsQrDMQVzggql6GSVW4PRIN45YRwMpDv3efmE2zCsNnhyXkfqJ0I
 Kbkw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=u7iqy7Uf8mq7g7Jz4N88Qi8VKXab3PvmqBI8z9TAMeA=;
 b=vrW+6aqtXuJT4Nfylqiox4eczaPey7daaZ2trwn32kIsMrz0AzAUzzn41aYgHSD08X
 EGf1QSGspZ4kKNWge6jRtVwWxyO5c8BPOeSxcV1dnFJnF56lQv9A/aATpvqNyrOI7gjl
 rif5bOhMpIQkR61I9/Lsb+Q5scKFeiooRBUtHOVfVRQhcU6T0LaWdjUHEUK6sCc2+vTH
 5/scE+WjUy2ZqpwmIhYEykIlXq/jdPkncyEHCTmTYcv0MMmeHcoyp+8UvZGECyk0pcv0
 pAI5u95rpO12eARM/RMTVFODa2vJAeKweGBqw+0tryNnaagOpti7bqm+9mlna7YtI1Fs
 eigw==
X-Gm-Message-State: AOAM530ZVpWi+NTztYmewdWcGeW0leQs2IHKU/jvFzzq4FD/DY2J94Pp
 3cjbxv1w9v16tN1oqlQN7e7yFrZ2k/M=
X-Google-Smtp-Source: ABdhPJxbvBmUxl3cBdkAysEZBFX3Q7wGZ+tnuJ9aynLV06xCHP0oDf/Q5YoEegf6LCO+e+kD6LI9FA==
X-Received: by 2002:adf:fe8e:: with SMTP id l14mr21288691wrr.177.1635951896432; 
 Wed, 03 Nov 2021 08:04:56 -0700 (PDT)
Received: from avogadro.lan ([2001:b07:6468:f312:c8dd:75d4:99ab:290a])
 by smtp.gmail.com with ESMTPSA id h16sm2488797wrm.27.2021.11.03.08.04.55
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 03 Nov 2021 08:04:55 -0700 (PDT)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 11/27] configure: do not duplicate CPU_CFLAGS into QEMU_LDFLAGS
Date: Wed,  3 Nov 2021 16:04:26 +0100
Message-Id: <20211103150442.387121-12-pbonzini@redhat.com>
X-Mailer: git-send-email 2.33.1
In-Reply-To: <20211103150442.387121-1-pbonzini@redhat.com>
References: <20211103150442.387121-1-pbonzini@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
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
Cc: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Since commit 4dba2789084 ("configure, meson: move CPU_CFLAGS out of
QEMU_CFLAGS"), CPU_CFLAGS is included in the link commands both during
configure and (via config-meson.cross) during meson.  It need not be
added separately to QEMU_LDFLAGS.

Reviewed-by: Philippe Mathieu-Daudé <philmd@redhat.com>
Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 configure | 53 ++++++++++++++---------------------------------------
 1 file changed, 14 insertions(+), 39 deletions(-)

diff --git a/configure b/configure
index b5c36347eb..c0018a304f 100755
--- a/configure
+++ b/configure
@@ -1263,45 +1263,20 @@ firmwarepath="${firmwarepath:-$datadir/qemu-firmware}"
 localedir="${localedir:-$datadir/locale}"
 
 case "$cpu" in
-    ppc)
-           CPU_CFLAGS="-m32"
-           QEMU_LDFLAGS="-m32 $QEMU_LDFLAGS"
-           ;;
-    ppc64)
-           CPU_CFLAGS="-m64"
-           QEMU_LDFLAGS="-m64 $QEMU_LDFLAGS"
-           ;;
-    sparc)
-           CPU_CFLAGS="-m32 -mv8plus -mcpu=ultrasparc"
-           QEMU_LDFLAGS="-m32 -mv8plus $QEMU_LDFLAGS"
-           ;;
-    sparc64)
-           CPU_CFLAGS="-m64 -mcpu=ultrasparc"
-           QEMU_LDFLAGS="-m64 $QEMU_LDFLAGS"
-           ;;
-    s390)
-           CPU_CFLAGS="-m31"
-           QEMU_LDFLAGS="-m31 $QEMU_LDFLAGS"
-           ;;
-    s390x)
-           CPU_CFLAGS="-m64"
-           QEMU_LDFLAGS="-m64 $QEMU_LDFLAGS"
-           ;;
-    i386)
-           CPU_CFLAGS="-m32"
-           QEMU_LDFLAGS="-m32 $QEMU_LDFLAGS"
-           ;;
-    x86_64)
-           # ??? Only extremely old AMD cpus do not have cmpxchg16b.
-           # If we truly care, we should simply detect this case at
-           # runtime and generate the fallback to serial emulation.
-           CPU_CFLAGS="-m64 -mcx16"
-           QEMU_LDFLAGS="-m64 $QEMU_LDFLAGS"
-           ;;
-    x32)
-           CPU_CFLAGS="-mx32"
-           QEMU_LDFLAGS="-mx32 $QEMU_LDFLAGS"
-           ;;
+    ppc) CPU_CFLAGS="-m32" ;;
+    ppc64) CPU_CFLAGS="-m64" ;;
+    sparc) CPU_CFLAGS="-m32 -mv8plus -mcpu=ultrasparc" ;;
+    sparc64) CPU_CFLAGS="-m64 -mcpu=ultrasparc" ;;
+    s390) CPU_CFLAGS="-m31" ;;
+    s390x) CPU_CFLAGS="-m64" ;;
+    i386) CPU_CFLAGS="-m32" ;;
+    x32) CPU_CFLAGS="-mx32" ;;
+
+    # ??? Only extremely old AMD cpus do not have cmpxchg16b.
+    # If we truly care, we should simply detect this case at
+    # runtime and generate the fallback to serial emulation.
+    x86_64) CPU_CFLAGS="-m64 -mcx16" ;;
+
     # No special flags required for other host CPUs
 esac
 
-- 
2.31.1



