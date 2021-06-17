Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A73B73ABAA0
	for <lists+qemu-devel@lfdr.de>; Thu, 17 Jun 2021 19:28:18 +0200 (CEST)
Received: from localhost ([::1]:44034 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ltvoP-0003qc-P0
	for lists+qemu-devel@lfdr.de; Thu, 17 Jun 2021 13:28:17 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34424)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1ltvnE-0002rR-L6
 for qemu-devel@nongnu.org; Thu, 17 Jun 2021 13:27:04 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:35588)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1ltvnB-0007ae-Or
 for qemu-devel@nongnu.org; Thu, 17 Jun 2021 13:27:04 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1623950820;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=l5MN8i8PvFoG4wEnUmI1mqrKy4BZiNYApUw5lxeGRVQ=;
 b=E5By5zO+54expxFyvPqjb6esMXjxWky3pUYAE3cImVj8/E9b2HrvpVY+SEEu0evThYUCIu
 LHSemHRAlDXdNum4M0NCnPN3s8v3cNHNpiAdxFOpwWFWy0/52qSGHpUxmbTXDj8U+cnb2H
 rUqGc5fmfX/bZmmPpavlBdCtR5wCfRg=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-152-1sqardP-Msut7E5OXMwvZA-1; Thu, 17 Jun 2021 13:26:59 -0400
X-MC-Unique: 1sqardP-Msut7E5OXMwvZA-1
Received: by mail-wm1-f69.google.com with SMTP id
 m6-20020a7bce060000b02901d2a0c361bfso1430510wmc.4
 for <qemu-devel@nongnu.org>; Thu, 17 Jun 2021 10:26:59 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=l5MN8i8PvFoG4wEnUmI1mqrKy4BZiNYApUw5lxeGRVQ=;
 b=oG4uBASAjm64KnIaegzHEAej9s2teLm/QGbMqabWlfdKwLaa8tlqRvn+6B9Yd4dhmG
 +NiSBTZN/Wv1Aqpyf3Aqm5DoGFw7UZ+SzHKwg9zPdG/ToC9q4ErxAVyWFNAdBBJV1rxD
 IBOMHvyh6PH4vq4IgknkmhSwMpts0YU2XivKy1mki96a7dpZqpBey1f9ciSQXViB/28X
 mzgtb0UKA7vFieXonlGDrKVFu9aE3h+ThHAPofaX63vXc5WabJ7CTKdfEAVkn6RRZ0dS
 DU/ZiduhdrSB9Oh1jnzOdYxt7JzD6lyf5MCDkVqaIXGaqnArVrsCgZHaoE2VSx3mltdF
 nYZQ==
X-Gm-Message-State: AOAM531E5v8sQcr0XzFOjcU/3x1SgGurnIIpQI0t7N+X5ANru7W2LLYB
 99uGN+eVgf6S491h29cjTkK3rbsc9vhLAQuy+DlFJthoZ8mlw0zgeJt4OTgOS2G1hwsOd8bss4I
 GguFARJ9rlo3X3ao=
X-Received: by 2002:a05:600c:3b1e:: with SMTP id
 m30mr6430010wms.101.1623950818180; 
 Thu, 17 Jun 2021 10:26:58 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxxoiaCgwgdNuOpv8LL/MGCY6pHzI1/2DE88GgS4SiAdweqAJael/QD46sfnjRg2kckqmtJ5Q==
X-Received: by 2002:a05:600c:3b1e:: with SMTP id
 m30mr6429974wms.101.1623950817879; 
 Thu, 17 Jun 2021 10:26:57 -0700 (PDT)
Received: from [192.168.1.36] (93.red-83-35-24.dynamicip.rima-tde.net.
 [83.35.24.93])
 by smtp.gmail.com with ESMTPSA id p5sm6563297wrd.25.2021.06.17.10.26.55
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 17 Jun 2021 10:26:57 -0700 (PDT)
Subject: Re: [PATCH] block/nvme: Fix VFIO_MAP_DMA failed: No space left on
 device
To: Maxim Levitsky <mlevitsk@redhat.com>, qemu-devel@nongnu.org,
 Alex Williamson <alex.williamson@redhat.com>,
 Eric Auger <eric.auger@redhat.com>
References: <20210611114606.320008-1-philmd@redhat.com>
 <cb271128-faa2-c557-128f-4ec1133667b8@redhat.com>
 <4b6b6f1b7a97d4b7fd2008fd31c6c2121ba053fb.camel@redhat.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Message-ID: <48bfbc56-f2c0-daf2-5e1e-7df17192ca0c@redhat.com>
Date: Thu, 17 Jun 2021 17:48:46 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.1
MIME-Version: 1.0
In-Reply-To: <4b6b6f1b7a97d4b7fd2008fd31c6c2121ba053fb.camel@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.197,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.254, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001,
 RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
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
Cc: Fam Zheng <fam@euphon.net>, Kevin Wolf <kwolf@redhat.com>,
 qemu-block@nongnu.org,
 =?UTF-8?B?TWljaGFsIFByw612b3puw61r?= <mprivozn@redhat.com>,
 qemu-stable@nongnu.org, Max Reitz <mreitz@redhat.com>,
 Stefan Hajnoczi <stefanha@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 6/17/21 2:40 PM, Maxim Levitsky wrote:
> On Mon, 2021-06-14 at 18:03 +0200, Philippe Mathieu-Daudé wrote:
>> On 6/11/21 1:46 PM, Philippe Mathieu-Daudé wrote:
>>> When the NVMe block driver was introduced (see commit bdd6a90a9e5,
>>> January 2018), Linux VFIO_IOMMU_MAP_DMA ioctl was only returning
>>> -ENOMEM in case of error. The driver was correctly handling the
>>> error path to recycle its volatile IOVA mappings.
>>>
>>> To fix CVE-2019-3882, Linux commit 492855939bdb ("vfio/type1: Limit
>>> DMA mappings per container", April 2019) added the -ENOSPC error to
>>> signal the user exhausted the DMA mappings available for a container.
>>
>> Hmm this commit has been added before v5.1-rc4.
>>
>> So while this fixes the behavior of v5.1-rc4+ kernels,
>> older kernels using this fix will have the same problem...
> 
> 
> Hi!
> 
> I wonder why not to check for both -ENOMEM and -ENOSPC
> and recycle the mappings in both cases?
> 
> I think that would work on both old and new kernels.
> 
> What do you think?

Yes, worst case we retry one more time for nothing.

Alex suggested to use VFIO_IOMMU_GET_INFO to get the limit
with VFIO_IOMMU_TYPE1_INFO_DMA_AVAIL, and if not available
the driver should use a reasonable value to limit itself.

I'll try to get it quick, otherwise fall back to your "dual
errno" case.

Thanks both for the ideas,

Phil.

>>> diff --git a/block/nvme.c b/block/nvme.c
>>> index 2b5421e7aa6..12f9dd5cce3 100644
>>> --- a/block/nvme.c
>>> +++ b/block/nvme.c
>>> @@ -1030,7 +1030,7 @@ try_map:
>>>          r = qemu_vfio_dma_map(s->vfio,
>>>                                qiov->iov[i].iov_base,
>>>                                len, true, &iova);
>>> -        if (r == -ENOMEM && retry) {
>>> +        if (r == -ENOSPC && retry) {
>>>              retry = false;
>>>              trace_nvme_dma_flush_queue_wait(s);
>>>              if (s->dma_map_count) {
>>>


