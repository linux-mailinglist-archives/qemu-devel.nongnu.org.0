Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 619992F0C13
	for <lists+qemu-devel@lfdr.de>; Mon, 11 Jan 2021 06:08:35 +0100 (CET)
Received: from localhost ([::1]:32958 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kypRS-0002tD-Bw
	for lists+qemu-devel@lfdr.de; Mon, 11 Jan 2021 00:08:34 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:60030)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jag.raman@oracle.com>)
 id 1kypPa-00019f-RI
 for qemu-devel@nongnu.org; Mon, 11 Jan 2021 00:06:38 -0500
Received: from aserp2130.oracle.com ([141.146.126.79]:52902)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jag.raman@oracle.com>)
 id 1kypPY-0005ms-GU
 for qemu-devel@nongnu.org; Mon, 11 Jan 2021 00:06:38 -0500
Received: from pps.filterd (aserp2130.oracle.com [127.0.0.1])
 by aserp2130.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 10B55TiG136616;
 Mon, 11 Jan 2021 05:06:19 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=from : to : cc :
 subject : date : message-id : mime-version : content-type :
 content-transfer-encoding; s=corp-2020-01-29;
 bh=aLCZdr7NLLfzCog4qsvxTN0SIpoAGUuZ/ajiqrbrW3o=;
 b=O4NmQP6bWzCsErfHXmjVaOBvAynQfKiE1gXeOHxCVAeKfiK83at2uEnIYgJY9fQuNEST
 LlIegOBsFNhD2vG0kaicD5jd+kpHaJ+A8jhq7L7/m48NMiTscEo4uSAPPOiORF8ooUBH
 iCMyCzz67RKE8n0vQ8KLYEFSJRlAV1t8lVYhkdC9M+sT0qJQt2N/z/nZSw6EmLBbpcUw
 BLlGAJX0AUOeAlNFcZL1L/wGB2TWLtrulSmJxUapxmhiUCw6KskXQjwPNQHWayDpGK+e
 hy5YldA2EUJfoiDlm/+mKYrHtqVgxF5LkUyxvy768mybpoAUpLj42altI/svz8J69rP9 mQ== 
Received: from aserp3030.oracle.com (aserp3030.oracle.com [141.146.126.71])
 by aserp2130.oracle.com with ESMTP id 35yknhsypw-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=FAIL);
 Mon, 11 Jan 2021 05:06:19 +0000
Received: from pps.filterd (aserp3030.oracle.com [127.0.0.1])
 by aserp3030.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 10B50gjd139254;
 Mon, 11 Jan 2021 05:06:19 GMT
Received: from aserv0122.oracle.com (aserv0122.oracle.com [141.146.126.236])
 by aserp3030.oracle.com with ESMTP id 35yp2k9cfp-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 11 Jan 2021 05:06:19 +0000
Received: from abhmp0015.oracle.com (abhmp0015.oracle.com [141.146.116.21])
 by aserv0122.oracle.com (8.14.4/8.14.4) with ESMTP id 10B56Gr6002988;
 Mon, 11 Jan 2021 05:06:17 GMT
Received: from jaraman-bur-1.us.oracle.com (/10.152.33.39)
 by default (Oracle Beehive Gateway v4.0)
 with ESMTP ; Sun, 10 Jan 2021 21:06:16 -0800
From: Jagannathan Raman <jag.raman@oracle.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v16 00/20] Initial support for multi-process Qemu
Date: Mon, 11 Jan 2021 00:05:45 -0500
Message-Id: <cover.1610339529.git.jag.raman@oracle.com>
X-Mailer: git-send-email 1.8.3.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9860
 signatures=668683
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 bulkscore=0
 suspectscore=0 spamscore=0
 adultscore=0 mlxlogscore=999 mlxscore=0 phishscore=0 malwarescore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2009150000
 definitions=main-2101110030
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9860
 signatures=668683
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 mlxscore=0
 suspectscore=0 phishscore=0
 clxscore=1015 mlxlogscore=999 lowpriorityscore=0 adultscore=0
 malwarescore=0 bulkscore=0 spamscore=0 impostorscore=0 priorityscore=1501
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2009150000
 definitions=main-2101110030
Received-SPF: pass client-ip=141.146.126.79; envelope-from=jag.raman@oracle.com;
 helo=aserp2130.oracle.com
X-Spam_score_int: -46
X-Spam_score: -4.7
X-Spam_bar: ----
X-Spam_report: (-4.7 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.251,
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

Hi

This is the v16 of the patchset. Thank you for your time reviewing v15.

This version has the following changes:

[PATCH v16 04/20] multi-process: Add config option for multi-process QEMU
  - Using “default_feature” value to enable/disable multiprocess

[PATCH v16 07/20] io: add qio_channel_writev_full_all helper
  - Removed local variable in qio_channel_writev_full_all(), setting arguments
    directly
  - Fixed indentation issues
  - Updated commit message

[PATCH v16 08/20] io: add qio_channel_readv_full_all_eof &
                  qio_channel_readv_full_all helpers
  - Added two variants of readv - _full_all_eof & _full_all based on feedback
  - Dropped errno return value
  - Updated commit message
  - Unable to remove local variables and set arguments directly as the
    arguments are later needed for cleanup (g_free/close) during failure

Switched to using OBJECT_DECLARE_{SIMPLE_TYPE, TYPE} macros in the
following patches:
  - [PATCH v16 05/20] multi-process: setup PCI host bridge for remote device
  - [PATCH v16 06/20] multi-process: setup a machine object for remote device
                      process
  - [PATCH v16 11/20] multi-process: Associate fd of a PCIDevice with its object
  - [PATCH v16 13/20] multi-process: introduce proxy object

Updated copyright text to use the year 2021 in the files that show them.

To touch upon the history of this project, we posted the Proof Of Concept
patches before the BoF session in 2018. Subsequently, we have posted 15
versions on the qemu-devel mailing list. You can find them by following
the links below ([1] - [15]). Following people contributed to the design and
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

Thank you for reviewing this series!

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
[15]: https://www.mail-archive.com/qemu-devel@nongnu.org/msg769178.html

Elena Ufimtseva (8):
  multi-process: add configure and usage information
  io: add qio_channel_writev_full_all helper
  io: add qio_channel_readv_full_all_eof & qio_channel_readv_full_all
    helpers
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
 docs/devel/multi-process.rst              | 966 ++++++++++++++++++++++++++++++
 docs/multi-process.rst                    |  64 ++
 configure                                 |  10 +
 meson.build                               |   5 +-
 hw/remote/trace.h                         |   1 +
 include/exec/memory.h                     |   2 +
 include/exec/ram_addr.h                   |   2 +-
 include/hw/pci-host/remote.h              |  30 +
 include/hw/pci/pci_ids.h                  |   3 +
 include/hw/remote/iohub.h                 |  42 ++
 include/hw/remote/machine.h               |  38 ++
 include/hw/remote/memory.h                |  19 +
 include/hw/remote/mpqemu-link.h           |  99 +++
 include/hw/remote/proxy-memory-listener.h |  28 +
 include/hw/remote/proxy.h                 |  48 ++
 include/io/channel.h                      |  76 +++
 include/qemu/mmap-alloc.h                 |   4 +-
 include/sysemu/iothread.h                 |   6 +
 backends/hostmem-memfd.c                  |   2 +-
 hw/misc/ivshmem.c                         |   3 +-
 hw/pci-host/remote.c                      |  75 +++
 hw/remote/iohub.c                         | 119 ++++
 hw/remote/machine.c                       |  80 +++
 hw/remote/memory.c                        |  65 ++
 hw/remote/message.c                       | 230 +++++++
 hw/remote/mpqemu-link.c                   | 267 +++++++++
 hw/remote/proxy-memory-listener.c         | 227 +++++++
 hw/remote/proxy.c                         | 379 ++++++++++++
 hw/remote/remote-obj.c                    | 203 +++++++
 io/channel.c                              |  88 ++-
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
 45 files changed, 3234 insertions(+), 32 deletions(-)
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
1.8.3.1


