Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 497FA6A8636
	for <lists+qemu-devel@lfdr.de>; Thu,  2 Mar 2023 17:22:02 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pXlgm-0004o2-7c; Thu, 02 Mar 2023 11:21:52 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <quintela@redhat.com>)
 id 1pXlgh-0004l6-QW
 for qemu-devel@nongnu.org; Thu, 02 Mar 2023 11:21:47 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <quintela@redhat.com>)
 id 1pXlgf-0003UT-7U
 for qemu-devel@nongnu.org; Thu, 02 Mar 2023 11:21:47 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1677774104;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=vK4iXGnC1ro/YvRIr++SqzL5D9pt4tQXimBD7DJQA/M=;
 b=C57zJk1SsbLrNQ0kTTKk5ZpXyyH8rP1OwGSvx3SQpKDGcMCDjXER9gPvqI/Q3l6S6pcPTZ
 wfGs9rFD9mn4Z7Y/7vBaNc/mWlEAdxBOz37HBfik01EePV7lbi8VuKIsgwznTYCRsimMyK
 oyUJn/K7naFZ/wOkuOpnOFEaNqUol9A=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-375-L3oqKU7zPoqq3LLptBGtRQ-1; Thu, 02 Mar 2023 11:21:39 -0500
X-MC-Unique: L3oqKU7zPoqq3LLptBGtRQ-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.rdu2.redhat.com
 [10.11.54.3])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 83EE42803624
 for <qemu-devel@nongnu.org>; Thu,  2 Mar 2023 16:21:39 +0000 (UTC)
Received: from secure.mitica (unknown [10.39.194.31])
 by smtp.corp.redhat.com (Postfix) with ESMTP id DA9291121315;
 Thu,  2 Mar 2023 16:21:38 +0000 (UTC)
From: Juan Quintela <quintela@redhat.com>
To: qemu-devel@nongnu.org
Cc: "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 Juan Quintela <quintela@redhat.com>
Subject: [PATCH v2 0/3] Migration: Make more ram_counters atomic
Date: Thu,  2 Mar 2023 17:21:35 +0100
Message-Id: <20230302162138.10076-1-quintela@redhat.com>
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.3
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

In v2:
- fix typos found by David Edmondson
- Add review-by tags.

Please review.

[v1]
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


