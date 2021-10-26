Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 81D0A43B949
	for <lists+qemu-devel@lfdr.de>; Tue, 26 Oct 2021 20:18:42 +0200 (CEST)
Received: from localhost ([::1]:44258 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mfR21-0003Q5-Hh
	for lists+qemu-devel@lfdr.de; Tue, 26 Oct 2021 14:18:41 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51554)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1mfQgc-0003gT-VT
 for qemu-devel@nongnu.org; Tue, 26 Oct 2021 13:56:36 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:25026)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1mfQgN-0004XE-70
 for qemu-devel@nongnu.org; Tue, 26 Oct 2021 13:56:34 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1635270977;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=Oat8SqE8JlnebIrS9AvF6H1r4GTzauAr8xANyln7TJo=;
 b=WdN1QLbXwpRUwNLNx4Ar4i+kO46okXlZJ3giLosLgFYUGDv7WJhgvb5QcWkEmsoXAinc52
 nP41mpHeVsDcbL5NwlVBCCpxz7jCcpG1AJhnBEJXcWkTrzSW5tdauQI9o5XjIEhy7qW18h
 CxAj4+zFplTUQusHjJIpdgsx9jMfEkg=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-478-B9Q938n9NWG_UyBDz4W5lg-1; Tue, 26 Oct 2021 13:56:14 -0400
X-MC-Unique: B9Q938n9NWG_UyBDz4W5lg-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 9907756BF5;
 Tue, 26 Oct 2021 17:56:13 +0000 (UTC)
Received: from scv.redhat.com (unknown [10.22.17.51])
 by smtp.corp.redhat.com (Postfix) with ESMTP id CFB1D60C21;
 Tue, 26 Oct 2021 17:56:12 +0000 (UTC)
From: John Snow <jsnow@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v5 0/8] Switch iotests to using Async QMP
Date: Tue, 26 Oct 2021 13:56:04 -0400
Message-Id: <20211026175612.4127598-1-jsnow@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=jsnow@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=170.10.133.124; envelope-from=jsnow@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
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
 Eduardo Habkost <ehabkost@redhat.com>, qemu-block@nongnu.org,
 Hanna Reitz <hreitz@redhat.com>, Cleber Rosa <crosa@redhat.com>,
 John Snow <jsnow@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

GitLab: https://gitlab.com/jsnow/qemu/-/commits/python-aqmp-iotest-wrapper=
=0D
CI: https://gitlab.com/jsnow/qemu/-/pipelines/395925703=0D
=0D
Hiya,=0D
=0D
This series continues where the last two AQMP series left off and adds a=0D
synchronous 'legacy' wrapper around the new AQMP interface, then drops=0D
it straight into iotests to prove that AQMP is functional and totally=0D
cool and fine. The disruption and churn to iotests is pretty minimal.=0D
=0D
In the event that a regression happens and I am not physically proximate=0D
to inflict damage upon, one may set the QEMU_PYTHON_LEGACY_QMP variable=0D
to any non-empty string as it pleases you to engage the QMP machinery=0D
you are used to.=0D
=0D
V5:=0D
=0D
006: Fixed a typing error. (Hanna)=0D
=0D
V4:=0D
=0D
006: Added to address a race condition in iotest 300.=0D
     (Thanks for the repro, Hanna)=0D
=0D
V3: Near as we can tell, our immediate ancestral forebear.=0D
V2: A distant dream, half-remembered.=0D
V1: Apocrypha.=0D
=0D
John Snow (8):=0D
  python/machine: remove has_quit argument=0D
  python/machine: Handle QMP errors on close more meticulously=0D
  python/aqmp: Remove scary message=0D
  iotests: Accommodate async QMP Exception classes=0D
  iotests: Conditionally silence certain AQMP errors=0D
  iotests/300: avoid abnormal shutdown race condition=0D
  python/aqmp: Create sync QMP wrapper for iotests=0D
  python, iotests: replace qmp with aqmp=0D
=0D
 python/qemu/aqmp/__init__.py              |  12 --=0D
 python/qemu/aqmp/legacy.py                | 138 ++++++++++++++++++++++=0D
 python/qemu/machine/machine.py            |  85 +++++++++----=0D
 scripts/simplebench/bench_block_job.py    |   3 +-=0D
 tests/qemu-iotests/040                    |   7 +-=0D
 tests/qemu-iotests/218                    |   2 +-=0D
 tests/qemu-iotests/255                    |   2 +-=0D
 tests/qemu-iotests/300                    |  13 +-=0D
 tests/qemu-iotests/iotests.py             |  20 +++-=0D
 tests/qemu-iotests/tests/mirror-top-perms |  17 ++-=0D
 10 files changed, 243 insertions(+), 56 deletions(-)=0D
 create mode 100644 python/qemu/aqmp/legacy.py=0D
=0D
--=20=0D
2.31.1=0D
=0D


