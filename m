Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7E37255224D
	for <lists+qemu-devel@lfdr.de>; Mon, 20 Jun 2022 18:32:02 +0200 (CEST)
Received: from localhost ([::1]:43542 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o3KJl-00039B-HB
	for lists+qemu-devel@lfdr.de; Mon, 20 Jun 2022 12:32:01 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:52330)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <hreitz@redhat.com>) id 1o3KF6-0005ZN-IY
 for qemu-devel@nongnu.org; Mon, 20 Jun 2022 12:27:12 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:43773)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <hreitz@redhat.com>) id 1o3KF2-0005HO-Qz
 for qemu-devel@nongnu.org; Mon, 20 Jun 2022 12:27:11 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1655742427;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=eyRWkiW642u/K+PTxDs+D/fsJ9wq9V+5UOvFOz1PhfE=;
 b=dTNsI1rLkRo6VR3QIt/jNh6EnReOQTLGrC6xofP9H56wUqpnoE7Lhhgbz3i+5OnkWwtdjF
 o7L2uAV796sLPmaSAtdhKRkKQi0EwO6w8R9qoeBLj7pJtf2lZCHujsxCEzwcykJr7Md1Z4
 7Y+bgW2mGwej4g3778sken8X5eSIEBo=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-331-J-VxE7g2NU-1JzkYPVNAwA-1; Mon, 20 Jun 2022 12:27:06 -0400
X-MC-Unique: J-VxE7g2NU-1JzkYPVNAwA-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.rdu2.redhat.com
 [10.11.54.3])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id ADC74961C01;
 Mon, 20 Jun 2022 16:27:05 +0000 (UTC)
Received: from localhost (unknown [10.39.193.67])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 4C1721121314;
 Mon, 20 Jun 2022 16:27:05 +0000 (UTC)
From: Hanna Reitz <hreitz@redhat.com>
To: qemu-block@nongnu.org
Cc: qemu-devel@nongnu.org, Hanna Reitz <hreitz@redhat.com>,
 Kevin Wolf <kwolf@redhat.com>, Eric Blake <eblake@redhat.com>,
 Markus Armbruster <armbru@redhat.com>
Subject: [PATCH v2 00/12] qemu-img info: Show protocol-level information
Date: Mon, 20 Jun 2022 18:26:52 +0200
Message-Id: <20220620162704.80987-1-hreitz@redhat.com>
MIME-Version: 1.0
Content-type: text/plain
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.3
Received-SPF: pass client-ip=170.10.129.124; envelope-from=hreitz@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 PP_MIME_FAKE_ASCII_TEXT=0.999, RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001,
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Hi,

This series is a v2 to:

https://lists.nongnu.org/archive/html/qemu-block/2022-05/msg00042.html

Like v1, the purpose is to have qemu-img info print the extent-size-hint
for images on filesystems that support it.  In contrast to v1, it does
so in a more complicated way.

v1 printed this information by adding protocol-specific information to
ImageInfo, which Kevin disliked and instead proposed to have ImageInfo
point to full ImageInfo objects for the respective node’s children.

I considered two possible solutions:
(A) Ignore the proposal, but not add protocol-specific information to
    ImageInfo.  Instead, have img_info() itself try to find a clearly
    identifiable protocol node and print its driver-specific information
    alongside the rest of the information.
    I discarded that idea because --output=json is supposed to produce a
    QAPI type, and so this additional information wouldn’t be there.  It
    wouldn’t be great to print more information with --output=human than
    with --output=json.

(B) Somehow let qemu-img info print the block graph.

This implements (B).  I decided against simply putting recursive
ImageInfo objects into ImageInfo, for three reasons:
1. Extremely personal and unsubstantiated opinion: I don’t like it for
   block query functions to return a whole graph.  I prefer query
   functions to work on single nodes and users to manually walk the
   graph if they need information about multiple nodes.

2. ImageInfo already has a link to the backing node’s ImageInfo.  It
   would be strange to link the backing node’s ImageInfo twice (once in
   backing-image, once in the list of all child nodes).

3. query-named-block-nodes returns a list of BlockDeviceInfo objects,
   and every such object has an ImageInfo field.  I think it would be a
   mistake for these ImageInfo fields to be full block subgraphs.
   Now, query-named-block-nodes already has a @flat parameter that can
   be used to suppress the backing-image information that is in
   ImageInfo.  Still, it would be a bad idea to surprise users that
   don’t set it to true (it defaults to false) by blowing up the data
   they get back.  We could add another parameter @nested that needs to
   be explicitly set to true or users will not get the child
   information; but having both @flat and @nested is kind of a bad
   interface.

So I decided to split a new structure BlockNodeInfo off of ImageInfo,
where BlockNodeInfo contains everything that ImageInfo did except for
the backing-image link.  We can then create another structure
BlockGraphInfo that builds on BlockNodeInfo, and in contrast to
ImageInfo has link to all children instead of just backing-image.  We
then let qemu-img info output BlockGraphInfo objects, which works well
because qemu-img info has always ensured the backing-image field would
not be used (so the ImageInfo objects it emitted effectively always were
what are now BlockNodeInfo objects).

(I hope this reorganization isn’t an incompatible change, but I’m not
sure, I have to admit...)

This gets around having to deal with QMP changes relating to ImageInfo
or BlockDeviceInfo (e.g. with query-named-block-nodes), and we don’t
have to worry about the fact that the backing node’s ImageInfo were
duplicated.


There is another potential duplication problem, though: VMDK’s
format-specific info (ImageInfoSpecificVmdk) contains an array of
ImageInfo objects for its extent files.  Just like with backing-image,
it seems not great to duplicate these links.

On closer inspection, however, it turns out that these objects aren’t
actually the extent nodes’ ImageInfo data at all.  These objects are
filled by the VMDK driver with custom information that actually does not
fit the ImageInfo structure, for example, the @format field is not a
block driver type, but a VMDK format, like "SPARSE" or "FLAT".
Therefore, the child links in the new BlockGraphInfo object actually
would not link to duplicate information.

I decided to make that explicit by changing the extent information type
from ImageInfo to a new VmdkExtentInfo type.  I don’t know whether that
is technically an incompatible change, and I don’t know whether it even
matters.  We can skip that type change, and this series should still
work, but I feel like it would have been better for these objects to
have had their own type from the start.


So the final state is that despite the QAPI changes, hopefully only the
qemu-img info output changes, and it now prints every image node’s
subgraph.  This results in an output like the following (for a qcow2
image):

image: test.qcow2
file format: qcow2
virtual size: 64 MiB (67108864 bytes)
disk size: 196 KiB
cluster_size: 65536
Format specific information:
    compat: 1.1
    compression type: zlib
    lazy refcounts: false
    refcount bits: 16
    corrupt: false
    extended l2: false
Child node '/file':
    filename: test.qcow2
    protocol type: file
    file length: 192 KiB (197120 bytes)
    disk size: 196 KiB
    Format specific information:
        extent size hint: 1048576

For reference, the output from v1 was this (with “extent size” corrected
to “extent size hint”):

image: test.qcow2
file format: qcow2
virtual size: 64 MiB (67108864 bytes)
disk size: 196 KiB
cluster_size: 65536
Format specific information:
    compat: 1.1
    compression type: zlib
    lazy refcounts: false
    refcount bits: 16
    corrupt: false
    extended l2: false
Protocol specific information:
    extent size hint: 1048576


I think I still slightly prefer the output from v1, because the
additional information is mostly just duplicated information (and thus
clutters the output), but I can see that hard-adding protocol-specific
information to ImageInfo wasn’t a good way to go about it (and I can’t
find any better reasonable way to only print that driver-specific
information (and nothing else) from the protocol node).


For completeness’s sake, git-backport-diff to v1:

Key:
[----] : patches are identical
[####] : number of functional differences between upstream/downstream patch
[down] : patch is downstream-only
The flags [FC] indicate (F)unctional and (C)ontextual differences, respectively

001/12:[----] [--] 'block: Improve empty format-specific info dump'
002/12:[0008] [FC] 'block/file: Add file-specific image info'
003/12:[down] 'block/vmdk: Change extent info type'
004/12:[down] 'block: Split BlockNodeInfo off of ImageInfo'
005/12:[down] 'qemu-img: Use BlockNodeInfo'
006/12:[down] 'block/qapi: Let bdrv_query_image_info() recurse'
007/12:[down] 'block/qapi: Introduce BlockGraphInfo'
008/12:[down] 'block/qapi: Add indentation to bdrv_node_info_dump()'
009/12:[down] 'iotests: Filter child node information'
010/12:[down] 'iotests/106, 214, 308: Read only one size line'
011/12:[down] 'qemu-img: Let info print block graph'
012/12:[down] 'qemu-img: Change info key names for protocol nodes'


Hanna Reitz (12):
  block: Improve empty format-specific info dump
  block/file: Add file-specific image info
  block/vmdk: Change extent info type
  block: Split BlockNodeInfo off of ImageInfo
  qemu-img: Use BlockNodeInfo
  block/qapi: Let bdrv_query_image_info() recurse
  block/qapi: Introduce BlockGraphInfo
  block/qapi: Add indentation to bdrv_node_info_dump()
  iotests: Filter child node information
  iotests/106, 214, 308: Read only one size line
  qemu-img: Let info print block graph
  qemu-img: Change info key names for protocol nodes

 qapi/block-core.json             | 121 +++++++++++-
 include/block/qapi.h             |  14 +-
 block/file-posix.c               |  30 +++
 block/monitor/block-hmp-cmds.c   |   2 +-
 block/qapi.c                     | 319 ++++++++++++++++++++++++-------
 block/vmdk.c                     |   8 +-
 qemu-img.c                       |  76 +++++---
 qemu-io-cmds.c                   |   5 +-
 tests/qemu-iotests/065           |   2 +-
 tests/qemu-iotests/106           |   4 +-
 tests/qemu-iotests/214           |   6 +-
 tests/qemu-iotests/302.out       |   5 +
 tests/qemu-iotests/308           |   4 +-
 tests/qemu-iotests/common.filter |  22 ++-
 tests/qemu-iotests/common.rc     |  22 ++-
 tests/qemu-iotests/iotests.py    |  18 +-
 16 files changed, 519 insertions(+), 139 deletions(-)

-- 
2.35.3


