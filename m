Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2E0FD2DC35E
	for <lists+qemu-devel@lfdr.de>; Wed, 16 Dec 2020 16:44:51 +0100 (CET)
Received: from localhost ([::1]:59096 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kpYyw-0005z6-8n
	for lists+qemu-devel@lfdr.de; Wed, 16 Dec 2020 10:44:50 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:47666)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1kpYxj-0005AT-Jl
 for qemu-devel@nongnu.org; Wed, 16 Dec 2020 10:43:35 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:42903)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1kpYxh-0004yb-2D
 for qemu-devel@nongnu.org; Wed, 16 Dec 2020 10:43:34 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1608133412;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Esb6zy1WO/RYyJYud0QOEwDCTmG85Ik70U5rp73eIws=;
 b=LZ/SQrukJNq25huPecVrhWOh788Op5zUQhK7DFPQnXCRA65glex/XKAsycCq3qWxjBZH7m
 kxecGrhLtAZ+F1ltyp3WuGc4uWA6o+stFtnRF5YoAQQX7jpLCz+E1hr4TUq0+VHD9x6UpZ
 VQprun8NFp+/E9IyH3JmjPOGTKN9vnw=
Received: from mail-ed1-f70.google.com (mail-ed1-f70.google.com
 [209.85.208.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-287-YGM69LtXMHuglHM4d3qMrQ-1; Wed, 16 Dec 2020 10:43:29 -0500
X-MC-Unique: YGM69LtXMHuglHM4d3qMrQ-1
Received: by mail-ed1-f70.google.com with SMTP id p17so11948296edx.22
 for <qemu-devel@nongnu.org>; Wed, 16 Dec 2020 07:43:28 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=Esb6zy1WO/RYyJYud0QOEwDCTmG85Ik70U5rp73eIws=;
 b=nFggVeFpPz7dJbFQzC2GO6QSjcUhDLnWjz22SF9e0nZiv2V+czR3E6ifOC+o000EiT
 TUxr/zbnD9UxDBOzG/bhTkV/PND0X3KHMLogyutffGNlAXkBugNsqQ+Ch326CpgZizp+
 ZrzslPIUAML3UB6pZwTbYBCOBbcyQdc9n0OEePQPlNx0iqyQPJm7xT0uqT6w0ILYtPOU
 RETNHDNPRVYtRSc0MWlmTqEKhtz00t1AyQLtWAhlAhtnM3n/lmBwME0M8fowrV6iaRjW
 j1iTDD7joJGe3Y1dTVaOPhQgGCjBM2vJ2d4gAR4vbOZGu0c/03p5Hh/QQvLx3b26657h
 fjiQ==
X-Gm-Message-State: AOAM532xcAspNKAitOGzH07TQtCQPs41Vhou5R6lWNFdmb6vxp0yGAeJ
 egZv10Q661nmFOHVmH29YuMHH3XwEWDqdxZbxvMFV9PbQzhILRgAbv0TWKN/V9WVXP+NJPIF7hu
 388M2CaSHu0yhMZw=
X-Received: by 2002:a17:906:a192:: with SMTP id
 s18mr16374179ejy.249.1608133407801; 
 Wed, 16 Dec 2020 07:43:27 -0800 (PST)
X-Google-Smtp-Source: ABdhPJydL3rEtxP/vgnQMsDXkjGtSsxMi5dyvDRpbTITPsLw9wjGqtTviBE4GzRjanMP1Lsndpuwsw==
X-Received: by 2002:a17:906:a192:: with SMTP id
 s18mr16374164ejy.249.1608133407564; 
 Wed, 16 Dec 2020 07:43:27 -0800 (PST)
Received: from ?IPv6:2001:b07:6468:f312:c8dd:75d4:99ab:290a?
 ([2001:b07:6468:f312:c8dd:75d4:99ab:290a])
 by smtp.gmail.com with ESMTPSA id ld2sm1650493ejb.73.2020.12.16.07.43.26
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 16 Dec 2020 07:43:26 -0800 (PST)
Subject: Re: [PATCH 3/3] trace: do not include TCG helper tracepoints in
 no-TCG builds
To: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org
References: <20201216135529.265165-1-pbonzini@redhat.com>
 <20201216135529.265165-4-pbonzini@redhat.com>
 <98e787e4-884b-61c5-bf52-b041f57747c3@linaro.org>
 <a4974b10-ba71-8bd7-e5a9-6eef7543cee4@redhat.com>
 <476adc2f-fbff-48a9-78fa-ce64cc3e5f80@linaro.org>
From: Paolo Bonzini <pbonzini@redhat.com>
Message-ID: <09f4a69c-b8c5-78b1-3362-90ac1e673b55@redhat.com>
Date: Wed, 16 Dec 2020 16:43:25 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.4.0
MIME-Version: 1.0
In-Reply-To: <476adc2f-fbff-48a9-78fa-ce64cc3e5f80@linaro.org>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=pbonzini@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H3=0.001,
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
Cc: philmd@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 16/12/20 16:25, Richard Henderson wrote:
> On 12/16/20 9:22 AM, Paolo Bonzini wrote:
>> On 16/12/20 16:13, Richard Henderson wrote:
>>>> @@ -71,7 +71,7 @@ foreach d : [
>>>>                    input: meson.project_source_root() / 'trace-events',
>>>>                    command: [ tracetool, '--group=root',
>>>> '--format=@0@'.format(d[1]), '@INPUT@' ],
>>>>                    capture: true)
>>>> -  specific_ss.add(gen)
>>>> +  specific_ss.add(when: 'CONFIG_TCG', if_true: gen)
>>>>    endforeach
>>>
>>> Sure, unless it makes more sense to conditionalize the entire loop, so that
>>> those targets aren't even created?
>>
>> The targets exist but the files won't be created (the rules will be in
>> build.ninja but they'll be orphan).
> 
> Yes, I get that.  So... is there a reason for them to be there, when it seems
> just as easy for them not to be?

Just a dislike for "if"s when conditional add() will do.

Speaking in general, I like the various sections of the meson.build 
files to use either foreach (taking the job of Makefile target pattern 
rules, where "if"s add complication) or if (taking the job of configure 
code, where loops are rare).  It can't always be done, but it helps 
limiting the amount of spaghetti...

Paolo


