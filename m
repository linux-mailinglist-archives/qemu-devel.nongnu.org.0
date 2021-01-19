Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DDD1C2FBE38
	for <lists+qemu-devel@lfdr.de>; Tue, 19 Jan 2021 18:49:15 +0100 (CET)
Received: from localhost ([::1]:36134 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l1v7y-0005Z4-UB
	for lists+qemu-devel@lfdr.de; Tue, 19 Jan 2021 12:49:14 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:58218)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lersek@redhat.com>) id 1l1ugo-0001Tk-3e
 for qemu-devel@nongnu.org; Tue, 19 Jan 2021 12:21:12 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:39490)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <lersek@redhat.com>) id 1l1ugl-00075A-3b
 for qemu-devel@nongnu.org; Tue, 19 Jan 2021 12:21:09 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1611076865;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=QYgqudnxFwQFXxfosOICDBKZ8ChaGHwubWle9DpPDSU=;
 b=K9noLsMhTc4+MxwJCahx9aWYuJulJCjJqxgSl8BKOXgMKss8X3kZQpMi7pof0/YHWge5tG
 sIf7ltjc8kwoR/iqN82d9n/va8TzY4OB28MvfdzZFLogHnn998oM/z/RZwCVdTu3buKyBa
 Tt8k5yWIOIbfP2PBqMFHNlh/KdGfZCw=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-241-U9f9maQkNZ-RsAZ7x5-rhg-1; Tue, 19 Jan 2021 12:21:04 -0500
X-MC-Unique: U9f9maQkNZ-RsAZ7x5-rhg-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id C8F3110151EF;
 Tue, 19 Jan 2021 17:20:48 +0000 (UTC)
Received: from lacos-laptop-7.usersys.redhat.com (ovpn-114-176.ams2.redhat.com
 [10.36.114.176])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 8CD1E10429FA;
 Tue, 19 Jan 2021 17:20:27 +0000 (UTC)
Subject: Re: [PATCH] pci: add romsize property
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>, qemu-devel@nongnu.org,
 Haibin Zhang <haibinzhang@tencent.com>,
 David Edmondson <david.edmondson@oracle.com>
References: <20201218182736.1634344-1-pbonzini@redhat.com>
 <b9b7e55a-0f90-6680-8e15-992997afdd38@redhat.com>
From: Laszlo Ersek <lersek@redhat.com>
Message-ID: <1c506da5-26bc-9821-5096-16bc1458c342@redhat.com>
Date: Tue, 19 Jan 2021 18:20:26 +0100
MIME-Version: 1.0
In-Reply-To: <b9b7e55a-0f90-6680-8e15-992997afdd38@redhat.com>
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=lersek@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=lersek@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.195,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: Markus Armbruster <armbru@redhat.com>, dgilbert@redhat.com, mst@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 01/19/21 17:51, Philippe Mathieu-Daudé wrote:
> +pflash
> 
> On 12/18/20 7:27 PM, Paolo Bonzini wrote:
>> This property can be useful for distros to set up known-good ROM sizes for
>> migration purposes.  The VM will fail to start if the ROM is too large,
>> and migration compatibility will not be broken if the ROM is too small.
>>
>> Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
>> ---
>>  hw/pci/pci.c             | 19 +++++++++++++++++--
>>  hw/xen/xen_pt_load_rom.c | 14 ++++++++++++--
>>  include/hw/pci/pci.h     |  1 +
>>  3 files changed, 30 insertions(+), 4 deletions(-)
>>
>> diff --git a/hw/pci/pci.c b/hw/pci/pci.c
>> index d4349ea577..fd25253c2a 100644
>> --- a/hw/pci/pci.c
>> +++ b/hw/pci/pci.c
>> @@ -67,6 +67,7 @@ static void pcibus_reset(BusState *qbus);
>>  static Property pci_props[] = {
>>      DEFINE_PROP_PCI_DEVFN("addr", PCIDevice, devfn, -1),
>>      DEFINE_PROP_STRING("romfile", PCIDevice, romfile),
>> +    DEFINE_PROP_UINT32("romsize", PCIDevice, romsize, -1),
>>      DEFINE_PROP_UINT32("rombar",  PCIDevice, rom_bar, 1),
>>      DEFINE_PROP_BIT("multifunction", PCIDevice, cap_present,
>>                      QEMU_PCI_CAP_MULTIFUNCTION_BITNR, false),
>> @@ -2106,6 +2107,11 @@ static void pci_qdev_realize(DeviceState *qdev, Error **errp)
>>      bool is_default_rom;
>>      uint16_t class_id;
>>  
>> +    if (pci_dev->romsize != -1 && !is_power_of_2(pci_dev->romsize)) {
>> +        error_setg(errp, "ROM size %d is not a power of two", pci_dev->romsize);
>> +        return;
>> +    }
> 
> Some cloud providers already complained the pow2 check in the pflash
> device (wasting host storage). Personally I find using pow2 easier
> and safer.
> 
> The pow2 check looks like a separate change however, maybe add in a
> separate patch? Or maybe not :)
> 
> Regards,
> 
> Phil.
> 

I only have superficial comments:

- if we're talking uint32_t, I'd kind of prefer UINT32_MAX to (-1),
style-wise -- but feel free to ignore

- we should print a uint32_t with ("%" PRIu32), not "%d" (again, only
pedantry, but PRIu32 is widely used in qemu, AFAICS)

- Phil: you CC'd me on a context from which the larger part of the patch
had been removed. That's not really useful (I have no idea what the new
property actually does.) Hmmm let me see the patch in qemu-devel...

- OK, so get_image_size() returns an int64_t, which pci_add_option_rom()
assigns to an "int" without any range checking. Then we compare that int
against the new uint32_t property... or else, on the other branch, we
assign pow2ceil() -- a uint64_t -- to the new (uint32_t) property.

- In pci_assign_dev_load_option_rom(), "st.st_size" (which is an off_t)
is assigned to the new property...


I find it hard to reason about whether this is safe. I'd suggest first
cleaning up "int size" in pci_add_option_rom() -- use an int64_t, and
maybe check it explicitly against some 32-bit limit? --, then introduce
the new property as uint64_t. (Print it with PRIu64 then, I guess.) NB
"size" is also passed to pci_patch_ids(), which takes it as an "int" too
(shudder).

BTW there's another aspect of is_power_of_2(): it catches the zero
value. If the power-of-two check is dropped, I wonder if a zero property
value could cause a mess, so it might be prudent to catch that
explicitly. (Precedent: see the (size == 0) check in pci_add_option_rom().)

Anyway, feel free to ignore all of my points; I just find it hard to
reason about the "logic" when the code is not obviously overflow-free in
the first place. (I'm not implying there are overflows; the code may be
free of overflows -- it's just not *obviously* so, to me anyway.)

Thanks
Laszlo


