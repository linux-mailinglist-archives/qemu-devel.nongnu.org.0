Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 940434450DD
	for <lists+qemu-devel@lfdr.de>; Thu,  4 Nov 2021 10:06:01 +0100 (CET)
Received: from localhost ([::1]:37060 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1miYh6-0005fV-I9
	for lists+qemu-devel@lfdr.de; Thu, 04 Nov 2021 05:06:00 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54268)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1miYaJ-0004V2-S9
 for qemu-devel@nongnu.org; Thu, 04 Nov 2021 04:58:59 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:60933)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1miYaH-00015B-Jt
 for qemu-devel@nongnu.org; Thu, 04 Nov 2021 04:58:59 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1636016337;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=BcXO39Hkn0ySdoYMx/qVT463mOPxDrUpXP476StOJeQ=;
 b=geDLWX5m3AtlkwmaTMYWUJRhOEU6ycvfwPaIncn8W6ZGpw6nTgJ+OseWDV0Gk/yIF+ySvo
 NHnEv5Jkl4PoyZB3sKCHOyAlTAgLOXHZ4qj2Ds7ps0/jrB98GeojoR/rusFF/9O7AowXTk
 MdPNv0TLhQb4eS6JFdApxhP8rBIq6pE=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-366-gFCHrnlDOZig-E6Q67yzBA-1; Thu, 04 Nov 2021 04:58:53 -0400
X-MC-Unique: gFCHrnlDOZig-E6Q67yzBA-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 914261006AA5;
 Thu,  4 Nov 2021 08:58:52 +0000 (UTC)
Received: from blackfin.pond.sub.org (ovpn-112-7.ams2.redhat.com [10.36.112.7])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 2FA8C19C79;
 Thu,  4 Nov 2021 08:58:13 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id B453911380A7; Thu,  4 Nov 2021 09:58:11 +0100 (CET)
From: Markus Armbruster <armbru@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v4 0/3] qapi & doc: deprecate drive-backup
Date: Thu,  4 Nov 2021 09:58:08 +0100
Message-Id: <20211104085811.1736654-1-armbru@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=armbru@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=170.10.133.124; envelope-from=armbru@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.717,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: vsementsov@virtuozzo.com, qemu-block@nongnu.org, kchamart@redhat.com,
 libvir-list@redhat.com, jsnow@redhat.com, xiechanglong.d@gmail.com,
 wencongyang2@huawei.com, eblake@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

See 03 commit message for details. 01-02 are preparation docs update.

v4: deprecate drive-backup transaction by squashing
	[PATCH v4 5/5] block: Deprecate transaction type drive-backup
	Message-Id: <20211025042405.3762351-6-armbru@redhat.com>
    into PATCH 3

v3: wording fix-ups and improvements suggested by Kashyap
v2: add a lot of documentation changes
v1 was "[PATCH] qapi: deprecate drive-backup"

Vladimir Sementsov-Ogievskiy (3):
  docs/block-replication: use blockdev-backup
  docs/interop/bitmaps: use blockdev-backup
  qapi: deprecate drive-backup

 docs/about/deprecated.rst              |  11 +
 docs/block-replication.txt             |   4 +-
 docs/interop/bitmaps.rst               | 285 +++++++++++++++++++------
 docs/interop/live-block-operations.rst |  47 ++--
 qapi/block-core.json                   |   5 +-
 qapi/transaction.json                  |   6 +-
 6 files changed, 268 insertions(+), 90 deletions(-)

-- 
2.31.1


