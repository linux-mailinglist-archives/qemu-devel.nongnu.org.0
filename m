Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9CC8B34D586
	for <lists+qemu-devel@lfdr.de>; Mon, 29 Mar 2021 18:52:01 +0200 (CEST)
Received: from localhost ([::1]:43036 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lQv7Q-0008WS-Fa
	for lists+qemu-devel@lfdr.de; Mon, 29 Mar 2021 12:52:00 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54988)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bounces@canonical.com>)
 id 1lQv6N-00084u-CF
 for qemu-devel@nongnu.org; Mon, 29 Mar 2021 12:50:55 -0400
Received: from indium.canonical.com ([91.189.90.7]:47614)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bounces@canonical.com>)
 id 1lQv6L-0004uH-4o
 for qemu-devel@nongnu.org; Mon, 29 Mar 2021 12:50:55 -0400
Received: from loganberry.canonical.com ([91.189.90.37])
 by indium.canonical.com with esmtp (Exim 4.86_2 #2 (Debian))
 id 1lQv6J-0008DC-CS
 for <qemu-devel@nongnu.org>; Mon, 29 Mar 2021 16:50:51 +0000
Received: from loganberry.canonical.com (localhost [127.0.0.1])
 by loganberry.canonical.com (Postfix) with ESMTP id 5B7132E8164
 for <qemu-devel@nongnu.org>; Mon, 29 Mar 2021 16:50:51 +0000 (UTC)
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Date: Mon, 29 Mar 2021 16:41:04 -0000
From: John Snow <1639394@bugs.launchpad.net>
To: qemu-devel@nongnu.org
X-Launchpad-Notification-Type: bug
X-Launchpad-Bug: product=qemu; status=Expired; importance=Undecided;
 assignee=None; 
X-Launchpad-Bug-Information-Type: Public
X-Launchpad-Bug-Private: no
X-Launchpad-Bug-Security-Vulnerability: no
X-Launchpad-Bug-Commenters: janitor jnsnow madgemade-v xtrondo
X-Launchpad-Bug-Reporter: xtrondo (xtrondo)
X-Launchpad-Bug-Modifier: John Snow (jnsnow)
References: <20161105021624.30133.98019.malonedeb@wampee.canonical.com>
Message-Id: <161703606498.25953.5587257116226554708.malone@wampee.canonical.com>
Subject: [Bug 1639394] Re: Unable to boot Solaris 8/9 x86 under Fedora 24
X-Launchpad-Message-Rationale: Subscriber (QEMU) @qemu-devel-ml
X-Launchpad-Message-For: qemu-devel-ml
Precedence: bulk
X-Generated-By: Launchpad (canonical.com);
 Revision="21fefc602783aa4ba863a4a6c29d38d788ce04ad"; Instance="production"
X-Launchpad-Hash: 327f5366348c29c61562c11ebee6689220856c7d
Received-SPF: none client-ip=91.189.90.7; envelope-from=bounces@canonical.com;
 helo=indium.canonical.com
X-Spam_score_int: -65
X-Spam_score: -6.6
X-Spam_bar: ------
X-Spam_report: (-6.6 / 5.0 requ) BAYES_00=-1.9,
 HEADER_FROM_DIFFERENT_DOMAINS=0.25, RCVD_IN_DNSWL_HI=-5,
 RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
 SPF_NONE=0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Reply-To: Bug 1639394 <1639394@bugs.launchpad.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

I have to admit that my time budget for IDE is quite low, so I will be
unable to look into this.

If you'd like to help debug it further and you have the time, you can
try building QEMU 6.0 (RC0 or so, something quite modern) and enabling
the IDE tracing options and trying to boot Solaris as you have been
doing, The logs might help illustrate something obviously wrong.

You want to enable IDE traces (but exclude the ones that show the actual
IO data), so you need an events file that looks something like this;

ide_ioport_read
ide_ioport_write
ide_status_read
ide_ctrl_write
ide_exec_cmd
ide_cancel_dma_sync_buffered
ide_cancel_dma_sync_remaining
ide_sector_read
ide_sector_write
ide_reset
ide_bus_reset_aio
ide_dma_cb
cd_read_sector_sync
cd_read_sector_cb
cd_read_sector
ide_atapi_cmd_error
ide_atapi_cmd_reply_end
ide_atapi_cmd_reply_end_eot
ide_atapi_cmd_reply_end_bcl
ide_atapi_cmd_reply_end_new
ide_atapi_cmd_check_status
ide_atapi_cmd_read
ide_atapi_cmd
ide_atapi_cmd_read_dma_cb_aio

And use it using `--trace events=3Dide_events_file`. A full list of trace
events can be found here: https://gitlab.com/qemu-
project/qemu/-/blob/master/hw/ide/trace-events

If you can trigger it without `-hda`, it would be good to leave it off
to help minimize log reports for IDE devices unrelated to problem.

-- =

You received this bug notification because you are a member of qemu-
devel-ml, which is subscribed to QEMU.
https://bugs.launchpad.net/bugs/1639394

Title:
  Unable to boot Solaris 8/9 x86 under Fedora 24

Status in QEMU:
  Expired

Bug description:
  qemu-system-x86_64 -version
  QEMU emulator version 2.6.2 (qemu-2.6.2-4.fc24), Copyright (c) 2003-2008 =
Fabrice Bellard

  Try several ways without success, I think it was a regression because pro=
blem seems to be related with ide fixed on 0.6.0:
  - int13 CDROM BIOS fix (aka Solaris x86 install CD fix)
  - int15, ah=3D86 BIOS fix (aka Solaris x86 hardware probe hang up fix)

  Solaris 10/11 works without a problem, also booting with "scsi" will
  circumvent initial problem, but later found problems related with
  "scsi" cdrom boot and also will not found the "ide" disk device.

  =

  qemu-system-i386 -m 712 -drive file=3D/dev/Virtual_hdd/beryllium0,format=
=3Draw -cdrom /repo/Isos/sol-9_905_x86.iso

  SunOS Secondary Boot version 3.00

  prom_panic: Could not mount filesystem.
  Entering boot debugger:
  [136419]

  =

  Regards,
  \\CA,

To manage notifications about this bug go to:
https://bugs.launchpad.net/qemu/+bug/1639394/+subscriptions

