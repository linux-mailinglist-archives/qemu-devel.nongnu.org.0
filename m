Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C42574297FA
	for <lists+qemu-devel@lfdr.de>; Mon, 11 Oct 2021 22:12:29 +0200 (CEST)
Received: from localhost ([::1]:36590 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ma1eu-0007l1-9w
	for lists+qemu-devel@lfdr.de; Mon, 11 Oct 2021 16:12:28 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57890)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <david@redhat.com>) id 1ma1dT-0006oQ-Jr
 for qemu-devel@nongnu.org; Mon, 11 Oct 2021 16:10:59 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:32284)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <david@redhat.com>) id 1ma1dS-0006is-1p
 for qemu-devel@nongnu.org; Mon, 11 Oct 2021 16:10:59 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1633983056;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=Ic6+VtA5kjtKbsCzVUlLwlDs9V2UHMTBfzUNy6QXJbs=;
 b=MhInN0dr92OmmcXqONqV+UkF56re7pY8exdjHzhAneMaW3QzLcWzQAleIuIstHPNK6CB/y
 6UayAdAuhe+tND9rr+4LndrZeruFmhMfYoZ3v4Q0iEt3j+GeXUK+IntT+5LOJU2kBBAMiG
 bTXMTwA/+WSlY5VbzBbIc/sxazIVOes=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-22-BD1DZs9VMn-cEiQi0hSjJg-1; Mon, 11 Oct 2021 16:10:51 -0400
X-MC-Unique: BD1DZs9VMn-cEiQi0hSjJg-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id B11FC801A92;
 Mon, 11 Oct 2021 20:10:50 +0000 (UTC)
Received: from t480s.redhat.com (unknown [10.39.192.99])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 7203D60BE5;
 Mon, 11 Oct 2021 20:10:48 +0000 (UTC)
From: David Hildenbrand <david@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v1] libvhost-user: fix VHOST_USER_REM_MEM_REG skipping
 mmap_addr
Date: Mon, 11 Oct 2021 22:10:47 +0200
Message-Id: <20211011201047.62587-1-david@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=david@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=david@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.049,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
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
Cc: "Michael S . Tsirkin" <mst@redhat.com>,
 David Hildenbrand <david@redhat.com>, qemu-stable@nongnu.org,
 Coiby Xu <coiby.xu@gmail.com>, Raphael Norwitz <raphael.norwitz@nutanix.com>,
 Stefan Hajnoczi <stefanha@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

We end up not copying the mmap_addr of all existing regions, resulting
in a SEGFAULT once we actually try to map/access anything within our
memory regions.

Fixes: 875b9fd97b34 ("Support individual region unmap in libvhost-user")
Cc: qemu-stable@nongnu.org
Cc: Michael S. Tsirkin <mst@redhat.com>
Cc: Raphael Norwitz <raphael.norwitz@nutanix.com>
Cc: "Marc-André Lureau" <marcandre.lureau@redhat.com>
Cc: Stefan Hajnoczi <stefanha@redhat.com>
Cc: Paolo Bonzini <pbonzini@redhat.com>
Cc: Coiby Xu <coiby.xu@gmail.com>
Signed-off-by: David Hildenbrand <david@redhat.com>
---
 subprojects/libvhost-user/libvhost-user.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/subprojects/libvhost-user/libvhost-user.c b/subprojects/libvhost-user/libvhost-user.c
index bf09693255..787f4d2d4f 100644
--- a/subprojects/libvhost-user/libvhost-user.c
+++ b/subprojects/libvhost-user/libvhost-user.c
@@ -816,6 +816,7 @@ vu_rem_mem_reg(VuDev *dev, VhostUserMsg *vmsg) {
             shadow_regions[j].gpa = dev->regions[i].gpa;
             shadow_regions[j].size = dev->regions[i].size;
             shadow_regions[j].qva = dev->regions[i].qva;
+            shadow_regions[j].mmap_addr = dev->regions[i].mmap_addr;
             shadow_regions[j].mmap_offset = dev->regions[i].mmap_offset;
             j++;
         } else {
-- 
2.31.1


