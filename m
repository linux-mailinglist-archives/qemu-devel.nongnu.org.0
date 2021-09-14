Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0707040B5CD
	for <lists+qemu-devel@lfdr.de>; Tue, 14 Sep 2021 19:21:19 +0200 (CEST)
Received: from localhost ([::1]:55606 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mQC7S-0007sN-3Q
	for lists+qemu-devel@lfdr.de; Tue, 14 Sep 2021 13:21:18 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44242)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1mQC4i-0004x7-Qx
 for qemu-devel@nongnu.org; Tue, 14 Sep 2021 13:18:28 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:33567)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1mQC4f-0002nG-7a
 for qemu-devel@nongnu.org; Tue, 14 Sep 2021 13:18:27 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1631639904;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=03+IhxGmmMXDrS25Dg26nDJdPBLM1fFGiWN16fXUPNs=;
 b=aANjXwI5g2tiGgBEyl3X85Aqobg8nmd3p7D5+bbuKrR8EFP7qozMNf+Mt9ZhEdQBoLZdwZ
 Krxl5XqZhIr0w+62bt//efh6Dnr7wU2tuU7LaLyOK7tLsUOOlV/MGbWuL93Bc3rWQa88L9
 gGxq5xuH5GtEC0aNn4+UC6NO1tOXJcs=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-16-p6QzJCYlMCmf3sVCCvI7vQ-1; Tue, 14 Sep 2021 13:18:23 -0400
X-MC-Unique: p6QzJCYlMCmf3sVCCvI7vQ-1
Received: by mail-wm1-f72.google.com with SMTP id
 h1-20020a05600c350100b002e751bf6733so23371wmq.8
 for <qemu-devel@nongnu.org>; Tue, 14 Sep 2021 10:18:22 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:subject:from:to:cc:references:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=03+IhxGmmMXDrS25Dg26nDJdPBLM1fFGiWN16fXUPNs=;
 b=Je5+rEiGvd0bfuubEOZEGRi04LuUsWHpkpmmjji3g4U5qqXi2D2YXvf3/xP21VryG9
 LsyC9CHwsdVGThwLjkr3IabC5If2HWDyBhMKpepXLrWypIiNUlMq0bL4eEaTJ8UGcSPN
 kd3P3iThM8E3kNfyOzpCUSSKqIU59iRRsaWqr4SCoTxvxxVTimIxSJ/+DqcyOjjmgCyI
 pS1UmE6T1cGX9Djjc3VY5DPktH7Vp/bdYI5+z3hU3XuGydES74NiPJ3x6MtV0VlV6yGc
 SDobYfydmRam9DCu4/IspmlopcwjIAlHvDvGSIi2v14VtLqcnjr2Xcx9Hm8FGZf6lKTt
 HIXA==
X-Gm-Message-State: AOAM532gi2nCtYkpwSciDxu1kh4YhcVDQgS0aC/zKYDkxRjboS0wmalV
 fc2eSxbJn0CDnkimkWCWAfLqW0/kQo8E3/DAdhHpwzURb+QsOP/Ns67PsMNjdH6h+Ufwhq7Futl
 Dn/DGIn8JB8aQ/oE=
X-Received: by 2002:a5d:67c8:: with SMTP id n8mr315273wrw.122.1631639901812;
 Tue, 14 Sep 2021 10:18:21 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJx8k5dUCOzApULzgPg7szbogBDqXNvBu/8axQ3t+cvEWsWZU3M6/uMLI+iNxuUIgLe9gYzcCg==
X-Received: by 2002:a5d:67c8:: with SMTP id n8mr315250wrw.122.1631639901635;
 Tue, 14 Sep 2021 10:18:21 -0700 (PDT)
Received: from [192.168.1.36] (14.red-83-35-25.dynamicip.rima-tde.net.
 [83.35.25.14])
 by smtp.gmail.com with ESMTPSA id z17sm584333wml.24.2021.09.14.10.18.18
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 14 Sep 2021 10:18:20 -0700 (PDT)
Subject: Re: [PATCH v2 29/53] qapi: introduce x-query-registers QMP command
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
To: Eric Blake <eblake@redhat.com>, =?UTF-8?Q?Daniel_P=2e_Berrang=c3=a9?=
 <berrange@redhat.com>, Markus Armbruster <armbru@redhat.com>,
 =?UTF-8?Q?Marc-Andr=c3=a9_Lureau?= <marcandre.lureau@redhat.com>
References: <20210914142042.1655100-1-berrange@redhat.com>
 <20210914142042.1655100-30-berrange@redhat.com>
 <20210914160416.tmk5nuhch2yhfb27@redhat.com>
 <da6637f1-413c-73a3-686d-0e8913c46da9@redhat.com>
Message-ID: <93be6f97-5dfb-4fab-25c6-363bb9f0e540@redhat.com>
Date: Tue, 14 Sep 2021 19:18:18 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <da6637f1-413c-73a3-686d-0e8913c46da9@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -32
X-Spam_score: -3.3
X-Spam_bar: ---
X-Spam_report: (-3.3 / 5.0 requ) DKIMWL_WL_HIGH=-0.398, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-1.969,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
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
Cc: Peter Maydell <peter.maydell@linaro.org>, Cornelia Huck <cohuck@redhat.com>,
 David Hildenbrand <david@redhat.com>, Bin Meng <bin.meng@windriver.com>,
 Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>, qemu-devel@nongnu.org,
 Peter Xu <peterx@redhat.com>, Max Filippov <jcmvbkbc@gmail.com>,
 Taylor Simpson <tsimpson@quicinc.com>,
 Alistair Francis <alistair.francis@wdc.com>, Gerd Hoffmann <kraxel@redhat.com>,
 "Edgar E. Iglesias" <edgar.iglesias@gmail.com>, Marek Vasut <marex@denx.de>,
 Yoshinori Sato <ysato@users.sourceforge.jp>, Halil Pasic <pasic@linux.ibm.com>,
 Christian Borntraeger <borntraeger@de.ibm.com>, qemu-ppc@nongnu.org,
 Artyom Tarasenko <atar4qemu@gmail.com>, Laurent Vivier <lvivier@redhat.com>,
 Thomas Huth <thuth@redhat.com>, Eduardo Habkost <ehabkost@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>, Greg Kurz <groug@kaod.org>,
 Yuval Shaia <yuval.shaia.ml@gmail.com>, qemu-s390x@nongnu.org,
 qemu-arm@nongnu.org, Michael Rolnik <mrolnik@gmail.com>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 Stafford Horne <shorne@gmail.com>, David Gibson <david@gibson.dropbear.id.au>,
 qemu-riscv@nongnu.org, Bastian Koppelmann <kbastian@mail.uni-paderborn.de>,
 Chris Wulff <crwulff@gmail.com>, Laurent Vivier <laurent@vivier.eu>,
 Palmer Dabbelt <palmer@dabbelt.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Aleksandar Rikalo <aleksandar.rikalo@syrmia.com>,
 Aurelien Jarno <aurelien@aurel32.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 9/14/21 7:15 PM, Philippe Mathieu-Daudé wrote:
> On 9/14/21 6:04 PM, Eric Blake wrote:
>> On Tue, Sep 14, 2021 at 03:20:18PM +0100, Daniel P. Berrangé wrote:
>>> This is a counterpart to the HMP "info registers" command. It is being
>>> added with an "x-" prefix because this QMP command is intended as an
>>> ad hoc debugging tool and will thus not be modelled in QAPI as fully
>>> structured data, nor will it have long term guaranteed stability.
>>> The existing HMP command is rewritten to call the QMP command.
>>>
>>> Signed-off-by: Daniel P. Berrangé <berrange@redhat.com>
>>> ---
> 
>>> +##
>>> +# @HumanReadableText:
>>> +#
>>> +# @human-readable-text: Formatted output intended for humans.
>>> +#
>>> +# Since: 6.2.0
>>
>> Should be '6.2', not '6.2.0', to match...
>>
>>> +#
>>> +##
>>> +{ 'struct': 'HumanReadableText',
>>> +  'data': { 'human-readable-text': 'str' } }
>>> diff --git a/qapi/machine.json b/qapi/machine.json
>>> index 157712f006..8737efa865 100644
>>> --- a/qapi/machine.json
>>> +++ b/qapi/machine.json
>>> @@ -1312,3 +1312,18 @@
>>>       '*cores': 'int',
>>>       '*threads': 'int',
>>>       '*maxcpus': 'int' } }
>>> +
>>> +##
>>> +# @x-query-registers:
>>> +#
>>> +# @cpu: the CPU number to query. If omitted, queries all CPUs
>>> +#
>>> +# Query information on the CPU registers
>>> +#
>>> +# Returns: CPU state in an architecture-specific format
>>> +#
>>> +# Since: 6.2
>>
>> ...the prevailing style.
>>
>> If it were likely that someone might backport just some (but not all)
>> added x- commands, it may be wise to separate the creation of
>> HumanReadableText into its own patch to backport that but not
>> x-query-registers.  But I rather suspect anyone backporting this will
>> take the series wholesale, so the coupling in this patch is not worth
>> worrying about.
> 
> IIUC the problem is this breaks bisection, as you get a QAPI error:
> 
>  qapi/qapi-commands-machine.c:123:13: error:
> ‘qmp_marshal_output_HumanReadableText’
> defined but not used [-Werror=unused-function]
>   123 | static void
> qmp_marshal_output_HumanReadableText(HumanReadableText *ret_in,
>       |             ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
> cc1: all warnings being treated as errors
> 
> See the comment added in commit 1f7b9f3181e
> ("qapi/commands: add #if conditions to commands").

Oh we already talked about this together in this thread:
https://lore.kernel.org/qemu-devel/20210609202952.r4nb2smrptyckvk2@redhat.com/

> 
>>
>>> +##
>>> +{ 'command': 'x-query-registers',
>>> +  'data': {'*cpu': 'int' },
>>> +  'returns': 'HumanReadableText' }
>>> -- 
>>> 2.31.1
>>>
>>


