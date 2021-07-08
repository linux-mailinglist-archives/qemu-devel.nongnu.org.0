Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 22D003BF959
	for <lists+qemu-devel@lfdr.de>; Thu,  8 Jul 2021 13:51:13 +0200 (CEST)
Received: from localhost ([::1]:51550 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m1SYh-0006fY-JY
	for lists+qemu-devel@lfdr.de; Thu, 08 Jul 2021 07:51:11 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51124)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1m1SV0-0003s2-IM
 for qemu-devel@nongnu.org; Thu, 08 Jul 2021 07:47:24 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:46542)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1m1SUw-0001Qf-Ie
 for qemu-devel@nongnu.org; Thu, 08 Jul 2021 07:47:22 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1625744838;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=0WxhZHsmrmJmOAxnIEkMz0wcUfzYkwSNSRcP3ByQSdo=;
 b=Ohv864Zd8qIAoymTN/FNEgPlrQbDXw3+D82+NfwUQG4A5oTl6AX7leVthgXAbpiq/YqBpm
 slJsbCCJQIjJttunQbUHP7LDQpIvuH8hHk/j0UpawjZUYcxQSNkQzw9BXm55ZubF4GE04c
 eqgi+qe5MkCEF3kHIC0+atOUyc6F0SM=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-42-vPGTxD8sP8O9MoMBEa6RsQ-1; Thu, 08 Jul 2021 07:47:15 -0400
X-MC-Unique: vPGTxD8sP8O9MoMBEa6RsQ-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id D1623801107;
 Thu,  8 Jul 2021 11:47:13 +0000 (UTC)
Received: from merkur.redhat.com (ovpn-114-143.ams2.redhat.com [10.36.114.143])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 7635260843;
 Thu,  8 Jul 2021 11:47:11 +0000 (UTC)
From: Kevin Wolf <kwolf@redhat.com>
To: qemu-block@nongnu.org
Subject: [PATCH v6 0/6] Make blockdev-reopen stable
Date: Thu,  8 Jul 2021 13:47:03 +0200
Message-Id: <20210708114709.206487-1-kwolf@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=kwolf@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=170.10.133.124; envelope-from=kwolf@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.45,
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
Cc: kwolf@redhat.com, vsementsov@virtuozzo.com, berto@igalia.com,
 qemu-devel@nongnu.org, mreitz@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

This series picks up the remaining patches from Berto's series "[PATCH
v4 0/6] Allow changing bs->file on reopen", which are not merged into
master yet.

Apart from renaming 'x-blockdev-reopen' into 'blockdev-reopen', the
remaining functional change in this series is taking a list of nodes to
reopen as an argument so that multiple changes to the graph can be made
atomically that would be invalid separately (e.g. due to permission
checks on the intermediate state).

It also contains a qcow2 fix for a bug introduced by the part of the
series that was already picked up in Vladimir's "[PATCH v6 0/9] Allow
changing bs->file on reopen".

v6:
- Changed qcow2 fix to set s->data_file = NULL between .prepare and
  .commit instead of using a separate bool [Vladimir]
- Coding style fixes [Vladimir]

Alberto Garcia (4):
  block: Add bdrv_reopen_queue_free()
  block: Support multiple reopening with x-blockdev-reopen
  iotests: Test reopening multiple devices at the same time
  block: Make blockdev-reopen stable API

Kevin Wolf (2):
  qcow2: Fix dangling pointer after reopen for 'file'
  block: Acquire AioContexts during bdrv_reopen_multiple()

 qapi/block-core.json                          | 24 +++---
 include/block/block.h                         |  3 +
 block.c                                       | 71 +++++++++++++----
 block/qcow2.c                                 | 29 +++++++
 block/replication.c                           |  7 ++
 blockdev.c                                    | 76 ++++++++++--------
 qemu-io-cmds.c                                |  7 +-
 tests/qemu-iotests/155                        |  9 ++-
 tests/qemu-iotests/165                        |  4 +-
 tests/qemu-iotests/245                        | 78 +++++++++++++++----
 tests/qemu-iotests/245.out                    |  4 +-
 tests/qemu-iotests/248                        |  4 +-
 tests/qemu-iotests/248.out                    |  2 +-
 tests/qemu-iotests/296                        | 11 ++-
 tests/qemu-iotests/298                        |  4 +-
 .../tests/remove-bitmap-from-backing          | 22 +++---
 16 files changed, 255 insertions(+), 100 deletions(-)

-- 
2.31.1


