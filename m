Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 13B1D207984
	for <lists+qemu-devel@lfdr.de>; Wed, 24 Jun 2020 18:50:42 +0200 (CEST)
Received: from localhost ([::1]:36364 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jo8bh-0005Vi-2G
	for lists+qemu-devel@lfdr.de; Wed, 24 Jun 2020 12:50:41 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51558)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1jo8VJ-0003JC-RO
 for qemu-devel@nongnu.org; Wed, 24 Jun 2020 12:44:05 -0400
Received: from us-smtp-1.mimecast.com ([207.211.31.81]:33270
 helo=us-smtp-delivery-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1jo8V9-00055U-M6
 for qemu-devel@nongnu.org; Wed, 24 Jun 2020 12:44:05 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1593017034;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=P0AHVl1NXCoWOD9ba4irxaJ4QkaxyeIhpI2MHx+auEo=;
 b=jTBGDimJlDIrL9X4SjzUDLOe0SjxZe0Cr9kk7MuUcUMeaAVWey5ecGEBufnm55M7TvLu/P
 eQlFQK3OzoyVs3UAjfyFWRFiMdMYsUsR4uq+TtuBuS2/pebHbxNhX2r1nDXh1TqAD/h3RR
 eLRyJ6FZP7ssyhQD1q+w/Jpwoy3zuhc=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-307-WiyeQZgGOO29BZW6JMsDJg-1; Wed, 24 Jun 2020 12:43:52 -0400
X-MC-Unique: WiyeQZgGOO29BZW6JMsDJg-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id EBD8C18585A5;
 Wed, 24 Jun 2020 16:43:50 +0000 (UTC)
Received: from blackfin.pond.sub.org (ovpn-112-121.ams2.redhat.com
 [10.36.112.121])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id B6C6B60F8A;
 Wed, 24 Jun 2020 16:43:50 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id 54953113848C; Wed, 24 Jun 2020 18:43:45 +0200 (CEST)
From: Markus Armbruster <armbru@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 31/46] qom: Use error_reportf_err() instead of g_printerr() in
 examples
Date: Wed, 24 Jun 2020 18:43:29 +0200
Message-Id: <20200624164344.3778251-32-armbru@redhat.com>
In-Reply-To: <20200624164344.3778251-1-armbru@redhat.com>
References: <20200624164344.3778251-1-armbru@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=207.211.31.81; envelope-from=armbru@redhat.com;
 helo=us-smtp-delivery-1.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/06/24 01:59:40
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -30
X-Spam_score: -3.1
X-Spam_bar: ---
X-Spam_report: (-3.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H3=-0.01, RCVD_IN_MSPIKE_WL=-0.01,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=_AUTOLEARN
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
Cc: peter.maydell@linaro.org, vsementsov@virtuozzo.com, berrange@redhat.com,
 ehabkost@redhat.com, qemu-block@nongnu.org, pbonzini@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Signed-off-by: Markus Armbruster <armbru@redhat.com>
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


