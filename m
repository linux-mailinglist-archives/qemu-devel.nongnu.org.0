Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 315754756DA
	for <lists+qemu-devel@lfdr.de>; Wed, 15 Dec 2021 11:48:34 +0100 (CET)
Received: from localhost ([::1]:45014 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mxRpp-0006bg-Al
	for lists+qemu-devel@lfdr.de; Wed, 15 Dec 2021 05:48:33 -0500
Received: from eggs.gnu.org ([209.51.188.92]:38630)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <quintela@redhat.com>)
 id 1mxRaS-0002wW-O4
 for qemu-devel@nongnu.org; Wed, 15 Dec 2021 05:32:42 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:49011)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <quintela@redhat.com>)
 id 1mxRaC-0007FL-Sy
 for qemu-devel@nongnu.org; Wed, 15 Dec 2021 05:32:37 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1639564343;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=/xg9pKuVshTjkGHOWXhIuZ2jFERr8t8CR02un7SN9aU=;
 b=F15lkJ053l01YiCtW8+zq5GnERvd3m09vNZz7LTWvd4a3nM15ahjatpZUOtF3V6y28W1VL
 ut6M8T2oO5H0akgut/hYJCd7iSs2aPWWJSV0P1DIHM0bvXQ9C2ZyvnzEiLM85afpNRCF7t
 InEqNyyX1Z2fFxu2oH+l/pvBZUc04MQ=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-582-QDnU5yOwMeiECa1dcum3SA-1; Wed, 15 Dec 2021 05:32:22 -0500
X-MC-Unique: QDnU5yOwMeiECa1dcum3SA-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 1740810144E3;
 Wed, 15 Dec 2021 10:32:21 +0000 (UTC)
Received: from secure.mitica (unknown [10.39.192.37])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 78FC575C3A;
 Wed, 15 Dec 2021 10:32:19 +0000 (UTC)
From: Juan Quintela <quintela@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 00/18] Migration 20211214 patches
Date: Wed, 15 Dec 2021 11:32:00 +0100
Message-Id: <20211215103218.17527-1-quintela@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=quintela@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=170.10.133.124; envelope-from=quintela@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.719,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
 Hailiang Zhang <zhang.zhanghailiang@huawei.com>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 Juan Quintela <quintela@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

The following changes since commit 76b56fdfc9fa43ec6e5986aee33f108c6c6a511e=
:=0D
=0D
  Merge tag 'block-pull-request' of https://gitlab.com/stefanha/qemu into s=
taging (2021-12-14 12:46:18 -0800)=0D
=0D
are available in the Git repository at:=0D
=0D
  https://gitlab.com/juan.quintela/qemu.git tags/migration-20211214-pull-re=
quest=0D
=0D
for you to fetch changes up to a5ed22948873b50fcf1415d1ce15c71d61a9388d:=0D
=0D
  multifd: Make zlib compression method not use iovs (2021-12-15 10:38:34 +=
0100)=0D
=0D
----------------------------------------------------------------=0D
Migration Pull request=0D
=0D
Hi=0D
=0D
This are the reviewed patches for the freeze period:=0D
=0D
- colo: fix/optimize several things (rao, chen)=0D
- shutdown qio channels correctly when an error happens (li)=0D
- serveral multifd patches for the zero series (me)=0D
=0D
Please apply.=0D
=0D
Thanks, Juan.=0D
=0D
----------------------------------------------------------------=0D
=0D
Juan Quintela (12):=0D
  migration: Remove is_zero_range()=0D
  dump: Remove is_zero_page()=0D
  multifd: Delete useless operation=0D
  migration: Never call twice qemu_target_page_size()=0D
  multifd: Rename used field to num=0D
  multifd: Add missing documention=0D
  multifd: The variable is only used inside the loop=0D
  multifd: remove used parameter from send_prepare() method=0D
  multifd: remove used parameter from send_recv_pages() method=0D
  multifd: Fill offset and block for reception=0D
  multifd: Make zstd compression method not use iovs=0D
  multifd: Make zlib compression method not use iovs=0D
=0D
Li Zhang (1):=0D
  multifd: Shut down the QIO channels to avoid blocking the send threads=0D
    when they are terminated.=0D
=0D
Rao, Lei (3):=0D
  migration/ram.c: Remove the qemu_mutex_lock in colo_flush_ram_cache.=0D
  Fixed a QEMU hang when guest poweroff in COLO mode=0D
  COLO: Move some trace code behind qemu_mutex_unlock_iothread()=0D
=0D
Zhang Chen (2):=0D
  migration/colo: More accurate update checkpoint time=0D
  migration/colo: Optimize COLO primary node start code path=0D
=0D
 include/migration/colo.h |  1 +=0D
 migration/multifd.h      |  6 ++--=0D
 dump/dump.c              | 10 +-----=0D
 migration/colo.c         | 33 ++++++++++++++-----=0D
 migration/migration.c    | 26 +++++++++------=0D
 migration/multifd-zlib.c | 48 +++++++++++++--------------=0D
 migration/multifd-zstd.c | 47 ++++++++++++---------------=0D
 migration/multifd.c      | 70 +++++++++++++++++++++-------------------=0D
 migration/ram.c          | 11 ++-----=0D
 migration/savevm.c       |  5 +--=0D
 10 files changed, 131 insertions(+), 126 deletions(-)=0D
=0D
--=20=0D
2.33.1=0D
=0D


