Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6B3F0453808
	for <lists+qemu-devel@lfdr.de>; Tue, 16 Nov 2021 17:47:40 +0100 (CET)
Received: from localhost ([::1]:57688 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mn1cR-0002nm-Hw
	for lists+qemu-devel@lfdr.de; Tue, 16 Nov 2021 11:47:39 -0500
Received: from eggs.gnu.org ([209.51.188.92]:57680)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <hreitz@redhat.com>) id 1mn1b3-0000En-0k
 for qemu-devel@nongnu.org; Tue, 16 Nov 2021 11:46:15 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:40130)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <hreitz@redhat.com>) id 1mn1b0-0007WH-IB
 for qemu-devel@nongnu.org; Tue, 16 Nov 2021 11:46:11 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1637081169;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=uezzHXiCCDA4GdX9CdojPtQaufpzjqUO0iWRdy7Q5KM=;
 b=M76kE00FfJB0wu0VwLdidxYj6Y3U9EsNqN88lOILXqgNJoy8ZEdQSzncSH0XEiz1r638zZ
 xDakZfEwgoBP+JGAVUIAL3kbyP8vJIYXoJKk+0xLCi/S+kiMvXxxSjupvqYN3YYxb+DGz4
 F8y78s0Z0szMpqx9psGnK+O0n9xEpRo=
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-478-u3q7vieTOYOvBKiNBH9EHg-1; Tue, 16 Nov 2021 11:46:07 -0500
X-MC-Unique: u3q7vieTOYOvBKiNBH9EHg-1
Received: by mail-wr1-f71.google.com with SMTP id
 y4-20020adfd084000000b00186b16950f3so4657455wrh.14
 for <qemu-devel@nongnu.org>; Tue, 16 Nov 2021 08:46:07 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=uezzHXiCCDA4GdX9CdojPtQaufpzjqUO0iWRdy7Q5KM=;
 b=wtzK9bKY9r7RtRihsC4ZfPjineKxmRP1fIZoqygpdXLaeyGqSzR3ywodXL0J0KDoFc
 jBuwa5kLTIf8rN3mfGhiY3FozLoS5vmu+zCMo47jcK3CFWL2pWFcxCa62qDCFKB9dEJa
 91ilB6hRYdYi4jGtmAkOblx0VmQOOgPMQFYE6Maj9ypd0wl3uL6gwAj4yyKBkc2c7th4
 biL0G0RZVYeDEUVsHMyZa68u0KZMYG9iVay/lG7pPE0Zo3AWpZMZkBt698xKrvSzdY17
 XssE5aWb0UaxTN8wP9PK6MG0//nq+WrqV+Sbos0QaMKCYp8/46mkq7VTLZU1HYR7hMS+
 Ys4Q==
X-Gm-Message-State: AOAM530HsaGSOG4apIFS4Ax6Fhc49hT+PSW6jZ73l1OoGXWqlIQSY8n8
 0gpWgmmFNnZvOFgRtnJoZq8UfKQpdWONgw2Le/A3LprkKPqnVr8kivdTc04ZJJ1cBZaf73oRHui
 qqmcS4f3AB5wHg/U=
X-Received: by 2002:a1c:a592:: with SMTP id o140mr9499044wme.10.1637081166149; 
 Tue, 16 Nov 2021 08:46:06 -0800 (PST)
X-Google-Smtp-Source: ABdhPJxs5i81W22P+/PMNQa00QMJAE7qB9RzOc1dfJMJ/LgOxPZLV93Em/Gf7wSIVmk0/p97ghqDPA==
X-Received: by 2002:a1c:a592:: with SMTP id o140mr9498998wme.10.1637081165941; 
 Tue, 16 Nov 2021 08:46:05 -0800 (PST)
Received: from ?IPV6:2a02:8071:5055:3f20:7ad9:a400:6d51:83e6?
 ([2a02:8071:5055:3f20:7ad9:a400:6d51:83e6])
 by smtp.gmail.com with ESMTPSA id j11sm17946330wrt.3.2021.11.16.08.46.05
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 16 Nov 2021 08:46:05 -0800 (PST)
Message-ID: <13bc882d-93b6-08d2-4d7c-3e754b56d707@redhat.com>
Date: Tue, 16 Nov 2021 17:46:04 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.3.0
Subject: Re: [PATCH v4 07/25] assertions for block_int global state API
To: Emanuele Giuseppe Esposito <eesposit@redhat.com>, qemu-block@nongnu.org
References: <20211025101735.2060852-1-eesposit@redhat.com>
 <20211025101735.2060852-8-eesposit@redhat.com>
 <3a330894-9276-7357-ab6d-4386151661f7@redhat.com>
 <96f488d9-534f-5e4d-7b1d-c16c4587bd34@redhat.com>
From: Hanna Reitz <hreitz@redhat.com>
In-Reply-To: <96f488d9-534f-5e4d-7b1d-c16c4587bd34@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=hreitz@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=hreitz@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -48
X-Spam_score: -4.9
X-Spam_bar: ----
X-Spam_report: (-4.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.697,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-1.446, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001,
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
Cc: Kevin Wolf <kwolf@redhat.com>, Fam Zheng <fam@euphon.net>,
 Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>,
 =?UTF-8?Q?Daniel_P=2e_Berrang=c3=a9?= <berrange@redhat.com>,
 Eduardo Habkost <ehabkost@redhat.com>, Juan Quintela <quintela@redhat.com>,
 qemu-devel@nongnu.org, John Snow <jsnow@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Markus Armbruster <armbru@redhat.com>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 Stefan Hajnoczi <stefanha@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Eric Blake <eblake@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 16.11.21 16:43, Emanuele Giuseppe Esposito wrote:
>
>
> On 12/11/2021 14:51, Hanna Reitz wrote:
>> On 25.10.21 12:17, Emanuele Giuseppe Esposito wrote:
>>> Signed-off-by: Emanuele Giuseppe Esposito <eesposit@redhat.com>
>>> Reviewed-by: Stefan Hajnoczi <stefanha@redhat.com>
>>> ---
>>>   block.c                         | 17 +++++++++++++++++
>>>   block/backup.c                  |  1 +
>>>   block/block-backend.c           |  3 +++
>>>   block/commit.c                  |  2 ++
>>>   block/dirty-bitmap.c            |  1 +
>>>   block/io.c                      |  6 ++++++
>>>   block/mirror.c                  |  4 ++++
>>>   block/monitor/bitmap-qmp-cmds.c |  6 ++++++
>>>   block/stream.c                  |  2 ++
>>>   blockdev.c                      |  7 +++++++
>>>   10 files changed, 49 insertions(+)
>>>
>>> diff --git a/block.c b/block.c
>>> index 672f946065..41c5883c5c 100644
>>> --- a/block.c
>>> +++ b/block.c
>>
>> [...]
>>
>>> @@ -7473,6 +7488,7 @@ static bool 
>>> append_strong_runtime_options(QDict *d, BlockDriverState *bs)
>>>    * would result in exactly bs->backing. */
>>>   bool bdrv_backing_overridden(BlockDriverState *bs)
>>>   {
>>> +    assert(qemu_in_main_thread());
>>>       if (bs->backing) {
>>>           return strcmp(bs->auto_backing_file,
>>>                         bs->backing->bs->filename);
>>
>> This function is in block_int-common.h, though.
>
> Can go as GS, since it is under BQL.
>
> (Actually, it is only used in block.c, so if you want I can put it as 
> static). Otherwise, I will just move it to GS.

Sounds good to me.

Hanna


