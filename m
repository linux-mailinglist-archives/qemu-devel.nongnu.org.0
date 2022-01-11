Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7C95548B103
	for <lists+qemu-devel@lfdr.de>; Tue, 11 Jan 2022 16:38:32 +0100 (CET)
Received: from localhost ([::1]:56062 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n7JEF-0002uk-6J
	for lists+qemu-devel@lfdr.de; Tue, 11 Jan 2022 10:38:31 -0500
Received: from eggs.gnu.org ([209.51.188.92]:37578)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1n7JCJ-0000Xs-Sc
 for qemu-devel@nongnu.org; Tue, 11 Jan 2022 10:36:31 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:33925)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1n7JCD-0000em-F2
 for qemu-devel@nongnu.org; Tue, 11 Jan 2022 10:36:28 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1641915383;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=eurIKcF+Nhf8TVgCtZnDjgwXozV1UsAEU9gVKe9phd4=;
 b=XH0Gy8rgSejEIRAkp8kgBcS1Opd7b33ZeHMOfyW1DGR/OPc0PzRlULmIkCVgicV0gZex+9
 wF4wiES1Jw4kzS7WdnEBMhYsO7RoSpGmPUFk+UlqzOxja3cLWaS1wP761jhRzu/2gz4Rky
 9WdrbWlF/5fQUWzmYiQvNUsTtgQyQQo=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-358-tJMJuR6-OLSAjC_ktstfeg-1; Tue, 11 Jan 2022 10:36:20 -0500
X-MC-Unique: tJMJuR6-OLSAjC_ktstfeg-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 026DB102C856;
 Tue, 11 Jan 2022 15:36:19 +0000 (UTC)
Received: from localhost (unknown [10.39.192.97])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 61CD784FF8;
 Tue, 11 Jan 2022 15:36:15 +0000 (UTC)
From: Stefan Hajnoczi <stefanha@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v3 0/2] block-backend: prevent dangling BDS pointers across
 aio_poll()
Date: Tue, 11 Jan 2022 15:36:11 +0000
Message-Id: <20220111153613.25453-1-stefanha@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=stefanha@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=170.10.133.124; envelope-from=stefanha@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -33
X-Spam_score: -3.4
X-Spam_bar: ---
X-Spam_report: (-3.4 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.595,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: Kevin Wolf <kwolf@redhat.com>,
 Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>, qemu-block@nongnu.org,
 qemu-stable@nongnu.org, Hanna Reitz <hreitz@redhat.com>,
 Stefan Hajnoczi <stefanha@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

This series fixes use-after-free bugs when blk->root changes across aio_pol=
l().=0D
For example, a temporary filter node can be removed by a blockjob when a=0D
drained section begins. If the caller doesn't hold a ref on the BDS then it=
=0D
will have been freed.=0D
=0D
Hanna Reitz (1):=0D
  iotests/stream-error-on-reset: New test=0D
=0D
Stefan Hajnoczi (1):=0D
  block-backend: prevent dangling BDS pointers across aio_poll()=0D
=0D
 block/block-backend.c                         |  19 ++-=0D
 .../qemu-iotests/tests/stream-error-on-reset  | 140 ++++++++++++++++++=0D
 .../tests/stream-error-on-reset.out           |   5 +=0D
 3 files changed, 162 insertions(+), 2 deletions(-)=0D
 create mode 100755 tests/qemu-iotests/tests/stream-error-on-reset=0D
 create mode 100644 tests/qemu-iotests/tests/stream-error-on-reset.out=0D
=0D
--=20=0D
2.33.1=0D
=0D


