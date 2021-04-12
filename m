Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E7A1135B99D
	for <lists+qemu-devel@lfdr.de>; Mon, 12 Apr 2021 06:49:29 +0200 (CEST)
Received: from localhost ([::1]:46674 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lVoVs-0003Wv-Li
	for lists+qemu-devel@lfdr.de; Mon, 12 Apr 2021 00:49:28 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44820)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <crosa@redhat.com>) id 1lVoUC-00022R-Tq
 for qemu-devel@nongnu.org; Mon, 12 Apr 2021 00:47:44 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:59071)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <crosa@redhat.com>) id 1lVoUA-0003b7-8f
 for qemu-devel@nongnu.org; Mon, 12 Apr 2021 00:47:44 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1618202860;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=NOWzOk061Z/EBRl7BhsvBCjP9eSgSDKtYrWYuI7qnHo=;
 b=hvj4j4eUb6nTygwNOwVQuvqnsY0BUwlAecP4AOIWKAAFIOTwp8EXPj0bdkmvNOcKBDSCTI
 1YQsKCJQohqa0pRMRvY/RqJeEE7DyXPZLAp2EFDpXF29KGarjCiIgfAmW0g9+pzi8J/GcO
 NNNn8pzOilgp8Vfg7rL3h0YnYHSDtpg=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-143-D40-qCktNqW9AUIDnk6Vfg-1; Mon, 12 Apr 2021 00:47:37 -0400
X-MC-Unique: D40-qCktNqW9AUIDnk6Vfg-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id C6138107ACC7;
 Mon, 12 Apr 2021 04:47:35 +0000 (UTC)
Received: from localhost.localdomain.com (ovpn-113-108.rdu2.redhat.com
 [10.10.113.108])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 8F3BB1037EAF;
 Mon, 12 Apr 2021 04:46:55 +0000 (UTC)
From: Cleber Rosa <crosa@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v3 00/11] Acceptance Test: introduce base class for Linux
 based tests
Date: Mon, 12 Apr 2021 00:46:33 -0400
Message-Id: <20210412044644.55083-1-crosa@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=crosa@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=216.205.24.124; envelope-from=crosa@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=-0.01, RCVD_IN_MSPIKE_WL=-0.01,
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
Cc: Thomas Huth <thuth@redhat.com>, Eduardo Habkost <ehabkost@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Willian Rampazzo <willianr@redhat.com>, John Snow <jsnow@redhat.com>,
 Willian Rampazzo <wrampazz@redhat.com>, Cleber Rosa <crosa@redhat.com>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Aurelien Jarno <aurelien@aurel32.net>, Beraldo Leal <bleal@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

This introduces a base class for tests that need to interact with a=0D
Linux guest.  It generalizes the "boot_linux.py" code, already been=0D
used by the "virtiofs_submounts.py" and also SSH related code being=0D
used by that and "linux_ssh_mips_malta.py".=0D
=0D
While at it, a number of fixes on hopeful improvements to those tests=0D
were added.=0D
=0D
Changes from v2:=0D
=0D
* Removed type information in docstring on python/qemu/utils.py, as=0D
  that's already present on the type hints (John Snow)=0D
=0D
* Reworded commit message about moving ssh-related methods to a auxiliary,=
=0D
  mix-in class, and not to the base LinuxTest class (Eric Auger)=0D
=0D
* Removed unused import of get_info_usernet_hostfwd_port on=0D
  tests/acceptance/linux_ssh_mips_malta.py (Eric Auger)=0D
=0D
* Added note on commit message about setUp() method also allowing one=0D
  to define network device, which is by default, set to virtio-net=0D
  (Eric Auger)=0D
=0D
* Kept note about the network device that allows for SSH connections=0D
  (Wainer Moschetta)=0D
=0D
* Do not set up an SSH connection on tests that won't be using it=0D
  (Eric Auger)=0D
=0D
* Mention the use of a Fedora 31 guest image (Wainer Moschetta)=0D
=0D
* Fix of SSH pubkey setup on tests/acceptance/virtiofs_submounts.py=0D
  (new patch, reported by Wainer Moschetta)=0D
=0D
Changes from v1:=0D
=0D
* Majority of v1 patches have been merged.=0D
=0D
* New patches:=0D
  - Acceptance Tests: make username/password configurable=0D
  - Acceptance Tests: set up SSH connection by default after boot for Linux=
Test=0D
  - tests/acceptance/virtiofs_submounts.py: remove launch_vm()=0D
=0D
* Allowed for the configuration of the network device type (defaulting=0D
  to virtio-net) [Phil]=0D
=0D
* Fix module name typo (s/qemu.util/qemu.utils/) in the commit message=0D
  [John]=0D
=0D
* Tests based on LinuxTest will have the SSH connection already prepared=0D
=0D
Cleber Rosa (11):=0D
  tests/acceptance/virtiofs_submounts.py: add missing accel tag=0D
  tests/acceptance/virtiofs_submounts.py: evaluate string not length=0D
  Python: add utility function for retrieving port redirection=0D
  Acceptance Tests: move useful ssh methods to base class=0D
  Acceptance Tests: add port redirection for ssh by default=0D
  Acceptance Tests: make username/password configurable=0D
  Acceptance Tests: set up SSH connection by default after boot for=0D
    LinuxTest=0D
  tests/acceptance/virtiofs_submounts.py: remove launch_vm()=0D
  Acceptance Tests: add basic documentation on LinuxTest base class=0D
  Acceptance Tests: introduce CPU hotplug test=0D
  tests/acceptance/virtiofs_submounts.py: fix setup of SSH pubkey=0D
=0D
 docs/devel/testing.rst                    | 26 +++++++++=0D
 python/qemu/utils.py                      | 33 +++++++++++=0D
 tests/acceptance/avocado_qemu/__init__.py | 64 ++++++++++++++++++--=0D
 tests/acceptance/boot_linux.py            | 18 +++---=0D
 tests/acceptance/hotplug_cpu.py           | 37 ++++++++++++=0D
 tests/acceptance/info_usernet.py          | 29 +++++++++=0D
 tests/acceptance/linux_ssh_mips_malta.py  | 42 +-------------=0D
 tests/acceptance/virtiofs_submounts.py    | 71 +++--------------------=0D
 tests/vm/basevm.py                        |  7 +--=0D
 9 files changed, 206 insertions(+), 121 deletions(-)=0D
 create mode 100644 python/qemu/utils.py=0D
 create mode 100644 tests/acceptance/hotplug_cpu.py=0D
 create mode 100644 tests/acceptance/info_usernet.py=0D
=0D
--=20=0D
2.30.2=0D
=0D


