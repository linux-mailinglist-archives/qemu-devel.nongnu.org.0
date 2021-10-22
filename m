Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A5086438078
	for <lists+qemu-devel@lfdr.de>; Sat, 23 Oct 2021 01:10:21 +0200 (CEST)
Received: from localhost ([::1]:39532 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1me3g4-0002eY-Aa
	for lists+qemu-devel@lfdr.de; Fri, 22 Oct 2021 19:10:20 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50046)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <glaubitz@zedat.fu-berlin.de>)
 id 1me3el-0001yb-5w
 for qemu-devel@nongnu.org; Fri, 22 Oct 2021 19:09:00 -0400
Received: from outpost1.zedat.fu-berlin.de ([130.133.4.66]:59453)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <glaubitz@zedat.fu-berlin.de>)
 id 1me3ei-0002pl-Pn
 for qemu-devel@nongnu.org; Fri, 22 Oct 2021 19:08:58 -0400
Received: from inpost2.zedat.fu-berlin.de ([130.133.4.69])
 by outpost.zedat.fu-berlin.de (Exim 4.94) with esmtps (TLS1.2)
 tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
 (envelope-from <glaubitz@zedat.fu-berlin.de>)
 id 1me3ef-0017Ym-Qz; Sat, 23 Oct 2021 01:08:53 +0200
Received: from p57bd9015.dip0.t-ipconnect.de ([87.189.144.21]
 helo=[192.168.178.81]) by inpost2.zedat.fu-berlin.de (Exim 4.94)
 with esmtpsa (TLS1.2) tls TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256
 (envelope-from <glaubitz@physik.fu-berlin.de>)
 id 1me3ef-0009wh-K4; Sat, 23 Oct 2021 01:08:53 +0200
Message-ID: <3f483f63-9e68-b1da-01ab-a1e05dcf45aa@physik.fu-berlin.de>
Date: Sat, 23 Oct 2021 01:08:53 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.2.0
Subject: Re: Looking for advise on debugging a non-boot kernel on
 qemu-system-sh4
Content-Language: en-US
From: John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>
To: BALATON Zoltan <balaton@eik.bme.hu>
References: <4882e4cc-6754-1c8a-a8ae-a2ceeca115fb@physik.fu-berlin.de>
 <e11d3ee1-2a25-7633-babd-d45f36b04c5b@eik.bme.hu>
 <013d782d-0d7c-8204-cab2-08102a7d80f4@physik.fu-berlin.de>
 <3c524162-e83-a9b3-1e28-2aa28dbefa76@eik.bme.hu>
 <f0933be1-75ee-b053-1f53-f96258d41163@physik.fu-berlin.de>
 <d2553511-b83c-d4f1-5a88-b661bc97eb@eik.bme.hu>
 <9189dbe7-cf92-19c7-dee5-b707262964d1@physik.fu-berlin.de>
In-Reply-To: <9189dbe7-cf92-19c7-dee5-b707262964d1@physik.fu-berlin.de>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Original-Sender: glaubitz@physik.fu-berlin.de
X-Originating-IP: 87.189.144.21
Received-SPF: pass client-ip=130.133.4.66;
 envelope-from=glaubitz@zedat.fu-berlin.de; helo=outpost1.zedat.fu-berlin.de
X-Spam_score_int: -58
X-Spam_score: -5.9
X-Spam_bar: -----
X-Spam_report: (-5.9 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-1.742,
 RCVD_IN_DNSWL_MED=-2.3, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Hi Zoltan!

On 10/22/21 23:49, John Paul Adrian Glaubitz wrote:
>> How did you compile the kernel that does not boot? What config have you used?
> 
> The config is constructed from the Debian kernel configuration tree. I have uploaded
> the resulting config file here:
> 
>> https://people.debian.org/~glaubitz/config-5.14.0-3-sh7751r.gz
> 
>> I've tried to reproduce it by compiling a kernel with rts7751r2d1_defconfig and different
>> compression methods but it did start and never got the problem seen with your kernel.
> 
> Oh, that's very interesting. How big were the kernel images you got? My suspicion was
> that the current Debian kernel might be too much.

I can confirm that the default config works for me, too. Both with gcc-8 and gcc-11.

Using that kernel, however, I cannot use the debian-installer initrd.gz, even with
CONFIG_BLK_DEV_INITRD enabled in the kernel configuration.

The kernel prints a message saying that the initramfs is uncompressed, but whatever I
do I cannot get it to mount the initramfs. All I get is this:

[    0.096000] Trying to unpack rootfs image as initramfs...

and then later:

[    0.480000] ---[ end trace 46a3adcb34136251 ]---
[    0.480000] Kernel panic - not syncing: Attempted to kill init! exitcode=0x0000000b
[    0.480000] ---[ end Kernel panic - not syncing: Attempted to kill init! exitcode=0x0000000b ]---

Adrian

-- 
 .''`.  John Paul Adrian Glaubitz
: :' :  Debian Developer - glaubitz@debian.org
`. `'   Freie Universitaet Berlin - glaubitz@physik.fu-berlin.de
  `-    GPG: 62FF 8A75 84E0 2956 9546  0006 7426 3B37 F5B5 F913


