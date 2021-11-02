Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A248C442DF7
	for <lists+qemu-devel@lfdr.de>; Tue,  2 Nov 2021 13:30:30 +0100 (CET)
Received: from localhost ([::1]:51308 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mhsvt-0003Fa-G9
	for lists+qemu-devel@lfdr.de; Tue, 02 Nov 2021 08:30:29 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:55860)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1mhsKI-0002tU-O7
 for qemu-devel@nongnu.org; Tue, 02 Nov 2021 07:51:40 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:23871)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1mhsKD-0000WE-4E
 for qemu-devel@nongnu.org; Tue, 02 Nov 2021 07:51:36 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1635853891;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=+6db98kwTZd6BbqsHwbiTJsYoJzhP1qFFhKWWbE0zVY=;
 b=cfvF2C58Mgwz5nAHsi85oo0I4YcDMayjxjfQ8gMpcQ0+sjiR+OF4RdED9ZzNynv18OdKHt
 m/Sx3tiqwJGqGsNRruiiaZY/qdI6sxajNdxynOXpw6JJ/p4RrGYDxbeS/AxQgA2opKPTQm
 IBz2n8lKzYXUentNKDlHg8idMru7+oc=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-479-E3YrUM4OPHS48zbu7LyQhA-1; Tue, 02 Nov 2021 07:51:30 -0400
X-MC-Unique: E3YrUM4OPHS48zbu7LyQhA-1
Received: by mail-wr1-f69.google.com with SMTP id
 q5-20020a5d5745000000b00178abb72486so5401020wrw.9
 for <qemu-devel@nongnu.org>; Tue, 02 Nov 2021 04:51:29 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=+6db98kwTZd6BbqsHwbiTJsYoJzhP1qFFhKWWbE0zVY=;
 b=JACEfuympid5uvsJAvdYCqmFr3SrMPK07mH9JVBwIpQYcbNDzZciLxRqIntVnzaIhB
 BrjfGvwWPtW60O4AxoAmN6x8XNSgpnFs7YDJUlmsWOB8KAYzkxmcAj1FAV9TuM6z5ceU
 nVSfsjlT5pnTb/ObdIVyjoOmyoqKRNfoKjbUYEN1Y5Gfx1t7icfSYazWUARQlssLCoMC
 ksUFji6gE8YVyp6WS/DunrsgPqnsGNnyFm0qD104CkxGry/qiR0CBZhyMgWywOfAA4jU
 Wqtu9IBfPv2YHyLkRv47HSShNvLi5oTva/Zk0EPXILzVw1dqd3lvL6xJ1wtnQe9Mk9kD
 5O6A==
X-Gm-Message-State: AOAM5301pLiZNLKl6HX+PbdQfLJAa+ONkfIU5qsl087/V7ofxoa/98k2
 layqxTdfzZnyCcdyxvHXJHNzp3LTgvUuH2wiPS54TJlR2FtApQNGEtNHLq939xjv4yHpUChQMCr
 mHIK5H693wEJCoIc=
X-Received: by 2002:a1c:208b:: with SMTP id g133mr6553247wmg.128.1635853888631; 
 Tue, 02 Nov 2021 04:51:28 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyNWMh4eQ5lhExqzggV7TS0kX2HGCKrvxMHF3ro9XYnkz4pHxsQ3vLzcpOEoL82/Fv12uCKfA==
X-Received: by 2002:a1c:208b:: with SMTP id g133mr6553231wmg.128.1635853888428; 
 Tue, 02 Nov 2021 04:51:28 -0700 (PDT)
Received: from ?IPV6:2001:b07:6468:f312:c8dd:75d4:99ab:290a?
 ([2001:b07:6468:f312:c8dd:75d4:99ab:290a])
 by smtp.gmail.com with ESMTPSA id r17sm2408593wmq.11.2021.11.02.04.51.27
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 02 Nov 2021 04:51:27 -0700 (PDT)
Message-ID: <fae4b4ef-7cf3-ea0e-fc93-2a8ed55d18d8@redhat.com>
Date: Tue, 2 Nov 2021 12:51:26 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.1.0
Subject: Re: [PATCH] meson: remove unnecessary coreaudio test program
To: Peter Maydell <peter.maydell@linaro.org>
References: <20211102113044.204344-2-pbonzini@redhat.com>
 <CAFEAcA9VO0w6fYuOFh+H-raQigOkms8Bv=LrMkkgc1BVzaredw@mail.gmail.com>
From: Paolo Bonzini <pbonzini@redhat.com>
In-Reply-To: <CAFEAcA9VO0w6fYuOFh+H-raQigOkms8Bv=LrMkkgc1BVzaredw@mail.gmail.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=pbonzini@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -60
X-Spam_score: -6.1
X-Spam_bar: ------
X-Spam_report: (-6.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.702,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-2.549, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001,
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
Cc: qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 02/11/21 12:49, Peter Maydell wrote:
>>     coreaudio = dependency('appleframeworks', modules: 'CoreAudio',
>>                            required: get_option('coreaudio'))
>> -  if coreaudio.found() and not cc.links('''
>> -    #include <CoreAudio/CoreAudio.h>
>> -    int main(void)
>> -    {
>> -      return (int)AudioGetCurrentHostTime();
>> -    }''')
>> -    coreaudio = not_found
>> -  endif
>> -
>> -  if not coreaudio.found()
>> -    if get_option('coreaudio').enabled()
>> -      error('CoreAudio not found')
>> -    else
>> -      warning('CoreAudio not found, disabling')
>> -    endif
>> -  endif
>>   endif
> Don't we still want
> 
>    if not coreaudio.found()
>      if get_option('coreaudio').enabled()
>        error('CoreAudio not found')
>      endif
>    endif

No, the "required: get_option('coreaudio')" takes care of both forced 
enabling and forced disabling.

Paolo


