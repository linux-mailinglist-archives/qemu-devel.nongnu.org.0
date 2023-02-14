Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 650D6695B8A
	for <lists+qemu-devel@lfdr.de>; Tue, 14 Feb 2023 08:58:15 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pRqBy-0003ks-LZ; Tue, 14 Feb 2023 02:57:34 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <xuchuangxclwt@bytedance.com>)
 id 1pRqBt-0003kK-GZ
 for qemu-devel@nongnu.org; Tue, 14 Feb 2023 02:57:30 -0500
Received: from mail-pf1-x432.google.com ([2607:f8b0:4864:20::432])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <xuchuangxclwt@bytedance.com>)
 id 1pRqBq-0002Yc-U6
 for qemu-devel@nongnu.org; Tue, 14 Feb 2023 02:57:29 -0500
Received: by mail-pf1-x432.google.com with SMTP id n2so9623415pfo.3
 for <qemu-devel@nongnu.org>; Mon, 13 Feb 2023 23:57:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bytedance-com.20210112.gappssmtp.com; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to:subject
 :user-agent:mime-version:date:message-id:from:to:cc:subject:date
 :message-id:reply-to;
 bh=IVljw1EBgbhgUwz797ZHC/k4dNcC6C90usGXLPkuY6k=;
 b=ROTHNFLepc2K79hcOtnJbAHSJmFXUhVAwEUCu3VmQCS8QatzZEdAJ7Gcc5CNS8WXJg
 s3/9D69K8v9mPamNnB5l7k7houy4v8Ga7QEjIurmEq9+FiGKeuhUFfIdV4Tl6YOVGHIK
 19AtHjVA7p+uYsEFGz3jAH5QRvPuGmOYrqyq3uAInGlGt45t9DdOSgDT+PgkCZ+Hobxx
 5rdf5A/jtxBfMVyxW04E8qjQVYF0UVK7Tm70uIaWR2yir91pCvDRvob2z0St/Yw4pUhE
 ALFGCvNR0TpGynpWzeVqZRJcCUyzzYlzTDDNZR9qv+NIrKG8zttFi8tfKxdYcWes27Nb
 RjDg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to:subject
 :user-agent:mime-version:date:message-id:x-gm-message-state:from:to
 :cc:subject:date:message-id:reply-to;
 bh=IVljw1EBgbhgUwz797ZHC/k4dNcC6C90usGXLPkuY6k=;
 b=jXa3sOkR/abHRpPwUjvr5jPj4BiL0Kugf0tWFXaZIhSehkLwhjpq+QNB87nQwOQ5b8
 L7PdFmsF/FH1c3f8lMRFtJW6CG0m+YqdjI9OvNLd+x8VVFCym4AUszlIiy+emrP8LAXO
 aVRtjIgcTCEx+GriBl6r52/rZdDm4oZD14VOLyT4v0s5UqUbyuNpDdYAaDaKrC/kTz7O
 is3eTEGhq9bPe4iq/rR0IH0FZIPgi9EV/7vf/BvXL0lgvEv8Y64wmt04O+FnZ2yoDacv
 C35Z+uBUfAxpZO2fM8KrEjJ7cBsZ/62YNv4LB7MDTNz52xndkwz4fqL/nBPVjQ09aI/e
 mqUw==
X-Gm-Message-State: AO0yUKXV9S8ZrYCKb+F4DDtHoVqtVpz63j//t4I4eym05Vn5pUonpV4S
 dH8P2A/ajvTQONWBQ6411p3l2g==
X-Google-Smtp-Source: AK7set/HNw9qqKCqbWFGz0ovQDNfRuOMggwnrR7sGYmDnEZXxhkiyTMVrEEFFKAvehRjSaN/xxnAXw==
X-Received: by 2002:aa7:8f17:0:b0:592:4502:fb0 with SMTP id
 x23-20020aa78f17000000b0059245020fb0mr1162947pfr.0.1676361439407; 
 Mon, 13 Feb 2023 23:57:19 -0800 (PST)
Received: from [10.94.53.13] ([139.177.225.233])
 by smtp.gmail.com with ESMTPSA id
 d17-20020aa78691000000b005a7ae8b3a09sm9187984pfo.32.2023.02.13.23.57.16
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 13 Feb 2023 23:57:19 -0800 (PST)
Message-ID: <57882a91-cefd-9ac1-5f3e-472196109536@bytedance.com>
Date: Tue, 14 Feb 2023 15:57:14 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.6.1
Subject: Re: [RFC v5 1/3] rcu: introduce rcu_read_is_locked()
To: pbonzini@redhat.com
Cc: qemu-devel@nongnu.org, quintela@redhat.com, dgilbert@redhat.com,
 peterx@redhat.com, david@redhat.com, philmd@linaro.org,
 zhouyibo@bytedance.com
References: <20230117115511.3215273-1-xuchuangxclwt@bytedance.com>
 <20230117115511.3215273-2-xuchuangxclwt@bytedance.com>
 <87r0v8s58m.fsf@secure.mitica>
From: Chuang Xu <xuchuangxclwt@bytedance.com>
In-Reply-To: <87r0v8s58m.fsf@secure.mitica>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::432;
 envelope-from=xuchuangxclwt@bytedance.com; helo=mail-pf1-x432.google.com
X-Spam_score_int: -10
X-Spam_score: -1.1
X-Spam_bar: -
X-Spam_report: (-1.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, FROM_LOCAL_NOVOWEL=0.5, HK_RANDOM_ENVFROM=0.001,
 HK_RANDOM_FROM=0.634, NICE_REPLY_A=-0.345, RCVD_IN_DNSWL_NONE=-0.0001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=no autolearn_force=no
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

Hi, Paolo!

On 2023/2/2 下午6:59, Juan Quintela wrote:
> Chuang Xu <xuchuangxclwt@bytedance.com> wrote:
>> add rcu_read_is_locked() to detect holding of rcu lock.
>>
>> Signed-off-by: Chuang Xu <xuchuangxclwt@bytedance.com>
> Reviewed-by: Juan Quintela <quintela@redhat.com>
>
> Althought I think that petting a review from Paolo or anyone that knows
> more than RCU could be a good idea.
>
>> ---
>>   include/qemu/rcu.h | 7 +++++++
>>   1 file changed, 7 insertions(+)
>>
>> diff --git a/include/qemu/rcu.h b/include/qemu/rcu.h
>> index b063c6fde8..719916d9d3 100644
>> --- a/include/qemu/rcu.h
>> +++ b/include/qemu/rcu.h
>> @@ -119,6 +119,13 @@ static inline void rcu_read_unlock(void)
>>       }
>>   }
>>   
>> +static inline bool rcu_read_is_locked(void)
>> +{
>> +    struct rcu_reader_data *p_rcu_reader = get_ptr_rcu_reader();
>> +
>> +    return p_rcu_reader->depth > 0;
>> +}
>> +
>>   extern void synchronize_rcu(void);
>>   
>>   /*

Do you have any more suggestions about patch1?

Looking forward to your reply.

Thanks！


