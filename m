Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4B5013A693E
	for <lists+qemu-devel@lfdr.de>; Mon, 14 Jun 2021 16:47:44 +0200 (CEST)
Received: from localhost ([::1]:58926 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lsnsN-0008Nw-1n
	for lists+qemu-devel@lfdr.de; Mon, 14 Jun 2021 10:47:43 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40914)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mreitz@redhat.com>) id 1lsnp7-0003UA-Gz
 for qemu-devel@nongnu.org; Mon, 14 Jun 2021 10:44:24 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:43313)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mreitz@redhat.com>) id 1lsnp1-0004LU-7J
 for qemu-devel@nongnu.org; Mon, 14 Jun 2021 10:44:21 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1623681854;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=AY0mNK7HSkvl1J5P0mVpg95ZWZXsr6V+voP+ifgIKHQ=;
 b=GuLpYag/ZVH+oQYpkUawIDI/UNJyeZQyTcuc/76iiMFNBriNyUZnGXhoPkggz/JHZafZHa
 lz+kvEGY9RIDboz8dzhoBHbRy36WEecuqIpHbY8J5iD36M8V3g37oi62xiubw+pXvfNpEe
 njnDhOmcNfruq25wW0JN9OGyLp6X4Ac=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-573-ohurGHGeNG2uJc2cy9Yu8g-1; Mon, 14 Jun 2021 10:44:10 -0400
X-MC-Unique: ohurGHGeNG2uJc2cy9Yu8g-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id CB2D3100C661;
 Mon, 14 Jun 2021 14:44:09 +0000 (UTC)
Received: from localhost (ovpn-114-163.ams2.redhat.com [10.36.114.163])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 7576910016FE;
 Mon, 14 Jun 2021 14:44:09 +0000 (UTC)
From: Max Reitz <mreitz@redhat.com>
To: qemu-block@nongnu.org
Subject: [PATCH 0/4] export/fuse: Allow other users access to the export
Date: Mon, 14 Jun 2021 16:44:03 +0200
Message-Id: <20210614144407.134243-1-mreitz@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=mreitz@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=216.205.24.124; envelope-from=mreitz@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.2,
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
Cc: Kevin Wolf <kwolf@redhat.com>, qemu-devel@nongnu.org,
 Max Reitz <mreitz@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Hi,

With the default mount options, FUSE mounts are not accessible to any
users but the one who did the mount, not even to root.  To allow such
accesses, allow_other must be passed.

This is probably useful to some people (it certainly is to me, e.g. when
exporting some image as my normal user, and then trying to loop mount it
as root), so this series adds a QAPI allow-other bool that will make the
FUSE export code pass allow_other,default_permissions to FUSE.

(default_permissions will make the kernel do the usual UNIX permission
checks, which is something that makes a lot of sense when allowing other
users access to the export.)

This also requires our SETATTR code to be able to handle permission
changes, though, so the user can then run chmod/chown/chgrp on the
export to adjust its permissions to their need.

The final patch adds a test.


Max Reitz (4):
  export/fuse: Add allow-other option
  export/fuse: Give SET_ATTR_SIZE its own branch
  export/fuse: Let permissions be adjustable
  iotests/308: Test allow-other

 qapi/block-export.json     | 11 ++++-
 block/export/fuse.c        | 83 +++++++++++++++++++++++++---------
 tests/qemu-iotests/308     | 91 ++++++++++++++++++++++++++++++++++++++
 tests/qemu-iotests/308.out | 47 ++++++++++++++++++++
 4 files changed, 210 insertions(+), 22 deletions(-)

-- 
2.31.1


