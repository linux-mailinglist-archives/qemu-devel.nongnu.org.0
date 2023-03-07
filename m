Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 941A96AE068
	for <lists+qemu-devel@lfdr.de>; Tue,  7 Mar 2023 14:26:14 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pZXJD-0002rk-LK; Tue, 07 Mar 2023 08:24:51 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <xuchuangxclwt@bytedance.com>)
 id 1pZXJB-0002px-DT
 for qemu-devel@nongnu.org; Tue, 07 Mar 2023 08:24:49 -0500
Received: from mail-pl1-x62f.google.com ([2607:f8b0:4864:20::62f])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <xuchuangxclwt@bytedance.com>)
 id 1pZXJ9-0002aL-1v
 for qemu-devel@nongnu.org; Tue, 07 Mar 2023 08:24:48 -0500
Received: by mail-pl1-x62f.google.com with SMTP id u5so13993169plq.7
 for <qemu-devel@nongnu.org>; Tue, 07 Mar 2023 05:24:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bytedance.com; s=google; t=1678195478;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to:subject
 :user-agent:mime-version:date:message-id:from:to:cc:subject:date
 :message-id:reply-to;
 bh=GrlnJz2e1OmyaXOiYF9Ju0XXfOkFqC5OfX8DCZG+Lc0=;
 b=jtishNFtK4kwklV8DBCB4bm77pcxu/NsYTV7kyN4djOoNyR2gaa6a8uPalMXZMED/a
 GTTUmK74nbeTv82P0rYAAKugWyqhv9s5HtvYDBDudmfILkBZ8s/nplT2S4N0vAZjV+KX
 eIvzssTuDCHLoZUioXTjGH0l8/1XifMaDk6Leo1XgQm7Mr8KXAlLpnVLx6y/4VmM5UNQ
 SnahQ0AsNoygRvZzx3xGzDjmrsN9IUmd+GqDJbD/IMMLp3vMg3+VQE1W3gZSOp4JR/eS
 ea5ExMHNTWn7/56/v5BnMlz4UHeGI6HnL5Y92QzVwKBru77RY5z0C5AH6eiIKthTilbb
 NhmQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1678195478;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to:subject
 :user-agent:mime-version:date:message-id:x-gm-message-state:from:to
 :cc:subject:date:message-id:reply-to;
 bh=GrlnJz2e1OmyaXOiYF9Ju0XXfOkFqC5OfX8DCZG+Lc0=;
 b=QDcRuV2ALzbGCwUeFOi3Exj6hbi4ioub+vGfy9VO0EDhYModwm0RekVckJYnz434oB
 XaG51BdnP8Wnt4XyCz/YUgukOWYBwfyGkbFScCAz8cTu4z2ZgvNu65mVqXlcrFgblOxi
 oTDtN2KC4EJrCzRv+bbqzgbPSo9Xdnz470dsouiUaN8Yq2NQq3yY/dLUrnbJuF1cxlxh
 aicXpf2Pw4PGMiwUq2owAnFtm7GgsZ0kjGe1S94HvgeRxBVK3I3fCxRq44FP4sHNkNGy
 hvrK9bAM5v1djAd1N5CdyHiKZ328WXT9vVfNxWEcpI8TNnPVJzMv7EHBWioEcBw7W8Pk
 VKFQ==
X-Gm-Message-State: AO0yUKW3ikOSEe/7kWApsC9UKr1HNaAydI6VRch5sP3w+l+KbcRio58G
 0+ZcG2G+cZpNU1awFBvhix08/A==
X-Google-Smtp-Source: AK7set+xJV9qloDowcZTMrjNGg1IfI/EWFILoOCG7GGVqwHB4xO30FAx4+mHEJGkKACCGGXPgm2fNg==
X-Received: by 2002:a17:903:1247:b0:19e:e39b:6d90 with SMTP id
 u7-20020a170903124700b0019ee39b6d90mr1996982plh.25.1678195477871; 
 Tue, 07 Mar 2023 05:24:37 -0800 (PST)
Received: from [10.200.8.54] ([139.177.225.253])
 by smtp.gmail.com with ESMTPSA id
 w22-20020a1709029a9600b0018963b8e131sm8362251plp.290.2023.03.07.05.24.34
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 07 Mar 2023 05:24:37 -0800 (PST)
Message-ID: <f6e36da0-d20b-af80-4239-5bb59b97f530@bytedance.com>
Date: Tue, 7 Mar 2023 21:24:31 +0800
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
 <ZAUSPo9bJO0udf9p@x1n> <1ea4db90-7535-1dc3-a2ae-d44113a24e29@bytedance.com>
 <ZAZRn9eNG1TEoEl1@x1n>
From: Chuang Xu <xuchuangxclwt@bytedance.com>
In-Reply-To: <ZAZRn9eNG1TEoEl1@x1n>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::62f;
 envelope-from=xuchuangxclwt@bytedance.com; helo=mail-pl1-x62f.google.com
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

On 2023/3/7 上午4:48, Peter Xu wrote:
> On Mon, Mar 06, 2023 at 08:48:05PM +0800, Chuang Xu wrote:
>> Hi, Peter,
>>
>> On 2023/3/6 上午6:05, Peter Xu wrote:
>>>> 1.virtio_load->virtio_init_region_cache
>>>> 2.virtio_load->virtio_set_features_nocheck
>>> What is this one specifically?  I failed to see quickly why this needs to
>>> reference the flatview.
>> 0x560f3bb26510 : memory_region_transaction_do_commit+0x0/0x1c0 [/data00/migration/qemu-open/build/qemu-system-x86_64]
>> 0x560f3bb26e45 : address_space_get_flatview+0x95/0x100 [/data00/migration/qemu-open/build/qemu-system-x86_64]
>> 0x560f3bb296b6 : memory_listener_register+0xf6/0x300 [/data00/migration/qemu-open/build/qemu-system-x86_64]
>> 0x560f3baec59f : virtio_device_realize+0x12f/0x1a0 [/data00/migration/qemu-open/build/qemu-system-x86_64]
>> 0x560f3bbb3b1f : device_set_realized+0x2ff/0x660 [/data00/migration/qemu-open/build/qemu-system-x86_64]
>> 0x560f3bbb6ec6 : property_set_bool+0x46/0x70 [/data00/migration/qemu-open/build/qemu-system-x86_64]
>> 0x560f3bbb9173 : object_property_set+0x73/0x100 [/data00/migration/qemu-open/build/qemu-system-x86_64]
>> 0x560f3bbbc1ef : object_property_set_qobject+0x2f/0x50 [/data00/migration/qemu-open/build/qemu-system-x86_64]
>> 0x560f3bbb93e4 : object_property_set_bool+0x34/0xa0 [/data00/migration/qemu-open/build/qemu-system-x86_64]
>> 0x560f3b9830d9 : virtio_pci_realize+0x299/0x4e0 [/data00/migration/qemu-open/build/qemu-system-x86_64]
>> 0x560f3b901204 : pci_qdev_realize+0x7e4/0x1090 [/data00/migration/qemu-open/build/qemu-system-x86_64]
>> 0x560f3bbb3b1f : device_set_realized+0x2ff/0x660 [/data00/migration/qemu-open/build/qemu-system-x86_64]
>> 0x560f3bbb6ec6 : property_set_bool+0x46/0x70 [/data00/migration/qemu-open/build/qemu-system-x86_64]
>> 0x560f3bbb9173 : object_property_set+0x73/0x100 [/data00/migration/qemu-open/build/qemu-system-x86_64]
>> 0x560f3bbbc1ef : object_property_set_qobject+0x2f/0x50 [/data00/migration/qemu-open/build/qemu-system-x86_64]
>> 0x560f3bbb93e4 : object_property_set_bool+0x34/0xa0 [/data00/migration/qemu-open/build/qemu-system-x86_64]
>> 0x560f3b99e4a0 : qdev_device_add_from_qdict+0xb00/0xc40 [/data00/migration/qemu-open/build/qemu-system-x86_64]
>> 0x560f3bac0c75 : virtio_net_set_features+0x385/0x490 [/data00/migration/qemu-open/build/qemu-system-x86_64]
>> 0x560f3baec238 : virtio_set_features_nocheck+0x58/0x70 [/data00/migration/qemu-open/build/qemu-system-x86_64]
>> 0x560f3baf1e9e : virtio_load+0x33e/0x820 [/data00/migration/qemu-open/build/qemu-system-x86_64]
> I think this one can also be avoided.  Basically any memory listener
> related op can avoid referencing the latest flatview because even if it's
> during depth>0 it'll be synced again when depth==0.
>
>>>> 3.vapic_post_load
>>> Same confusion to this one..
>> 0x557a57b0e510 : memory_region_transaction_do_commit+0x0/0x1c0 [/data00/migration/qemu-open/build/qemu-system-x86_64]
>> 0x557a57b0e9b5 : memory_region_find_rcu+0x2e5/0x310 [/data00/migration/qemu-open/build/qemu-system-x86_64]
>> 0x557a57b11165 : memory_region_find+0x55/0xf0 [/data00/migration/qemu-open/build/qemu-system-x86_64]
>> 0x557a57a07638 : vapic_prepare+0x58/0x250 [/data00/migration/qemu-open/build/qemu-system-x86_64]
>> 0x557a57a07a7b : vapic_post_load+0x1b/0x80 [/data00/migration/qemu-open/build/qemu-system-x86_64]
> AFAIU this one is the other one that truly need to reference the latest
> flatview; the other one is (5) on AHCI.  It's a pity that it uses
> memory_region_find_rcu() even if it must already have BQL so it's kind of
> unclear (and enforced commit should never need to happen with RCU
> logically..).
>
>>>> 4.tcg_commit
>>> This is not enabled if kvm is on, right?
>> Yes.
>>
>> I obtained these results from qtests. And some qtests enabled tcg.😁
>>
>>>> 5.ahci_state_post_load
>>>>
>>>> During my test, virtio_init_region_cache() will frequently trigger
>>>> do_commit() in address_space_to_flatview(), which will reduce the
>>>> optimization  effect of v6 compared with v1.
>>> IIU above 1 & 4 could leverage one address_space_to_flatview_rcu() which
>>> can keep the old semantics of address_space_to_flatview() by just assert
>>> rcu read lock and do qatomic_rcu_read() (e.g., tcg_commit() will run again
>>> at last stage of vm load).  Not sure how much it'll help.
>> This can really improve the performance of the existing patch, which is
>> basically the same as that of v1, but it needs to add address_space_to_flatview_rcu()
>> and address_space_get_flatview_rcu(). I have also considered this, but will
>> others find it confusing? Because there will be to_flatview(), to_flatview_raw()
>> and to_flatview_rcu()..
> Why do we need address_space_get_flatview_rcu()?  I'm not sure whether you

address_space_cahce_init() uses address_space_get_flatview() to acquire
a ref-ed flatview. If we want to use address_space_to_flatview_rcu() and
make the flatview ref-ed, maybe we need to add address_space_get_flatview_rcu()?
Or if we use address_space_to_flatview_rcu() directly, then we'll get a
unref-ed flatview, I'm not sure wheather it's safe in other cases.. At least
I don't want the assertion to be triggered one day.

> mean the two calls in memory listener add/del, if so would you consider a
> fixup that I attached in this reply and squash it into patch 1 of mine?  I
> assume that'll also remove case (2) above, and also remove the need to have
> address_space_get_flatview_rcu().

Later fixed in v7.

>
> Having address_space_to_flatview_rcu() alone is fine to me (which is
> actually the original address_space_to_flatview).  Again IMHO it should
> only be called in the case where a stall flatview doesn't hurt.
>
Thanks!


