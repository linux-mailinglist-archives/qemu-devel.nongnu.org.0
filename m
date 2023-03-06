Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BBC876ABFD6
	for <lists+qemu-devel@lfdr.de>; Mon,  6 Mar 2023 13:49:42 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pZAGf-0008DY-9k; Mon, 06 Mar 2023 07:48:41 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <xuchuangxclwt@bytedance.com>)
 id 1pZAGN-0008DP-8V
 for qemu-devel@nongnu.org; Mon, 06 Mar 2023 07:48:23 -0500
Received: from mail-pl1-x62c.google.com ([2607:f8b0:4864:20::62c])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <xuchuangxclwt@bytedance.com>)
 id 1pZAGK-0006Eo-EV
 for qemu-devel@nongnu.org; Mon, 06 Mar 2023 07:48:23 -0500
Received: by mail-pl1-x62c.google.com with SMTP id p20so10099867plw.13
 for <qemu-devel@nongnu.org>; Mon, 06 Mar 2023 04:48:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bytedance.com; s=google; t=1678106891;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to:subject
 :user-agent:mime-version:date:message-id:from:to:cc:subject:date
 :message-id:reply-to;
 bh=OPu8ZZ0y72IxJZKOgq/89ugSi03TqACHmQO0qu+3NX8=;
 b=WWRr13v06teKcCL69V1R+hzfPARs2iT77sAsuc448QMSPypNHnsn2Zteq7V9RhL52W
 55PNRJF1SK31OWg5gFi04MK8/d5wSEHzY5N0h4NAmAajvc81YLvXNcanS/M6EbjHNyBP
 glNQka3YLx7eiTjj74InP2kHcKiQDlMhW01n+dlfvC0MpQvH46UyhPF3MSZSn5/ftrfY
 nmckNLdly/jgf/DHUJAGWzCgIGNIu8216tb2VHmOLfsoNQZYsee2zC7ylB92YobuaW4S
 8BeH+2bZrUzjUna0PddFCqs4GMbGjogmvLvLuwTPWodn0k+PoAAMMTFWaN1olFo3L/m4
 ze9g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1678106891;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to:subject
 :user-agent:mime-version:date:message-id:x-gm-message-state:from:to
 :cc:subject:date:message-id:reply-to;
 bh=OPu8ZZ0y72IxJZKOgq/89ugSi03TqACHmQO0qu+3NX8=;
 b=wySf3llC8k+bDPP42BDhTFBy1rCYK/Sdte4UpQ34Vt1iqG30WQPsPr5Dv5sP+uk424
 Lts0riikV3n3J8qgF6EEE8FrLPR3YVivdlyazk6VFbv9abthBSBFTOPWEFGqBYwnRBvM
 bg9IZdY88gbIXqqo5xtrbJ5+uC9lO+34wFrdn5QbiSddlZ7hLVZiEfFQ4OCdEeVPuzQB
 LVlyvFVTTCWMwucTYNa092DgRHJJY1zmwhiRdwbPhZInp8pl8KNmZo7lLPX/GtauKAZ2
 6DCx6sVtM7qQETDp+0n1eWbbcip6HD/G7KYRpjMXrJbvyBD/BV9ximNkm//vi6Y1FaDi
 6Vog==
X-Gm-Message-State: AO0yUKXXavCnZodAwRTturYyigkbEX9aK9z1WDtIgVe8oBhbsGQmI8+C
 JIWh1XmyO+V717AZD7d37xSZww==
X-Google-Smtp-Source: AK7set+L8sT3+9HkNu88wTjOmEPsrrsmb679ugVAKwTC/iCA5xLxCRO5WM8KJohqE7Bq4+aUODAO4Q==
X-Received: by 2002:a17:90b:1d0f:b0:234:2485:6743 with SMTP id
 on15-20020a17090b1d0f00b0023424856743mr10840270pjb.3.1678106891426; 
 Mon, 06 Mar 2023 04:48:11 -0800 (PST)
Received: from [10.94.53.13] ([139.177.225.249])
 by smtp.gmail.com with ESMTPSA id
 y20-20020a17090abd1400b00234e6d2de3dsm5898903pjr.11.2023.03.06.04.48.08
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 06 Mar 2023 04:48:11 -0800 (PST)
Message-ID: <1ea4db90-7535-1dc3-a2ae-d44113a24e29@bytedance.com>
Date: Mon, 6 Mar 2023 20:48:05 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.7.2
Subject: Re: [PATCH RESEND v6 0/5] migration: reduce time of loading
 non-iterable vmstate
To: Peter Xu <peterx@redhat.com>
Cc: qemu-devel@nongnu.org, dgilbert@redhat.com, quintela@redhat.com,
 pbonzini@redhat.com, david@redhat.com, philmd@linaro.org,
 zhouyibo@bytedance.com
References: <20230303105655.396446-1-xuchuangxclwt@bytedance.com>
 <ZAUSPo9bJO0udf9p@x1n>
From: Chuang Xu <xuchuangxclwt@bytedance.com>
In-Reply-To: <ZAUSPo9bJO0udf9p@x1n>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::62c;
 envelope-from=xuchuangxclwt@bytedance.com; helo=mail-pl1-x62c.google.com
X-Spam_score_int: 4
X-Spam_score: 0.4
X-Spam_bar: /
X-Spam_report: (0.4 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1, DKIM_VALID=-0.1,
 DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FROM_LOCAL_NOVOWEL=0.5,
 HK_RANDOM_ENVFROM=0.999, HK_RANDOM_FROM=1, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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

Hi, Peter,

On 2023/3/6 上午6:05, Peter Xu wrote:
> Hi, Chuang,
>
> On Fri, Mar 03, 2023 at 06:56:50PM +0800, Chuang Xu wrote:
>> Sorry to forget to update the test results in the last patch of v6.
>>
>> In this version:
>>
>> - add peter's patch.
>> - split mr_do_commit() from mr_commit().
>> - adjust the sanity check in address_space_to_flatview().
>> - rebase to latest upstream.
>> - replace 8260 with 8362 as testing host.
>> - update the latest test results.
>>
>> Here I list some cases which will trigger do_commit() in address_space_to_flatview():

I ran qtest cases and used systemtap to trace those do_commit().

>>
>> 1.virtio_load->virtio_init_region_cache
>> 2.virtio_load->virtio_set_features_nocheck
> What is this one specifically?  I failed to see quickly why this needs to
> reference the flatview.

0x560f3bb26510 : memory_region_transaction_do_commit+0x0/0x1c0 [/data00/migration/qemu-open/build/qemu-system-x86_64]
0x560f3bb26e45 : address_space_get_flatview+0x95/0x100 [/data00/migration/qemu-open/build/qemu-system-x86_64]
0x560f3bb296b6 : memory_listener_register+0xf6/0x300 [/data00/migration/qemu-open/build/qemu-system-x86_64]
0x560f3baec59f : virtio_device_realize+0x12f/0x1a0 [/data00/migration/qemu-open/build/qemu-system-x86_64]
0x560f3bbb3b1f : device_set_realized+0x2ff/0x660 [/data00/migration/qemu-open/build/qemu-system-x86_64]
0x560f3bbb6ec6 : property_set_bool+0x46/0x70 [/data00/migration/qemu-open/build/qemu-system-x86_64]
0x560f3bbb9173 : object_property_set+0x73/0x100 [/data00/migration/qemu-open/build/qemu-system-x86_64]
0x560f3bbbc1ef : object_property_set_qobject+0x2f/0x50 [/data00/migration/qemu-open/build/qemu-system-x86_64]
0x560f3bbb93e4 : object_property_set_bool+0x34/0xa0 [/data00/migration/qemu-open/build/qemu-system-x86_64]
0x560f3b9830d9 : virtio_pci_realize+0x299/0x4e0 [/data00/migration/qemu-open/build/qemu-system-x86_64]
0x560f3b901204 : pci_qdev_realize+0x7e4/0x1090 [/data00/migration/qemu-open/build/qemu-system-x86_64]
0x560f3bbb3b1f : device_set_realized+0x2ff/0x660 [/data00/migration/qemu-open/build/qemu-system-x86_64]
0x560f3bbb6ec6 : property_set_bool+0x46/0x70 [/data00/migration/qemu-open/build/qemu-system-x86_64]
0x560f3bbb9173 : object_property_set+0x73/0x100 [/data00/migration/qemu-open/build/qemu-system-x86_64]
0x560f3bbbc1ef : object_property_set_qobject+0x2f/0x50 [/data00/migration/qemu-open/build/qemu-system-x86_64]
0x560f3bbb93e4 : object_property_set_bool+0x34/0xa0 [/data00/migration/qemu-open/build/qemu-system-x86_64]
0x560f3b99e4a0 : qdev_device_add_from_qdict+0xb00/0xc40 [/data00/migration/qemu-open/build/qemu-system-x86_64]
0x560f3bac0c75 : virtio_net_set_features+0x385/0x490 [/data00/migration/qemu-open/build/qemu-system-x86_64]
0x560f3baec238 : virtio_set_features_nocheck+0x58/0x70 [/data00/migration/qemu-open/build/qemu-system-x86_64]
0x560f3baf1e9e : virtio_load+0x33e/0x820 [/data00/migration/qemu-open/build/qemu-system-x86_64]

>
>> 3.vapic_post_load
> Same confusion to this one..

0x557a57b0e510 : memory_region_transaction_do_commit+0x0/0x1c0 [/data00/migration/qemu-open/build/qemu-system-x86_64]
0x557a57b0e9b5 : memory_region_find_rcu+0x2e5/0x310 [/data00/migration/qemu-open/build/qemu-system-x86_64]
0x557a57b11165 : memory_region_find+0x55/0xf0 [/data00/migration/qemu-open/build/qemu-system-x86_64]
0x557a57a07638 : vapic_prepare+0x58/0x250 [/data00/migration/qemu-open/build/qemu-system-x86_64]
0x557a57a07a7b : vapic_post_load+0x1b/0x80 [/data00/migration/qemu-open/build/qemu-system-x86_64]

>
>> 4.tcg_commit
> This is not enabled if kvm is on, right?

Yes.

I obtained these results from qtests. And some qtests enabled tcg.😁

>
>> 5.ahci_state_post_load
>>
>> During my test, virtio_init_region_cache() will frequently trigger
>> do_commit() in address_space_to_flatview(), which will reduce the
>> optimization  effect of v6 compared with v1.
> IIU above 1 & 4 could leverage one address_space_to_flatview_rcu() which
> can keep the old semantics of address_space_to_flatview() by just assert
> rcu read lock and do qatomic_rcu_read() (e.g., tcg_commit() will run again
> at last stage of vm load).  Not sure how much it'll help.

This can really improve the performance of the existing patch, which is
basically the same as that of v1, but it needs to add address_space_to_flatview_rcu()
and address_space_get_flatview_rcu(). I have also considered this, but will
others find it confusing? Because there will be to_flatview(), to_flatview_raw()
and to_flatview_rcu()..

>
> You may also want to have a look at the other patch to optimize ioeventfd
> commit here; I think that'll also speed up vm load but not sure how much
> your series can further do upon:
>
> https://lore.kernel.org/all/20230228142514.2582-1-longpeng2@huawei.com/
>
> Thanks,

Here are the latest test results:

test info:
- Host
   - Intel(R) Xeon(R) Platinum 8362 CPU
   - Mellanox Technologies MT28841
- VM
   - 32 CPUs 128GB RAM VM
   - 8 16-queue vhost-net device
   - 16 4-queue vhost-user-blk device.

			time of loading non-iterable vmstate
before		 			112 ms
long's patch applied			103 ms
my patch applied	 	 	 44 ms
both applied		 	 	 39 ms
add as_to_flat_rcu			 19 ms


