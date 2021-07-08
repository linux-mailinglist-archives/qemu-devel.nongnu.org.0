Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 943663BF966
	for <lists+qemu-devel@lfdr.de>; Thu,  8 Jul 2021 13:57:31 +0200 (CEST)
Received: from localhost ([::1]:42470 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m1Seo-0002lW-Hc
	for lists+qemu-devel@lfdr.de; Thu, 08 Jul 2021 07:57:30 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:52852)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1m1ScG-0000ea-Qr
 for qemu-devel@nongnu.org; Thu, 08 Jul 2021 07:54:53 -0400
Received: from mail-ed1-x534.google.com ([2a00:1450:4864:20::534]:34654)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1m1ScE-0002d3-2A
 for qemu-devel@nongnu.org; Thu, 08 Jul 2021 07:54:52 -0400
Received: by mail-ed1-x534.google.com with SMTP id l2so8154542edt.1
 for <qemu-devel@nongnu.org>; Thu, 08 Jul 2021 04:54:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=brBWUAvHeIOYDJtnGzR2iHi+ZfN9Pt/WWB/tTZWXUxc=;
 b=WQbOJ8Kezb7uddfSXHmHi6gMKKP1FnpxVEzuuBHAbDlxuIMStMfRfy5Bd6BLdueRNr
 1JAwKrRkJexXG4FlR2cKifrFvWYF85FDy0MWPpjVXVeFHJ/kxPW1fBjOodT0CNzZg5f2
 tOHlr+9ZHedZ6DsCKplImMSli87fQGRyxBck6QgZWylsjMWiPfNCVM05Jca/KF7qYTVA
 xYADo5CGiW1nSTcg0Xe8GfK79zsz125WO6Zy+wV/lt9qwwzDAQ+lzwi1GUZcL8fRKjRn
 7Fs5c4c5l/1yBIqc1PSWjY730QkGH3hyt0Hss2LpzJklpwyUGOJAHP0gIxaN2Qzf9DSC
 vp9Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=brBWUAvHeIOYDJtnGzR2iHi+ZfN9Pt/WWB/tTZWXUxc=;
 b=EsOC0WqjriMnIk3MSKvjTkYNHhmwQ+A86QC2bX2S4dfnzcTEk1ak7hVxzO01NmwivJ
 6xqQZPuvq1qpxVcJKoDGTurgST2L8hY920aqOlO44ZZCSc577YFUM46ap2xva/li48mC
 bK4wK/KQbqWfmKJZDlTJ3/QRS5FaPf8pd03iepCbBlSdRTDejM+1ilFjrntCpIXQ6Yoo
 s/ADbD3triMpBajYXlfeHabddpzPQMBzxr4JtCo4E1+7lxsGejEYO9DisN2g4wKkVjNu
 6cOEVOWh6GdokB1z2LJL71Ly1JkyTU2urP73dl2syWCNbVOn6GNVD3uNH2MuZ+CNgL91
 7sbQ==
X-Gm-Message-State: AOAM530/KdtFVtiB8bhLcnHf+KK2G8gq/CG7q2tuIas/hNjOcGmgce+d
 FpX5HAwXEPasXNgql+GebTYJrmzkCeo=
X-Google-Smtp-Source: ABdhPJyNuv2IhhMhjWazcWnq0z43b4SGwtbQm0YwSxBzc32D9Om2YJ1oOBuJKD1EZokGCLPcXUxhdw==
X-Received: by 2002:a05:6402:d59:: with SMTP id
 ec25mr37674942edb.373.1625745288069; 
 Thu, 08 Jul 2021 04:54:48 -0700 (PDT)
Received: from avogadro.lan ([2001:b07:6468:f312:c8dd:75d4:99ab:290a])
 by smtp.gmail.com with ESMTPSA id b5sm843673ejz.122.2021.07.08.04.54.47
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 08 Jul 2021 04:54:47 -0700 (PDT)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH] meson: fix missing preprocessor symbols
Date: Thu,  8 Jul 2021 13:54:46 +0200
Message-Id: <20210708115446.401822-1-pbonzini@redhat.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <53c22b68e3ecd1764dfd325baefea6acd0b1dc70>
References: <53c22b68e3ecd1764dfd325baefea6acd0b1dc70>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::534;
 envelope-from=paolo.bonzini@gmail.com; helo=mail-ed1-x534.google.com
X-Spam_score_int: -16
X-Spam_score: -1.7
X-Spam_bar: -
X-Spam_report: (-1.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.001,
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
Cc: Li Zhijian <lizhijian@cn.fujitsu.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

While most libraries do not need a CONFIG_* symbol because the
"when:" clauses are enough, some do.  Add them back or stop
using them if possible.

In the case of libpmem, the statement to add the CONFIG_* symbol
was still in configure, but could not be triggered because it
checked for "no" instead of "disabled" (and it would be wrong anyway
since the test for the library has not been done yet).

Reported-by: Li Zhijian <lizhijian@cn.fujitsu.com>
Fixes: 587d59d6cc ("configure, meson: convert virgl detection to meson", 2021-07-06)
Fixes: 83ef16821a ("configure, meson: convert libdaxctl detection to meson", 2021-07-06)
Fixes: e36e8c70f6 ("configure, meson: convert libpmem detection to meson", 2021-07-06)
Fixes: 53c22b68e3 ("configure, meson: convert liburing detection to meson", 2021-07-06)
Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 configure                          | 6 ------
 contrib/vhost-user-gpu/meson.build | 2 +-
 meson.build                        | 4 ++++
 3 files changed, 5 insertions(+), 7 deletions(-)

diff --git a/configure b/configure
index a172c83e15..a04b1e075c 100755
--- a/configure
+++ b/configure
@@ -4818,12 +4818,6 @@ elif test "$pthread_setname_np_wo_tid" = "yes" ; then
   echo "CONFIG_PTHREAD_SETNAME_NP_WO_TID=y" >> $config_host_mak
 fi
 
-if test "$libpmem" = "yes" ; then
-  echo "CONFIG_LIBPMEM=y" >> $config_host_mak
-  echo "LIBPMEM_LIBS=$libpmem_libs" >> $config_host_mak
-  echo "LIBPMEM_CFLAGS=$libpmem_cflags" >> $config_host_mak
-fi
-
 if test "$bochs" = "yes" ; then
   echo "CONFIG_BOCHS=y" >> $config_host_mak
 fi
diff --git a/contrib/vhost-user-gpu/meson.build b/contrib/vhost-user-gpu/meson.build
index 0ce1515a10..4cb52a91d7 100644
--- a/contrib/vhost-user-gpu/meson.build
+++ b/contrib/vhost-user-gpu/meson.build
@@ -1,4 +1,4 @@
-if 'CONFIG_TOOLS' in config_host and 'CONFIG_VIRGL' in config_host \
+if 'CONFIG_TOOLS' in config_host and virgl.found() \
     and 'CONFIG_GBM' in config_host and 'CONFIG_LINUX' in config_host \
     and pixman.found()
   executable('vhost-user-gpu', files('vhost-user-gpu.c', 'virgl.c', 'vugbm.c'),
diff --git a/meson.build b/meson.build
index 7e12de01be..9cd966a86b 100644
--- a/meson.build
+++ b/meson.build
@@ -1223,8 +1223,11 @@ config_host_data.set('CONFIG_VTE', vte.found())
 config_host_data.set('CONFIG_LIBATTR', have_old_libattr)
 config_host_data.set('CONFIG_LIBCAP_NG', libcap_ng.found())
 config_host_data.set('CONFIG_EBPF', libbpf.found())
+config_host_data.set('CONFIG_LIBDAXCTL', libdaxctl.found())
 config_host_data.set('CONFIG_LIBISCSI', libiscsi.found())
 config_host_data.set('CONFIG_LIBNFS', libnfs.found())
+config_host_data.set('CONFIG_LINUX_IO_URING', linux_io_uring.found())
+config_host_data.set('CONFIG_LIBPMEM', libpmem.found())
 config_host_data.set('CONFIG_RBD', rbd.found())
 config_host_data.set('CONFIG_SDL', sdl.found())
 config_host_data.set('CONFIG_SDL_IMAGE', sdl_image.found())
@@ -1237,6 +1240,7 @@ config_host_data.set('CONFIG_VNC_JPEG', jpeg.found())
 config_host_data.set('CONFIG_VNC_PNG', png.found())
 config_host_data.set('CONFIG_VNC_SASL', sasl.found())
 config_host_data.set('CONFIG_VIRTFS', have_virtfs)
+config_host_data.set('CONFIG_VTE', vte.found())
 config_host_data.set('CONFIG_XKBCOMMON', xkbcommon.found())
 config_host_data.set('CONFIG_KEYUTILS', keyutils.found())
 config_host_data.set('CONFIG_GETTID', has_gettid)
-- 
2.31.1


