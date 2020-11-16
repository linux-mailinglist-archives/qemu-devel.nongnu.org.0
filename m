Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 274152B505C
	for <lists+qemu-devel@lfdr.de>; Mon, 16 Nov 2020 19:56:51 +0100 (CET)
Received: from localhost ([::1]:57132 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kejgI-00066v-4v
	for lists+qemu-devel@lfdr.de; Mon, 16 Nov 2020 13:56:50 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:39846)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <hare@suse.de>) id 1kejQr-0003rX-KN
 for qemu-devel@nongnu.org; Mon, 16 Nov 2020 13:40:53 -0500
Received: from mx2.suse.de ([195.135.220.15]:45326)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <hare@suse.de>) id 1kejQo-0000lD-OC
 for qemu-devel@nongnu.org; Mon, 16 Nov 2020 13:40:53 -0500
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 3C385AC98;
 Mon, 16 Nov 2020 18:40:49 +0000 (UTC)
From: Hannes Reinecke <hare@suse.de>
To: Paolo Bonzini <pbonzini@redhat.com>
Subject: [PATCH 0/7] scsi: scsi-disk corrupts data
Date: Mon, 16 Nov 2020 19:40:34 +0100
Message-Id: <20201116184041.60465-1-hare@suse.de>
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

a customer of ours reported repeated data corruption in the guest following a command abort.
After lengthy debugging we found that scsi-disk (and scsi-generic, for that matter) ignores
the host_status field from SG_IO once a command is aborted. If the command is aborted, SG_IO
will return with a SCSI status 'GOOD', and host_status 'DID_TIME_OUT'. scsi-disk will now
ignore the DID_TIME_OUT setting, and just report the SCSI status back to the guest.
The guest will then assume everything is okay and not retry the command, leading to the data
corruption.

This patchset moves the (linux only) SG_ERR host_status codes to generic code as SCSI_HOST
values, and adds a host_status field to SCSIRequest. With that some drivers like virtio_scsi
can interpret the host_status code and map it onto it driver-specific status.
This status is then visible to the guest, which then is able to take appropriate action.

As usual, comments and reviews are welcome.

Hannes Reinecke (6):
  scsi-disk: Add sg_io callback to evaluate status
  scsi: drop 'result' argument from command_complete callback
  scsi: Rename linux-specific SG_ERR codes to generic SCSI_HOST error
    codes
  scsi: Add mapping for generic SCSI_HOST status to sense codes
  scsi: split sg_io_sense_from_errno() in two functions
  scsi: move host_status handling into SCSI drivers

Paolo Bonzini (1):
  scsi-disk: convert more errno values back to SCSI statuses

 hw/scsi/esp-pci.c      |   5 +--
 hw/scsi/esp.c          |  17 +++++--
 hw/scsi/lsi53c895a.c   |  17 +++++--
 hw/scsi/megasas.c      |  15 +++++--
 hw/scsi/mptsas.c       |  14 +++++-
 hw/scsi/scsi-bus.c     |   2 +-
 hw/scsi/scsi-disk.c    |  75 ++++++++++++++++++++-----------
 hw/scsi/scsi-generic.c |  21 ++++++---
 hw/scsi/spapr_vscsi.c  |  20 ++++++---
 hw/scsi/virtio-scsi.c  |  44 ++++++++++++++++--
 hw/scsi/vmw_pvscsi.c   |  29 +++++++++++-
 hw/usb/dev-storage.c   |   6 +--
 hw/usb/dev-uas.c       |   7 ++-
 include/hw/scsi/esp.h  |   2 +-
 include/hw/scsi/scsi.h |   5 ++-
 include/scsi/utils.h   |  29 +++++++-----
 scsi/qemu-pr-helper.c  |  14 ++++--
 scsi/utils.c           | 119 ++++++++++++++++++++++++++++++++++++-------------
 18 files changed, 328 insertions(+), 113 deletions(-)

-- 
2.16.4


