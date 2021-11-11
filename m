Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3B46344D78A
	for <lists+qemu-devel@lfdr.de>; Thu, 11 Nov 2021 14:49:25 +0100 (CET)
Received: from localhost ([::1]:50750 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mlASB-0001PP-Ro
	for lists+qemu-devel@lfdr.de; Thu, 11 Nov 2021 08:49:23 -0500
Received: from eggs.gnu.org ([209.51.188.92]:34054)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <t.lamprecht@proxmox.com>)
 id 1mlAQQ-0000V1-D2
 for qemu-devel@nongnu.org; Thu, 11 Nov 2021 08:47:35 -0500
Received: from proxmox-new.maurer-it.com ([94.136.29.106]:19842)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <t.lamprecht@proxmox.com>)
 id 1mlAQM-00023c-Pv
 for qemu-devel@nongnu.org; Thu, 11 Nov 2021 08:47:34 -0500
Received: from proxmox-new.maurer-it.com (localhost.localdomain [127.0.0.1])
 by proxmox-new.maurer-it.com (Proxmox) with ESMTP id AE54242C52;
 Thu, 11 Nov 2021 14:47:12 +0100 (CET)
Message-ID: <244dd753-3d80-8360-b3f5-83acf4ff6376@proxmox.com>
Date: Thu, 11 Nov 2021 14:47:11 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:95.0) Gecko/20100101
 Thunderbird/95.0
Subject: Re: [PATCH for 6.2 v2 5/5] bios-tables-test: Update golden binaries
Content-Language: en-US
To: Igor Mammedov <imammedo@redhat.com>, "Michael S. Tsirkin" <mst@redhat.com>
References: <20211110211140.3057199-1-imammedo@redhat.com>
 <20211110211140.3057199-6-imammedo@redhat.com>
 <20211111033414-mutt-send-email-mst@kernel.org>
 <20211111123236.56714890@redhat.com>
From: Thomas Lamprecht <t.lamprecht@proxmox.com>
In-Reply-To: <20211111123236.56714890@redhat.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=94.136.29.106;
 envelope-from=t.lamprecht@proxmox.com; helo=proxmox-new.maurer-it.com
X-Spam_score_int: -58
X-Spam_score: -5.9
X-Spam_bar: -----
X-Spam_report: (-5.9 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-3.999,
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
Cc: ani@anisinha.ca, mapfelba@redhat.com, jusual@redhat.com,
 qemu-devel@nongnu.org, kraxel@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 11.11.21 12:32, Igor Mammedov wrote:
> On Thu, 11 Nov 2021 03:34:37 -0500
> "Michael S. Tsirkin" <mst@redhat.com> wrote:
> 
>> On Wed, Nov 10, 2021 at 04:11:40PM -0500, Igor Mammedov wrote:
>>> From: Julia Suvorova <jusual@redhat.com>
>>>
>>> The changes are the result of
>>>         'hw/i386/acpi-build: Deny control on PCIe Native Hot-Plug in _OSC'
>>> and listed here:
>>>
>>> Method (_OSC, 4, NotSerialized)  // _OSC: Operating System Capabilities
>>>              {
>>>                  CreateDWordField (Arg3, Zero, CDW1)
>>>                  If ((Arg0 == ToUUID ("33db4d5b-1ff7-401c-9657-7441c03dd766") /* PCI Host Bridge Device */))
>>>                  {
>>>                      CreateDWordField (Arg3, 0x04, CDW2)
>>>                      CreateDWordField (Arg3, 0x08, CDW3)
>>>                      Local0 = CDW3 /* \_SB_.PCI0._OSC.CDW3 */
>>> -                    Local0 &= 0x1F
>>> +                    Local0 &= 0x1E
>>>
>>> Signed-off-by: Julia Suvorova <jusual@redhat.com>
>>> Signed-off-by: Igor Mammedov <imammedo@redhat.com>
>>> ---
>>>  tests/qtest/bios-tables-test-allowed-diff.h |  16 ----------------
>>>  tests/data/acpi/q35/DSDT                    | Bin 8289 -> 8289 bytes
>>>  tests/data/acpi/q35/DSDT.acpihmat           | Bin 9614 -> 9614 bytes
>>>  tests/data/acpi/q35/DSDT.bridge             | Bin 11003 -> 11003 bytes
>>>  tests/data/acpi/q35/DSDT.cphp               | Bin 8753 -> 8753 bytes
>>>  tests/data/acpi/q35/DSDT.dimmpxm            | Bin 9943 -> 9943 bytes
>>>  tests/data/acpi/q35/DSDT.dmar               | Bin 0 -> 8289 bytes
>>>  tests/data/acpi/q35/DSDT.ipmibt             | Bin 8364 -> 8364 bytes
>>>  tests/data/acpi/q35/DSDT.ivrs               | Bin 8306 -> 8306 bytes
>>>  tests/data/acpi/q35/DSDT.memhp              | Bin 9648 -> 9648 bytes
>>>  tests/data/acpi/q35/DSDT.mmio64             | Bin 9419 -> 9419 bytes
>>>  tests/data/acpi/q35/DSDT.multi-bridge       | Bin 8583 -> 8583 bytes
>>>  tests/data/acpi/q35/DSDT.nohpet             | Bin 8147 -> 8147 bytes
>>>  tests/data/acpi/q35/DSDT.nosmm              | Bin 0 -> 8289 bytes
>>>  tests/data/acpi/q35/DSDT.numamem            | Bin 8295 -> 8295 bytes
>>>  tests/data/acpi/q35/DSDT.smm-compat         | Bin 0 -> 8289 bytes
>>>  tests/data/acpi/q35/DSDT.smm-compat-nosmm   | Bin 0 -> 8289 bytes
>>>  tests/data/acpi/q35/DSDT.tis.tpm12          | Bin 8894 -> 8894 bytes
>>>  tests/data/acpi/q35/DSDT.tis.tpm2           | Bin 8894 -> 8894 bytes
>>>  tests/data/acpi/q35/DSDT.xapic              | Bin 35652 -> 35652 bytes  
>> Why do we have all the new files?  What is going on here?
> I think new files are not necessary.
> 
> I can update patch if we decide to keep ACPI enabled by default.
> 
> So question is:
>   do we revert to native pcie or stay with apci hootplug for 6.2?
> 

FWIW, we had to add some compat handling in Proxmox VE for the original change
as we do not pin Linux VM machines between cold-starts (they normally do not care
much about some HW/CPU bits added/dropped/moved) and the change here messed a bit
with the guest OS network configuration, as systemd's predictable interface naming
changed the name from, e.g., enp18 to ens6p18.

I mean, we wondered a bit over the original change here and contemplated reverting
it in our downstream build. While we read the reasons got a report of any of that
problems happen from our upper 6 digit count of systems reporting to our repos.
Ultimately we did not went with the revert to avoid problems if this was QEMU's
way forward, wrong choice it seems, and it now additionally seems that ACPI hotplug
produces boot-loops in some guests with seabios and serial or no display.

Anyhow (sorry for the whole back-story/rambling), if QEMU reverts this for 6.2 I
think we'd pull the line now and revert it in our 6.1 build we plan to fully roll
out soon, to avoid this whole mess for most of our user base in the first place..


- Thomas


