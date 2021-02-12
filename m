Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BA4AF31A3B7
	for <lists+qemu-devel@lfdr.de>; Fri, 12 Feb 2021 18:37:20 +0100 (CET)
Received: from localhost ([::1]:58836 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lAcNa-0000ma-Vw
	for lists+qemu-devel@lfdr.de; Fri, 12 Feb 2021 12:37:19 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:48126)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pkrempa@redhat.com>)
 id 1lAcKz-0007RD-Po
 for qemu-devel@nongnu.org; Fri, 12 Feb 2021 12:34:37 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:54907)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <pkrempa@redhat.com>)
 id 1lAcKv-0005kR-Uc
 for qemu-devel@nongnu.org; Fri, 12 Feb 2021 12:34:37 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1613151272;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=WWvIh6higgCC/va2XQuV556fH/sn7OKjeyiliPYuDhU=;
 b=L9RKN8JKr0OqFEvjfnJZcaEkFkDIPcYPvMk6/ikbCa67B4dlaJM9vsnPw8z6BCfSFwwRRQ
 Q16ZxGSXLC9Hvw1U9OdxWLFQgsZVsLKTna+7BYGY1QCuDWXkYnNv4RAbgqTcK80lRSD5Wd
 shiOqHtwh/Ax4J/vYvQEl1oNoQB4x5I=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-337-UCwuDUE2NtOkWAcrb51czQ-1; Fri, 12 Feb 2021 12:34:29 -0500
X-MC-Unique: UCwuDUE2NtOkWAcrb51czQ-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id C2458C28D;
 Fri, 12 Feb 2021 17:34:28 +0000 (UTC)
Received: from speedmetal.lan (unknown [10.40.208.53])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 580A95C23D;
 Fri, 12 Feb 2021 17:34:27 +0000 (UTC)
From: Peter Krempa <pkrempa@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v3 0/3] migration: dirty-bitmap: Allow control of bitmap
 persistence
Date: Fri, 12 Feb 2021 18:34:22 +0100
Message-Id: <cover.1613150869.git.pkrempa@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=pkrempa@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=216.205.24.124; envelope-from=pkrempa@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -33
X-Spam_score: -3.4
X-Spam_bar: ---
X-Spam_report: (-3.4 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.569,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>,
 qemu-block@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

See 2/2 for explanation.

Peter Krempa (3):
  migration: dirty-bitmap: Convert alias map inner members to
    BitmapMigrationBitmapAlias
  migration: dirty-bitmap: Allow control of bitmap persistence
  qemu-iotests: 300: Add test case for modifying persistence of bitmap

 migration/block-dirty-bitmap.c | 60 ++++++++++++++++------
 qapi/migration.json            | 19 ++++++-
 tests/qemu-iotests/300         | 91 ++++++++++++++++++++++++++++++++++
 tests/qemu-iotests/300.out     |  4 +-
 4 files changed, 157 insertions(+), 17 deletions(-)

-- 
2.29.2


