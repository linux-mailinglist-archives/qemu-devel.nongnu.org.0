Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 59BB8492373
	for <lists+qemu-devel@lfdr.de>; Tue, 18 Jan 2022 11:03:36 +0100 (CET)
Received: from localhost ([::1]:45048 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n9lKw-0002kb-Uo
	for lists+qemu-devel@lfdr.de; Tue, 18 Jan 2022 05:03:34 -0500
Received: from eggs.gnu.org ([209.51.188.92]:52038)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1n9lJI-0001OR-KD
 for qemu-devel@nongnu.org; Tue, 18 Jan 2022 05:01:52 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:52060)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1n9lJF-0003cR-SN
 for qemu-devel@nongnu.org; Tue, 18 Jan 2022 05:01:52 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1642500109;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=kD8wkT0aWljV8Z0Nn1X4YeN3Y1/VgVVJqqqzkQxnGV0=;
 b=K6yB+BXWq5Rc40d/NU3Mym9kLaCZavgQ0ToxZSO/lZ/CwF8xeEbx/D/JYmFHsqwxvKaEbU
 xDc6zE6K/AlP1I9L7E8visar2iWCouQcJf9wYsw1b0T+T8Fb9BDAuLtRU+KHeq4x05YuYh
 JF4zJUEnKjpaS5zKtcPa+VWvQ8N5r20=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-519-5eo_McSQPy-AibKopdNJ0A-1; Tue, 18 Jan 2022 05:01:45 -0500
X-MC-Unique: 5eo_McSQPy-AibKopdNJ0A-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 989ED2F24;
 Tue, 18 Jan 2022 10:01:44 +0000 (UTC)
Received: from localhost.localdomain.com (unknown [10.39.195.32])
 by smtp.corp.redhat.com (Postfix) with ESMTP id F36BB752B3;
 Tue, 18 Jan 2022 10:01:42 +0000 (UTC)
From: =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 0/2] python: a few improvements to qmp-shell
Date: Tue, 18 Jan 2022 10:01:38 +0000
Message-Id: <20220118100140.252920-1-berrange@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=berrange@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=170.10.129.124; envelope-from=berrange@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.7,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: Eduardo Habkost <eduardo@habkost.net>,
 =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 John Snow <jsnow@redhat.com>, Markus Armbruster <armbru@redhat.com>,
 Cleber Rosa <crosa@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

This makes the qmp-shell program a little more pleasant to use when you=0D
are just trying to spawn a throw-away QEMU process to query some info=0D
from.=0D
=0D
First it introduces a 'qmp-shell-wrap' command that takes a QEMU command=0D
line instead of QMP socket, and spawns QEMU automatically, so its life=0D
is tied to that of the shell.=0D
=0D
Second it adds ability to log QMP commands/responses to a file that can=0D
be queried with 'jq' to extract information. This is good for commands=0D
which return huge JSON docs.=0D
=0D
In v2:=0D
=0D
 - Unlink unix socket path on exit=0D
 - Fix default command name=0D
 - Deal with flake8/pylint warnings=0D
=0D
Daniel P. Berrang=C3=A9 (2):=0D
  python: introduce qmp-shell-wrap convenience tool=0D
  python: support recording QMP session to a file=0D
=0D
 python/qemu/qmp/qmp_shell.py | 88 +++++++++++++++++++++++++++++++++---=0D
 python/setup.cfg             |  3 ++=0D
 scripts/qmp/qmp-shell-wrap   | 11 +++++=0D
 3 files changed, 95 insertions(+), 7 deletions(-)=0D
 create mode 100755 scripts/qmp/qmp-shell-wrap=0D
=0D
--=20=0D
2.33.1=0D
=0D


