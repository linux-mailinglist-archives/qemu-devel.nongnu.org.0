Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5449B5F4ABA
	for <lists+qemu-devel@lfdr.de>; Tue,  4 Oct 2022 23:13:31 +0200 (CEST)
Received: from localhost ([::1]:54726 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ofpEI-0002c0-EJ
	for lists+qemu-devel@lfdr.de; Tue, 04 Oct 2022 17:13:30 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40760)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <si-wei.liu@oracle.com>)
 id 1ofp65-0000cc-79
 for qemu-devel@nongnu.org; Tue, 04 Oct 2022 17:05:01 -0400
Received: from mx0a-00069f02.pphosted.com ([205.220.165.32]:42778)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <si-wei.liu@oracle.com>)
 id 1ofp62-0008Cq-LR
 for qemu-devel@nongnu.org; Tue, 04 Oct 2022 17:05:00 -0400
Received: from pps.filterd (m0246617.ppops.net [127.0.0.1])
 by mx0b-00069f02.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 294L4C39007455;
 Tue, 4 Oct 2022 21:04:56 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=from : to : cc :
 subject : date : message-id; s=corp-2022-7-12;
 bh=0HpfF3mR6/vcXLfv21Li9DA1zK03IWlg2iDz9cmWwxA=;
 b=cbYiVRPuQ4IQrR7tVT1gwWbNTPUois9ZdMD6UYfxymwnNcmODrmiPMo4ufEkodFKZEs6
 dqqw3EEERlVQVIZULXS7BYwLbAjUeDIZYn9wjmW92Zjy0K9BtJ/oExDfxd4XliB7dDBy
 gODGMtGnqsarVfuK2oDxohOdr2T5dy0vfo+Yp6sEK0T+WIbPXxhVGRy2JsFFcr2sbfFU
 QQRGw8lMrIayyF+XZ4Ra0UrdYjYh+xcUhgqX5ON6SlIRSNFY7GWY7EuvVgURF2p7x5Q5
 FiqE3MiI9o2CQlKfohfUP1vCEjdf3cdJ3hPgqQcPKH20mgEHIsuQMPmYeYnQV/gbtnDY iw== 
Received: from iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com
 (iadpaimrmta02.appoci.oracle.com [147.154.18.20])
 by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 3jxe3tqvhx-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 04 Oct 2022 21:04:56 +0000
Received: from pps.filterd
 (iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
 by iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com (8.17.1.5/8.17.1.5)
 with ESMTP id 294KpfnJ034000; Tue, 4 Oct 2022 21:04:54 GMT
Received: from ban25x6uut24.us.oracle.com (ban25x6uut24.us.oracle.com
 [10.153.73.24])
 by iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com (PPS) with ESMTP id
 3jxc04m4k9-1; Tue, 04 Oct 2022 21:04:54 +0000
From: Si-Wei Liu <si-wei.liu@oracle.com>
To: qemu-devel@nongnu.org
Cc: jasowang@redhat.com, eperezma@redhat.com
Subject: [PATCH] vhost-vdpa: fix assert
 !virtio_net_get_subqueue(nc)->async_tx.elem in virtio_net_reset
Date: Tue,  4 Oct 2022 12:59:23 -0700
Message-Id: <1664913563-3351-1-git-send-email-si-wei.liu@oracle.com>
X-Mailer: git-send-email 1.8.3.1
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.895,Hydra:6.0.528,FMLib:17.11.122.1
 definitions=2022-10-04_09,2022-09-29_03,2022-06-22_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 malwarescore=0
 phishscore=0 bulkscore=0
 suspectscore=0 mlxlogscore=999 mlxscore=0 spamscore=0 adultscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2209130000
 definitions=main-2210040136
X-Proofpoint-ORIG-GUID: v2eUgGNL4UonsiFtde6XPNq0CbncegRO
X-Proofpoint-GUID: v2eUgGNL4UonsiFtde6XPNq0CbncegRO
Received-SPF: pass client-ip=205.220.165.32;
 envelope-from=si-wei.liu@oracle.com; helo=mx0a-00069f02.pphosted.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_MED=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
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

The citing commit has incorrect code in vhost_vdpa_receive() that returns
zero instead of full packet size to the caller. This renders pending packets
unable to be freed so then get clogged in the tx queue forever. When device
is being reset later on, below assertion failure ensues:

0  0x00007f86d53bb387 in raise () from /lib64/libc.so.6
1  0x00007f86d53bca78 in abort () from /lib64/libc.so.6
2  0x00007f86d53b41a6 in __assert_fail_base () from /lib64/libc.so.6
3  0x00007f86d53b4252 in __assert_fail () from /lib64/libc.so.6
4  0x000055b8f6ff6fcc in virtio_net_reset (vdev=<optimized out>) at /usr/src/debug/qemu/hw/net/virtio-net.c:563
5  0x000055b8f7012fcf in virtio_reset (opaque=0x55b8faf881f0) at /usr/src/debug/qemu/hw/virtio/virtio.c:1993
6  0x000055b8f71f0086 in virtio_bus_reset (bus=bus@entry=0x55b8faf88178) at /usr/src/debug/qemu/hw/virtio/virtio-bus.c:102
7  0x000055b8f71f1620 in virtio_pci_reset (qdev=<optimized out>) at /usr/src/debug/qemu/hw/virtio/virtio-pci.c:1845
8  0x000055b8f6fafc6c in memory_region_write_accessor (mr=<optimized out>, addr=<optimized out>, value=<optimized out>,
   size=<optimized out>, shift=<optimized out>, mask=<optimized out>, attrs=...) at /usr/src/debug/qemu/memory.c:483
9  0x000055b8f6fadce9 in access_with_adjusted_size (addr=addr@entry=20, value=value@entry=0x7f867e7fb7e8, size=size@entry=1,
   access_size_min=<optimized out>, access_size_max=<optimized out>, access_fn=0x55b8f6fafc20 <memory_region_write_accessor>,
   mr=0x55b8faf80a50, attrs=...) at /usr/src/debug/qemu/memory.c:544
10 0x000055b8f6fb1d0b in memory_region_dispatch_write (mr=mr@entry=0x55b8faf80a50, addr=addr@entry=20, data=0, op=<optimized out>,
   attrs=attrs@entry=...) at /usr/src/debug/qemu/memory.c:1470
11 0x000055b8f6f62ada in flatview_write_continue (fv=fv@entry=0x7f86ac04cd20, addr=addr@entry=549755813908, attrs=...,
   attrs@entry=..., buf=buf@entry=0x7f86d0223028 <Address 0x7f86d0223028 out of bounds>, len=len@entry=1, addr1=20, l=1,
   mr=0x55b8faf80a50) at /usr/src/debug/qemu/exec.c:3266
12 0x000055b8f6f62c8f in flatview_write (fv=0x7f86ac04cd20, addr=549755813908, attrs=...,
   buf=0x7f86d0223028 <Address 0x7f86d0223028 out of bounds>, len=1) at /usr/src/debug/qemu/exec.c:3306
13 0x000055b8f6f674cb in address_space_write (as=<optimized out>, addr=<optimized out>, attrs=..., buf=<optimized out>,
   len=<optimized out>) at /usr/src/debug/qemu/exec.c:3396
14 0x000055b8f6f67575 in address_space_rw (as=<optimized out>, addr=<optimized out>, attrs=..., attrs@entry=...,
   buf=buf@entry=0x7f86d0223028 <Address 0x7f86d0223028 out of bounds>, len=<optimized out>, is_write=<optimized out>)
   at /usr/src/debug/qemu/exec.c:3406
15 0x000055b8f6fc1cc8 in kvm_cpu_exec (cpu=cpu@entry=0x55b8f9aa0e10) at /usr/src/debug/qemu/accel/kvm/kvm-all.c:2410
16 0x000055b8f6fa5f5e in qemu_kvm_cpu_thread_fn (arg=0x55b8f9aa0e10) at /usr/src/debug/qemu/cpus.c:1318
17 0x000055b8f7336e16 in qemu_thread_start (args=0x55b8f9ac8480) at /usr/src/debug/qemu/util/qemu-thread-posix.c:519
18 0x00007f86d575aea5 in start_thread () from /lib64/libpthread.so.0
19 0x00007f86d5483b2d in clone () from /lib64/libc.so.6

Make vhost_vdpa_receive() return the size passed in as is, so that the
caller qemu_deliver_packet_iov() would eventually propagate it back to
virtio_net_flush_tx() to release pending packets from the async_tx queue.
Which corresponds to the drop path where qemu_sendv_packet_async() returns
non-zero in virtio_net_flush_tx().

Fixes: 846a1e85da64 ("vdpa: Add dummy receive callback")
Cc: Eugenio Perez Martin <eperezma@redhat.com>
Signed-off-by: Si-Wei Liu <si-wei.liu@oracle.com>
---
 net/vhost-vdpa.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/net/vhost-vdpa.c b/net/vhost-vdpa.c
index 4bc3fd0..182b3a1 100644
--- a/net/vhost-vdpa.c
+++ b/net/vhost-vdpa.c
@@ -211,7 +211,7 @@ static bool vhost_vdpa_check_peer_type(NetClientState *nc, ObjectClass *oc,
 static ssize_t vhost_vdpa_receive(NetClientState *nc, const uint8_t *buf,
                                   size_t size)
 {
-    return 0;
+    return size;
 }
 
 static NetClientInfo net_vhost_vdpa_info = {
-- 
1.8.3.1


