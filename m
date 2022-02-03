Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1EE374A7DE7
	for <lists+qemu-devel@lfdr.de>; Thu,  3 Feb 2022 03:28:06 +0100 (CET)
Received: from localhost ([::1]:38684 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nFRqv-0005an-8E
	for lists+qemu-devel@lfdr.de; Wed, 02 Feb 2022 21:28:05 -0500
Received: from eggs.gnu.org ([209.51.188.92]:48862)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1nFRnc-0002mu-32
 for qemu-devel@nongnu.org; Wed, 02 Feb 2022 21:24:40 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:29427)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1nFRnZ-0000VQ-MO
 for qemu-devel@nongnu.org; Wed, 02 Feb 2022 21:24:39 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1643855077;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=iIsejDdvuZ0ElTL2aDuIfP/ECnk1AUfXdYU5uf0AMMs=;
 b=fk54Hz8g9RdHK1I2liT9wlue8N7JidPLpjOu4PDyMu31FP+Ro7PykyGO2aZg3KCkLbWZYR
 yQ4RDtxRxyi3MAdEpB/4lK37/X5pabhoxeAzQL8nA1pVJBvXWMFftp5WYCw86QdcWJIYOf
 trNHGatNVADZY2OB8AY6bu5kZtUYBXM=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-107-7ZJKsYZiNIW9JpB6ps3gpg-1; Wed, 02 Feb 2022 21:24:34 -0500
X-MC-Unique: 7ZJKsYZiNIW9JpB6ps3gpg-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id E5CE11091DB4;
 Thu,  3 Feb 2022 02:24:32 +0000 (UTC)
Received: from scv.redhat.com (unknown [10.22.16.25])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 768CE9A318;
 Thu,  3 Feb 2022 02:24:06 +0000 (UTC)
From: John Snow <jsnow@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 0/4] iotests: finalize switch to async QMP
Date: Wed,  2 Feb 2022 21:24:01 -0500
Message-Id: <20220203022405.1336635-1-jsnow@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=jsnow@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=170.10.129.124; envelope-from=jsnow@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.086,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
Cc: Kevin Wolf <kwolf@redhat.com>, Eduardo Habkost <eduardo@habkost.net>,
 Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>, qemu-block@nongnu.org,
 Hanna Reitz <hreitz@redhat.com>, Cleber Rosa <crosa@redhat.com>,
 John Snow <jsnow@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Based-on: <20220203015946.1330386-1-jsnow@redhat.com>=0D
          [PULL 0/4] Python patches=0D
GitLab: https://gitlab.com/jsnow/qemu/-/commits/python-qmp-legacy-switch-pt=
1b=0D
=0D
This tiny series is a spiritual v4 to:=0D
"[PATCH v3 00/31] Python: delete synchronous qemu.qmp package".=0D
=0D
I've isolated just the bits that touch iotests, and that's these four=0D
patches. If this series is approved, I'll send the series that renames=0D
"qemu.aqmp" to "qemu.qmp" separately. That series has a lot of churn,=0D
but it doesn't meaningfully alter anything -- so I'll avoid cluttering=0D
up qemu-block list with those.=0D
=0D
(Just be aware that I plan to finalize the switch soon!)=0D
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
 tests/qemu-iotests/iotests.py             |  2 +-=0D
 tests/qemu-iotests/tests/mirror-top-perms |  9 +++------=0D
 5 files changed, 13 insertions(+), 21 deletions(-)=0D
=0D
--=20=0D
2.31.1=0D
=0D


