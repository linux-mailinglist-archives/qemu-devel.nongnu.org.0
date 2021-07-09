Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 347F53C25A7
	for <lists+qemu-devel@lfdr.de>; Fri,  9 Jul 2021 16:13:48 +0200 (CEST)
Received: from localhost ([::1]:35854 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m1rGF-00048k-8j
	for lists+qemu-devel@lfdr.de; Fri, 09 Jul 2021 10:13:47 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44790)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eblake@redhat.com>) id 1m1rCc-0006cN-7U
 for qemu-devel@nongnu.org; Fri, 09 Jul 2021 10:10:02 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:20193)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eblake@redhat.com>) id 1m1rCZ-00046U-Ig
 for qemu-devel@nongnu.org; Fri, 09 Jul 2021 10:10:01 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1625839799;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=suXSCQ6TWeerNFFcI8xjK3T8KBmcwtadOKrLQvdXUNk=;
 b=Uc6QoJ0I86B3Mc93lU0zDI8js1neHVEYE4OxC7EHQ6qx27a4QN6MTSyYDAEynQnWrPg/dI
 DxJvr85zWFio+ZWP/5E5ghD8AWsb/RkjDEGGc+pxCpyWekcnxy2205qbIjeOpvFIZG2ehT
 HoXMmB/avqep2XTF477nO3mQM/NogqU=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-350-J7BxEIs5Of--0GfMdKWp0A-1; Fri, 09 Jul 2021 10:09:55 -0400
X-MC-Unique: J7BxEIs5Of--0GfMdKWp0A-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 64BB5CC622
 for <qemu-devel@nongnu.org>; Fri,  9 Jul 2021 14:09:54 +0000 (UTC)
Received: from blue.redhat.com (ovpn-112-103.phx2.redhat.com [10.3.112.103])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 3303D60C04
 for <qemu-devel@nongnu.org>; Fri,  9 Jul 2021 14:09:54 +0000 (UTC)
From: Eric Blake <eblake@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 0/4] NBD patches for soft freeze, 2021-07-09
Date: Fri,  9 Jul 2021 09:09:47 -0500
Message-Id: <20210709140951.2775730-1-eblake@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=eblake@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=170.10.133.124; envelope-from=eblake@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.45,
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

The following changes since commit 9db3065c62a983286d06c207f4981408cf42184d:

  Merge remote-tracking branch 'remotes/vivier2/tags/linux-user-for-6.1-pull-request' into staging (2021-07-08 16:30:18 +0100)

are available in the Git repository at:

  https://repo.or.cz/qemu/ericb.git tags/pull-nbd-2021-07-09

for you to fetch changes up to 62967c9927ec4d733b923c70f9f5428dd1d2e0d7:

  nbd: register yank function earlier (2021-07-09 08:27:33 -0500)

----------------------------------------------------------------
nbd patches for 2021-07-09

- enhance 'qemu-img map --output=json' to make it easier to duplicate
backing chain allocation patterns
- fix a race in the 'yank' QMP command in relation to NBD requests

----------------------------------------------------------------
Eric Blake (3):
      iotests: Improve and rename test 309 to nbd-qemu-allocation
      qemu-img: Make unallocated part of backing chain obvious in map
      qemu-img: Reword 'qemu-img map --output=json' docs

Lukas Straub (1):
      nbd: register yank function earlier

 docs/tools/qemu-img.rst                            |  17 +-
 qapi/block-core.json                               |   7 +-
 block/nbd.c                                        |   8 +-
 qemu-img.c                                         |   7 +-
 tests/qemu-iotests/122.out                         |  84 ++++-----
 tests/qemu-iotests/154.out                         | 190 +++++++++++----------
 tests/qemu-iotests/179.out                         | 133 ++++++++++-----
 tests/qemu-iotests/209.out                         |   4 +-
 tests/qemu-iotests/223.out                         |  56 +++---
 tests/qemu-iotests/244.out                         |  23 +--
 tests/qemu-iotests/252.out                         |  10 +-
 tests/qemu-iotests/274.out                         |  48 +++---
 tests/qemu-iotests/291.out                         |  24 +--
 tests/qemu-iotests/309.out                         |  22 ---
 .../{309 => tests/nbd-qemu-allocation}             |   5 +-
 tests/qemu-iotests/tests/nbd-qemu-allocation.out   |  32 ++++
 16 files changed, 372 insertions(+), 298 deletions(-)
 delete mode 100644 tests/qemu-iotests/309.out
 rename tests/qemu-iotests/{309 => tests/nbd-qemu-allocation} (95%)
 create mode 100644 tests/qemu-iotests/tests/nbd-qemu-allocation.out

-- 
2.31.1


