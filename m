Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B10BC600D7E
	for <lists+qemu-devel@lfdr.de>; Mon, 17 Oct 2022 13:14:29 +0200 (CEST)
Received: from localhost ([::1]:57992 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1okO4i-0005DM-PA
	for lists+qemu-devel@lfdr.de; Mon, 17 Oct 2022 07:14:28 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33294)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <arbn@yandex-team.com>)
 id 1okNvy-0001Rz-SJ
 for qemu-devel@nongnu.org; Mon, 17 Oct 2022 07:05:27 -0400
Received: from forwardcorp1b.mail.yandex.net ([178.154.239.136]:54282)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <arbn@yandex-team.com>)
 id 1okNvu-0001IL-Hc
 for qemu-devel@nongnu.org; Mon, 17 Oct 2022 07:05:24 -0400
Received: from sas1-7470331623bb.qloud-c.yandex.net
 (sas1-7470331623bb.qloud-c.yandex.net
 [IPv6:2a02:6b8:c08:bd1e:0:640:7470:3316])
 by forwardcorp1b.mail.yandex.net (Yandex) with ESMTP id 75F4E60020;
 Mon, 17 Oct 2022 13:54:22 +0300 (MSK)
Received: from dellarbn.yandex.net (unknown
 [2a02:6b8:0:107:3e85:844d:5b1d:60a])
 by sas1-7470331623bb.qloud-c.yandex.net (smtpcorp/Yandex) with ESMTPSA id
 PrI3KDUSQF-sK7KKfk0; Mon, 17 Oct 2022 13:54:21 +0300
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
 (Client certificate not present)
Precedence: bulk
X-Yandex-Fwd: 1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yandex-team.com;
 s=default; 
 t=1666004061; bh=zBkBLy5nxSuf4H4Z8wU9ROwm7xDuecW8/9UEyZg4J4g=;
 h=Message-Id:Date:Cc:Subject:To:From;
 b=g6bZrOwvBjlHStjher+2RQgCYQZqlI2F91GPeEFLJShVMmMvU10VWRAM7sLyFN+bC
 GkXnQtJLuHWXRvHq9XGg4/XdGrqx48WbO0HI47pdsBiKVt+Nh7BFaEqq5a6oimm/X3
 wy0GkKMn8IzIxuZq3UnHs6VzDa3RFYowUeL0XTdM=
Authentication-Results: sas1-7470331623bb.qloud-c.yandex.net;
 dkim=pass header.i=@yandex-team.com
From: Andrey Ryabinin <arbn@yandex-team.com>
To: qemu-devel@nongnu.org
Cc: Steve Sistare <steven.sistare@oracle.com>, yc-core@yandex-team.ru,
 Andrey Ryabinin <arbn@yandex-team.com>,
 Tony Krowiak <akrowiak@linux.ibm.com>, Halil Pasic <pasic@linux.ibm.com>,
 Jason Herne <jjherne@linux.ibm.com>, Cornelia Huck <cohuck@redhat.com>,
 Thomas Huth <thuth@redhat.com>,
 Alex Williamson <alex.williamson@redhat.com>,
 Eric Farman <farman@linux.ibm.com>,
 Matthew Rosato <mjrosato@linux.ibm.com>,
 Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 Eduardo Habkost <eduardo@habkost.net>, Eric Blake <eblake@redhat.com>,
 Markus Armbruster <armbru@redhat.com>, Cleber Rosa <crosa@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Beraldo Leal <bleal@redhat.com>
Subject: [PATCH 0/4] Allow to pass pre-created VFIO container/group to QEMU
Date: Mon, 17 Oct 2022 13:54:03 +0300
Message-Id: <20221017105407.3858-1-arbn@yandex-team.com>
X-Mailer: git-send-email 2.37.3
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=178.154.239.136;
 envelope-from=arbn@yandex-team.com; helo=forwardcorp1b.mail.yandex.net
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.29
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

These patches add possibility to pass VFIO device to QEMU using file
descriptors of VFIO container/group, instead of creating those by QEMU.
This allows to take away permissions to open /dev/vfio/* from QEMU and
delegate that to managment layer like libvirt.

The VFIO API doen't allow to pass just fd of device, since we also need to have
VFIO container and group. So these patches allow to pass created VFIO container/group
to QEMU via command line/QMP, e.g. like this:
            -object vfio-container,id=ct,fd=5 \
            -object vfio-group,id=grp,fd=6,container=ct \
            -device vfio-pci,host=05:00.0,group=grp

A bit more detailed example can be found in the test:
tests/avocado/vfio.py

 *Possible future steps*

Also these patches could be a step for making local migration (within one host)
of the QEMU with VFIO devices.
I've built some prototype on top of these patches to try such idea.
In short the scheme of such migration is following:
 - migrate source VM to file.
 - retrieve fd numbers of VFIO container/group/device via new property and qom-get command
 - get the actual file descriptor via SCM_RIGHTS using new qmp command 'returnfd' which
   sends fd from QEMU by the number: { 'command': 'returnfd', 'data': {'fd': 'int'}}
 - shutdown source VM
 - launch destination VM, plug VFIO devices using obtained file descriptors.
 - PCI device reset duriing plugging the device avoided with the help of new parameter
    on vfio-pci device.
This is alternative to 'cpr-exec' migration scheme proposed here:
   https://lore.kernel.org/qemu-devel/1658851843-236870-1-git-send-email-steven.sistare@oracle.com/
Unlike cpr-exec it doesn't require new kernel flags VFIO_DMA_UNMAP_FLAG_VADDR/VFIO_DMA_MAP_FLAG_VADDR
And doesn't require new migration mode, just some additional steps from management layer.


Andrey Ryabinin (4):
  vfio: add vfio-container user createable object
  vfio: add vfio-group user createable object
  vfio: Add 'group' property to 'vfio-pci' device
  tests/avocado/vfio: add test for vfio devices

 hw/vfio/ap.c                  |   2 +-
 hw/vfio/ccw.c                 |   2 +-
 hw/vfio/common.c              | 471 +++++++++++++++++++++++-----------
 hw/vfio/pci.c                 |  10 +-
 hw/vfio/platform.c            |   2 +-
 hw/vfio/trace-events          |   4 +-
 include/hw/vfio/vfio-common.h |  10 +-
 qapi/qom.json                 |  29 +++
 tests/avocado/vfio.py         | 156 +++++++++++
 9 files changed, 525 insertions(+), 161 deletions(-)
 create mode 100644 tests/avocado/vfio.py

-- 
2.37.3


