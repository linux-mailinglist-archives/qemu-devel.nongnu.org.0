Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 371D96FEF6D
	for <lists+qemu-devel@lfdr.de>; Thu, 11 May 2023 11:54:41 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1px2z0-0007s4-0H; Thu, 11 May 2023 05:53:10 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <quintela@redhat.com>)
 id 1px2yt-0007ZY-82
 for qemu-devel@nongnu.org; Thu, 11 May 2023 05:53:06 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <quintela@redhat.com>)
 id 1px2yq-000787-BA
 for qemu-devel@nongnu.org; Thu, 11 May 2023 05:53:01 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1683798779;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:in-reply-to:in-reply-to:  references:references;
 bh=taXacfdfi7l51N+D8qDTYClXtEq1Wg6iGK3pRiujaIA=;
 b=BfAen4Lyi7p+jO9JeHrIo1PE3316EUxziwlENIO9iIcpzXKAvrLDXzNe1Oui3h7EOkraX8
 QahNadnDxp6znLvTPqqYoyAiIzYZ0PsnkkTyPjZd7sD78I7V+YA7Z62Pa/m8aELkZ5u7Wq
 7C12FU0onpfkmptGflfX0KZfIkqr1Bc=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-529-slB4ZLa3OQejenqraxLTfg-1; Thu, 11 May 2023 05:52:58 -0400
X-MC-Unique: slB4ZLa3OQejenqraxLTfg-1
Received: by mail-wm1-f69.google.com with SMTP id
 5b1f17b1804b1-3f33f8ffa37so30241065e9.2
 for <qemu-devel@nongnu.org>; Thu, 11 May 2023 02:52:58 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1683798777; x=1686390777;
 h=mime-version:message-id:date:reply-to:user-agent:references
 :in-reply-to:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=taXacfdfi7l51N+D8qDTYClXtEq1Wg6iGK3pRiujaIA=;
 b=MDB5mRCvvF11wkKJ//lEqbqVJRx+ReFLJDW/7eJlhT5bfKtw4DRsephRNtkCPkSFUC
 sBqLYBB2cWBjI8E5mmkvlP6p5ej0vbs52pjBQmokEFP/EbKZ8vYyAfW+MmivikUHDi/a
 grJ1r5mPyLI3uOKZqQg7g58yZQb1BY/Y6p5KQO+9llNL7yI00qppuCpqIfR3yHlm51B5
 t4N1XS/NQc9xLHL93ppczb/fjFsBKGgimbuwfcfVgnvXDDNWZ/vEMbvhlgm1Fc7n8jG/
 HEnqd9VBSKGK5LzBJUMEjCR1dGdIEjRsZ4vIYuwEb8DI2JJrwvckWQYfrtvLTXHx1lra
 MO/A==
X-Gm-Message-State: AC+VfDxHtUwgpsx3rSUt5qYtGhRFd2da7vu97ZeTqCVif+N4kHgy2WTh
 zPYEJXzJht+YhEq3posutQFcGnVsmeHZMBYRk7PSoU4MtaLF0FJVvKHxZAUe1U5AegTJGw2ehug
 1BHVFohqjieWKjFY=
X-Received: by 2002:a7b:cb91:0:b0:3f4:e70c:219f with SMTP id
 m17-20020a7bcb91000000b003f4e70c219fmr1326798wmi.6.1683798777126; 
 Thu, 11 May 2023 02:52:57 -0700 (PDT)
X-Google-Smtp-Source: ACHHUZ5iS7M76Kiqo0PKaog+xeI5cd/jUw+6ldHzfYVygpiOdLi8lekD1aq2dvm10wkJe0tA2d4Qnw==
X-Received: by 2002:a7b:cb91:0:b0:3f4:e70c:219f with SMTP id
 m17-20020a7bcb91000000b003f4e70c219fmr1326779wmi.6.1683798776651; 
 Thu, 11 May 2023 02:52:56 -0700 (PDT)
Received: from redhat.com (static-92-120-85-188.ipcom.comunitel.net.
 [188.85.120.92]) by smtp.gmail.com with ESMTPSA id
 v13-20020a05600c214d00b003f42461ac75sm12183391wml.12.2023.05.11.02.52.55
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 11 May 2023 02:52:56 -0700 (PDT)
From: Juan Quintela <quintela@redhat.com>
To: Lukas Straub <lukasstraub2@web.de>
Cc: qemu-devel@nongnu.org,  Leonardo Bras <leobras@redhat.com>,  Peter Xu
 <peterx@redhat.com>
Subject: Re: [PATCH] multifd: Add colo support
In-Reply-To: <20230511094713.6f08730c@gecko.fritz.box> (Lukas Straub's message
 of "Thu, 11 May 2023 11:47:13 +0200")
References: <20230509181528.84212-1-quintela@redhat.com>
 <20230511094713.6f08730c@gecko.fritz.box>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/28.2 (gnu/linux)
Date: Thu, 11 May 2023 11:52:55 +0200
Message-ID: <87fs835h54.fsf@secure.mitica>
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

Lukas Straub <lukasstraub2@web.de> wrote:
> On Tue,  9 May 2023 20:15:28 +0200
> Juan Quintela <quintela@redhat.com> wrote:
>
>> From: Lukas Straub <lukasstraub2@web.de>
>> 
>> Like in the normal ram_load() path, put the received pages into the
>> colo cache and mark the pages in the bitmap so that they will be
>> flushed to the guest later.
>> 
>> Signed-off-by: Lukas Straub <lukasstraub2@web.de>
>> 
>> ---
>> 
>> Hi Lukas
>> 
>> What about this instead of your other three patches?  I think it is
>> clearer, and I don't think that we are going to have anything else
>> that is going to hook there anytime soon.
>> 
>> Notice that I put CONFIG_COLO waiting for Vladimir changes to get in
>> before I merge this.
>> 
>> Notice also that I "lost" the line:
>> 
>>   p->host = p->block->host;
>> 
>> In the error case.  But in that case we are aborting the migration, so
>> we don't care.
>> 
>> Can you check if it works for you?
>> Here it compiles, so it must be perfect.
>> 
>> Thanks, Juan.
>
> This way is okay for now. Though I will send a patch.


If it works for you, you can add a review-by and I will integrate in
next PULL.

Later, Juan.

>
> Regards,
> Lukas Straub
>
>> ---
>>  migration/meson.build    |  2 +-
>>  migration/multifd-colo.c | 49 ++++++++++++++++++++++++++++++++++++++++
>>  migration/multifd-colo.h | 24 ++++++++++++++++++++
>>  3 files changed, 74 insertions(+), 1 deletion(-)
>>  create mode 100644 migration/multifd-colo.c
>>  create mode 100644 migration/multifd-colo.h
>> 
>> diff --git a/migration/meson.build b/migration/meson.build
>> index 75de868bb7..c9db40d4d4 100644
>> --- a/migration/meson.build
>> +++ b/migration/meson.build
>> @@ -23,7 +23,7 @@ softmmu_ss.add(files(
>>    'migration.c',
>>    'multifd.c',
>>    'multifd-zlib.c',
>> -  'multifd-zlib.c',
>> +  'multifd-colo.c',
>>    'ram-compress.c',
>>    'options.c',
>>    'postcopy-ram.c',
>> diff --git a/migration/multifd-colo.c b/migration/multifd-colo.c
>> new file mode 100644
>> index 0000000000..10fa1467fa
>> --- /dev/null
>> +++ b/migration/multifd-colo.c
>> @@ -0,0 +1,49 @@
>> +/*
>> + * multifd colo implementation
>> + *
>> + * Copyright (c) Lukas Straub <lukasstraub2@web.de>
>> + *
>> + * This work is licensed under the terms of the GNU GPL, version 2 or later.
>> + * See the COPYING file in the top-level directory.
>> + */
>> +
>> +#include "qemu/osdep.h"
>> +#include "exec/target_page.h"
>> +#include "exec/ramblock.h"
>> +#include "qemu/error-report.h"
>> +#include "qapi/error.h"
>> +#include "ram.h"
>> +#include "multifd.h"
>> +#include "options.h"
>> +#include "io/channel-socket.h"
>> +#include "migration/colo.h"
>> +#include "multifd-colo.h"
>> +
>> +void multifd_colo_prepare_recv_pages(MultiFDRecvParams *p)
>> +{
>> +    if (migrate_colo()) {
>> +        /*
>> +         * While we're still in precopy mode, we copy received pages to both guest
>> +         * and cache. No need to set dirty bits, since guest and cache memory are
>> +         * in sync.
>> +         */
>> +        if (migration_incoming_in_colo_state()) {
>> +            colo_record_bitmap(p->block, p->normal, p->normal_num);
>> +        }
>> +        p->host = p->block->colo_cache;
>> +    }
>> +}
>> +
>> +void multifd_colo_process_recv_pages(MultiFDRecvParams *p)
>> +{
>> +    if (migrate_colo()) {
>> +        if (!migration_incoming_in_colo_state()) {
>> +            for (int i = 0; i < p->normal_num; i++) {
>> +                void *guest = p->block->host + p->normal[i];
>> +                void *cache = p->host + p->normal[i];
>> +                memcpy(guest, cache, p->page_size);
>> +            }
>> +        }
>> +        p->host = p->block->host;
>> +    }
>> +}
>> diff --git a/migration/multifd-colo.h b/migration/multifd-colo.h
>> new file mode 100644
>> index 0000000000..1636c617fc
>> --- /dev/null
>> +++ b/migration/multifd-colo.h
>> @@ -0,0 +1,24 @@
>> +/*
>> + * multifd colo header
>> + *
>> + * Copyright (c) Lukas Straub <lukasstraub2@web.de>
>> + *
>> + * This work is licensed under the terms of the GNU GPL, version 2 or later.
>> + * See the COPYING file in the top-level directory.
>> + */
>> +
>> +#ifndef QEMU_MIGRATION_MULTIFD_COLO_H
>> +#define QEMU_MIGRATION_MULTIFD_COLO_H
>> +
>> +#ifndef CONFIG_COLO
>> +
>> +void multifd_colo_prepare_recv_pages(MultiFDRecvParams *p);
>> +void multifd_colo_process_recv_pages(MultiFDRecvParams *p);
>> +
>> +#else
>> +
>> +static inline void multifd_colo_prepare_recv_pages(MultiFDRecvParams *p) {}
>> +static inline void multifd_colo_process_recv_pages(MultiFDRecvParams *p) {}
>> +
>> +#endif /* CONFIG_COLO */
>> +#endif


