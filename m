Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 181C234AA9F
	for <lists+qemu-devel@lfdr.de>; Fri, 26 Mar 2021 15:58:43 +0100 (CET)
Received: from localhost ([::1]:38062 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lPnv8-0007md-2g
	for lists+qemu-devel@lfdr.de; Fri, 26 Mar 2021 10:58:42 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35438)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mreitz@redhat.com>) id 1lPnsx-0004u3-Lm
 for qemu-devel@nongnu.org; Fri, 26 Mar 2021 10:56:27 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:53808)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mreitz@redhat.com>) id 1lPnsv-0002ce-Ol
 for qemu-devel@nongnu.org; Fri, 26 Mar 2021 10:56:27 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1616770585;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=DP5Vnbp87+J551Wm+wuLH5G1N48U2L8BiEl2oLUcwH0=;
 b=KARfxOe6RWglCHed0lE0Dfc3ZcHKzX2bS1IfvA++vZl44UBd0IsP92zMyojI+6MzW2aaO5
 kA5bCTlaQSxdD7bHKdmd2fSZHZ5CzJs5ECWaDDmoYqcSRWJaUmhnZYxfNBMDYDrAsB6yiP
 fV20sb3FWJqIV2WpiF/2xmapl67WmY4=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-252-1lf2k7cyMnOJafW8C_Vd1w-1; Fri, 26 Mar 2021 10:56:21 -0400
X-MC-Unique: 1lf2k7cyMnOJafW8C_Vd1w-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id C15AB1098870;
 Fri, 26 Mar 2021 14:55:11 +0000 (UTC)
Received: from localhost (ovpn-113-48.ams2.redhat.com [10.36.113.48])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 3E9FD5D9DE;
 Fri, 26 Mar 2021 14:55:11 +0000 (UTC)
From: Max Reitz <mreitz@redhat.com>
To: qemu-block@nongnu.org
Subject: [PATCH v2 0/2] qcow2: Force preallocation with data-file-raw
Date: Fri, 26 Mar 2021 15:55:07 +0100
Message-Id: <20210326145509.163455-1-mreitz@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=mreitz@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=mreitz@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: Kevin Wolf <kwolf@redhat.com>, Alberto Garcia <berto@igalia.com>,
 qemu-devel@nongnu.org, Max Reitz <mreitz@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

v1: https://lists.nongnu.org/archive/html/qemu-block/2020-06/msg00992.html


Hi,

I think that qcow2 images with data-file-raw should always have
preallocated 1:1 L1/L2 tables, so that the image always looks the same
whether you respect or ignore the qcow2 metadata.  The easiest way to
achieve that is to enforce at least metadata preallocation whenever
data-file-raw is given.

As far as I could tell, there were two main critique points about v1:
(1) If we force metadata preallocation on creation, we should also do it
    when the image is grown.
(2) We could go even further and make qemu ignore all L1/L2 tables for
    images with raw external data files.  Ideally, we wouldn’t even
    write them at all.

(1) is addressed in this v2.

As for (2)...  It’s complicated.  I think we want the fix from this
series now and if we want (2), we can have a go at it later.  Many
things are to be considered there.

For example: data-file-raw is an autoclear flag.  Technically, it is
possible for some qcow2 implementation to support data-file, but not
data-file-raw.  If we ignore metadata for images with data-file-raw, we
would break them, because “ignoring” would mean we don’t even create it,
ever, so the external data file would appear empty to such
implementations.
Now, in practice, there is no such implementation.  data-file-raw has
been introduced alongside data-file.
However, also in practice, qemu always did and still does rely on the
metadata in the qcow2 image.  So we have to ensure the metadata is
there, or all versions of qemu that support data-file will break.

The easiest way to ensure the metadata is there is to preallocate it on
creation/growth.  If at same later point we decide we want to ignore it
on runtime, this preallocation would actually allow us to do that.  So
the preallocation is the necessary first step (the second step would
probably be a second auto-clear flag that states that all metadata has
been preallocated and can thus be ignored at runtime).

((Even today, we could ignore the L2 tables when reading, but the
problems are that (1) images can then appear differently to qemu
versions that do ignore them and versions that don’t, and (2) when
writing to a cluster, we still need to ensure that its L2 entry is there
(i.e., allocated and pointing to the correct offset).  I don’t think it
makes sense to ignore the tables when reading but not when writing.))


There have also been proposals of instead just not writing any metadata.
This would naturally require an incompatible new flag, because such
images would not be usable by current qemu versions.  Such a flag would
make this series unnecessary, but do we really want to break
incompatibility with all qemu versions going back to 4.0 just so we
don’t have to waste space on L2 tables?  Users are free to just use 2M
clusters for data-file-raw images so the wasted space is minimized (to
1/2M of the image size, e.g. 512M per 1T).

And in any case: I think patch 1 is simple enough that we can just take
it now and it wouldn’t be too bad to write it off as a loss if we ever
add an incompatible no-l2 flag.

Point is, we have no actual patches to implement a no-l2 flag, but there
is something that needs to be fixed about raw external data files, and
this series fixes it.


v2:
- Patch 1: Force metadata preallocation when the image is resized
- Patch 2:
  - Use blockdev-create to create the qcow2 image instead of creating
    the qcow2 image first and then (technically illegally) writing to
    the external data file
  - Test growing a qcow2 image with an external data file, where the
    data file is grown first and the new area is filled with data


git-backport-diff against v1:

Key:
[----] : patches are identical
[####] : number of functional differences between upstream/downstream patch
[down] : patch is downstream-only
The flags [FC] indicate (F)unctional and (C)ontextual differences, respectively

001/2:[0012] [FC] 'qcow2: Force preallocation with data-file-raw'
002/2:[0110] [FC] 'iotests/244: Test preallocation for data-file-raw'


Max Reitz (2):
  qcow2: Force preallocation with data-file-raw
  iotests/244: Test preallocation for data-file-raw

 block/qcow2.c              |  34 ++++++++++++
 tests/qemu-iotests/244     | 104 +++++++++++++++++++++++++++++++++++++
 tests/qemu-iotests/244.out |  68 ++++++++++++++++++++++--
 3 files changed, 201 insertions(+), 5 deletions(-)

-- 
2.29.2


