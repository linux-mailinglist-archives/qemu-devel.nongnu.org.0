Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BF38020A59D
	for <lists+qemu-devel@lfdr.de>; Thu, 25 Jun 2020 21:18:27 +0200 (CEST)
Received: from localhost ([::1]:58760 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1joXOE-00085a-QF
	for lists+qemu-devel@lfdr.de; Thu, 25 Jun 2020 15:18:26 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47278)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eperezma@redhat.com>)
 id 1joXN5-0007Cl-2j
 for qemu-devel@nongnu.org; Thu, 25 Jun 2020 15:17:15 -0400
Received: from us-smtp-delivery-1.mimecast.com ([205.139.110.120]:28442
 helo=us-smtp-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <eperezma@redhat.com>)
 id 1joXN3-0003ew-0e
 for qemu-devel@nongnu.org; Thu, 25 Jun 2020 15:17:14 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1593112631;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=l5Sqnb1Joi1fqGAHa0mURL2LJiuQDUWCxBOE3t4IBnQ=;
 b=RX0bpJgHGZDbbFo6IiWsLS5lzt75IIizohfZP1pdqoPdau93neuDhwYMbuAA4RqmYEoTCO
 hmaowiuL4Ov90z+l9v2jhukqq5RFCoA3ZsUmM0DY4R1F9XI/xfZ5gl4/PVmAASxTpw6Uyt
 bmC5N6Vjle4EfDqtTHO1tjblqOcT+Ss=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-250-s1Z_mXMXOX2Y5oSVvunFrg-1; Thu, 25 Jun 2020 15:17:04 -0400
X-MC-Unique: s1Z_mXMXOX2Y5oSVvunFrg-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id DEF99EC1A3;
 Thu, 25 Jun 2020 19:17:03 +0000 (UTC)
Received: from eperezma.remote.csb (ovpn-113-130.ams2.redhat.com
 [10.36.113.130])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 3211179303;
 Thu, 25 Jun 2020 19:17:02 +0000 (UTC)
From: =?UTF-8?q?Eugenio=20P=C3=A9rez?= <eperezma@redhat.com>
To: qemu-devel@nongnu.org
Subject: [RFC 1/1] memory: Delete assertion in
 memory_region_unregister_iommu_notifier
Date: Thu, 25 Jun 2020 21:16:51 +0200
Message-Id: <20200625191651.5817-2-eperezma@redhat.com>
In-Reply-To: <20200625191651.5817-1-eperezma@redhat.com>
References: <20200625191651.5817-1-eperezma@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=205.139.110.120; envelope-from=eperezma@redhat.com;
 helo=us-smtp-1.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/06/25 00:45:15
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Juan Quintela <quintela@redhat.com>, Jason Wang <jasowang@redhat.com>,
 Peter Xu <peterx@redhat.com>, Avi Kivity <avi@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Bug reference: https://bugs.launchpad.net/qemu/+bug/1885175

It is possible to hit this assertion on rhel7 guests if iommu is
properly enabled.

Signed-off-by: Eugenio Pérez <eperezma@redhat.com>
---
 memory.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/memory.c b/memory.c
index 2f15a4b250..4db609b843 100644
--- a/memory.c
+++ b/memory.c
@@ -1915,7 +1915,7 @@ void memory_region_notify_one(IOMMUNotifier *notifier,
         return;
     }
 
-    assert(entry->iova >= notifier->start && entry_end <= notifier->end);
+    // assert(entry->iova >= notifier->start && entry_end <= notifier->end);
 
     if (entry->perm & IOMMU_RW) {
         request_flags = IOMMU_NOTIFIER_MAP;
-- 
2.18.1


