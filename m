Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D79EA4814C0
	for <lists+qemu-devel@lfdr.de>; Wed, 29 Dec 2021 16:47:32 +0100 (CET)
Received: from localhost ([::1]:45862 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n2bAp-0005ZA-D8
	for lists+qemu-devel@lfdr.de; Wed, 29 Dec 2021 10:47:31 -0500
Received: from eggs.gnu.org ([209.51.188.92]:53518)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1n2b8A-0003zF-8d
 for qemu-devel@nongnu.org; Wed, 29 Dec 2021 10:44:47 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:26663)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1n2b88-0003uG-0x
 for qemu-devel@nongnu.org; Wed, 29 Dec 2021 10:44:45 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1640792683;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=mExkZsv9A8Q1n0goSpSfiwDto8PAAQAk5+cxpi3m8w0=;
 b=McgZES88/FPYsXhEV0/it5opjD8/uVRPmaqkmU6nriTKU3b5UxOY1v2GMtNYmxDjZtrht1
 03wakAuug5ObPQ1TQz8TMZYZPofY5ktKFahXCRfKcz4vLWx9NZ9THi43l9+KH9YjOjiGzv
 SR2zuqtjIrVbwMAVzFmKxGm+DQ98/q8=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-573-UUJuSwGPMQSFv5tSdfyJ-g-1; Wed, 29 Dec 2021 10:44:40 -0500
X-MC-Unique: UUJuSwGPMQSFv5tSdfyJ-g-1
Received: by mail-wm1-f72.google.com with SMTP id
 v190-20020a1cacc7000000b003456d598510so12558681wme.6
 for <qemu-devel@nongnu.org>; Wed, 29 Dec 2021 07:44:39 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=mExkZsv9A8Q1n0goSpSfiwDto8PAAQAk5+cxpi3m8w0=;
 b=6SWyzULq149vSPPM/yIyqqZfZJn4eP02gW2mTai+rhFFPVc1LAiQ6dgn8urEr/QahS
 Imgk0+B5zkxaxLbLmbzz+CdRB4lsqAO03uEvwdq8bgwh9SQZ7Q24lIw1Qn/Uw5ny0pOu
 3XrfBXaAJOWoF6NDTGl45SicSPK+D/IAGLVKoTvKlmr/Y9OgPqvOQXjX37OqSqrubxpJ
 b+u3EHyxXIhAoHt+4rjZPV4ZfWK+3eRopOp9qI0HYWfT3JR/YbxjzgPoFsWI/8S383xr
 wSzfz59NAJSITeDuxkOpGvjj56LyKKXQdfFNTgDCtKB/PtqrxsKCsoM2wqJYAW2ateXS
 22Zw==
X-Gm-Message-State: AOAM530nuIVeiuCG6fxGNm9qnXrV72E+heS+MvcLHDPaBlGHtod8lod0
 LAGP8sBq2QbV8Mve1YwI6K+1+qflNHjeJRFKipKzinLDJLxuAXPQblHR1BWxYCW1xq/yG3U2ZWr
 cUl+gWvYa8xGyFoU=
X-Received: by 2002:a1c:f609:: with SMTP id w9mr22389561wmc.99.1640792678849; 
 Wed, 29 Dec 2021 07:44:38 -0800 (PST)
X-Google-Smtp-Source: ABdhPJye3kzZ41uro3usAM9yyR8kpAMxM01qHvzCNQT0ydIa3a9mrqlh3swdbZSakzr3BGqbOh9LIQ==
X-Received: by 2002:a1c:f609:: with SMTP id w9mr22389535wmc.99.1640792678590; 
 Wed, 29 Dec 2021 07:44:38 -0800 (PST)
Received: from [192.168.1.16] (adijon-655-1-69-27.w90-13.abo.wanadoo.fr.
 [90.13.240.27])
 by smtp.gmail.com with ESMTPSA id z11sm27506670wmf.9.2021.12.29.07.44.33
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 29 Dec 2021 07:44:37 -0800 (PST)
Message-ID: <e93b2162-fbab-dd03-ab80-9b8564c0c8c8@redhat.com>
Date: Wed, 29 Dec 2021 16:44:30 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.4.0
Subject: Re: [PATCH v5 02/14] hw/core/machine: Introduce CPU cluster topology
 support
To: "wangyanan (Y)" <wangyanan55@huawei.com>, qemu-devel@nongnu.org,
 qemu-arm@nongnu.org
References: <20211228092221.21068-1-wangyanan55@huawei.com>
 <20211228092221.21068-3-wangyanan55@huawei.com>
 <fa7f67b2-ca1d-bd95-1a33-534a50b2d4c8@redhat.com>
 <2248a06d-7c3d-2ee3-e683-901d9bcbec02@huawei.com>
 <084c5004-6eb6-9952-0d9c-6ae3dc69aca0@redhat.com>
 <4efc3a6e-4077-86fb-2d11-5e15fe6ad886@huawei.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
In-Reply-To: <4efc3a6e-4077-86fb-2d11-5e15fe6ad886@huawei.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -44
X-Spam_score: -4.5
X-Spam_bar: ----
X-Spam_report: (-4.5 / 5.0 requ) DKIMWL_WL_HIGH=-0.573, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-3.024,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: Eduardo Habkost <eduardo@habkost.net>,
 Peter Maydell <peter.maydell@linaro.org>, Andrew Jones <drjones@redhat.com>,
 "Michael S . Tsirkin" <mst@redhat.com>, wanghaibin.wang@huawei.com,
 Markus Armbruster <armbru@redhat.com>, Shannon Zhao <shannon.zhaosl@gmail.com>,
 Igor Mammedov <imammedo@redhat.com>, Ani Sinha <ani@anisinha.ca>,
 Paolo Bonzini <pbonzini@redhat.com>, Eric Blake <eblake@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 12/29/21 14:04, wangyanan (Y) wrote:
> 
> On 2021/12/29 18:44, Philippe Mathieu-Daudé wrote:
>> On 12/29/21 04:48, wangyanan (Y) wrote:
>>> Hi Philippe,
>>> Thanks for your review.
>>>
>>> On 2021/12/29 3:17, Philippe Mathieu-Daudé wrote:
>>>> Hi,
>>>>
>>>> On 12/28/21 10:22, Yanan Wang wrote:
>>>>> The new Cluster-Aware Scheduling support has landed in Linux 5.16,
>>>>> which has been proved to benefit the scheduling performance (e.g.
>>>>> load balance and wake_affine strategy) on both x86_64 and AArch64.
>>>>>
>>>>> So now in Linux 5.16 we have four-level arch-neutral CPU topology
>>>>> definition like below and a new scheduler level for clusters.
>>>>> struct cpu_topology {
>>>>>       int thread_id;
>>>>>       int core_id;
>>>>>       int cluster_id;
>>>>>       int package_id;
>>>>>       int llc_id;
>>>>>       cpumask_t thread_sibling;
>>>>>       cpumask_t core_sibling;
>>>>>       cpumask_t cluster_sibling;
>>>>>       cpumask_t llc_sibling;
>>>>> }
>>>>>
>>>>> A cluster generally means a group of CPU cores which share L2 cache
>>>>> or other mid-level resources, and it is the shared resources that
>>>>> is used to improve scheduler's behavior. From the point of view of
>>>>> the size range, it's between CPU die and CPU core. For example, on
>>>>> some ARM64 Kunpeng servers, we have 6 clusters in each NUMA node,
>>>>> and 4 CPU cores in each cluster. The 4 CPU cores share a separate
>>>>> L2 cache and a L3 cache tag, which brings cache affinity advantage.
>>>>>
>>>>> In virtualization, on the Hosts which have pClusters, if we can
>>>> Maybe [*] -> reference to pClusters?
>>> Hm, I'm not sure what kind of reference is appropriate here.
>> So I guess the confusion comes from a simple typo =)
> I tried to mean "physical clusters" on host by pClusters, on the contrary
> to "virtual clusters" on guest. But obviously it brings confusion.

OK, I got confused because you don't use "vClusters".

>> Is it OK if I replace "pClusters" by "Clusters"?
> Sure, it's clearer to just use "clusters", please do that.

OK.


