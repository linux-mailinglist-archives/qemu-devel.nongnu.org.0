Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B1E97673A5B
	for <lists+qemu-devel@lfdr.de>; Thu, 19 Jan 2023 14:34:23 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pIUxK-0005vm-4D; Thu, 19 Jan 2023 08:27:50 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1pIUx3-0005qJ-89
 for qemu-devel@nongnu.org; Thu, 19 Jan 2023 08:27:33 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1pIUww-0008Bx-Fu
 for qemu-devel@nongnu.org; Thu, 19 Jan 2023 08:27:32 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1674134836;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=xLm6IsVhlrtzGfoVZhY9vYsYrlTeajP4fhZ9jGQSaUE=;
 b=BOxxDZrccCM176Mk1RJX3yefXj2thb0hsVf2ia90in/BRCsnFCNUpjwrXs/7x/EEgTbvep
 rh2P6WiZo0HTKG1GwBQtzhF1ouxhBqLrNIh8J7tnytp0ZcoEZbEXZ6WiFukZBgjEvg2W9l
 8jYWBeYs5SJVNK00tl6KO3UwDGUXU7k=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-261-KyYB7tFhNiOeD-TIaqHK2g-1; Thu, 19 Jan 2023 08:27:14 -0500
X-MC-Unique: KyYB7tFhNiOeD-TIaqHK2g-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.rdu2.redhat.com
 [10.11.54.8])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 9D0D91C0A5AE;
 Thu, 19 Jan 2023 13:27:14 +0000 (UTC)
Received: from blackfin.pond.sub.org (unknown [10.39.192.70])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 7059DC158BA;
 Thu, 19 Jan 2023 13:27:14 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id 5595F21E6681; Thu, 19 Jan 2023 14:27:13 +0100 (CET)
From: Markus Armbruster <armbru@redhat.com>
To: qemu-devel@nongnu.org
Cc: peter.maydell@linaro.org,
 =?UTF-8?q?Daniel=20P=20=2E=20Berrang=C3=A9?= <berrange@redhat.com>
Subject: [PULL 04/17] Revert "hmp: info spice: take out webdav"
Date: Thu, 19 Jan 2023 14:27:00 +0100
Message-Id: <20230119132713.3493556-5-armbru@redhat.com>
In-Reply-To: <20230119132713.3493556-1-armbru@redhat.com>
References: <20230119132713.3493556-1-armbru@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.8
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

This reverts commit 7c6044a94e52db8aef9a71d616c7a0914adb71ab.

We had to take it out because SPICE_CHANNEL_WEBDAV requires
spice-protocol 0.12.7, but we had only 0.12.3.  We have 0.14.0 now, so
put it back in.

Signed-off-by: Markus Armbruster <armbru@redhat.com>
Reviewed-by: Daniel P. Berrangé <berrange@redhat.com>
Message-Id: <20230109190321.1056914-5-armbru@redhat.com>
---
 monitor/hmp-cmds.c | 5 -----
 1 file changed, 5 deletions(-)

diff --git a/monitor/hmp-cmds.c b/monitor/hmp-cmds.c
index 9947ff0b45..67e39f408e 100644
--- a/monitor/hmp-cmds.c
+++ b/monitor/hmp-cmds.c
@@ -622,12 +622,7 @@ void hmp_info_spice(Monitor *mon, const QDict *qdict)
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
2.39.0


