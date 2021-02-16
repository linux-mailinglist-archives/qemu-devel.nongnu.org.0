Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id F082431D052
	for <lists+qemu-devel@lfdr.de>; Tue, 16 Feb 2021 19:41:03 +0100 (CET)
Received: from localhost ([::1]:45952 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lC5HS-0005mc-V8
	for lists+qemu-devel@lfdr.de; Tue, 16 Feb 2021 13:41:02 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:36950)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgilbert@redhat.com>)
 id 1lC5EL-0004Ij-Tf
 for qemu-devel@nongnu.org; Tue, 16 Feb 2021 13:37:49 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:56039)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <dgilbert@redhat.com>)
 id 1lC5EK-0000FD-Cy
 for qemu-devel@nongnu.org; Tue, 16 Feb 2021 13:37:49 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1613500667;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=FNvmS0UWbR7X+p3y1CzZeP+tJAcsEHGhsUwUX4tpClw=;
 b=Z1V42g++zkMhW6Q73rnXrTO9c/4HeE++jyqr0P9lyDbcT2wDe1K8Z87XIi+Av7kmlYuxRS
 yv5R6Qoysu86UaOOXi/pQR2WZO53ABktQvFYZrIKT3/GRStMCiIdk19an9546MkXlTeuwM
 /bxP05GCiNAO9F2h7fLnY9ndd1ayRHU=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-290-WRc5bQAiPciWIRQhwGaBQg-1; Tue, 16 Feb 2021 13:37:45 -0500
X-MC-Unique: WRc5bQAiPciWIRQhwGaBQg-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id E996F100CCC0;
 Tue, 16 Feb 2021 18:37:44 +0000 (UTC)
Received: from dgilbert-t580.localhost (ovpn-115-109.ams2.redhat.com
 [10.36.115.109])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 914495C1B4;
 Tue, 16 Feb 2021 18:37:43 +0000 (UTC)
From: "Dr. David Alan Gilbert (git)" <dgilbert@redhat.com>
To: qemu-devel@nongnu.org, wainersm@redhat.com, groug@kaod.org,
 philmd@redhat.com, vgoyal@redhat.com
Subject: [PULL 1/6] virtiofsd: Allow to build it without the tools
Date: Tue, 16 Feb 2021 18:37:29 +0000
Message-Id: <20210216183734.57810-2-dgilbert@redhat.com>
In-Reply-To: <20210216183734.57810-1-dgilbert@redhat.com>
References: <20210216183734.57810-1-dgilbert@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=dgilbert@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=63.128.21.124; envelope-from=dgilbert@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
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
Cc: virtio-fs@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Wainer dos Santos Moschetta <wainersm@redhat.com>

This changed the Meson build script to allow virtiofsd be built even
though the tools build is disabled, thus honoring the --enable-virtiofsd
option.

Fixes: cece116c939d219070b250338439c2d16f94e3da (configure: add option for virtiofsd)
Signed-off-by: Wainer dos Santos Moschetta <wainersm@redhat.com>
Message-Id: <20210201211456.1133364-2-wainersm@redhat.com>
Reviewed-by: Misono Tomohiro <misono.tomohiro@jp.fujitsu.com>
Reviewed-by: Stefan Hajnoczi <stefanha@redhat.com>
Signed-off-by: Dr. David Alan Gilbert <dgilbert@redhat.com>
---
 tools/meson.build | 7 +++++--
 1 file changed, 5 insertions(+), 2 deletions(-)

diff --git a/tools/meson.build b/tools/meson.build
index fdce66857d..3e5a0abfa2 100644
--- a/tools/meson.build
+++ b/tools/meson.build
@@ -10,8 +10,11 @@ if get_option('virtiofsd').enabled()
       error('virtiofsd requires Linux')
     elif not seccomp.found() or not libcap_ng.found()
       error('virtiofsd requires libcap-ng-devel and seccomp-devel')
-    elif not have_tools or 'CONFIG_VHOST_USER' not in config_host
-      error('virtiofsd needs tools and vhost-user support')
+    elif 'CONFIG_VHOST_USER' not in config_host
+      error('virtiofsd needs vhost-user support')
+    else
+      # Disabled all the tools but virtiofsd.
+      have_virtiofsd = true
     endif
   endif
 elif get_option('virtiofsd').disabled() or not have_system
-- 
2.29.2


