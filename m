Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E9811662FDB
	for <lists+qemu-devel@lfdr.de>; Mon,  9 Jan 2023 20:05:18 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pExRk-0004rU-2p; Mon, 09 Jan 2023 14:04:36 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1pExQl-0003ww-V2
 for qemu-devel@nongnu.org; Mon, 09 Jan 2023 14:03:38 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1pExQh-0001Hk-QL
 for qemu-devel@nongnu.org; Mon, 09 Jan 2023 14:03:34 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1673291004;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=xR537m9WRO2ahsrbYoPqDxcs+cU2uG/AJ3h4T0n/E6Q=;
 b=R+5UEoHb0I6myW4kiLhL3Pd+xTdZXlbHMcyJ+3S/asqZSBUSniTK9rb1Qy2sKfQcPmwpxt
 jWVgtDSjJ7fiO8cQkckL12I8O6lOd+oti6fLu0YA9Am8+18GVo/pK15zXaSkkyfBndRnHW
 cMaAB/XwRsvlejqQDkAs/Y7H4iYVtGY=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-649-xacOnqKlOgSKjz2z1ndArQ-1; Mon, 09 Jan 2023 14:03:23 -0500
X-MC-Unique: xacOnqKlOgSKjz2z1ndArQ-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.rdu2.redhat.com
 [10.11.54.3])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 03864857F82;
 Mon,  9 Jan 2023 19:03:23 +0000 (UTC)
Received: from blackfin.pond.sub.org (unknown [10.39.192.78])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id C3E201121319;
 Mon,  9 Jan 2023 19:03:22 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id 8E76021E5DF9; Mon,  9 Jan 2023 20:03:21 +0100 (CET)
From: Markus Armbruster <armbru@redhat.com>
To: qemu-devel@nongnu.org
Cc: kraxel@redhat.com, dgilbert@redhat.com, berrange@redhat.com,
 philmd@linaro.org
Subject: [PATCH v4 03/17] ui/spice: Require spice-protocol >= 0.14.0
Date: Mon,  9 Jan 2023 20:03:07 +0100
Message-Id: <20230109190321.1056914-4-armbru@redhat.com>
In-Reply-To: <20230109190321.1056914-1-armbru@redhat.com>
References: <20230109190321.1056914-1-armbru@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.3
Received-SPF: pass client-ip=170.10.129.124; envelope-from=armbru@redhat.com;
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

Version 0.14.0 is now old enough to have made it into the major
distributions:

   Debian 11: 0.14.3
   RHEL-8: 0.14.2
   FreeBSD (ports): 0.14.4
   Fedora 35: 0.14.0
   Ubuntu 20.04: 0.14.0
   OpenSUSE Leap 15.3: 0.14.3

Requiring it lets us drop two version checks in ui/vdagent.c.  It also
enables the next commit.

Signed-off-by: Markus Armbruster <armbru@redhat.com>
Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>
Reviewed-by: Daniel P. Berrangé <berrange@redhat.com>
---
 meson.build  | 2 +-
 ui/vdagent.c | 4 ----
 2 files changed, 1 insertion(+), 5 deletions(-)

diff --git a/meson.build b/meson.build
index 175517eafd..8fabfbcf95 100644
--- a/meson.build
+++ b/meson.build
@@ -742,7 +742,7 @@ endif
 
 spice_protocol = not_found
 if not get_option('spice_protocol').auto() or have_system
-  spice_protocol = dependency('spice-protocol', version: '>=0.12.3',
+  spice_protocol = dependency('spice-protocol', version: '>=0.14.0',
                               required: get_option('spice_protocol'),
                               method: 'pkg-config', kwargs: static_kwargs)
 endif
diff --git a/ui/vdagent.c b/ui/vdagent.c
index 4bf50f0c4d..1f51a78da1 100644
--- a/ui/vdagent.c
+++ b/ui/vdagent.c
@@ -87,9 +87,7 @@ static const char *cap_name[] = {
     [VD_AGENT_CAP_MONITORS_CONFIG_POSITION]       = "monitors-config-position",
     [VD_AGENT_CAP_FILE_XFER_DISABLED]             = "file-xfer-disabled",
     [VD_AGENT_CAP_FILE_XFER_DETAILED_ERRORS]      = "file-xfer-detailed-errors",
-#if CHECK_SPICE_PROTOCOL_VERSION(0, 14, 0)
     [VD_AGENT_CAP_GRAPHICS_DEVICE_INFO]           = "graphics-device-info",
-#endif
 #if CHECK_SPICE_PROTOCOL_VERSION(0, 14, 1)
     [VD_AGENT_CAP_CLIPBOARD_NO_RELEASE_ON_REGRAB] = "clipboard-no-release-on-regrab",
     [VD_AGENT_CAP_CLIPBOARD_GRAB_SERIAL]          = "clipboard-grab-serial",
@@ -112,9 +110,7 @@ static const char *msg_name[] = {
     [VD_AGENT_CLIENT_DISCONNECTED]   = "client-disconnected",
     [VD_AGENT_MAX_CLIPBOARD]         = "max-clipboard",
     [VD_AGENT_AUDIO_VOLUME_SYNC]     = "audio-volume-sync",
-#if CHECK_SPICE_PROTOCOL_VERSION(0, 14, 0)
     [VD_AGENT_GRAPHICS_DEVICE_INFO]  = "graphics-device-info",
-#endif
 };
 
 static const char *sel_name[] = {
-- 
2.39.0


