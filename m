Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1BA0A525A6D
	for <lists+qemu-devel@lfdr.de>; Fri, 13 May 2022 05:55:28 +0200 (CEST)
Received: from localhost ([::1]:48134 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1npMOk-0005ng-KA
	for lists+qemu-devel@lfdr.de; Thu, 12 May 2022 23:55:26 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53312)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pizhenwei@bytedance.com>)
 id 1npMNk-00058B-OX
 for qemu-devel@nongnu.org; Thu, 12 May 2022 23:54:24 -0400
Received: from mail-pg1-x52f.google.com ([2607:f8b0:4864:20::52f]:46711)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <pizhenwei@bytedance.com>)
 id 1npMNf-0004ov-6c
 for qemu-devel@nongnu.org; Thu, 12 May 2022 23:54:21 -0400
Received: by mail-pg1-x52f.google.com with SMTP id l11so6354972pgt.13
 for <qemu-devel@nongnu.org>; Thu, 12 May 2022 20:54:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bytedance-com.20210112.gappssmtp.com; s=20210112;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=Sdy4JWVMgzouLiUuz2tCTiM3qS000Ug614pPLg974GQ=;
 b=vqmu5UC4sY7X1lyXBtg1p5wMTx2LVa+3jvsaYuBa7srCB3GpZmRcvIFiQp2vfTU7Pv
 eSvBoLoNz/ttuBceOcbDJC3+hDuAwLxsCp84eOjzJHNlfPdk8s9z4Eym7jLPQEVplVzD
 ldq1aPWqSRKQjTCK5w610yr6sbWTa9OV1zGehsH9rGw7raf15KRqvPAbvreobdWWtmWz
 A6251J8zMKkeyYW/XLUXPgFW3QYz9ZXSixbZChOvA8jL040euOQVEf7DRqiHKKNlvGf/
 GbrxwHbx//ztt7/1T8MiZ2NIGZI9GV6Ryv4afc0ypp+fzj/32u8mZndEvSzZb+POdiWz
 Vodg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=Sdy4JWVMgzouLiUuz2tCTiM3qS000Ug614pPLg974GQ=;
 b=Fl2AAMFGdYuK86i4AMhKzc7xNQpYZBYV5LQWD8VR6ZfFQ9qVu+45CyD8UhaQmhdnH6
 AzQ/gVtqdGHzDLOSqIcST4VKbiIEu5miIlgWeIkzahbAXoQH0M8vuGuSwJu8/q3Wf+mS
 EZeep50XYikcxSIs8dwh7Mn/JCY5Ebm4FZsn2ZRG+KyHU9ZK9sNIGrzeUHbhfZIg+J7t
 zeclkzeZLa4OG9IH/wPjK0ATgd7Xd9Ve7ByIzQzANI9/MgcYuvTreTO8op1yX+pOi64M
 A3WdZkbjO5an/NBqq1Z0fW7b/sLMZeXQbraDD42VvtXD3cBrAlTn4ZLKuah8iE0lPOVu
 o8BQ==
X-Gm-Message-State: AOAM532O7bLa0b7TpTTA2wYR6LOX6MVpNmT6ruA8vwbU2vwEm4KaxpYX
 PWBNAJlhMHTWy+UfWzuGQ6LCww==
X-Google-Smtp-Source: ABdhPJyMwqzVGhhlXUsB2d/mXiL8fGEDAMUZIgY+YPHRDqo7t6DyFSdT21UUHdeLYUoWnpc5riIUeQ==
X-Received: by 2002:a65:6e82:0:b0:381:71c9:9856 with SMTP id
 bm2-20020a656e82000000b0038171c99856mr2357297pgb.316.1652414056895; 
 Thu, 12 May 2022 20:54:16 -0700 (PDT)
Received: from [10.255.89.252] ([139.177.225.255])
 by smtp.gmail.com with ESMTPSA id
 y124-20020a62ce82000000b0050dc76281f9sm566919pfg.211.2022.05.12.20.54.12
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 12 May 2022 20:54:16 -0700 (PDT)
Message-ID: <67aedc07-96d7-4078-611e-a01b3a93904f@bytedance.com>
Date: Fri, 13 May 2022 11:50:20 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.1
Subject: Re: Re: [PATCH v5 1/9] virtio-crypto: header update
Content-Language: en-US
To: =?UTF-8?Q?Daniel_P=2e_Berrang=c3=a9?= <berrange@redhat.com>
Cc: mst@redhat.com, arei.gonglei@huawei.com, qemu-devel@nongnu.org,
 virtualization@lists.linux-foundation.org, linux-crypto@vger.kernel.org,
 helei.sig11@bytedance.com, jasowang@redhat.com, cohuck@redhat.com
References: <20220428135943.178254-1-pizhenwei@bytedance.com>
 <20220428135943.178254-2-pizhenwei@bytedance.com>
 <YnzZhjwbD6PaKx+2@redhat.com>
From: zhenwei pi <pizhenwei@bytedance.com>
In-Reply-To: <YnzZhjwbD6PaKx+2@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::52f;
 envelope-from=pizhenwei@bytedance.com; helo=mail-pg1-x52f.google.com
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

Hi, Daniel

Something I do in my local branch(for the v6 series):
- [PATCH v5 1/9] virtio-crypto: header update
- [PATCH v5 3/9] crypto: Introduce akcipher crypto class
   Add 'Reviewed-by: Daniel P. Berrangé <berrange@redhat.com>'

- [PATCH v5 4/9] crypto: add ASN.1 DER decoder
- [PATCH v5 7/9] test/crypto: Add test suite for crypto akcipher
   Fixed the issues you pointed out.

Do you have suggestions about the other patches? Or I'll send the v6 series?

On 5/12/22 17:55, Daniel P. Berrangé wrote:
> On Thu, Apr 28, 2022 at 09:59:35PM +0800, zhenwei pi wrote:
>> Update header from linux, support akcipher service.
>>
>> Reviewed-by: Gonglei <arei.gonglei@huawei.com>
>> Signed-off-by: lei he <helei.sig11@bytedance.com>
>> Signed-off-by: zhenwei pi <pizhenwei@bytedance.com>
>> ---
>>   .../standard-headers/linux/virtio_crypto.h    | 82 ++++++++++++++++++-
>>   1 file changed, 81 insertions(+), 1 deletion(-)
> 
> I see these changes were now merged in linux.git with
> 
>    commit 24e19590628b58578748eeaec8140bf9c9dc00d9
>    Author:     zhenwei pi <pizhenwei@bytedance.com>
>    AuthorDate: Wed Mar 2 11:39:15 2022 +0800
>    Commit:     Michael S. Tsirkin <mst@redhat.com>
>    CommitDate: Mon Mar 28 16:52:58 2022 -0400
> 
>      virtio-crypto: introduce akcipher service
>      
>      Introduce asymmetric service definition, asymmetric operations and
>      several well known algorithms.
>      
>      Co-developed-by: lei he <helei.sig11@bytedance.com>
>      Signed-off-by: lei he <helei.sig11@bytedance.com>
>      Signed-off-by: zhenwei pi <pizhenwei@bytedance.com>
>      Link: https://lore.kernel.org/r/20220302033917.1295334-3-pizhenwei@bytedance.com
>      Signed-off-by: Michael S. Tsirkin <mst@redhat.com>
>      Reviewed-by: Gonglei <arei.gonglei@huawei.com>
> 
> 
> And the changes proposed here match that, so
> 
>    Reviewed-by: Daniel P. Berrangé <berrange@redhat.com>
> 
> 
> With regards,
> Daniel

-- 
zhenwei pi

