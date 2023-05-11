Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id AC9206FF0A9
	for <lists+qemu-devel@lfdr.de>; Thu, 11 May 2023 13:47:33 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1px4lD-0005X6-3r; Thu, 11 May 2023 07:47:03 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <quintela@redhat.com>)
 id 1px4l4-0005WQ-20
 for qemu-devel@nongnu.org; Thu, 11 May 2023 07:46:54 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <quintela@redhat.com>)
 id 1px4l2-0006hC-G0
 for qemu-devel@nongnu.org; Thu, 11 May 2023 07:46:53 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1683805587;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:in-reply-to:in-reply-to:  references:references;
 bh=xusqsdeGk0TrKU/tmZjeWch6lXM8VYxapc/6CKKDOno=;
 b=UQSo3FfCIRycEiAbCFU+hddUiW0qwJzg3+XFOzvrhPfcBCbGBVLBLDtdAIqFbwlbMWhHY6
 OSynYOoxVg4RzHIV4hwndYV9KLv8+JqsEUo3FEstTnKebB8/NjM/aWxOSxSgOpHk3MCIsk
 Mm+uJR/bjl6oxw1f3XUZR/dHGLXmpWE=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-496-E6efaMTpOkqNyO4hqOdGJw-1; Thu, 11 May 2023 07:46:25 -0400
X-MC-Unique: E6efaMTpOkqNyO4hqOdGJw-1
Received: by mail-wm1-f72.google.com with SMTP id
 5b1f17b1804b1-3f433a2308bso47527005e9.0
 for <qemu-devel@nongnu.org>; Thu, 11 May 2023 04:46:25 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1683805584; x=1686397584;
 h=mime-version:message-id:date:reply-to:user-agent:references
 :in-reply-to:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=xusqsdeGk0TrKU/tmZjeWch6lXM8VYxapc/6CKKDOno=;
 b=eZ2c2mzP/aug6MObD+ia+h/jGs8nTpkFnCNTTFdkjbr98aj3/VloxggWXDqCc4EXXn
 EfX3S7FWkooyOjKdVkfdxBGHCUk1jX8Pp44C1FQoDtIwDOiihFpxeo3aJstjlEeUNeh/
 1iLXZ3eGTZJyWyI6xOpTpDiO+SwYSZGa3RkKLw6U+/Pl2Dto8W/+pZApTm5wprB7khMb
 7q4SIRyUPROqKh+oB8mRJ+APRQepJC8A3KmqxCH+FdVHHg5mDXOiGVfnJnpyt62qwA54
 2YuFZeFWn2ZiiG59/rlOpmD9RPhHYnh7+OyFU+N2LdJIX6TKkKKSDedury4+qZybjvcs
 ow6g==
X-Gm-Message-State: AC+VfDxkerPaBdWTI2L8z/VPwF5eIxlLzJPnx2wITyKHlTTdOvHEDXSo
 yyQi6PVAcquHlM3V5/GWilFThfj7yaKH/UY12J82j2NFO8Iw7fsV/hhmLjMr4Rho3VU1p9pl/hf
 w7WAgEjNtjzmyP2U=
X-Received: by 2002:a05:600c:4444:b0:3f3:284d:8cec with SMTP id
 v4-20020a05600c444400b003f3284d8cecmr14991407wmn.2.1683805584463; 
 Thu, 11 May 2023 04:46:24 -0700 (PDT)
X-Google-Smtp-Source: ACHHUZ5dn/XiY9cKVolQIB5GFP+nuSjKsk5xBjP+pMioQuHtXFcw30VJ2srk7v67JF3WpCvlZ7d4Kg==
X-Received: by 2002:a05:600c:4444:b0:3f3:284d:8cec with SMTP id
 v4-20020a05600c444400b003f3284d8cecmr14991398wmn.2.1683805584167; 
 Thu, 11 May 2023 04:46:24 -0700 (PDT)
Received: from redhat.com (static-92-120-85-188.ipcom.comunitel.net.
 [188.85.120.92]) by smtp.gmail.com with ESMTPSA id
 q3-20020a1cf303000000b003f3157988f8sm25432632wmq.26.2023.05.11.04.46.23
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 11 May 2023 04:46:23 -0700 (PDT)
From: Juan Quintela <quintela@redhat.com>
To: Richard Henderson <richard.henderson@linaro.org>
Cc: qemu-devel@nongnu.org,  Andrei Gudkov <gudkov.andrei@huawei.com>,
 Leonardo Bras <leobras@redhat.com>,  Chuan Zheng <zhengchuan@huawei.com>,
 Peter Xu <peterx@redhat.com>,  Zhenzhong Duan <zhenzhong.duan@intel.com>
Subject: Re: [PATCH 3/3] migration: Make dirtyrate.c target independent
In-Reply-To: <858bcc8a-e6bc-c929-d007-723afe2b6562@linaro.org> (Richard
 Henderson's message of "Thu, 11 May 2023 12:09:16 +0100")
References: <20230511092239.14607-1-quintela@redhat.com>
 <20230511092239.14607-4-quintela@redhat.com>
 <858bcc8a-e6bc-c929-d007-723afe2b6562@linaro.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/28.2 (gnu/linux)
Date: Thu, 11 May 2023 13:46:22 +0200
Message-ID: <87ttwj3xbl.fsf@secure.mitica>
MIME-Version: 1.0
Content-Type: text/plain
Received-SPF: pass client-ip=170.10.133.124; envelope-from=quintela@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
>> After the previous two patches, there is nothing else that is target
>> specific.
>> Signed-off-by: Juan Quintela <quintela@redhat.com>
>> ---
>>   migration/dirtyrate.c | 2 --
>>   migration/meson.build | 5 ++---
>>   2 files changed, 2 insertions(+), 5 deletions(-)
>> diff --git a/migration/dirtyrate.c b/migration/dirtyrate.c
>> index 76c8b96ab4..f814745bf7 100644
>> --- a/migration/dirtyrate.c
>> +++ b/migration/dirtyrate.c
>> @@ -14,9 +14,7 @@
>>   #include "qemu/error-report.h"
>>   #include <zlib.h>
>>   #include "qapi/error.h"
>> -#include "cpu.h"
>>   #include "exec/ramblock.h"
>> -#include "exec/ram_addr.h"
>>   #include "exec/target_page.h"
>>   #include "qemu/rcu_queue.h"
>>   #include "qemu/main-loop.h"
>> diff --git a/migration/meson.build b/migration/meson.build
>> index eb41b77db9..da437b4a27 100644
>> --- a/migration/meson.build
>> +++ b/migration/meson.build
>> @@ -40,8 +40,7 @@ if get_option('live_block_migration').allowed()
>>     softmmu_ss.add(files('block.c'))
>>   endif
>>   softmmu_ss.add(when: zstd, if_true: files('multifd-zstd.c'))
>> -
>> +softmmu_ss.add(when: 'CONFIG_SOFTMMU', if_true: files('dirtyrate.c'))
>
> This becomes
>
> softmmu_ss.add(files('dirtyrate.c'))
>
> the when: is redundant with 'softmmu_ss'.

It looked weird, but I didn't understand this stuff well enough, so I
just copyed what was there O:-)

Is there any documentation about this?  Because what I usually do is
search for a file that does (more or less) the same that I need and just
add it to that list.

> Otherwise,
> Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

Thanks.


