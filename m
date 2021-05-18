Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 424023878F5
	for <lists+qemu-devel@lfdr.de>; Tue, 18 May 2021 14:37:11 +0200 (CEST)
Received: from localhost ([::1]:52734 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1liyyE-0006c9-AH
	for lists+qemu-devel@lfdr.de; Tue, 18 May 2021 08:37:10 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48796)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1liyug-0003iv-E2
 for qemu-devel@nongnu.org; Tue, 18 May 2021 08:33:32 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:38857)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1liyuc-0008OA-2B
 for qemu-devel@nongnu.org; Tue, 18 May 2021 08:33:30 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1621341205;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=twupc2wWK00aPNsc3yA0yf+tYWQc6loVd0N0B9ASaD0=;
 b=PBd+Mpdx65YiVYTYEwL2S2vh2epf5bf6Yr2GGH9hSBlEu6oc2us+mhXRJposm5XTni+MgF
 DA+uLTZ0T/t0Idm8q1rM10ousoyo8dZsUlhtnZcva3MDPy6IsW6YY8CE8OSdwsGxVjbAKg
 4yAYKK6w5dhOkNtovYznYl53QSYCCIw=
Received: from mail-ed1-f71.google.com (mail-ed1-f71.google.com
 [209.85.208.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-50-jNWGnjR3NrOr6Nk77ZH11A-1; Tue, 18 May 2021 08:33:21 -0400
X-MC-Unique: jNWGnjR3NrOr6Nk77ZH11A-1
Received: by mail-ed1-f71.google.com with SMTP id
 h18-20020a05640250d2b029038cc3938914so5680317edb.17
 for <qemu-devel@nongnu.org>; Tue, 18 May 2021 05:33:21 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=twupc2wWK00aPNsc3yA0yf+tYWQc6loVd0N0B9ASaD0=;
 b=WU/7/14uLAdI1PH4lSNWtmlzUD3H7FMfyLEGYYDohVgdjseqX58QKxb1WXa6wT2wjZ
 hkfTEsRue81PBpgiyAd08vomuo63znddj0csKaBcXkwN27+CkblgzYnzbBUAQLtj7jhH
 7rx8QpC0JA2gQrXb7UudYx+Vh0/DiqaJBSk9cR74ksuc/3Gd3c+DBm3BY4uq60KFNRek
 hQQ1LSQSiqI9zdX/suRqOaClgbRSIRrMPcpZuz5wno/TnEdWZS/m8eaf0UEpOix1sm0J
 pdSR2K5W13UOydyriwk4tq90VTJdaIhFy2lgt2nZNx/0Z96sDj4S1xe2hWZ3Yq+B94lV
 H2NA==
X-Gm-Message-State: AOAM5339Q6uw4RoYZoNpRJjky+qFqLx7wteNKr4VA6ToxNjPSDFyf1Bd
 JtbJZdbrAuh27yr9nzQky/TicAEaDWXCvuB6QFKLNVcbI5qQ5MVOcJk7Whjoly69/BrcQ5a6bR4
 uxK6EyJFYFQfJY7w=
X-Received: by 2002:a17:906:7f8a:: with SMTP id
 f10mr5584278ejr.12.1621341200281; 
 Tue, 18 May 2021 05:33:20 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzQgTMarQV285cQj39BtyEB7755kwyvjA6uNvZ1Y8KFqvuaZykHZAC0ELrKMlP5+GsESe8Xvg==
X-Received: by 2002:a17:906:7f8a:: with SMTP id
 f10mr5584264ejr.12.1621341200063; 
 Tue, 18 May 2021 05:33:20 -0700 (PDT)
Received: from ?IPv6:2001:b07:6468:f312:c8dd:75d4:99ab:290a?
 ([2001:b07:6468:f312:c8dd:75d4:99ab:290a])
 by smtp.gmail.com with ESMTPSA id y19sm12882624edc.73.2021.05.18.05.33.19
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 18 May 2021 05:33:19 -0700 (PDT)
Subject: Re: [PATCH v2 00/50] target/i386 translate cleanups
To: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org
References: <20210514151342.384376-1-richard.henderson@linaro.org>
 <81278bdc-ba3f-4902-f8b5-0b75ff423318@redhat.com>
 <ed338eb5-9a30-8a2b-41a0-1597b8bed0d0@linaro.org>
From: Paolo Bonzini <pbonzini@redhat.com>
Message-ID: <3430eedf-11a1-a847-2214-acdf39fe3f58@redhat.com>
Date: Tue, 18 May 2021 14:33:18 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <ed338eb5-9a30-8a2b-41a0-1597b8bed0d0@linaro.org>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=pbonzini@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.374,
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
Cc: cfontana@suse.de, ehabkost@redhat.com, f4bug@amsat.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 18/05/21 12:59, Richard Henderson wrote:
> On 5/18/21 5:31 AM, Paolo Bonzini wrote:
>> On 14/05/21 17:12, Richard Henderson wrote:
>>> Supercedes: 20210228232321.322053-1-richard.henderson@linaro.org
>>> ("i386 cleanup part 3")
>>>
>>> Claudio's prerequite patch set ("i386 cleanup part 2"), is now merged.
>>> Version 2 here fixes some minor rebase conflicts that crept in.
>>> Only 4 of the 50 patches have been reviewed.
>>>
>>> Blurb from v1:
>>> This started out to address a fixme in Claudio's patch set, then
>>> wandered a bit, with cleanups and bug fixes in the code that I was
>>> touching.  I stopped when I reached my original goal of removing
>>> target/i386/tcg/user/*_stubs.c.
>>>
>>> There are a lot of patches, but hopefully they're all small
>>> enough to be obvious.
>>
>> Nice, thanks.  I only left minor comments on 27 and 30, feel free to 
>> do a pull request without v3.
> 
> Shall I take your comments then as "... Otherwise, R-B"?
> Because you didn't actually give them for those two, and they're the 
> only two without r-b tags.
> 
> You treated patch 49 similarly, but that one already had Phil's r-b.

Well you're a maintainer so you don't really need R-b's but just to be 
precise: 27 would be completely different, while 30 should have had a 
r-b (it's just a commit message suggestion) and 49 should have had an 
"otherwise r-b".

Paolo


