Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7DE2360A241
	for <lists+qemu-devel@lfdr.de>; Mon, 24 Oct 2022 13:40:09 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1omv6e-0008VN-HS; Mon, 24 Oct 2022 06:54:56 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <david@redhat.com>) id 1omv6a-0008Uq-6L
 for qemu-devel@nongnu.org; Mon, 24 Oct 2022 06:54:52 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <david@redhat.com>) id 1omv6X-0002e1-0B
 for qemu-devel@nongnu.org; Mon, 24 Oct 2022 06:54:51 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1666608885;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=bnaoPU4DgOETL9MVtBv9nacghLjMuBTI5y7+roxt99g=;
 b=SNwdtKq0wJMKYgnlJzFIXR+zB0MgatimxVCNyzGADIkGraakIS+41uB6gpmUCtT+GFDyCk
 36UTmMtzecA+nPnrJXr477Nz424HKPrBhWpWY3N/XsrjALXr+Ca9nWzsPPzlSUzFGHedg8
 nELNglggRrTMnbJFzloxX9agH0SZuGU=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-671-lxN9sJIHOw2TNzYFIKpN3A-1; Mon, 24 Oct 2022 06:54:43 -0400
X-MC-Unique: lxN9sJIHOw2TNzYFIKpN3A-1
Received: by mail-wm1-f70.google.com with SMTP id
 q14-20020a7bce8e000000b003c6b7debf22so1823163wmj.0
 for <qemu-devel@nongnu.org>; Mon, 24 Oct 2022 03:54:43 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:organization:from:references
 :cc:to:content-language:subject:user-agent:mime-version:date
 :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=bnaoPU4DgOETL9MVtBv9nacghLjMuBTI5y7+roxt99g=;
 b=P5QUlK2/6E1g+ao6qlxlLsdKgtbIqdveUS+icbnorlJEUIuOhxstIJdEt2mCEpPhnt
 v8kOlags2kewFSZbUeC8PXoh3O8GqCMx4mbUXtEHLYrsC+Ukg+Dr41/KteRtSvTpZhBt
 yhu+0DBrmpyL6Z5JStxC9E2avjT+LAG55z0VEhH9MrmDUORK4Pph3//34ypkR0kMZxAo
 uZRyYp/hYrNfozOaAgn6KrVp2puG4dixMJQFXcncADQBrUDc5TnHLOyg/Lsx0teeJHuH
 5jPecCfuKOGLGMKHbOnZvoxGPTq8gom9qVUfHCd11LHpXCJK4GX1Sb5faxZX/K3Q/Q0z
 B10g==
X-Gm-Message-State: ACrzQf2/T8Qxg8y3dzugd22NOIVJG/yBUVtT/dR+7jrrd2iYKozmJlLX
 YpDrytqrdEHOzrifVzqwBFsAPTc1mwtoIRd04rcy9mK2mO+2CJp9/1zp6FGKONFZfqmt2JrdWAq
 n4Yjut1YpJDweAGM=
X-Received: by 2002:a05:600c:3787:b0:3c6:f85c:ebfe with SMTP id
 o7-20020a05600c378700b003c6f85cebfemr22595464wmr.105.1666608882383; 
 Mon, 24 Oct 2022 03:54:42 -0700 (PDT)
X-Google-Smtp-Source: AMsMyM5gkL5Y6uKz5qE2MDQA3nQIPAlPCjdkRi7b0jzB45l50JT9SJ28fB6RNyZyvLreAfME2lJpTQ==
X-Received: by 2002:a05:600c:3787:b0:3c6:f85c:ebfe with SMTP id
 o7-20020a05600c378700b003c6f85cebfemr22595440wmr.105.1666608882133; 
 Mon, 24 Oct 2022 03:54:42 -0700 (PDT)
Received: from ?IPV6:2003:cb:c704:f100:6371:a05b:e038:ac2c?
 (p200300cbc704f1006371a05be038ac2c.dip0.t-ipconnect.de.
 [2003:cb:c704:f100:6371:a05b:e038:ac2c])
 by smtp.gmail.com with ESMTPSA id
 g42-20020a05600c4caa00b003a84375d0d1sm7457474wmp.44.2022.10.24.03.54.41
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 24 Oct 2022 03:54:41 -0700 (PDT)
Message-ID: <cb770300-d0b3-b0f2-2731-fa88f7c5a274@redhat.com>
Date: Mon, 24 Oct 2022 12:54:40 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.3.1
Subject: Re: [PATCH v2] hw/mem/nvdimm: fix error message for 'unarmed' flag
Content-Language: en-US
To: Julia Suvorova <jusual@redhat.com>, qemu-devel@nongnu.org
Cc: "Michael S. Tsirkin" <mst@redhat.com>,
 Stefan Hajnoczi <stefanha@redhat.com>, Pankaj Gupta <pankaj.gupta@amd.com>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
References: <20221023195812.15523-1-jusual@redhat.com>
From: David Hildenbrand <david@redhat.com>
Organization: Red Hat
In-Reply-To: <20221023195812.15523-1-jusual@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=david@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -25
X-Spam_score: -2.6
X-Spam_bar: --
X-Spam_report: (-2.6 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.503,
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
Sender: "Qemu-devel" <qemu-devel-bounces@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

On 23.10.22 21:58, Julia Suvorova wrote:
> In the ACPI specification [1], the 'unarmed' bit is set when a device
> cannot accept a persistent write. This means that when a memdev is
> read-only, the 'unarmed' flag must be turned on. The logic is correct,
> just changing the error message.
> 
> [1] ACPI NFIT NVDIMM Region Mapping Structure "NVDIMM State Flags" Bit 3
> 
> Fixes: dbd730e859 ("nvdimm: check -object memory-backend-file, readonly=on option")
> Signed-off-by: Julia Suvorova <jusual@redhat.com>
> Reviewed-by: Stefan Hajnoczi <stefanha@redhat.com>
> Reviewed-by: Pankaj Gupta <pankaj.gupta@amd.com>
> Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>
> Acked-by: David Hildenbrand <david@redhat.com>
> ---
> v2:
>      * enquote 'on' [Philippe]
> 
>   hw/mem/nvdimm.c | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/hw/mem/nvdimm.c b/hw/mem/nvdimm.c
> index 7c7d777781..31080c22c9 100644
> --- a/hw/mem/nvdimm.c
> +++ b/hw/mem/nvdimm.c
> @@ -149,7 +149,7 @@ static void nvdimm_prepare_memory_region(NVDIMMDevice *nvdimm, Error **errp)
>       if (!nvdimm->unarmed && memory_region_is_rom(mr)) {
>           HostMemoryBackend *hostmem = dimm->hostmem;
>   
> -        error_setg(errp, "'unarmed' property must be off since memdev %s "
> +        error_setg(errp, "'unarmed' property must be 'on' since memdev %s "
>                      "is read-only",
>                      object_get_canonical_path_component(OBJECT(hostmem)));
>           return;


Thanks, queued to

https://github.com/davidhildenbrand/qemu.git mem-next

-- 
Thanks,

David / dhildenb


