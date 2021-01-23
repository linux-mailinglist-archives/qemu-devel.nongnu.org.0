Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CDB5E3015FF
	for <lists+qemu-devel@lfdr.de>; Sat, 23 Jan 2021 15:40:22 +0100 (CET)
Received: from localhost ([::1]:53128 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l3K5N-0007Rd-P1
	for lists+qemu-devel@lfdr.de; Sat, 23 Jan 2021 09:40:21 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:35224)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1l3JxD-0003Vc-Ck
 for qemu-devel@nongnu.org; Sat, 23 Jan 2021 09:31:55 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:30323)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1l3Jx1-0005p8-FT
 for qemu-devel@nongnu.org; Sat, 23 Jan 2021 09:31:55 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1611412301;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=2m4mngzBSwX3L5aQNnS4OyTaMXYZ6B6m3Sg80x5CrZw=;
 b=DP3zjt15BotV4poPUUlhzOjbN8/JruJ+bDWXqoswSyOITKIvnoSyMBa4Z19561llprytVq
 GkSImIfMy6bj9+iNKpJt+fmM+qofSIRmhoVWU07nMwzfbRQJEwhcuUDj/FF1o0GL5CWai3
 g0g6Yplv+1XoyH1uFYqlm8gZnHYzZUQ=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-194-A5SsJK5SNomiPs2mZBuf7g-1; Sat, 23 Jan 2021 09:31:39 -0500
X-MC-Unique: A5SsJK5SNomiPs2mZBuf7g-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 4B661E745
 for <qemu-devel@nongnu.org>; Sat, 23 Jan 2021 14:31:38 +0000 (UTC)
Received: from virtlab701.virt.lab.eng.bos.redhat.com
 (virtlab701.virt.lab.eng.bos.redhat.com [10.19.152.228])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 076F85D9CC;
 Sat, 23 Jan 2021 14:31:37 +0000 (UTC)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 09/31] build-sys: set global arguments for cflags/ldflags
Date: Sat, 23 Jan 2021 09:31:06 -0500
Message-Id: <20210123143128.1167797-10-pbonzini@redhat.com>
In-Reply-To: <20210123143128.1167797-1-pbonzini@redhat.com>
References: <20210123143128.1167797-1-pbonzini@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=pbonzini@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=63.128.21.124; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.165,
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
Cc: =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Marc-André Lureau <marcandre.lureau@redhat.com>

As we want subprojects to share those arguments

Signed-off-by: Marc-André Lureau <marcandre.lureau@redhat.com>
Acked-by: Paolo Bonzini <pbonzini@redhat.com>
Message-Id: <20210114125605.1227742-3-marcandre.lureau@redhat.com>
Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 meson.build | 16 ++++++++--------
 1 file changed, 8 insertions(+), 8 deletions(-)

diff --git a/meson.build b/meson.build
index 2001e941f4..e813814fb0 100644
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
@@ -1021,8 +1021,8 @@ if get_option('cfi')
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
2.26.2



