Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id F346E2E18FD
	for <lists+qemu-devel@lfdr.de>; Wed, 23 Dec 2020 07:35:52 +0100 (CET)
Received: from localhost ([::1]:40856 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1krxkV-00079W-MS
	for lists+qemu-devel@lfdr.de; Wed, 23 Dec 2020 01:35:51 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:41200)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <elena.ufimtseva@oracle.com>)
 id 1krxR9-0005zD-H6
 for qemu-devel@nongnu.org; Wed, 23 Dec 2020 01:15:54 -0500
Received: from aserp2120.oracle.com ([141.146.126.78]:33132)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <elena.ufimtseva@oracle.com>)
 id 1krxQv-0006Bb-IG
 for qemu-devel@nongnu.org; Wed, 23 Dec 2020 01:15:50 -0500
Received: from pps.filterd (aserp2120.oracle.com [127.0.0.1])
 by aserp2120.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 0BN6A9Za094534;
 Wed, 23 Dec 2020 06:15:12 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=from : to : cc :
 subject : date : message-id : mime-version : content-transfer-encoding;
 s=corp-2020-01-29; bh=/NpOEMHGPIUwHBPxk1e2xFeEWwG2wzhIjnSRwZbdyHI=;
 b=HnALuk1m0wUB7yR5RFkuqWNSF3cF9Z8t6A2zHzu8tnZxWCUMVr3z4Rki4FpnkLoEO21R
 t90nbA7IuAlMraxcu6eLmmypuZA2qsOyxrtquTJnwR1qGsfqC8Z156EfXtc66TV1XSbO
 n7gpKgFlREykcgS2mAC4Rp28UMjGLbN91H3H7Yqp0UVUsmidxYtERoC0DLYjeXeRDXjZ
 rUtk0PDGSSXBfbz5Vo9gaPxvHdH8obrwF6VmPjFHfTdaaPtPsUfaL6MiYzF8eSxU7vm9
 iQD767/sVRfWdXllXKFHlgemBSDnVPTI2sf+B+mefquxWBOh4kl34a1PWCHrysBP+3AM cg== 
Received: from userp3020.oracle.com (userp3020.oracle.com [156.151.31.79])
 by aserp2120.oracle.com with ESMTP id 35k0cw6f0g-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=FAIL);
 Wed, 23 Dec 2020 06:15:12 +0000
Received: from pps.filterd (userp3020.oracle.com [127.0.0.1])
 by userp3020.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 0BN69aO2101103;
 Wed, 23 Dec 2020 06:15:11 GMT
Received: from userv0121.oracle.com (userv0121.oracle.com [156.151.31.72])
 by userp3020.oracle.com with ESMTP id 35k0e2kpq0-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 23 Dec 2020 06:15:10 +0000
Received: from abhmp0016.oracle.com (abhmp0016.oracle.com [141.146.116.22])
 by userv0121.oracle.com (8.14.4/8.13.8) with ESMTP id 0BN6F8wJ002837;
 Wed, 23 Dec 2020 06:15:08 GMT
Received: from flaka.hsd1.ca.comcast.net (/67.180.143.163)
 by default (Oracle Beehive Gateway v4.0)
 with ESMTP ; Tue, 22 Dec 2020 22:15:07 -0800
From: elena.ufimtseva@oracle.com
To: qemu-devel@nongnu.org
Subject: [PATCH v15 00/20] Initial support for multi-process Qemu
Date: Tue, 22 Dec 2020 22:14:35 -0800
Message-Id: <cover.1608702853.git.elena.ufimtseva@oracle.com>
X-Mailer: git-send-email 2.25.GIT
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9843
 signatures=668683
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 mlxlogscore=999
 bulkscore=0
 malwarescore=0 phishscore=0 mlxscore=0 adultscore=0 spamscore=0
 suspectscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2009150000 definitions=main-2012230046
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9843
 signatures=668683
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0
 lowpriorityscore=0 mlxlogscore=999
 mlxscore=0 priorityscore=1501 impostorscore=0 suspectscore=0 phishscore=0
 spamscore=0 clxscore=1015 malwarescore=0 bulkscore=0 adultscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2009150000
 definitions=main-2012230046
Received-SPF: pass client-ip=141.146.126.78;
 envelope-from=elena.ufimtseva@oracle.com; helo=aserp2120.oracle.com
X-Spam_score_int: -43
X-Spam_score: -4.4
X-Spam_bar: ----
X-Spam_report: (-4.4 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_MED=-2.3, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_PASS=-0.001,
 SPF_PASS=-0.001,
 UNPARSEABLE_RELAY=0.001 autolearn=unavailable autolearn_force=no
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

This is the v15 of the patchset.
Thank you for your time reviewing v14.

This version has the following changes:

- [PATCH v15 08/20] multi-process: add qio channel read function
  Prevent memory leaks by closing file descriptors and freeing memory
  for fd array on failure in qio_channel_readv_full_all(..).

- The patch from v14 was dropped (See [PATCH v14 04/21] socket: export
  socket_get_fd() function) and instead the monitor_fd_param(..) and
  fd_is_socket(..) are used in the patches:
  [PATCH v15 11/20] "multi-process: Associate fd of a PCIDevice with its
  object"
  and
  [PATCH v15 13/20] "multi-process: introduce proxy object".

In addition, we will be sending a follow-up patch with the acceptance
test that can be used to verify that this feature is working correctly.


From the previous reviews the TODOs are:
- Prefix log messages with PID in the logging subsystem.
- Refactor the MemoryListener code in vfio-user and multi-process code
  to avoid logic duplication.

To touch upon the history of this project, we posted the Proof Of Concept
patches before the BoF session in 2018. Subsequently, we have posted 14
versions on the qemu-devel mailing list. You can find them by following the
links below ([1] - [14]). Following people contributed to the design and
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
[14]: https://www.mail-archive.com/qemu-devel@nongnu.org/msg768376.html

Elena Ufimtseva (8):
  multi-process: add configure and usage information
  multi-process: add qio channel write function
  multi-process: add qio channel read function
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
 hw/remote/proxy.c                         | 379 +++++++++
 hw/remote/remote-obj.c                    | 208 +++++
 io/channel.c                              | 102 ++-
 iothread.c                                |   6 +
 softmmu/memory.c                          |   3 +-
 softmmu/physmem.c                         |  11 +-
 util/mmap-alloc.c                         |   7 +-
 util/oslib-posix.c                        |   2 +-
 Kconfig.host                              |   4 +
 MAINTAINERS                               |  24 +
 hw/Kconfig                                |   1 +
 hw/meson.build                            |   1 +
 hw/pci-host/Kconfig                       |   3 +
 hw/pci-host/meson.build                   |   1 +
 hw/remote/Kconfig                         |   4 +
 hw/remote/meson.build                     |  13 +
 hw/remote/trace-events                    |   4 +
 45 files changed, 3225 insertions(+), 39 deletions(-)
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


