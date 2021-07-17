Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3674D3CC0BD
	for <lists+qemu-devel@lfdr.de>; Sat, 17 Jul 2021 04:39:50 +0200 (CEST)
Received: from localhost ([::1]:50928 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m4aF0-0005tg-VB
	for lists+qemu-devel@lfdr.de; Fri, 16 Jul 2021 22:39:48 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49620)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1m4aDl-0004Cu-Fz
 for qemu-devel@nongnu.org; Fri, 16 Jul 2021 22:38:29 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:58498)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1m4aDh-00059u-Ns
 for qemu-devel@nongnu.org; Fri, 16 Jul 2021 22:38:28 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1626489503;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=aNAGjDpUCRzkkysSGgLY9yWMTH8GUWkOwnVoiaBfW/s=;
 b=UMjEjrxcXKgti8wfqy20bBbO5CdRAsg1HbZrgGvJZ8yM/LOY5PhKICZZXDh2/OUFnIMp/1
 KAt9kpKCeFhgg9JUsL1EkLSj2XNkHu1qTSQRZL2+JW96A16m5PbBq7yhOb8smYwxFpxNVS
 Tnkx+5zAQ+hbunLYXcVtNBbAMLdOq6A=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-531-tM1bhQI6OsuvDDQX47Uu3w-1; Fri, 16 Jul 2021 22:38:22 -0400
X-MC-Unique: tM1bhQI6OsuvDDQX47Uu3w-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 2C3FD10C1ADC;
 Sat, 17 Jul 2021 02:38:21 +0000 (UTC)
Received: from scv.redhat.com (ovpn-119-183.rdu2.redhat.com [10.10.119.183])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 1FAEE1045D15;
 Sat, 17 Jul 2021 02:38:19 +0000 (UTC)
From: John Snow <jsnow@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 0/2] remove socket_scm_helper
Date: Fri, 16 Jul 2021 22:38:17 -0400
Message-Id: <20210717023819.884039-1-jsnow@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=jsnow@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=216.205.24.124; envelope-from=jsnow@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.7,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: Kevin Wolf <kwolf@redhat.com>, Eduardo Habkost <ehabkost@redhat.com>,
 qemu-block@nongnu.org, Max Reitz <mreitz@redhat.com>,
 Cleber Rosa <crosa@redhat.com>, John Snow <jsnow@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

GitLab: https://gitlab.com/jsnow/qemu/-/commits/python-socket-scm-helper=0D
CI: https://gitlab.com/jsnow/qemu/-/pipelines/338595177=0D
=0D
19 insertions(+)=0D
208 deletions(-)=0D
=0D
Seems good to me ...?=0D
=0D
--js=0D
=0D
John Snow (2):=0D
  python/qmp: add send_fd_scm directly to QEMUMonitorProtocol=0D
  python, iotests: remove socket_scm_helper=0D
=0D
 tests/qemu-iotests/socket_scm_helper.c | 136 -------------------------=0D
 python/qemu/machine/machine.py         |  47 ++-------=0D
 python/qemu/machine/qtest.py           |   2 -=0D
 python/qemu/qmp/__init__.py            |  21 ++--=0D
 tests/Makefile.include                 |   1 -=0D
 tests/meson.build                      |   4 -=0D
 tests/qemu-iotests/iotests.py          |   3 -=0D
 tests/qemu-iotests/meson.build         |   5 -=0D
 tests/qemu-iotests/testenv.py          |   8 +-=0D
 9 files changed, 19 insertions(+), 208 deletions(-)=0D
 delete mode 100644 tests/qemu-iotests/socket_scm_helper.c=0D
 delete mode 100644 tests/qemu-iotests/meson.build=0D
=0D
--=20=0D
2.31.1=0D
=0D


