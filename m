Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 94533539EFF
	for <lists+qemu-devel@lfdr.de>; Wed,  1 Jun 2022 10:06:45 +0200 (CEST)
Received: from localhost ([::1]:57452 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nwJNM-0005rm-9b
	for lists+qemu-devel@lfdr.de; Wed, 01 Jun 2022 04:06:44 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45124)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <david@redhat.com>) id 1nwJHn-0003T2-Ot
 for qemu-devel@nongnu.org; Wed, 01 Jun 2022 04:01:06 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:52589)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <david@redhat.com>) id 1nwJHj-000214-SE
 for qemu-devel@nongnu.org; Wed, 01 Jun 2022 04:00:58 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1654070455;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Aj7SEq/+8A/upQ3HHJMYSDggfy+gpVpZpGyNgHhO+nE=;
 b=GcSC4K9K7i/K2i/Lv3fGR9q13NxUXF/2V/ztZCR+i90v3rvSQvrOAnaudM5SHliDBNc1EI
 VmCP5f5NOzP3OYTvGJM2Mvk7ggMMN0xPQ5Ax9dSbxM9i2qI11aNw9lTLBL8+3uF6k+IGmf
 D8ak4niDnZsyHe0ONKaWphhUcG1i2Lc=
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-245-Dvfw41bpPV-CYfausm6A0w-1; Wed, 01 Jun 2022 04:00:54 -0400
X-MC-Unique: Dvfw41bpPV-CYfausm6A0w-1
Received: by mail-wr1-f70.google.com with SMTP id
 f6-20020a5d5686000000b0020ffb1157f4so102487wrv.9
 for <qemu-devel@nongnu.org>; Wed, 01 Jun 2022 01:00:53 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=Aj7SEq/+8A/upQ3HHJMYSDggfy+gpVpZpGyNgHhO+nE=;
 b=Ej1H+HXmtfazR2Xs7E144RIQqInM/usQ0E2Svrwve0bBrXpeCZde0PKBlkodxMMgQf
 6eG83okWvUyPv/EdJlNTcpUPSoWfd3OLUn3TyzLdPJQSX8w7LueiTMRKGjvGlZcwcA3b
 a0yAM7GQkW9WK753yA6AfNbE7agUBt+oheuTxmCFHFo4pEANLU6hTj2Mk+wQkGzjib+T
 0R+8d2ML/RXxkaWh5BLBxiOOsZFOyAb3R+gdwcBohCiBWIf7EumNyK+A/r0A0ZsNeIsX
 AZ84fHS8RVJmC+DNryl3BXhuY1wV/HKqRO0s+4kMD/zAmGJN/FeXWmrL/DFoRwjkkb6J
 GT5A==
X-Gm-Message-State: AOAM530Tow817MVsvNLBvc//K0z11ErzdT8apzaVsE2o0tBzP/PCPFxW
 sn1G4S5oLCuPM8gCmNddydg3Ne0n8RlsVxG+D5xO876ePUVIm6F2vTpVTYoNodiPepTAzHxlrzr
 iqEuHdnj2780epms=
X-Received: by 2002:a05:600c:3384:b0:397:6443:5343 with SMTP id
 o4-20020a05600c338400b0039764435343mr26335381wmp.124.1654070452964; 
 Wed, 01 Jun 2022 01:00:52 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwfMxSqk4XcBkPSAUIIVJ2bw6GH7NqCwsd62uNn5oraWIOk6eV1QRmODg75TW+6QX95p5neMw==
X-Received: by 2002:a05:600c:3384:b0:397:6443:5343 with SMTP id
 o4-20020a05600c338400b0039764435343mr26335360wmp.124.1654070452644; 
 Wed, 01 Jun 2022 01:00:52 -0700 (PDT)
Received: from ?IPV6:2003:cb:c705:2600:951d:63df:c091:3b45?
 (p200300cbc7052600951d63dfc0913b45.dip0.t-ipconnect.de.
 [2003:cb:c705:2600:951d:63df:c091:3b45])
 by smtp.gmail.com with ESMTPSA id
 o14-20020a05600c378e00b003974d0d981dsm4177167wmr.35.2022.06.01.01.00.51
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 01 Jun 2022 01:00:51 -0700 (PDT)
Message-ID: <0b54d6c7-f56d-1ad2-80b7-d75d1033d67e@redhat.com>
Date: Wed, 1 Jun 2022 10:00:50 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.0
Subject: Re: [RESEND PATCH] hw/dma: fix crash caused by race condition
Content-Language: en-US
To: Tong Zhang <ztong0001@gmail.com>
Cc: Tong Zhang <t.zhang2@samsung.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Peter Xu <peterx@redhat.com>, =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?=
 <f4bug@amsat.org>, "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>,
 Francisco Londono <f.londono@samsung.com>
References: <CGME20220427205118uscas1p25031437c0cdd4363c104be13033f366a@uscas1p2.samsung.com>
 <20220427205056.2522-1-t.zhang2@samsung.com>
 <b675b817-7b7c-06ee-b971-3df2d7374622@redhat.com>
 <CAA5qM4ARbFV_cc+R6R-q_mdv0hbmki5pK03U5XGYH7xfvEoOMQ@mail.gmail.com>
From: David Hildenbrand <david@redhat.com>
Organization: Red Hat
In-Reply-To: <CAA5qM4ARbFV_cc+R6R-q_mdv0hbmki5pK03U5XGYH7xfvEoOMQ@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=david@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 01.06.22 02:20, Tong Zhang wrote:
> Hi David,
> 
> On Mon, May 30, 2022 at 9:19 AM David Hildenbrand <david@redhat.com> wrote:
>>
>> On 27.04.22 22:51, Tong Zhang wrote:
>>> assert(dbs->acb) is meant to check the return value of io_func per
>>> documented in commit 6bee44ea34 ("dma: the passed io_func does not
>>> return NULL"). However, there is a chance that after calling
>>> aio_context_release(dbs->ctx); the dma_blk_cb function is called before
>>> the assertion and dbs->acb is set to NULL again at line 121. Thus when
>>> we run assert at line 181 it will fail.
>>>
>>>   softmmu/dma-helpers.c:181: dma_blk_cb: Assertion `dbs->acb' failed.
>>>
>>> Reported-by: Francisco Londono <f.londono@samsung.com>
>>> Signed-off-by: Tong Zhang <t.zhang2@samsung.com>
>>> ---
>>>  softmmu/dma-helpers.c | 2 +-
>>>  1 file changed, 1 insertion(+), 1 deletion(-)
>>>
>>> diff --git a/softmmu/dma-helpers.c b/softmmu/dma-helpers.c
>>> index 7820fec54c..cb81017928 100644
>>> --- a/softmmu/dma-helpers.c
>>> +++ b/softmmu/dma-helpers.c
>>> @@ -177,8 +177,8 @@ static void dma_blk_cb(void *opaque, int ret)
>>>      aio_context_acquire(dbs->ctx);
>>>      dbs->acb = dbs->io_func(dbs->offset, &dbs->iov,
>>>                              dma_blk_cb, dbs, dbs->io_func_opaque);
>>> -    aio_context_release(dbs->ctx);
>>>      assert(dbs->acb);
>>> +    aio_context_release(dbs->ctx);
>>>  }
>>>
>>>  static void dma_aio_cancel(BlockAIOCB *acb)
>>
>> I'm fairly new to that code, but I wonder what prevents dma_blk_cb() to
>> run after you reshuffled the code?
>>
> 
> IMO if the assert is to test whether io_func returns a non-NULL value
> shouldn't it be immediately after calling io_func.
> Also... as suggested by commit 6bee44ea346aed24e12d525daf10542d695508db
>   >     dma: the passed io_func does not return NULL

Yes, but I just don't see how it would fix the assertion you document in
the patch description. The locking change to fix the assertion doesn't
make any sense to me, and most probably I am missing something important :)

-- 
Thanks,

David / dhildenb


