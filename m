Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 569103280CC
	for <lists+qemu-devel@lfdr.de>; Mon,  1 Mar 2021 15:29:32 +0100 (CET)
Received: from localhost ([::1]:57920 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lGjYB-0007R7-Bu
	for lists+qemu-devel@lfdr.de; Mon, 01 Mar 2021 09:29:31 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:42788)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <t.lamprecht@proxmox.com>)
 id 1lGjWS-0006Xy-Dt
 for qemu-devel@nongnu.org; Mon, 01 Mar 2021 09:27:44 -0500
Received: from proxmox-new.maurer-it.com ([212.186.127.180]:50541)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <t.lamprecht@proxmox.com>)
 id 1lGjWQ-0006Yh-3g
 for qemu-devel@nongnu.org; Mon, 01 Mar 2021 09:27:43 -0500
Received: from proxmox-new.maurer-it.com (localhost.localdomain [127.0.0.1])
 by proxmox-new.maurer-it.com (Proxmox) with ESMTP id 25191443CD;
 Mon,  1 Mar 2021 15:27:39 +0100 (CET)
Message-ID: <dcf40b52-e695-e516-aa26-0db30e5ee6ea@proxmox.com>
Date: Mon, 1 Mar 2021 15:27:38 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:87.0) Gecko/20100101
 Thunderbird/87.0
Content-Language: en-US
To: Igor Mammedov <imammedo@redhat.com>
References: <20200730155755.188845-1-mst@redhat.com>
 <5b40e1ac-03ca-7954-4d50-f5f96c339772@proxmox.com>
 <20210228154208-mutt-send-email-mst@kernel.org>
 <967d3e1f-d387-0b33-95b0-6560f49657dd@proxmox.com>
 <20210301021449-mutt-send-email-mst@kernel.org>
 <4b7e58a9-e6bf-818f-b2f1-72600fced210@proxmox.com>
 <20210301152036.0c12cbf5@redhat.com>
From: Thomas Lamprecht <t.lamprecht@proxmox.com>
Subject: Re: [PATCH 1/2] i386/acpi: fix inconsistent QEMU/OVMF device paths
In-Reply-To: <20210301152036.0c12cbf5@redhat.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=212.186.127.180;
 envelope-from=t.lamprecht@proxmox.com; helo=proxmox-new.maurer-it.com
X-Spam_score_int: -41
X-Spam_score: -4.2
X-Spam_bar: ----
X-Spam_report: (-4.2 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_MED=-2.3, SPF_HELO_NONE=0.001,
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
Cc: vit9696 <vit9696@protonmail.com>, "Michael S. Tsirkin" <mst@redhat.com>,
 Stefan Reiter <s.reiter@proxmox.com>, qemu-devel@nongnu.org,
 Paolo Bonzini <pbonzini@redhat.com>, Richard Henderson <rth@twiddle.net>,
 Laszlo Ersek <lersek@redhat.com>, Eduardo Habkost <ehabkost@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 01.03.21 15:20, Igor Mammedov wrote:
> On Mon, 1 Mar 2021 08:45:53 +0100
> Thomas Lamprecht <t.lamprecht@proxmox.com> wrote:
>> On 01.03.21 08:20, Michael S. Tsirkin wrote:
>>> There are various testing efforts the reason this got undetected is
>>> because it does not affect linux guests, and even for windows
>>> they kind of recover, there's just some boot slowdown around reconfiguration.
>>> Not easy to detect automatically given windows has lots of random
>>> downtime during boot around updates etc etc.
>>>   
>>
>> No, Windows does not reconfigure, this is a permanent change, one is just lucky
>> if one has a DHCP server around in the network accessible for the guest.
>> As static addresses setup on that virtual NIC before that config is gone,
>> no recovery whatsoever until manual intervention.
> Static IP's are the pain guest admin picked up to deal with so he might have to
> reconfigure guest OS when it decides to rename NICs. In this case moving
> to new QEMU is alike to updating BIOS which fixed PCI description.
> (On QEMU side we try to avoid breaking changes, but sometime it happens anyway
> and it's up guest admin to fix OS quirks)
> 

heh, I agree, but users see it very differently, QEMU got updated, something
stopped working/changed/... -> QEMU at fault.

>> I meant more of a "dump HW layout to .txt file, commit to git, and ensure
>> there's no diff without and machine version bump" (very boiled down), e.g., like
>> ABI checks for kernel builds are often done by distros - albeit those are easier
>> as its quite clear what and how the kernel ABI can be used.
> ACPI tables are not considered as ABI change in QEMU, technically tables that QEMU
> generates are firmware and not version-ed (same like we don't tie anything to
> specific firmware versions). 
> 
> However we rarely do version ACPI changes (only when it breaks something or
> we suspect it would break and we can't accept that breakage), this time it took
> a lot of time to find out that. We try to minimize such cases as every
> versioning knob adds up to maintenance.
> 
> For ACPI tables changes, QEMU has bios-tables-test, but it lets us to catch
> unintended changes only.
> Technically it's possible to keep master tables for old machine versions
> and test against it. But I'm not sure if we should do that, because some
> (most) changes are harmless or useful and should apply to all machine
> versions.
> So we will end up in the same situation, where we decide if a change
> should be versioned or not.
> 
> 

OK, fair enough. Many thanks for providing some rationale!


