Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 86034583E48
	for <lists+qemu-devel@lfdr.de>; Thu, 28 Jul 2022 14:05:56 +0200 (CEST)
Received: from localhost ([::1]:54094 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oH2H4-0007Ev-Tz
	for lists+qemu-devel@lfdr.de; Thu, 28 Jul 2022 08:05:54 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40154)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <quintela@redhat.com>)
 id 1oH2Ba-0001Q0-NA
 for qemu-devel@nongnu.org; Thu, 28 Jul 2022 08:00:14 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:52217)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <quintela@redhat.com>)
 id 1oH2BT-0001iX-LA
 for qemu-devel@nongnu.org; Thu, 28 Jul 2022 08:00:14 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1659009606;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=A6nxP9Kj3J6zT0Wv7iynmOA4d36UBo2zsHpiNFE8G/8=;
 b=ILlaqpumSRjQPuEDUdOYuiO1soNHqz4OPtQ/VMp+l52I04yG0691R0NjRwZfgjsP++3QM4
 YqzLEiy916kxVq1WlypbgyV1ERWjwRkwWkE/om2z9S3Q3Oy1qaoy61mqT1x1yWlq1jLJ14
 xhvZhsneWt52BX+ISAxUcYyR82JxBF0=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-522-VbB0BlTXO5W3WoooGR9FLw-1; Thu, 28 Jul 2022 08:00:01 -0400
X-MC-Unique: VbB0BlTXO5W3WoooGR9FLw-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.rdu2.redhat.com
 [10.11.54.5])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id CFE601C0336E;
 Thu, 28 Jul 2022 12:00:00 +0000 (UTC)
Received: from secure.mitica (unknown [10.39.192.136])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 74FD918EB5;
 Thu, 28 Jul 2022 11:59:58 +0000 (UTC)
From: Juan Quintela <quintela@redhat.com>
To: qemu-devel@nongnu.org
Cc: Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Juan Quintela <quintela@redhat.com>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 Eduardo Habkost <eduardo@habkost.net>, Yanan Wang <wangyanan55@huawei.com>
Subject: [PATCH v2 0/6] Eliminate multifd flush
Date: Thu, 28 Jul 2022 13:59:51 +0200
Message-Id: <20220728115957.5554-1-quintela@redhat.com>
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 2.79 on 10.11.54.5
Received-SPF: pass client-ip=170.10.133.124; envelope-from=quintela@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Hi

In this v2:
- update to latest upstream
- change 0, 1, 2 values to defines
- Add documentation for SAVE_VM_FLAGS
- Add missing qemu_fflush(), it made random hangs for migration test
  (only for tls, no clue why).

Please, review.

[v1]
Upstream multifd code synchronize all threads after each RAM section.  This is suboptimal.
Change it to only flush after we go trough all ram.

Preserve all semantics for old machine types.

Juan Quintela (6):
  multifd: Create property multifd-sync-after-each-section
  multifd: Protect multifd_send_sync_main() calls
  migration: Simplify ram_find_and_save_block()
  migration: Make find_dirty_block() return a single parameter
  multifd: Only sync once each full round of memory
  ram: Document migration ram flags

 migration/migration.h |  6 +++
 hw/core/machine.c     |  1 +
 migration/migration.c | 11 ++++-
 migration/ram.c       | 98 ++++++++++++++++++++++++++++++-------------
 4 files changed, 85 insertions(+), 31 deletions(-)

-- 
2.37.1


