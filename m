Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 387496FF0A3
	for <lists+qemu-devel@lfdr.de>; Thu, 11 May 2023 13:45:31 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1px4j9-0003xc-8O; Thu, 11 May 2023 07:44:55 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <quintela@redhat.com>)
 id 1px4j6-0003sb-Qr
 for qemu-devel@nongnu.org; Thu, 11 May 2023 07:44:52 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <quintela@redhat.com>)
 id 1px4j4-0006IS-AA
 for qemu-devel@nongnu.org; Thu, 11 May 2023 07:44:52 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1683805488;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:in-reply-to:in-reply-to:  references:references;
 bh=uZYzdGQGdlCIbUOXdwj7JxQECezTPBcXRh9KtjfVV/s=;
 b=UhFPZY77kuYyB01NJQeMVRdslJADup3+iOu+9tlqQH5mrQgg4ozwcWtNRKSUPJBDzSBH1o
 owT63ivV5flm3gcfkDc1fCvhna550eIQnBqHAo8223W3GPBoxunTwnwYu8ES+P1GrpRotD
 l0aGhtN/kk8hqkAwcJFz4S/Cbpi7GFY=
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-515-4SBQMrznOFWgZFIGhN4DvQ-1; Thu, 11 May 2023 07:44:47 -0400
X-MC-Unique: 4SBQMrznOFWgZFIGhN4DvQ-1
Received: by mail-wr1-f70.google.com with SMTP id
 ffacd0b85a97d-3077fa61967so4385517f8f.1
 for <qemu-devel@nongnu.org>; Thu, 11 May 2023 04:44:46 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1683805486; x=1686397486;
 h=mime-version:message-id:date:reply-to:user-agent:references
 :in-reply-to:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=uZYzdGQGdlCIbUOXdwj7JxQECezTPBcXRh9KtjfVV/s=;
 b=EeXsBkqqGTzkhpglcW4YPyqgKVB+pVWlZ3AKYJ2je2Zu1B4EAmATcH8pSGzfLOCkyt
 4dohOHFinxpK8smd8eHx8aVri/NRtM/Aov3W0cnKGiULZHgqBuNLzgBZrcl8k6vgFa/a
 J1Kz/3X9Yta1dDXSrNaJyxEcsrkp9Xb0TTC+rSCo+mDOAzMZ60CtE22szvHznU4FGaDN
 Fn2xRkPeoWhHV5ZO+iAkK49Z9gz1UxpF/HSLFJyj2q5oOb3t9TNJq18EK4dViO8p0GF+
 JwIu2fJdrtzzbAE2EszaU1rN89dzeAuH146de9/riTimSC7yAW+cxu8q2Z92ve3+XYk6
 vMAQ==
X-Gm-Message-State: AC+VfDw34N2pXKONtLWD0qrqWPWjrXaIbHgIuhYYBQyD+I/ESx5ST6Ui
 bVHDkxJhBrU2gwdZkI40fTt4+fnDpzg3A3rhYbjyW9AJZikhQcW7QxzCCqmKAwi2WJaLaw49u6A
 MyUGgyNWN+RA+ZUI=
X-Received: by 2002:adf:f849:0:b0:306:35d4:566f with SMTP id
 d9-20020adff849000000b0030635d4566fmr13801994wrq.65.1683805486054; 
 Thu, 11 May 2023 04:44:46 -0700 (PDT)
X-Google-Smtp-Source: ACHHUZ5GCi/QssrLqGylVSSprNXZn6VexzsQdsz5pjuQk2+haRBOpNT1LemNUiAmD2IY6sG6BaXGQw==
X-Received: by 2002:adf:f849:0:b0:306:35d4:566f with SMTP id
 d9-20020adff849000000b0030635d4566fmr13801976wrq.65.1683805485769; 
 Thu, 11 May 2023 04:44:45 -0700 (PDT)
Received: from redhat.com (static-92-120-85-188.ipcom.comunitel.net.
 [188.85.120.92]) by smtp.gmail.com with ESMTPSA id
 e14-20020a056000120e00b00307c46f4f08sm2271106wrx.79.2023.05.11.04.44.45
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 11 May 2023 04:44:45 -0700 (PDT)
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
Date: Thu, 11 May 2023 13:44:44 +0200
Message-ID: <87y1lv3xeb.fsf@secure.mitica>
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
>
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

This is for dirtyrate folks.  But I agree that having to do this so many
times look wrong.  I will wait to see if they answer.

Later, Juan.


