Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 471F23980E3
	for <lists+qemu-devel@lfdr.de>; Wed,  2 Jun 2021 08:06:57 +0200 (CEST)
Received: from localhost ([::1]:50880 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1loK1n-0006s9-SB
	for lists+qemu-devel@lfdr.de; Wed, 02 Jun 2021 02:06:55 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43862)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <slp@redhat.com>) id 1loK0y-0005j3-MM
 for qemu-devel@nongnu.org; Wed, 02 Jun 2021 02:06:04 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:51276)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <slp@redhat.com>) id 1loK0x-0002Od-1A
 for qemu-devel@nongnu.org; Wed, 02 Jun 2021 02:06:04 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1622613962;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=uPTJReqkubZYnibRqalA5CfILGYBE0nxSGqWFYmYneE=;
 b=dkTj6TK3/o6/RNWoeh/N2MW2c2tGvW4rds2s9RGfHUdpTgDMDP+cSiEE6ecAkpact34dGq
 uoKCaV2Y+VS64rfnv44j+HUqKsPVADZkCVsG+bB5pL37LXtx+EMM8G4+zRq3iPJ82+j1lX
 8/vD/vzX9acaA8vio1/he9fUCn0JRUs=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-342-qSch0_ZEMieRbfyOv5j9KA-1; Wed, 02 Jun 2021 02:05:59 -0400
X-MC-Unique: qSch0_ZEMieRbfyOv5j9KA-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 05AA0801B16;
 Wed,  2 Jun 2021 06:05:58 +0000 (UTC)
Received: from toolbox.redhat.com (unknown [10.33.36.21])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 3EAD519C44;
 Wed,  2 Jun 2021 06:05:52 +0000 (UTC)
From: Sergio Lopez <slp@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 0/2] nbd/server: Quiesce server on drained section
Date: Wed,  2 Jun 2021 08:05:50 +0200
Message-Id: <20210602060552.17433-1-slp@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
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
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.371,
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
v2:=0D
 - Use a bool for the value returned by .drained_poll [Kevin]=0D
 - Change .drained_poll comment to reflect that the returned boolean=0D
   value will be true if the device is still busy, or false otherwise=0D
 - Drop yield_co_list and use recv_coroutine and read_yielding [Kevin]=0D
 - Return "true" or "false" in nbd_drained_poll [Kevin]=0D
 - Fix grammar in the commit message of patch 2 [Eric]=0D
=0D
Sergio Lopez (2):=0D
  block-backend: add drained_poll=0D
  nbd/server: Use drained block ops to quiesce the server=0D
=0D
 block/block-backend.c          |  7 ++-=0D
 include/sysemu/block-backend.h |  4 ++=0D
 nbd/server.c                   | 82 +++++++++++++++++++++++++---------=0D
 3 files changed, 71 insertions(+), 22 deletions(-)=0D
=0D
--=20=0D
2.26.2=0D
=0D


