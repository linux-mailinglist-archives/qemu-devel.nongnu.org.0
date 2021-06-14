Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 14F053A5E53
	for <lists+qemu-devel@lfdr.de>; Mon, 14 Jun 2021 10:23:03 +0200 (CEST)
Received: from localhost ([::1]:37086 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lshs6-0006FP-48
	for lists+qemu-devel@lfdr.de; Mon, 14 Jun 2021 04:23:02 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41734)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eesposit@redhat.com>)
 id 1lshme-0002b5-Pd
 for qemu-devel@nongnu.org; Mon, 14 Jun 2021 04:17:24 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:32352)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eesposit@redhat.com>)
 id 1lshmc-0004ep-Lf
 for qemu-devel@nongnu.org; Mon, 14 Jun 2021 04:17:24 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1623658642;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=3ooRePzt0jGGB1Gu64HeGOc9dzsIrxHu9l7P4pnL4/s=;
 b=TbioJfmCp1DgJUKMASEzuDqbyGaepSc5hnVVT0/vb+1NixLWiOgOsTDPHTKuYNfpnaTSA3
 iJZQgLfb90z7trnXCD9Yb8643SYmybrk+Alus104Uz1P1A454v4Pi5pdmYIAyBcl7Yff9x
 lL2I5iLzurxcfSnVuUwZBsGj3WzMnQ4=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-208-0EmrkNn2MMCW56QzefvL-g-1; Mon, 14 Jun 2021 04:17:20 -0400
X-MC-Unique: 0EmrkNn2MMCW56QzefvL-g-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id D4E551084F7C;
 Mon, 14 Jun 2021 08:08:50 +0000 (UTC)
Received: from localhost.localdomain (ovpn-113-49.ams2.redhat.com
 [10.36.113.49])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 7C65160871;
 Mon, 14 Jun 2021 08:08:45 +0000 (UTC)
From: Emanuele Giuseppe Esposito <eesposit@redhat.com>
To: qemu-block@nongnu.org
Subject: [PATCH v3 0/5] block-copy: make helper APIs thread safe
Date: Mon, 14 Jun 2021 10:08:39 +0200
Message-Id: <20210614080844.21817-1-eesposit@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=eesposit@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=170.10.133.124; envelope-from=eesposit@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.199,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=-0.01, RCVD_IN_MSPIKE_WL=-0.01,
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
Cc: Kevin Wolf <kwolf@redhat.com>,
 Emanuele Giuseppe Esposito <eesposit@redhat.com>,
 Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>, qemu-devel@nongnu.org,
 Max Reitz <mreitz@redhat.com>, Stefan Hajnoczi <stefanha@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>, John Snow <jsnow@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

This serie of patches bring thread safety to the smaller APIs used by
block-copy, namely ratelimit, progressmeter, co-shared-resource
and aiotask.
The end goal is to reduce the usage of AioContexlock in block-copy,
by introducing smaller granularity locks thus on making the block layer
thread safe. 

What's missing for block-copy to be fully thread-safe is fixing
the CoSleep API to allow cross-thread sleep and wakeup.
Paolo is working on it and will post the patches once his new
CoSleep API is accepted.

Patches 1-3 work on ratelimit, 4 covers progressmeter and
5 co-shared-resources.

Signed-off-by: Emanuele Giuseppe Esposito <eesposit@redhat.com>
---
v3:
* Rebase on current master (had conflicts in block-copy), remove based-on in
  cover letter

Emanuele Giuseppe Esposito (2):
  progressmeter: protect with a mutex
  co-shared-resource: protect with a mutex

Paolo Bonzini (3):
  ratelimit: treat zero speed as unlimited
  block-copy: let ratelimit handle a speed of 0
  blockjob: let ratelimit handle a speed of 0

 block/block-copy.c                | 28 ++++++--------
 block/meson.build                 |  1 +
 block/progress_meter.c            | 64 +++++++++++++++++++++++++++++++
 blockjob.c                        | 46 +++++++++++++---------
 include/qemu/co-shared-resource.h |  4 +-
 include/qemu/progress_meter.h     | 34 ++++++++--------
 include/qemu/ratelimit.h          | 12 +++++-
 job-qmp.c                         |  8 +++-
 job.c                             |  3 ++
 qemu-img.c                        |  9 +++--
 util/qemu-co-shared-resource.c    | 24 +++++++++---
 11 files changed, 168 insertions(+), 65 deletions(-)
 create mode 100644 block/progress_meter.c

-- 
2.31.1


