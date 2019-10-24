Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0C688E2C60
	for <lists+qemu-devel@lfdr.de>; Thu, 24 Oct 2019 10:42:17 +0200 (CEST)
Received: from localhost ([::1]:35174 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1iNYhD-0002qx-QS
	for lists+qemu-devel@lfdr.de; Thu, 24 Oct 2019 04:42:15 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38202)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <geoff@hostfission.com>) id 1iNYT2-0005rY-UM
 for qemu-devel@nongnu.org; Thu, 24 Oct 2019 04:27:37 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <geoff@hostfission.com>) id 1iNYT1-0005ym-NQ
 for qemu-devel@nongnu.org; Thu, 24 Oct 2019 04:27:36 -0400
Received: from mail1.hostfission.com ([139.99.139.48]:42304)
 by eggs.gnu.org with esmtp (Exim 4.71)
 (envelope-from <geoff@hostfission.com>) id 1iNYT1-0005vi-8U
 for qemu-devel@nongnu.org; Thu, 24 Oct 2019 04:27:35 -0400
Received: from www1.hostfission.com (www1.hostfission.com [139.99.139.52])
 by mail1.hostfission.com (Postfix) with ESMTP id B1E454B1C6
 for <qemu-devel@nongnu.org>; Thu, 24 Oct 2019 19:27:30 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=hostfission.com;
 s=mail; t=1571905650;
 bh=ZTWoNAyoj+LRfyESILCPsnKEcO+G4UtO+7ZM7W/R8x8=;
 h=To:Subject:Date:From:From;
 b=ErSbiHaULIv7gbrQW96G1PJohnC150wUL2B3aLSmXc4B8BSrV4tcz0Kx+tY9MmcVw
 AxL2Z+Ad687GQMjKUv/Bb6pLg/EgipQfwXJvx8Pwy4ZGilMOvtgV9VqOAUbz4BJvtL
 Hc8s9D91BHRlv/9O/VvbeasXYlbweUkK+IJnQ7do=
Received: by www1.hostfission.com (Postfix, from userid 1000)
 id AAFA583F42; Thu, 24 Oct 2019 19:27:30 +1100 (AEDT)
To: qemu-devel@nongnu.org
Subject: Adding a memory alias breaks v-rings
X-PHP-Originating-Script: 0:rcube.php
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII;
 format=flowed
Content-Transfer-Encoding: 7bit
Date: Thu, 24 Oct 2019 19:27:30 +1100
From: geoff@hostfission.com
Message-ID: <19efadd24a38e4e877459404ff12ac20@hostfission.com>
X-Sender: geoff@hostfission.com
User-Agent: Roundcube Webmail/1.2.3
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
 [fuzzy]
X-Received-From: 139.99.139.48
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

Hi All,

I have been working on adding a feature as a proof of concept to improve 
the performance of applications like Looking Glass by avoiding 
additional memory copies. My goal is to alias part of the IVSHMEM shared 
memory over a pointer provided by the guest OS capture API (DXGI Desktop 
Duplication or NVIDIA Frame Buffer Capture). I have managed to get this 
working by adding a few additional configuration registers to the 
IVSHMEM device and enhanced the IVSHMEM windows driver with suitable 
IOCTLs to set this all up. While this concept is backwards it needs to 
work this way as we do not have control over the destination buffer 
allocation by the GPU driver.

This all works, however, it has exposed a bug (or I am doing things 
improperly) with the way that vhost tracks memory. When calling 
memory_region_add_subregion_overlap the memory listener in vhost fires 
triggering vhost_region_add_section. According to the comments this code 
depends on being called in memory address order, but because I am adding 
the alias region late, it's out of order, and also splits the upper 
memory region. This has the effect of corrupting/breaking one or more 
random vrings, as evidenced by the crash/hang of vhost-net or other 
virtio devices. The following and errors are also logged regarding 
section alignment:

qemu-system-x86_64: vhost_region_add_section:Section rounded to 
3c0000000 prior to previous 3fc4f9000
qemu-system-x86_64: vhost_region_add_section:Section rounded to 
3c0000000 prior to previous 3fc4f9000

Here is the flat view after the alias has been added.

   0000000100000000-00000003fc4f8fff (prio 0, ram): mem @0000000080000000 
kvm
   00000003fc4f9000-00000003fc4f9fff (prio 1, ram): ivshmem kvm
   00000003fc4fa000-000000043fffffff (prio 0, ram): mem @000000037c4fa000 
kvm

When the guest doesn't crash out due to the obvious corruption it is 
possible to verify that the alias is in the right place and fully 
functional. Unfortunately, I simply do not have enough of a grasp on 
vhost to understand exactly what is going on and how to correct it.

Getting this feature working is highly desirable as it should be 
possible to obtain GPU -> GPU memory transfers between guests without 
requiring workstation/professional graphics cards.

Kind Regards,
Geoffrey McRae

