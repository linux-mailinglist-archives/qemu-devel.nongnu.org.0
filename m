Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B5E523027CB
	for <lists+qemu-devel@lfdr.de>; Mon, 25 Jan 2021 17:27:28 +0100 (CET)
Received: from localhost ([::1]:32824 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l44i7-0004Vb-Qr
	for lists+qemu-devel@lfdr.de; Mon, 25 Jan 2021 11:27:27 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:42828)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1l44f3-0001fv-8c
 for qemu-devel@nongnu.org; Mon, 25 Jan 2021 11:24:19 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:22135)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1l44ey-0007jv-MQ
 for qemu-devel@nongnu.org; Mon, 25 Jan 2021 11:24:17 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1611591851;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=krJRkwQ1TbsjG9QBaMpPUDOETpg80Lh/I2lK0lonkEE=;
 b=btOXTFtt04X15DhPpjvYyHw/IuefhXRVm6ndztALCIQ86316ltoqK+UlK/pgCYg8hTaYAc
 eXNasinwY/fbgu7nvLxwkD5qxTQaeWFUvRG7/7dUwqpJmbyAbSPgWOnw4VDVrWI0arQ5ig
 9VSrJz258g4J4uJrPkl+sV3jJRCHjcU=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-70-QOcSclyYPemKXUwGujDZVg-1; Mon, 25 Jan 2021 11:24:09 -0500
X-MC-Unique: QOcSclyYPemKXUwGujDZVg-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 640571934100;
 Mon, 25 Jan 2021 16:24:08 +0000 (UTC)
Received: from blackfin.pond.sub.org (ovpn-113-224.ams2.redhat.com
 [10.36.113.224])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 76E4218A50;
 Mon, 25 Jan 2021 16:24:04 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id 08128113865F; Mon, 25 Jan 2021 17:24:03 +0100 (CET)
From: Markus Armbruster <armbru@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 0/3] Drop deprecated floppy config & bogus -drive if=T
Date: Mon, 25 Jan 2021 17:23:59 +0100
Message-Id: <20210125162402.1807394-1-armbru@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=armbru@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=63.128.21.124; envelope-from=armbru@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -30
X-Spam_score: -3.1
X-Spam_bar: ---
X-Spam_report: (-3.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.255,
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
Cc: kwolf@redhat.com, libvir-list@redhat.com, jsnow@redhat.com,
 qemu-block@nongnu.org, mreitz@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

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
 tests/qemu-iotests/172.out       | 571 +------------------------------
 8 files changed, 59 insertions(+), 728 deletions(-)

-- 
2.26.2


