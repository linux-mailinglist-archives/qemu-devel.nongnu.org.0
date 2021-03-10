Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 42E0A334259
	for <lists+qemu-devel@lfdr.de>; Wed, 10 Mar 2021 17:03:41 +0100 (CET)
Received: from localhost ([::1]:53370 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lK1JD-0004Sp-Mr
	for lists+qemu-devel@lfdr.de; Wed, 10 Mar 2021 11:03:39 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:33982)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mreitz@redhat.com>) id 1lK1Ex-000392-H6
 for qemu-devel@nongnu.org; Wed, 10 Mar 2021 10:59:15 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:49374)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <mreitz@redhat.com>) id 1lK1Eu-00021G-G1
 for qemu-devel@nongnu.org; Wed, 10 Mar 2021 10:59:15 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1615391951;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=iCjwYrvaQvcMhIJ0tzkRQ6m3+QuXk3BlGsdCYzI2o0s=;
 b=NWPRu0Ntf6CrG4row0DWIvgqGaOsxcSlHDL71MZcg3TJcPhYevgN9OoWjj6IKdN+hurNS0
 Hndr3OHtFadztpA6dmUqsGZCPwoSouMTTwZzBEwLd6psjiikIdiFoLLWjvyC46u81dcp2E
 ZTG8FFc2InTQ76DmH1BwbGIDkCrLpd8=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-157-t90GVz1XPsqNe8MPu4UYCA-1; Wed, 10 Mar 2021 10:59:10 -0500
X-MC-Unique: t90GVz1XPsqNe8MPu4UYCA-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id E82C71005D4A;
 Wed, 10 Mar 2021 15:59:08 +0000 (UTC)
Received: from localhost (ovpn-115-159.ams2.redhat.com [10.36.115.159])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 8D56A5C22A;
 Wed, 10 Mar 2021 15:59:08 +0000 (UTC)
From: Max Reitz <mreitz@redhat.com>
To: qemu-block@nongnu.org
Subject: [PATCH 0/4] qcow2: Improve refcount structure rebuilding
Date: Wed, 10 Mar 2021 16:59:02 +0100
Message-Id: <20210310155906.147478-1-mreitz@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=mreitz@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=mreitz@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.243,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: Kevin Wolf <kwolf@redhat.com>, qemu-devel@nongnu.org,
 Max Reitz <mreitz@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Hi,

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

So patch 1 modifies the algorithm to put the reftable into the first
free space in the image, and patch 4 adds a test.  So that we can make
patch 4 a bit nicer, patches 2 and 3 are included.  (In case you don’t
like anything about 2 or 3, I also have a version of this series without
patches 2 and 3, where 4 is correspondingly unnicer.)


Max Reitz (4):
  qcow2: Improve refcount structure rebuilding
  iotests/common.qemu: Add _cleanup_single_qemu
  iotests/common.qemu: Allow using the QSD
  iotests/108: Test new refcount rebuild algorithm

 block/qcow2-refcount.c         | 126 ++++++++--------
 tests/qemu-iotests/108         | 259 +++++++++++++++++++++++++++++++++
 tests/qemu-iotests/108.out     |  80 ++++++++++
 tests/qemu-iotests/common.qemu | 108 ++++++++++----
 4 files changed, 483 insertions(+), 90 deletions(-)

-- 
2.29.2


