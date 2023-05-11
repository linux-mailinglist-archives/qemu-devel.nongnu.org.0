Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 88A3D6FF249
	for <lists+qemu-devel@lfdr.de>; Thu, 11 May 2023 15:13:29 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1px664-0003w5-4N; Thu, 11 May 2023 09:12:40 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <quintela@redhat.com>)
 id 1px662-0003vo-7h
 for qemu-devel@nongnu.org; Thu, 11 May 2023 09:12:38 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <quintela@redhat.com>)
 id 1px65u-00005u-5u
 for qemu-devel@nongnu.org; Thu, 11 May 2023 09:12:37 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1683810749;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:in-reply-to:in-reply-to:  references:references;
 bh=1owvL7mc9vXwDXq35pvWSCK2PsaTDdwdgXye4IQlmXs=;
 b=Wfi9MogQ6sNCj5puN9lxMTup3XyAU1xaL9DFQJR37CRNJidoOo2fzB1XAaU62r0ycbdJrb
 bdqOq3e2pDf5VelNiZXer5GumrAD+IVPgxLpg9Mu5aDF41+JauI/Xi6f4Q6e77unmfOCtm
 yyOiqfsgJGuBgRIYC8BKiidUFrhOO7I=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-637-Rb5Z7pqwPHGP1ge-sb599Q-1; Thu, 11 May 2023 09:12:27 -0400
X-MC-Unique: Rb5Z7pqwPHGP1ge-sb599Q-1
Received: by mail-wm1-f71.google.com with SMTP id
 5b1f17b1804b1-3f4245ffbb4so27645285e9.3
 for <qemu-devel@nongnu.org>; Thu, 11 May 2023 06:12:27 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1683810746; x=1686402746;
 h=mime-version:message-id:date:reply-to:user-agent:references
 :in-reply-to:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=1owvL7mc9vXwDXq35pvWSCK2PsaTDdwdgXye4IQlmXs=;
 b=ImG3YJGR/z/TnjsxtVmtr/5lfgIYucjWORIHIUE54dxlhO9w55iXDyPTN9CDYu+wAz
 VCelcJxuwnPnHhgB61nInAO+E8y5jFMnTZ5jX4CKdkouthgy1P/Pru/bpnpyr1S8s+0D
 dhMFHiqKNT3n6WELBHNvS1tBKce4iWNeQ6IjZG4uT9gYtSOK1e35wJTeLVlBAikDR9bZ
 fTRAsoxGhnwekVzoW4ORFlp1u7Dvla9CnvuPA/qcIn1ol8V6Yqcc9kwM+G97zRvCtLon
 SxMYHjzhOtnsoBDrFPNr/5cplkZaBABIYTv8chmu5Zn55YSCFPak4SYOD/7Vzc3QA3ak
 C/DA==
X-Gm-Message-State: AC+VfDxUiklSe2vNh6/f90nsBB9z+MoGdAuFx2t7JKPhC+i3f7ougwT/
 e9QiWK7Q8jW3zAZvtzoc0APJeaWnotianRV1fChpgggUvtn2ELNv6H7DOca3ikvTf5AGnaj5VxC
 Voy8sDx9H6BEIGPc=
X-Received: by 2002:a5d:68cf:0:b0:306:30ea:a060 with SMTP id
 p15-20020a5d68cf000000b0030630eaa060mr16031036wrw.51.1683810746730; 
 Thu, 11 May 2023 06:12:26 -0700 (PDT)
X-Google-Smtp-Source: ACHHUZ4VatYFNeROjzLbOdfisWjJA4klRIJjgQqmYKapdcmTiuhzIUtrO48QI2PBv9l6KfRmZoHqOw==
X-Received: by 2002:a5d:68cf:0:b0:306:30ea:a060 with SMTP id
 p15-20020a5d68cf000000b0030630eaa060mr16031012wrw.51.1683810746364; 
 Thu, 11 May 2023 06:12:26 -0700 (PDT)
Received: from redhat.com (static-92-120-85-188.ipcom.comunitel.net.
 [188.85.120.92]) by smtp.gmail.com with ESMTPSA id
 e12-20020adfe7cc000000b002c54c9bd71fsm20498471wrn.93.2023.05.11.06.12.25
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 11 May 2023 06:12:25 -0700 (PDT)
From: Juan Quintela <quintela@redhat.com>
To: Richard Henderson <richard.henderson@linaro.org>
Cc: qemu-devel@nongnu.org,  Andrei Gudkov <gudkov.andrei@huawei.com>,
 Leonardo Bras <leobras@redhat.com>,  Chuan Zheng <zhengchuan@huawei.com>,
 Peter Xu <peterx@redhat.com>,  Zhenzhong Duan <zhenzhong.duan@intel.com>
Subject: Re: [PATCH 1/3] migration: Teach dirtyrate about
 qemu_target_page_size()
In-Reply-To: <80a9bfb8-c99c-7b78-fac0-867f68779f21@linaro.org> (Richard
 Henderson's message of "Thu, 11 May 2023 12:07:58 +0100")
References: <20230511092239.14607-1-quintela@redhat.com>
 <20230511092239.14607-2-quintela@redhat.com>
 <80a9bfb8-c99c-7b78-fac0-867f68779f21@linaro.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/28.2 (gnu/linux)
Date: Thu, 11 May 2023 15:12:24 +0200
Message-ID: <87fs833tc7.fsf@secure.mitica>
MIME-Version: 1.0
Content-Type: text/plain
Received-SPF: pass client-ip=170.10.129.124; envelope-from=quintela@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
Reply-To: quintela@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

Richard Henderson <richard.henderson@linaro.org> wrote:
> On 5/11/23 10:22, Juan Quintela wrote:
>> Signed-off-by: Juan Quintela <quintela@redhat.com>
>> ---
>>   migration/dirtyrate.c | 11 ++++++-----
>>   1 file changed, 6 insertions(+), 5 deletions(-)
>> diff --git a/migration/dirtyrate.c b/migration/dirtyrate.c
>> index 180ba38c7a..9aa092738c 100644
>> --- a/migration/dirtyrate.c
>> +++ b/migration/dirtyrate.c
>> @@ -17,6 +17,7 @@
>>   #include "cpu.h"
>>   #include "exec/ramblock.h"
>>   #include "exec/ram_addr.h"
>> +#include "exec/target_page.h"
>>   #include "qemu/rcu_queue.h"
>>   #include "qemu/main-loop.h"
>>   #include "qapi/qapi-commands-migration.h"
>> @@ -78,7 +79,7 @@ static int64_t do_calculate_dirtyrate(DirtyPageRecord dirty_pages,
>>       uint64_t increased_dirty_pages =
>>           dirty_pages.end_pages - dirty_pages.start_pages;
>>   -    memory_size_MB = (increased_dirty_pages * TARGET_PAGE_SIZE)
>> >> 20;
>> +    memory_size_MB = (increased_dirty_pages * qemu_target_page_size()) >> 20;
>
> See the recent cleanups for dirtylimit_dirty_ring_full_time, folding
> multiply+shift into subtract+shift.

I reviewed it and I had already forgotten!!

>>         return memory_size_MB * 1000 / calc_time_ms;
>>   }
>> @@ -291,8 +292,8 @@ static void update_dirtyrate_stat(struct RamblockDirtyInfo *info)
>>       DirtyStat.page_sampling.total_dirty_samples += info->sample_dirty_count;
>>       DirtyStat.page_sampling.total_sample_count += info->sample_pages_count;
>>       /* size of total pages in MB */
>> -    DirtyStat.page_sampling.total_block_mem_MB += (info->ramblock_pages *
>> -                                                   TARGET_PAGE_SIZE) >> 20;
>> +    DirtyStat.page_sampling.total_block_mem_MB +=
>> +        (info->ramblock_pages * qemu_target_page_size()) >> 20;
>
> And a third copy?
> Can we abstract this somewhere?

I ended with this:

/* Convert target pages to MiB (2**20). */
size_t qemu_target_pages_to_MiB(size_t pages)
{
    int page_bits = TARGET_PAGE_BITS;

    /* So far, the largest (non-huge) page size is 64k, i.e. 16 bits. */
    g_assert(page_bits < 20);

    return pages >> (20 - page_bits);
}

But only found 3 users, the one that you did and this two.

Will resend the series on top of this.

Thanks, Juan.


