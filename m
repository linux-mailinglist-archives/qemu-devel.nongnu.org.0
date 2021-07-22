Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 866C53D1AD0
	for <lists+qemu-devel@lfdr.de>; Thu, 22 Jul 2021 02:43:51 +0200 (CEST)
Received: from localhost ([::1]:49590 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m6MoY-00011r-Jq
	for lists+qemu-devel@lfdr.de; Wed, 21 Jul 2021 20:43:50 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58376)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lyan@suse.de>) id 1m6MnX-0000Lp-Tp
 for qemu-devel@nongnu.org; Wed, 21 Jul 2021 20:42:47 -0400
Received: from smtp-out2.suse.de ([195.135.220.29]:51076)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <lyan@suse.de>) id 1m6MnV-0003Mx-WA
 for qemu-devel@nongnu.org; Wed, 21 Jul 2021 20:42:47 -0400
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id 770111FEE8;
 Thu, 22 Jul 2021 00:42:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1626914562; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=BGWyeyX6N/oU5zm9hKA54wFl8rbwppX/xB0ODjQhpe4=;
 b=CgrfqppBqnTH83AJazuKrWj/y/Xh/Q7MpOSBSxUouDYiXBw7b685jkjIkmspZ57Qhpc/Jx
 V8cR3wYs+x+i4GAcwy4zDCiZzWvOChh3HUrv41SYDma9mblXaKfDQWrRztzPWVM/ThD9aO
 lgl6jTVJ2HpiutbJG44RDB8ovS92c40=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1626914562;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=BGWyeyX6N/oU5zm9hKA54wFl8rbwppX/xB0ODjQhpe4=;
 b=PtycLRHB+HDKWgAYXxxT3ezfgjfoHyjorTm8P/VPBkO5YURYcOV3PrRPLl2jlz+3hlsVgk
 xHZxIhDpCnteHPAw==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id CD27313D4E;
 Thu, 22 Jul 2021 00:42:40 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id o/1xKgC/+GDxDQAAMHmgww
 (envelope-from <lyan@suse.de>); Thu, 22 Jul 2021 00:42:40 +0000
Subject: Re: [PATCH v1 1/1] vfio: Make migration support non experimental by
 default.
To: Kirti Wankhede <kwankhede@nvidia.com>, Claudio Fontana
 <cfontana@suse.de>, Tarun Gupta <targupta@nvidia.com>,
 alex.williamson@redhat.com, qemu-devel@nongnu.org
References: <20210308160949.4290-1-targupta@nvidia.com>
 <e8ad19da-0064-2edc-e7c6-6114031ea0f8@suse.de>
 <a68d1ead-cca6-ff5e-033e-15865941500b@nvidia.com>
From: Liang Yan <lyan@suse.de>
Message-ID: <7bf462b9-6e79-d768-1e1a-8a1b78298cc9@suse.de>
Date: Wed, 21 Jul 2021 20:42:39 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <a68d1ead-cca6-ff5e-033e-15865941500b@nvidia.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Content-Language: en-US
Received-SPF: pass client-ip=195.135.220.29; envelope-from=lyan@suse.de;
 helo=smtp-out2.suse.de
X-Spam_score_int: -44
X-Spam_score: -4.5
X-Spam_bar: ----
X-Spam_report: (-4.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.117,
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
Cc: cjia@nvidia.com, quintela@redhat.com, cohuck@redhat.com,
 dgilbert@redhat.com, lushenming@huawei.com, dnigam@nvidia.com,
 philmd@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


On 7/14/21 6:19 AM, Kirti Wankhede wrote:
>
>
> On 7/10/2021 1:14 PM, Claudio Fontana wrote:
>> On 3/8/21 5:09 PM, Tarun Gupta wrote:
>>> VFIO migration support in QEMU is experimental as of now, which was
>>> done to
>>> provide soak time and resolve concerns regarding bit-stream.
>>> But, with the patches discussed in
>>> https://nam11.safelinks.protection.outlook.com/?url=https%3A%2F%2Fwww.mail-archive.com%2Fqemu-devel%40nongnu.org%2Fmsg784931.html&amp;data=04%7C01%7Ckwankhede%40nvidia.com%7C98194e8a856f4e6b611c08d943769ab5%7C43083d15727340c1b7db39efd9ccc17a%7C0%7C0%7C637614998961553398%7CUnknown%7CTWFpbGZsb3d8eyJWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C1000&amp;sdata=A2EY9LEqGE0BSrT25h2WtWonb5oi0O%2B6%2BQmvhVf8Wd4%3D&amp;reserved=0
>>> , we have
>>> corrected ordering of saving PCI config space and bit-stream.
>>>
>>> So, this patch proposes to make vfio migration support in QEMU to be
>>> enabled
>>> by default. Tested by successfully migrating mdev device.
>>>
>>> Signed-off-by: Tarun Gupta <targupta@nvidia.com>
>>> Signed-off-by: Kirti Wankhede <kwankhede@nvidia.com>
>>> ---
>>>   hw/vfio/pci.c | 2 +-
>>>   1 file changed, 1 insertion(+), 1 deletion(-)
>>>
>>> diff --git a/hw/vfio/pci.c b/hw/vfio/pci.c
>>> index f74be78209..15e26f460b 100644
>>> --- a/hw/vfio/pci.c
>>> +++ b/hw/vfio/pci.c
>>> @@ -3199,7 +3199,7 @@ static Property vfio_pci_dev_properties[] = {
>>>       DEFINE_PROP_BIT("x-igd-opregion", VFIOPCIDevice, features,
>>>                       VFIO_FEATURE_ENABLE_IGD_OPREGION_BIT, false),
>>>       DEFINE_PROP_BOOL("", VFIOPCIDevice,
>>> -                     vbasedev.enable_migration, false),
>>> +                     vbasedev.enable_migration, true),
>>>       DEFINE_PROP_BOOL("x-no-mmap", VFIOPCIDevice, vbasedev.no_mmap,
>>> false),
>>>       DEFINE_PROP_BOOL("x-balloon-allowed", VFIOPCIDevice,
>>>                        vbasedev.ram_block_discard_allowed, false),
>>>
>>
>> Hello,
>>
>> has plain snapshot been tested?
>
> Yes.
>
>> If I issue the HMP command "savevm", and then "loadvm", will things
>> work fine?
>
> Yes
>

Hello Kirti,

I enabled x-enable-migration and did some hack on failover_pair_id,
finally made  "virsh save/restore" and "savevm/loadvm"work through.
However, it seems vGPU did not get involved in the real migration
process, the qemu trace file confirmed it, there is no vfio section for
savevm_section_start at all.

I am using kernel 5.8 and latest qemu, vGPU 12.2 with one V100. I am
wondering if there is a version compatible requirement or need extra
setup. Could you share your test setup here? Thanks in advance.

Regards,

Liang



> Thanks,
> Kirti
>

