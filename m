Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [IPv6:2001:470:142::17])
	by mail.lfdr.de (Postfix) with ESMTPS id 68B851C5B3E
	for <lists+qemu-devel@lfdr.de>; Tue,  5 May 2020 17:32:27 +0200 (CEST)
Received: from localhost ([::1]:48102 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jVzYY-0005Cd-CQ
	for lists+qemu-devel@lfdr.de; Tue, 05 May 2020 11:32:26 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45960)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1jVzVo-0003Jz-1B
 for qemu-devel@nongnu.org; Tue, 05 May 2020 11:29:36 -0400
Received: from us-smtp-1.mimecast.com ([207.211.31.81]:53135
 helo=us-smtp-delivery-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1jVzVl-0007Qb-GL
 for qemu-devel@nongnu.org; Tue, 05 May 2020 11:29:35 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1588692572;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=qJSrLVvjDTVg1XFdetvzYSjvKRLzEDahkF7hmIqY9c4=;
 b=RXGYMbFkA+28oIY9t0nNlHnpsme0zp0TzXsyPInWcRayBKge6uiDNNqMh59MOrpKqXl35D
 1Kt4XTLBZuZTvwUCE6T0w4ooFnp5HiaOgbD4uLUkLTcGrN7nJWKn+Nv8vkJ7Zs4Rgxnfg7
 jjJB3B3ALAbq7Cv29wz9mjPrPz/b9mg=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-301-l0ODgHXROYWxO3W9vxyzOQ-1; Tue, 05 May 2020 11:29:30 -0400
X-MC-Unique: l0ODgHXROYWxO3W9vxyzOQ-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 7C91018FE864
 for <qemu-devel@nongnu.org>; Tue,  5 May 2020 15:29:29 +0000 (UTC)
Received: from blackfin.pond.sub.org (ovpn-113-6.ams2.redhat.com [10.36.113.6])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 488C05D9D5;
 Tue,  5 May 2020 15:29:29 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id 522AA11358C7; Tue,  5 May 2020 17:29:26 +0200 (CEST)
From: Markus Armbruster <armbru@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 11/18] e1000: Don't run e1000_instance_init() twice
Date: Tue,  5 May 2020 17:29:19 +0200
Message-Id: <20200505152926.18877-12-armbru@redhat.com>
In-Reply-To: <20200505152926.18877-1-armbru@redhat.com>
References: <20200505152926.18877-1-armbru@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=207.211.31.81; envelope-from=armbru@redhat.com;
 helo=us-smtp-delivery-1.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/05/05 00:37:19
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001,
 SPF_PASS=-0.001 autolearn=_AUTOLEARN
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
Cc: berrange@redhat.com, ehabkost@redhat.com, philmd@redhat.com,
 Jason Wang <jasowang@redhat.com>, pbonzini@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

QOM object initialization runs .instance_init() for the type and all
its supertypes; see object_init_with_type().

Both TYPE_E1000_BASE and its concrete subtypes set .instance_init() to
e1000_instance_init().  For the concrete subtypes, it duly gets run
twice.  The second run fails, but the error gets ignored (a later
commit will change that).

Remove it from the subtypes.

Cc: Jason Wang <jasowang@redhat.com>
Signed-off-by: Markus Armbruster <armbru@redhat.com>
Acked-by: Jason Wang <jasowang@redhat.com>
Reviewed-by: Paolo Bonzini <pbonzini@redhat.com>
---
 hw/net/e1000.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/hw/net/e1000.c b/hw/net/e1000.c
index 2a69eee63f..0d2c2759e3 100644
--- a/hw/net/e1000.c
+++ b/hw/net/e1000.c
@@ -1824,7 +1824,6 @@ static void e1000_register_types(void)
         type_info.parent =3D TYPE_E1000_BASE;
         type_info.class_data =3D (void *)info;
         type_info.class_init =3D e1000_class_init;
-        type_info.instance_init =3D e1000_instance_init;
=20
         type_register(&type_info);
     }
--=20
2.21.1


