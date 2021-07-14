Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2706E3C83D7
	for <lists+qemu-devel@lfdr.de>; Wed, 14 Jul 2021 13:25:28 +0200 (CEST)
Received: from localhost ([::1]:59928 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m3d14-0002rs-KD
	for lists+qemu-devel@lfdr.de; Wed, 14 Jul 2021 07:25:26 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59284)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <david@redhat.com>) id 1m3cz8-0000eT-KO
 for qemu-devel@nongnu.org; Wed, 14 Jul 2021 07:23:26 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:23421)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <david@redhat.com>) id 1m3cz4-0007np-BP
 for qemu-devel@nongnu.org; Wed, 14 Jul 2021 07:23:24 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1626261800;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=AVv7HE70b6RvgdcslvVXQV3yNVLrz3d04fu9X2iKfFs=;
 b=QZ5/LO3qGPmaD+thaEvUc+gQIcUYfOxLnQXCbceHeTUgNHq2IXMoc9vCGhK9F29QQ0EnZA
 6jpSxPW0V9HbDZ9hFF+x2ukmZ7K5gqSJdsHpv0JbJpa5VkgbJsJSdzXISXGb9G5mEM7phk
 jV2AUGSRMdja6dtwxg+ZzLrNCPeLR54=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-124-mA9w96vxPf2fykNrf_AuQQ-1; Wed, 14 Jul 2021 07:23:17 -0400
X-MC-Unique: mA9w96vxPf2fykNrf_AuQQ-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 86916100CCD9;
 Wed, 14 Jul 2021 11:23:16 +0000 (UTC)
Received: from t480s.redhat.com (ovpn-114-63.ams2.redhat.com [10.36.114.63])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 3D5EB100F49F;
 Wed, 14 Jul 2021 11:23:06 +0000 (UTC)
From: David Hildenbrand <david@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v1 0/3] util/oslib-posix: Support MADV_POPULATE_WRITE for
 os_mem_prealloc()
Date: Wed, 14 Jul 2021 13:23:03 +0200
Message-Id: <20210714112306.67793-1-david@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=david@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=170.10.133.124; envelope-from=david@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -15
X-Spam_score: -1.6
X-Spam_bar: -
X-Spam_report: (-1.6 / 5.0 requ) DKIMWL_WL_HIGH=-0.699, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
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
Cc: Pankaj Gupta <pankaj.gupta.linux@gmail.com>,
 Eduardo Habkost <ehabkost@redhat.com>, "Michael S. Tsirkin" <mst@redhat.com>,
 David Hildenbrand <david@redhat.com>,
 "Dr . David Alan Gilbert" <dgilbert@redhat.com>,
 Igor Mammedov <imammedo@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Marek Kedzierski <mkedzier@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

#1 adds support for MADV_POPULATE_WRITE, #2 cleans up the code to avoid
global variables and prepare for concurrency and #3 makes os_mem_prealloc()
safe to be called from multiple threads concurrently.

Details regarding MADV_POPULATE_WRITE can be found in introducing upstream
Linux commit 4ca9b3859dac ("mm/madvise: introduce
MADV_POPULATE_(READ|WRITE) to prefault page tables") and in the latest man
page patch [1].

[1] https://lkml.kernel.org/r/20210712083917.16361-1-david@redhat.com

Cc: Paolo Bonzini <pbonzini@redhat.com>
Cc: "Michael S. Tsirkin" <mst@redhat.com>
Cc: Igor Mammedov <imammedo@redhat.com>
Cc: Eduardo Habkost <ehabkost@redhat.com>
Cc: Dr. David Alan Gilbert <dgilbert@redhat.com>
Cc: Marek Kedzierski <mkedzier@redhat.com>
Cc: Pankaj Gupta <pankaj.gupta.linux@gmail.com>

David Hildenbrand (3):
  util/oslib-posix: Support MADV_POPULATE_WRITE for os_mem_prealloc()
  util/oslib-posix: Introduce and use MemsetContext for
    touch_all_pages()
  util/oslib-posix: Support concurrent os_mem_prealloc() invocation

 include/qemu/osdep.h |   7 ++
 util/oslib-posix.c   | 167 ++++++++++++++++++++++++++++++-------------
 2 files changed, 126 insertions(+), 48 deletions(-)

-- 
2.31.1


