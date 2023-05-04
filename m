Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BDD5B6F6A55
	for <lists+qemu-devel@lfdr.de>; Thu,  4 May 2023 13:45:40 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1puXOT-0004fT-TR; Thu, 04 May 2023 07:45:05 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <quintela@redhat.com>)
 id 1puXOD-0004f3-BQ
 for qemu-devel@nongnu.org; Thu, 04 May 2023 07:44:49 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <quintela@redhat.com>)
 id 1puXOB-0004kb-Ks
 for qemu-devel@nongnu.org; Thu, 04 May 2023 07:44:48 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1683200686;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=uFRiJv7SUZ06pdtVHxBVNurC2WQB5nH+UyrdGsty96U=;
 b=aMiB64M0OG5ZWQfzLTTaxhz/sBEmUdehNktZdcjIFriWtQrhdCbm/Fv3GkXqIgU3nmbsyo
 114XLEen4ANH7Xmmf971TTGCW3vTKek18V//ccGDgBG/kl+4gWpzXU2Oysz7EbXVYk+BQA
 ccnNvQCKA5q4aurDrZXULcbonnH7LhI=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-170-kI3nmluOOF-uyLpQqcA6Ug-1; Thu, 04 May 2023 07:44:45 -0400
X-MC-Unique: kI3nmluOOF-uyLpQqcA6Ug-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.rdu2.redhat.com
 [10.11.54.4])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id D9614858F0E
 for <qemu-devel@nongnu.org>; Thu,  4 May 2023 11:44:44 +0000 (UTC)
Received: from secure.mitica (unknown [10.39.193.236])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 15F8B2026D16;
 Thu,  4 May 2023 11:44:43 +0000 (UTC)
From: Juan Quintela <quintela@redhat.com>
To: qemu-devel@nongnu.org
Cc: Juan Quintela <quintela@redhat.com>, Leonardo Bras <leobras@redhat.com>,
 Peter Xu <peterx@redhat.com>
Subject: [PATCH 0/5] Migration RDMA cleanup
Date: Thu,  4 May 2023 13:44:38 +0200
Message-Id: <20230504114443.23891-1-quintela@redhat.com>
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.4
Received-SPF: pass client-ip=170.10.133.124; envelope-from=quintela@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -22
X-Spam_score: -2.3
X-Spam_bar: --
X-Spam_report: (-2.3 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.161,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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

This is the part of the series in QEMUFileHook removal that are just
RDMA cleanup.

Please, review.

Based on my previous series of qemu-file cleanups.

Subject: [PATCH 0/9] QEMU file cleanups
Based-on: Message-Id: <20230504113841.23130-1-quintela@redhat.com>

Juan Quintela (5):
  migration: Make RAM_SAVE_FLAG_HOOK a normal case entry
  migration/rdma: simplify ram_control_load_hook()
  migration/rdma: We can calculate the rioc from the QEMUFile
  migration/rdma: It makes no sense to recive that flag without RDMA
  migration/rdma: Check for postcopy sooner

 migration/qemu-file.c | 12 +-----------
 migration/ram.c       | 12 +++++-------
 migration/rdma.c      | 40 ++++++++++++++++++++--------------------
 3 files changed, 26 insertions(+), 38 deletions(-)

-- 
2.40.0


