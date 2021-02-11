Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id AC19C3190F9
	for <lists+qemu-devel@lfdr.de>; Thu, 11 Feb 2021 18:27:38 +0100 (CET)
Received: from localhost ([::1]:46406 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lAFkf-0002MG-8L
	for lists+qemu-devel@lfdr.de; Thu, 11 Feb 2021 12:27:37 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:55328)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mreitz@redhat.com>) id 1lAFg9-0008Ve-4a
 for qemu-devel@nongnu.org; Thu, 11 Feb 2021 12:22:57 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:29570)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <mreitz@redhat.com>) id 1lAFg6-0006VO-HY
 for qemu-devel@nongnu.org; Thu, 11 Feb 2021 12:22:56 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1613064170;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=4pS60uqwzQDcSCerIlxbQ+xZQr9tId7w9RQeOKwAx54=;
 b=dIiQljgl+JoTA+bGS3eXnsI9U986Muyt2+qYuhxDbD6p4EBWAAOJZrO67laQWnOsklA+0f
 oUkxGHHPnEyZXo39hVmuutZEauAAmkVUvJ7CveHZj40wPe3iGJlO5+xDhFPzc0E1bZ2HEv
 pK3mU2PIp0Sj80fipW9C7yKpkCx976A=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-27-nfqTGMSlNRq7g9BNbgH9gg-1; Thu, 11 Feb 2021 12:22:45 -0500
X-MC-Unique: nfqTGMSlNRq7g9BNbgH9gg-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 5617F1966320;
 Thu, 11 Feb 2021 17:22:44 +0000 (UTC)
Received: from localhost (ovpn-114-199.ams2.redhat.com [10.36.114.199])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id EDBCA67CC0;
 Thu, 11 Feb 2021 17:22:43 +0000 (UTC)
From: Max Reitz <mreitz@redhat.com>
To: qemu-block@nongnu.org
Subject: [PATCH 0/2] file-posix: Cache next hole
Date: Thu, 11 Feb 2021 18:22:40 +0100
Message-Id: <20210211172242.146671-1-mreitz@redhat.com>
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
X-Spam_score_int: -33
X-Spam_score: -3.4
X-Spam_bar: ---
X-Spam_report: (-3.4 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.569,
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
Cc: Kevin Wolf <kwolf@redhat.com>,
 Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>, qemu-devel@nongnu.org,
 Max Reitz <mreitz@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Hi,

On Launchpad, Alexandre has reported a performance problem with
SEEK_HOLE on filesystems with much fragmentation:

  https://bugs.launchpad.net/qemu/+bug/1912224

This isn’t the first report we’ve received on SEEK_HOLE being slow, and
we’ve already taken measures to address this issue.  For example,
block-status has a @want_zero parameter so that we won’t do such a seek
operation unless the caller needs that information.  qcow2 tries to
avoid falling through to the protocol level, because most of the time,
it itself knows well which clusters are zero and which aren’t.

But both of these measures don’t work e.g. when mirroring a raw file,
when we want to look up zero areas (because it may speed up the mirror
and save space), and where we don’t have a format layer that has
randomly accessible zero information.

Alexandre proposed caching the offset of the next hole, which we can do
in file-posix (unless the WRITE permission is shared), and which works
best for images that are (nearly) fully allocated.  Such images are also
the ones that profit the least off of the time lost on SEEK_HOLE
operations, i.e. where it’s most important to keep that time low.

I understand that caching filesystem information in file-posix is a bit
weird, but I’d like to hear what you think.  Alexandre has reported that
it alleviated his problem quite significantly (see comment 8 in the LP
report).


(Speaking of “unless the WRITE permission is shared”: mirror_top is a
bit broken in that it takes no permissions (but WRITE if necessary) and
shares everything.  That seems wrong.  Patch 1 addresses that, so that
patch 2 can actually do something when mirroring an image.)


Max Reitz (2):
  block/mirror: Fix mirror_top's permissions
  file-posix: Cache next hole

 block/file-posix.c | 81 +++++++++++++++++++++++++++++++++++++++++++++-
 block/mirror.c     | 32 ++++++++++++++----
 2 files changed, 105 insertions(+), 8 deletions(-)

-- 
2.29.2


