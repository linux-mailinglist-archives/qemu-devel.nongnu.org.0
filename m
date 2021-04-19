Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D4D6E363E0E
	for <lists+qemu-devel@lfdr.de>; Mon, 19 Apr 2021 10:57:42 +0200 (CEST)
Received: from localhost ([::1]:32772 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lYPiv-0002CM-Tx
	for lists+qemu-devel@lfdr.de; Mon, 19 Apr 2021 04:57:41 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41602)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eesposit@redhat.com>)
 id 1lYPhH-0000XF-6Y
 for qemu-devel@nongnu.org; Mon, 19 Apr 2021 04:55:59 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:44035)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eesposit@redhat.com>)
 id 1lYPhE-0000t7-Vs
 for qemu-devel@nongnu.org; Mon, 19 Apr 2021 04:55:58 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1618822556;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=84OqkrEJ3uSM30nYTAlCTBRldzX1ZQBeC7atGWKpu3g=;
 b=HFpWQ3o2nBCrwv7fq1IViaxtKqIDY0spffiqSheVaIC9GTJnJLEAqFhidWA53sACsHX3vA
 ry3hr1/+RSpiU/WHEJ204xBWSlNNxbLlItU3CcoYyKFT81OiIJK/u9wnJSAAku1bp6ncHy
 vNe/xSvz1osTYjKj9MNBesUDg5QUiXc=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-539-RGYOrn4QMIeFoblV4BsgxQ-1; Mon, 19 Apr 2021 04:55:52 -0400
X-MC-Unique: RGYOrn4QMIeFoblV4BsgxQ-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 3CEE41020C2C;
 Mon, 19 Apr 2021 08:55:51 +0000 (UTC)
Received: from localhost.localdomain.com (ovpn-114-195.ams2.redhat.com
 [10.36.114.195])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 9C7815D742;
 Mon, 19 Apr 2021 08:55:43 +0000 (UTC)
From: Emanuele Giuseppe Esposito <eesposit@redhat.com>
To: qemu-block@nongnu.org
Subject: [PATCH v2 0/8] Block layer thread-safety, continued
Date: Mon, 19 Apr 2021 10:55:33 +0200
Message-Id: <20210419085541.22310-1-eesposit@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=eesposit@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=216.205.24.124; envelope-from=eesposit@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=-0.01, RCVD_IN_MSPIKE_WL=-0.01,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: Kevin Wolf <kwolf@redhat.com>, Fam Zheng <fam@euphon.net>,
 qemu-devel@nongnu.org, Emanuele Giuseppe Esposito <eesposit@redhat.com>,
 Markus Armbruster <armbru@redhat.com>, Max Reitz <mreitz@redhat.com>,
 Stefan Hajnoczi <stefanha@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 John Snow <jsnow@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

This and the following serie of patches are based on Paolo's
v1 patches sent in 2017[*]. They have been ported to the current QEMU
version, but the goal remains the same: 
- make the block layer thread-safe (patches 1-5), and
- remove aio_context_acquire/release (patches 6-8).

[*] = https://lists.gnu.org/archive/html/qemu-devel/2017-07/msg01398.html

Signed-off-by: Emanuele Giuseppe Esposito <eesposit@redhat.com>
---
v1 (2017) -> v2 (2021):
- v1 Patch "block-backup: add reqs_lock" has been dropped, because now
  is completely different from the old version and all functions
  that were affected by it have been moved or deleted. 
  It will be replaced by another serie that aims to thread safety to 
  block/block-copy.c
- remaining v1 patches will be integrated in next serie.
- Patch "block: do not acquire AioContext in check_to_replace_node"
  moves part of the logic of check_to_replace_node to the caller,
  so that the function can be included in the aio_context_acquire/release
  block that follows.

Emanuele Giuseppe Esposito (8):
  block: prepare write threshold code for thread safety
  block: protect write threshold QMP commands from concurrent requests
  util: use RCU accessors for notifiers
  block: make before-write notifiers thread-safe
  block: add a few more notes on locking
  block: do not acquire AioContext in check_to_replace_node
  block/replication: do not acquire AioContext
  block: do not take AioContext around reopen

 block.c                   | 28 ++++++--------------
 block/block-backend.c     |  4 ---
 block/io.c                | 12 +++++++++
 block/mirror.c            |  9 -------
 block/replication.c       | 54 +++++++++------------------------------
 block/write-threshold.c   | 39 ++++++++++++++--------------
 blockdev.c                | 26 +++++++++----------
 include/block/block.h     |  1 +
 include/block/block_int.h | 42 +++++++++++++++++++++++++++++-
 util/notify.c             | 13 +++++-----
 10 files changed, 113 insertions(+), 115 deletions(-)

-- 
2.30.2


