Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5C0AD52846D
	for <lists+qemu-devel@lfdr.de>; Mon, 16 May 2022 14:47:47 +0200 (CEST)
Received: from localhost ([::1]:37214 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nqa8Y-0007vb-EE
	for lists+qemu-devel@lfdr.de; Mon, 16 May 2022 08:47:46 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51186)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <quintela@redhat.com>)
 id 1nqYES-00019P-Ey
 for qemu-devel@nongnu.org; Mon, 16 May 2022 06:45:46 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:30825)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <quintela@redhat.com>)
 id 1nqYEQ-000708-EV
 for qemu-devel@nongnu.org; Mon, 16 May 2022 06:45:44 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1652697941;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:in-reply-to:in-reply-to:  references:references;
 bh=P6rmGYhGgiMMw2w+8LJA95eZZ71fWqFOL7F6BrQHIz0=;
 b=IXTWOqU1ZLp2y6xGeFEjKQaOiXmpz4EX0Sv98scGIBUCyddoQiLwsLKsN6NaqNK83cLk57
 HFm0GVsY+UBqMgqw3prweVLlz48xqhG0FiYod+XoCxonTIOIrLT77MsGIh8+weFVQaefHV
 Uh3cr8CNXifsJImDG5Hyxx+bIcsRKug=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-131-jSa8iYLHMnir2IDbWfhs_Q-1; Mon, 16 May 2022 06:45:40 -0400
X-MC-Unique: jSa8iYLHMnir2IDbWfhs_Q-1
Received: by mail-wm1-f69.google.com with SMTP id
 k5-20020a05600c0b4500b003941ca130f9so6575826wmr.0
 for <qemu-devel@nongnu.org>; Mon, 16 May 2022 03:45:40 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:in-reply-to:references
 :user-agent:reply-to:date:message-id:mime-version;
 bh=P6rmGYhGgiMMw2w+8LJA95eZZ71fWqFOL7F6BrQHIz0=;
 b=YMx9FURhf4E8YildipK+CdABBfT+60qYtOZk3XM3619NSMxr7wx18p5nurJMirpqnw
 v2IJ/lAuSgqnD6tdDsBq33QvJFSo29YG7IUt6/bm2dTMIE2n+2s2UwNtWDlr65rv6N7R
 CVnesROC1Wu1tZklrcWkkEF8CwDGl0CeFIy0MZOZbrlkZVLEWV/MbolfhrPo0xLZ6Yb3
 2b9X+cSee10+i1SOCcPf58rtaUZNLjq1gIXWBBkrfKDMzr+m8BhYQinP5pzg00F8jT9r
 bqKiMAHf3m9SXQuB+KbI/+rcL27M6o9e9Q/grQu99xyp9C5/EKGi/c9nJksenkrGhzh3
 1Sfg==
X-Gm-Message-State: AOAM533NZyLqef+JspWIHgaHTvoOa+8sckInfAdnLlDdHGM91g8wWCYT
 wFqrENpDOZ4ixBoyCoGgZCj3RrkLmBGhUvLb/Urek14TvAgMyJHj1VsHXJvJc6y7Lu0wTmQD7Vn
 i0XWhMrt9JfAFJLs=
X-Received: by 2002:a5d:5954:0:b0:20c:4d55:1388 with SMTP id
 e20-20020a5d5954000000b0020c4d551388mr13740330wri.90.1652697938900; 
 Mon, 16 May 2022 03:45:38 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyrbgyxiSShCUHminDDz+y8dmsrV2Qf15IgIaG4bLn16EPTWesZ4wnXq2b/NUKYeSrEC5FsaA==
X-Received: by 2002:a5d:5954:0:b0:20c:4d55:1388 with SMTP id
 e20-20020a5d5954000000b0020c4d551388mr13740313wri.90.1652697938689; 
 Mon, 16 May 2022 03:45:38 -0700 (PDT)
Received: from localhost (static-211-115-85-188.ipcom.comunitel.net.
 [188.85.115.211]) by smtp.gmail.com with ESMTPSA id
 r20-20020a05600c425400b00397122e63b6sm185725wmm.29.2022.05.16.03.45.38
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 16 May 2022 03:45:38 -0700 (PDT)
From: Juan Quintela <quintela@redhat.com>
To: "Dr. David Alan Gilbert" <dgilbert@redhat.com>
Cc: qemu-devel@nongnu.org,  Eduardo Habkost <eduardo@habkost.net>,  Peter Xu
 <peterx@redhat.com>,  Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?=
 <f4bug@amsat.org>,  Yanan
 Wang <wangyanan55@huawei.com>,  Leonardo Bras <leobras@redhat.com>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>
Subject: Re: [PATCH v6 00/13] Migration: Transmit and detect zero pages in
 the multifd threads
In-Reply-To: <Yn0OMzygfmlXgl8w@work-vm> (David Alan Gilbert's message of "Thu, 
 12 May 2022 14:40:03 +0100")
References: <20220510224220.5912-1-quintela@redhat.com>
 <Yn0OMzygfmlXgl8w@work-vm>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.2 (gnu/linux)
Date: Mon, 16 May 2022 12:45:37 +0200
Message-ID: <87pmkdsqlq.fsf@secure.mitica>
MIME-Version: 1.0
Content-Type: text/plain
Received-SPF: pass client-ip=170.10.129.124; envelope-from=quintela@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

"Dr. David Alan Gilbert" <dgilbert@redhat.com> wrote:
> * Juan Quintela (quintela@redhat.com) wrote:

>> 16GB guest
>>                 Precopy            upstream          zero page
>>                 Time    Downtime   Time    Downtime  Time    Downtime
>> clean idle      1548     93         1359   48         866    167

>                                            866/1359 = 64%


>> dirty idle     16222    220         2092   371       1870    258

>                                            1870/2092 = 89%

>> busy 4GB       don't converge      31000   308       1604    371
>> 
>> In the dirty idle, there is some weirdness in the precopy case, I
>> tried several times and it always took too much time.  It should be
>> faster.
>> 
>> In the busy 4GB case, precopy don't converge (expected) and without
>> zero page, multifd is on the limit, it _almost_ don't convrge, it took
>> 187 iterations to converge.
>> 
>> 1TB
>>                 Precopy            upstream          zero page
>>                 Time    Downtime   Time    Downtime  Time    Downtime
>> clean idle     83174    381        72075   345       52966   273

>                                           52966/72075=74%

>> dirty idle                        104587   381       75601   269

>                                           75601/104587=72%

>> busy 2GB                           79912   345       58953   348
>> 
>> I only tried the clean idle case with 1TB.  Notice that it is already
>> significantively slower.  With 1TB RAM, zero page is clearly superior in all tests.
>> 
>> 4TB
>>                 upstream          zero page
>>                 Time    Downtime  Time    Downtime
>> clean idle      317054  552       215567  500

>                 215567/317054 = 68%

>> dirty idle      357581  553       317428  744

>                 317428/357581 = 89%

>
> The 1TB dirty/idle is a bit of an unusual outlier at 72% time; but still
> the 89% on the 16GB/4TB dirty case is still a useful improvement - I wasn't
> expecting the dirty case to be as good - I wonder if there's some side
> benefit, like meaning the page is only read by the data threads and not
> also read by the main thread so only in one cache?

That could help it, but  Ithink that it is much simpler than that:

live_migration thread with upstream

>    5.07%  live_migration   qemu-system-x86_64       [.] buffer_zero_avx512
>    0.95%  live_migration   qemu-system-x86_64       [.] ram_find_and_save_block.part.0
>    0.88%  live_migration   qemu-system-x86_64       [.] bitmap_test_and_clear_atomic
>    0.36%  live_migration   qemu-system-x86_64       [.] ram_bytes_total_common
>    0.26%  live_migration   qemu-system-x86_64       [.] qemu_ram_is_migratable

Almost 8% CPU.

live migration with zero page:

>    1.59%  live_migration   qemu-system-x86_64       [.] ram_find_and_save_block.part.0
>    1.45%  live_migration   libc.so.6                [.] __pthread_mutex_unlock_usercnt
>    1.28%  live_migration   libc.so.6                [.] __pthread_mutex_lock
>    0.69%  live_migration   qemu-system-x86_64       [.] multifd_send_pages
>    0.48%  live_migration   qemu-system-x86_64       [.] qemu_mutex_unlock_impl
>    0.48%  live_migration   qemu-system-x86_64       [.] qemu_mutex_lock_impl

less than 6% CPU, and remember, we are going way faster, so we are doing
much more work here.  I *think* that it as much related that we are
waiting less time for the migration thread.  Remember that at this
point, we are already limited by the network.

I think that for explaining it, it is much better the zero page case, we
move from upstream:

>  44.27%  live_migration   qemu-system-x86_64       [.] buffer_zero_avx512
>   10.21%  live_migration   qemu-system-x86_64       [.] ram_find_and_save_block.part.0
>    6.58%  live_migration   qemu-system-x86_64       [.] add_to_iovec
>    4.25%  live_migration   qemu-system-x86_64       [.] ram_bytes_total_common
>    2.70%  live_migration   qemu-system-x86_64       [.] qemu_put_byte.part.0
>    2.43%  live_migration   qemu-system-x86_64       [.] bitmap_test_and_clear_atomic
>    2.34%  live_migration   qemu-system-x86_64       [.] qemu_ram_is_migratable
>    1.59%  live_migration   qemu-system-x86_64       [.] qemu_put_be32
>    1.30%  live_migration   qemu-system-x86_64       [.] find_next_bit
>    1.08%  live_migration   qemu-system-x86_64       [.] migrate_ignore_shared
>    0.98%  live_migration   qemu-system-x86_64       [.] ram_save_iterate
>    0.67%  live_migration   [kernel.kallsyms]        [k] copy_user_enhanced_fast_string
>    0.61%  live_migration   qemu-system-x86_64       [.] save_zero_page_to_file.part.0
>    0.45%  live_migration   qemu-system-x86_64       [.] qemu_put_byte
>    0.42%  live_migration   qemu-system-x86_64       [.] save_page_header
>    0.41%  live_migration   qemu-system-x86_64       [.] qemu_put_be64
>    0.35%  live_migration   qemu-system-x86_64       [.] migrate_postcopy_ram

More than 80% (I am too lazy to do the sum), to zero page detection
with:

>  15.49%  live_migration   qemu-system-x86_64       [.] ram_find_and_save_block.part.0
>    3.20%  live_migration   qemu-system-x86_64       [.] ram_bytes_total_common
>    2.67%  live_migration   qemu-system-x86_64       [.] multifd_queue_page
>    2.33%  live_migration   qemu-system-x86_64       [.] bitmap_test_and_clear_atomic
>    2.19%  live_migration   qemu-system-x86_64       [.] qemu_ram_is_migratable
>    1.19%  live_migration   qemu-system-x86_64       [.] find_next_bit
>    1.18%  live_migration   qemu-system-x86_64       [.] migrate_ignore_shared
>    1.14%  live_migration   qemu-system-x86_64       [.] multifd_send_pages
>    0.96%  live_migration   [kernel.kallsyms]        [k] futex_wake
>    0.81%  live_migration   [kernel.kallsyms]        [k] send_call_function_single_ipi
>    0.71%  live_migration   qemu-system-x86_64       [.] ram_save_iterate

almost 32% (also lazy to do the sum).

> (the 10% improvement on the dirty case is more important to me than the
> more impressive number for the clean case)

Fully agree.  Getting this series to go faster with huge guests (1TB/4TB
guests) was relatively easy.  Being sure that we didn't hurt the smaller
guests was more complicated.  The other added benefit is that we don't
sent any page for RAM through the migration channel, that makes things
much better because we use way less overhead.

Later, Juan.


