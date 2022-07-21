Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 65C5B57CAF6
	for <lists+qemu-devel@lfdr.de>; Thu, 21 Jul 2022 14:56:29 +0200 (CEST)
Received: from localhost ([::1]:49288 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oEVj9-0001aY-QG
	for lists+qemu-devel@lfdr.de; Thu, 21 Jul 2022 08:56:27 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39768)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <f.ebner@proxmox.com>)
 id 1oEVcU-0002H1-TX
 for qemu-devel@nongnu.org; Thu, 21 Jul 2022 08:49:34 -0400
Received: from proxmox-new.maurer-it.com ([94.136.29.106]:10242)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <f.ebner@proxmox.com>)
 id 1oEVcO-0000VX-Or
 for qemu-devel@nongnu.org; Thu, 21 Jul 2022 08:49:34 -0400
Received: from proxmox-new.maurer-it.com (localhost.localdomain [127.0.0.1])
 by proxmox-new.maurer-it.com (Proxmox) with ESMTP id 45A2040569;
 Thu, 21 Jul 2022 14:49:15 +0200 (CEST)
Message-ID: <eb0e0c7e-5b6f-a573-43f6-bd58be243d6b@proxmox.com>
Date: Thu, 21 Jul 2022 14:49:14 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Content-Language: en-US
From: Fabian Ebner <f.ebner@proxmox.com>
To: kvm@vger.kernel.org, qemu-devel@nongnu.org
Cc: Thomas Lamprecht <t.lamprecht@proxmox.com>,
 Mira Limbeck <m.limbeck@proxmox.com>
Subject: Guest reboot issues since QEMU 6.0 and Linux 5.11
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=94.136.29.106; envelope-from=f.ebner@proxmox.com;
 helo=proxmox-new.maurer-it.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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

Hi,
since about half a year ago, we're getting user reports about guest
reboot issues with KVM/QEMU[0].

The most common scenario is a Windows Server VM (2012R2/2016/2019,
UEFI/OVMF and SeaBIOS) getting stuck during the screen with the Windows
logo and the spinning circles after a reboot was triggered from within
the guest. Quitting the kvm process and booting with a fresh instance
works. The issue seems to become more likely, the longer the kvm
instance runs.

We did not get such reports while we were providing Linux 5.4 and QEMU
5.2.0, but we do with Linux 5.11/5.13/5.15 and QEMU 6.x.

I'm just wondering if anybody has seen this issue before or might have a
hunch what it's about? Any tips on what to look out for when debugging
are also greatly appreciated!

We do have debug access to a user's test VM and the VM state was saved
before a problematic reboot, but I can't modify the host system there.
AFAICT QEMU just executes guest code as usual, but I'm really not sure
what to look out for.

That VM has CPU type host, and a colleague did have a similar enough CPU
to load the VM state, but for him, the reboot went through normally. On
the user's system, it triggers consistently after loading the VM state
and rebooting.

So unfortunately, we didn't manage to reproduce the issue locally yet.
With two other images provided by users, we ran into a boot loop, where
QEMU resets the CPUs and does a few KVM_RUNs before the exit reason is
KVM_EXIT_SHUTDOWN (which to my understanding indicates a triple fault)
and then it repeats. It's not clear if the issues are related.

There are also a few reports about non-Windows VMs, mostly Ubuntu 20.04
with UEFI/OVMF, but again, it's not clear if the issues are related.

[0]: https://forum.proxmox.com/threads/100744/
(the forum thread is a bit chaotic unfortunately).

Best Regards,
Fabi


