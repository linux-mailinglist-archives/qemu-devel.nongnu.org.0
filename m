Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BF9233B19AF
	for <lists+qemu-devel@lfdr.de>; Wed, 23 Jun 2021 14:16:53 +0200 (CEST)
Received: from localhost ([::1]:54696 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lw1oK-0006E6-R3
	for lists+qemu-devel@lfdr.de; Wed, 23 Jun 2021 08:16:52 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:46652)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1lw1m5-0003tq-HD
 for qemu-devel@nongnu.org; Wed, 23 Jun 2021 08:14:33 -0400
Received: from mail-ej1-x62b.google.com ([2a00:1450:4864:20::62b]:36711)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1lw1m3-00021b-Md
 for qemu-devel@nongnu.org; Wed, 23 Jun 2021 08:14:33 -0400
Received: by mail-ej1-x62b.google.com with SMTP id nd37so3710189ejc.3
 for <qemu-devel@nongnu.org>; Wed, 23 Jun 2021 05:14:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=7ElfB3hCixBdlT6W7KW1tRrgymRkAv9P5WGy6JvpRnA=;
 b=sb6QrnFj0m0+otAHiP8uoPu/QWLKwwi0/icwL5zJbytz9GeA7CHV2KTiY6XB29PBVt
 +4OTDmM0qfB58FYE90MkZZCuuXwefz93wHEVfP6P5XkvBeHNOQXANF/vJhhddSY9spBh
 Mck9wZKfO7WEq2qgnnEFgSXIA6PaD00u+PiD6mfq91VCHxsrV6uuibaAHkw381iCE/pn
 MwTLZszAcLlPj7lo53BRSFuK0QMkMSraper9wZ46MOKx14UQd2K6jVLJJitRIayR2Rzy
 bCkLRpE0OFcGrwZAr603vxF8mPSIYqAyYWadNfpJlQORhPOmqmMDOVmuxNxeD27RiwNI
 vTDQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=7ElfB3hCixBdlT6W7KW1tRrgymRkAv9P5WGy6JvpRnA=;
 b=G5mRw4RCerUWlan4iHsxl3fmt8OVzE+jtM1fxkxW9TJkNCi5jBNf9zkBoI4BIRYI+P
 bgxuqxlhxcYm9228l5efjho6qjt003lS0Rp3wp0tAmJY2RVEft703iarQZdBAOQkZ7KZ
 PPmnOcbEJGRP0rQ52hA8u8KVqVSx8pI3vkf0mJ8cCyvYkxtA6KfCkMuSDe6cxsg0pQlC
 aLxEChoWiUKzK3A5IUF+fHmj4ARY9VjUvFGwsXbpm8LrCSa5Sez9gouszPX39bAxSsya
 0lWoQHndoy0ehOyYI6hmFbZXw7OiOgcmbQleUUzeZScJnJQPyII5Miu2vVSSJ9YxgZcq
 N/sw==
X-Gm-Message-State: AOAM533eM3ShObdXnUMetgXdG5kYA5LNJAMmASk8MvzH7Hk6nYg/d/jq
 CviO0X6Rnhx6eC226RKmVzEHB0u2dbc=
X-Google-Smtp-Source: ABdhPJxSwq+4iCYCe/Ve+qcQHlUes3kzmwAa5DAmO2WtZMq44yHcp78VNcRmetvESfRYpJRlAwBwwA==
X-Received: by 2002:a17:906:3794:: with SMTP id
 n20mr9338985ejc.276.1624450470446; 
 Wed, 23 Jun 2021 05:14:30 -0700 (PDT)
Received: from avogadro.lan ([2001:b07:6468:f312:c8dd:75d4:99ab:290a])
 by smtp.gmail.com with ESMTPSA id o5sm1680778edt.44.2021.06.23.05.14.29
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 23 Jun 2021 05:14:30 -0700 (PDT)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 07/12] configure, meson: convert libtasn1 detection to meson
Date: Wed, 23 Jun 2021 14:14:19 +0200
Message-Id: <20210623121424.1259496-8-pbonzini@redhat.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210623121424.1259496-1-pbonzini@redhat.com>
References: <20210623121424.1259496-1-pbonzini@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::62b;
 envelope-from=paolo.bonzini@gmail.com; helo=mail-ej1-x62b.google.com
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
Cc: =?UTF-8?q?Daniel=20P=20=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 Richard Henderson <richard.henderson@liaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Make it depend on gnutls too, since it is only used as part of gnutls
tests.

Reviewed-by: Richard Henderson <richard.henderson@liaro.org>
Reviewed-by: Daniel P. Berrangé <berrange@redhat.com>
Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 configure              | 19 -------------------
 meson.build            |  9 +++++----
 tests/unit/meson.build |  2 +-
 3 files changed, 6 insertions(+), 24 deletions(-)

diff --git a/configure b/configure
index 897e968e02..3d36eea55f 100755
--- a/configure
+++ b/configure
@@ -2799,20 +2799,6 @@ EOF
   fi
 fi
 
-##########################################
-# libtasn1 - only for the TLS creds/session test suite
-
-tasn1=yes
-tasn1_cflags=""
-tasn1_libs=""
-if $pkg_config --exists "libtasn1"; then
-    tasn1_cflags=$($pkg_config --cflags libtasn1)
-    tasn1_libs=$($pkg_config --libs libtasn1)
-else
-    tasn1=no
-fi
-
-
 ##########################################
 # PAM probe
 
@@ -5554,9 +5540,6 @@ if test "$gdbus_codegen" != "" ; then
     echo "GDBUS_CODEGEN=$gdbus_codegen" >> $config_host_mak
 fi
 echo "CONFIG_TLS_PRIORITY=\"$tls_priority\"" >> $config_host_mak
-if test "$tasn1" = "yes" ; then
-  echo "CONFIG_TASN1=y" >> $config_host_mak
-fi
 if test "$auth_pam" = "yes" ; then
     echo "CONFIG_AUTH_PAM=y" >> $config_host_mak
 fi
@@ -6017,8 +6000,6 @@ echo "LD_I386_EMULATION=$ld_i386_emulation" >> $config_host_mak
 echo "EXESUF=$EXESUF" >> $config_host_mak
 echo "HOST_DSOSUF=$HOST_DSOSUF" >> $config_host_mak
 echo "LIBS_QGA=$libs_qga" >> $config_host_mak
-echo "TASN1_LIBS=$tasn1_libs" >> $config_host_mak
-echo "TASN1_CFLAGS=$tasn1_cflags" >> $config_host_mak
 if test "$gcov" = "yes" ; then
   echo "CONFIG_GCOV=y" >> $config_host_mak
 fi
diff --git a/meson.build b/meson.build
index 286b37aecb..d4ce2ca57b 100644
--- a/meson.build
+++ b/meson.build
@@ -985,9 +985,10 @@ if 'CONFIG_LIBDAXCTL' in config_host
   libdaxctl = declare_dependency(link_args: config_host['LIBDAXCTL_LIBS'].split())
 endif
 tasn1 = not_found
-if 'CONFIG_TASN1' in config_host
-  tasn1 = declare_dependency(compile_args: config_host['TASN1_CFLAGS'].split(),
-                             link_args: config_host['TASN1_LIBS'].split())
+if gnutls.found()
+  tasn1 = dependency('libtasn1',
+                     method: 'pkg-config',
+                     kwargs: static_kwargs)
 endif
 keyutils = dependency('libkeyutils', required: false,
                       method: 'pkg-config', kwargs: static_kwargs)
@@ -2727,7 +2728,7 @@ summary_info += {'pixman':            pixman.found()}
 summary_info += {'VTE support':       config_host.has_key('CONFIG_VTE')}
 # TODO: add back version
 summary_info += {'slirp support':     slirp_opt == 'disabled' ? false : slirp_opt}
-summary_info += {'libtasn1':          config_host.has_key('CONFIG_TASN1')}
+summary_info += {'libtasn1':          tasn1.found()}
 summary_info += {'PAM':               config_host.has_key('CONFIG_AUTH_PAM')}
 summary_info += {'iconv support':     iconv.found()}
 summary_info += {'curses support':    curses.found()}
diff --git a/tests/unit/meson.build b/tests/unit/meson.build
index fcf6ed2ef5..4c1ebc06ac 100644
--- a/tests/unit/meson.build
+++ b/tests/unit/meson.build
@@ -84,7 +84,7 @@ if have_block
     'test-crypto-block': [io],
   }
   if gnutls.found() and \
-     'CONFIG_TASN1' in config_host and \
+     tasn1.found() and \
      'CONFIG_POSIX' in config_host
     tests += {
       'test-crypto-tlscredsx509': ['crypto-tls-x509-helpers.c', 'pkix_asn1_tab.c',
-- 
2.31.1



