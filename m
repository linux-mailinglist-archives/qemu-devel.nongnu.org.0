Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 103A73BF7D5
	for <lists+qemu-devel@lfdr.de>; Thu,  8 Jul 2021 11:55:55 +0200 (CEST)
Received: from localhost ([::1]:60054 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m1Ql8-0002Qd-4F
	for lists+qemu-devel@lfdr.de; Thu, 08 Jul 2021 05:55:54 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58490)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <david@redhat.com>) id 1m1QjJ-0000EK-5N
 for qemu-devel@nongnu.org; Thu, 08 Jul 2021 05:54:01 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:59583)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <david@redhat.com>) id 1m1QjG-0005HI-LG
 for qemu-devel@nongnu.org; Thu, 08 Jul 2021 05:54:00 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1625738037;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=TBAyeN1jJY6DkXOudFH2PZklmuJAKLNZeU8eeAwWhBg=;
 b=RPl7L3Zip6dMCYngd/sNZQ2rpv8OHT6nXJsko3i06QVMln+/IYkkj4+nbSx4khXQFsu63/
 Nb4AjqhrKb0Pux9ASqr8LlSYe+7kow2ZOkipOZJB67Nz+vJtFyKQ1sLnKGD44GEvrPC19W
 D8UAg86EunZ0Zs7m0ait2blV4WooOh0=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-330-QlHxv00LN0mC6Ae_K3tZ6Q-1; Thu, 08 Jul 2021 05:53:55 -0400
X-MC-Unique: QlHxv00LN0mC6Ae_K3tZ6Q-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id A75B218D6A31;
 Thu,  8 Jul 2021 09:53:54 +0000 (UTC)
Received: from t480s.redhat.com (ovpn-112-130.ams2.redhat.com [10.36.112.130])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 7DADB5D9DD;
 Thu,  8 Jul 2021 09:53:40 +0000 (UTC)
From: David Hildenbrand <david@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 0/2] virtio-balloon: don't start free page hinting if
 postcopy is possible
Date: Thu,  8 Jul 2021 11:53:37 +0200
Message-Id: <20210708095339.20274-1-david@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=david@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=david@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -41
X-Spam_score: -4.2
X-Spam_bar: ----
X-Spam_report: (-4.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1.439,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: Juan Quintela <quintela@redhat.com>, "Michael S. Tsirkin" <mst@redhat.com>,
 David Hildenbrand <david@redhat.com>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>, Peter Xu <peterx@redhat.com>,
 Wei Wang <wei.w.wang@intel.com>, Alexander Duyck <alexander.duyck@gmail.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

This is the follow up on [1]:
  [PATCH v1 0/2] virtio-balloon: disallow postcopy with
  VIRTIO_BALLOON_F_FREE_PAGE_HINT

Working on getting migration for virtio-mem completely right [2] I realized
that virtio-balloon with VIRTIO_BALLOON_F_FREE_PAGE_HINT paired with
postcopy might be shaky. Actually testing it, I directly found two issues,
one of both being far from trivial to fix.

Let's not start free page hinting if postcopy is possible.

v1 -> v2:
- "virtio-balloon: don't start free page hinting if postcopy is possible"
-- Instead of bailing out when starting postcopy, don't start free page
   hinting if the postcopy capability is enabled and we might see the
   switch to postcopy for the current migration (where we might mess with
   the dirty bitmap)
- "virtio-balloon: free page hinting cleanups"
-- Added

[1] https://lkml.kernel.org/r/20210707140655.30982-1-david@redhat.com
[2] https://lkml.kernel.org/r/20210616162940.28630-1-david@redhat.com


David Hildenbrand (2):
  virtio-balloon: don't start free page hinting if postcopy is possible
  virtio-balloon: free page hinting cleanups

 hw/virtio/virtio-balloon.c | 41 +++++++++++++++++++-------------------
 1 file changed, 21 insertions(+), 20 deletions(-)

-- 
2.31.1


