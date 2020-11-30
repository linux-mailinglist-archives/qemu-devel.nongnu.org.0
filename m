Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 726342C8E2B
	for <lists+qemu-devel@lfdr.de>; Mon, 30 Nov 2020 20:37:33 +0100 (CET)
Received: from localhost ([::1]:40734 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kjozM-0000o6-H9
	for lists+qemu-devel@lfdr.de; Mon, 30 Nov 2020 14:37:32 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:51506)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1kjoxa-00006a-Lo
 for qemu-devel@nongnu.org; Mon, 30 Nov 2020 14:35:42 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:37857)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1kjoxX-0002jQ-VA
 for qemu-devel@nongnu.org; Mon, 30 Nov 2020 14:35:42 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1606764939;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=m/XYg2h+XspbpF1tKq3USqCq02AVuCFG0MtTKkRKKtc=;
 b=TgXgAoIp9c30knxutjKoHg+EHLSmezFSZ80OKzRSZZyJfCEq+IgXOd7v12EoTcoFANCyy9
 fdiqz9SV88VMPrsEGE07Q4FqpDctfYc0hH9LPJBnhEUbCvYZdhsMd+K08DCXMzYYLdMuAd
 5NH+gRJbLyOOCQmLyL/IcM7lUiQb3kE=
Received: from mail-ed1-f69.google.com (mail-ed1-f69.google.com
 [209.85.208.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-380-5zdFMr21NNmVkudWjP0cbg-1; Mon, 30 Nov 2020 14:35:37 -0500
X-MC-Unique: 5zdFMr21NNmVkudWjP0cbg-1
Received: by mail-ed1-f69.google.com with SMTP id y11so7290056edv.6
 for <qemu-devel@nongnu.org>; Mon, 30 Nov 2020 11:35:37 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:to:cc:references:from:subject:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=m/XYg2h+XspbpF1tKq3USqCq02AVuCFG0MtTKkRKKtc=;
 b=dvq0N77J5wDnNwdPSzISJpEE8tFocFoii1PRL/27L+0Cu+zmNvg48SVmTLk+Ug802X
 UGX0LOiXdaFkjFArVa0r5uUS0pSofBHUaTNesSojpp0WRaEZLbtFRBeQb5UGm0BKFZWZ
 GETBnEGS8gqR9WNu7xxMUpps23gMnXSfof+lvWy6U6MYZp3aiTzFjK15iP3ICT2VcDMe
 OerX6rt7k/melNWnL+gwb4tPvsturZyezmmY2zSj1jXQe5U4PXdMFER3kfr4B4Ixn9tg
 kMbOGFbffJvQs8jAE5rY3/bf03HLdovraqGtAiepEUpHtbyb13YYG0mwCO1xcW2k9j7f
 LIPw==
X-Gm-Message-State: AOAM530c96EZp7c21CMzdogQnnZ638bbF7TkHIdBXPMkfu3u+VAA80pC
 90BHGeX7NzBoOKyQwnJAk0fpOR8MURmF8oEwVNdCIJ1a9jl4nL6X2kC324ankILpvnhNpYt002r
 jRYinlsYYZ/qvKMw=
X-Received: by 2002:aa7:cfc7:: with SMTP id r7mr23657028edy.93.1606764935749; 
 Mon, 30 Nov 2020 11:35:35 -0800 (PST)
X-Google-Smtp-Source: ABdhPJzEH+7+/G4QOmd1UhfpBPvwAYi/Anotx6ZZxmLED6N7OsPh6pPwOLARBn05Baxr3OB9YiYsqQ==
X-Received: by 2002:aa7:cfc7:: with SMTP id r7mr23656998edy.93.1606764935499; 
 Mon, 30 Nov 2020 11:35:35 -0800 (PST)
Received: from ?IPv6:2001:b07:6468:f312:c8dd:75d4:99ab:290a?
 ([2001:b07:6468:f312:c8dd:75d4:99ab:290a])
 by smtp.gmail.com with ESMTPSA id u17sm8942695eje.11.2020.11.30.11.35.34
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 30 Nov 2020 11:35:34 -0800 (PST)
To: Kevin Wolf <kwolf@redhat.com>
References: <20201130122538.27674-1-kwolf@redhat.com>
 <01d32c8c-5023-6323-bed8-ede08f6ac8a3@redhat.com>
 <20201130154605.GC5078@merkur.fritz.box>
 <a9c1ebf3-ffcc-7312-ce66-a79902d1e9ba@redhat.com>
 <20201130181037.GG5078@merkur.fritz.box>
From: Paolo Bonzini <pbonzini@redhat.com>
Subject: Re: [PATCH 00/18] qapi/qom: QAPIfy object-add
Message-ID: <65a9600f-ca8c-ef29-94d8-d9ea114e5e06@redhat.com>
Date: Mon, 30 Nov 2020 20:35:33 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.4.0
MIME-Version: 1.0
In-Reply-To: <20201130181037.GG5078@merkur.fritz.box>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=pbonzini@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=63.128.21.124; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -35
X-Spam_score: -3.6
X-Spam_bar: ---
X-Spam_report: (-3.6 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1.496,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H4=0.001,
 RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: lvivier@redhat.com, thuth@redhat.com, pkrempa@redhat.com,
 berrange@redhat.com, ehabkost@redhat.com, qemu-block@nongnu.org,
 libvir-list@redhat.com, armbru@redhat.com, jasowang@redhat.com,
 qemu-devel@nongnu.org, mreitz@redhat.com, kraxel@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 30/11/20 19:10, Kevin Wolf wrote:
> Am 30.11.2020 um 17:57 hat Paolo Bonzini geschrieben:
>> The main problem is that it wouldn't extend well, if at all, to
>> machines and devices.  So those would still not be integrated into the
>> QAPI schema.
> 
> What do you think is the biggest difference there? Don't devices work
> the same as user creatable objects in that you first set a bunch of
> properties (which would now be done through QAPI instead) and then call
> the completion/realize method that actually makes use of them?

For devices it's just the practical issue that there are too many to 
have something like this series.  For machine types the main issue is 
that the version-specific machine types would have to be defined in one 
more place.

>> The single struct doesn't bother me _too much_ actually.  What bothers me is
>> that it won't be a single source of all QOM objects, only those that happen
>> to be created by object-add.
> 
> But isn't it only natural that a list of these objects will exist in
> some way, implicitly or explicitly? object-add must somehow decide which
> object types it allows the user to create.

There's already one, it's objects that implement user creatable.  I 
don't think having it as a QAPI enum (or discriminator) is worthwhile, 
and it's one more thing that can go out of sync between the QAPI schema 
and the C code.

> I'm also pretty sure that QOM as it exists now is not the right solution
> for any of them because it has some major shortcomings. It's too easy to
> get things wrong (like the writable properties after creation), its
> introspection is rather weak and separated from the QAPI introspection,
> it doesn't encourage documentation, and it involves quite a bit of
> boilerplate and duplicated code between class implementations.
> 
> A modified QOM might be the right solution, though. I would like to
> bring QAPI and QOM together because most of these weaknesses are
> strengths of QAPI.

I agree wholeheartedly.  But your series goes to the opposite excess. 
Eduardo is doing work in QOM to mitigate the issues you point out, and 
you have to meet in the middle with him.  Starting with the user-visible 
parts focuses on the irrelevant parts.

>> Mostly because it's more or less the same issue that you have with
>> BlockdevOptions, with the extra complication that this series only deals
>> with the easy one of the four above categories.
> 
> I'm not sure which exact problem with BlockdevOptions you mean. The
> reason why the block layer doesn't use BlockdevOptions everywhere is
> -drive support.

You don't have a single BlockdevOptions* field in the structs of block/. 
  My interpretation of this is that BlockdevOptions* is a good schema 
for configuring things but not for run-time state.

>>> Maybe if we don't want to commit to keeping the ObjectOptions schema,
>>> the part that should wait is object-add and I should do the command line
>>> options first? Then the schema remains an implementation detail for now
>>> that is invisible in introspection.
>>
>> I don't see much benefit in converting _any_ of the three actually.  The
>> only good reason I see for QAPIfying this is the documentation, and the
>> promise of deduplicating QOM boilerplate.  The latter is only a promise, but
>> documentation alone is a damn good reason and it's enough to get this work
>> into a mergeable shape as soon as possible!
> 
> I think having some input validation done by QAPI instead of in each QOM
> object individually is nice, too. You get it after CLI, QMP and HMP all
> go through QAPI.

But the right way to do that is to use Eduardo's field properties: they 
make QOM do the right thing, adding another layer of parsing is just 
adding more complexity.  Are there any validation bugs that you're 
fixing?  Is that something that cannot be fixed elsewhere, or are you 
papering over bad QOM coding?  (Again, I'm not debating that QOM 
properties are hard to write correctly).

>> But maybe, we could start in the opposite direction: start with the use QAPI
>> to eliminate QOM boilerplate.  Basing your work on Eduardo's field
>> properties series, you could add a new 'object' "kind" to QAPI that would
>> create an array of field properties (e.g. a macro expanding to a compound
>> literal?)
> 
> There is a very simple reason why I don't want to start with the QAPI
> generator: John has multiple series pending that touch basically every
> part of the QAPI generator. This means not only that I need to be
> careful about merge conflict (or base my work on top of five other
> series, which feels adventurous), but also that I would be competing
> with John for Markus' reviewer capacity, further slowing things down.

That's something that you have to discuss with John and Markus.  It may 
be that John has to shelve part of his work or rebase on top of yours 
instead.

By adding an extra parsing layer you're adding complexity that may not 
be needed in the end, and we're very bad of removing it later.  So I'm 
worried that this series will become technical debt in just a few months.

> Well, two reasons: Also because this series for the external interface
> of the objects already exists and it's an incremental step towards your
> proposal: The types for 'properties' will already exist then and I won't
> have to convert both internal state and external interfaces at the same
> time.

I don't think converting internal state to QAPI is useful.  QAPI and QOM 
are external interfaces and that's what they should remain; anything 
that is not an external interface should (must) remain plain C code.

Paolo


