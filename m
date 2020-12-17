Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7A2202DD514
	for <lists+qemu-devel@lfdr.de>; Thu, 17 Dec 2020 17:22:06 +0100 (CET)
Received: from localhost ([::1]:51094 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kpw2X-0004ME-FI
	for lists+qemu-devel@lfdr.de; Thu, 17 Dec 2020 11:22:05 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:52886)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1kpw0j-0002De-26
 for qemu-devel@nongnu.org; Thu, 17 Dec 2020 11:20:14 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:42721)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1kpw0f-0005OT-Hb
 for qemu-devel@nongnu.org; Thu, 17 Dec 2020 11:20:12 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1608222008;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=J5xipQoiZyhst2PWZKkX5026CZ2plgc4fBm1WPl4xuY=;
 b=Ag0uUhoqwpCFqYizRbSXt+rS8YiH6ZykZ5543z9vPAOEGhJxTGndo+zygP3w+O3qvQBlip
 pfeDiBNg6Ho5dxWUYB7I0mkERYaoi1bxVblMyavl5Yz+QLeYD8DSeaMwJ+NL6fHpT1ePBP
 /xpN9XcHg6m2DzgICmYZUh+2QQPChko=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-425-UWqHtkBQMXmN0LJzWLSacA-1; Thu, 17 Dec 2020 11:20:06 -0500
X-MC-Unique: UWqHtkBQMXmN0LJzWLSacA-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 1DAAE803622;
 Thu, 17 Dec 2020 16:20:05 +0000 (UTC)
Received: from blackfin.pond.sub.org (ovpn-112-103.ams2.redhat.com
 [10.36.112.103])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id DE7E960D52;
 Thu, 17 Dec 2020 16:20:04 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id 7197E11275D0; Thu, 17 Dec 2020 17:20:03 +0100 (CET)
From: Markus Armbruster <armbru@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 4/9] block/vpc: Make vpc_checksum() take void *
Date: Thu, 17 Dec 2020 17:19:58 +0100
Message-Id: <20201217162003.1102738-5-armbru@redhat.com>
In-Reply-To: <20201217162003.1102738-1-armbru@redhat.com>
References: <20201217162003.1102738-1-armbru@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=armbru@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=216.205.24.124; envelope-from=armbru@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: kwolf@redhat.com, mrezanin@redhat.com, qemu-block@nongnu.org,
 mreitz@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Some of the next commits will checksum structs.  Change vpc_checksum()
to take void * instead of uint8_t, to save us pointless casts to
uint8_t *.

Signed-off-by: Markus Armbruster <armbru@redhat.com>
---
 block/vpc.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/block/vpc.c b/block/vpc.c
index 34186640ee..5af9837806 100644
--- a/block/vpc.c
+++ b/block/vpc.c
@@ -172,8 +172,9 @@ static QemuOptsList vpc_runtime_opts = {
 
 static QemuOptsList vpc_create_opts;
 
-static uint32_t vpc_checksum(uint8_t *buf, size_t size)
+static uint32_t vpc_checksum(void *p, size_t size)
 {
+    uint8_t *buf = p;
     uint32_t res = 0;
     int i;
 
-- 
2.26.2


