Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 78F633B9660
	for <lists+qemu-devel@lfdr.de>; Thu,  1 Jul 2021 21:10:47 +0200 (CEST)
Received: from localhost ([::1]:54942 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lz25G-0004Wi-IV
	for lists+qemu-devel@lfdr.de; Thu, 01 Jul 2021 15:10:46 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51806)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eblake@redhat.com>) id 1lz21q-0002KG-0l
 for qemu-devel@nongnu.org; Thu, 01 Jul 2021 15:07:14 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:36635)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eblake@redhat.com>) id 1lz21l-0001he-IC
 for qemu-devel@nongnu.org; Thu, 01 Jul 2021 15:07:12 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1625166428;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=G8TzT9JeYWJHrD4OB1X5YNrak3zip+c2UjIHlaBpdPE=;
 b=L1yyXGAwjTYvjFu89Aa+0NzTAr+j8aHwbCuG9yKxYp9eVMkkV7e/ok7aegngDoEBvKEmrS
 y1b0ItEhGvDvsrYBQzipx/Nv+ILj9XxU5H8T1VSrwjnnT+LZnQAUfNEYR6z98CafIJiV9L
 i+1M4F4+vcNmbqh08avTS6JkEjdrg/k=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-309-Q_8vbMJQPNat_mMoi3S-xA-1; Thu, 01 Jul 2021 15:07:05 -0400
X-MC-Unique: Q_8vbMJQPNat_mMoi3S-xA-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 5F5FF100B3AD;
 Thu,  1 Jul 2021 19:07:04 +0000 (UTC)
Received: from blue.redhat.com (ovpn-114-109.phx2.redhat.com [10.3.114.109])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 9005B18AAB;
 Thu,  1 Jul 2021 19:06:58 +0000 (UTC)
From: Eric Blake <eblake@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v3 0/2] qemu-img: Make unallocated part of backing chain
 obvious in map
Date: Thu,  1 Jul 2021 14:06:53 -0500
Message-Id: <20210701190655.2131223-1-eblake@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=eblake@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=216.205.24.124; envelope-from=eblake@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.402,
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
Cc: kwolf@redhat.com, nsoffer@redhat.com, vsementsov@virtuozzo.com,
 qemu-block@nongnu.org, mreitz@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

v2 was here [1]
in v3:
- pick up iotest change from [2] (rest of that series is abandoned)
- don't change semantics of "depth"
- make new witness unconditional, rather than optional
- spell new witness "present":true/false

[1] https://lists.gnu.org/archive/html/qemu-devel/2021-06/msg02446.html
[2] https://lists.gnu.org/archive/html/qemu-devel/2021-06/msg03006.html

Eric Blake (2):
  iotests: Improve and rename test 309 to nbd-qemu-allocation
  qemu-img: Make unallocated part of backing chain obvious in map

 docs/tools/qemu-img.rst                       |   3 +
 qapi/block-core.json                          |   7 +-
 qemu-img.c                                    |   7 +-
 tests/qemu-iotests/122.out                    |  84 ++++----
 tests/qemu-iotests/154.out                    | 190 +++++++++---------
 tests/qemu-iotests/179.out                    | 133 ++++++++----
 tests/qemu-iotests/223.out                    |  56 +++---
 tests/qemu-iotests/244.out                    |  23 ++-
 tests/qemu-iotests/252.out                    |  10 +-
 tests/qemu-iotests/274.out                    |  48 ++---
 tests/qemu-iotests/291.out                    |  24 +--
 tests/qemu-iotests/309.out                    |  22 --
 .../{309 => tests/nbd-qemu-allocation}        |   5 +-
 .../tests/nbd-qemu-allocation.out             |  32 +++
 14 files changed, 358 insertions(+), 286 deletions(-)
 delete mode 100644 tests/qemu-iotests/309.out
 rename tests/qemu-iotests/{309 => tests/nbd-qemu-allocation} (95%)
 create mode 100644 tests/qemu-iotests/tests/nbd-qemu-allocation.out

-- 
2.31.1


