Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 55A921DAFA9
	for <lists+qemu-devel@lfdr.de>; Wed, 20 May 2020 12:06:11 +0200 (CEST)
Received: from localhost ([::1]:55486 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jbLc2-0008Fu-31
	for lists+qemu-devel@lfdr.de; Wed, 20 May 2020 06:06:10 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53772)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <david@redhat.com>) id 1jbLam-00072o-RJ
 for qemu-devel@nongnu.org; Wed, 20 May 2020 06:04:52 -0400
Received: from us-smtp-delivery-1.mimecast.com ([205.139.110.120]:38805
 helo=us-smtp-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <david@redhat.com>) id 1jbLal-0005EY-Vg
 for qemu-devel@nongnu.org; Wed, 20 May 2020 06:04:52 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1589969090;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=6SvES8/808CgXwTnqPWwCteQKA31Vdw5rAyCSNLVVN0=;
 b=K2leoUEOzY3RFbw+9AiWEKehdeFnVuSBvdWDT9DaiOkILIlNj4Fb1jD6U06h9VEu4efiZ3
 GwrSD8uDMMRwtgiAGhT2gmdRvEt+uwY1K6zGbMzw8ojCpTtNPJOQSnhYvwD9Q/tqjl/W3H
 GqTxth2NIKthpbrw3VycrgPRUWPJ/U4=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-292-cog_-cGcNuypBJV6Koo9Ig-1; Wed, 20 May 2020 06:04:49 -0400
X-MC-Unique: cog_-cGcNuypBJV6Koo9Ig-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id D928CBFC0;
 Wed, 20 May 2020 10:04:47 +0000 (UTC)
Received: from t480s.redhat.com (ovpn-113-76.ams2.redhat.com [10.36.113.76])
 by smtp.corp.redhat.com (Postfix) with ESMTP id EC3455C1BE;
 Wed, 20 May 2020 10:04:40 +0000 (UTC)
From: David Hildenbrand <david@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 0/3] virtio-balloon: free page hinting fixes
Date: Wed, 20 May 2020 12:04:36 +0200
Message-Id: <20200520100439.19872-1-david@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=205.139.110.120; envelope-from=david@redhat.com;
 helo=us-smtp-1.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/05/19 22:48:02
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: "Michael S. Tsirkin" <mst@redhat.com>, David Hildenbrand <david@redhat.com>,
 Alexander Duyck <alexander.duyck@gmail.com>, Alexander Bulekov <alxndr@bu.edu>,
 Wei Wang <wei.w.wang@intel.com>,
 Alexander Duyck <alexander.h.duyck@linux.intel.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Some fixes for VIRTIO_BALLOON_F_FREE_PAGE_HINT. First issue was reported by
Alexander Bulekov [1], the other ones were discovered by me when digging
into the details.

We keep finding more issues, let's see how we'll proceed with this feature
long-term. These patches can be backported to stable QEMU.

[1] https://lkml.kernel.org/r/20200511044121.eihns2tdimdzgi4i@mozz.bu.edu

v1 -> v2:
- "virtio-balloon: fix free page hinting without an iothread"
-- Drop initialization to 0/false
-- Reformat one condition
- cc stable

David Hildenbrand (3):
  virtio-balloon: fix free page hinting without an iothread
  virtio-balloon: fix free page hinting check on unrealize
  virtio-balloon: unref the iothread when unrealizing

 hw/virtio/virtio-balloon.c | 36 ++++++++++++++++++------------------
 1 file changed, 18 insertions(+), 18 deletions(-)

-- 
2.25.4


