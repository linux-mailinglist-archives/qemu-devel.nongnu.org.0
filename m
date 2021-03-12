Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 61660338988
	for <lists+qemu-devel@lfdr.de>; Fri, 12 Mar 2021 11:01:18 +0100 (CET)
Received: from localhost ([::1]:44022 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lKebd-00058a-7Y
	for lists+qemu-devel@lfdr.de; Fri, 12 Mar 2021 05:01:17 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:60898)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1lKeXp-0003as-JF
 for qemu-devel@nongnu.org; Fri, 12 Mar 2021 04:57:21 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:24282)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1lKeXl-0000FZ-1q
 for qemu-devel@nongnu.org; Fri, 12 Mar 2021 04:57:20 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1615543035;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=B63EEVsjGLFTHUzKUYLrKUNhZ2ZzSUyU5Ic5okwuk0w=;
 b=XlGqlsLfIRizy6u33u4JQI1lOXadcEDpyQkYWQR2/N6AdP6cGmIXy4DKLW8pRfnnq9vKwY
 eRTYjhihwRUscZFaR9DYsJf2bD7USZPiGkSJ8hoDdSbqaokC+oOzkSKjuORXWNpdcg/Z2M
 p6iUVY0o8EuSzzQhOjyPWtAS9CtKnto=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-220-TFq-8CJSMyOFWJ_K_35kuA-1; Fri, 12 Mar 2021 04:57:12 -0500
X-MC-Unique: TFq-8CJSMyOFWJ_K_35kuA-1
Received: by mail-wm1-f70.google.com with SMTP id j8so1904812wmq.6
 for <qemu-devel@nongnu.org>; Fri, 12 Mar 2021 01:57:12 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=B63EEVsjGLFTHUzKUYLrKUNhZ2ZzSUyU5Ic5okwuk0w=;
 b=iTufP/iMVUbirZcigt4mZ07QsFZ/EvxqMqPsty0ciNdl3/kZZ6oB7go5ePNf7+I2La
 10qdmryvTtj2ahIAwIdsYmHY0KLut/m8X4NWSyOADKkc0UCf0QJKc7SD6Q02ICeRkVjY
 oc9gqhNrEAt6cXVKu1fGQk4Q0jYb+/Vcfvgs5LLLTllvoXnvHHe7XNewjp/0I66FVb+P
 DUNqIdOtDYMxHksIRVBvRpVZ4SWKlhdjkEAO4/ca62NoDkkFnFWJRD1SDJKbUp16Z3/4
 0qlT/NGR71DAd1CAXwOA+XzqOKsDliRcBEfMD+NPNZEXJcBFszgb32RAJenLmlfwPG4c
 Jf5g==
X-Gm-Message-State: AOAM531sPW/8+uwppELUPWIAeSSFwjT6qRIiokYklGfyJQcoQK9kd1fv
 mY+X/RPo03T9zDvoWsIIj9oTIXwR0rgLP95OwFU5tBgMIaBm15vJACuqbrwtQqllYN3mZdaobRS
 O5EYXnV8NkRMcxK0=
X-Received: by 2002:a05:600c:4146:: with SMTP id
 h6mr12520251wmm.32.1615543031496; 
 Fri, 12 Mar 2021 01:57:11 -0800 (PST)
X-Google-Smtp-Source: ABdhPJw2NXo9vmM7AFytSvAIO0BjG56nK9GyMMJFO1LboynsNIVHvdWF1nw2bbB1hA9NNcjh5Cq1Cw==
X-Received: by 2002:a05:600c:4146:: with SMTP id
 h6mr12520232wmm.32.1615543031272; 
 Fri, 12 Mar 2021 01:57:11 -0800 (PST)
Received: from [192.168.1.36] (17.red-88-21-201.staticip.rima-tde.net.
 [88.21.201.17])
 by smtp.gmail.com with ESMTPSA id m9sm7189149wro.52.2021.03.12.01.57.10
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 12 Mar 2021 01:57:10 -0800 (PST)
Subject: Re: [PATCH] scripts/coccinelle: Catch dubious code after
 &error_abort/&error_fatal
To: Markus Armbruster <armbru@redhat.com>
References: <20210311192700.1441263-1-philmd@redhat.com>
 <87czw4694f.fsf@dusky.pond.sub.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Message-ID: <416fcfa1-7ea1-a722-11b1-619ec1b4fdca@redhat.com>
Date: Fri, 12 Mar 2021 10:57:09 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.0
MIME-Version: 1.0
In-Reply-To: <87czw4694f.fsf@dusky.pond.sub.org>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=63.128.21.124; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.25,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001,
 RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: Kevin Wolf <kwolf@redhat.com>,
 Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 3/12/21 9:58 AM, Markus Armbruster wrote:
> Philippe Mathieu-Daudé <philmd@redhat.com> writes:
> 
>> Calls passing &error_abort or &error_fatal don't return.
> 
> Correction: they *can* return.  What they can't is return failure.
> 
>> Any code after such use is dubious. Add a coccinelle patch
>> to detect such pattern.
> 
> To be precise: any failure path from such a call is dead code.
> 
>> Inspired-by: Kevin Wolf <kwolf@redhat.com>
>> Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
>> ---
>>  .../use-after-abort-fatal-errp.cocci          | 33 +++++++++++++++++++
>>  MAINTAINERS                                   |  1 +
>>  2 files changed, 34 insertions(+)
>>  create mode 100644 scripts/coccinelle/use-after-abort-fatal-errp.cocci
>>
>> diff --git a/scripts/coccinelle/use-after-abort-fatal-errp.cocci b/scripts/coccinelle/use-after-abort-fatal-errp.cocci
>> new file mode 100644
>> index 00000000000..ead9de5826a
>> --- /dev/null
>> +++ b/scripts/coccinelle/use-after-abort-fatal-errp.cocci
>> @@ -0,0 +1,33 @@
>> +/* Find dubious code use after error_abort/error_fatal
>> + *
>> + * Inspired by this patch:
>> + * https://www.mail-archive.com/qemu-devel@nongnu.org/msg789501.html
>> + *
>> + * Copyright (C) 2121 Red Hat, Inc.
>> + *
>> + * Authors:
>> + *  Philippe Mathieu-Daudé
>> + *
>> + * SPDX-License-Identifier: GPL-2.0-or-later
>> + */
>> +
>> +@@
>> +identifier func_with_errp;
>> +@@
>> +(
>> + if (func_with_errp(..., &error_fatal)) {
>> +    /* Used for displaying help message */
>> +    ...
>> +    exit(...);
>> +  }
>> +|
>> +*if (func_with_errp(..., &error_fatal)) {
>> +    /* dubious code */
>> +    ...
>> +  }
>> +|
>> +*if (func_with_errp(..., &error_abort)) {
>> +    /* dubious code */
>> +    ...
>> +  }
>> +)
> 
> This assumes func_with_errp() returns a falsy value on failure.
> Functions returning bool and pointers do that by convention, but not
> functions returning (signed) integers:
> 
>  * - Whenever practical, also return a value that indicates success /
>  *   failure.  This can make the error checking more concise, and can
>  *   avoid useless error object creation and destruction.  Note that
>  *   we still have many functions returning void.  We recommend
>  *   • bool-valued functions return true on success / false on failure,
>  *   • pointer-valued functions return non-null / null pointer, and
>  *   • integer-valued functions return non-negative / negative.
> 
> Special case of integer-valued functions: return zero / negative.  Your
> script gets that one backwards, I'm afraid.

Apparently:

hw/ppc/spapr.c
---
@@ -2900,7 +2900,6 @@ static void spapr_machine_init(MachineSt
     }

     /* Graphics */
*    if (spapr_vga_init(phb->bus, &error_fatal)) {
         spapr->has_graphics = true;
         machine->usb |= defaults_enabled() && !machine->usb_disabled;
     }
---

qemu-img.c
---
@@ -589,9 +589,6 @@ static int img_create(int argc, char **a
     }
     optind++;

*    if (qemu_opts_foreach(&qemu_object_opts,
*                          user_creatable_add_opts_foreach,
*                          qemu_img_object_print_help, &error_fatal)) {
         goto fail;
     }
---

> Moreover, I expect the convention to be violated in places.
> 
> I'm converned about the script's rate of false positives.  How many
> reports do you get for the whole tree?  Can you guesstimate the rate of
> false positives?
> 
> Next issue.  We commonly assign the return value to a variable before
> checking it, like this:
> 
>     ret = func_with_errp(..., errp);
>     if (!ret) {
>         ...
>         return some error value;
>     }
>     do something with @ret...

Indeed I couldn't catch that easily.

> 
> I suspect your script can't flag dead error handling there.  False
> negatives.  These merely make the script less useful, whereas false
> positives make it less usable, which is arguably worse.

OK, thanks for your analysis, let's drop this patch.


