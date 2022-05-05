Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9289B51C1CF
	for <lists+qemu-devel@lfdr.de>; Thu,  5 May 2022 16:01:34 +0200 (CEST)
Received: from localhost ([::1]:40524 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nmc2v-0004dQ-7k
	for lists+qemu-devel@lfdr.de; Thu, 05 May 2022 10:01:33 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57076)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1nmc0C-0002pj-Co
 for qemu-devel@nongnu.org; Thu, 05 May 2022 09:58:45 -0400
Received: from mail-ed1-x534.google.com ([2a00:1450:4864:20::534]:43588)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1nmc0A-0000om-8c
 for qemu-devel@nongnu.org; Thu, 05 May 2022 09:58:43 -0400
Received: by mail-ed1-x534.google.com with SMTP id b24so5302313edu.10
 for <qemu-devel@nongnu.org>; Thu, 05 May 2022 06:58:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=G17Oaeg6sY6DNITObGKUlHgba78n4wFbBRMyGc5zwYw=;
 b=WdxVDdJuwM+CSbwNnANNP/a09IggU+aXP6CV3RU0WQXP6kNbA3alKRiBG8o+EwOooc
 casthciZRGF3Qq2+JmNsaNPaxyjpKNRmwqLZ0wJDWELGSDWr6l3abtKfSKsj2Uq+UrAX
 CVH0MTZh3focv63QJ5vaxop/DD3PSfqISSlGhoC7uiAa37zjsRd/F+5jLa1Dg8i6CxWF
 bF1zxQsgr07upF/+G0t4vJv80PitA08va2Lk7x+fYrZIGs0kvkFLOc5sSfkGvA8QALdh
 jdZkfDCkoBASR8apwGRWuYQ5xU7VFxDW1m1zxYi+lgeEUxFWQFG9q9WTiSNnz8ERLs6m
 l4zg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:message-id:date:mime-version:user-agent
 :subject:content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=G17Oaeg6sY6DNITObGKUlHgba78n4wFbBRMyGc5zwYw=;
 b=3ZcJ4x97jFIzoV8eZaD6wnzVWVXrBZ2tyCYKXzK04ldzGYBo0MzpoQX42oGc6AqSrV
 /0a5nAtX1zBJuE1fN1+1x8CnMWREdzDdyn89mr2mY3Vko9pG/6PX/3VGemtcZwINt4x0
 BYTA+fN1opMfFUlUkr3T5XZMhf4Rnn9dQ7JIUTZylO8RgE1+eZ34XIfjvkw5RwHX3rbE
 kRa33Ldf37S//0NjDQuZxfVPA2vUCi5UMMgyZEGJna98ytL7z3kMxYVyLjg/0EXNHeB0
 7/R+fbfg+Cmj0diWJeUjgIctU8Nc6SA4zjGzl5yvqbrycFvZrp5RRarGsfPBBnLAWR2d
 Q8Ig==
X-Gm-Message-State: AOAM531ad0M7bpPl7z+Sx+6Sedrf3JvHT7UUytipRF+fzX3ykQaxFSrN
 YgNWChmgnZtHkqRTaCWEgPU=
X-Google-Smtp-Source: ABdhPJyn2RsZqIyhLUgLcXG7lkzN+0A5jJfcMCiyke2smx+bnTv5ul7BkwpxPpiuA44xbA5Jo1o6OQ==
X-Received: by 2002:aa7:d5c5:0:b0:425:b144:ab84 with SMTP id
 d5-20020aa7d5c5000000b00425b144ab84mr30343289eds.200.1651759119246; 
 Thu, 05 May 2022 06:58:39 -0700 (PDT)
Received: from ?IPV6:2001:b07:6468:f312:c8dd:75d4:99ab:290a?
 ([2001:b07:6468:f312:c8dd:75d4:99ab:290a])
 by smtp.googlemail.com with ESMTPSA id
 bx8-20020a0564020b4800b0042617ba639bsm868226edb.37.2022.05.05.06.58.38
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 05 May 2022 06:58:38 -0700 (PDT)
Message-ID: <e7056663-6f22-e0ec-679a-3f474df05788@redhat.com>
Date: Thu, 5 May 2022 15:58:37 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.0
Subject: Re: [PATCH 1/8] qmp: Support for querying stats
Content-Language: en-US
To: Markus Armbruster <armbru@redhat.com>
Cc: qemu-devel@nongnu.org, mark.kanda@oracle.com, berrange@redhat.com,
 dgilbert@redhat.com
References: <20220426141619.304611-1-pbonzini@redhat.com>
 <20220426141619.304611-2-pbonzini@redhat.com> <87sfpp3018.fsf@pond.sub.org>
 <41B27AED-A9E0-4666-AEBB-0F3C9F436DF1@redhat.com>
 <87v8ukt8g8.fsf@pond.sub.org>
From: Paolo Bonzini <pbonzini@redhat.com>
In-Reply-To: <87v8ukt8g8.fsf@pond.sub.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2a00:1450:4864:20::534;
 envelope-from=paolo.bonzini@gmail.com; helo=mail-ed1-x534.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.249, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 5/5/22 15:28, Markus Armbruster wrote:
> Double-checking (pardon my ignorance): we're basically exposing the host
> kernel's KVM stats via QMP, with the option of extending it to other
> sources of stats in the future.  Correct?

Yes.  As long as KVM is the only source, it's basically an opaque 1:1 
mapping of what the kernel gives.

> I think the argument for accepting the interface is basically "if it's
> good enough for the kernel, it's good enough for us".  Valid point.

Also, it was designed from the beginning to be extensible to other 
_kernel_ subsystems as well; i.e. it's not virt-specific in any way.

There is one important point: theoretically, stats names are not part of 
the kernel API.  In practice, you know what the chief penguin thinks of 
breaking userspace and anyway I don't think any of the stats have ever 
been removed when they were in debugfs (which makes them even less of a 
stable API).

For a similar situation see https://lwn.net/Articles/737530/: kernel 
developers hate that tracepoints are part of the stable API, but in 
practice they are (and stats are much harder to break than tracepoints, 
if it's worth exposing them to userspace in the first place).

> This means we'll acquire yet another introspection system, unrelated to
> the introspection systems we already have in QEMU.
> 
> There is overlap.  Quite a few query- commands return stats.  Should
> they be redone as statistics provides in this new introspection system?

I think so, potentially all of them can be moved.  Whether it is worth 
doing it is another story.

In addition, query-stats provides a home for TCG statistics that 
currently QMP exposes only via x- commands; they can be added without 
having to design the whole QAPI thing, and with a slightly less strong 
guarantee of stability.

> Alternatively, maybe: the "QOM path of the object for which the
> statistics are returned" could be "/" or "/machine" when the object is
> the VM.

I like that in principle, however it's not possible to make qom_path 
mandatory.  For example block devices would not have a QOM path.
>> The stat is an adimensional number: a count of events such a page faults, or the maximum length of a bucket in a hash table,  etc. It's actually the common case.
> 
> I've come to prefer defaulting to a value over giving "absent" its own
> meaning.  However, own meaning is somewhat entrenched in the schema
> language and its usage, and "absent @unit means adimensional" is kind of
> fitting, so I'm not objecting.  I am asking for better documentation,
> though :)

Will document.

>>>> +# @base: base for the multiple of @unit that the statistic uses, either 2 or 10.
>>>> +#        Only present if @exponent is non-zero.
>>>> +#
>>>> +# @exponent: exponent for the multiple of @unit that the statistic uses
>>>
>>> Alright, given a stat value 42, what does it mean for the possible
>>> combinations of @base and @exponent?
>>
>> Base and exponent are used to represent units like KiB, nanoseconds, etc.
> 
> Put that in doc comments, please.

Ok, I'll make an example.

>>> How am I to connect each element of the result of query-stats to an
>>> element of the result of query-stats-schema?
>>
>> You gave the target to query-stats and the result of query-stats has the provider and name. Target+provider+name uniquely identify a StatsSchemaValue in the result of query-stats-schemas.
> 
> Can we have that spelled out in documentation?
> 
> Doc comments or something under docs/, up to you.

Hmm, it seemed obvious but I can add something to StatsSchemaValue.

Paolo

