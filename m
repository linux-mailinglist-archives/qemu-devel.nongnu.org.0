Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1B5CD39E826
	for <lists+qemu-devel@lfdr.de>; Mon,  7 Jun 2021 22:13:24 +0200 (CEST)
Received: from localhost ([::1]:44138 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lqLch-0001Ao-1h
	for lists+qemu-devel@lfdr.de; Mon, 07 Jun 2021 16:13:23 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37450)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1lqLWq-0003og-R0
 for qemu-devel@nongnu.org; Mon, 07 Jun 2021 16:07:20 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:55663)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1lqLWo-0006S7-Lt
 for qemu-devel@nongnu.org; Mon, 07 Jun 2021 16:07:20 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1623096438;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=9WZhOoCNmd9zC737roB3FMmNbKca0eyIO2wx9BfvlAQ=;
 b=H0JPxJVNPeHtCzmY5kI4AJYtMCsxv048zKuXa6doBkiUQ44l+t+YjQ1k/bBE56mhal24aZ
 QRafNhQ59wIKC08E/LrtMR/rErfayYS234RndI3ZoGN7EtlFh9SA06Ao81rHxJNU0fZX0l
 Jc4/gxLzY9+7kix6sFmeL2zo4m8iNUU=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-528-USA_iHNrO9uanhGuh9-DKA-1; Mon, 07 Jun 2021 16:07:16 -0400
X-MC-Unique: USA_iHNrO9uanhGuh9-DKA-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 3F37979EE8;
 Mon,  7 Jun 2021 20:06:50 +0000 (UTC)
Received: from scv.redhat.com (ovpn-116-137.rdu2.redhat.com [10.10.116.137])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 82BA35C1C2;
 Mon,  7 Jun 2021 20:06:49 +0000 (UTC)
From: John Snow <jsnow@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 00/42] python: move qmp-shell into qemu.qmp package
Date: Mon,  7 Jun 2021 16:06:07 -0400
Message-Id: <20210607200649.1840382-1-jsnow@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=jsnow@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=170.10.133.124; envelope-from=jsnow@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.2,
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
Cc: "Niteesh G . S ." <niteesh.gs@gmail.com>, Cleber Rosa <crosa@redhat.com>,
 John Snow <jsnow@redhat.com>, Markus Armbruster <armbru@redhat.com>,
 Eduardo Habkost <ehabkost@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Based-on: <20210603003719.1321369-1-jsnow@redhat.com>=0D
Based-on: <20210604155532.1499282-1-jsnow@redhat.com>=0D
CI: https://gitlab.com/jsnow/qemu/-/pipelines/316425665=0D
GitLab: https://gitlab.com/jsnow/qemu/-/commits/python-package-qmp-shell=0D
=0D
This series follows:=0D
=0D
1. [PATCH v3 00/19] Python: move /scripts/qmp/qom* to /python/qemu/qmp/qom*=
=E2=80=8B=0D
2. [PATCH 00/11] python: move /scripts/qmp/gemu-ga-client.py to qemu.qmp pa=
ckage=0D
=0D
and finishes moving stuff in ./scripts/qmp/ into ./python/qemu/qmp/*.=0D
=0D
The benefits of this are:=0D
=0D
1. Improved protection against accidental regression in qmp-using=0D
scripts as we refactor QMP to introduce Async QMP and OOB support=0D
2. Availability of common qmp command-line tools as part of the qemu.qmp=0D
package=0D
3. No more sys.path hacking for qemu.qmp-using utilities=0D
4. Newly 100% clean linting baseline to use as an aid in reviewing=0D
future patches.=0D
=0D
This series is largely minor refactors, linting and typing cleanups,=0D
followed by the move into the python packaging folder at the very end of=0D
the series.=0D
=0D
John Snow (42):=0D
  scripts/qmp-shell: apply isort rules=0D
  scripts/qmp-shell: Apply flake8 rules=0D
  scripts/qmp-shell: fix show_banner signature=0D
  scripts/qmp-shell: fix exception handling=0D
  scripts/qmp-shell: fix connect method signature=0D
  scripts/qmp-shell: remove shadowed variable from _print()=0D
  scripts/qmp-shell: use @classmethod where appropriate=0D
  scripts/qmp-shell: Use python3-style super()=0D
  scripts/qmp-shell: declare verbose in __init__=0D
  scripts/qmp-shell: use triple-double-quote docstring style=0D
  scripts/qmp-shell: ignore visit_Name name=0D
  scripts/qmp-shell: make QMPCompleter returns explicit=0D
  scripts/qmp-shell: rename one and two-letter variables=0D
  scripts/qmp-shell: fix shell history exception handling=0D
  scripts/qmp-shell: remove if-raise-else patterns=0D
  scripts/qmp-shell: use isinstance() instead of type()=0D
  scripts/qmp-shell: use argparse=0D
  scripts/qmp-shell: Add pretty attribute to HMP shell=0D
  scripts/qmp-shell: Make verbose a public attribute=0D
  scripts/qmp-shell: move get_prompt() to prompt property=0D
  scripts/qmp-shell: remove prompt argument from read_exec_command=0D
  scripts/qmp-shell: move the REPL functionality into QMPShell=0D
  scripts/qmp-shell: Fix "FuzzyJSON" parser=0D
  scripts/qmp-shell: refactor QMPCompleter=0D
  scripts/qmp-shell: initialize completer early=0D
  python/qmp: add QMPObject type alias=0D
  scripts/qmp-shell: add mypy types=0D
  scripts/qmp-shell: Accept SocketAddrT instead of string=0D
  scripts/qmp-shell: unprivatize 'pretty' property=0D
  python/qmp: return generic type from context manager=0D
  scripts/qmp-shell: Use context manager instead of atexit=0D
  scripts/qmp-shell: use logging to show warnings=0D
  scripts/qmp-shell: remove TODO=0D
  scripts/qmp-shell: Fix empty-transaction invocation=0D
  scripts/qmp-shell: Remove too-broad-exception=0D
  scripts/qmp-shell: convert usage comment to docstring=0D
  scripts/qmp-shell: remove double-underscores=0D
  scripts/qmp-shell: make QMPShellError inherit QMPError=0D
  scripts/qmp-shell: add docstrings=0D
  scripts/qmp-shell: move to python/qemu/qmp/qmp_shell.py=0D
  python: add qmp-shell entry point=0D
  scripts/qmp-shell: add redirection shim=0D
=0D
 python/qemu/qmp/__init__.py  |   8 +-=0D
 python/qemu/qmp/qmp_shell.py | 535 +++++++++++++++++++++++++++++++++++=0D
 python/setup.cfg             |   1 +=0D
 scripts/qmp/qmp-shell        | 437 +---------------------------=0D
 4 files changed, 546 insertions(+), 435 deletions(-)=0D
 create mode 100644 python/qemu/qmp/qmp_shell.py=0D
=0D
--=20=0D
2.31.1=0D
=0D


