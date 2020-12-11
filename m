Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D34082D7D7D
	for <lists+qemu-devel@lfdr.de>; Fri, 11 Dec 2020 18:58:15 +0100 (CET)
Received: from localhost ([::1]:46620 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1knmgI-0003qL-L9
	for lists+qemu-devel@lfdr.de; Fri, 11 Dec 2020 12:58:14 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:51708)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1knlxn-0007Tb-Jq
 for qemu-devel@nongnu.org; Fri, 11 Dec 2020 12:12:15 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:25814)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1knlxa-0003QM-Cw
 for qemu-devel@nongnu.org; Fri, 11 Dec 2020 12:12:14 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1607706719;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=1qUKZ+UVd9ki5E9/zoYjUs6KjF7zZVzwOTSYwyUNGDA=;
 b=OD896sjYTwtxvHQGgjsnOBb8b9GH5ax9IycEoAu906AT97GMmafVyAX8rfnDPziw/bOnfE
 8RgJSE/5GMD/dxmBtjZux3O19FwJd9JwtQDPrIGjYhoT3Y1X09sg/9ffASkT24jnhCGdz1
 hWDQ6lJ9PhbJDji7xsqVRroHzFKJCjA=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-148-tT9e-m6MMkSClutfjXVxlA-1; Fri, 11 Dec 2020 12:11:57 -0500
X-MC-Unique: tT9e-m6MMkSClutfjXVxlA-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 0FAEB10054FF;
 Fri, 11 Dec 2020 17:11:56 +0000 (UTC)
Received: from blackfin.pond.sub.org (ovpn-112-103.ams2.redhat.com
 [10.36.112.103])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id D463C60BF1;
 Fri, 11 Dec 2020 17:11:55 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id BDC4C112F00E; Fri, 11 Dec 2020 18:11:52 +0100 (CET)
From: Markus Armbruster <armbru@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 10/20] block: Avoid qobject_get_try_str()
Date: Fri, 11 Dec 2020 18:11:42 +0100
Message-Id: <20201211171152.146877-11-armbru@redhat.com>
In-Reply-To: <20201211171152.146877-1-armbru@redhat.com>
References: <20201211171152.146877-1-armbru@redhat.com>
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
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: Kevin Wolf <kwolf@redhat.com>, mdroth@linux.vnet.ibm.com,
 qemu-block@nongnu.org, Max Reitz <mreitz@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

I'm about to remove qobject_get_try_str().  Use qstring_get_str()
instead.  Safe because the argument is known to be a QString here.

Cc: Kevin Wolf <kwolf@redhat.com>
Cc: Max Reitz <mreitz@redhat.com>
Cc: qemu-block@nongnu.org
Signed-off-by: Markus Armbruster <armbru@redhat.com>
---
 block.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/block.c b/block.c
index 487b2b1497..94d3a15081 100644
--- a/block.c
+++ b/block.c
@@ -4015,7 +4015,7 @@ static int bdrv_reopen_parse_backing(BDRVReopenState *reopen_state,
         new_backing_bs = NULL;
         break;
     case QTYPE_QSTRING:
-        str = qobject_get_try_str(value);
+        str = qstring_get_str(qobject_to(QString, value));
         new_backing_bs = bdrv_lookup_bs(NULL, str, errp);
         if (new_backing_bs == NULL) {
             return -EINVAL;
@@ -4278,8 +4278,8 @@ int bdrv_reopen_prepare(BDRVReopenState *reopen_state, BlockReopenQueue *queue,
                 }
 
                 if (child) {
-                    const char *str = qobject_get_try_str(new);
-                    if (!strcmp(child->bs->node_name, str)) {
+                    if (!strcmp(child->bs->node_name,
+                                qstring_get_str(qobject_to(QString, new)))) {
                         continue; /* Found child with this name, skip option */
                     }
                 }
-- 
2.26.2


