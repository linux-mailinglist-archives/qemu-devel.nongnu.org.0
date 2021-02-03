Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9865530DA77
	for <lists+qemu-devel@lfdr.de>; Wed,  3 Feb 2021 14:02:55 +0100 (CET)
Received: from localhost ([::1]:53050 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l7Ho6-0005Mq-Lx
	for lists+qemu-devel@lfdr.de; Wed, 03 Feb 2021 08:02:54 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:50160)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pkrempa@redhat.com>)
 id 1l7HlV-00041C-1B
 for qemu-devel@nongnu.org; Wed, 03 Feb 2021 08:00:13 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:20093)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <pkrempa@redhat.com>)
 id 1l7HlS-0003n3-04
 for qemu-devel@nongnu.org; Wed, 03 Feb 2021 08:00:12 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1612357207;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=NDoWudyAv7In7B/rsY1fPqUb2ZzJ8o2vOB4yQ1hNP1w=;
 b=fJJXmUiigCQ0qSO58v805gq2AsGIVJpPDGdycw1MbYXifCWA+mdb2BxQTJwlAmvLfJSU/e
 xB/KI/zZwzOFC4qInqPxj9NZiMbkxRW6kNU6OcptFiJl7v09QwhDO0mjNrFNz0FijhsJBn
 hD8olZ0qu8/CAT+qWnmiXsaz8imTh3U=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-246-IGzaqiTnNLyiLveCr9g-Iw-1; Wed, 03 Feb 2021 08:00:04 -0500
X-MC-Unique: IGzaqiTnNLyiLveCr9g-Iw-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id CD0B6107ACC7;
 Wed,  3 Feb 2021 13:00:03 +0000 (UTC)
Received: from speedmetal.lan (unknown [10.40.208.53])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 12B1C6F979;
 Wed,  3 Feb 2021 13:00:01 +0000 (UTC)
From: Peter Krempa <pkrempa@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 0/2] migration: dirty-bitmap: Allow control of bitmap
 persistence on destination
Date: Wed,  3 Feb 2021 13:59:58 +0100
Message-Id: <cover.1612356810.git.pkrempa@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=pkrempa@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=63.128.21.124; envelope-from=pkrempa@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -32
X-Spam_score: -3.3
X-Spam_bar: ---
X-Spam_report: (-3.3 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.539,
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
Cc: John Snow <jsnow@redhat.com>,
 Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>,
 Markus Armbruster <armbru@redhat.com>, qemu-block@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

See 2/2 for explanation.

Please let me know if I need to add any tests for this.

Peter Krempa (2):
  migration: dirty-bitmap: Convert alias map inner members to a struct
  migration: dirty-bitmap: Allow control of bitmap persistence on
    destination

 migration/block-dirty-bitmap.c | 67 ++++++++++++++++++++++++++++++----
 qapi/migration.json            |  7 +++-
 2 files changed, 66 insertions(+), 8 deletions(-)

-- 
2.29.2


