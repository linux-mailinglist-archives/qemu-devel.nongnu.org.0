Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BE2312B1734
	for <lists+qemu-devel@lfdr.de>; Fri, 13 Nov 2020 09:28:25 +0100 (CET)
Received: from localhost ([::1]:51432 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kdURU-0007xS-IR
	for lists+qemu-devel@lfdr.de; Fri, 13 Nov 2020 03:28:24 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:37248)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1kdUPn-0006HW-UT
 for qemu-devel@nongnu.org; Fri, 13 Nov 2020 03:26:40 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:53289)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1kdUPk-0005kX-Sm
 for qemu-devel@nongnu.org; Fri, 13 Nov 2020 03:26:39 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1605255995;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=3jma4QtDqnnw5CZ+n3iJCqfwEu8f61MFPver8SLf20g=;
 b=HrGPc/ckREkPm1WViKw9J8Nr9hjLgylWNbnV/pM1RbTQo6GUFq3VT4XeRwSHbig0/jMar1
 49Yi+vVS9tk1q42SxC2nzPG8ooZfwG88oQk6gPwfqPUp6W31PrImr2RYLeKNFWlsGaIfhg
 YRIQUz0Jrknaj5IH27KmLeaTDaKXAA8=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-488-wybjaIZgNyGLSvCQyY07ng-1; Fri, 13 Nov 2020 03:26:33 -0500
X-MC-Unique: wybjaIZgNyGLSvCQyY07ng-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 8E92210082E5
 for <qemu-devel@nongnu.org>; Fri, 13 Nov 2020 08:26:32 +0000 (UTC)
Received: from blackfin.pond.sub.org (ovpn-112-103.ams2.redhat.com
 [10.36.112.103])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 93C5760BE2;
 Fri, 13 Nov 2020 08:26:29 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id 917EB11385CA; Fri, 13 Nov 2020 09:26:26 +0100 (CET)
From: Markus Armbruster <armbru@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 05/10] ui: Improve a client_migrate_info error message
Date: Fri, 13 Nov 2020 09:26:21 +0100
Message-Id: <20201113082626.2725812-6-armbru@redhat.com>
In-Reply-To: <20201113082626.2725812-1-armbru@redhat.com>
References: <20201113082626.2725812-1-armbru@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=armbru@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=63.128.21.124; envelope-from=armbru@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/11/12 16:09:27
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H5=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: Gerd Hoffmann <kraxel@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

client_migrate_info reports spice_server_migrate_connect() failure as
"An undefined error has occurred".  Improve to "Could not set up
display for migration".

QERR_UNDEFINED_ERROR is now unused.  Drop.

Cc: Gerd Hoffmann <kraxel@redhat.com>
Signed-off-by: Markus Armbruster <armbru@redhat.com>
---
 include/qapi/qmp/qerror.h | 3 ---
 monitor/misc.c            | 2 +-
 2 files changed, 1 insertion(+), 4 deletions(-)

diff --git a/include/qapi/qmp/qerror.h b/include/qapi/qmp/qerror.h
index d8267129bc..596fce0c54 100644
--- a/include/qapi/qmp/qerror.h
+++ b/include/qapi/qmp/qerror.h
@@ -65,9 +65,6 @@
 #define QERR_REPLAY_NOT_SUPPORTED \
     "Record/replay feature is not supported for '%s'"
 
-#define QERR_UNDEFINED_ERROR \
-    "An undefined error has occurred"
-
 #define QERR_UNSUPPORTED \
     "this feature or command is not currently supported"
 
diff --git a/monitor/misc.c b/monitor/misc.c
index 9aa2505cfa..f0d3d41753 100644
--- a/monitor/misc.c
+++ b/monitor/misc.c
@@ -441,7 +441,7 @@ void qmp_client_migrate_info(const char *protocol, const char *hostname,
                                     has_port ? port : -1,
                                     has_tls_port ? tls_port : -1,
                                     cert_subject)) {
-            error_setg(errp, QERR_UNDEFINED_ERROR);
+            error_setg(errp, "Could not set up display for migration");
             return;
         }
         return;
-- 
2.26.2


