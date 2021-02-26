Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B5F77325EA4
	for <lists+qemu-devel@lfdr.de>; Fri, 26 Feb 2021 09:09:35 +0100 (CET)
Received: from localhost ([::1]:33236 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lFYBq-0003ht-5N
	for lists+qemu-devel@lfdr.de; Fri, 26 Feb 2021 03:09:34 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:41592)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1lFY7y-0001j3-AO
 for qemu-devel@nongnu.org; Fri, 26 Feb 2021 03:05:35 -0500
Received: from mail-wr1-x42d.google.com ([2a00:1450:4864:20::42d]:41618)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1lFY7v-00042l-6w
 for qemu-devel@nongnu.org; Fri, 26 Feb 2021 03:05:34 -0500
Received: by mail-wr1-x42d.google.com with SMTP id f12so3867921wrx.8
 for <qemu-devel@nongnu.org>; Fri, 26 Feb 2021 00:05:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=LM0ymEIO4brC99ZcR5LN3FimbR1Szcx2N+OesKrDNJk=;
 b=p84LHiWxmsg3tT8wdnrBhXCWjyZbF94l8havhoWrrj7I2ECMMopsm8WOvViTt4h+u8
 10EdQE4LihnNLryQ8ikyvX6vhKHQgQiFTL3bgLqSmRupktFePu5bdGEE/VNJyqK4Ba6O
 2mb2G3gBJntfWuhMbtE7K9yMQAHH4bql3BKAovLNWiynxWQcaeUEEe4WU+lmYYEuClJu
 3t8ryZQggwUAdgwo+ExN8TUrhZhEm0186H/jc06+lAkAJlIR6EaObrEScw5q2ns3kjvg
 GToArweie4UzT9bbA9lQMqnLaZPpI/8Wa072cIALEPD3QUyWwyclnMO/6GjElUDugJsk
 KNvg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=LM0ymEIO4brC99ZcR5LN3FimbR1Szcx2N+OesKrDNJk=;
 b=WCuvwX4c7PweByjH1SHMCzPdZ4okHrfcS3BWTvvQIOLn8Un3y/+rJcXnGqKZhZZtEO
 tB6+i7Zzwkg3quKnZJ5Rwgj97KCZ0SwuPOonPLaCECU2NSjUcFlGoNozSuaeEE04AwVF
 2YSDJE8zO0wib8JTJx8+xK9Qvt3hiJg8Gyo7DGqgGKMCFG66vn7pXRcz4/FNPYS/x8Sh
 fTsWUCvUxVB/90zFF1Zx7qpIieEp3i5lukpoh6NV/jAmye/D3Mi7NW8DuuYF/p6MY/1n
 UNxRfCY3AncVO9/PFxU4r00Vr0QRgDeBzbA6kIYHd1mqlsBzAfnArixJtyU8qPe8iBKv
 gX3A==
X-Gm-Message-State: AOAM533A6/0xVcrF3hmHgPHnzCvggMt4qh7Kmv+Q2+Ss7jI2zm91LN/m
 bQRi+alIXAW7zzbVUVc5khe1sJczoi0=
X-Google-Smtp-Source: ABdhPJygRcpCTXHRBFDR48RfCfPs2rW2nbOxvGSgArtsuJ7b0SViHe2UCETTRcA3HutMCcNAjzNKJQ==
X-Received: by 2002:adf:fbce:: with SMTP id d14mr1779207wrs.44.1614326728538; 
 Fri, 26 Feb 2021 00:05:28 -0800 (PST)
Received: from avogadro.lan ([2001:b07:6468:f312:c8dd:75d4:99ab:290a])
 by smtp.gmail.com with ESMTPSA id n66sm10700830wmn.25.2021.02.26.00.05.27
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 26 Feb 2021 00:05:28 -0800 (PST)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 01/29] hvf: Sign the code after installation
Date: Fri, 26 Feb 2021 09:04:58 +0100
Message-Id: <20210226080526.651705-2-pbonzini@redhat.com>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20210226080526.651705-1-pbonzini@redhat.com>
References: <20210226080526.651705-1-pbonzini@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42d;
 envelope-from=paolo.bonzini@gmail.com; helo=mail-wr1-x42d.google.com
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
Cc: Akihiko Odaki <akihiko.odaki@gmail.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Akihiko Odaki <akihiko.odaki@gmail.com>

Before this change, the code signed during the build was installed
directly.

However, the signature gets invalidated because meson modifies the code
to fix dynamic library install names during the install process.

It also prevents meson to strip the code because the pre-signed file is
not marked as an executable (although it is somehow able to perform the
modification described above).

With this change, the unsigned code will be installed and modified by
meson first, and a script signs it later.

Signed-off-by: Akihiko Odaki <akihiko.odaki@gmail.com>
Message-Id: <20210225000614.46919-1-akihiko.odaki@gmail.com>
Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 meson.build            |  9 ++++++---
 scripts/entitlement.sh | 19 +++++++++++++++----
 2 files changed, 21 insertions(+), 7 deletions(-)

diff --git a/meson.build b/meson.build
index 05a67c20d9..c79cb20993 100644
--- a/meson.build
+++ b/meson.build
@@ -2224,7 +2224,7 @@ foreach target : target_dirs
     endif
 
     emulator = executable(exe_name, exe['sources'],
-               install: not exe_sign,
+               install: true,
                c_args: c_args,
                dependencies: arch_deps + deps + exe['dependencies'],
                objects: lib.extract_all_objects(recursive: true),
@@ -2235,8 +2235,6 @@ foreach target : target_dirs
 
     if exe_sign
       emulators += {exe['name'] : custom_target(exe['name'],
-                   install: true,
-                   install_dir: get_option('bindir'),
                    depends: emulator,
                    output: exe['name'],
                    command: [
@@ -2246,6 +2244,11 @@ foreach target : target_dirs
                      meson.current_source_dir() / 'accel/hvf/entitlements.plist'
                    ])
       }
+
+      meson.add_install_script('scripts/entitlement.sh', '--install',
+                               get_option('bindir') / exe_name,
+                               get_option('bindir') / exe['name'],
+                               meson.current_source_dir() / 'accel/hvf/entitlements.plist')
     else
       emulators += {exe['name']: emulator}
     endif
diff --git a/scripts/entitlement.sh b/scripts/entitlement.sh
index c540fa6435..0f61d15376 100755
--- a/scripts/entitlement.sh
+++ b/scripts/entitlement.sh
@@ -2,12 +2,23 @@
 #
 # Helper script for the build process to apply entitlements
 
+copy=:
+if [ "$1" = --install ]; then
+  shift
+  copy=false
+  cd "$MESON_INSTALL_DESTDIR_PREFIX"
+fi
+
 SRC="$1"
 DST="$2"
 ENTITLEMENT="$3"
 
-trap 'rm "$DST.tmp"' exit
-cp -af "$SRC" "$DST.tmp"
-codesign --entitlements "$ENTITLEMENT" --force -s - "$DST.tmp"
-mv "$DST.tmp" "$DST"
+if $copy; then
+  trap 'rm "$DST.tmp"' exit
+  cp -af "$SRC" "$DST.tmp"
+  SRC="$DST.tmp"
+fi
+
+codesign --entitlements "$ENTITLEMENT" --force -s - "$SRC"
+mv -f "$SRC" "$DST"
 trap '' exit
-- 
2.29.2



