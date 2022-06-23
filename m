Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id EF509557807
	for <lists+qemu-devel@lfdr.de>; Thu, 23 Jun 2022 12:39:59 +0200 (CEST)
Received: from localhost ([::1]:55772 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o4KFi-0002kP-Ds
	for lists+qemu-devel@lfdr.de; Thu, 23 Jun 2022 06:39:58 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45660)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eric.auger@redhat.com>)
 id 1o4J98-0000yC-Pr
 for qemu-devel@nongnu.org; Thu, 23 Jun 2022 05:29:07 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:59460)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eric.auger@redhat.com>)
 id 1o4J97-00052H-8S
 for qemu-devel@nongnu.org; Thu, 23 Jun 2022 05:29:06 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1655976543;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=wIHZoaJWLw06QfqjCrmaoBk4WrCTBU1Gd9mxYYTXFIo=;
 b=JD72Q8Ht9W8/m7sUqH7EQtyoPNFBTNnbBwhP4zaCiGjtYHXrVeRTF6pI0BnwhQYet4/11J
 gdnGKw9l9Ghxj9jo4/F5x0+jiJ3oqn3Korqr7ABj0uKiIkUxx5hWA+jz9OcLwxQz9l2HpL
 Nr0U0NqoMJEkkSeoSVu8uGFicB4eMIc=
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com
 [209.85.222.200]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-642-6LTGUwK-NuyMP-zTsRm6cw-1; Thu, 23 Jun 2022 05:29:02 -0400
X-MC-Unique: 6LTGUwK-NuyMP-zTsRm6cw-1
Received: by mail-qk1-f200.google.com with SMTP id
 w22-20020a05620a445600b006a6c18678f2so22853573qkp.4
 for <qemu-devel@nongnu.org>; Thu, 23 Jun 2022 02:29:01 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:reply-to
 :subject:content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=wIHZoaJWLw06QfqjCrmaoBk4WrCTBU1Gd9mxYYTXFIo=;
 b=x0f2A8oqF91cwz45tnfrjIHf7j+JfB9fP5P53VUMgdNEWHxVUrFZfbsQyfDnDWIBMC
 UCTptkf3XljM/GNOw/AZjm29L0aJaNm1mYUz806IRbZmHeItYvi8aFGpMX3pE3j2qmXg
 gEPvR6kWVWLlnqvkX1SIkBqvXASMUeqXHuaIPIZQ/kKTxXCpIjefIFtOf3h2A7wAs0tq
 rX4E9zdE4N8qZ6SdHuu6GsC2gJe4zmr2R032kgAdU9bVv0tCFDY6yOB7GtIc3MbmHw7q
 bpCFW6QKZu81ydyroKgDSdnVh7nFgMxASi5klGP1pQ4dtyB8NEUhImqRgsXIonf+AfHJ
 XtzQ==
X-Gm-Message-State: AJIora/dKUup1IK6ecBCQs6wCCj2v1L9s11eub88mVNhwpu4df8UMxZf
 HOiS/nGXSTtdaJb52KFKdrnVP/qwtyJmXH0kTnYiA+Vx9HFEv5/h8bwTQofjmbwZdS8yHjBK47A
 MRgVw0B2m+ySiYLk=
X-Received: by 2002:a05:620a:4548:b0:6a7:5e8c:b7be with SMTP id
 u8-20020a05620a454800b006a75e8cb7bemr5443201qkp.423.1655976541568; 
 Thu, 23 Jun 2022 02:29:01 -0700 (PDT)
X-Google-Smtp-Source: AGRyM1vCXrGOGZP/dEYDHSldofS2EDOheKeo8YM5IJyveqW8CuP3h3L/J2dUpVa8Z2AZEb4GerqHgA==
X-Received: by 2002:a05:620a:4548:b0:6a7:5e8c:b7be with SMTP id
 u8-20020a05620a454800b006a75e8cb7bemr5443194qkp.423.1655976541361; 
 Thu, 23 Jun 2022 02:29:01 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:59e:9d80:527b:9dff:feef:3874?
 ([2a01:e0a:59e:9d80:527b:9dff:feef:3874])
 by smtp.gmail.com with ESMTPSA id
 v11-20020a05620a440b00b006a6a7b4e7besm19801110qkp.109.2022.06.23.02.28.59
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 23 Jun 2022 02:29:00 -0700 (PDT)
Message-ID: <590df33d-fea4-927b-e3c8-2567ac5c5e99@redhat.com>
Date: Thu, 23 Jun 2022 11:28:57 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.0
Subject: Re: [PATCH v2] virtio-iommu: Fix the partial copy of probe request
Content-Language: en-US
To: Jean-Philippe Brucker <jean-philippe@linaro.org>,
 "Duan, Zhenzhong" <zhenzhong.duan@intel.com>
Cc: "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>,
 "mst@redhat.com" <mst@redhat.com>
References: <20220617062024.3168331-1-zhenzhong.duan@intel.com>
 <0f4f26de-1402-5c3a-9903-389fef9b234f@redhat.com> <YrMDMzfXAiEgFU+d@myrica>
 <5471e06f-b1f2-d582-3558-b775af72a0fd@redhat.com> <YrMf7I8mFGVyt9fS@myrica>
 <MWHPR1101MB2110E6A7F68546E2232E5A5E92B59@MWHPR1101MB2110.namprd11.prod.outlook.com>
 <YrQnIfNpOIhmMPKS@myrica>
From: Eric Auger <eric.auger@redhat.com>
In-Reply-To: <YrQnIfNpOIhmMPKS@myrica>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.133.124;
 envelope-from=eric.auger@redhat.com; helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001,
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
Reply-To: eric.auger@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>



On 6/23/22 10:41, Jean-Philippe Brucker wrote:
> On Thu, Jun 23, 2022 at 01:40:58AM +0000, Duan, Zhenzhong wrote:
>>
>>> -----Original Message-----
>>> From: Jean-Philippe Brucker <jean-philippe@linaro.org>
>>> Sent: Wednesday, June 22, 2022 9:58 PM
>>> To: Eric Auger <eric.auger@redhat.com>
>>> Cc: Duan, Zhenzhong <zhenzhong.duan@intel.com>; qemu-
>>> devel@nongnu.org; mst@redhat.com
>>> Subject: Re: [PATCH v2] virtio-iommu: Fix the partial copy of probe request
>>>
>>> On Wed, Jun 22, 2022 at 02:22:18PM +0200, Eric Auger wrote:
>>>>>> the spec is pretty confusing here though (virtio-v1.2-csd01.pdf) as
>>>>>> it presents the struct as follows:
>>>>>>
>>>>>> struct virtio_iommu_req_probe {
>>>>>> struct virtio_iommu_req_head head;
>>>>>> /* Device-readable */
>>>>>> le32 endpoint;
>>>>>> u8 reserved[64];
>>>>>>
>>>>>> /* Device-writable */
>>>>>> u8 properties[probe_size];
>>>>>> struct virtio_iommu_req_tail tail;
>>>>>> };
>>>>> Hm, which part is confusing?  Yes it's not valid C since probe_size
>>>>> is defined dynamically ('probe_size' in the device config), but I
>>>>> thought it would be nicer to show the whole request layout this way.
>>>>> Besides, at least virtio-blk and virtio-scsi have similar
>>>>> variable-sized arrays in their definitions
>>>> the fact "struct virtio_iommu_req_tail tail;" was part of the
>>>>
>>>> virtio_iommu_req_probe struct
>>> Right, it would have been better to use a different name than
>>> virtio_iommu_req_probe in virtio_iommu.h, to make the pitfall clear.
>>>
>> Maybe virtio_iommu_req_probe_no_tail?
> Yes, we can't change the probe struct anymore since it's API, but we could
> use the no_tail prefix on future structs

agreed

Eric
>
> Thanks,
> Jean
>


