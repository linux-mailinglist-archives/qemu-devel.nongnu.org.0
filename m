Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 672F66F6A3C
	for <lists+qemu-devel@lfdr.de>; Thu,  4 May 2023 13:40:30 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1puXIQ-0005va-UU; Thu, 04 May 2023 07:38:51 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <quintela@redhat.com>)
 id 1puXIO-0005v3-Tz
 for qemu-devel@nongnu.org; Thu, 04 May 2023 07:38:48 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <quintela@redhat.com>)
 id 1puXIN-0003Ha-1c
 for qemu-devel@nongnu.org; Thu, 04 May 2023 07:38:48 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1683200325;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=X75R3oVu1yf9/DidOUB8NWwDp7VbArum9twq3KJV6PA=;
 b=XOwyq+1/oMyRFYR8VTAajOK3+YhhkMCgO9i0G0B4smCCG75KgNYjQzmqV6lP21AfgLIIm3
 PsqjCO6es+uwTc2+EKENCV5YQEXQRMKnJdAlvvVxlUSjfKRny+8MICzC27vvLm2ibDBw5Q
 OGVRxATdstZ0gZa9eQcZ8Fjse7fvuMc=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-618-bE5s82mwNiKQwvzuwcoyHA-1; Thu, 04 May 2023 07:38:44 -0400
X-MC-Unique: bE5s82mwNiKQwvzuwcoyHA-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com
 [10.11.54.6])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 3AA2310334A1;
 Thu,  4 May 2023 11:38:44 +0000 (UTC)
Received: from secure.mitica (unknown [10.39.193.236])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 85D112166B30;
 Thu,  4 May 2023 11:38:42 +0000 (UTC)
From: Juan Quintela <quintela@redhat.com>
To: qemu-devel@nongnu.org
Cc: qemu-block@nongnu.org, Stefan Hajnoczi <stefanha@redhat.com>,
 Juan Quintela <quintela@redhat.com>, Leonardo Bras <leobras@redhat.com>,
 Fam Zheng <fam@euphon.net>, Peter Xu <peterx@redhat.com>
Subject: [PATCH 0/9] QEMU file cleanups
Date: Thu,  4 May 2023 13:38:32 +0200
Message-Id: <20230504113841.23130-1-quintela@redhat.com>
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.6
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

While I am trying to put order in the atomic counters, I made in this series:

- convince and review code to see that everything is uint64_t.

- f->shutdown is not needed.  When we shutdown the file we put an
  error there if there is none.  So remove it.
- Make more clear how we use rate_limit.

Please review.

It is based on my previous series to the list:
Subject: [PATCH 0/2] More migration stats
Based-on: Message-Id: <20230504103357.22130-1-quintela@redhat.com>

Juan Quintela (9):
  migration: max_postcopy_bandwidth is a size parameter
  migration: qemu_file_total_transferred() function is monotonic
  qemu-file: make qemu_file_[sg]et_rate_limit() use an uint64_t
  qemu-file: Make rate_limit_used an uint64_t
  qemu-file: No need to check for shutdown in qemu_file_rate_limit
  qemu-file: remove shutdown member
  qemu-file: Make total_transferred an uint64_t
  qemu-file: Make ram_control_save_page() use accessors for rate_limit
  qemu-file: Account for rate_limit usage on qemu_fflush()

 migration/block.c     | 13 +++----------
 migration/migration.c | 10 +++++-----
 migration/options.c   |  2 +-
 migration/options.h   |  2 +-
 migration/qemu-file.c | 42 +++++++++++++++++-------------------------
 migration/qemu-file.h | 10 +++++-----
 migration/savevm.c    |  6 ++----
 migration/vmstate.c   |  2 +-
 8 files changed, 35 insertions(+), 52 deletions(-)

-- 
2.40.0


