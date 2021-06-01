Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BDD1A396D14
	for <lists+qemu-devel@lfdr.de>; Tue,  1 Jun 2021 07:59:21 +0200 (CEST)
Received: from localhost ([::1]:60716 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lnxQu-0001i0-AY
	for lists+qemu-devel@lfdr.de; Tue, 01 Jun 2021 01:59:20 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57770)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <slp@redhat.com>) id 1lnxPL-00086M-U4
 for qemu-devel@nongnu.org; Tue, 01 Jun 2021 01:57:43 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:42741)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <slp@redhat.com>) id 1lnxPJ-00020h-V1
 for qemu-devel@nongnu.org; Tue, 01 Jun 2021 01:57:43 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1622527060;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=REAMjlgbKVv1FpEmi0AU5ewnvZli0sC6bd97Pas+jfg=;
 b=Emuj8pIpYHaZD2cLWXrZ0apvZSuhaICuQMCJAWBhOxVUFsNWSP98agYEymnBLbvi503BQ4
 aiA1ebpbN3AaC8XCjOn8e8WZuR8nfQ1cK3ArDQ2oOAY7hanO1ZSyfLzwlT4ZEsU8x9LS5R
 3D3Kw4mvcgeidF/iHaYH1w9AY38Vc+c=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-88-7kiSZ8ApMFOcX1b6BsgFzg-1; Tue, 01 Jun 2021 01:57:38 -0400
X-MC-Unique: 7kiSZ8ApMFOcX1b6BsgFzg-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id A1EAC801B14;
 Tue,  1 Jun 2021 05:57:37 +0000 (UTC)
Received: from toolbox.redhat.com (unknown [10.33.36.16])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 8865F69FA4;
 Tue,  1 Jun 2021 05:57:29 +0000 (UTC)
From: Sergio Lopez <slp@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 0/2] nbd/server: Quiesce server on drained section
Date: Tue,  1 Jun 2021 07:57:26 +0200
Message-Id: <20210601055728.90849-1-slp@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=slp@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=170.10.133.124; envelope-from=slp@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.372,
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
Cc: Kevin Wolf <kwolf@redhat.com>,
 Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>,
 Sergio Lopez <slp@redhat.com>, qemu-block@nongnu.org,
 Max Reitz <mreitz@redhat.com>, Nir Soffer <nsoffer@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Before switching between AioContexts we need to make sure that we're=0D
fully quiesced ("nb_requests =3D=3D 0" for every client) when entering the=
=0D
drained section. Otherwise, coroutines may be run in the wrong context=0D
after the switch, leading to a number of critical issues.=0D
=0D
To accomplish this, we add ".drained_poll" to BlockDevOps and use it=0D
in the NBD server, along with ".drained_being" and "drained_end", to=0D
coordinate the quiescing of the server while entering a drained=0D
section.=0D
=0D
Sergio Lopez (2):=0D
  block-backend: add drained_poll=0D
  nbd/server: Use drained block ops to quiesce the server=0D
=0D
 block/block-backend.c          |  7 ++-=0D
 include/sysemu/block-backend.h |  4 ++=0D
 nbd/server.c                   | 99 +++++++++++++++++++++++++---------=0D
 3 files changed, 85 insertions(+), 25 deletions(-)=0D
=0D
--=20=0D
2.26.2=0D
=0D


