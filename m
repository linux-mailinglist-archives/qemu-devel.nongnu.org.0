Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9D1646C2F83
	for <lists+qemu-devel@lfdr.de>; Tue, 21 Mar 2023 11:50:55 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1peZYc-0005PT-4L; Tue, 21 Mar 2023 06:49:34 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ben.dooks@codethink.co.uk>)
 id 1peZYW-0005NR-CN
 for qemu-devel@nongnu.org; Tue, 21 Mar 2023 06:49:29 -0400
Received: from imap4.hz.codethink.co.uk ([188.40.203.114])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ben.dooks@codethink.co.uk>)
 id 1peZYU-00033O-DQ
 for qemu-devel@nongnu.org; Tue, 21 Mar 2023 06:49:27 -0400
Received: from [167.98.27.226] (helo=[10.35.5.186])
 by imap4.hz.codethink.co.uk with esmtpsa  (Exim 4.94.2 #2 (Debian))
 id 1peZYK-003j6N-MB; Tue, 21 Mar 2023 10:49:16 +0000
Message-ID: <e37a42ad-dcb9-05f1-7541-8fe861bfcc79@codethink.co.uk>
Date: Tue, 21 Mar 2023 10:49:15 +0000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Subject: Re: [PATCH v2] hw/net/can: Add mcp25625 model
Content-Language: en-GB
To: Pavel Pisa <pisa@cmp.felk.cvut.cz>
Cc: qemu-devel@nongnu.org, jasowang@redhat.com, fnu.vikram@xilinx.com,
 nazar.kazakov@codethink.co.uk, lawrence.hunter@codethink.co.uk,
 frank.chang@sifive.com, paul.walmsley@sifive.com,
 Ben Dooks <ben.dooks@sifive.com>
References: <20230316124113.148463-1-ben.dooks@codethink.co.uk>
 <202303171511.00937.pisa@cmp.felk.cvut.cz>
From: Ben Dooks <ben.dooks@codethink.co.uk>
Organization: Codethink Limited.
In-Reply-To: <202303171511.00937.pisa@cmp.felk.cvut.cz>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=188.40.203.114;
 envelope-from=ben.dooks@codethink.co.uk; helo=imap4.hz.codethink.co.uk
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-0.001,
 SPF_HELO_PASS=-0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

On 17/03/2023 14:11, Pavel Pisa wrote:
> Hello Ben,
> 
> thanks for update.
> 
> On Thursday 16 of March 2023 13:41:13 Ben Dooks wrote:
>> From: Ben Dooks <ben.dooks@sifive.com>
>>
>> Add support for Microchip MCP25625 SPI based CAN controller which is
>> very similar to the MCP2515 (and covered by the same Linux driver).
>>
>> This can be added to any machine with SPI support in the machine
>> model file.
>>
>> Example for using this when configured into a machine:
>>
>> 	-object can-bus,id=canbus0 \
>> 	-object can-host-socketcan,id=canhost0,if=vcan0,canbus=canbus0 \
>> 	-global driver=mcp25625,property=canbus,value=canbus0
>>
>> There is tracing support with --trace "*mcp25*"
> 
> Code looks good, I have patched actual QEMU sources and build
> it successfully with your change.
> 
> I have not seen any warning.
> 
> I would like to test the mcp25625 CAN functionality.
> 
> I would prefer against some target which is already available
> in QEMU and Linux kernel mainlines, so if somebody can suggest
> some ARM which can connect SPI/SSI device it would be great.
> 
> I have setup /srv/nfs/debian-riscv64 chroot and used
> it to prepare minimal 3 MB ramdisk.cpio with busybox
> and full GLIBC and ip package.
> 
> I can run it with Debian provided RISC-V kernel
> under QEMU compiled with your mcp25625 chip emulation
> 
> qemu-system-riscv64 -m 1G -M sifive_u -smp 2 \
>        -initrd ramdisk.cpio \
>        -kernel vmlinux-6.1.0-6-riscv64 \
>        -nographic \
>        -object can-bus,id=canbus0 \
>        -object can-host-socketcan,id=canhost0,if=can0,canbus=canbus0 \
>        -global driver=mcp25625,property=canbus,value=canbus0
> 
> I can see
> 
> /sys/bus/platform/devices/10040000.spi
> /sys/bus/platform/devices/10050000.spi
> 
> I can run
> 
>    modprobe spi-sifive.ko
> 
> [   41.524160] sifive_spi 10040000.spi: mapped; irq=21, cs=1
> [   41.529305] sifive_spi 10050000.spi: mapped; irq=22, cs=1
> 
>    modprobe mcp251x.ko
> 
> I can imagine to build device tree overlay and setup it from within
> kernel if the device is already mapped
> 
>    cd /sys/kernel/config/device-tree/overlays
>    [ -d  sifive_u-mcp25625 ] && rmdir sifive_u-mcp25625
>    mkdir sifive_u-mcp25625
>    cd sifive_u-mcp25625
>    cat sifive_u-mcp25625.dtbo >dtbo
>    echo 1 >status
> 
> which is what we do with CTU CAN FD ip on Zynq system
> to run PL/FPGA update.
> 
> But from QEMU info qtree, I see that device is not mapped in QEMU...
> Which is logic...
> 
> So please, can you send instruction how to proceed forward.
> 
> Do you have DTB prepared for testing or something similar?
> 
> In a longer term perspective, it would be ideal to provide
> some update for documentation, how to use mcp25625 emulation
> 
>    https://www.qemu.org/docs/master/system/devices/can.html
> 
> By the way, if the Raspberry Pi emulation does not provide
> right SPI emulation as you have noticed, what about BeagleBoneBlack?

At the moment it seems that the as a whole qemu doesn't have a good
way of adding a generic spi device to a bus.

> Does it support SPI? It could be good target to test that mcp25625
> chip emulation is portable..

I've pushed our test branch out to:
https://gitlab.com/CodethinkLabs/qemu/-/commits/mcp25625_test

That adds an spi channel to the sifive_u machine and puts the
right dtb entry in there.

-- 
Ben Dooks				http://www.codethink.co.uk/
Senior Engineer				Codethink - Providing Genius

https://www.codethink.co.uk/privacy.html


