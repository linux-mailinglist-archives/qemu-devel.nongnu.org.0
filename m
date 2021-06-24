Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6927D3B2A80
	for <lists+qemu-devel@lfdr.de>; Thu, 24 Jun 2021 10:39:40 +0200 (CEST)
Received: from localhost ([::1]:38894 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lwKtf-0006IA-F7
	for lists+qemu-devel@lfdr.de; Thu, 24 Jun 2021 04:39:39 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43672)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mreitz@redhat.com>) id 1lwKsb-0004dk-HP
 for qemu-devel@nongnu.org; Thu, 24 Jun 2021 04:38:33 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:57856)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mreitz@redhat.com>) id 1lwKsZ-0005Yr-Nf
 for qemu-devel@nongnu.org; Thu, 24 Jun 2021 04:38:33 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1624523910;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=0dTCRYTCS+4UBsmkLqcvp6MCXjRXYWLoqRDFlP5JYT4=;
 b=JMNNA1+wXb4yaaaqqXyiOXW3B+k6fS6W8+D3yj9plRsNyQQ8PzTDNo8aOc6kO4qvdc7jTv
 NDhncey/RSBbdcx0/OmJdp+wZuv9XeOYqzKy/mjdZoI55rN61Mo6kcs/1szxY4t7kDpHho
 leV38/j1BtXdfBCqQN4Cm4+x4iU4RKs=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-91--A92Y2p-P-2vvdtwmyJg3Q-1; Thu, 24 Jun 2021 04:38:28 -0400
X-MC-Unique: -A92Y2p-P-2vvdtwmyJg3Q-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 5E56980414C;
 Thu, 24 Jun 2021 08:38:27 +0000 (UTC)
Received: from localhost (ovpn-112-15.ams2.redhat.com [10.36.112.15])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 04C2161093;
 Thu, 24 Jun 2021 08:38:26 +0000 (UTC)
From: Max Reitz <mreitz@redhat.com>
To: qemu-block@nongnu.org
Subject: [PATCH v2 0/2] block/export: Conditionally ignore set-context error
Date: Thu, 24 Jun 2021 10:38:23 +0200
Message-Id: <20210624083825.29224-1-mreitz@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=mreitz@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=216.205.24.124; envelope-from=mreitz@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.373,
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
Cc: Kevin Wolf <kwolf@redhat.com>,
 Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>, qemu-devel@nongnu.org,
 Max Reitz <mreitz@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Hi,

I had this v2 lying around for quite some time but for some reason never
sent it.  I probably just forgot.  Sorry.

v1:
https://lists.nongnu.org/archive/html/qemu-block/2021-04/msg00584.html

Changes in v2:
- Letting `bdrv_try_set_aio_context()` return an error and then just
  discarding it conditionally is kind of not right.
  If we want to ignore the error, decide so from the start: Depending on
  `fixed_iothread`, pass either `errp` or `NULL`.

- Patch 2: Reference output has changed because of 30ebb9aa920.


git-backport-diff against v1:

Key:
[----] : patches are identical
[####] : number of functional differences between upstream/downstream patch
[down] : patch is downstream-only
The flags [FC] indicate (F)unctional and (C)ontextual differences, respectively

001/2:[0009] [FC] 'block/export: Conditionally ignore set-context error'
002/2:[0002] [FC] 'iotests/307: Test iothread conflict for exports'


Max Reitz (2):
  block/export: Conditionally ignore set-context error
  iotests/307: Test iothread conflict for exports

 block/export/export.c      |  5 ++++-
 tests/qemu-iotests/307     | 15 +++++++++++++++
 tests/qemu-iotests/307.out |  8 ++++++++
 3 files changed, 27 insertions(+), 1 deletion(-)

-- 
2.31.1


