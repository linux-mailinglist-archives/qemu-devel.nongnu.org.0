Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4CD7832BA6B
	for <lists+qemu-devel@lfdr.de>; Wed,  3 Mar 2021 21:54:34 +0100 (CET)
Received: from localhost ([::1]:40326 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lHYVs-0007nz-Lv
	for lists+qemu-devel@lfdr.de; Wed, 03 Mar 2021 15:54:32 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:34300)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <willianr@redhat.com>)
 id 1lHYV0-0006ys-Ls
 for qemu-devel@nongnu.org; Wed, 03 Mar 2021 15:53:38 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:40379)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <willianr@redhat.com>)
 id 1lHYUx-0003gQ-TI
 for qemu-devel@nongnu.org; Wed, 03 Mar 2021 15:53:37 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1614804813;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=J+cKsM6toAPv11r+HjMOhet2yOZO/WZbjUIVDbecErU=;
 b=Cz8xFN1+ypr/mQcic6mJ4MOuvG7Z6ryLyeV7j5U/sROA857GiU6WvZn6LgScVY9fu6Ivp2
 CXgrlk7O7cR/w3se+LErlTt3YRdauU+qYXwItEcWlOOu8R2WQSlKb0zZVNcuxBQ3TQevqr
 dGxfcAMp2xNJzxOmMt+kx+Vt7V3yWfI=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-471-MB4A775KPkuUwwmbMMpP7A-1; Wed, 03 Mar 2021 15:53:29 -0500
X-MC-Unique: MB4A775KPkuUwwmbMMpP7A-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 7F89B91271
 for <qemu-devel@nongnu.org>; Wed,  3 Mar 2021 20:53:28 +0000 (UTC)
Received: from wrampazz.redhat.com (ovpn-112-215.rdu2.redhat.com
 [10.10.112.215])
 by smtp.corp.redhat.com (Postfix) with ESMTP id E2C175C241;
 Wed,  3 Mar 2021 20:53:21 +0000 (UTC)
From: Willian Rampazzo <willianr@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v3 0/2] tests: Add functional test for out-of-process device
 emulation
Date: Wed,  3 Mar 2021 17:53:18 -0300
Message-Id: <20210303205320.146047-1-willianr@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=willianr@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=216.205.24.124; envelope-from=willianr@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Cleber Rosa <crosa@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

This series is a respin to the "multi-process: Acceptance test for=0D
multiprocess QEMU" patch sent in December which, runs an Avocado=0D
functional test to check if a remote lsi53c895a device gets identified=0D
by the guest:=0D
https://www.mail-archive.com/qemu-devel@nongnu.org/msg769188.html=0D
=0D
First, we introduce the `exec_command` to the avocado_qemu package,=0D
which sends a command to a console without the need to wait for a=0D
pattern as a result. This is useful when a test needs to execute a=0D
command that does not produce an output, like, for example, a `mount`=0D
command.=0D
=0D
Then, the original test is refactored to simplify the code using the=0D
new `exec_command` function, remove the unnecessary change to the=0D
`wait_for_console_pattern` method and normalize the use of single=0D
quotes.=0D
=0D
CI Pipeline: https://gitlab.com/willianrampazzo/qemu/-/pipelines/261946622=
=0D
=0D
Supersedes: <785772783205140e219b8bfe7f793305ee768f03.1608705805.git.elena.=
ufimtseva@oracle.com>=0D
=0D
Change from v2:=0D
  - Add command type to the `exec_command` docstring=0D
=0D
Jagannathan Raman (1):=0D
  tests: Add functional test for out-of-process device emulation=0D
=0D
Willian Rampazzo (1):=0D
  avocado_qemu: add exec_command function=0D
=0D
 tests/acceptance/avocado_qemu/__init__.py | 14 +++-=0D
 tests/acceptance/multiprocess.py          | 95 +++++++++++++++++++++++=0D
 2 files changed, 108 insertions(+), 1 deletion(-)=0D
 create mode 100644 tests/acceptance/multiprocess.py=0D
=0D
--=20=0D
2.29.2=0D
=0D


