Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6184D2B5084
	for <lists+qemu-devel@lfdr.de>; Mon, 16 Nov 2020 20:06:06 +0100 (CET)
Received: from localhost ([::1]:51780 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kejpF-0007Sy-Fg
	for lists+qemu-devel@lfdr.de; Mon, 16 Nov 2020 14:06:05 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:37532)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <hare@suse.de>) id 1kejHc-0003SG-QX
 for qemu-devel@nongnu.org; Mon, 16 Nov 2020 13:31:20 -0500
Received: from mx2.suse.de ([195.135.220.15]:34658)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <hare@suse.de>) id 1kejHa-0006BG-IX
 for qemu-devel@nongnu.org; Mon, 16 Nov 2020 13:31:20 -0500
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id D30C4AC98;
 Mon, 16 Nov 2020 18:31:15 +0000 (UTC)
From: Hannes Reinecke <hare@suse.de>
To: Paolo Bonzini <pbonzini@redhat.com>
Subject: [PATCH 0/3] scsi: infinite guest hangs with scsi-disk
Date: Mon, 16 Nov 2020 19:31:11 +0100
Message-Id: <20201116183114.55703-1-hare@suse.de>
X-Mailer: git-send-email 2.16.4
Received-SPF: pass client-ip=195.135.220.15; envelope-from=hare@suse.de;
 helo=mx2.suse.de
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/11/16 12:53:11
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x (no timestamps) [generic]
X-Spam_score_int: -41
X-Spam_score: -4.2
X-Spam_bar: ----
X-Spam_report: (-4.2 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_MED=-2.3,
 RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: qemu-devel@nongnu.org, Hannes Reinecke <hare@suse.de>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Hi all,

one of our customers reported an infinite guest hang following an FC link loss  when using scsi-disk.
Problem is that scsi-disk issues SG_IO command with a timeout of UINT_MAX, which essentially signals
'no timeout' to the host kernel. So if the command gets lost eg during an unexpected link loss the
HBA driver will never attempt to abort or return the command. Hence the guest will hang forever, and
the only way to resolve things is to reboot the host.

To solve it this patchset adds an 'io_timeout' parameter to scsi-disk and scsi-generic, which allows
the admin to specify a command timeout for SG_IO request. It is initialized to 30 seconds to avoid the
infinite hang as mentioned above.

As usual, comments and reviews are welcome.

Hannes Reinecke (3):
  virtio-scsi: trace events
  scsi: make io_timeout configurable
  scsi: add tracing for SG_IO commands

 hw/scsi/scsi-disk.c    |  9 ++++++---
 hw/scsi/scsi-generic.c | 25 ++++++++++++++++++-------
 hw/scsi/trace-events   | 13 +++++++++++++
 hw/scsi/virtio-scsi.c  | 30 +++++++++++++++++++++++++++++-
 include/hw/scsi/scsi.h |  4 +++-
 5 files changed, 69 insertions(+), 12 deletions(-)

-- 
2.16.4


