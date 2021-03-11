Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3CF7B336D57
	for <lists+qemu-devel@lfdr.de>; Thu, 11 Mar 2021 08:54:39 +0100 (CET)
Received: from localhost ([::1]:56112 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lKG9W-0004yE-85
	for lists+qemu-devel@lfdr.de; Thu, 11 Mar 2021 02:54:38 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:60920)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1lKG7k-0003aJ-3T
 for qemu-devel@nongnu.org; Thu, 11 Mar 2021 02:52:48 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:28477)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1lKG7V-00079Y-5J
 for qemu-devel@nongnu.org; Thu, 11 Mar 2021 02:52:47 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1615449151;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=C6vzTcklBr6WtnMPezjBbgx9zEFFj8j7O6y9V3Fz+to=;
 b=Pf6qGti6yeGwlDjvUUvycawJnGGmHtRec7AaMaw+3OYWhgMlK9YHI//tlBUG0hgfw3m9oo
 NeSRFor9J5MrH3PEAfTUHCMeJnOWYxWW/0JL2OdQgr0sPds4DMKTEnP5hiUM8edw7zuoY7
 +xgSuth8GIsUETqewFrh3s1EGBl3eKM=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-294-Gzfj83YbM0-B_yKFF98lBQ-1; Thu, 11 Mar 2021 02:52:27 -0500
X-MC-Unique: Gzfj83YbM0-B_yKFF98lBQ-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 8D53510866A7;
 Thu, 11 Mar 2021 07:52:26 +0000 (UTC)
Received: from blackfin.pond.sub.org (ovpn-112-83.phx2.redhat.com
 [10.3.112.83])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 079CA453B;
 Thu, 11 Mar 2021 07:52:23 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id 842551132C12; Thu, 11 Mar 2021 08:52:21 +0100 (CET)
From: Markus Armbruster <armbru@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v4 0/4] Drop deprecated floppy config & bogus -drive if=T
Date: Thu, 11 Mar 2021 08:52:17 +0100
Message-Id: <20210311075221.1795266-1-armbru@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=armbru@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=63.128.21.124; envelope-from=armbru@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.243,
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
Cc: kwolf@redhat.com, berrange@redhat.com, qemu-block@nongnu.org,
 libvir-list@redhat.com, richard.henderson@linaro.org, mreitz@redhat.com,
 jsnow@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

v4:
* PATCH 3: Move a declaration into a loop [Richard]
* PATCH 4: Drop a superfluous call to drive_check_orphaned() [Daniel],
  fix comments [John]

v3:
* PATCH 1: New [Daniel]

v2:
* Rebased, straightforward conflict with commit f5d33dd51f
  "hw/block/fdc: Remove the check_media_rate property" resolved
* PATCH 2: Commit message fixed [Kevin]

Markus Armbruster (4):
  docs/system/deprecated: Fix note on fdc drive properties
  fdc: Drop deprecated floppy configuration
  fdc: Inline fdctrl_connect_drives() into fdctrl_realize_common()
  blockdev: Drop deprecated bogus -drive interface type

 docs/system/deprecated.rst       |  33 --
 docs/system/removed-features.rst |  56 +++
 include/sysemu/blockdev.h        |   1 -
 blockdev.c                       |  37 +-
 hw/block/fdc.c                   |  73 +---
 softmmu/vl.c                     |  11 +-
 tests/qemu-iotests/172           |  31 +-
 tests/qemu-iotests/172.out       | 562 +------------------------------
 8 files changed, 82 insertions(+), 722 deletions(-)

-- 
2.26.2


