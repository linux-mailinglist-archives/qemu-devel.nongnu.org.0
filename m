Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E6FE432589D
	for <lists+qemu-devel@lfdr.de>; Thu, 25 Feb 2021 22:27:25 +0100 (CET)
Received: from localhost ([::1]:54890 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lFOAO-0007UW-Hk
	for lists+qemu-devel@lfdr.de; Thu, 25 Feb 2021 16:27:24 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:52890)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <willianr@redhat.com>)
 id 1lFNjM-00005Y-CG
 for qemu-devel@nongnu.org; Thu, 25 Feb 2021 15:59:28 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:31806)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <willianr@redhat.com>)
 id 1lFNjK-0002Wl-GV
 for qemu-devel@nongnu.org; Thu, 25 Feb 2021 15:59:28 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1614286764;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=Zc1wKTNJImwJpJdPno/IHhCaXUp/U4QAaRVxSfcEVMs=;
 b=FfzGmrx7DMkgTy0/jD6qZqP8Ho/QNKtfBho3kMDMpuA//+0IqOiGDdXIaJXZNp+xXwc6XF
 WmL+35SZuFeJhRLcwaH+wDjNu2kh/2DocGaVTqsuVXtIhFJXcGqdMww5ej+alRaq+XdkHP
 qkIYeT8tlZOHEusF4afRenoVXqMJ4sE=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-593-c-wxBeLcODSirbgaVYvLQg-1; Thu, 25 Feb 2021 15:59:21 -0500
X-MC-Unique: c-wxBeLcODSirbgaVYvLQg-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 36EEE50740;
 Thu, 25 Feb 2021 20:59:20 +0000 (UTC)
Received: from wrampazz.redhat.com (ovpn-112-217.rdu2.redhat.com
 [10.10.112.217])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 1981360BE5;
 Thu, 25 Feb 2021 20:59:08 +0000 (UTC)
From: Willian Rampazzo <willianr@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 0/2] tests: Add functional test for out-of-process device
 emulation
Date: Thu, 25 Feb 2021 17:59:05 -0300
Message-Id: <20210225205907.223995-1-willianr@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
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
X-Mailman-Approved-At: Thu, 25 Feb 2021 16:24:56 -0500
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
Cc: Elena Ufimtseva <elena.ufimtseva@oracle.com>,
 John G Johnson <john.g.johnson@oracle.com>,
 Jagannathan Raman <jag.raman@oracle.com>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Cleber Rosa <crosa@redhat.com>,
 =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

This series is a respin to the "multi-process: Acceptance test for multipro=
ce=3D=0D
ss=0D
QEMU" patch sent in December which, runs an Avocado functional test to chec=
k =3D=0D
if a=0D
remote lsi53c895a device gets identified by the guest:=0D
https://www.mail-archive.com/qemu-devel@nongnu.org/msg769188.html=0D
=0D
First, we introduce the `exec_command` to the avocado_qemu package, which s=
en=3D=0D
ds a=0D
command to a console without the need to wait for a pattern as a result. Th=
is=3D=0D
 is=0D
useful when a test needs to execute a command that does not produce an outp=
ut,=0D
like, for example, a `mount` command.=0D
=0D
Then, the original test is refactored to simplify the code using the new=0D
`exec_command` function, remove the unnecessary change to the=0D
`wait_for_console_pattern` method and normalize the use of single quotes.=
=0D
=0D
CI Pipeline: https://gitlab.com/willianrampazzo/qemu/-/pipelines/261946622=
=0D
=0D
Supersedes: <785772783205140e219b8bfe7f793305ee768f03.1608705805.git.elena.=
uf=3D=0D
imtseva@oracle.com>=0D
=0D
Jagannathan Raman (1):=0D
  tests: Add functional test for out-of-process device emulation=0D
=0D
Willian Rampazzo (1):=0D
  avocado_qemu: add exec_command function=0D
=0D
 tests/acceptance/avocado_qemu/__init__.py | 13 +++-=0D
 tests/acceptance/multiprocess.py          | 95 +++++++++++++++++++++++=0D
 2 files changed, 107 insertions(+), 1 deletion(-)=0D
 create mode 100644 tests/acceptance/multiprocess.py=0D
=0D
--=3D20=0D
2.29.2=0D
=0D


