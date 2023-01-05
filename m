Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id AD72F65EAF6
	for <lists+qemu-devel@lfdr.de>; Thu,  5 Jan 2023 13:48:20 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pDPd3-0000Z7-U5; Thu, 05 Jan 2023 07:45:53 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <david@redhat.com>) id 1pDPcm-0000Xw-JL
 for qemu-devel@nongnu.org; Thu, 05 Jan 2023 07:45:37 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <david@redhat.com>) id 1pDPck-0005mW-9U
 for qemu-devel@nongnu.org; Thu, 05 Jan 2023 07:45:35 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1672922732;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding;
 bh=9kDadsZ1LNoRqVL49cb2BUn1zLt/cvXadLYhKXY9KHU=;
 b=Z4ZoXeQgUPrHnh9XsS62IxaKhQ36gqT/wvyyhMTFgiz3YWcKtlbq5NphVTSoOODuXiJ7Mb
 jUE08k/5PBMmoztyBiVW4afr6jP89XAd7LPzWgJ6O2Zl0hl3+W1GrDs7cnTdJq5aiNMpoL
 kyPSkoobtJ+SeDNF+Tk0QBIgJrQw6Ro=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-477-471nLbFQNt6WqCoKHxEnbg-1; Thu, 05 Jan 2023 07:45:31 -0500
X-MC-Unique: 471nLbFQNt6WqCoKHxEnbg-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.rdu2.redhat.com
 [10.11.54.3])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id ECE7A8588E7;
 Thu,  5 Jan 2023 12:45:30 +0000 (UTC)
Received: from t480s.redhat.com (unknown [10.39.192.193])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 53A851121314;
 Thu,  5 Jan 2023 12:45:29 +0000 (UTC)
From: David Hildenbrand <david@redhat.com>
To: qemu-devel@nongnu.org
Cc: David Hildenbrand <david@redhat.com>, Juan Quintela <quintela@redhat.com>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 Peter Xu <peterx@redhat.com>, Andrey Gruzdev <andrey.gruzdev@virtuozzo.com>
Subject: [PATCH v1 0/5] migration/ram: background snapshot fixes and
 optimiations
Date: Thu,  5 Jan 2023 13:45:23 +0100
Message-Id: <20230105124528.93813-1-david@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.3
Received-SPF: pass client-ip=170.10.129.124; envelope-from=david@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

Playing with background snapshots in combination with hugetlb and
virtio-mem, I found two issues and some reasonable optimizations (skip
unprotecting when unregistering).

With virtio-mem (RamDiscardManager), we now won't be allocating unnecessary
page tables for unplugged ranges when using uffd-wp with shmem/hugetlb.

Cc: Juan Quintela <quintela@redhat.com> (maintainer:Migration)
Cc: "Dr. David Alan Gilbert" <dgilbert@redhat.com> (maintainer:Migration)
Cc: Peter Xu <peterx@redhat.com>
Cc: Andrey Gruzdev <andrey.gruzdev@virtuozzo.com>

David Hildenbrand (5):
  migration/ram: Fix populate_read_range()
  migration/ram: Fix error handling in ram_write_tracking_start()
  migration/ram: Don't explicitly unprotect when unregistering uffd-wp
  migration/ram: Rely on used_length for uffd_change_protection()
  migration/ram: Optimize ram_write_tracking_start() for
    RamDiscardManager

 migration/ram.c | 54 ++++++++++++++++++++++++++++++++++++-------------
 1 file changed, 40 insertions(+), 14 deletions(-)

-- 
2.39.0


