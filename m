Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8BC6B36FC82
	for <lists+qemu-devel@lfdr.de>; Fri, 30 Apr 2021 16:36:04 +0200 (CEST)
Received: from localhost ([::1]:47224 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lcUFP-0003mr-LJ
	for lists+qemu-devel@lfdr.de; Fri, 30 Apr 2021 10:36:03 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43264)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <wainersm@redhat.com>)
 id 1lcTIm-0005H3-Aw
 for qemu-devel@nongnu.org; Fri, 30 Apr 2021 09:35:28 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:30636)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <wainersm@redhat.com>)
 id 1lcTIe-0007yq-IK
 for qemu-devel@nongnu.org; Fri, 30 Apr 2021 09:35:27 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1619789719;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=e1A8VnjojSJQ5+ko4/MQxxKDB7vWUxrINadjgz+uFos=;
 b=P51mFSILOrbC05TUcSr4aHNRfJXT1dqXeQffstmneGGwqo8uDi8Y2ZHMadbjqru4VRm4bL
 ziGlpLMtZLgj9WuektU0c1RRSMWgnuivnDWlvJb8JxXdQ6KEAd/xbjsljymdLJ6j1ZEbzk
 gMHoMbJVqU2Dk0CIXIeafjG+UYrO6t8=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-386-fsqdrwrNOV6AdXreC3myxA-1; Fri, 30 Apr 2021 09:35:16 -0400
X-MC-Unique: fsqdrwrNOV6AdXreC3myxA-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 074BE8AADF5;
 Fri, 30 Apr 2021 13:34:45 +0000 (UTC)
Received: from wainer-laptop.localdomain.com (ovpn-116-202.gru2.redhat.com
 [10.97.116.202])
 by smtp.corp.redhat.com (Postfix) with ESMTP id DBD855E7A3;
 Fri, 30 Apr 2021 13:34:18 +0000 (UTC)
From: Wainer dos Santos Moschetta <wainersm@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v3 0/7] tests/acceptance: Handle tests with "cpu" tag
Date: Fri, 30 Apr 2021 10:34:07 -0300
Message-Id: <20210430133414.39905-1-wainersm@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=wainersm@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=170.10.133.124; envelope-from=wainersm@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.22,
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
Cc: wrampazz@redhat.com, philmd@redhat.com, pavel.dovgaluk@ispras.ru,
 crosa@redhat.com, pbonzini@redhat.com, alex.bennee@linaro.org,
 aurelien@aurel32.net
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Currently the acceptance tests tagged with "machine" have the "-M TYPE"
automatically added to the list of arguments of the QEMUMachine object.
In other words, that option is passed to the launched QEMU. On this
series it is implemented the same feature but instead for tests marked
with "cpu".

There is a caveat, however, in case the test needs additional arguments to
the CPU type they cannot be passed via tag, because the tags parser split
values by comma (limitation which Avocado plans to address, see
https://github.com/avocado-framework/avocado/issues/45410). For example, in
tests/acceptance/x86_cpu_model_versions.py, there are cases where:

  * -cpu is set to "Cascadelake-Server,x-force-features=on,check=off,enforce=off"
  * if it was tagged like "cpu:Cascadelake-Server,x-force-features=on,check=off,enforce=off"
    then the parser would break it into 4 tags ("cpu:Cascadelake-Server",
    "x-force-features=on", "check=off", "enforce=off")
  * resulting on "-cpu Cascadelake-Server" and the remaining arguments are ignored.

It was introduced the avocado_qemu.Test.set_vm_arg() method to deal with
cases like the example above, so that one can tag it as "cpu:Cascadelake-Server"
AND call self.set_vm_args('-cpu', "Cascadelake-Server,x-force-features=on,check=off,enforce=off"),
and that results on the reset of the initial value of -cpu.

This series was tested on CI (https://gitlab.com/wainersm/qemu/-/pipelines/294640198)
and with the following code:

from avocado_qemu import Test

class CPUTest(Test):
    def test_cpu(self):
        """
        :avocado: tags=cpu:host
        """
        # The cpu property is set to the tag value, or None on its absence
        self.assertEqual(self.cpu, "host")
        # The created VM has the '-cpu host' option
        self.assertIn("-cpu host", " ".join(self.vm._args))
        self.vm.launch()

    def test_cpu_none(self):
        self.assertEqual(self.cpu, None)
        self.assertNotIn('-cpu', self.vm._args)

    def test_cpu_reset(self):
        """
        :avocado: tags=cpu:host
        """
        self.assertIn("-cpu host", " ".join(self.vm._args))
        self.set_vm_arg("-cpu", "Cascadelake-Server,x-force-features=on")
        self.assertNotIn("-cpu host", " ".join(self.vm._args))
        self.assertIn("-cpu Cascadelake-Server,x-force-features=on", " ".join(self.vm._args))

Changes:
 - v2 -> v3:
   - The arg and value parameters of set_vm_arg() are now mandatories and
     fixed an index out of bounds bug [crosa]
   - Rebased. Needed to adapt the (new) boot_xen.py test (patch 03)
 - v1 -> v2:
   - Recognize the cpu value passed via test parameter [crosa]
   - Fixed tags (patch 02) on preparation to patch 03 [crosa]
   - Added QEMUMachine.args property (patch 04) so that _args could be handled
     without pylint complaining (protected property)
   - Added Test.set_vm_arg() (patch 05) to handle the corner case [crosa]

Wainer dos Santos Moschetta (7):
  tests/acceptance: Automatic set -cpu to the test vm
  tests/acceptance: Fix mismatch on cpu tagged tests
  tests/acceptance: Let the framework handle "cpu:VALUE" tagged tests
  tests/acceptance: Tagging tests with "cpu:VALUE"
  python/qemu: Add args property to the QEMUMachine class
  tests/acceptance: Add set_vm_arg() to the Test class
  tests/acceptance: Handle cpu tag on x86_cpu_model_versions tests

 docs/devel/testing.rst                     | 17 +++++++++
 python/qemu/machine.py                     |  5 +++
 tests/acceptance/avocado_qemu/__init__.py  | 26 ++++++++++++++
 tests/acceptance/boot_linux.py             |  3 --
 tests/acceptance/boot_linux_console.py     | 16 +++++----
 tests/acceptance/boot_xen.py               |  1 -
 tests/acceptance/machine_mips_malta.py     |  7 ++--
 tests/acceptance/pc_cpu_hotplug_props.py   |  2 +-
 tests/acceptance/replay_kernel.py          | 17 ++++-----
 tests/acceptance/reverse_debugging.py      |  2 +-
 tests/acceptance/tcg_plugins.py            | 15 ++++----
 tests/acceptance/virtio-gpu.py             |  4 +--
 tests/acceptance/x86_cpu_model_versions.py | 40 +++++++++++++++++-----
 13 files changed, 112 insertions(+), 43 deletions(-)

-- 
2.29.2


