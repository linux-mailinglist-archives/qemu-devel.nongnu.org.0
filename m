Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7E28B6DD4A7
	for <lists+qemu-devel@lfdr.de>; Tue, 11 Apr 2023 09:52:39 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pm8nO-000605-QF; Tue, 11 Apr 2023 03:52:06 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <david@redhat.com>) id 1pm8nM-0005yW-CI
 for qemu-devel@nongnu.org; Tue, 11 Apr 2023 03:52:04 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <david@redhat.com>) id 1pm8nK-0007ub-JD
 for qemu-devel@nongnu.org; Tue, 11 Apr 2023 03:52:04 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1681199521;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=kIUivMxRXKnTXOfw1x3hNZlbJlsJA1MMTjtFu5nNX6w=;
 b=aZ3OqPGdC7jAlqedLEqKqv5KDldwMfF17AGigeikb98YS6B4LGVb6vQ3FvEAip+FUtHYHl
 z31dtIMBMH/pDmSW0fMGhxQWlwTmny+47i3+q5J6zAZzmMAkHqOzvUC1+VmPwEuQwA1Q/y
 khoeMxhxmOeuOLLx0Nc9pNUO9f++Byw=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-590-KCdQ0HphPKCPylfMxb8qQw-1; Tue, 11 Apr 2023 03:51:57 -0400
X-MC-Unique: KCdQ0HphPKCPylfMxb8qQw-1
Received: by mail-wm1-f72.google.com with SMTP id
 m41-20020a05600c3b2900b003ee502f1b16so2200027wms.9
 for <qemu-devel@nongnu.org>; Tue, 11 Apr 2023 00:51:57 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1681199516; x=1683791516;
 h=content-transfer-encoding:in-reply-to:subject:organization:from
 :content-language:references:to:user-agent:mime-version:date
 :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=kIUivMxRXKnTXOfw1x3hNZlbJlsJA1MMTjtFu5nNX6w=;
 b=sB2zcUoaTQYPL8006MIvAF4e4TkH16mtElKmw5lYqOvS/2zbu/seaMzeb/9nE8Ru52
 zZuaHT+RYdqPhgeCduiF9Ur/nA9aFE/ApOWy3hkCNxrWAY6pdoavH0y2UHPkVxpCIP8k
 4p5/IfntcghkZCzqKDovFU4gqbLtjbmGiBVDr1L8mFB0Fwpf80852KBkS1dq2ofIJKgX
 n+Ts9stz880cUayLNFxqHStjKn8QkJ3LS1DWHfv1qMn1fJ4wydxJKqPuDHx1jnTjtxWO
 UIpoz/UgnuqKi74ymAvwquwT2p1ZVKv3WG7Yskxs7E3IzBZ7SjI8ZukWqjYzhw5tAitB
 wBvQ==
X-Gm-Message-State: AAQBX9elWjM2KFhHPaO/WQykZkABrcU5PpXIIQNlTqvsD9Bot3dhpC+g
 B0kEVCUSm+TZwW5+f3kdam82mh7iV4WaP7TikNxc10YmcjdXsDHl1X+eB6Bwb1hNsmU04JV7B0K
 xfB8U0HOHNjg8kqQ=
X-Received: by 2002:a05:600c:c1:b0:3ed:9ce3:4a39 with SMTP id
 u1-20020a05600c00c100b003ed9ce34a39mr6634911wmm.26.1681199516531; 
 Tue, 11 Apr 2023 00:51:56 -0700 (PDT)
X-Google-Smtp-Source: AKy350Zs1rowAtDKv5wBjbW85V9MHLRDW8Sbs8ag2TU0pbhAofpKozwjVJH0RfubdcEZOcvOJ2UwqQ==
X-Received: by 2002:a05:600c:c1:b0:3ed:9ce3:4a39 with SMTP id
 u1-20020a05600c00c100b003ed9ce34a39mr6634892wmm.26.1681199516142; 
 Tue, 11 Apr 2023 00:51:56 -0700 (PDT)
Received: from ?IPV6:2003:cb:c706:1300:6f08:1748:eba7:b2a9?
 (p200300cbc70613006f081748eba7b2a9.dip0.t-ipconnect.de.
 [2003:cb:c706:1300:6f08:1748:eba7:b2a9])
 by smtp.gmail.com with ESMTPSA id
 z3-20020a05600c0a0300b003ee6aa4e6a9sm20419479wmp.5.2023.04.11.00.51.55
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 11 Apr 2023 00:51:55 -0700 (PDT)
Message-ID: <2f1ba40f-db8f-8bdc-c93b-643939e06189@redhat.com>
Date: Tue, 11 Apr 2023 09:51:54 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.1
To: Eiichi Tsukata <eiichi.tsukata@nutanix.com>, pbonzini@redhat.com,
 marcandre.lureau@redhat.com, berrange@redhat.com, thuth@redhat.com,
 philmd@linaro.org, peterx@redhat.com, qemu-devel@nongnu.org
References: <20230411041158.66728-1-eiichi.tsukata@nutanix.com>
Content-Language: en-US
From: David Hildenbrand <david@redhat.com>
Organization: Red Hat
Subject: Re: [PATCH] physmem: use PR_SET_VMA_ANON_NAME to set ram block name
In-Reply-To: <20230411041158.66728-1-eiichi.tsukata@nutanix.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=david@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -52
X-Spam_score: -5.3
X-Spam_bar: -----
X-Spam_report: (-5.3 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-3.246, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001,
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

On 11.04.23 06:11, Eiichi Tsukata wrote:
> Use linux specific PR_SET_VMA_ANON_NAME (introduced in v5.17) to set ram
> block name in the kernel. This makes each ram block distinguishable and
> can help debugging and inspection. The names of ram blocks are shown in
> /proc/pid/maps like this:
> 
>    7f00e9400000-7f00f1400000 rw-p 00000000 00:00 0      [anon:pc.ram]
>    7f0115200000-7f0115201000 rw-p 00000000 00:00 0      [anon:/rom@etc/acpi/rsdp]
>    7f0115400000-7f0115410000 rw-p 00000000 00:00 0      [anon:/rom@etc/table-loader]
>    7f0115600000-7f0115800000 rw-p 00000000 00:00 0      [anon:/rom@etc/acpi/tables]
>    7f0115a00000-7f0115a40000 rw-p 00000000 00:00 0      [anon:e1000.rom]
>    ...
> 
> Signed-off-by: Eiichi Tsukata <eiichi.tsukata@nutanix.com>
> ---
>   meson.build       | 2 ++
>   softmmu/physmem.c | 9 +++++++++
>   2 files changed, 11 insertions(+)
> 
> diff --git a/meson.build b/meson.build
> index 29f8644d6d..aca889f5f0 100644
> --- a/meson.build
> +++ b/meson.build
> @@ -2040,6 +2040,8 @@ config_host_data.set('HAVE_OPTRESET',
>                        cc.has_header_symbol('getopt.h', 'optreset'))
>   config_host_data.set('HAVE_IPPROTO_MPTCP',
>                        cc.has_header_symbol('netinet/in.h', 'IPPROTO_MPTCP'))
> +config_host_data.set('CONFIG_PRCTL_PR_SET_VMA_ANON_NAME',
> +                     cc.has_header_symbol('sys/prctl.h', 'PR_SET_VMA_ANON_NAME'))

Nit: I'd suggest placing that directly next to the 
CONFIG_PRCTL_PR_SET_TIMERSLACK check.

>   
>   # has_member
>   config_host_data.set('HAVE_SIGEV_NOTIFY_THREAD_ID',
> diff --git a/softmmu/physmem.c b/softmmu/physmem.c
> index e35061bba4..4fe3e14193 100644
> --- a/softmmu/physmem.c
> +++ b/softmmu/physmem.c
> @@ -80,6 +80,10 @@
>   #include <daxctl/libdaxctl.h>
>   #endif
>   
> +#ifdef CONFIG_PRCTL_PR_SET_VMA_ANON_NAME
> +#include <sys/prctl.h>
> +#endif
> +
>   //#define DEBUG_SUBPAGE
>   
>   /* ram_list is read under rcu_read_lock()/rcu_read_unlock().  Writes
> @@ -1810,6 +1814,11 @@ static void ram_block_add(RAMBlock *new_block, Error **errp)
>                   return;
>               }
>               memory_try_enable_merging(new_block->host, new_block->max_length);
> +#ifdef CONFIG_PRCTL_PR_SET_VMA_ANON_NAME
> +            prctl(PR_SET_VMA, PR_SET_VMA_ANON_NAME,
> +                  (unsigned long) new_block->host, new_block->max_length,
> +                  (unsigned long) new_block->mr->name);

We might not have anon memory. I assume that we expect that the prctl 
will simply silently fail (maybe worth a comment) in case we have !anon 
memory.

I assume new_block->mr->name should be set in all cases we care about, 
so LGTM.

Reviewed-by: David Hildenbrand <david@redhat.com>

-- 
Thanks,

David / dhildenb


