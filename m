Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 00AA74EAB13
	for <lists+qemu-devel@lfdr.de>; Tue, 29 Mar 2022 12:14:05 +0200 (CEST)
Received: from localhost ([::1]:38028 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nZ8rS-000056-Cc
	for lists+qemu-devel@lfdr.de; Tue, 29 Mar 2022 06:14:02 -0400
Received: from eggs.gnu.org ([209.51.188.92]:40514)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1nZ8of-0006yE-Ii
 for qemu-devel@nongnu.org; Tue, 29 Mar 2022 06:11:10 -0400
Received: from [2a00:1450:4864:20::433] (port=42617
 helo=mail-wr1-x433.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1nZ8ob-0005T2-Fi
 for qemu-devel@nongnu.org; Tue, 29 Mar 2022 06:11:07 -0400
Received: by mail-wr1-x433.google.com with SMTP id r13so24017703wrr.9
 for <qemu-devel@nongnu.org>; Tue, 29 Mar 2022 03:11:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=H3+1LJaYcMudQD7veRW80yWPFrLFrdsnjd/QvJUlaM4=;
 b=HQYVj3tMJ7EbO7NUjmlLB9IGMuexUwkFwTDPcQ+sEdzjhVYblepjWfMzKivkF2BXRA
 wUbjzWMRf7PIHnf1QSFXrfI0AuxzkDgVTkcEqC8LzDdLwk4JaTMOfI2OLsD/gtHWXJJf
 nR/0sWCUCaZswMgdpjYzfO8CwVdOLooXtASwf2mZl0l9whgUVmDF0CoHxegWxYfOiS8g
 9+IP12zymy7deNi4Pq/OfpyfCCBvetydlLDH7Yz+am3HAuS4L7WE7UXaU60BHk7Xbykz
 BlRpB5WoHOPxhpphmGDdVzvjKRcD95RKUvDZ8PSm37cjs46X/QEidQgXTKqifxs/Zhu7
 glBg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=H3+1LJaYcMudQD7veRW80yWPFrLFrdsnjd/QvJUlaM4=;
 b=HJhhy3UzR8dPWnri0Sn5uFzS/O/IVZIdArUVi14OymnKxsL4p1SXldgtvMmm2h6AZk
 AdggJ8GJ4+51l1pDw6uK3D9YTVfuv8WmfkyWY85qt/iQsrFUh1Z8WdtMK6512RnPXCyi
 wH40WB9aLfkL6V6mSYpC81tbZmU2JFtGtHtRbNUja3JCBuoW0S0BR8H1seNUnIdgDeFx
 RjkXjLAQos7CDRCKkFZynCjih1ZMZi5MoLL/5kRN5G0VDQIcF/toFPqLLyJU/cy8/I/n
 o/wUtiYvnc0cie9Htq9g6yKpNrVN9+0whLj1fONHwGlGlm0flJ0vDO9V3PqLbQK4kpUQ
 gB8Q==
X-Gm-Message-State: AOAM5316uSW6qMPSwRflZsCwWzPBUM7ofs+l85xLtjYdQzLLbJbB0yRe
 rlV+IzHubJYyrrVQBy4kb00=
X-Google-Smtp-Source: ABdhPJw8sCKL28U+CXosDkHXr6aP4B7GpF8xNgwl9nkCamptyrS+gEBmJ5lmpppyhhEH3jqoIErlbQ==
X-Received: by 2002:adf:ef86:0:b0:203:f8f5:efab with SMTP id
 d6-20020adfef86000000b00203f8f5efabmr30632414wro.671.1648548661804; 
 Tue, 29 Mar 2022 03:11:01 -0700 (PDT)
Received: from ?IPV6:2600:70ff:f07f:0:e879:8932:71b2:b130?
 ([2600:70ff:f07f:0:e879:8932:71b2:b130])
 by smtp.gmail.com with ESMTPSA id
 e8-20020a05600c2dc800b0038d05f2b34dsm2441907wmh.2.2022.03.29.03.11.00
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 29 Mar 2022 03:11:01 -0700 (PDT)
Message-ID: <11dcf949-22aa-b94e-143d-88093ee0b67d@gmail.com>
Date: Tue, 29 Mar 2022 12:10:59 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:91.0)
 Gecko/20100101 Thunderbird/91.7.0
Subject: Re: [PATCH-for-7.0] hw/pvrdma: Protect against buggy or malicious
 guest driver
Content-Language: en-US
To: Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Yuval Shaia <yuval.shaia.ml@gmail.com>
References: <20220321131143.31210-1-yuval.shaia.ml@gmail.com>
 <CAC_L=vXa2O_YVACvwPPkNyy7agQ5aJnBHV70MSN3XZfD+zremw@mail.gmail.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?=
 <philippe.mathieu.daude@gmail.com>
In-Reply-To: <CAC_L=vXa2O_YVACvwPPkNyy7agQ5aJnBHV70MSN3XZfD+zremw@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::433
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::433;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wr1-x433.google.com
X-Spam_score_int: -6
X-Spam_score: -0.7
X-Spam_bar: /
X-Spam_report: (-0.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 NICE_REPLY_A=-0.001, PDS_HP_HELO_NORDNS=0.659, RCVD_IN_DNSWL_NONE=-0.0001,
 RDNS_NONE=0.793, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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
Cc: wxhusst@gmail.com, Peter Maydell <peter.maydell@linaro.org>,
 Mauro Matteo Cascella <mcascell@redhat.com>,
 qemu devel list <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 22/3/22 13:27, Marcel Apfelbaum wrote:
> Hi Yuval
> 
> On Mon, Mar 21, 2022 at 2:11 PM Yuval Shaia <yuval.shaia.ml@gmail.com> wrote:
>>
>> Guest driver might execute HW commands when shared buffers are not yet
>> allocated.
>> This might happen on purpose (malicious guest) or because some other
>> guest/host address mapping.
>> We need to protect againts such case.
>>

Fixes: CVE-2022-1050

>> Reported-by: Mauro Matteo Cascella <mcascell@redhat.com>
>> Signed-off-by: Yuval Shaia <yuval.shaia.ml@gmail.com>
>> ---
>>   hw/rdma/vmw/pvrdma_cmd.c  | 6 ++++++
>>   hw/rdma/vmw/pvrdma_main.c | 9 +++++----
>>   2 files changed, 11 insertions(+), 4 deletions(-)
>>
>> diff --git a/hw/rdma/vmw/pvrdma_cmd.c b/hw/rdma/vmw/pvrdma_cmd.c
>> index da7ddfa548..89db963c46 100644
>> --- a/hw/rdma/vmw/pvrdma_cmd.c
>> +++ b/hw/rdma/vmw/pvrdma_cmd.c
>> @@ -796,6 +796,12 @@ int pvrdma_exec_cmd(PVRDMADev *dev)
>>
>>       dsr_info = &dev->dsr_info;
>>
>> +    if (!dsr_info->dsr) {
>> +            /* Buggy or malicious guest driver */
>> +            rdma_error_report("Exec command without dsr, req or rsp buffers");
>> +            goto out;
>> +    }
>> +
>>       if (dsr_info->req->hdr.cmd >= sizeof(cmd_handlers) /
>>                         sizeof(struct cmd_handler)) {
>>           rdma_error_report("Unsupported command");
>> diff --git a/hw/rdma/vmw/pvrdma_main.c b/hw/rdma/vmw/pvrdma_main.c
>> index 91206dbb8e..aae382af59 100644
>> --- a/hw/rdma/vmw/pvrdma_main.c
>> +++ b/hw/rdma/vmw/pvrdma_main.c
>> @@ -159,13 +159,13 @@ static void free_dsr(PVRDMADev *dev)
>>       free_dev_ring(pci_dev, &dev->dsr_info.cq, dev->dsr_info.cq_ring_state);
>>
>>       rdma_pci_dma_unmap(pci_dev, dev->dsr_info.req,
>> -                         sizeof(union pvrdma_cmd_req));
>> +                       sizeof(union pvrdma_cmd_req));
>>
>>       rdma_pci_dma_unmap(pci_dev, dev->dsr_info.rsp,
>> -                         sizeof(union pvrdma_cmd_resp));
>> +                       sizeof(union pvrdma_cmd_resp));
>>
>>       rdma_pci_dma_unmap(pci_dev, dev->dsr_info.dsr,
>> -                         sizeof(struct pvrdma_device_shared_region));
>> +                       sizeof(struct pvrdma_device_shared_region));
>>
> 
> Nit: the above changes are not related to the patch, maybe drop them?

Yes please.

> 
> Reviewed-by: Marcel Apfelbaum <marcel.apfelbaum@gmail.com>
> 
> Thanks,
> Marcel
> 
>>       dev->dsr_info.dsr = NULL;
>>   }
>> @@ -249,7 +249,8 @@ static void init_dsr_dev_caps(PVRDMADev *dev)
>>   {
>>       struct pvrdma_device_shared_region *dsr;
>>
>> -    if (dev->dsr_info.dsr == NULL) {
>> +    if (!dev->dsr_info.dsr) {
>> +        /* Buggy or malicious guest driver */
>>           rdma_error_report("Can't initialized DSR");
>>           return;
>>       }
>> --
>> 2.20.1
>>
> 


