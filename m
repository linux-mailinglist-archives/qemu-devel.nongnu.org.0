Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 93BFD272506
	for <lists+qemu-devel@lfdr.de>; Mon, 21 Sep 2020 15:13:34 +0200 (CEST)
Received: from localhost ([::1]:58642 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kKLdN-0004cU-Mj
	for lists+qemu-devel@lfdr.de; Mon, 21 Sep 2020 09:13:33 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45828)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <s.reiter@proxmox.com>)
 id 1kKLb3-0002rg-4S
 for qemu-devel@nongnu.org; Mon, 21 Sep 2020 09:11:09 -0400
Received: from proxmox-new.maurer-it.com ([212.186.127.180]:4190)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <s.reiter@proxmox.com>)
 id 1kKLaz-00084j-Ec
 for qemu-devel@nongnu.org; Mon, 21 Sep 2020 09:11:08 -0400
Received: from proxmox-new.maurer-it.com (localhost.localdomain [127.0.0.1])
 by proxmox-new.maurer-it.com (Proxmox) with ESMTP id 9AB614547A;
 Mon, 21 Sep 2020 15:10:52 +0200 (CEST)
To: seabios@seabios.org, "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>
From: Stefan Reiter <s.reiter@proxmox.com>
Subject: Regression with latest SeaBIOS booting multi-disk root LVs?
Message-ID: <247d7ead-e426-abb5-07a1-0bd009253c37@proxmox.com>
Date: Mon, 21 Sep 2020 15:10:51 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.12.0
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=212.186.127.180;
 envelope-from=s.reiter@proxmox.com; helo=proxmox-new.maurer-it.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/09/21 09:10:54
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -41
X-Spam_score: -4.2
X-Spam_bar: ----
X-Spam_report: (-4.2 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_MED=-2.3,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Hi list,

since SeaBIOS 1.14.0 (QEMU 5.1) VMs with LVM root disks spanning more 
than one PV fail to boot, if only the first is set as bootable. I 
believe this is due to the changes in SeaBIOS only initializing drives 
marked as 'bootable' by QEMU.

One fix is to mark all disks containing root data as bootable, but 
existing setups will still break on upgrade (where only the disk 
containing the bootloader is marked). This is not ideal.

Discovered by a user in our bugtracker:
https://bugzilla.proxmox.com/show_bug.cgi?id=3011

and verified by installing Ubuntu 20.04 w/ LVM and GRUB on virtio-scsi, 
then expanding the LV to a second disk.

I found that just reverting SeaBIOS to 1.13.0 makes it work again, same 
guest install, even with QEMU 5.1.

Is this intended behaviour? A bug in GRUB? Any fix or workaround?

~ Stefan


