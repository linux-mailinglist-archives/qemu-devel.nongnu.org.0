Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D01674CDD22
	for <lists+qemu-devel@lfdr.de>; Fri,  4 Mar 2022 20:07:46 +0100 (CET)
Received: from localhost ([::1]:41532 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nQDHF-0002Qr-Sx
	for lists+qemu-devel@lfdr.de; Fri, 04 Mar 2022 14:07:45 -0500
Received: from eggs.gnu.org ([209.51.188.92]:52292)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1nQDAU-0005W3-U8
 for qemu-devel@nongnu.org; Fri, 04 Mar 2022 14:00:55 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:25408)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1nQDAQ-0000we-PL
 for qemu-devel@nongnu.org; Fri, 04 Mar 2022 14:00:43 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1646420442;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=J+4zVysEcH5X9wYmMvh9Z1fHPc+GKyI+QDU8VO1cPfw=;
 b=KDqXccE32g/pFNT1kqMNZUPgg3A/qLfC8Qg01cEi65oEzNVek7LES+TVmDxf/RlBnTnSWG
 1ubobG5mmxUxJWoFKpvwQdWzmezH/lqyk0fT/Z9+A2qCmzTGhjKua8twm4ePlvxsz66UEA
 6/CSii2UkxJm5NxP0iF5r0iFxaKrDwM=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-371--bIecGZjPkypCClaxtWDqw-1; Fri, 04 Mar 2022 14:00:41 -0500
X-MC-Unique: -bIecGZjPkypCClaxtWDqw-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 3C8C1824FA7;
 Fri,  4 Mar 2022 19:00:40 +0000 (UTC)
Received: from localhost.localdomain.com (unknown [10.39.194.222])
 by smtp.corp.redhat.com (Postfix) with ESMTP id A735987B90;
 Fri,  4 Mar 2022 18:59:28 +0000 (UTC)
From: =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 5/8] softmmu: refactor use of is_daemonized() method
Date: Fri,  4 Mar 2022 18:56:17 +0000
Message-Id: <20220304185620.3272401-6-berrange@redhat.com>
In-Reply-To: <20220304185620.3272401-1-berrange@redhat.com>
References: <20220304185620.3272401-1-berrange@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=berrange@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=berrange@redhat.com;
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
Cc: Kevin Wolf <kwolf@redhat.com>,
 =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 libvir-list@redhat.com, Stefan Weil <sw@weilnetz.de>,
 Hanna Reitz <hreitz@redhat.com>, Gerd Hoffmann <kraxel@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
 Eric Blake <eblake@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Use of the is_daemonized() method is isolated to allow it to be
more easily eliminated in a future change.

Signed-off-by: Daniel P. Berrangé <berrange@redhat.com>
---
 softmmu/vl.c | 13 +++++++------
 1 file changed, 7 insertions(+), 6 deletions(-)

diff --git a/softmmu/vl.c b/softmmu/vl.c
index f6f33e15e4..30342b9df2 100644
--- a/softmmu/vl.c
+++ b/softmmu/vl.c
@@ -1371,11 +1371,11 @@ static void qemu_disable_default_devices(void)
     }
 }
 
-static void qemu_create_default_devices(void)
+static void qemu_create_default_devices(bool daemonize)
 {
     MachineClass *machine_class = MACHINE_GET_CLASS(current_machine);
 
-    if (is_daemonized()) {
+    if (daemonize) {
         /* According to documentation and historically, -nographic redirects
          * serial port, parallel port and monitor to stdio, which does not work
          * with -daemonize.  We can redirect these to null instead, but since
@@ -2455,7 +2455,8 @@ static void create_default_memdev(MachineState *ms, const char *path)
                             &error_fatal);
 }
 
-static void qemu_validate_options(const QDict *machine_opts)
+static void qemu_validate_options(const QDict *machine_opts,
+                                  bool daemonize)
 {
     const char *kernel_filename = qdict_get_try_str(machine_opts, "kernel");
     const char *initrd_filename = qdict_get_try_str(machine_opts, "initrd");
@@ -2484,7 +2485,7 @@ static void qemu_validate_options(const QDict *machine_opts)
     }
 
 #ifdef CONFIG_CURSES
-    if (is_daemonized() && dpy.type == DISPLAY_TYPE_CURSES) {
+    if (daemonize && dpy.type == DISPLAY_TYPE_CURSES) {
         error_report("curses display cannot be used with -daemonize");
         exit(1);
     }
@@ -3676,7 +3677,7 @@ void qemu_init(int argc, char **argv, char **envp)
      */
     loc_set_none();
 
-    qemu_validate_options(machine_opts_dict);
+    qemu_validate_options(machine_opts_dict, is_daemonized());
     qemu_process_sugar_options();
 
     /*
@@ -3714,7 +3715,7 @@ void qemu_init(int argc, char **argv, char **envp)
     suspend_mux_open();
 
     qemu_disable_default_devices();
-    qemu_create_default_devices();
+    qemu_create_default_devices(is_daemonized());
     qemu_create_early_backends();
 
     qemu_apply_legacy_machine_options(machine_opts_dict);
-- 
2.34.1


