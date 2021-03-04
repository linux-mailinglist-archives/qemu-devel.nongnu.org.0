Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E3B3532D057
	for <lists+qemu-devel@lfdr.de>; Thu,  4 Mar 2021 11:03:07 +0100 (CET)
Received: from localhost ([::1]:43266 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lHkp0-0005pU-Se
	for lists+qemu-devel@lfdr.de; Thu, 04 Mar 2021 05:03:06 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:46038)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1lHkn9-0004GQ-SO
 for qemu-devel@nongnu.org; Thu, 04 Mar 2021 05:01:13 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:26891)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1lHkn5-0002yp-Q7
 for qemu-devel@nongnu.org; Thu, 04 Mar 2021 05:01:11 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1614852067;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=sp3qUZEC+oTTlpUpzRHK/mFEipoyuClwEJwHWhTYUww=;
 b=d9t9FgiUBTU87i2a+7riK2S/0YoAL7XQdz5ei91S2EH9I3GDadjywXgD/E+eQSqDZN3n69
 GTDUDh1urmXGZqBb9ZHGpTc8bUT4MiZSSp0PLTm0EkQ2n4iOqS81suqUrVUvBlrGjU7FfD
 nBjspG1SePG7akDEJLmtPdKKh2WsI9w=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-290-EM1iW705OmqQU4hdVTIGbg-1; Thu, 04 Mar 2021 05:01:05 -0500
X-MC-Unique: EM1iW705OmqQU4hdVTIGbg-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id A4A9D10866A3;
 Thu,  4 Mar 2021 10:01:04 +0000 (UTC)
Received: from blackfin.pond.sub.org (ovpn-112-73.ams2.redhat.com
 [10.36.112.73])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 4819F175BD;
 Thu,  4 Mar 2021 10:01:01 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id CF6D31132C12; Thu,  4 Mar 2021 11:00:59 +0100 (CET)
From: Markus Armbruster <armbru@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 0/3] Drop deprecated floppy config & bogus -drive if=T
Date: Thu,  4 Mar 2021 11:00:56 +0100
Message-Id: <20210304100059.157158-1-armbru@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=armbru@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=63.128.21.124; envelope-from=armbru@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
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
Cc: kwolf@redhat.com, libvir-list@redhat.com, jsnow@redhat.com,
 qemu-block@nongnu.org, mreitz@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

v2:
* Rebased, straightforward conflict with commit f5d33dd51f
  "hw/block/fdc: Remove the check_media_rate property" resolved
* PATCH 2: Commit message fixed [Kevin]

Markus Armbruster (3):
  fdc: Drop deprecated floppy configuration
  fdc: Inline fdctrl_connect_drives() into fdctrl_realize_common()
  blockdev: Drop deprecated bogus -drive interface type

 docs/system/deprecated.rst       |  33 --
 docs/system/removed-features.rst |  33 ++
 include/sysemu/blockdev.h        |   1 -
 blockdev.c                       |  37 +-
 hw/block/fdc.c                   |  73 +---
 softmmu/vl.c                     |   8 +-
 tests/qemu-iotests/172           |  31 +-
 tests/qemu-iotests/172.out       | 562 +------------------------------
 8 files changed, 59 insertions(+), 719 deletions(-)

-- 
2.26.2


