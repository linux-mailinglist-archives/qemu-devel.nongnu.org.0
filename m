Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9D1C84EAA85
	for <lists+qemu-devel@lfdr.de>; Tue, 29 Mar 2022 11:26:57 +0200 (CEST)
Received: from localhost ([::1]:57576 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nZ87s-00073c-Js
	for lists+qemu-devel@lfdr.de; Tue, 29 Mar 2022 05:26:56 -0400
Received: from eggs.gnu.org ([209.51.188.92]:57698)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <hreitz@redhat.com>) id 1nZ811-00020z-Dm
 for qemu-devel@nongnu.org; Tue, 29 Mar 2022 05:19:52 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:58609)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <hreitz@redhat.com>) id 1nZ80n-0005eH-VN
 for qemu-devel@nongnu.org; Tue, 29 Mar 2022 05:19:39 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1648545577;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=0zwpDrkpRV4hadvXBtab/BRhovZkqP2AR3fWJHVuU/c=;
 b=MX6fA9MMkXX6TJiu2Le4zbY5tvJH2VUVfGEMUXQnpQlz5/SqKYyw2iT/d6+IHtMHTxvZQX
 mY/hx3YiCW2V1s5iodxHvHvZtiXp5nQg0id1LqCI0eGg8gqeJkMAH5hrXo924l/zPgCdMh
 9sV7Ppu3qCMm1Pv7wj/xkuSO/xdwNFY=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-137-9Qp7wJ5yOtuQq0s1OX6Kww-1; Tue, 29 Mar 2022 05:19:34 -0400
X-MC-Unique: 9Qp7wJ5yOtuQq0s1OX6Kww-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.rdu2.redhat.com
 [10.11.54.2])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 9AD5794C450;
 Tue, 29 Mar 2022 09:19:18 +0000 (UTC)
Received: from localhost (unknown [10.39.194.242])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 5711C40149B5;
 Tue, 29 Mar 2022 09:19:18 +0000 (UTC)
From: Hanna Reitz <hreitz@redhat.com>
To: qemu-block@nongnu.org
Subject: [PATCH v2 0/2] qcow2: Improve refcount structure rebuilding
Date: Tue, 29 Mar 2022 11:19:15 +0200
Message-Id: <20220329091917.24512-1-hreitz@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.11.54.2
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=hreitz@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=hreitz@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
Cc: Kevin Wolf <kwolf@redhat.com>, Hanna Reitz <hreitz@redhat.com>,
 qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Hi,

v1 cover letter:
https://lists.nongnu.org/archive/html/qemu-block/2021-03/msg00651.html

Since it’s been a while since v1, let me reproduce parts from that cover
letter here:


When the qcow2 refcount structure is broken to a point where we cannot
rely on any information from it (because it shows clusters as free that
are in use), “qemu-img check -r all” completely rewrites it.

The new reftable is preferably written into the area covered by the last
refblock for the image, but if that refblock is empty (e.g. because the
image is on a block device and there is just nothing near the end of the
block device), then the reftable will be put after the image’s end.
Which is a problem on block devices, because they can’t easily be
resized (also, resizing wouldn’t really help in this case, because the
reftable would still be written past the new end).


Effectively, this means you can’t run `qemu-img check -r all` on qcow2
images that are on block devices when there are clusters that are in
use, but not marked as allocated.


I recommend reviewing patch 1 not based on the diff, but by applying it
and reviewing the rebuild_refcount_structure() function (and its new
rebuild_refcounts_write_refblocks() helper).


v2:
- Dropped patches 2 and 3 (not really necessary with QSD --daemonize),
  which used to bring support for the QSD to _launch_qemu
- Patch 1: Functionally the same (I hope), but I have added extensive
  comments and put the `for ()` loop into its own dedicated function so
  that we can get rid of the backwards-jumping goto
- Patch 2: Changed to make do without _launch_qemu having QSD support


git backport-diff against v1:

Key:
[----] : patches are identical
[####] : number of functional differences between upstream/downstream patch
[down] : patch is downstream-only
The flags [FC] indicate (F)unctional and (C)ontextual differences, respectively

001/2:[0370] [FC] 'qcow2: Improve refcount structure rebuilding'
002/2:[0047] [FC] 'iotests/108: Test new refcount rebuild algorithm'


Hanna Reitz (2):
  qcow2: Improve refcount structure rebuilding
  iotests/108: Test new refcount rebuild algorithm

 block/qcow2-refcount.c     | 332 ++++++++++++++++++++++++++-----------
 tests/qemu-iotests/108     | 259 ++++++++++++++++++++++++++++-
 tests/qemu-iotests/108.out |  81 +++++++++
 3 files changed, 574 insertions(+), 98 deletions(-)

-- 
2.35.1


