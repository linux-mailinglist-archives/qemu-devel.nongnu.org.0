Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4764F44D89F
	for <lists+qemu-devel@lfdr.de>; Thu, 11 Nov 2021 15:52:05 +0100 (CET)
Received: from localhost ([::1]:47830 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mlBQq-0004ZC-Co
	for lists+qemu-devel@lfdr.de; Thu, 11 Nov 2021 09:52:04 -0500
Received: from eggs.gnu.org ([209.51.188.92]:45498)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1mlBCg-0008KV-Tu
 for qemu-devel@nongnu.org; Thu, 11 Nov 2021 09:37:27 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:29413)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1mlBCe-0001gt-U0
 for qemu-devel@nongnu.org; Thu, 11 Nov 2021 09:37:26 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1636641444;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=eDRiHUrOgOJQJalEmM7X5FhN4D76D8AsaYEEyKahtUo=;
 b=QkDThTAHEMLDylc/zA0D4yXsOY2uEWqbJel/VMG70VtSMIfebTipfNORdzB5ZrXDE7TQ9n
 hGoeZQG274fq6FdruqAX5Yg2ughgua1fdhwhH7cn+BP//Kf8JEtvOsL2omYSQK3qe0bhOu
 EWicGmcGWLR0e8Ft5ZitQsvaq0HTIkA=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-593-mb5SrtaXPMW6A_8Ip1wnjQ-1; Thu, 11 Nov 2021 09:37:21 -0500
X-MC-Unique: mb5SrtaXPMW6A_8Ip1wnjQ-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 86BCC102C8A0
 for <qemu-devel@nongnu.org>; Thu, 11 Nov 2021 14:37:20 +0000 (UTC)
Received: from scv.redhat.com (unknown [10.22.33.175])
 by smtp.corp.redhat.com (Postfix) with ESMTP id F0E9160C17;
 Thu, 11 Nov 2021 14:37:19 +0000 (UTC)
From: John Snow <jsnow@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 0/5] python/aqmp: improve support for device-crash-test
Date: Thu, 11 Nov 2021 09:37:14 -0500
Message-Id: <20211111143719.2162525-1-jsnow@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
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
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Thomas Huth <thuth@redhat.com>, John Snow <jsnow@redhat.com>,
 Eduardo Habkost <ehabkost@redhat.com>, Cleber Rosa <crosa@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

When I switched machine.py over to using AQMP, I caused a regression in=0D
device-crash-test that caused many spurious errors to be printed during=0D
the test, obscuring real test failure cases.=0D
=0D
This series fixes the vast majority of false positives, though there is=0D
one remaining bug in machine.py itself that would affect both=0D
A/QMP. Rarely, when QMP fails to accept a connection from the server,=0D
machine.py may enter the teardown phase quickly enough such that we do=0D
not yet have an exitcode from the VM process. In these cases,=0D
device-crash-test presumes there to be a more serious failure. That=0D
issue is going to take slightly longer to fix and test, so I am instead=0D
offering the majority of fixes now.=0D
=0D
In the meantime, switching over to the legacy QMP module is possible by=0D
setting the environment variable 'QEMU_PYTHON_LEGACY_QMP' to '1' (or any=0D
non-empty string).=0D
=0D
Reported-by: Thomas Huth <thuth@redhat.com>=0D
=0D
John Snow (5):=0D
  python/aqmp: Fix disconnect during capabilities negotiation=0D
  python/aqmp: fix ConnectError string method=0D
  scripts/device-crash-test: simplify Exception handling=0D
  scripts/device-crash-test: don't emit AQMP connection errors to stdout=0D
  scripts/device-crash-test: hide tracebacks for QMP connect errors=0D
=0D
 python/qemu/aqmp/protocol.py | 24 ++++++++++++++++++------=0D
 scripts/device-crash-test    | 33 +++++++++++++++++++++++++--------=0D
 2 files changed, 43 insertions(+), 14 deletions(-)=0D
=0D
--=20=0D
2.31.1=0D
=0D


