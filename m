Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9EACC6A6C7F
	for <lists+qemu-devel@lfdr.de>; Wed,  1 Mar 2023 13:41:43 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pXLlA-0006fD-B3; Wed, 01 Mar 2023 07:40:40 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <quintela@redhat.com>)
 id 1pXLl4-0006YC-9n
 for qemu-devel@nongnu.org; Wed, 01 Mar 2023 07:40:35 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <quintela@redhat.com>)
 id 1pXLl2-0001en-FK
 for qemu-devel@nongnu.org; Wed, 01 Mar 2023 07:40:33 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1677674429;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=dm6TRMYntqaSXbok3I0CacgqGbxL2DbrxAP2NNSbX4Q=;
 b=PTpqb6xaCgHK9s3H8tLk8KxXEitPYyL5uPISv03Y4WMWWttgcOIE2kVsSP0whxHMK5WY7m
 FY6OkKH3bZ4C2n73G1Udo02hIaVbdxWbWiY34RMB1ojZskG6mU9yF36JPyFKmSkDiWVKbI
 aT85wfC5LbviGgIyP62M+B8m5AUBpbQ=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-627-77TLbZ7NM9CwuDomcLowWQ-1; Wed, 01 Mar 2023 07:40:28 -0500
X-MC-Unique: 77TLbZ7NM9CwuDomcLowWQ-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.rdu2.redhat.com
 [10.11.54.1])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 5030529AB3F7
 for <qemu-devel@nongnu.org>; Wed,  1 Mar 2023 12:40:28 +0000 (UTC)
Received: from secure.mitica (unknown [10.39.194.31])
 by smtp.corp.redhat.com (Postfix) with ESMTP id BAE98400D927;
 Wed,  1 Mar 2023 12:40:27 +0000 (UTC)
From: Juan Quintela <quintela@redhat.com>
To: qemu-devel@nongnu.org
Cc: Juan Quintela <quintela@redhat.com>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>
Subject: [PATCH 0/3] Migration: Make more ram_counters atomic
Date: Wed,  1 Mar 2023 13:40:23 +0100
Message-Id: <20230301124026.2930-1-quintela@redhat.com>
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.1
Received-SPF: pass client-ip=170.10.129.124; envelope-from=quintela@redhat.com;
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

Hi

On previous series we cerate ram_atomic_counters.  But we basically
need that all counters are atomic.  So move back to only have
ram_counters, just with a new type that allows the atomic counters.

Once there, move update of stats out of RAM mutex.
And make multifd_bytes atomic.

Later, Juan.

Juan Quintela (3):
  migration: Merge ram_counters and ram_atomic_counters
  migration: Update atomic stats out of the mutex
  migration: Make multifd_bytes atomic

 migration/ram.h       | 26 ++++++++++++++------------
 migration/migration.c | 12 ++++++------
 migration/multifd.c   |  8 ++++----
 migration/ram.c       | 39 ++++++++++++++++-----------------------
 4 files changed, 40 insertions(+), 45 deletions(-)

-- 
2.39.2


