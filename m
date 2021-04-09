Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6266635A4D2
	for <lists+qemu-devel@lfdr.de>; Fri,  9 Apr 2021 19:42:55 +0200 (CEST)
Received: from localhost ([::1]:45942 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lUv9i-0001Hd-0M
	for lists+qemu-devel@lfdr.de; Fri, 09 Apr 2021 13:42:54 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40894)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1lUv6z-0008U3-SF
 for qemu-devel@nongnu.org; Fri, 09 Apr 2021 13:40:05 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:49728)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1lUv6x-0001SW-5K
 for qemu-devel@nongnu.org; Fri, 09 Apr 2021 13:40:05 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1617990001;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=pg4wZU8Bu5FDhB6xggtLCL5SeOGAvL4zYYZS6SHcgS8=;
 b=AOjSjU5cB/BYfk3217cScbjisSbl+le5sKz3KmNchLgNT9HhjMOlTCyZ8ErM7K1nsb/PQC
 mnjAIZuAjGEidmA1l1LU612szrqzy/NLPcyqKQub8YgxgTjyEHuDiGxD/wuC0GcUjl5+0j
 wfGmwBadHEudcz4CJwf7qEFAJjZ5EaA=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-277-HwdDnjcfPoi7C6dDh4el0w-1; Fri, 09 Apr 2021 13:39:56 -0400
X-MC-Unique: HwdDnjcfPoi7C6dDh4el0w-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 7DBB31922960;
 Fri,  9 Apr 2021 17:39:54 +0000 (UTC)
Received: from thuth.remote.csb (ovpn-112-65.ams2.redhat.com [10.36.112.65])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 5848160BE5;
 Fri,  9 Apr 2021 17:39:47 +0000 (UTC)
Subject: Re: [PATCH for-6.0 v2 6/8] hw/block/nvme: update dmsrl limit on
 namespace detachment
To: Klaus Jensen <its@irrelevant.dk>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
References: <20210405175452.37578-1-its@irrelevant.dk>
 <20210405175452.37578-7-its@irrelevant.dk>
 <fa06244b-b4d9-9edb-0fef-495a477bbe71@redhat.com>
 <YGwMx5n2MzBkG8pQ@apples.localdomain>
From: Thomas Huth <thuth@redhat.com>
Message-ID: <726df2a1-6e56-145f-9fa5-c5c94ec3b635@redhat.com>
Date: Fri, 9 Apr 2021 19:39:46 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.0
MIME-Version: 1.0
In-Reply-To: <YGwMx5n2MzBkG8pQ@apples.localdomain>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=thuth@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001,
 RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: Kevin Wolf <kwolf@redhat.com>, Fam Zheng <fam@euphon.net>,
 qemu-block@nongnu.org, Klaus Jensen <k.jensen@samsung.com>,
 Gollu Appalanaidu <anaidu.gollu@samsung.com>, qemu-devel@nongnu.org,
 Max Reitz <mreitz@redhat.com>, Stefan Hajnoczi <stefanha@redhat.com>,
 Keith Busch <kbusch@kernel.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 06/04/2021 09.24, Klaus Jensen wrote:
> On Apr  6 09:10, Philippe Mathieu-Daudé wrote:
>> On 4/5/21 7:54 PM, Klaus Jensen wrote:
>>> From: Klaus Jensen <k.jensen@samsung.com>
>>>
>>> The Non-MDTS DMSRL limit must be recomputed when namespaces are
>>> detached.
>>>
>>> Fixes: 645ce1a70cb6 ("hw/block/nvme: support namespace attachment command")
>>> Signed-off-by: Klaus Jensen <k.jensen@samsung.com>
>>> Reviewed-by: Gollu Appalanaidu <anaidu.gollu@samsung.com>
>>> ---
>>>   hw/block/nvme.c | 17 +++++++++++++++++
>>>   1 file changed, 17 insertions(+)
>>>
>>> diff --git a/hw/block/nvme.c b/hw/block/nvme.c
>>> index de0e726dfdd8..3dc51f407671 100644
>>> --- a/hw/block/nvme.c
>>> +++ b/hw/block/nvme.c
>>> @@ -4876,6 +4876,21 @@ static uint16_t nvme_aer(NvmeCtrl *n, NvmeRequest *req)
>>>       return NVME_NO_COMPLETE;
>>>   }
>>>   
>>> +static void __nvme_update_dmrsl(NvmeCtrl *n)
>>> +{
>>> +    int nsid;
>>> +
>>> +    for (nsid = 1; nsid <= NVME_MAX_NAMESPACES; nsid++) {
>>> +        NvmeNamespace *ns = nvme_ns(n, nsid);
>>> +        if (!ns) {
>>> +            continue;
>>> +        }
>>> +
>>> +        n->dmrsl = MIN_NON_ZERO(n->dmrsl,
>>> +                                BDRV_REQUEST_MAX_BYTES / nvme_l2b(ns, 1));
>>> +    }
>>> +}
>>> +
>>>   static void __nvme_select_ns_iocs(NvmeCtrl *n, NvmeNamespace *ns);
>>>   static uint16_t nvme_ns_attachment(NvmeCtrl *n, NvmeRequest *req)
>>>   {
>>> @@ -4925,6 +4940,8 @@ static uint16_t nvme_ns_attachment(NvmeCtrl *n, NvmeRequest *req)
>>>               }
>>>   
>>>               nvme_ns_detach(ctrl, ns);
>>> +
>>> +            __nvme_update_dmrsl(ctrl);
>>>           }
>>
>> Why the '__' prefix? It doesn't seem clearer (I'm not sure there is
>> a convention, it makes me think of a internal macro expansion use
>> for preprocessor).
>>
>> There are very few uses of this prefix:
>>
>> hw/9pfs/cofs.c:21:static ssize_t __readlink(V9fsState *s, V9fsPath
>> *path, V9fsString *buf)
>> hw/block/nvme.c:1683:static uint16_t __nvme_zrm_open(NvmeNamespace *ns,
>> NvmeZone *zone,
>> hw/block/nvme.c:1742:static void __nvme_advance_zone_wp(NvmeNamespace
>> *ns, NvmeZone *zone,
>> hw/block/nvme.c:5213:static void __nvme_select_ns_iocs(NvmeCtrl *n,
>> NvmeNamespace *ns)
>> hw/i386/amd_iommu.c:1160:static int __amdvi_int_remap_msi(AMDVIState *iommu,
>> hw/intc/s390_flic_kvm.c:255:static int __get_all_irqs(KVMS390FLICState
>> *flic,
>> hw/net/rocker/rocker_desc.c:199:static bool
>> __desc_ring_post_desc(DescRing *ring, int err)
>> hw/net/sungem.c:766:static uint16_t __sungem_mii_read(SunGEMState *s,
>> uint8_t phy_addr,
>> hw/ppc/ppc.c:867:static void __cpu_ppc_store_decr(PowerPCCPU *cpu,
>> uint64_t *nextp,
>> hw/s390x/pv.c:25:static int __s390_pv_cmd(uint32_t cmd, const char
>> *cmdname, void *data)
>> pc-bios/s390-ccw/cio.c:315:static int __do_cio(SubChannelId schid,
>> uint32_t ccw_addr, int fmt, Irb *irb)
>> target/ppc/mmu-hash64.c:170:static void __helper_slbie(CPUPPCState *env,
>> target_ulong addr,
>>
>> Thomas, Eric, is it worth cleaning these and updating the
>> 'CODESTYLE.rst'?
>>
> 
> Yeah ok, I think you are right that there is no clear convention on when
> to use this or not. I typically just use it for functions that are
> normally not supposed to be called directly.
> 
> But I don't even think its consistent in the nvme device. For my sake,
> we can clean it up, I'll drop it in this case since there is no good
> reason for it other than my own idea of "style".

IIRC all identifiers that start with two underscores are reserved by the C 
standard:

  https://busybox.net/~landley/c99-draft.html#7.1.3

Thus you should not use two underscores at the beginning here at all.

  HTH,
   Thomas


