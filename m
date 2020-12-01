Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 607C82CAD3E
	for <lists+qemu-devel@lfdr.de>; Tue,  1 Dec 2020 21:25:05 +0100 (CET)
Received: from localhost ([::1]:48746 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kkCCu-000730-Cs
	for lists+qemu-devel@lfdr.de; Tue, 01 Dec 2020 15:25:04 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:59252)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jag.raman@oracle.com>)
 id 1kkCBG-0005Kx-Oo
 for qemu-devel@nongnu.org; Tue, 01 Dec 2020 15:23:22 -0500
Received: from aserp2120.oracle.com ([141.146.126.78]:44172)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jag.raman@oracle.com>)
 id 1kkCBC-0000Sw-EX
 for qemu-devel@nongnu.org; Tue, 01 Dec 2020 15:23:22 -0500
Received: from pps.filterd (aserp2120.oracle.com [127.0.0.1])
 by aserp2120.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 0B1KExBQ122233;
 Tue, 1 Dec 2020 20:23:09 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=from : to : cc :
 subject : date : message-id; s=corp-2020-01-29;
 bh=q9UrFYKPaPVMnlhih4BGpH98Wt088RumnXAbsUwtB38=;
 b=KeRiOpGTuA6RMxm+kBU7UfI9dItpf9q4Jg8k7IOKZrr4RA95X5ToCZdoG+reDxxrsOk8
 7f0h8GEpk/LbXOOyPZb45FEueYMwkH2JsboWX/FTYvs+q42NmzxdDpOBautHIWzHH6nz
 m7q+Yey5dPBkwJWvRJmjanrnuYf2HI7p5iVSTyTWP6jwCHeRzgg40vnnqDYRuLbzMve6
 +K0BX8hEf+rnrhnP3VlPPs8RBIw5xwXImC/RutHrEZ5PSaJE7vIafje+3NPX5EIuxeP7
 wl1b8pci9tcRU9BcYhG5uJrKbtf+SoOAyZNULTJFpiMWfN/W3vA4iEfgeArfyEgyulAi bw== 
Received: from aserp3030.oracle.com (aserp3030.oracle.com [141.146.126.71])
 by aserp2120.oracle.com with ESMTP id 353egkmm2j-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=FAIL);
 Tue, 01 Dec 2020 20:23:08 +0000
Received: from pps.filterd (aserp3030.oracle.com [127.0.0.1])
 by aserp3030.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 0B1KGOne115883;
 Tue, 1 Dec 2020 20:23:08 GMT
Received: from userv0122.oracle.com (userv0122.oracle.com [156.151.31.75])
 by aserp3030.oracle.com with ESMTP id 35404nbsh5-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 01 Dec 2020 20:23:08 +0000
Received: from abhmp0020.oracle.com (abhmp0020.oracle.com [141.146.116.26])
 by userv0122.oracle.com (8.14.4/8.14.4) with ESMTP id 0B1KN4Q4014443;
 Tue, 1 Dec 2020 20:23:04 GMT
Received: from jaraman-bur-1.us.oracle.com (/10.152.33.39)
 by default (Oracle Beehive Gateway v4.0)
 with ESMTP ; Tue, 01 Dec 2020 20:23:04 +0000
From: Jagannathan Raman <jag.raman@oracle.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v12 00/19] Initial support for multi-process Qemu
Date: Tue,  1 Dec 2020 15:22:35 -0500
Message-Id: <cover.1606853298.git.jag.raman@oracle.com>
X-Mailer: git-send-email 1.8.3.1
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9822
 signatures=668682
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 suspectscore=0
 bulkscore=0
 malwarescore=0 mlxscore=0 mlxlogscore=999 phishscore=0 spamscore=0
 adultscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2009150000 definitions=main-2012010122
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9822
 signatures=668682
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 mlxscore=0
 bulkscore=0 suspectscore=0
 phishscore=0 mlxlogscore=999 lowpriorityscore=0 malwarescore=0
 priorityscore=1501 spamscore=0 impostorscore=0 clxscore=1011 adultscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2009150000
 definitions=main-2012010122
Received-SPF: pass client-ip=141.146.126.78; envelope-from=jag.raman@oracle.com;
 helo=aserp2120.oracle.com
X-Spam_score_int: -58
X-Spam_score: -5.9
X-Spam_bar: -----
X-Spam_report: (-5.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1.497,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_MED=-2.3, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_PASS=-0.001,
 SPF_PASS=-0.001, UNPARSEABLE_RELAY=0.001 autolearn=ham autolearn_force=no
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
Cc: elena.ufimtseva@oracle.com, fam@euphon.net, swapnil.ingle@nutanix.com,
 john.g.johnson@oracle.com, kraxel@redhat.com, jag.raman@oracle.com,
 quintela@redhat.com, mst@redhat.com, armbru@redhat.com,
 kanth.ghatraju@oracle.com, felipe@nutanix.com, thuth@redhat.com,
 ehabkost@redhat.com, konrad.wilk@oracle.com, dgilbert@redhat.com,
 alex.williamson@redhat.com, stefanha@redhat.com, thanos.makatos@nutanix.com,
 rth@twiddle.net, kwolf@redhat.com, berrange@redhat.com, mreitz@redhat.com,
 ross.lagerwall@citrix.com, marcandre.lureau@gmail.com, pbonzini@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Hello,

This is the v12 of the patchset. Thank you very much for the
review of the v11 of the series.

We made changes to the following patches in this version:
  - Moved patches 18 & 19 in v11 to the front of the series based
    on feedback from Phil
  - [PATCH v12 02/19 ] multi-process: add configure and usage information
  - [PATCH v12 04/19 ] multi-process: Add config option for multi-process QEMU
  - [PATCH v12 08/19] multi-process: define MPQemuMsg format and transmission
    functions.

In summary, we replaced "scripts/mpqemu-launcher.py" with
"tests/multiprocess/multiprocess-lsi53c895a.py". We tested this test on
x86_64 and aarch64 architectures, which we have access to.

We changed the name of the config variable called CONFIG_MPQEMU
to CONFIG_MULTIPROCESS. We also moved the config variable
definition out of the "configure" script, and into the Kconfig
system. Previously, the user specified if multiprocess was enabled
using the "--enable-mpqemu" argument to the configure script.
In this version, we changed that. The multiprocess support is enabled
automatically if Kconfig system detects KVM support. This is needed
to run acceptance tests in the future.

We are working on acceptance tests (tests/acceptance/) for this
project. However, we have hit a roadblock and are working with the
avocado-devel community to resolve the issue.

We noticed that checkpatch.pl script flagged a warning for Patch 4 for
this series, but we don't believe that's a valid concern. We generated
the patches using QEMU's git orderfile
(git format-patch -O scripts/git.orderfile ...).

To touch upon the history of this project, we posted the Proof Of
Concept patches before the BoF session in 2018. Subsequently, we have
posted 11 versions on the qemu-devel mailing list. You can find them
by following the links below ([1] - [11]).Following people contributed
to the design and implementation of this project:
Jagannathan Raman <jag.raman@oracle.com>
Elena Ufimtseva <elena.ufimtseva@oracle.com>
John G Johnson <john.g.johnson@oracle.com>
Stefan Hajnoczi <stefanha@redhat.com>
Konrad Wilk <konrad.wilk@oracle.com>
Kanth Ghatraju <kanth.ghatraju@oracle.com>

We would like to thank QEMU community for your feedback in the
design and implementation of this project.Qemu wiki page:
https://wiki.qemu.org/Features/MultiProcessQEMU

For the full concept writeup about QEMU multi-process, please
refer to docs/devel/qemu-multiprocess.rst. Also see
docs/qemu-multiprocess.txt for usage information. We welcome
all your ideas, concerns, and questions for this patchset.

Thank you!

[POC]: https://www.mail-archive.com/qemu-devel@nongnu.org/msg566538.html
[1]: https://www.mail-archive.com/qemu-devel@nongnu.org/msg602285.html
[2]: https://www.mail-archive.com/qemu-devel@nongnu.org/msg624877.html
[3]: https://www.mail-archive.com/qemu-devel@nongnu.org/msg642000.html
[4]: https://www.mail-archive.com/qemu-devel@nongnu.org/msg655118.html
[5]: https://www.mail-archive.com/qemu-devel@nongnu.org/msg682429.html
[6]: https://www.mail-archive.com/qemu-devel@nongnu.org/msg697484.html
[7]: https://patchew.org/QEMU/cover.1593273671.git.elena.ufimtseva@oracle.com/
[8]: https://www.mail-archive.com/qemu-devel@nongnu.org/msg727007.html
[9]: https://www.mail-archive.com/qemu-devel@nongnu.org/msg734275.html
[10]: https://www.mail-archive.com/qemu-devel@nongnu.org/msg747638.html
[11]: https://www.mail-archive.com/qemu-devel@nongnu.org/msg750972.htmlThank you!


Elena Ufimtseva (7):
  multi-process: add configure and usage information
  multi-process: add qio channel function to transmit data and fds
  multi-process: define MPQemuMsg format and transmission functions
  multi-process: introduce proxy object
  multi-process: add proxy communication functions
  multi-process: Forward PCI config space acceses to the remote process
  multi-process: perform device reset in the remote process

Jagannathan Raman (11):
  memory: alloc RAM from file at offset
  multi-process: Add config option for multi-process QEMU
  multi-process: setup PCI host bridge for remote device
  multi-process: setup a machine object for remote device process
  multi-process: Initialize message handler in remote device
  multi-process: Associate fd of a PCIDevice with its object
  multi-process: setup memory manager for remote device
  multi-process: PCI BAR read/write handling for proxy & remote
    endpoints
  multi-process: Synchronize remote memory
  multi-process: create IOHUB object to handle irq
  multi-process: Retrieve PCI info from remote process

John G Johnson (1):
  multi-process: add the concept description to
    docs/devel/qemu-multiprocess

 docs/devel/index.rst                          |   1 +
 docs/devel/multi-process.rst                  | 966 ++++++++++++++++++++++++++
 docs/multi-process.rst                        |  66 ++
 include/exec/memory.h                         |   2 +
 include/exec/ram_addr.h                       |   2 +-
 include/hw/pci-host/remote.h                  |  31 +
 include/hw/pci/pci_ids.h                      |   3 +
 include/hw/remote/iohub.h                     |  42 ++
 include/hw/remote/machine.h                   |  40 ++
 include/hw/remote/memory-sync.h               |  27 +
 include/hw/remote/memory.h                    |  19 +
 include/hw/remote/mpqemu-link.h               |  98 +++
 include/hw/remote/proxy.h                     |  53 ++
 include/hw/remote/remote-obj.h                |  42 ++
 include/io/channel.h                          |  24 +
 include/qemu/mmap-alloc.h                     |   3 +-
 backends/hostmem-memfd.c                      |   2 +-
 hw/misc/ivshmem.c                             |   3 +-
 hw/pci-host/remote.c                          |  75 ++
 hw/remote/iohub.c                             | 123 ++++
 hw/remote/machine.c                           |  79 +++
 hw/remote/memory-sync.c                       | 210 ++++++
 hw/remote/memory.c                            |  58 ++
 hw/remote/message.c                           | 241 +++++++
 hw/remote/mpqemu-link.c                       | 308 ++++++++
 hw/remote/proxy.c                             | 378 ++++++++++
 hw/remote/remote-obj.c                        | 154 ++++
 io/channel.c                                  |  45 ++
 softmmu/memory.c                              |   3 +-
 softmmu/physmem.c                             |  11 +-
 util/mmap-alloc.c                             |   7 +-
 util/oslib-posix.c                            |   2 +-
 MAINTAINERS                                   |  25 +
 accel/Kconfig                                 |   1 +
 hw/Kconfig                                    |   1 +
 hw/meson.build                                |   1 +
 hw/pci-host/Kconfig                           |   3 +
 hw/pci-host/meson.build                       |   1 +
 hw/remote/Kconfig                             |   4 +
 hw/remote/meson.build                         |  13 +
 tests/multiprocess/multiprocess-lsi53c895a.py |  92 +++
 41 files changed, 3246 insertions(+), 13 deletions(-)
 create mode 100644 docs/devel/multi-process.rst
 create mode 100644 docs/multi-process.rst
 create mode 100644 include/hw/pci-host/remote.h
 create mode 100644 include/hw/remote/iohub.h
 create mode 100644 include/hw/remote/machine.h
 create mode 100644 include/hw/remote/memory-sync.h
 create mode 100644 include/hw/remote/memory.h
 create mode 100644 include/hw/remote/mpqemu-link.h
 create mode 100644 include/hw/remote/proxy.h
 create mode 100644 include/hw/remote/remote-obj.h
 create mode 100644 hw/pci-host/remote.c
 create mode 100644 hw/remote/iohub.c
 create mode 100644 hw/remote/machine.c
 create mode 100644 hw/remote/memory-sync.c
 create mode 100644 hw/remote/memory.c
 create mode 100644 hw/remote/message.c
 create mode 100644 hw/remote/mpqemu-link.c
 create mode 100644 hw/remote/proxy.c
 create mode 100644 hw/remote/remote-obj.c
 create mode 100644 hw/remote/Kconfig
 create mode 100644 hw/remote/meson.build
 create mode 100755 tests/multiprocess/multiprocess-lsi53c895a.py

-- 
1.8.3.1


