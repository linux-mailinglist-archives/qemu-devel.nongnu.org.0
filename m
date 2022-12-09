Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0355B648198
	for <lists+qemu-devel@lfdr.de>; Fri,  9 Dec 2022 12:26:36 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p3bW9-0004dT-2J; Fri, 09 Dec 2022 06:26:13 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1p3bUY-0003wl-D6
 for qemu-devel@nongnu.org; Fri, 09 Dec 2022 06:24:34 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1p3bUV-0000xR-VY
 for qemu-devel@nongnu.org; Fri, 09 Dec 2022 06:24:34 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1670585065;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=za/k6vD1LgEWg237PfcY4++NBJhaGInfCianBH5mDvM=;
 b=MUPjwkVLXtZxJdZb17zxX2wduR9pwaOyEpqjaINxg78XFABhhKAlbJaVmDlQU8hdRVxsl+
 ENHVz89FyfulSQDMwnojRFNkaAsScYjeCDGlvP2evJyRe6Sx1hXHM98zhk0qLqX+ecznzk
 dzLPJD5JbnDhG1T61Kk/o2y5I424yW8=
Received: from mail-ed1-f70.google.com (mail-ed1-f70.google.com
 [209.85.208.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-282-iZLsNfGMOT6kFtA7OAiW8g-1; Fri, 09 Dec 2022 06:24:23 -0500
X-MC-Unique: iZLsNfGMOT6kFtA7OAiW8g-1
Received: by mail-ed1-f70.google.com with SMTP id
 z3-20020a056402274300b0046b14f99390so1193030edd.9
 for <qemu-devel@nongnu.org>; Fri, 09 Dec 2022 03:24:23 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=za/k6vD1LgEWg237PfcY4++NBJhaGInfCianBH5mDvM=;
 b=5t0pIc7W8sHsjBiX0FZ+wOTWY99oLX/M+oWszPmliBY5zLFkTMEDBfqnKwzuEPyso4
 2RML+XM1z5sDC5pL8O3jzURsoTRyDs5Ur4xvOdE1vdEX7QAeOkZBnfQ/YqgsET3KE0CF
 h8vgHtzLX46fEISLwq+yNVt2UbGlSSeZbl6BdmeAcNG0t1mI2TGCXwdcsYPl2SnCW+Wl
 1CGErhK1GB/PgsKBH2eRmk90i6JQsA+U4LEHz0bQMHdu48z6lZnWCPgw+FvfL9mwlWe/
 bVuDLEHn217q4rmxGxTBDS4lMMAPG+Fc5OXwpRoHnyU3wyBEEczkrjVMx5IhyIZCUZFD
 CemQ==
X-Gm-Message-State: ANoB5pmGxKO1UImZdOgNU9cAOjbTN4CCe1Su6+eHi2kEqnN2Z6xCROvO
 f6s4z8lxfhPmVqGbQeWDFlw4lYtiOC3ve+0h8ep/Iqv1hGohA3YJvuKFEEGitGDPkECNipelaOk
 MQKLDjcxLVnSPAeoYdf9R1KFRwZB2udGw4ikxAbiEIDeI9TBtBxQI6BNoXc+o4kJ92YA=
X-Received: by 2002:a17:906:ecad:b0:7c1:ff4:d0c6 with SMTP id
 qh13-20020a170906ecad00b007c10ff4d0c6mr4053675ejb.36.1670585062491; 
 Fri, 09 Dec 2022 03:24:22 -0800 (PST)
X-Google-Smtp-Source: AA0mqf4vMA/mZp/fI+i040kjWGmHv7YOQLTNGPOW9037r+iCyohPe0L86bcCWyaGHkfvWBTHAKfdBg==
X-Received: by 2002:a17:906:ecad:b0:7c1:ff4:d0c6 with SMTP id
 qh13-20020a170906ecad00b007c10ff4d0c6mr4053653ejb.36.1670585062096; 
 Fri, 09 Dec 2022 03:24:22 -0800 (PST)
Received: from avogadro.local ([2001:b07:6468:f312:1c09:f536:3de6:228c])
 by smtp.gmail.com with ESMTPSA id
 hw20-20020a170907a0d400b0074134543f82sm456800ejc.90.2022.12.09.03.24.21
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 09 Dec 2022 03:24:21 -0800 (PST)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 04/30] configure: preserve qemu-ga variables
Date: Fri,  9 Dec 2022 12:23:43 +0100
Message-Id: <20221209112409.184703-5-pbonzini@redhat.com>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20221209112409.184703-1-pbonzini@redhat.com>
References: <20221209112409.184703-1-pbonzini@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

Ensure that qemu-ga variables set at configure time are kept
later when the script is rerun.  For preserve_env to work,
the variables need to be empty so move the default values
to config-host.mak generation.

Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 configure | 23 ++++++-----------------
 1 file changed, 6 insertions(+), 17 deletions(-)

diff --git a/configure b/configure
index db2b45740449..4d14ff9c319c 100755
--- a/configure
+++ b/configure
@@ -2222,20 +2222,6 @@ if test "$have_ubsan" = "yes"; then
   QEMU_LDFLAGS="-fsanitize=undefined $QEMU_LDFLAGS"
 fi
 
-##########################################
-# Guest agent Windows MSI package
-
-if test "$QEMU_GA_MANUFACTURER" = ""; then
-  QEMU_GA_MANUFACTURER=QEMU
-fi
-if test "$QEMU_GA_DISTRO" = ""; then
-  QEMU_GA_DISTRO=Linux
-fi
-if test "$QEMU_GA_VERSION" = ""; then
-    QEMU_GA_VERSION=$(cat "$source_path"/VERSION)
-fi
-
-
 #######################################
 # cross-compiled firmware targets
 
@@ -2331,9 +2317,9 @@ if test "$debug_tcg" = "yes" ; then
 fi
 if test "$mingw32" = "yes" ; then
   echo "CONFIG_WIN32=y" >> $config_host_mak
-  echo "QEMU_GA_MANUFACTURER=${QEMU_GA_MANUFACTURER}" >> $config_host_mak
-  echo "QEMU_GA_DISTRO=${QEMU_GA_DISTRO}" >> $config_host_mak
-  echo "QEMU_GA_VERSION=${QEMU_GA_VERSION}" >> $config_host_mak
+  echo "QEMU_GA_MANUFACTURER=${QEMU_GA_MANUFACTURER-QEMU}" >> $config_host_mak
+  echo "QEMU_GA_DISTRO=${QEMU_GA_DISTRO-Linux}" >> $config_host_mak
+  echo "QEMU_GA_VERSION=${QEMU_GA_VERSION-$(cat "$source_path"/VERSION)}" >> $config_host_mak
 else
   echo "CONFIG_POSIX=y" >> $config_host_mak
 fi
@@ -2647,6 +2633,9 @@ preserve_env PKG_CONFIG
 preserve_env PKG_CONFIG_LIBDIR
 preserve_env PKG_CONFIG_PATH
 preserve_env PYTHON
+preserve_env QEMU_GA_MANUFACTURER
+preserve_env QEMU_GA_DISTRO
+preserve_env QEMU_GA_VERSION
 preserve_env SDL2_CONFIG
 preserve_env SMBD
 preserve_env STRIP
-- 
2.38.1


