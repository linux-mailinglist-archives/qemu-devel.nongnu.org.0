Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BC1E62F615F
	for <lists+qemu-devel@lfdr.de>; Thu, 14 Jan 2021 14:00:10 +0100 (CET)
Received: from localhost ([::1]:36356 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l02ET-0006xc-II
	for lists+qemu-devel@lfdr.de; Thu, 14 Jan 2021 08:00:09 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:41510)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@redhat.com>)
 id 1l02BC-0002qx-TS
 for qemu-devel@nongnu.org; Thu, 14 Jan 2021 07:56:46 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:42020)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@redhat.com>)
 id 1l02BB-0004pB-BO
 for qemu-devel@nongnu.org; Thu, 14 Jan 2021 07:56:46 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1610629004;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=+Ux396mYQBTCvp5/kSAVhG9XTdqPPnR/Uj7bslWuHNc=;
 b=hAfcDPGKCUq7fezdcebKLHj1Aj8+wHBR1L1aGj7lix21K8FvN10ggLXOK3n9Xjv/7uNvFY
 KKNtt/DoR4QXObO1LV7/qLA6h5JVe/jNKhlqR+5AMj963asDNhR36Zn5dTeuo+vO0FcWtq
 Lz6Xbg02mUOtekxfcEosVibyIRBWCKk=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-520-MGW7hugNP3mwtpkV2Xqj8w-1; Thu, 14 Jan 2021 07:56:40 -0500
X-MC-Unique: MGW7hugNP3mwtpkV2Xqj8w-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 18E6280A5C5;
 Thu, 14 Jan 2021 12:56:31 +0000 (UTC)
Received: from localhost (unknown [10.36.110.7])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 2456060867;
 Thu, 14 Jan 2021 12:56:29 +0000 (UTC)
From: marcandre.lureau@redhat.com
To: qemu-devel@nongnu.org
Subject: [PATCH 2/5] build-sys: set global arguments for cflags/ldflags
Date: Thu, 14 Jan 2021 16:56:02 +0400
Message-Id: <20210114125605.1227742-3-marcandre.lureau@redhat.com>
In-Reply-To: <20210114125605.1227742-1-marcandre.lureau@redhat.com>
References: <20210114125605.1227742-1-marcandre.lureau@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=marcandre.lureau@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=63.128.21.124;
 envelope-from=marcandre.lureau@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.248,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: pbonzini@redhat.com, j@getutm.app,
 =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
 samuel.thibault@ens-lyon.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Marc-André Lureau <marcandre.lureau@redhat.com>

As we want subprojects to share those arguments

Signed-off-by: Marc-André Lureau <marcandre.lureau@redhat.com>
---
 meson.build | 16 ++++++++--------
 1 file changed, 8 insertions(+), 8 deletions(-)

diff --git a/meson.build b/meson.build
index 3d889857a0..a4adf06997 100644
--- a/meson.build
+++ b/meson.build
@@ -100,12 +100,12 @@ if 'CONFIG_FUZZ' in config_host
                               native: false, language: ['c', 'cpp', 'objc'])
 endif
 
-add_project_arguments(config_host['QEMU_CFLAGS'].split(),
-                      native: false, language: ['c', 'objc'])
-add_project_arguments(config_host['QEMU_CXXFLAGS'].split(),
-                      native: false, language: 'cpp')
-add_project_link_arguments(config_host['QEMU_LDFLAGS'].split(),
-                           native: false, language: ['c', 'cpp', 'objc'])
+add_global_arguments(config_host['QEMU_CFLAGS'].split(),
+                     native: false, language: ['c', 'objc'])
+add_global_arguments(config_host['QEMU_CXXFLAGS'].split(),
+                     native: false, language: 'cpp')
+add_global_link_arguments(config_host['QEMU_LDFLAGS'].split(),
+                          native: false, language: ['c', 'cpp', 'objc'])
 
 if targetos == 'linux'
   add_project_arguments('-isystem', meson.current_source_dir() / 'linux-headers',
@@ -1019,8 +1019,8 @@ if get_option('cfi')
       error('-fno-sanitize-trap=cfi-icall is not supported by the compiler')
     endif
   endif
-  add_project_arguments(cfi_flags, native: false, language: ['c', 'cpp', 'objc'])
-  add_project_link_arguments(cfi_flags, native: false, language: ['c', 'cpp', 'objc'])
+  add_global_arguments(cfi_flags, native: false, language: ['c', 'cpp', 'objc'])
+  add_global_link_arguments(cfi_flags, native: false, language: ['c', 'cpp', 'objc'])
 endif
 
 #################
-- 
2.29.0


