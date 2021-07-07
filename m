Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 57A8C3BE96D
	for <lists+qemu-devel@lfdr.de>; Wed,  7 Jul 2021 16:10:08 +0200 (CEST)
Received: from localhost ([::1]:34844 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m18Fb-0003na-Es
	for lists+qemu-devel@lfdr.de; Wed, 07 Jul 2021 10:10:07 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51100)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <david@redhat.com>) id 1m18Ct-00006V-Ps
 for qemu-devel@nongnu.org; Wed, 07 Jul 2021 10:07:19 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:23876)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <david@redhat.com>) id 1m18Cr-0000FX-6j
 for qemu-devel@nongnu.org; Wed, 07 Jul 2021 10:07:19 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1625666836;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=YNNyh/64rQHNuJuYxW/9pwzNDZgofgKSbYmYSq6hbv0=;
 b=Pb/6XCNTNmrfGbz0Mcr9P7ytMimcvsdK2JDveSJM4h3BtnVG4PYh54VbBROJxmj/cqC6Tn
 jHNEO0JxlAC7zAvXMTr2BK2DPb4p1GqeJBF4OmYC0TXkIluf+XrJL20BMVSSYMkTsopZE5
 KqeaHnamXWn+hUZZiQpMJzEjV/n3jIY=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-154-Bf6KHobNO7yiI4OYP4jqgQ-1; Wed, 07 Jul 2021 10:07:12 -0400
X-MC-Unique: Bf6KHobNO7yiI4OYP4jqgQ-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 8E885804B80;
 Wed,  7 Jul 2021 14:07:11 +0000 (UTC)
Received: from t480s.redhat.com (ovpn-114-110.ams2.redhat.com [10.36.114.110])
 by smtp.corp.redhat.com (Postfix) with ESMTP id E072E5D9F0;
 Wed,  7 Jul 2021 14:06:56 +0000 (UTC)
From: David Hildenbrand <david@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v1 0/2] virtio-balloon: disallow postcopy with
 VIRTIO_BALLOON_F_FREE_PAGE_HINT
Date: Wed,  7 Jul 2021 16:06:53 +0200
Message-Id: <20210707140655.30982-1-david@redhat.com>
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

Working on getting migration for virtio-mem completely right [1] I realized
that virtio-balloon with VIRTIO_BALLOON_F_FREE_PAGE_HINT paired with
postcopy might be shaky. Actually testing it, I directly found two issues,
one of both being far from trivial to fix.

Let's disallow postcopy with "free-page-hint=on".

[1] https://lkml.kernel.org/r/20210616162940.28630-1-david@redhat.com

David Hildenbrand (2):
  migration/postcopy-ram: define type for "struct PostcopyNotifyData"
  virtio-balloon: disallow postcopy with VIRTIO_BALLOON_F_FREE_PAGE_HINT

 hw/virtio/vhost-user.c             |  2 +-
 hw/virtio/virtio-balloon.c         | 26 ++++++++++++++++++++++++++
 include/hw/virtio/virtio-balloon.h |  1 +
 migration/postcopy-ram.c           |  2 +-
 migration/postcopy-ram.h           |  4 ++--
 5 files changed, 31 insertions(+), 4 deletions(-)

-- 
2.31.1


