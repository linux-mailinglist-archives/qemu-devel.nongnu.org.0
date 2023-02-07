Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 234C368D596
	for <lists+qemu-devel@lfdr.de>; Tue,  7 Feb 2023 12:34:24 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pPMEf-0008Fj-II; Tue, 07 Feb 2023 06:34:05 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1pPMER-0008Bi-MG
 for qemu-devel@nongnu.org; Tue, 07 Feb 2023 06:33:51 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1pPMEO-0002eR-Cd
 for qemu-devel@nongnu.org; Tue, 07 Feb 2023 06:33:51 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1675769627;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=sUQyU0cAi5K5IS/3pnH+LxE7ZjEVza6wNmGsol5rXNk=;
 b=cv1WdQr1K7+ZKns4nMhKeLeLtQZvOQaFPl13fjY7IXygmNvB8lUSQ6gMDF7iNiB9IbzBsy
 d/dUI0efKxzxCYZpmVrufH86yQBZBEGoGex6tmLmnOjLCpofWEOtWF2fFhvvCFQzFyyDoa
 M20G0jRJWo1vbd2MQeqRM/87Hcc3PxA=
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com
 [209.85.222.198]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-21-PzCi8YR9Moukd2826vwZ3w-1; Tue, 07 Feb 2023 06:33:43 -0500
X-MC-Unique: PzCi8YR9Moukd2826vwZ3w-1
Received: by mail-qk1-f198.google.com with SMTP id
 q21-20020a05620a0d9500b0070572ccdbf9so9623191qkl.10
 for <qemu-devel@nongnu.org>; Tue, 07 Feb 2023 03:33:43 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=sUQyU0cAi5K5IS/3pnH+LxE7ZjEVza6wNmGsol5rXNk=;
 b=lI1MGn0VpYM/G8KISA+k9ebDd2d9CJW1boUjaN5enQA0Y2lxB/Rb5wqPmSczc3als2
 BgvscrA9ntWX2nlXJb47KEY2LznbZaxcT8zIgKIEFWcZseZg5ynzhOjUZS2SPTEDtfCB
 CHq5w8k+i1iCjIktSH/gnjlKu+z5fktVaTFe1MPP+Wk7LigTpuro47E41dp1yDEruEJr
 2EjAKURMvjJfFf+DKM2EtzE42ZX8jEa59Ld4Xuqv81MQuuFJEt5MqDTJ7G7rCEHfFlzv
 cPI5YBn8FvOgJxtrGnXsq3qK0EFFZi32wiRKJYHi9rJTCvmdtKgOe1uJMYT0VUGz5uBw
 FVCQ==
X-Gm-Message-State: AO0yUKUw5m5eWcGkLD1zzJ7GrOVJhkM1FNABRaqYDltbmuX/U54a7sUS
 3VUc8pdYgED2FoSjbAvdbyYN2BMtgBddsdb/kelqf6MrcUmfrkE244GarZ1bEufAlfNPWNgjwUM
 jCAUh3an1IoEzpHo=
X-Received: by 2002:a05:6214:e6e:b0:56b:f6c2:48e8 with SMTP id
 jz14-20020a0562140e6e00b0056bf6c248e8mr3383653qvb.17.1675769623394; 
 Tue, 07 Feb 2023 03:33:43 -0800 (PST)
X-Google-Smtp-Source: AK7set/7ujlVN6aMMHfks+637yrGlh4yJtH/6i4b9RU4172Vuz5orCZ8py/XJ3fLZ7nh9c+oVAtupw==
X-Received: by 2002:a05:6214:e6e:b0:56b:f6c2:48e8 with SMTP id
 jz14-20020a0562140e6e00b0056bf6c248e8mr3383631qvb.17.1675769623144; 
 Tue, 07 Feb 2023 03:33:43 -0800 (PST)
Received: from [192.168.0.2] (ip-109-43-176-120.web.vodafone.de.
 [109.43.176.120]) by smtp.gmail.com with ESMTPSA id
 67-20020a370846000000b0073185aef96csm5967244qki.51.2023.02.07.03.33.40
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 07 Feb 2023 03:33:42 -0800 (PST)
Message-ID: <5bc9bec6-f4c3-fbfa-350f-2722bf0bc917@redhat.com>
Date: Tue, 7 Feb 2023 12:33:39 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.13.0
Subject: Re: [RFC PATCH 0/5] Deprecate/rename singlestep command line option
Content-Language: en-US
To: Peter Maydell <peter.maydell@linaro.org>
Cc: qemu-devel@nongnu.org, Richard Henderson <richard.henderson@linaro.org>,
 Paolo Bonzini <pbonzini@redhat.com>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 Laurent Vivier <laurent@vivier.eu>, Warner Losh <imp@bsdimp.com>,
 Kyle Evans <kevans@freebsd.org>, Markus Armbruster <armbru@redhat.com>
References: <20230206171359.1327671-1-peter.maydell@linaro.org>
 <114a7eb2-f503-361a-aac7-ad9dfa7696cc@redhat.com>
 <CAFEAcA8x_qPzoJ_TPGMin6FKtXfcpqLSbdFTiu9JT+bTHbQbog@mail.gmail.com>
From: Thomas Huth <thuth@redhat.com>
In-Reply-To: <CAFEAcA8x_qPzoJ_TPGMin6FKtXfcpqLSbdFTiu9JT+bTHbQbog@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-1.148, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

On 07/02/2023 12.01, Peter Maydell wrote:
> On Mon, 6 Feb 2023 at 20:18, Thomas Huth <thuth@redhat.com> wrote:
>>
>> On 06/02/2023 18.13, Peter Maydell wrote:
>>> The command line option '-singlestep' and its HMP equivalent
>>> the 'singlestep' command are very confusingly named, because
>>> they have nothing to do with single-stepping the guest (either
>>> via the gdb stub or by emulation of guest CPU architectural
>>> debug facilities). What they actually do is put TCG into a
>>> mode where it puts only one guest instruction into each
>>> translation block. This is useful for some circumstances
>>> such as when you want the -d debug logging to be easier to
>>> interpret, or if you have a finicky guest binary that wants
>>> to see interrupts delivered at something other than the end
>>> of a basic block.
>>>
>>> The confusing name is made worse by the fact that our
>>> documentation for these is so minimal as to be useless
>>> for telling users what they really do.
>>>
>>> This series:
>>>    * renames the 'singlestep' global variable to 'one_insn_per_tb'
>>>    * Adds new '-one-insn-per-tb' command line options and a
>>
>> Please no new "top level" command line options like this! It's related to
>> TCG, so this should IMHO become a parameter of the "-accel tcg" option.
> 
> That makes sense (and is probably an argument for taking
> the deprecate-and-drop step). Is there an equivalent to
> "accel suboptions" for HMP commands, or does that just
> stay a top-level command ?

I'm not aware of an "accel" HMP command, so I guess it has to stay top 
level. Or you could introduce a new "accel" command now, so we have 
something we can use in the future for other related HMP commands, too?

> (For the user-mode binaries it'll stay a top level option
> because those are all we have there.)

Ack, that's right.

  Thomas



