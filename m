Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E2B8A5549DD
	for <lists+qemu-devel@lfdr.de>; Wed, 22 Jun 2022 14:24:13 +0200 (CEST)
Received: from localhost ([::1]:53000 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o3zP2-0000jX-JF
	for lists+qemu-devel@lfdr.de; Wed, 22 Jun 2022 08:24:12 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44428)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eric.auger@redhat.com>)
 id 1o3zNP-00086u-7Q
 for qemu-devel@nongnu.org; Wed, 22 Jun 2022 08:22:31 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:21643)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eric.auger@redhat.com>)
 id 1o3zNJ-0005mn-DM
 for qemu-devel@nongnu.org; Wed, 22 Jun 2022 08:22:27 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1655900544;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=aNOR3YIgt8D/IDlztW1raA433owCyi9xu3obO3zScFw=;
 b=iSKBtKO785/LyZpP5hq1kWfEWDTBnQdWefnLCrNssxF78BE6nw7TGIi7iiKwbYz4vIXoTJ
 1yaDaKeBBKIAkMK259F5L3YD7PiYI3EaCdHPNuZdlHmMbs5dLg+Z7RlDb4lWgcO1K/qxU8
 7RPGSgNrj7uxy5Tp7iYvf04KM9YbE3g=
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com
 [209.85.222.198]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-76-ssM3jM-5NNyTseAswPp3NQ-1; Wed, 22 Jun 2022 08:22:22 -0400
X-MC-Unique: ssM3jM-5NNyTseAswPp3NQ-1
Received: by mail-qk1-f198.google.com with SMTP id
 r6-20020a05620a298600b006a98e988ba4so19741532qkp.3
 for <qemu-devel@nongnu.org>; Wed, 22 Jun 2022 05:22:22 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:reply-to
 :subject:content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=aNOR3YIgt8D/IDlztW1raA433owCyi9xu3obO3zScFw=;
 b=H1dzabTuGB24H0YlXsd65YfhaW9QWx7ZKrQCJb5hYqk+p855NVcawYYUTfmkamKK4L
 AU/j6Dh4UDZrgTOjmFvnafe4CpeLvFLgyDz0tYssRY2HhqKdljg9D9pCFjIHumbwolDM
 CDCm2DaYVmBO7TbikumuMacBaBHM4Xgy2esSCmFpyerugEgMsF8hvrQ3fp+hROa0kpAz
 xSfNp/MTh2E+ebAbOQ82+0qLK9niyoyMsBkZZUkygcOiEsbLBkdMnBqi1shoaGSniXCT
 hUprVJkcGJx1c7DqpxpIXMihd3cYra4aAKzb9LPr0O8+PDnfFFnu2hM09WSg/Cg7i+k/
 A5tQ==
X-Gm-Message-State: AJIora9RxJdetYhTrYCNN4i2HOC7bIYIzgb+847GCn+mB6ykPcNrDKQw
 wo7U2J2J8IfAyEpNJ89YIY3d8eZ8VuvwExbIkg9cKWyTjSo4K8CZfbTjjMgg67U+Cpr5Nzjzw7f
 f191dYxIXAXu9T3U=
X-Received: by 2002:a05:6214:769:b0:46e:6d8b:adbf with SMTP id
 f9-20020a056214076900b0046e6d8badbfmr27633953qvz.72.1655900542168; 
 Wed, 22 Jun 2022 05:22:22 -0700 (PDT)
X-Google-Smtp-Source: AGRyM1sZY5OIY92mndwjXZN5NZttovyp6zZhU67J1x0275TJC+2OhRZkGz/8COueIY0J+OJuBAlKVw==
X-Received: by 2002:a05:6214:769:b0:46e:6d8b:adbf with SMTP id
 f9-20020a056214076900b0046e6d8badbfmr27633923qvz.72.1655900541862; 
 Wed, 22 Jun 2022 05:22:21 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:59e:9d80:527b:9dff:feef:3874?
 ([2a01:e0a:59e:9d80:527b:9dff:feef:3874])
 by smtp.gmail.com with ESMTPSA id
 cf23-20020a05622a401700b00307cb34aa8asm11841349qtb.47.2022.06.22.05.22.20
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 22 Jun 2022 05:22:21 -0700 (PDT)
Message-ID: <5471e06f-b1f2-d582-3558-b775af72a0fd@redhat.com>
Date: Wed, 22 Jun 2022 14:22:18 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.0
Subject: Re: [PATCH v2] virtio-iommu: Fix the partial copy of probe request
Content-Language: en-US
To: Jean-Philippe Brucker <jean-philippe@linaro.org>
Cc: Zhenzhong Duan <zhenzhong.duan@intel.com>, qemu-devel@nongnu.org,
 mst@redhat.com
References: <20220617062024.3168331-1-zhenzhong.duan@intel.com>
 <0f4f26de-1402-5c3a-9903-389fef9b234f@redhat.com> <YrMDMzfXAiEgFU+d@myrica>
From: Eric Auger <eric.auger@redhat.com>
In-Reply-To: <YrMDMzfXAiEgFU+d@myrica>
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



On 6/22/22 13:55, Jean-Philippe Brucker wrote:
> Hi,
>
> On Wed, Jun 22, 2022 at 12:20:45PM +0200, Eric Auger wrote:
>> Hi,
>>
>> On 6/17/22 08:20, Zhenzhong Duan wrote:
>>> The structure of probe request doesn't include the tail, this leads
>>> to a few field missed to be copied. Currently this isn't an issue as
>>> those missed field belong to reserved field, just in case reserved
>>> field will be used in the future.
>>>
>>> Fixes: 1733eebb9e75b ("virtio-iommu: Implement RESV_MEM probe request")
>>> Signed-off-by: Zhenzhong Duan <zhenzhong.duan@intel.com>
>> nice catch.
>>
>> Reviewed-by: Eric Auger <eric.auger@redhat.com>
>>
>> the spec is pretty confusing here though (virtio-v1.2-csd01.pdf) as it
>> presents the struct as follows:
>>
>> struct virtio_iommu_req_probe {
>> struct virtio_iommu_req_head head;
>> /* Device-readable */
>> le32 endpoint;
>> u8 reserved[64];
>>
>> /* Device-writable */
>> u8 properties[probe_size];
>> struct virtio_iommu_req_tail tail;
>> };
> Hm, which part is confusing?  Yes it's not valid C since probe_size is
> defined dynamically ('probe_size' in the device config), but I thought it
> would be nicer to show the whole request layout this way. Besides, at
> least virtio-blk and virtio-scsi have similar variable-sized arrays in
> their definitions
the fact "struct virtio_iommu_req_tail tail;" was part of the

virtio_iommu_req_probe struct

>
>> Adding Jean in the loop ...
>>
>> Thanks!
>>
>> Eric
>>
>>
>>
>>
>>> ---
>>>  v2: keep bugfix change and drop cleanup change
>>>
>>>  hw/virtio/virtio-iommu.c | 3 ++-
>>>  1 file changed, 2 insertions(+), 1 deletion(-)
>>>
>>> diff --git a/hw/virtio/virtio-iommu.c b/hw/virtio/virtio-iommu.c
>>> index 7c122ab95780..195f909620ab 100644
>>> --- a/hw/virtio/virtio-iommu.c
>>> +++ b/hw/virtio/virtio-iommu.c
>>> @@ -708,7 +708,8 @@ static int virtio_iommu_handle_probe(VirtIOIOMMU *s,
>>>                                       uint8_t *buf)
>>>  {
>>>      struct virtio_iommu_req_probe req;
>>> -    int ret = virtio_iommu_iov_to_req(iov, iov_cnt, &req, sizeof(req));
>>> +    int ret = virtio_iommu_iov_to_req(iov, iov_cnt, &req,
>>> +                    sizeof(req) + sizeof(struct virtio_iommu_req_tail));
> Not sure this is correct, because what we are doing here is reading the
> device-readable part of the property from the request. That part is only
> composed of fields 'head', 'endpoint' and 'reserved[64]' and its size is
> indeed sizeof(struct virtio_iommu_req_probe).
>
> The 'properties' and 'tail' fields shouldn't be read by the device here,
> they are instead written later. It is virtio_iommu_handle_command() that
> copies both of them into the request:
>
>             output_size = s->config.probe_size + sizeof(tail);
>             buf = g_malloc0(output_size);
>
>             ptail = (struct virtio_iommu_req_tail *)
>                         (buf + s->config.probe_size);
>             ptail->status = virtio_iommu_handle_probe(s, iov, iov_cnt, buf);
> 	    // and virtio_iommu_probe() fills 'properties' as needed
> 	    ...
>
> 	// then copy the lot
>         sz = iov_from_buf(elem->in_sg, elem->in_num, 0,
>                           buf ? buf : &tail, output_size);
>
> So I think the current code is correct, as all fields are accounted for

In virtio_iommu_iov_to_req(), payload_sz is computed as

payload_sz = req_sz - sizeof(struct virtio_iommu_req_tail);

sz = iov_to_buf(iov, iov_cnt, 0, req, payload_sz);

This works for other command structs but not for probe one.

Eric


>
> Thanks,
> Jean
>
>>>  
>>>      return ret ? ret : virtio_iommu_probe(s, &req, buf);
>>>  }


