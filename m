Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A323747F489
	for <lists+qemu-devel@lfdr.de>; Sat, 25 Dec 2021 22:55:07 +0100 (CET)
Received: from localhost ([::1]:34490 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n1F0M-00076F-8Q
	for lists+qemu-devel@lfdr.de; Sat, 25 Dec 2021 16:55:06 -0500
Received: from eggs.gnu.org ([209.51.188.92]:60122)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <balaton@eik.bme.hu>)
 id 1n1Eyi-0005pE-9w; Sat, 25 Dec 2021 16:53:24 -0500
Received: from zero.eik.bme.hu ([152.66.115.2]:52412)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <balaton@eik.bme.hu>)
 id 1n1Eyf-0006wT-QX; Sat, 25 Dec 2021 16:53:23 -0500
Received: from zero.eik.bme.hu (blah.eik.bme.hu [152.66.115.182])
 by localhost (Postfix) with SMTP id 76411746353;
 Sat, 25 Dec 2021 22:53:16 +0100 (CET)
Received: by zero.eik.bme.hu (Postfix, from userid 432)
 id 4C7CA746333; Sat, 25 Dec 2021 22:53:16 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
 by zero.eik.bme.hu (Postfix) with ESMTP id 4A4387462D3;
 Sat, 25 Dec 2021 22:53:16 +0100 (CET)
Date: Sat, 25 Dec 2021 22:53:16 +0100 (CET)
From: BALATON Zoltan <balaton@eik.bme.hu>
To: "mario@locati.it" <mario@locati.it>
Subject: Re: [PATCH] target/ppc: Fix e6500 boot
In-Reply-To: <R4OPHT$7F12C66D1107397991E0E4C978FE6AF1@locati.it>
Message-ID: <a17ceb16-bce5-2090-8473-78b316bf5fb5@eik.bme.hu>
References: =?iso-8859-1?q?=3C20211213133542=2E2608540=2D1=2Dfarosas=40linux=2Eib?=
 =?iso-8859-1?q?m=2Ecom=3E_=3C724f7563=2Df36c=2D2c37=2D3b94=2D951c3d92?=
 =?iso-8859-1?q?2861=40eik=2Ebme=2Ehu=3E?=
 <R4OPHT$7F12C66D1107397991E0E4C978FE6AF1@locati.it>
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="3866299591-66115725-1640469196=:11478"
X-Spam-Probability: 9%
Received-SPF: pass client-ip=152.66.115.2; envelope-from=balaton@eik.bme.hu;
 helo=zero.eik.bme.hu
X-Spam_score_int: -41
X-Spam_score: -4.2
X-Spam_bar: ----
X-Spam_report: (-4.2 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_MED=-2.3,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: clg@kaod.org, danielhb413@gmail.com, qemu-ppc@nongnu.org,
 qemu-devel@nongnu.org, farosas@linux.ibm.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

  This message is in MIME format.  The first part should be readable text,
  while the remaining parts are likely unreadable without MIME-aware tools.

--3866299591-66115725-1640469196=:11478
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8BIT

On Sat, 25 Dec 2021, mario@locati.it wrote:
> I have tried to launch a freshly compiled qemu from git master on a NXP 
> T2080RDB devkit that has a e6500 CPU in combination with a freshly 
> compiled kernel 5.16-rc6
> I have Debian SID ppc64 up and running using such a kernel, and when I 
> launch qemu to run a VM with the same debian sid for ppc64 and the same 
> kernel using --enable-kvm I end up with a kernel panic
>
>
> [....]
> Run /sbin/init as init process
> random: fast init done
> systemd[1]: illegal instruction (4) at 3fff96562ac8 nip 3fff96562ac8 lr 3fff96562aa8 code 1 in libc-2.32.so[3fff96516000+1f7000]
> systemd[1]: code: 60000000 38600006 9122b7e8 4801bead 60000000 60000000 8122b7e8 2c090004 
> systemd[1]: code: 40820014 39200005 60000000 9122b7e8 <00000000> 60000000 8122b7e8 2c090005 

Looks like it trips on a 0 opcode here in the middle of other values that 
look like valid code so I wonder how that 0 got there? Did something 
overwrite it before it tried to execute it? If it always happens on the 
same address maybe you could try attaching gdb and put a watch point on 
that address to see what writes there, otherwise I don't know how to debug 
this.

Regards,
BALATON Zoltan

> Kernel panic - not syncing: Attempted to kill init! exitcode=0x00000004
> Rebooting in 180 seconds..
>
>
> On the positive side, for the first time I am not flooded by milions 
> kernel error messages from the serial console attached to the devkit, 
> not a single error spitted out from it, great!
>
>
> The kernel config file I used
> https://repo.powerprogress.org/t2080rdb/qemu/kernel_5.16-rc6.config
>
>
> The resulting kernel
> https://repo.powerprogress.org/t2080rdb/qemu/uImage_5.16-rc6
>
>
> The complete console output I get when configuring qemu before compilation
> https://repo.powerprogress.org/t2080rdb/qemu/2021-12-25_qemu_git_configure_on_ppc64.txt
>
>
> The complete console output that end up with the kernel panic when launching qemu
> https://repo.powerprogress.org/t2080rdb/qemu/2021-12-25_qemu_ppc64_e6500_kvm_debian_sid_log.txt
 
--3866299591-66115725-1640469196=:11478--

