Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DFE2C635220
	for <lists+qemu-devel@lfdr.de>; Wed, 23 Nov 2022 09:19:33 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1oxkyA-0006Bm-3Q; Wed, 23 Nov 2022 03:18:58 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eric.auger@redhat.com>)
 id 1oxky1-0006BV-PI
 for qemu-devel@nongnu.org; Wed, 23 Nov 2022 03:18:51 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eric.auger@redhat.com>)
 id 1oxkxz-0006Nt-Ud
 for qemu-devel@nongnu.org; Wed, 23 Nov 2022 03:18:49 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1669191525;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=O/vgjbzZYu3CJF3JdxYm6qh3H2Zvxpr2OTHKK0YIZoA=;
 b=E4DU9AnFLchxaLN5+YakW9+8ShJNZJ3BhIa6TmPKAZvFOvCRxIG5sHrCqmL4y7/kSP5cXN
 NeBvKzVDaRJG6SBUyDiSh/+DygEdXKizy9viKwQtga1AfWFoDYfgQZdRo5HXClsOAGMqpX
 M5266KZGWUB0QwK9U0TgwJWigUC/XcM=
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com
 [209.85.222.198]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-381-dN0qSr6VN4WgQcVZtbzu9g-1; Wed, 23 Nov 2022 03:18:44 -0500
X-MC-Unique: dN0qSr6VN4WgQcVZtbzu9g-1
Received: by mail-qk1-f198.google.com with SMTP id
 az31-20020a05620a171f00b006fa2cc1b0bfso21899263qkb.23
 for <qemu-devel@nongnu.org>; Wed, 23 Nov 2022 00:18:44 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:reply-to:user-agent:mime-version:date
 :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=O/vgjbzZYu3CJF3JdxYm6qh3H2Zvxpr2OTHKK0YIZoA=;
 b=37oz0xOK0SE8IH/cSpGvvCVjRbbX5tRTsiiov+FqY4FbLm5uz57pE/CbmjtLsAY3Hs
 ULqu0G9CeCKNAW79JwS/5uVx0xchnBTwLrKNRNV8weu4sqtcYisPa5PY0HjPRUPtte7M
 fPS2/L0KqvPr0EJcsKelauEHh+yLG9/PdqBz8P9gdoI3p4znporz9Zeh59Kg+eR7lfTT
 IXOm4SiT9gp+0SgMN9s5kP4L8ttp5tL3EZQq0UgCvLihhxtJZyf/0+9r4S8r6Q8kCdst
 e09VNcgNYi5BFQv90j8dnjCNeAZDSlsoc7POirvNDQ4qg6mT+6oRTJEoERYQjymoAJgI
 RwWw==
X-Gm-Message-State: ANoB5pka63szd5r3HHW2xPwFobXvF2BGZ31vCqe+EzSBYmI7qhoUcwS1
 IONvPg6loddiDtJitxh1RiDGgQ1io76clJe+Sf/tzVACspABMT6D2Tg4zlEDyLG9x8sLgFdTtca
 7McyvPUx0d/q21X8=
X-Received: by 2002:ac8:7595:0:b0:3a5:226e:2677 with SMTP id
 s21-20020ac87595000000b003a5226e2677mr25571891qtq.141.1669191523746; 
 Wed, 23 Nov 2022 00:18:43 -0800 (PST)
X-Google-Smtp-Source: AA0mqf59064oNz4feUk1LqCfo1Q5JaUf3toHzz/ZHoa1ZlAqclVrJjLgYc4IeAUcv0Q/HAG4myF+UQ==
X-Received: by 2002:ac8:7595:0:b0:3a5:226e:2677 with SMTP id
 s21-20020ac87595000000b003a5226e2677mr25571884qtq.141.1669191523508; 
 Wed, 23 Nov 2022 00:18:43 -0800 (PST)
Received: from ?IPV6:2a01:e0a:59e:9d80:527b:9dff:feef:3874?
 ([2a01:e0a:59e:9d80:527b:9dff:feef:3874])
 by smtp.gmail.com with ESMTPSA id
 t8-20020a37ea08000000b006b9c9b7db8bsm11693821qkj.82.2022.11.23.00.18.41
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 23 Nov 2022 00:18:42 -0800 (PST)
Message-ID: <45e916e5-9297-a8e4-c539-123e0ee6347c@redhat.com>
Date: Wed, 23 Nov 2022 09:18:39 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.3.1
Subject: Re: [PATCH v5 1/2] sysemu: tpm: Add a stub function for TPM_IS_CRB
Content-Language: en-US
To: "Michael S. Tsirkin" <mst@redhat.com>,
 Stefan Berger <stefanb@linux.ibm.com>
Cc: eric.auger.pro@gmail.com, qemu-devel@nongnu.org,
 alex.williamson@redhat.com, stefanb@linux.vnet.ibm.com, cohuck@redhat.com,
 f4bug@amsat.org
References: <20220506132510.1847942-1-eric.auger@redhat.com>
 <20220506132510.1847942-2-eric.auger@redhat.com>
 <96940f79-a6e0-d14f-5d74-abe280846f26@linux.ibm.com>
 <20221123013441-mutt-send-email-mst@kernel.org>
From: Eric Auger <eric.auger@redhat.com>
In-Reply-To: <20221123013441-mutt-send-email-mst@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.129.124;
 envelope-from=eric.auger@redhat.com; helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001,
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

Hi,

On 11/23/22 07:36, Michael S. Tsirkin wrote:
> On Fri, May 06, 2022 at 09:47:52AM -0400, Stefan Berger wrote:
>>
>> On 5/6/22 09:25, Eric Auger wrote:
>>> In a subsequent patch, VFIO will need to recognize if
>>> a memory region owner is a TPM CRB device. Hence VFIO
>>> needs to use TPM_IS_CRB() even if CONFIG_TPM is unset. So
>>> let's add a stub function.
>>>
>>> Signed-off-by: Eric Auger <eric.auger@redhat.com>
>>> Suggested-by: Cornelia Huck <cohuck@redhat.com>
>> Reviewed-by: Stefan Berger <stefanb@linnux.ibm.com>
> ... and now in 7.2 vdpa needs a dependency on tpm too, what a hack :(
> And what exactly is it about TPM CRB that everyone needs to
> know about it and skip it? The API does not tell ...
An excerpt of one reply I made at that time:

The spec (CG PC Client Platform TPM Profile (PTP)
    Specification Family “2.0” Level 00 Revision 01.03 v22, page 100) 
says that the command/response data "may be defined as large as 3968",
which is (0x1000 - 0x80), 0x80 being the size of the control struct.
so the size of the region logically is less than a 4kB page, hence our
trouble.

We learnt in the past Windows driver has some stronger expectation wrt
memory mapping. I don't know if those latter would work if we were to
enlarge the window by some tricks.

https://trustedcomputinggroup.org/wp-content/uploads/Mobile-Command-Response-Buffer-Interface-v2-r12-Specification_FINAL2.pdf
says

"
Including the control structure, the three memory areas comprise the
entirety of the CRB. There are no constraints on how those three memory
areas are provided. They can all be in system RAM, or all be in device
memory, or any combination.

Thanks

Eric

>
>>> ---
>>>   include/sysemu/tpm.h | 6 ++++++
>>>   1 file changed, 6 insertions(+)
>>>
>>> diff --git a/include/sysemu/tpm.h b/include/sysemu/tpm.h
>>> index 68b2206463c..fb40e30ff60 100644
>>> --- a/include/sysemu/tpm.h
>>> +++ b/include/sysemu/tpm.h
>>> @@ -80,6 +80,12 @@ static inline TPMVersion tpm_get_version(TPMIf *ti)
>>>   #define tpm_init()  (0)
>>>   #define tpm_cleanup()
>>>
>>> +/* needed for an alignment check in non-tpm code */
>>> +static inline Object *TPM_IS_CRB(Object *obj)
>>> +{
>>> +     return NULL;
>>> +}
>>> +
>>>   #endif /* CONFIG_TPM */
>>>
>>>   #endif /* QEMU_TPM_H */
>>


