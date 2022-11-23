Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 24FB1635EC7
	for <lists+qemu-devel@lfdr.de>; Wed, 23 Nov 2022 14:03:12 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1oxpNu-00044E-Vw; Wed, 23 Nov 2022 08:01:51 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eric.auger@redhat.com>)
 id 1oxpNn-00041u-3Q
 for qemu-devel@nongnu.org; Wed, 23 Nov 2022 08:01:43 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eric.auger@redhat.com>)
 id 1oxpNk-0006MW-Nz
 for qemu-devel@nongnu.org; Wed, 23 Nov 2022 08:01:42 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1669208499;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=6BvZmPjY8g15kSz6zUovXjT6vx7wUsXgjd0D9Rjd4EE=;
 b=KSncVqQneWtDew1WdR71zSg0u2hHbyfAdlSgOqXtKCh7F6IZEy2s8r5DJRkdd7/PdNGfAc
 rTIzqs5oUnzvqKbntiFNz5R0kyPlPthbPHoVkTYjE05yNM95tvpCoIRgBZMTSJnjvuqFJ3
 31RqT1oqCPmK76aggvgw/QCZEqBn/GE=
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com
 [209.85.222.198]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-453-bR6edlXwNO-iQfhyIejRLQ-1; Wed, 23 Nov 2022 08:01:38 -0500
X-MC-Unique: bR6edlXwNO-iQfhyIejRLQ-1
Received: by mail-qk1-f198.google.com with SMTP id
 j13-20020a05620a410d00b006e08208eb31so22390015qko.3
 for <qemu-devel@nongnu.org>; Wed, 23 Nov 2022 05:01:37 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:reply-to:user-agent:mime-version:date
 :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=6BvZmPjY8g15kSz6zUovXjT6vx7wUsXgjd0D9Rjd4EE=;
 b=EhZm/LDm2feBluT5feyD4/OAOI93hFpXvqkKTZEG6BbGa3DsHkUO5Jdpy33CVnUeSC
 P/xsc+COkKZJr/cufXMzrwFhzW9sRquzS+Po7k0lMy5oP0o7Kv+Aj029B5KJjYfhrtaU
 Jp5zpwE/PAaQWIIgu9yZZigWBhENaRsVKbO9tf8ZfK8FkHAeYnaMlurtuyHttvQD22Zy
 NEMtXdL4qCv+Kvis7MAqmm6RKB/HpmYq8eu+xTl95VYeQw+Y0QluJoopXwCVciMTdEmA
 kLl3P8GMgwC+nVrYzLI9HZAr8v5D7fMkntIkSwLHCkvx4+8KVvibgTLY6ztzzHU+fFSi
 7chg==
X-Gm-Message-State: ANoB5pl5M0fxZOR39z59CvgUqXiOk3z012vfylfluFsSpCRFC51gWqQP
 2gSxqA5VnbfNpGgHO9dlUX0ZFovGggXFTSaPPvSHlYE/dgeSnrG0gf8EjwmcgDE0dOuFVcVtHyo
 KW+GZ/IHHJRA3T8c=
X-Received: by 2002:a0c:c790:0:b0:4c6:608c:6b2c with SMTP id
 k16-20020a0cc790000000b004c6608c6b2cmr7413794qvj.130.1669208497156; 
 Wed, 23 Nov 2022 05:01:37 -0800 (PST)
X-Google-Smtp-Source: AA0mqf6mL27p+MeMk97BOAwamy0YaDmmCchQMQtwo+xG9vmLloJLh4Mvw4dLDSOwV3/cih7hhNcyKQ==
X-Received: by 2002:a0c:c790:0:b0:4c6:608c:6b2c with SMTP id
 k16-20020a0cc790000000b004c6608c6b2cmr7413749qvj.130.1669208496548; 
 Wed, 23 Nov 2022 05:01:36 -0800 (PST)
Received: from ?IPV6:2a01:e0a:59e:9d80:527b:9dff:feef:3874?
 ([2a01:e0a:59e:9d80:527b:9dff:feef:3874])
 by smtp.gmail.com with ESMTPSA id
 q7-20020a05620a0d8700b006f8665f483fsm12256736qkl.85.2022.11.23.05.01.34
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 23 Nov 2022 05:01:35 -0800 (PST)
Message-ID: <2ba28eec-d205-d4de-2c48-6ff476ed5633@redhat.com>
Date: Wed, 23 Nov 2022 14:01:32 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.3.1
Subject: Re: [PATCH v5 1/2] sysemu: tpm: Add a stub function for TPM_IS_CRB
Content-Language: en-US
To: "Michael S. Tsirkin" <mst@redhat.com>
Cc: Stefan Berger <stefanb@linux.ibm.com>, eric.auger.pro@gmail.com,
 qemu-devel@nongnu.org, alex.williamson@redhat.com,
 stefanb@linux.vnet.ibm.com, cohuck@redhat.com, f4bug@amsat.org
References: <20220506132510.1847942-1-eric.auger@redhat.com>
 <20220506132510.1847942-2-eric.auger@redhat.com>
 <96940f79-a6e0-d14f-5d74-abe280846f26@linux.ibm.com>
 <20221123013441-mutt-send-email-mst@kernel.org>
 <45e916e5-9297-a8e4-c539-123e0ee6347c@redhat.com>
 <20221123043005-mutt-send-email-mst@kernel.org>
 <9ffcc26f-e3b2-77f1-5929-6c6caf1ea64d@redhat.com>
 <20221123062202-mutt-send-email-mst@kernel.org>
From: Eric Auger <eric.auger@redhat.com>
In-Reply-To: <20221123062202-mutt-send-email-mst@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.129.124;
 envelope-from=eric.auger@redhat.com; helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001,
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
Reply-To: eric.auger@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org



On 11/23/22 12:24, Michael S. Tsirkin wrote:
> On Wed, Nov 23, 2022 at 12:10:09PM +0100, Eric Auger wrote:
>>
>> On 11/23/22 10:30, Michael S. Tsirkin wrote:
>>> On Wed, Nov 23, 2022 at 09:18:39AM +0100, Eric Auger wrote:
>>>> Hi,
>>>>
>>>> On 11/23/22 07:36, Michael S. Tsirkin wrote:
>>>>> On Fri, May 06, 2022 at 09:47:52AM -0400, Stefan Berger wrote:
>>>>>> On 5/6/22 09:25, Eric Auger wrote:
>>>>>>> In a subsequent patch, VFIO will need to recognize if
>>>>>>> a memory region owner is a TPM CRB device. Hence VFIO
>>>>>>> needs to use TPM_IS_CRB() even if CONFIG_TPM is unset. So
>>>>>>> let's add a stub function.
>>>>>>>
>>>>>>> Signed-off-by: Eric Auger <eric.auger@redhat.com>
>>>>>>> Suggested-by: Cornelia Huck <cohuck@redhat.com>
>>>>>> Reviewed-by: Stefan Berger <stefanb@linnux.ibm.com>
>>>>> ... and now in 7.2 vdpa needs a dependency on tpm too, what a hack :(
>>>>> And what exactly is it about TPM CRB that everyone needs to
>>>>> know about it and skip it? The API does not tell ...
>>>> An excerpt of one reply I made at that time:
>>>>
>>>> The spec (CG PC Client Platform TPM Profile (PTP)
>>>>     Specification Family “2.0” Level 00 Revision 01.03 v22, page 100) 
>>>> says that the command/response data "may be defined as large as 3968",
>>>> which is (0x1000 - 0x80), 0x80 being the size of the control struct.
>>>> so the size of the region logically is less than a 4kB page, hence our
>>>> trouble.
>>>>
>>>> We learnt in the past Windows driver has some stronger expectation wrt
>>>> memory mapping. I don't know if those latter would work if we were to
>>>> enlarge the window by some tricks.
>>>>
>>>> https://trustedcomputinggroup.org/wp-content/uploads/Mobile-Command-Response-Buffer-Interface-v2-r12-Specification_FINAL2.pdf
>>>> says
>>>>
>>>> "
>>>> Including the control structure, the three memory areas comprise the
>>>> entirety of the CRB. There are no constraints on how those three memory
>>>> areas are provided. They can all be in system RAM, or all be in device
>>>> memory, or any combination.
>>>>
>>>> Thanks
>>>>
>>>> Eric
>>> So we put it in system RAM then? But why isn't DMA there allowed?
>> I don't think there is any need and since it violates the alignment
>> check in VFIO we discard the region from DMA mapped ones.
>>
>> Thanks
>>
>> Eric
> If that's all then we could just check alignment -
> why are we bothering with a tpm specific hack?
I think Alex prefered to avoid silently skipping the DMA mapping of a
region (a possible scenario may be invalid P2P DMA access?). Except if
we know this region can be safely ignored, which is the case for the TPM
CRB, hence this whitelist.

Eric


>
>
>>>>>>> ---
>>>>>>>   include/sysemu/tpm.h | 6 ++++++
>>>>>>>   1 file changed, 6 insertions(+)
>>>>>>>
>>>>>>> diff --git a/include/sysemu/tpm.h b/include/sysemu/tpm.h
>>>>>>> index 68b2206463c..fb40e30ff60 100644
>>>>>>> --- a/include/sysemu/tpm.h
>>>>>>> +++ b/include/sysemu/tpm.h
>>>>>>> @@ -80,6 +80,12 @@ static inline TPMVersion tpm_get_version(TPMIf *ti)
>>>>>>>   #define tpm_init()  (0)
>>>>>>>   #define tpm_cleanup()
>>>>>>>
>>>>>>> +/* needed for an alignment check in non-tpm code */
>>>>>>> +static inline Object *TPM_IS_CRB(Object *obj)
>>>>>>> +{
>>>>>>> +     return NULL;
>>>>>>> +}
>>>>>>> +
>>>>>>>   #endif /* CONFIG_TPM */
>>>>>>>
>>>>>>>   #endif /* QEMU_TPM_H */


