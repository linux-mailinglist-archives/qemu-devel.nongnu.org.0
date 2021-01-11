Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2C5672F205F
	for <lists+qemu-devel@lfdr.de>; Mon, 11 Jan 2021 21:06:34 +0100 (CET)
Received: from localhost ([::1]:54216 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kz3SS-000881-Ss
	for lists+qemu-devel@lfdr.de; Mon, 11 Jan 2021 15:06:32 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:60970)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <balaton@eik.bme.hu>)
 id 1kz3Qv-0007Zn-Pk
 for qemu-devel@nongnu.org; Mon, 11 Jan 2021 15:04:57 -0500
Received: from zero.eik.bme.hu ([152.66.115.2]:56342)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <balaton@eik.bme.hu>)
 id 1kz3Qs-0006P7-Bh
 for qemu-devel@nongnu.org; Mon, 11 Jan 2021 15:04:56 -0500
Received: from zero.eik.bme.hu (blah.eik.bme.hu [152.66.115.182])
 by localhost (Postfix) with SMTP id 56DCA7470DD;
 Mon, 11 Jan 2021 21:04:51 +0100 (CET)
Received: by zero.eik.bme.hu (Postfix, from userid 432)
 id 0EF24746552; Mon, 11 Jan 2021 21:04:51 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
 by zero.eik.bme.hu (Postfix) with ESMTP id 0D10774645B;
 Mon, 11 Jan 2021 21:04:51 +0100 (CET)
Date: Mon, 11 Jan 2021 21:04:51 +0100 (CET)
From: BALATON Zoltan <balaton@eik.bme.hu>
To: Luc Michel <luc.michel@greensocs.com>
Subject: Re: About creating machines on the command line
In-Reply-To: <13ecc030-f42b-5a27-a0b3-b07921426ce9@greensocs.com>
Message-ID: <eb4ac5c9-b1d0-90eb-ed2a-2710d3149482@eik.bme.hu>
References: <13ecc030-f42b-5a27-a0b3-b07921426ce9@greensocs.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII; format=flowed
X-Spam-Probability: 8%
Received-SPF: pass client-ip=152.66.115.2; envelope-from=balaton@eik.bme.hu;
 helo=zero.eik.bme.hu
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
Cc: Damien Hedde <damien.hedde@greensocs.com>, peter.maydell@linaro.org,
 berrange@redhat.com, sam.grove@sifive.com, armbru@redhat.com,
 Mark Burton <mark.burton@greensocs.com>, qemu-devel@nongnu.org,
 richard.fuhler@sifive.com, edgar.iglesias@gmail.com, f4bug@amsat.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Mon, 11 Jan 2021, Luc Michel wrote:
> Hi,
>
> We would like to work on improving QEMU to be able to create custom machines 
> from the command line. The goal here is to get feedback from the community 
> and shape the future developments.
>
> The use case mainly comes from people working with tools to customize their 
> designs, such as SiFive Core Designer (https://scs.sifive.com/core-designer). 
> This kind of tools may allow creation or customization of a whole SoC, from 
> the number of cores, to the memory and IRQ mapping of peripherals etc.
>
> The ultimate goal would be to be able to create any kind of machine on the 
> command line. However we are aware that this is a substantial amount of 
> changes in QEMU.
>
> In its current state, QEMU allows for very limited customization of existing 
> machines on the command line. We identified the following limitations (feel 
> free to add to the list):
>
>  - Most devices are not user creatable. Moreover, sysbus devices must be 
> explicitly allowed by a machine to be creatable through `-device`,
>
>  - Memory regions cannot be created on the command line,
>
>  - Device MMIO regions cannot be mapped on a bus from the command line,
>
>  - GPIOs and clocks cannot be wired from the command line,
>
>  - CPUs are not sysbus devices (and not user-creatable). They need special 
> care when creating them regarding system reset. Not being on a bus means that 
> they must be reset manually on system reset. This is done in machines by 
> registering a QEMU reset handler.
>
>  - Machine specific boot code is usually hard-coded into the machine itself. 
> Some architectures (e.g. ARM) do factorize bootloader related code, but there 
> is no standard way of doing that in QEMU.
>
> We don't want to address all those limitations at once. We plan to start with 
> the following scenario:
>
>  - Start with a base machine that would handle CPU creation and bootloader 
> stuff. Note that the "none" machine is probably not sufficient in its current 
> shape. It does allow only one CPU and obviously does not handle the boot 
> process.
>
>  - Allow for this machine every sysbus devices we want to be user 
> command-line creatable (and mark them user_creatable if needed)
>
>  - Add command line options to create memory regions (probably ram ones at 
> first)
>
>  - Add command line options to map a memory region (including sysbus device 
> MMIO regions) onto another (memory_region_add_subregion)
>
>  - Add command line options to connect GPIOs and clocks.

I'm not sure the command line would be the best interface for this, it's 
already hard enough to get a simple VM running, adding more options would 
just make it more obscure for mere users who just want to use existing 
machines to create a VM. So I think some kind of config file to define the 
machine would be better.

Another issue with command line was backward compatibility that it's hard 
to change if it's used as an interface in scripts, etc. My personal 
opinion is that the command line should be a user interface to run VMs but 
for management apps and this kind of dynamic machine creation a better 
defined API might be better. But I'm not in any way authorative to decide 
so this is just my input to this.

> This would hopefully allow for simple machines creation. We would then be 
> able to use either the command line or the `-readconfig` option to create the 
> machine.

It was found that readconfig is limited and cannot even handle its current 
purpose so it probably would need to be rewritten. This might be a good 
opportunity for that. Maybe you need a better format than ini file that 
can actually describe the machine parts and their connections you want to 
create in a managable way. Question arises how general this has to be to 
describe all the properties of objects and their connections and if you'll 
end up with somthing like still needing to write a board code which is the 
current situation just instead of writing C you'd use some other language 
and call it a "config file". What do you really want here? Avoid writing C 
or avoid recompiling QEMU to experiment with devices? In the latter case 
better support from the QEMU monitor to create machines interactively 
could also be a solution and if you could run scripts with monitor 
commands in it that could be your config file.

> Note that we are not planning to use QMP/HMP for now. From our understanding, 
> a `device_add` request is always considered as hot-plug, which is not what we 
> want here.

Is that something that cannot be solved? Maybe by adding another command 
or a state where starting with -S and adding devices before continue would 
not be hotplug?

These are just some random thoughts I had, feel free to ignore any of it.

Regards,
BALATON Zoltan

