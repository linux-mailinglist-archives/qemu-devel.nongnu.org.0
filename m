Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5AFF53D173E
	for <lists+qemu-devel@lfdr.de>; Wed, 21 Jul 2021 21:49:07 +0200 (CEST)
Received: from localhost ([::1]:35698 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m6IDK-00018R-0U
	for lists+qemu-devel@lfdr.de; Wed, 21 Jul 2021 15:49:06 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34644)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eblake@redhat.com>) id 1m6IBw-0007pE-5a
 for qemu-devel@nongnu.org; Wed, 21 Jul 2021 15:47:40 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:42869)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eblake@redhat.com>) id 1m6IBt-0005W0-K2
 for qemu-devel@nongnu.org; Wed, 21 Jul 2021 15:47:39 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1626896856;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=YPqbx6vQcf9i3jRCJWyI5iSxH+aBXxbBnbMCLF0vMyY=;
 b=NTNqnou0h7/7wrhUCXSPsxNzjDRthmVN2JJJA4mBK1yTa0FpnnAPUH96A61KZnl4KHBcOj
 UfUN1DhPBhsYuVOVpU0msltNqiEN6QFAmdMh9/rBDDggulgaNexbtYPqEV02wxBLFqmqS3
 JXyvA1gXBDuoJF9W0b0FYhmkNCrUl84=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-210-tXCh6RWDNIyrknViQCyI8A-1; Wed, 21 Jul 2021 15:47:33 -0400
X-MC-Unique: tXCh6RWDNIyrknViQCyI8A-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id AD0B3185303C
 for <qemu-devel@nongnu.org>; Wed, 21 Jul 2021 19:47:32 +0000 (UTC)
Received: from blue.redhat.com (ovpn-112-216.phx2.redhat.com [10.3.112.216])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 7E72D69CB6
 for <qemu-devel@nongnu.org>; Wed, 21 Jul 2021 19:47:32 +0000 (UTC)
From: Eric Blake <eblake@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 0/3] block bitmaps patches for rc1, 2021-07-21
Date: Wed, 21 Jul 2021 14:47:26 -0500
Message-Id: <20210721194729.648763-1-eblake@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=eblake@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=170.10.133.124; envelope-from=eblake@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -42
X-Spam_score: -4.3
X-Spam_bar: ----
X-Spam_report: (-4.3 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1.459,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

The following changes since commit e77c8b8b8e933414ef07dbed04e02973fccffeb0:

  Update version for v6.1.0-rc0 release (2021-07-21 17:10:15 +0100)

are available in the Git repository at:

  https://repo.or.cz/qemu/ericb.git tags/pull-bitmaps-2021-07-21

for you to fetch changes up to 955171e4417bf39edb5503e694501e082a757731:

  qemu-img: Add --skip-broken-bitmaps for 'convert --bitmaps' (2021-07-21 14:14:41 -0500)

----------------------------------------------------------------
block bitmaps patches for 2021-07-21

- fix 'qemu-img convert --bitmaps' handling of qcow2 files with
  inconsistent bitmaps

----------------------------------------------------------------
Eric Blake (3):
      iotests: Improve and rename test 291 to qemu-img-bitmap
      qemu-img: Fail fast on convert --bitmaps with inconsistent bitmap
      qemu-img: Add --skip-broken-bitmaps for 'convert --bitmaps'

 docs/tools/qemu-img.rst                            |  8 ++-
 block/dirty-bitmap.c                               |  2 +-
 qemu-img.c                                         | 50 ++++++++++++++--
 tests/qemu-iotests/{291 => tests/qemu-img-bitmaps} | 34 ++++++++++-
 .../{291.out => tests/qemu-img-bitmaps.out}        | 67 +++++++++++++++++++++-
 5 files changed, 152 insertions(+), 9 deletions(-)
 rename tests/qemu-iotests/{291 => tests/qemu-img-bitmaps} (79%)
 rename tests/qemu-iotests/{291.out => tests/qemu-img-bitmaps.out} (70%)

-- 
2.31.1


