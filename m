Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7461A64040B
	for <lists+qemu-devel@lfdr.de>; Fri,  2 Dec 2022 11:06:35 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p12v8-0003VL-Po; Fri, 02 Dec 2022 05:05:26 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1p12v5-0003UI-5U
 for qemu-devel@nongnu.org; Fri, 02 Dec 2022 05:05:23 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1p12v2-0002Fn-N5
 for qemu-devel@nongnu.org; Fri, 02 Dec 2022 05:05:22 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1669975520;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Cr/IYj3mjE/aHUSid9+YdaoMQzgu194VeyuDMg7Ubr8=;
 b=RXMo33+O7nWYEzJ50BbkqGpNnbyB2hrRt2A02UZ+n4MA2JZNI/23caBJmBODOpTsmFuBgW
 lsK5RH4W5M6iAPxkDHT7cXY/xuSJWbdvO3+vgjQqOP00T+aoSSYHZ2q+L66B5WEBJwIboN
 wkTTACrLIiYk02gr+XErDWT/MfeMVV8=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-554-jABJsE_nMvOjtcwLisBSow-1; Fri, 02 Dec 2022 05:05:16 -0500
X-MC-Unique: jABJsE_nMvOjtcwLisBSow-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.rdu2.redhat.com
 [10.11.54.8])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 5D92A3C025BC;
 Fri,  2 Dec 2022 10:05:16 +0000 (UTC)
Received: from blackfin.pond.sub.org (unknown [10.39.192.19])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 2AC1BC1908B;
 Fri,  2 Dec 2022 10:05:16 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id EAC1D21E6681; Fri,  2 Dec 2022 11:05:12 +0100 (CET)
From: Markus Armbruster <armbru@redhat.com>
To: qemu-devel@nongnu.org
Cc: kraxel@redhat.com, dgilbert@redhat.com, berrange@redhat.com,
 philmd@linaro.org
Subject: [PATCH v2 04/14] Revert "hmp: info spice: take out webdav"
Date: Fri,  2 Dec 2022 11:05:02 +0100
Message-Id: <20221202100512.4161901-5-armbru@redhat.com>
In-Reply-To: <20221202100512.4161901-1-armbru@redhat.com>
References: <20221202100512.4161901-1-armbru@redhat.com>
MIME-Version: 1.0
Content-type: text/plain
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.8
Received-SPF: pass client-ip=170.10.133.124; envelope-from=armbru@redhat.com;
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

This reverts commit 7c6044a94e52db8aef9a71d616c7a0914adb71ab.

We had to take it out because SPICE_CHANNEL_WEBDAV requires
spice-protocol 0.12.7, but we had only 0.12.3.  We have 0.14.0 now, so
put it back in.

Signed-off-by: Markus Armbruster <armbru@redhat.com>
---
 monitor/hmp-cmds.c | 5 -----
 1 file changed, 5 deletions(-)

diff --git a/monitor/hmp-cmds.c b/monitor/hmp-cmds.c
index a7c9ae2520..7360ed71a6 100644
--- a/monitor/hmp-cmds.c
+++ b/monitor/hmp-cmds.c
@@ -626,12 +626,7 @@ void hmp_info_spice(Monitor *mon, const QDict *qdict)
         [SPICE_CHANNEL_SMARTCARD] = "smartcard",
         [SPICE_CHANNEL_USBREDIR] = "usbredir",
         [SPICE_CHANNEL_PORT] = "port",
-#if 0
-        /* minimum spice-protocol is 0.12.3, webdav was added in 0.12.7,
-         * no easy way to #ifdef (SPICE_CHANNEL_* is a enum).  Disable
-         * as quick fix for build failures with older versions. */
         [SPICE_CHANNEL_WEBDAV] = "webdav",
-#endif
     };
 
     info = qmp_query_spice(NULL);
-- 
2.37.3


