Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E396F2B82C2
	for <lists+qemu-devel@lfdr.de>; Wed, 18 Nov 2020 18:16:51 +0100 (CET)
Received: from localhost ([::1]:44486 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kfR4a-0004SZ-Cj
	for lists+qemu-devel@lfdr.de; Wed, 18 Nov 2020 12:16:50 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:36624)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1kfQz5-0007jD-V4
 for qemu-devel@nongnu.org; Wed, 18 Nov 2020 12:11:08 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:52211)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1kfQz4-00014L-65
 for qemu-devel@nongnu.org; Wed, 18 Nov 2020 12:11:07 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1605719465;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:content-type:content-type:in-reply-to:in-reply-to:
 references:references; bh=VjP7aOMy74tVk7b997ykXQsbMJNZFefXpBSJqDAoVHk=;
 b=MfFtxNAjsFvrSXnpIAGyFF3ic8swyDB5rmA09M2ClnYiyszI101sbf+L8QbdUtGsdM6rxC
 IjG6/FKAi6/UWjjSnIN9yeoeRLR3UwszLye3SwReIqa/yfCyFddHRwCxNlDXj0CpybaUzp
 WBtG2XmXNinDGttb+UDK02ay5umXuvE=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-123-U3g6l2quO5CG5JKJYvFjXQ-1; Wed, 18 Nov 2020 12:11:01 -0500
X-MC-Unique: U3g6l2quO5CG5JKJYvFjXQ-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 731CDD8EC1;
 Wed, 18 Nov 2020 17:11:00 +0000 (UTC)
Received: from thuth.com (ovpn-113-139.ams2.redhat.com [10.36.113.139])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 6995960BE2;
 Wed, 18 Nov 2020 17:10:59 +0000 (UTC)
From: Thomas Huth <thuth@redhat.com>
To: qemu-devel@nongnu.org,
	Paolo Bonzini <pbonzini@redhat.com>
Subject: [PATCH 3/6] configure / meson: Move check for drm.h to meson.build
Date: Wed, 18 Nov 2020 18:10:49 +0100
Message-Id: <20201118171052.308191-4-thuth@redhat.com>
In-Reply-To: <20201118171052.308191-1-thuth@redhat.com>
References: <20201118171052.308191-1-thuth@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=thuth@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=216.205.24.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/11/18 00:38:29
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Laurent Vivier <laurent@vivier.eu>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

This check can be done in a much shorter way in meson.build

Signed-off-by: Thomas Huth <thuth@redhat.com>
---
 configure   | 10 ----------
 meson.build |  1 +
 2 files changed, 1 insertion(+), 10 deletions(-)

diff --git a/configure b/configure
index 5a5e486373..b3e1052a58 100755
--- a/configure
+++ b/configure
@@ -3088,13 +3088,6 @@ EOF
     fi
 fi
 
-#########################################
-# libdrm check
-have_drm_h=no
-if check_include "libdrm/drm.h" ; then
-    have_drm_h=yes
-fi
-
 #########################################
 # sys/signal.h check
 have_sys_signal_h=no
@@ -6185,9 +6178,6 @@ fi
 if test "$auth_pam" = "yes" ; then
     echo "CONFIG_AUTH_PAM=y" >> $config_host_mak
 fi
-if test "$have_drm_h" = "yes" ; then
-  echo "HAVE_DRM_H=y" >> $config_host_mak
-fi
 if test "$have_broken_size_max" = "yes" ; then
     echo "HAVE_BROKEN_SIZE_MAX=y" >> $config_host_mak
 fi
diff --git a/meson.build b/meson.build
index 97a6445249..d6b633f17f 100644
--- a/meson.build
+++ b/meson.build
@@ -808,6 +808,7 @@ config_host_data.set('QEMU_VERSION_MAJOR', meson.project_version().split('.')[0]
 config_host_data.set('QEMU_VERSION_MINOR', meson.project_version().split('.')[1])
 config_host_data.set('QEMU_VERSION_MICRO', meson.project_version().split('.')[2])
 
+config_host_data.set('HAVE_DRM_H', cc.has_header('libdrm/drm.h'))
 config_host_data.set('HAVE_PTY_H', cc.has_header('pty.h'))
 config_host_data.set('HAVE_SYS_IOCCOM_H', cc.has_header('sys/ioccom.h'))
 
-- 
2.18.4


