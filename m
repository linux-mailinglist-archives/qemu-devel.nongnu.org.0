Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 195B265528A
	for <lists+qemu-devel@lfdr.de>; Fri, 23 Dec 2022 17:08:12 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p8kZN-0006Ge-Dd; Fri, 23 Dec 2022 11:06:49 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <david@redhat.com>) id 1p8kZI-0006G9-OO
 for qemu-devel@nongnu.org; Fri, 23 Dec 2022 11:06:44 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <david@redhat.com>) id 1p8kZH-00028Y-18
 for qemu-devel@nongnu.org; Fri, 23 Dec 2022 11:06:44 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1671811600;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=VPzzJJ/JjKJ7QRHlNAGPfayOzUH4hoCC8OYpEfBUwy8=;
 b=gxfjTntbwjduxGYmFzdECqMAAg/T7LesQqMhbBaEPGJrtAe8MM3PUzczfUvuejNCkZBalS
 t7rMILwzLxwzzgu4ZIx83X3/JeyBFu/ML3mkemU8n/h5Lm/PZIYAVqLDZ5CwFCU+Ae/Jlb
 2YvAkT9RbjMFlrw3QvBERtGb6QjzwmY=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-134-BIdW0KDYOECDzEyJBuxoWg-1; Fri, 23 Dec 2022 11:06:38 -0500
X-MC-Unique: BIdW0KDYOECDzEyJBuxoWg-1
Received: by mail-wm1-f69.google.com with SMTP id
 q21-20020a7bce95000000b003d236c91639so1322693wmj.8
 for <qemu-devel@nongnu.org>; Fri, 23 Dec 2022 08:06:38 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:organization:from:references
 :cc:to:content-language:subject:user-agent:mime-version:date
 :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=VPzzJJ/JjKJ7QRHlNAGPfayOzUH4hoCC8OYpEfBUwy8=;
 b=g3ebJdCtXw8RmyIVNE1BqVv2zjjB6iJFdh5JkTtzfLyKnz+DAL7ZZJ6R1vo87ButaI
 stO581vR80MSEPLBwtzB6dOZuTIWbtjvXlMo+M8rbizzT9qQV8n6FwEaBLa5FiYCjn4s
 bIel1ZiRCLeyxvmdlYvX2a1R50ML6zuHzXQeWVqyKdbjIWKsLn4UFouN/Du9Jky/HUtw
 3ue+jaXf0TWmMRm4G59OWWkyfspwQR8ee6RXQtN4QiqrjMBIMzqQg5cA7N+hv149y27O
 LLeOpWI1nfN8E0kDi8oV9U5S4WP+Pna4PUGviElpdpcG7M3Mio+AMXs+PczjY9H5QuUV
 lqpQ==
X-Gm-Message-State: AFqh2komITufrNG9TheHinlI9xniAotZI5gOmABWTl+18f+Ja2SN7jLr
 beUaikk6LeH3TZDjtl9l9EBzlm0fJKQ7VhBX0xWmfjdACcMTk7znbaMY9C68LBqSLMHpYFbm9ck
 jMfTMtJs1rBx+/ks=
X-Received: by 2002:adf:e703:0:b0:26a:5b49:829a with SMTP id
 c3-20020adfe703000000b0026a5b49829amr7557828wrm.33.1671811597553; 
 Fri, 23 Dec 2022 08:06:37 -0800 (PST)
X-Google-Smtp-Source: AMrXdXv+fpSEUdU65BHil724Zf4kAN3gNBa6DBqmZ04S2hXK3JlGOs+YvDLRtcMcyytpj9TImQkvIg==
X-Received: by 2002:adf:e703:0:b0:26a:5b49:829a with SMTP id
 c3-20020adfe703000000b0026a5b49829amr7557810wrm.33.1671811597299; 
 Fri, 23 Dec 2022 08:06:37 -0800 (PST)
Received: from ?IPV6:2003:cb:c707:ab00:3d8e:16c4:a38d:2827?
 (p200300cbc707ab003d8e16c4a38d2827.dip0.t-ipconnect.de.
 [2003:cb:c707:ab00:3d8e:16c4:a38d:2827])
 by smtp.gmail.com with ESMTPSA id
 k17-20020a5d4291000000b002415dd45320sm3341673wrq.112.2022.12.23.08.06.36
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 23 Dec 2022 08:06:36 -0800 (PST)
Message-ID: <8d7fe410-4b44-040e-5e6b-b123207913bd@redhat.com>
Date: Fri, 23 Dec 2022 17:06:35 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.0
Subject: Re: [RFC v4 3/3] migration: reduce time of loading non-iterable
 vmstate
Content-Language: en-US
To: Chuang Xu <xuchuangxclwt@bytedance.com>, qemu-devel@nongnu.org
Cc: dgilbert@redhat.com, quintela@redhat.com, pbonzini@redhat.com,
 peterx@redhat.com, philmd@linaro.org, zhouyibo@bytedance.com
References: <20221223142307.1614945-1-xuchuangxclwt@bytedance.com>
 <20221223142307.1614945-4-xuchuangxclwt@bytedance.com>
From: David Hildenbrand <david@redhat.com>
Organization: Red Hat
In-Reply-To: <20221223142307.1614945-4-xuchuangxclwt@bytedance.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=david@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-1.148, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

On 23.12.22 15:23, Chuang Xu wrote:
> The duration of loading non-iterable vmstate accounts for a significant
> portion of downtime (starting with the timestamp of source qemu stop and
> ending with the timestamp of target qemu start). Most of the time is spent
> committing memory region changes repeatedly.
> 
> This patch packs all the changes to memory region during the period of
> loading non-iterable vmstate in a single memory transaction. With the
> increase of devices, this patch will greatly improve the performance.
> 
> Here are the test1 results:
> test info:
> - Host
>    - Intel(R) Xeon(R) Platinum 8260 CPU
>    - NVIDIA Mellanox ConnectX-5
> - VM
>    - 32 CPUs 128GB RAM VM
>    - 8 16-queue vhost-net device
>    - 16 4-queue vhost-user-blk device.
> 
> 	time of loading non-iterable vmstate     downtime
> before		about 150 ms			  740+ ms
> after		about 30 ms			  630+ ms
> 
> In test2, we keep the number of the device the same as test1, reduce the
> number of queues per device:
> 
> Here are the test2 results:
> test info:
> - Host
>    - Intel(R) Xeon(R) Platinum 8260 CPU
>    - NVIDIA Mellanox ConnectX-5
> - VM
>    - 32 CPUs 128GB RAM VM
>    - 8 1-queue vhost-net device
>    - 16 1-queue vhost-user-blk device.
> 
> 	time of loading non-iterable vmstate     downtime
> before		about 90 ms			 about 250 ms
> 
> after		about 25 ms			 about 160 ms
> 
> In test3, we keep the number of queues per device the same as test1, reduce
> the number of devices:
> 
> Here are the test3 results:
> test info:
> - Host
>    - Intel(R) Xeon(R) Platinum 8260 CPU
>    - NVIDIA Mellanox ConnectX-5
> - VM
>    - 32 CPUs 128GB RAM VM
>    - 1 16-queue vhost-net device
>    - 1 4-queue vhost-user-blk device.
> 
> 	time of loading non-iterable vmstate     downtime
> before		about 20 ms			 about 70 ms
> after		about 11 ms			 about 60 ms
> 
> As we can see from the test results above, both the number of queues and
> the number of devices have a great impact on the time of loading non-iterable
> vmstate. The growth of the number of devices and queues will lead to more
> mr commits, and the time consumption caused by the flatview reconstruction
> will also increase.
> 
> Signed-off-by: Chuang Xu <xuchuangxclwt@bytedance.com>
> ---
>   migration/savevm.c | 7 +++++++
>   1 file changed, 7 insertions(+)
> 
> diff --git a/migration/savevm.c b/migration/savevm.c
> index a0cdb714f7..19785e5a54 100644
> --- a/migration/savevm.c
> +++ b/migration/savevm.c
> @@ -2617,6 +2617,9 @@ int qemu_loadvm_state_main(QEMUFile *f, MigrationIncomingState *mis)
>       uint8_t section_type;
>       int ret = 0;
>   
> +    /* call memory_region_transaction_begin() before loading vmstate */


I'd suggest extending the comment *why* you are doing that, that it's a 
pure performance optimization, and how it achieves that.

-- 
Thanks,

David / dhildenb


