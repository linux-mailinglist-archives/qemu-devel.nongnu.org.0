Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2199A39F4F0
	for <lists+qemu-devel@lfdr.de>; Tue,  8 Jun 2021 13:28:25 +0200 (CEST)
Received: from localhost ([::1]:42738 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lqZuB-0006Et-T9
	for lists+qemu-devel@lfdr.de; Tue, 08 Jun 2021 07:28:23 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43488)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1lqZp8-0006RF-GQ
 for qemu-devel@nongnu.org; Tue, 08 Jun 2021 07:23:10 -0400
Received: from mail-wr1-x433.google.com ([2a00:1450:4864:20::433]:45709)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1lqZp5-0007wQ-PN
 for qemu-devel@nongnu.org; Tue, 08 Jun 2021 07:23:10 -0400
Received: by mail-wr1-x433.google.com with SMTP id z8so21121528wrp.12
 for <qemu-devel@nongnu.org>; Tue, 08 Jun 2021 04:23:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=2JJ8uamBQ1yz1ujJvvj1Ccn+AIwyN4th7VBQ4mGZvZQ=;
 b=JTenFFlMYwG6RJIkc/4vnkhoF2ImDtCAUVJC7OYjOeFe6PFes0KCfrK/rbfOFgzLbe
 Ij7lutbFCwwiTZcNBdQwY1+t0Lun8WU37p9XQehtu8As9hIi7EbYQVpUKP7i6ZzUMg/2
 0sACTevelR6UDI3tj6fjAmS1tsLAfVg0ZgCTnOQAdf28rTS5yXXh829akfloBSvg2kh9
 oRF6Jssrmq4tzZV+XekszUO9nqEPZp4Q62eE7gklDN7851uOA/AJHdj+7PNcbIf0IAky
 niE+2EE+oZxpgWhfWkBRXthEh+5RIHRabgVWZwgcQmFTjlwv+TVMGt3Whc+sVnn6m47I
 6PwA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=2JJ8uamBQ1yz1ujJvvj1Ccn+AIwyN4th7VBQ4mGZvZQ=;
 b=GyOMkHfZtoviZasVst6a18PFqJFeghwunSO3OOCoCEVibQVlg3icI1TEWEs/9gUw4N
 5k+n0rpaDizzq7+jbxLTFLoWvII5NFfVeG6Oq3eUQIyKddhHzaEqztegJKvCTzb30b3N
 Ha9vxepuZBHKARwR1PeSXHOpuUfnubC7doDdFDe7Hg7CQwFmrchwjksVyG3BuZhMMmt8
 V0k2GjPzYZ0GI9V6J1iDC0ysDQx9OOnuvQXT1vBS46bPM/gw0F/xTO7Mq2ok3TGxCj04
 inz2mMoo5C514QdR/i5vvSU5FRNyDFu9Mkb26kIZ7nofU+iKlmsaUUNrbDUR5Lg8IoWh
 10pw==
X-Gm-Message-State: AOAM532cdDkeQXQ95KaIqgrn2sBSxMLFI5D87PXAY1KQgWZ/4O+Un9LB
 rp+2qMcX95D/4kD0tu8TXlzJYvNM3qxnHA==
X-Google-Smtp-Source: ABdhPJzETgomTHK7Y3gHkf7QL+GJ6MZJa8IQlXQ6wf0BUtKQnV42RcXUr9n0spv8mMTqoMjuURf2Kw==
X-Received: by 2002:adf:ee46:: with SMTP id w6mr22624927wro.345.1623151386360; 
 Tue, 08 Jun 2021 04:23:06 -0700 (PDT)
Received: from avogadro.lan ([2001:b07:6468:f312:5e2c:eb9a:a8b6:fd3e])
 by smtp.gmail.com with ESMTPSA id i9sm15388621wrn.54.2021.06.08.04.23.05
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 08 Jun 2021 04:23:05 -0700 (PDT)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 04/26] configure, meson: convert libtasn1 detection to meson
Date: Tue,  8 Jun 2021 13:22:39 +0200
Message-Id: <20210608112301.402434-5-pbonzini@redhat.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210608112301.402434-1-pbonzini@redhat.com>
References: <20210608112301.402434-1-pbonzini@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::433;
 envelope-from=paolo.bonzini@gmail.com; helo=mail-wr1-x433.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.248,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.248,
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

Make it depend on gnutls too, since it is only used as part of gnutls
tests.

Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 configure              | 19 -------------------
 meson.build            |  9 +++++----
 tests/unit/meson.build |  2 +-
 3 files changed, 6 insertions(+), 24 deletions(-)

diff --git a/configure b/configure
index 74c8ea8cf1..ebe327b592 100755
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
 
@@ -5552,9 +5538,6 @@ if test "$gdbus_codegen" != "" ; then
     echo "GDBUS_CODEGEN=$gdbus_codegen" >> $config_host_mak
 fi
 echo "CONFIG_TLS_PRIORITY=\"$tls_priority\"" >> $config_host_mak
-if test "$tasn1" = "yes" ; then
-  echo "CONFIG_TASN1=y" >> $config_host_mak
-fi
 if test "$auth_pam" = "yes" ; then
     echo "CONFIG_AUTH_PAM=y" >> $config_host_mak
 fi
@@ -6016,8 +5999,6 @@ echo "LD_I386_EMULATION=$ld_i386_emulation" >> $config_host_mak
 echo "EXESUF=$EXESUF" >> $config_host_mak
 echo "HOST_DSOSUF=$HOST_DSOSUF" >> $config_host_mak
 echo "LIBS_QGA=$libs_qga" >> $config_host_mak
-echo "TASN1_LIBS=$tasn1_libs" >> $config_host_mak
-echo "TASN1_CFLAGS=$tasn1_cflags" >> $config_host_mak
 if test "$gcov" = "yes" ; then
   echo "CONFIG_GCOV=y" >> $config_host_mak
 fi
diff --git a/meson.build b/meson.build
index b374fa92cd..305b750ced 100644
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
@@ -2741,7 +2742,7 @@ summary_info += {'pixman':            pixman.found()}
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



