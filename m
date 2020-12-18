Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8026F2DDDD5
	for <lists+qemu-devel@lfdr.de>; Fri, 18 Dec 2020 06:23:37 +0100 (CET)
Received: from localhost ([::1]:57896 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kq8Eq-0000L1-He
	for lists+qemu-devel@lfdr.de; Fri, 18 Dec 2020 00:23:36 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:45462)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <elena.ufimtseva@oracle.com>)
 id 1kq8D7-0007Fy-To
 for qemu-devel@nongnu.org; Fri, 18 Dec 2020 00:21:50 -0500
Received: from aserp2120.oracle.com ([141.146.126.78]:41678)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <elena.ufimtseva@oracle.com>)
 id 1kq8D4-0004uC-6L
 for qemu-devel@nongnu.org; Fri, 18 Dec 2020 00:21:49 -0500
Received: from pps.filterd (aserp2120.oracle.com [127.0.0.1])
 by aserp2120.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 0BI5Jvmr046300;
 Fri, 18 Dec 2020 05:21:29 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=from : to : cc :
 subject : date : message-id : mime-version : content-transfer-encoding;
 s=corp-2020-01-29; bh=yQjMKLFMpNS1FEL7RZxtwozTMUKB+GhYFbRdHQnWfi0=;
 b=hkcW0BCxkoR4iOP5N/tpTPVeHD5aOrrhkeftrc6wssu08TIb+HQOyP9OGWPzC7QRO5AU
 1iIaTfjO7Jtz37MMEHNsrbFG3vGGu9hsAy4zntGldVMAQ+lYp7D/DMEGvNgmc4G6ynCy
 GNA6TdZ7S0O624/khuNatxoMafdrqoL4U3rWkr8EWge6FoGyfZ1LBPA025XLqu8zGlu7
 8t3UeJtqWatZr1T7arSOT9RvGgF0HUy5Mo9ptulHAv7sHX5/GIOrhAaoBetz1XgHF9GA
 1hEEPmPVSz1ah5yiIu0BWm+w6+cWin8ig/hcYSkd2NdyyH7UX4zP0qzJgI0J+bX+kczd BA== 
Received: from aserp3030.oracle.com (aserp3030.oracle.com [141.146.126.71])
 by aserp2120.oracle.com with ESMTP id 35cntmgmst-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=FAIL);
 Fri, 18 Dec 2020 05:21:29 +0000
Received: from pps.filterd (aserp3030.oracle.com [127.0.0.1])
 by aserp3030.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 0BI5LK7A126992;
 Fri, 18 Dec 2020 05:21:28 GMT
Received: from userv0121.oracle.com (userv0121.oracle.com [156.151.31.72])
 by aserp3030.oracle.com with ESMTP id 35d7erv1s6-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Fri, 18 Dec 2020 05:21:28 +0000
Received: from abhmp0011.oracle.com (abhmp0011.oracle.com [141.146.116.17])
 by userv0121.oracle.com (8.14.4/8.13.8) with ESMTP id 0BI5LP07000812;
 Fri, 18 Dec 2020 05:21:26 GMT
Received: from flaka.hsd1.ca.comcast.net (/10.159.131.68)
 by default (Oracle Beehive Gateway v4.0)
 with ESMTP ; Thu, 17 Dec 2020 21:21:24 -0800
From: elena.ufimtseva@oracle.com
To: qemu-devel@nongnu.org
Subject: [PATCH v14 RESEND 00/21] Initial support for multi-process Qemu
Date: Thu, 17 Dec 2020 21:20:53 -0800
Message-Id: <cover.1608263017.git.elena.ufimtseva@oracle.com>
X-Mailer: git-send-email 2.25.GIT
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9838
 signatures=668683
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 phishscore=0
 spamscore=0 bulkscore=0
 suspectscore=0 adultscore=0 mlxscore=0 mlxlogscore=999 malwarescore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2009150000
 definitions=main-2012180038
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9838
 signatures=668683
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 bulkscore=0
 phishscore=0 mlxscore=0
 lowpriorityscore=0 spamscore=0 adultscore=0 malwarescore=0 suspectscore=0
 mlxlogscore=999 impostorscore=0 priorityscore=1501 clxscore=1015
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2009150000
 definitions=main-2012180038
Received-SPF: pass client-ip=141.146.126.78;
 envelope-from=elena.ufimtseva@oracle.com; helo=aserp2120.oracle.com
X-Spam_score_int: -43
X-Spam_score: -4.4
X-Spam_bar: ----
X-Spam_report: (-4.4 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
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
 kwolf@redhat.com, berrange@redhat.com, mreitz@redhat.com,
 ross.lagerwall@citrix.com, marcandre.lureau@gmail.com, pbonzini@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Elena Ufimtseva <elena.ufimtseva@oracle.com>

Hi

This is the v14 of the patchset. Thank you very much for reviewing v13 and
sharing your feedback.

We have addressed all the comments from the v13 review with changelog below:

- [PATCH v14 05/21] multi-process: Add config option for multi-process QEMU
  add config option to disable the feature (--disable-multiprocess).

- [PATCH v14 08/21] multi-process: add qio channel write function
- [PATCH v14 09/21] multi-process: add qio channel read function
  refactor code in qio channel and split in two for read and write.

- [PATCH v14 04/21] socket: export socket_get_fd() function
  export socket_get_fd() and use in remote process with some
  modifications.

In addition, we will be sending a follow-up patch with the acceptance
test that can be used to verify that this feature is working correctly.

From the v13 review few items are TODOs:
- Prefix log messages with PID in the logging subsystem.
- Refactor the MemoryListener code in vfio-user and multi-process code
  to avoid logic duplication.

To touch upon the history of this project, we posted the Proof Of Concept
patches before the BoF session in 2018. Subsequently, we have posted 13 
versions on the qemu-devel mailing list. You can find them by following the
links below ([1] - [13]). Following people contributed to the design and
implementation of this project:
Jagannathan Raman <jag.raman@oracle.com>
Elena Ufimtseva <elena.ufimtseva@oracle.com>
John G Johnson <john.g.johnson@oracle.com>
Stefan Hajnoczi <stefanha@redhat.com>
Konrad Wilk <konrad.wilk@oracle.com>
Kanth Ghatraju <kanth.ghatraju@oracle.com>

We would like to thank the QEMU community for your feedback in the
design and implementation of this project. Qemu wiki page:
https://wiki.qemu.org/Features/MultiProcessQEMU

For the full concept writeup about QEMU multi-process, please
refer to docs/devel/qemu-multiprocess.rst. Also, see
docs/qemu-multiprocess.txt for usage information.

Thank you for reviewing these series.

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
[11]: https://www.mail-archive.com/qemu-devel@nongnu.org/msg750972.html
[12]: https://patchew.org/QEMU/cover.1606853298.git.jag.raman@oracle.com/
[13]: https://www.mail-archive.com/qemu-devel@nongnu.org/msg766825.html

Elena Ufimtseva (8):
  multi-process: add configure and usage information
  multi-process: add qio channel write function
  multi-process: add qio channel read function
  multi-process: define MPQemuMsg format and transmission functions
  multi-process: introduce proxy object
  multi-process: add proxy communication functions
  multi-process: Forward PCI config space acceses to the remote process
  multi-process: perform device reset in the remote process

Jagannathan Raman (12):
  memory: alloc RAM from file at offset
  socket: export socket_get_fd() function
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

 docs/devel/index.rst                      |   1 +
 docs/devel/multi-process.rst              | 966 ++++++++++++++++++++++
 docs/multi-process.rst                    |  64 ++
 configure                                 |  10 +
 meson.build                               |   3 +
 hw/remote/trace.h                         |   1 +
 include/exec/memory.h                     |   2 +
 include/exec/ram_addr.h                   |   2 +-
 include/hw/pci-host/remote.h              |  31 +
 include/hw/pci/pci_ids.h                  |   3 +
 include/hw/remote/iohub.h                 |  42 +
 include/hw/remote/machine.h               |  40 +
 include/hw/remote/memory.h                |  19 +
 include/hw/remote/mpqemu-link.h           |  99 +++
 include/hw/remote/proxy-memory-listener.h |  28 +
 include/hw/remote/proxy.h                 |  52 ++
 include/io/channel.h                      |  50 ++
 include/qemu/mmap-alloc.h                 |   4 +-
 include/qemu/sockets.h                    |   1 +
 include/sysemu/iothread.h                 |   6 +
 backends/hostmem-memfd.c                  |   2 +-
 hw/misc/ivshmem.c                         |   3 +-
 hw/pci-host/remote.c                      |  75 ++
 hw/remote/iohub.c                         | 119 +++
 hw/remote/machine.c                       |  80 ++
 hw/remote/memory.c                        |  65 ++
 hw/remote/message.c                       | 230 ++++++
 hw/remote/mpqemu-link.c                   | 267 ++++++
 hw/remote/proxy-memory-listener.c         | 227 +++++
 hw/remote/proxy.c                         | 371 +++++++++
 hw/remote/remote-obj.c                    | 194 +++++
 io/channel.c                              |  88 +-
 iothread.c                                |   6 +
 softmmu/memory.c                          |   3 +-
 softmmu/physmem.c                         |  11 +-
 stubs/monitor.c                           |   2 +-
 tests/test-util-sockets.c                 |   2 +-
 util/mmap-alloc.c                         |   7 +-
 util/oslib-posix.c                        |   2 +-
 util/qemu-sockets.c                       |  18 +-
 Kconfig.host                              |   4 +
 MAINTAINERS                               |  24 +
 hw/Kconfig                                |   1 +
 hw/meson.build                            |   1 +
 hw/pci-host/Kconfig                       |   3 +
 hw/pci-host/meson.build                   |   1 +
 hw/remote/Kconfig                         |   4 +
 hw/remote/meson.build                     |  13 +
 hw/remote/trace-events                    |   4 +
 49 files changed, 3202 insertions(+), 49 deletions(-)
 create mode 100644 docs/devel/multi-process.rst
 create mode 100644 docs/multi-process.rst
 create mode 100644 hw/remote/trace.h
 create mode 100644 include/hw/pci-host/remote.h
 create mode 100644 include/hw/remote/iohub.h
 create mode 100644 include/hw/remote/machine.h
 create mode 100644 include/hw/remote/memory.h
 create mode 100644 include/hw/remote/mpqemu-link.h
 create mode 100644 include/hw/remote/proxy-memory-listener.h
 create mode 100644 include/hw/remote/proxy.h
 create mode 100644 hw/pci-host/remote.c
 create mode 100644 hw/remote/iohub.c
 create mode 100644 hw/remote/machine.c
 create mode 100644 hw/remote/memory.c
 create mode 100644 hw/remote/message.c
 create mode 100644 hw/remote/mpqemu-link.c
 create mode 100644 hw/remote/proxy-memory-listener.c
 create mode 100644 hw/remote/proxy.c
 create mode 100644 hw/remote/remote-obj.c
 create mode 100644 hw/remote/Kconfig
 create mode 100644 hw/remote/meson.build
 create mode 100644 hw/remote/trace-events

-- 
2.25.GIT


