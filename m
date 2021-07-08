Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 953153BF63E
	for <lists+qemu-devel@lfdr.de>; Thu,  8 Jul 2021 09:27:38 +0200 (CEST)
Received: from localhost ([::1]:35360 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m1ORd-0001w1-Mj
	for lists+qemu-devel@lfdr.de; Thu, 08 Jul 2021 03:27:37 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60404)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <david@redhat.com>) id 1m1OQR-0001Ft-6L
 for qemu-devel@nongnu.org; Thu, 08 Jul 2021 03:26:23 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:58970)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <david@redhat.com>) id 1m1OQP-0008Qy-P4
 for qemu-devel@nongnu.org; Thu, 08 Jul 2021 03:26:22 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1625729180;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Ns4Fm/tJyU7JEIPyH6zeHX4RllCJZYdp3nU0c7FSc8E=;
 b=FY41jSyfEXaarjOZHyU8zARCl5HsCC7FGlB/ZcKMGTXK2PUVBIwc24HMRBhbn3VBj3MHxe
 /QtJGv5dnuHm11gKCTmRmw5uEd+wmFUBshXZslmiNp0gaEdNHDE46d2+LS429HfJjL0Cvf
 iP8Glx9YXyj5rAM8yESXj25B3aQI2pA=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-68-t_yT3wiMO4qcYnJKxFgeJQ-1; Thu, 08 Jul 2021 03:26:19 -0400
X-MC-Unique: t_yT3wiMO4qcYnJKxFgeJQ-1
Received: by mail-wr1-f69.google.com with SMTP id
 a4-20020adffb840000b02901304c660e75so1599320wrr.19
 for <qemu-devel@nongnu.org>; Thu, 08 Jul 2021 00:26:19 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:organization
 :message-id:date:user-agent:mime-version:in-reply-to
 :content-language:content-transfer-encoding;
 bh=Ns4Fm/tJyU7JEIPyH6zeHX4RllCJZYdp3nU0c7FSc8E=;
 b=Ooxp4MmSRA5enfX4PepkH/1GV3/8KNWg5UGBa9ryCfyOI0G8x/64bW6gMeQ2IYtqsD
 OELBVtlbq3Zz/ZyuCpEXRek3s8+hdZOLduTBePNtn2/ElUxqq1fn2nqtfOfPewBxsCWa
 qeucqOU2XXzw70mGCQhbrTPZB1dWLUDNN6Cuq5hFHV3A7Z6d5ABWCn2BlPveJvRjtll6
 +yVGlf3wQyBNrkmDdo8FKRg7elrVnTXCOebcn3QPsRrqqYy5lQaDPK0dvYlAWDSxvSTS
 25F/iXXcvfDBLnLSr3eb2PQiDdgf2tbM5z7/1LgU6QGX8ZM1xLSO806VzjCy3SlWW2rf
 qhpg==
X-Gm-Message-State: AOAM532WKAUFMaoyj0IqqijqoTHLEhLcFVVsdkaF8CYnywytG7P6SJYh
 i58Hyh7AKPMbOy7QNdFOnyjrChXXcT9ttnVgT9wmyVK9/dodUdcLkaU7xYdOLnaOB+LwQMjhXhr
 t1XDkSwopX4GrbGo=
X-Received: by 2002:a1c:e485:: with SMTP id b127mr3539617wmh.91.1625729178447; 
 Thu, 08 Jul 2021 00:26:18 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxIEvuVA/rvrItKU+nlAVUSbNlM0CrcwLzrRU4hj2SZb9Q2MEdYX2UuObS4DgzBS8+vsKchwA==
X-Received: by 2002:a1c:e485:: with SMTP id b127mr3539592wmh.91.1625729178265; 
 Thu, 08 Jul 2021 00:26:18 -0700 (PDT)
Received: from [192.168.3.132] (p4ff23cf9.dip0.t-ipconnect.de. [79.242.60.249])
 by smtp.gmail.com with ESMTPSA id t9sm1271100wrq.92.2021.07.08.00.26.17
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 08 Jul 2021 00:26:17 -0700 (PDT)
Subject: Re: [PATCH] remote/memory: Replace share parameter with ram_flags
To: Yang Zhong <yang.zhong@intel.com>, qemu-devel@nongnu.org
References: <20210708071216.87862-1-yang.zhong@intel.com>
From: David Hildenbrand <david@redhat.com>
Organization: Red Hat
Message-ID: <8ea4cb21-e69e-2846-1300-88a9cebf7758@redhat.com>
Date: Thu, 8 Jul 2021 09:26:17 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20210708071216.87862-1-yang.zhong@intel.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=david@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=david@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -41
X-Spam_score: -4.2
X-Spam_bar: ----
X-Spam_report: (-4.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1.439,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001,
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
Cc: pbonzini@redhat.com, philmd@redhat.com, peterx@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 08.07.21 09:12, Yang Zhong wrote:
> The commit(d5015b80) missed the ram_flags to memory_region_init_ram_from_fd()
> in the hw/remote/memory.c.

Yes, seems like that call was added just after I crafted my patches:

Fixes: d5015b801340 ("softmmu/memory: Pass ram_flags to 
qemu_ram_alloc_from_fd()")
Reviewed-by: David Hildenbrand <david@redhat.com>

Thanks!

> 
> Signed-off-by: Yang Zhong <yang.zhong@intel.com>
> ---
>   hw/remote/memory.c | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/hw/remote/memory.c b/hw/remote/memory.c
> index 472ed2a272..6e21ab1a45 100644
> --- a/hw/remote/memory.c
> +++ b/hw/remote/memory.c
> @@ -46,7 +46,7 @@ void remote_sysmem_reconfig(MPQemuMsg *msg, Error **errp)
>           subregion = g_new(MemoryRegion, 1);
>           memory_region_init_ram_from_fd(subregion, NULL,
>                                          name, sysmem_info->sizes[region],
> -                                       true, msg->fds[region],
> +                                       RAM_SHARED, msg->fds[region],
>                                          sysmem_info->offsets[region],
>                                          errp);
>   
> 


-- 
Thanks,

David / dhildenb


