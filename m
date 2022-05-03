Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 24E18519014
	for <lists+qemu-devel@lfdr.de>; Tue,  3 May 2022 23:31:57 +0200 (CEST)
Received: from localhost ([::1]:50488 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nm07g-0006Mc-4w
	for lists+qemu-devel@lfdr.de; Tue, 03 May 2022 17:31:56 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45598)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <hreitz@redhat.com>) id 1nlyyM-0006oA-0r
 for qemu-devel@nongnu.org; Tue, 03 May 2022 16:18:17 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:27589)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <hreitz@redhat.com>) id 1nlyyH-0003h0-Vn
 for qemu-devel@nongnu.org; Tue, 03 May 2022 16:18:12 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1651609088;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=3be/CCx89B5Fv4W76dTMGR8m9fuC+mGprX2whLJA7zQ=;
 b=RgqrLlp9roaqQ9a1LJLVNbudjeN4bRrSSRLz3I1XTIUdIID3myHUKsAMbogm35/oWREB1x
 7CLTpGVSK/KzPmqDkBz+BnseLfE/KLqPiLxo+qKb4MDQ96d6tqs4Qkt9VYFDd1eZL5yFOt
 cxO72SzORzk94R1KXRi0Kdgntw/hE04=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-479-TLWsC7BdNiCKfbRb0yeAMA-1; Tue, 03 May 2022 11:06:38 -0400
X-MC-Unique: TLWsC7BdNiCKfbRb0yeAMA-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.rdu2.redhat.com
 [10.11.54.1])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id A2C3E107D710;
 Tue,  3 May 2022 14:55:30 +0000 (UTC)
Received: from localhost (unknown [10.39.193.124])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 5D2DB400E89D;
 Tue,  3 May 2022 14:55:30 +0000 (UTC)
From: Hanna Reitz <hreitz@redhat.com>
To: qemu-block@nongnu.org
Cc: qemu-devel@nongnu.org, Hanna Reitz <hreitz@redhat.com>,
 Kevin Wolf <kwolf@redhat.com>, Markus Armbruster <armbru@redhat.com>,
 Eric Blake <eblake@redhat.com>
Subject: [PATCH 0/4] block/file: Show extent size in qemu-img info
Date: Tue,  3 May 2022 16:55:25 +0200
Message-Id: <20220503145529.37070-1-hreitz@redhat.com>
MIME-Version: 1.0
Content-type: text/plain
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 2.84 on 10.11.54.1
Received-SPF: pass client-ip=170.10.133.124; envelope-from=hreitz@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
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

This series makes qemu-img info print the extent size of an image file
(if available).  To do so, we have to do a couple of things:
1. Add a .bdrv_get_specific_info handler to the file-posix driver
   (patch 4)
2. Have bdrv_query_image_info() collect this driver-specific info not
   only on the format level, but also on the protocol level (if there is
   an unambiguous node) so we actually get the information from the
   file-posix node when querying whatever format node is on top
   (patch 2)
3. Have bdrv_image_info_dump() print this protocol-level information
   (patch 3)

Extent size informations seems unavailable on ext4 at least, so if we
did just this, you would see the following for an image on ext4:

```
$ qemu-img info -f raw test.img
image: test.img
file format: raw
virtual size: 1 MiB (1048576 bytes)
disk size: 4 KiB
Protocol specific information:
```

That last part looks a bit strange -- it's a heading without a section.
So patch 1 makes bdrv_image_info_specific_dump() omit that heading if
there is no information that can be printed.


Hanna Reitz (4):
  block: Improve empty format-specific info dump
  block: Add protocol-specific image info
  block: Print protocol-specific information
  block/file: Add file-specific image info

 qapi/block-core.json | 32 ++++++++++++++++++++--
 include/block/qapi.h |  3 +-
 block/file-posix.c   | 30 ++++++++++++++++++++
 block/qapi.c         | 65 +++++++++++++++++++++++++++++++++++++++++---
 qemu-io-cmds.c       |  4 +--
 5 files changed, 124 insertions(+), 10 deletions(-)

-- 
2.35.1


