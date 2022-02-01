Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 41ABD4A55D7
	for <lists+qemu-devel@lfdr.de>; Tue,  1 Feb 2022 05:13:15 +0100 (CET)
Received: from localhost ([::1]:55386 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nEkXa-0005Iq-Bh
	for lists+qemu-devel@lfdr.de; Mon, 31 Jan 2022 23:13:14 -0500
Received: from eggs.gnu.org ([209.51.188.92]:46456)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1nEkW8-000340-6T
 for qemu-devel@nongnu.org; Mon, 31 Jan 2022 23:11:44 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:44636)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1nEkW5-0005F1-FE
 for qemu-devel@nongnu.org; Mon, 31 Jan 2022 23:11:43 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1643688700;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=2Ao6Qhg+Xeuj9MiAcCrZ2YLmhxWdHX+YKPZe6Iic+VA=;
 b=M8zMNOLcYsSWyuoR+s+OjvyCSrx0/p2ii1CTbn5SrFxU2L8Xo4ObfpWlHEYnM/kESE8MPe
 jx0UGMFOGvq1YxEUX9H9PPGNbkcbArltmYY4Yk0ODPjXUQ89CJAR8RvHqukje5jMm6rskf
 zVq4aO4t3MgBBP+zTvAQdpW/ykKd4co=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-279-z5FMADl3NlWxQrH_ANOARw-1; Mon, 31 Jan 2022 23:11:37 -0500
X-MC-Unique: z5FMADl3NlWxQrH_ANOARw-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 35C9718397A7;
 Tue,  1 Feb 2022 04:11:36 +0000 (UTC)
Received: from scv.redhat.com (unknown [10.22.10.166])
 by smtp.corp.redhat.com (Postfix) with ESMTP id C72AF4E2A4;
 Tue,  1 Feb 2022 04:11:34 +0000 (UTC)
From: John Snow <jsnow@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v4 0/4] Python: Improvements for iotest 040,041
Date: Mon, 31 Jan 2022 23:11:30 -0500
Message-Id: <20220201041134.1237016-1-jsnow@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
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
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.088,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
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
Cc: Kevin Wolf <kwolf@redhat.com>, Eduardo Habkost <eduardo@habkost.net>,
 Beraldo Leal <bleal@redhat.com>, qemu-block@nongnu.org,
 Peter Maydell <peter.maydell@linaro.org>,
 Markus Armbruster <armbru@redhat.com>, Hanna Reitz <hreitz@redhat.com>,
 Cleber Rosa <crosa@redhat.com>, John Snow <jsnow@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

GitLab: https://gitlab.com/jsnow/qemu/-/commits/python-aqmp-fixes=0D
CI: https://gitlab.com/jsnow/qemu/-/pipelines/455146881=0D
=0D
Fixes and improvements all relating to "iotest 040,041, intermittent=0D
failure in netbsd VM"=0D
https://lists.gnu.org/archive/html/qemu-devel/2022-01/msg01975.html=0D
=0D
See each patch for details.=0D
=0D
V4:=0D
 - Just commit message changes, and applying Hanna's RBs.=0D
=0D
V3:=0D
 - Retitled series=0D
 - Dropped patch that was already merged=0D
 - Reworded some comments, docstrings, etc.=0D
=0D
John Snow (4):=0D
  python/aqmp: Fix negotiation with pre-"oob" QEMU=0D
  python/machine: raise VMLaunchFailure exception from launch()=0D
  python: upgrade mypy to 0.780=0D
  python/aqmp: add socket bind step to legacy.py=0D
=0D
 python/Pipfile.lock                       | 66 +++++++++++++----------=0D
 python/qemu/aqmp/legacy.py                |  3 ++=0D
 python/qemu/aqmp/protocol.py              | 41 ++++++++++++--=0D
 python/qemu/aqmp/qmp_client.py            |  4 +-=0D
 python/qemu/machine/machine.py            | 45 +++++++++++++---=0D
 python/setup.cfg                          |  2 +-=0D
 tests/qemu-iotests/tests/mirror-top-perms |  3 +-=0D
 7 files changed, 123 insertions(+), 41 deletions(-)=0D
=0D
--=20=0D
2.31.1=0D
=0D


