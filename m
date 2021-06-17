Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4432B3AB7F9
	for <lists+qemu-devel@lfdr.de>; Thu, 17 Jun 2021 17:55:34 +0200 (CEST)
Received: from localhost ([::1]:59614 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ltuMd-0008LK-PE
	for lists+qemu-devel@lfdr.de; Thu, 17 Jun 2021 11:55:32 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43758)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mreitz@redhat.com>) id 1ltuK9-0005S6-A1
 for qemu-devel@nongnu.org; Thu, 17 Jun 2021 11:52:57 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:38219)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mreitz@redhat.com>) id 1ltuK5-0001DL-O3
 for qemu-devel@nongnu.org; Thu, 17 Jun 2021 11:52:57 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1623945172;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=EbQTSkOZ+GN+TXbgcnDjhJjuIcA0PdDOaxmXokgeYXM=;
 b=Brs1zsSOu7FN7G6ZE4Z0dqLWnyZPX8RkmM+JPoOcn7GUUUNHPzsBV3fw9qujs1wLRPukPP
 AiNY4s/84nLjjqdczjPcKqfIeFsAUCjLOonrPUCgH/9/O1Laumc+2iillcQwNpDfh4aQTx
 v3EiM//PkPwHR+m5DpmT8PZbmalpTyU=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-322-JcYR79RsN4eskzCZL1_x0A-1; Thu, 17 Jun 2021 11:52:49 -0400
X-MC-Unique: JcYR79RsN4eskzCZL1_x0A-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 05263801106;
 Thu, 17 Jun 2021 15:52:49 +0000 (UTC)
Received: from localhost (ovpn-114-231.ams2.redhat.com [10.36.114.231])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id A5A555D9C6;
 Thu, 17 Jun 2021 15:52:48 +0000 (UTC)
From: Max Reitz <mreitz@redhat.com>
To: qemu-block@nongnu.org
Subject: [PATCH 0/6] block: block-status cache for data regions
Date: Thu, 17 Jun 2021 17:52:41 +0200
Message-Id: <20210617155247.442150-1-mreitz@redhat.com>
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
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.197,
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

We’ve already had two attempts at introducing a block-status cache for
data regions
(https://lists.gnu.org/archive/html/qemu-devel/2019-01/msg06451.html,
"file-posix: Cache lseek result for data regions";
https://lists.nongnu.org/archive/html/qemu-block/2021-02/msg00934.html,
"file-posix: Cache next hole"), both of which were local to file-posix.

I have a gitlab issue assigned to me
(https://gitlab.com/qemu-project/qemu/-/issues/307), so I suppose it’s
time for round three.

This series tries to address what I gathered from the reviews for both:
(1) We should try to have this cache in the general block layer for all
protocol drivers; (2) Just to be sure, we should have a mutex for it;
(3) External writers don’t matter if we just cache data regions, because
(for a protocol node) reporting a zero region as data isn’t fatal.

Patch 1 is clean-up, patch 2 is the main one, patches 3 to 6 make it
more useful: Some protocol drivers force-clamp the returned *pnum based
on the @bytes parameter, but that’s completely unnecessary, because
bdrv_co_block_status() will clamp the value, too.  It’s beneficial to
return as large a *pnum value as possible to bdrv_co_block_status(), so
our cache can be more effective.


Max Reitz (6):
  block: Drop BDS comment regarding bdrv_append()
  block: block-status cache for data regions
  block/file-posix: Do not force-cap *pnum
  block/gluster: Do not force-cap *pnum
  block/nbd: Do not force-cap *pnum
  block/iscsi: Do not force-cap *pnum

 include/block/block_int.h | 21 ++++++++--
 block.c                   |  2 +
 block/file-posix.c        |  7 ++--
 block/gluster.c           |  7 ++--
 block/io.c                | 80 +++++++++++++++++++++++++++++++++++++--
 block/iscsi.c             |  3 --
 block/nbd.c               |  2 +-
 7 files changed, 105 insertions(+), 17 deletions(-)

-- 
2.31.1


