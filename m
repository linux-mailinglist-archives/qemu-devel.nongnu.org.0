Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id EE05763E9AF
	for <lists+qemu-devel@lfdr.de>; Thu,  1 Dec 2022 07:14:39 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p0coz-0005f1-Vj; Thu, 01 Dec 2022 01:13:22 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1p0cox-0005e7-3g
 for qemu-devel@nongnu.org; Thu, 01 Dec 2022 01:13:19 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1p0cov-0005lW-Mh
 for qemu-devel@nongnu.org; Thu, 01 Dec 2022 01:13:18 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1669875196;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=yU9CQzTNwyegt6aMM4ArVHYH5uDT6h6ZXWrpMhPsUy8=;
 b=eDA36HglGXDZ4UtO5VQIW0gUCSKjXXwTXVMO26l2ND6HJA8dGbgkRj+CgiafA57CzKeV4o
 P2Kdy3oammvxrv1cfRO8kIkhRxOEROf5fpbukMetZSa5nDoPmCci6Gcx32JTbCZiXje1UT
 V13LDB9vvOTp4EK8AhMyYUc64IC83OU=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-77-WnLoALm-OLy7H5sWj6HJEw-1; Thu, 01 Dec 2022 01:13:15 -0500
X-MC-Unique: WnLoALm-OLy7H5sWj6HJEw-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.rdu2.redhat.com
 [10.11.54.1])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 4BC0D185A7A3
 for <qemu-devel@nongnu.org>; Thu,  1 Dec 2022 06:13:15 +0000 (UTC)
Received: from blackfin.pond.sub.org (unknown [10.39.192.19])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 2145E40C2064;
 Thu,  1 Dec 2022 06:13:15 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id E4DDA21E6936; Thu,  1 Dec 2022 07:13:11 +0100 (CET)
From: Markus Armbruster <armbru@redhat.com>
To: qemu-devel@nongnu.org
Cc: kraxel@redhat.com,
	dgilbert@redhat.com
Subject: [PATCH 3/9] ui: Drop disabled code for SPICE_CHANNEL_WEBDAV
Date: Thu,  1 Dec 2022 07:13:05 +0100
Message-Id: <20221201061311.3619052-4-armbru@redhat.com>
In-Reply-To: <20221201061311.3619052-1-armbru@redhat.com>
References: <20221201061311.3619052-1-armbru@redhat.com>
MIME-Version: 1.0
Content-type: text/plain
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.1
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

HMP "info spice" has a bit of code to show channel type
SPICE_CHANNEL_WEBDAV as "webdav", disabled since commit 7c6044a94e
"hmp: info spice: take out webdav" (v2.3.0), because it compiles only
with Spice versions 0.12.7 and later.  Our minimum version is 0.12.5.

Looks like nobody minded in more than seven years.  Drop it, so that
checkpatch.pl won't complain when I move the code.

Signed-off-by: Markus Armbruster <armbru@redhat.com>
---
 monitor/hmp-cmds.c | 6 ------
 1 file changed, 6 deletions(-)

diff --git a/monitor/hmp-cmds.c b/monitor/hmp-cmds.c
index a7c9ae2520..86dd961462 100644
--- a/monitor/hmp-cmds.c
+++ b/monitor/hmp-cmds.c
@@ -626,12 +626,6 @@ void hmp_info_spice(Monitor *mon, const QDict *qdict)
         [SPICE_CHANNEL_SMARTCARD] = "smartcard",
         [SPICE_CHANNEL_USBREDIR] = "usbredir",
         [SPICE_CHANNEL_PORT] = "port",
-#if 0
-        /* minimum spice-protocol is 0.12.3, webdav was added in 0.12.7,
-         * no easy way to #ifdef (SPICE_CHANNEL_* is a enum).  Disable
-         * as quick fix for build failures with older versions. */
-        [SPICE_CHANNEL_WEBDAV] = "webdav",
-#endif
     };
 
     info = qmp_query_spice(NULL);
-- 
2.37.3


