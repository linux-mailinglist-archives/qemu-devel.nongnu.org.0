Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5B1A04CAD33
	for <lists+qemu-devel@lfdr.de>; Wed,  2 Mar 2022 19:13:06 +0100 (CET)
Received: from localhost ([::1]:39956 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nPTTF-0005eH-4X
	for lists+qemu-devel@lfdr.de; Wed, 02 Mar 2022 13:13:05 -0500
Received: from eggs.gnu.org ([209.51.188.92]:58492)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <slp@redhat.com>) id 1nPTND-0003dw-Cq
 for qemu-devel@nongnu.org; Wed, 02 Mar 2022 13:06:51 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:40250)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <slp@redhat.com>) id 1nPTNB-0007Vd-Ps
 for qemu-devel@nongnu.org; Wed, 02 Mar 2022 13:06:51 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1646244409;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=GU2PkYv/oO0WBN6akEtPQqLOjiJQ79hZYXxHxM/rB9g=;
 b=DjPgub6PQ1bgmjRqrANKmfQu7isYKPrFFx4VDRD4g6NfOUQs4CZlCZc/PCw1K7SMSDuYvj
 mUAxHxT0bzkpFpMB3yMAp2qQcTa1GCaLuciRwSnmcJ403/qgOmeRKDIZKd3PQzYbAzbsAr
 deWl4A73j6iLvWX59HW5am0HPtyr7kE=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-619-cj2pkYG1PbGXtrc4Ml26FA-1; Wed, 02 Mar 2022 13:06:46 -0500
X-MC-Unique: cj2pkYG1PbGXtrc4Ml26FA-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 07D001091DA2;
 Wed,  2 Mar 2022 18:06:44 +0000 (UTC)
Received: from toolbox.redhat.com (unknown [10.33.36.14])
 by smtp.corp.redhat.com (Postfix) with ESMTP id ED82F7DE2F;
 Wed,  2 Mar 2022 18:06:04 +0000 (UTC)
From: Sergio Lopez <slp@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 3/3] configure,
 meson: allow enabling vhost-user on all POSIX systems
Date: Wed,  2 Mar 2022 19:03:18 +0100
Message-Id: <20220302180318.28893-4-slp@redhat.com>
In-Reply-To: <20220302180318.28893-1-slp@redhat.com>
References: <20220302180318.28893-1-slp@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
Received-SPF: pass client-ip=170.10.129.124; envelope-from=slp@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H5=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Cc: Elena Ufimtseva <elena.ufimtseva@oracle.com>,
 John G Johnson <john.g.johnson@oracle.com>, kvm@vger.kernel.org,
 David Hildenbrand <david@redhat.com>, Eric Farman <farman@linux.ibm.com>,
 Alex Williamson <alex.williamson@redhat.com>,
 Matthew Rosato <mjrosato@linux.ibm.com>, qemu-block@nongnu.org,
 "Michael S. Tsirkin" <mst@redhat.com>, Halil Pasic <pasic@linux.ibm.com>,
 Christian Borntraeger <borntraeger@linux.ibm.com>, vgoyal@redhat.com,
 Thomas Huth <thuth@redhat.com>, Sergio Lopez <slp@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>, qemu-s390x@nongnu.org,
 Stefan Hajnoczi <stefanha@redhat.com>,
 Jagannathan Raman <jag.raman@oracle.com>, Kevin Wolf <kwolf@redhat.com>,
 Cornelia Huck <cohuck@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Hanna Reitz <hreitz@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Fam Zheng <fam@euphon.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

With the possibility of using a pipe pair via qemu_pipe() as a
replacement on operating systems that doesn't support eventfd,
vhost-user can also work on all POSIX systems.

This change allows enabling vhost-user on all non-Windows platforms
and makes libvhost_user (which still depends on eventfd) a linux-only
feature.

Signed-off-by: Sergio Lopez <slp@redhat.com>
---
 configure   | 4 ++--
 meson.build | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/configure b/configure
index c56ed53ee3..daccf4be7c 100755
--- a/configure
+++ b/configure
@@ -1659,8 +1659,8 @@ fi
 # vhost interdependencies and host support
 
 # vhost backends
-if test "$vhost_user" = "yes" && test "$linux" != "yes"; then
-  error_exit "vhost-user is only available on Linux"
+if test "$vhost_user" = "yes" && test "$mingw32" = "yes"; then
+  error_exit "vhost-user is not available on Windows"
 fi
 test "$vhost_vdpa" = "" && vhost_vdpa=$linux
 if test "$vhost_vdpa" = "yes" && test "$linux" != "yes"; then
diff --git a/meson.build b/meson.build
index 8df40bfac4..f2bc439c30 100644
--- a/meson.build
+++ b/meson.build
@@ -2701,7 +2701,7 @@ if have_system or have_user
 endif
 
 vhost_user = not_found
-if 'CONFIG_VHOST_USER' in config_host
+if targetos == 'linux' and 'CONFIG_VHOST_USER' in config_host
   libvhost_user = subproject('libvhost-user')
   vhost_user = libvhost_user.get_variable('vhost_user_dep')
 endif
-- 
2.35.1


