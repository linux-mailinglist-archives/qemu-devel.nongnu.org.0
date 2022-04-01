Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4DBF34EEC4B
	for <lists+qemu-devel@lfdr.de>; Fri,  1 Apr 2022 13:23:47 +0200 (CEST)
Received: from localhost ([::1]:56612 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1naFNa-00026Y-8O
	for lists+qemu-devel@lfdr.de; Fri, 01 Apr 2022 07:23:46 -0400
Received: from eggs.gnu.org ([209.51.188.92]:52180)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <qiudayu@archeros.com>)
 id 1naFLd-0000fl-UB
 for qemu-devel@nongnu.org; Fri, 01 Apr 2022 07:21:45 -0400
Received: from smtpbg138.qq.com ([106.55.201.18]:54957 helo=smtpbg.qq.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <qiudayu@archeros.com>)
 id 1naFLa-0002RA-37
 for qemu-devel@nongnu.org; Fri, 01 Apr 2022 07:21:45 -0400
X-QQ-mid: bizesmtp66t1648811181t37436rj
Received: from localhost.localdomain.localdoma ( [116.228.45.98])
 by bizesmtp.qq.com (ESMTP) with 
 id ; Fri, 01 Apr 2022 19:06:19 +0800 (CST)
X-QQ-SSF: 01000000002000803000C00A0000000
X-QQ-FEAT: vc/Y9GOdlvZh7ImNT8PWrLQ4Xiaqb1CU+kjmhfgU7RBijBZNJduFy4Rmj4hmU
 vOMwqfkctCEidH6Kw+XbTxf99CkjK6v8OG9FcfgiFEA130vkU5N51cPnUulHlSLbGufWq8X
 eLO9G9GOAOq4ClFx5N3X/f7slp+/P81xmttnBX4z9Z3VMWOdCZFKZ3iUZUsinBL/TNl+LnB
 l4ZBfmmGOSCs8UgZnnGasHUlDdW61+XXTDZ8cHDexAGfg01WNtmSaybfqrGqQDRMEPgLRBM
 9z/+y04AQFLwpJDo8zYAc07lRqHgB6WQgMltforpGaBOn3yn2lYDYbYWGXGNPg/MK2qWArq
 wItuxMCrAc+FADJbTg=
X-QQ-GoodBg: 0
From: Michael Qiu <qiudayu@archeros.com>
To: jasowang@redhat.com,
	mst@redhat.com,
	si-wei.liu@oracle.com
Subject: [PATCH 0/3] Refactor vhost device reset 
Date: Fri,  1 Apr 2022 07:06:10 -0400
Message-Id: <1648811173-15293-1-git-send-email-qiudayu@archeros.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1648776683-23739-1-git-send-email-qiudayu@archeros.com>
References: <1648776683-23739-1-git-send-email-qiudayu@archeros.com>
X-QQ-SENDSIZE: 520
Feedback-ID: bizesmtp:archeros.com:qybgspam:qybgspam10
Received-SPF: none client-ip=106.55.201.18; envelope-from=qiudayu@archeros.com;
 helo=smtpbg.qq.com
X-Spam_score_int: -16
X-Spam_score: -1.7
X-Spam_bar: -
X-Spam_report: (-1.7 / 5.0 requ) BAYES_00=-1.9, KHOP_HELO_FCRDNS=0.187,
 SPF_HELO_NONE=0.001, SPF_NONE=0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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
Cc: Michael Qiu <qiudayu@archeros.com>, eperezma@redhat.com,
 lingshan.zhu@intel.com, qemu-devel@nongnu.org, lulu@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Now adays, vhost framework does a misnamed for
vhost_reset_device(), actually we need seperate vhost_reset_device()
and vhost_reset_owner(), this patchset refactor it, and make different
backend call the right function.

Base on those work, fix an issue of vdpa device reset for several times.

Test with kernel vhost, vhost-vdpa, DPDK vhost-user(vdpa), with shutdown
,reboot, and load/unload virtio_net driver in guest.

Michael Qiu (3):
  vhost: Refactor vhost_reset_device() in VhostOps
  vhost: add vhost_dev_reset()
  vdpa: reset the backend device in the end of vhost_net_stop()

 hw/net/vhost_net.c                | 22 +++++++++++++++++++---
 hw/scsi/vhost-user-scsi.c         |  6 +++++-
 hw/virtio/vhost-backend.c         |  4 ++--
 hw/virtio/vhost-user.c            | 22 ++++++++++++++++++----
 hw/virtio/vhost-vdpa.c            | 15 +++++++++------
 hw/virtio/vhost.c                 | 14 ++++++++++++++
 include/hw/virtio/vhost-backend.h |  2 ++
 include/hw/virtio/vhost.h         |  1 +
 8 files changed, 70 insertions(+), 16 deletions(-)

-- 
1.8.3.1



