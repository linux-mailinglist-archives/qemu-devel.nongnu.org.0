Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 891AA539AD6
	for <lists+qemu-devel@lfdr.de>; Wed,  1 Jun 2022 03:42:48 +0200 (CEST)
Received: from localhost ([::1]:49210 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nwDNn-0001zf-Mv
	for lists+qemu-devel@lfdr.de; Tue, 31 May 2022 21:42:47 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:46880)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pizhenwei@bytedance.com>)
 id 1nwDM0-0001Gm-1r
 for qemu-devel@nongnu.org; Tue, 31 May 2022 21:40:56 -0400
Received: from mail-pl1-x634.google.com ([2607:f8b0:4864:20::634]:33486)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <pizhenwei@bytedance.com>)
 id 1nwDLw-0006Nr-6T
 for qemu-devel@nongnu.org; Tue, 31 May 2022 21:40:54 -0400
Received: by mail-pl1-x634.google.com with SMTP id s12so422483plp.0
 for <qemu-devel@nongnu.org>; Tue, 31 May 2022 18:40:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bytedance-com.20210112.gappssmtp.com; s=20210112;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=jFvwYwPJCY6k0di+i6nL1/XGJtBAlgbdq8lOQ9mtj3Q=;
 b=imgRJrFZSHLe6lO2zmh5r0EUVQKmP5XUldXw07mbKIhXPvCYkq3hRTr6NDY/S/9Xuq
 +CHuquruv+4BXW/Oxm0lr6vXR5mOMwblPj4a9FEb0E5xzqanj0y/1TZLXuGphHrYu4Fp
 t5Rfn8wSPc3UPIkR+FM3fo5SJxUDLo+U93YEWTSeP3uyz457NYmf86aIcdBtQoSy5eUI
 pC6H9k5onjbkwC73/18YNImeZDfeT3O9BP+l+bVE0PhdhBusx8crbLVx9sErEnUDvi1z
 qel24NElsXerHeDYi5jNW4LYdLtiJrkVwjgp/dfWterqvC8bX5nawa4aLQ0M8dFJ5aKf
 aiQw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=jFvwYwPJCY6k0di+i6nL1/XGJtBAlgbdq8lOQ9mtj3Q=;
 b=ffXJ0CBs7E9GTzZHJi5++0uhYYPwnDBj9tquN0cBDPxU5Bsl173ivmh+iyZsdJuv41
 i53YchVfaYW2PtWhN5HROWIVSjCEVUkkyiOldrEvNxVMyUPqV/quXmfKAeRThjxfzfv/
 +bq5iKfAQITgMGmcxT/jpH/UjF0lPa6B39et15rh0Pr1AsGSS2Esld1FxR4gQYuTFv8y
 MDJCuORhNtmFDz3kCyl4wW9sifGeGHZSsg9E9Nqw5p6rnkImg2QDCAV6BtLvs+u5T0o8
 ONSdnmjz30nLvDH+3Jecmu+5FQOEjcjnXjBQ27K2SBoHo/o+nnMtrA5X4t7OjHHT5+p5
 QV+g==
X-Gm-Message-State: AOAM531tR0evDZjf3LnhDMTKOwfYqk/08c9t6zWmVRAgKm2AJjWG3z0F
 NvKUMxMgrALtBbRPGbClegvMTw==
X-Google-Smtp-Source: ABdhPJxL9+zVLo1Fe4n5GfInEgl1mETUHn6X4Lrss5tFCnux/FCRgTY28hJgW0D1nHV7FYQXjlwMuA==
X-Received: by 2002:a17:90a:df91:b0:1e3:4dc8:46e7 with SMTP id
 p17-20020a17090adf9100b001e34dc846e7mr3726446pjv.106.1654047648994; 
 Tue, 31 May 2022 18:40:48 -0700 (PDT)
Received: from [10.255.89.136] ([139.177.225.233])
 by smtp.gmail.com with ESMTPSA id
 ru12-20020a17090b2bcc00b001cb6527ca39sm2639407pjb.0.2022.05.31.18.40.45
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 31 May 2022 18:40:48 -0700 (PDT)
Message-ID: <f59a879a-3526-4da3-7546-3e719f070504@bytedance.com>
Date: Wed, 1 Jun 2022 09:36:49 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.1
Subject: Re: RE: RE: [PATCH v8 1/1] crypto: Introduce RSA algorithm
Content-Language: en-US
To: "Gonglei (Arei)" <arei.gonglei@huawei.com>,
 "mst@redhat.com" <mst@redhat.com>
Cc: "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>,
 "virtualization@lists.linux-foundation.org"
 <virtualization@lists.linux-foundation.org>,
 "helei.sig11@bytedance.com" <helei.sig11@bytedance.com>,
 "berrange@redhat.com" <berrange@redhat.com>
References: <20220527084734.2649594-1-pizhenwei@bytedance.com>
 <20220527084734.2649594-2-pizhenwei@bytedance.com>
 <848d579e2c504ba493cd57510a7ff3b0@huawei.com>
 <b2ee77ae-2044-32b4-20c5-43fa78e8213c@bytedance.com>
 <39f884dbc25d4b0cbec510ab090e6778@huawei.com>
From: zhenwei pi <pizhenwei@bytedance.com>
In-Reply-To: <39f884dbc25d4b0cbec510ab090e6778@huawei.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::634;
 envelope-from=pizhenwei@bytedance.com; helo=mail-pl1-x634.google.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_NONE=-0.0001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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

On 5/31/22 20:08, Gonglei (Arei) wrote:
> 
> 
>> -----Original Message-----
>> From: zhenwei pi [mailto:pizhenwei@bytedance.com]
>> Sent: Tuesday, May 31, 2022 9:48 AM
>> To: Gonglei (Arei) <arei.gonglei@huawei.com>
>> Cc: qemu-devel@nongnu.org; mst@redhat.com;
>> virtualization@lists.linux-foundation.org; helei.sig11@bytedance.com;
>> berrange@redhat.com
>> Subject: Re: RE: [PATCH v8 1/1] crypto: Introduce RSA algorithm
>>
>> On 5/30/22 21:31, Gonglei (Arei) wrote:
>>>
>>>
>>>> -----Original Message-----
>>>> From: zhenwei pi [mailto:pizhenwei@bytedance.com]
>>>> Sent: Friday, May 27, 2022 4:48 PM
>>>> To: mst@redhat.com; Gonglei (Arei) <arei.gonglei@huawei.com>
>>>> Cc: qemu-devel@nongnu.org; virtualization@lists.linux-foundation.org;
>>>> helei.sig11@bytedance.com; berrange@redhat.com; zhenwei pi
>>>> <pizhenwei@bytedance.com>
>>>> Subject: [PATCH v8 1/1] crypto: Introduce RSA algorithm
>>>>
>>>>
>>> Skip...
>>>

> 
> OK. For the patch:
> 
> Reviewed-by: Gonglei <arei.gonglei@huawei.com>
> 
> 
> Regards,
> -Gonglei
>      
> 

Hi, Michael & Lei,

The other patches of this series has been already merged into QEMU, this 
patch is the last one. With this patch, we can test virtio-crypto 
akcipher end-to-end.

Thanks a lot!

-- 
zhenwei pi

