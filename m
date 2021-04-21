Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0501636736F
	for <lists+qemu-devel@lfdr.de>; Wed, 21 Apr 2021 21:28:18 +0200 (CEST)
Received: from localhost ([::1]:56666 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lZIWH-0000Qw-1d
	for lists+qemu-devel@lfdr.de; Wed, 21 Apr 2021 15:28:17 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42914)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1lZIQv-0003gM-2J
 for qemu-devel@nongnu.org; Wed, 21 Apr 2021 15:22:45 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:41855)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1lZIQq-0005V6-R8
 for qemu-devel@nongnu.org; Wed, 21 Apr 2021 15:22:44 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1619032959;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=NATs+/i0LYFzq/IRfZJLafIow2Hqcp0MIFj9ub6tDY0=;
 b=Hi7bIM0oqhkHiqpY79fHi5Ep2mKLcMapmwGXhUzZ9DhHqOdDgK94mPE2s4kaNBX0fzcbsT
 ffskLinq1Pfj2RXC9eCxeIGzrkq/fteeuEYRHIpel5AUQeEDY1vrRYV12ENuFhWAm9waIz
 UZbgx1mIjDDz0ZuU+yHf1WGXleZnX7Q=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-237--195HcBwPsan2Oke6sR1pA-1; Wed, 21 Apr 2021 15:22:35 -0400
X-MC-Unique: -195HcBwPsan2Oke6sR1pA-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id B838A1020C24;
 Wed, 21 Apr 2021 19:22:34 +0000 (UTC)
Received: from scv.redhat.com (ovpn-118-152.rdu2.redhat.com [10.10.118.152])
 by smtp.corp.redhat.com (Postfix) with ESMTP id DBE695C1B4;
 Wed, 21 Apr 2021 19:22:33 +0000 (UTC)
From: John Snow <jsnow@redhat.com>
To: qemu-devel@nongnu.org,
	Markus Armbruster <armbru@redhat.com>
Subject: [PATCH v3 0/8] qapi: static typing conversion, pt4
Date: Wed, 21 Apr 2021 15:22:25 -0400
Message-Id: <20210421192233.3542904-1-jsnow@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=jsnow@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=216.205.24.124; envelope-from=jsnow@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
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
Cc: Peter Maydell <peter.maydell@linaro.org>, John Snow <jsnow@redhat.com>,
 Eduardo Habkost <ehabkost@redhat.com>, Michael Roth <michael.roth@amd.com>,
 Cleber Rosa <crosa@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Hi, this series adds static type hints to the QAPI module.=0D
This is part four, and focuses on error.py.=0D
=0D
Part 4: https://gitlab.com/jsnow/qemu/-/tree/python-qapi-cleanup-pt4=0D
CI: https://gitlab.com/jsnow/qemu/-/pipelines/290152364=0D
=0D
Requirements:=0D
- Python 3.6+=0D
- mypy >=3D 0.770=0D
- pylint >=3D 2.6.0 (2.7.0+ when using Python 3.9+)=0D
=0D
Every commit should pass with:=0D
 - `isort -c qapi/`=0D
 - `flake8 qapi/`=0D
 - `pylint --rcfile=3Dqapi/pylintrc qapi/`=0D
 - `mypy --config-file=3Dqapi/mypy.ini qapi/`=0D
=0D
V3:=0D
=0D
```=0D
001/8:[down]      'qapi/error: Repurpose QAPIError as an abstract base exce=
ption class'=0D
002/8:[----] [--] 'qapi/error: Use Python3-style super()'=0D
003/8:[----] [--] 'qapi/error: Make QAPISourceError 'col' parameter optiona=
l'=0D
004/8:[down]      'qapi/error: assert QAPISourceInfo is not None'=0D
005/8:[0010] [FC] 'qapi/error.py: move QAPIParseError to parser.py'=0D
006/8:[----] [--] 'qapi/error.py: enable pylint checks'=0D
007/8:[----] [-C] 'qapi/error: Add type hints'=0D
008/8:[----] [--] 'qapi/error.py: enable mypy checks'=0D
```=0D
=0D
- 01: Updated commit message. (Is it sufficient to pass the sniff test?)=0D
- 04: Changed commit title/message.=0D
- 05: Added a small docstring (I know, hubris again) to add a small=0D
      breadcrumb to the new error location for QAPIParseError.=0D
=0D
John Snow (8):=0D
  qapi/error: Repurpose QAPIError as an abstract base exception class=0D
  qapi/error: Use Python3-style super()=0D
  qapi/error: Make QAPISourceError 'col' parameter optional=0D
  qapi/error: assert QAPISourceInfo is not None=0D
  qapi/error.py: move QAPIParseError to parser.py=0D
  qapi/error.py: enable pylint checks=0D
  qapi/error: Add type hints=0D
  qapi/error.py: enable mypy checks=0D
=0D
 docs/sphinx/qapidoc.py |  3 ++-=0D
 scripts/qapi/error.py  | 47 ++++++++++++++++++++++++------------------=0D
 scripts/qapi/mypy.ini  |  5 -----=0D
 scripts/qapi/parser.py | 14 ++++++++++++-=0D
 scripts/qapi/pylintrc  |  3 +--=0D
 scripts/qapi/schema.py |  4 ++--=0D
 6 files changed, 45 insertions(+), 31 deletions(-)=0D
=0D
--=20=0D
2.30.2=0D
=0D


