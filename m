Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 074FD6ED485
	for <lists+qemu-devel@lfdr.de>; Mon, 24 Apr 2023 20:36:28 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pr0zw-0000IS-Tg; Mon, 24 Apr 2023 14:33:12 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <quintela@redhat.com>)
 id 1pr0za-00008d-JU
 for qemu-devel@nongnu.org; Mon, 24 Apr 2023 14:32:50 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <quintela@redhat.com>)
 id 1pr0zY-0005bj-0p
 for qemu-devel@nongnu.org; Mon, 24 Apr 2023 14:32:49 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1682361164;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=25OUXbetfEtVW4TtQFUrhbSobX7X9vtoMlSfwobeOpU=;
 b=FqQSsD7Ro0VaQgCmfQKkYR+P0nBbdu6r14qQJWPaHgwb013kH41qM2OFgAnRkza5llHSmH
 U5p5+aR+obsy0XDG9gfmhlrm6S+n06pGONM43Y8Fwjr5Nj82woCM2U2UeIxJuJv00/p2in
 sjigGZQl/fGJ67bXAapJQRmMb2Wd2g8=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-672-NE_WwPpSPjmnzQtNwpj2ug-1; Mon, 24 Apr 2023 14:32:39 -0400
X-MC-Unique: NE_WwPpSPjmnzQtNwpj2ug-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.rdu2.redhat.com
 [10.11.54.8])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 4E1E93C0E451;
 Mon, 24 Apr 2023 18:32:39 +0000 (UTC)
Received: from secure.mitica (unknown [10.39.192.57])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 75AD2C15BA0;
 Mon, 24 Apr 2023 18:32:37 +0000 (UTC)
From: Juan Quintela <quintela@redhat.com>
To: qemu-devel@nongnu.org
Cc: Vladimir Sementsov-Ogievskiy <vsementsov@yandex-team.ru>,
 Leonardo Bras <leobras@redhat.com>, Stefan Hajnoczi <stefanha@redhat.com>,
 Fam Zheng <fam@euphon.net>, Juan Quintela <quintela@redhat.com>,
 qemu-block@nongnu.org, Peter Xu <peterx@redhat.com>,
 Eric Blake <eblake@redhat.com>, John Snow <jsnow@redhat.com>
Subject: [PATCH v3 00/13] Migration: Create options.c for
 capabilities/params/properties
Date: Mon, 24 Apr 2023 20:32:23 +0200
Message-Id: <20230424183236.74561-1-quintela@redhat.com>
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.8
Received-SPF: pass client-ip=170.10.133.124; envelope-from=quintela@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -22
X-Spam_score: -2.3
X-Spam_bar: --
X-Spam_report: (-2.3 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.171,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

Hi

In this v3:
- Rebase on top of latest.
- Fix review of migrate_use_tls() comments.
- Remaining of the patches not yet reviewed.

Please review.

[v2]
- the first two patches are included on the last pull request.
- Changed copyright from Anthony to Orit (thanks David)
  Some archeology required.
- Get all the reviews by from Vladimir.
- Rebased on top of my last pull request.

The first two patches don't belong in this series, but without them I
got lots of confilcts if you try to use the series.  That two patches
are independently on the list.

Please review.

[v1]
This series move to options.c:
- all migration capabilities code
- all migration parameters code
- all properties code
- all qmp commands that only touch the previous

And once there:
- sort of functions
- make consistent and coherent all the functions naming/typing
- create accessors for the parameters/capabilties that don't exist
- more cleanups here and there.

Todo:

- There is still capabilities code on savevm.c, but I want this in
  before moving that code to options.c, but still needs more thought
  for my part. I.e. should I put vmstate sections in options.c, or
  should I create new functions to access the capabilities in savevm.c.

Please review.

Juan Quintela (13):
  migration: Move migrate_use_tls() to options.c
  migration: Move qmp_migrate_set_parameters() to options.c
  migration: Create migrate_params_init() function
  migration: Make all functions check have the same format
  migration: Create migrate_downtime_limit() function
  migration: Move migrate_set_block_incremental() to options.c
  migration: Move block_cleanup_parameters() to options.c
  migration: Remove MigrationState from block_cleanup_parameters()
  migration: Create migrate_tls_creds() function
  migration: Create migrate_tls_authz() function
  migration: Create migrate_tls_hostname() function
  migration: Create migrate_block_bitmap_mapping() function
  migration: Move migration_properties to options.c

 migration/block-dirty-bitmap.c |  14 +-
 migration/migration.c          | 640 +-------------------------
 migration/migration.h          |   2 -
 migration/options.c            | 818 ++++++++++++++++++++++++++++-----
 migration/options.h            |  30 ++
 migration/tls.c                |  23 +-
 6 files changed, 761 insertions(+), 766 deletions(-)

-- 
2.39.2


