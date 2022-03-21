Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8DEA74E31EA
	for <lists+qemu-devel@lfdr.de>; Mon, 21 Mar 2022 21:37:29 +0100 (CET)
Received: from localhost ([::1]:60086 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nWOmO-00022b-Bo
	for lists+qemu-devel@lfdr.de; Mon, 21 Mar 2022 16:37:28 -0400
Received: from eggs.gnu.org ([209.51.188.92]:36616)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1nWOiR-0004HH-OI
 for qemu-devel@nongnu.org; Mon, 21 Mar 2022 16:33:23 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:38606)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1nWOiP-0006bv-62
 for qemu-devel@nongnu.org; Mon, 21 Mar 2022 16:33:22 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1647894798;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=Q5GJM1AnQ2SoNkMgqv5MQuVkBleU6lPqfD+sBvKmAeQ=;
 b=JesYzgmvHMs5q1U4/IUQ5jq8sWaA87YRUvnhr3WEFa7wZN9DtGriFuHObaVV03Qh7pTDEX
 ZeLPbpjnjQR6DXUAA2Xw+tLbziIxfyxERGsnwqVpdJ6laXXpCXKuKXUj6ILLc4POpYx1yN
 u68/hzy4SuOrPL2XbZAW9wJe4/wVIrM=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-81-QbGou1TbPVm9E1oFZQLtKg-1; Mon, 21 Mar 2022 16:33:17 -0400
X-MC-Unique: QbGou1TbPVm9E1oFZQLtKg-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.rdu2.redhat.com
 [10.11.54.7])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 881C41C05AD0;
 Mon, 21 Mar 2022 20:33:16 +0000 (UTC)
Received: from scv.redhat.com (unknown [10.22.16.64])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 04060141DC28;
 Mon, 21 Mar 2022 20:33:15 +0000 (UTC)
From: John Snow <jsnow@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 0/4] iotests: finalize switch to async QMP
Date: Mon, 21 Mar 2022 16:33:11 -0400
Message-Id: <20220321203315.909411-1-jsnow@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.85 on 10.11.54.7
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=jsnow@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=170.10.129.124; envelope-from=jsnow@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Cc: Kevin Wolf <kwolf@redhat.com>, Eduardo Habkost <eduardo@habkost.net>,
 Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>,
 Beraldo Leal <bleal@redhat.com>, qemu-block@nongnu.org,
 Hanna Reitz <hreitz@redhat.com>, Cleber Rosa <crosa@redhat.com>,
 John Snow <jsnow@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

GitLab: https://gitlab.com/jsnow/qemu/-/commits/python-qmp-legacy-switch-pt=
1b=0D
CI: https://gitlab.com/jsnow/qemu/-/pipelines/495951187=0D
=0D
This series isolates the iotests-centric changes required to switch to=0D
the new QMP library. It doesn't do a whole lot!=0D
=0D
This is a re-send just being sent for the purposes of aggregating tags=0D
before pulling it into my Python branch.=0D
=0D
John Snow (4):=0D
  python/machine: permanently switch to AQMP=0D
  scripts/bench-block-job: switch to AQMP=0D
  iotests/mirror-top-perms: switch to AQMP=0D
  iotests: switch to AQMP=0D
=0D
 python/qemu/machine/machine.py            | 18 +++++++-----------=0D
 python/qemu/machine/qtest.py              |  2 +-=0D
 scripts/simplebench/bench_block_job.py    |  3 +--=0D
 tests/qemu-iotests/iotests.py             |  3 +--=0D
 tests/qemu-iotests/tests/mirror-top-perms |  9 +++------=0D
 5 files changed, 13 insertions(+), 22 deletions(-)=0D
=0D
--=20=0D
2.34.1=0D
=0D


