Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 627C621931D
	for <lists+qemu-devel@lfdr.de>; Thu,  9 Jul 2020 00:08:47 +0200 (CEST)
Received: from localhost ([::1]:42284 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jtIFC-0007DH-D1
	for lists+qemu-devel@lfdr.de; Wed, 08 Jul 2020 18:08:46 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36320)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1jtHik-0001Ox-Ld
 for qemu-devel@nongnu.org; Wed, 08 Jul 2020 17:35:15 -0400
Received: from us-smtp-delivery-1.mimecast.com ([207.211.31.120]:58616
 helo=us-smtp-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1jtHii-0002y8-58
 for qemu-devel@nongnu.org; Wed, 08 Jul 2020 17:35:14 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1594244110;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=wxQ2yhA8g+DB2Rc3EmGda0uH2h+VIzZRyz3jEXTcKSQ=;
 b=YIbFQR2FpbulccGTUXZ3UgJDFQqaw9zv81mt0Zjz04LNN3KDA+QWzODJBBgei1tn9PLFJe
 71YZ39096SKImKVgSBvMQkZr2ua2nbK5PDqTQKjcjpqMogvH1SLvFHV7D+93Z1OTDZZyKs
 25VV8uhCRUo/tOU7/XdZqXvnUlAM+NQ=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-363-W3h-_N8LN8mx88Tfo329-A-1; Tue, 07 Jul 2020 17:25:18 -0400
X-MC-Unique: W3h-_N8LN8mx88Tfo329-A-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 1BE7B800D5C;
 Tue,  7 Jul 2020 21:25:17 +0000 (UTC)
Received: from blackfin.pond.sub.org (ovpn-112-143.ams2.redhat.com
 [10.36.112.143])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id E18515C1D0;
 Tue,  7 Jul 2020 21:25:16 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id 49A7A1144257; Tue,  7 Jul 2020 23:25:04 +0200 (CEST)
From: Markus Armbruster <armbru@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 21/53] qom: Use error_reportf_err() instead of g_printerr() in
 examples
Date: Tue,  7 Jul 2020 23:24:31 +0200
Message-Id: <20200707212503.1495927-22-armbru@redhat.com>
In-Reply-To: <20200707212503.1495927-1-armbru@redhat.com>
References: <20200707212503.1495927-1-armbru@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=armbru@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=207.211.31.120; envelope-from=armbru@redhat.com;
 helo=us-smtp-1.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/07/07 17:25:10
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -40
X-Spam_score: -4.1
X-Spam_bar: ----
X-Spam_report: (-4.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-1, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Signed-off-by: Markus Armbruster <armbru@redhat.com>
Reviewed-by: Eric Blake <eblake@redhat.com>
Reviewed-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
Message-Id: <20200707160613.848843-22-armbru@redhat.com>
---
 include/qom/object.h | 6 ++----
 1 file changed, 2 insertions(+), 4 deletions(-)

diff --git a/include/qom/object.h b/include/qom/object.h
index 94a61ccc3f..b70edd8cd9 100644
--- a/include/qom/object.h
+++ b/include/qom/object.h
@@ -671,8 +671,7 @@ Object *object_new(const char *typename);
  *                               NULL);
  *
  *   if (!obj) {
- *     g_printerr("Cannot create memory backend: %s\n",
- *                error_get_pretty(err));
+ *     error_reportf_err(err, "Cannot create memory backend: ");
  *   }
  *   </programlisting>
  * </example>
@@ -739,8 +738,7 @@ void object_apply_compat_props(Object *obj);
  *                          NULL);
  *
  *   if (!obj) {
- *     g_printerr("Cannot set properties: %s\n",
- *                error_get_pretty(err));
+ *     error_reportf_err(err, "Cannot set properties: ");
  *   }
  *   </programlisting>
  * </example>
-- 
2.26.2


