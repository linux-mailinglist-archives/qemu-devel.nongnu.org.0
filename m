Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7EEF7303FBC
	for <lists+qemu-devel@lfdr.de>; Tue, 26 Jan 2021 15:09:22 +0100 (CET)
Received: from localhost ([::1]:51328 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l4P21-0003Em-IL
	for lists+qemu-devel@lfdr.de; Tue, 26 Jan 2021 09:09:21 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:43820)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1l4P0u-0002mi-CA
 for qemu-devel@nongnu.org; Tue, 26 Jan 2021 09:08:12 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:31710)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1l4P0s-0001oq-Lz
 for qemu-devel@nongnu.org; Tue, 26 Jan 2021 09:08:12 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1611670089;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=6AjCrmeiOwPihyaIFPvEP1oVEU1nnUAOVGUL+BCnMaM=;
 b=NwbrpBRVYv4PzdF72VaXPh3Du/9e3eS96PwuhTl3Ekgkl1s4Izc6LZUwSc9g4I2m7pm+O1
 2Rs2r1lqqOuUtJpQ4pnMJc3Gn+Vw+o68DcJ/Fz4adyOt4mH1mEA8U5sCkh2GEbKheoo5QC
 z+IqJivEf4nBKakJBWsoCFyvjAF5d1w=
Received: from mail-ej1-f71.google.com (mail-ej1-f71.google.com
 [209.85.218.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-202-qdYBZdyWNUSUI0L77o78-A-1; Tue, 26 Jan 2021 09:08:08 -0500
X-MC-Unique: qdYBZdyWNUSUI0L77o78-A-1
Received: by mail-ej1-f71.google.com with SMTP id q11so4960510ejd.0
 for <qemu-devel@nongnu.org>; Tue, 26 Jan 2021 06:08:07 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=6AjCrmeiOwPihyaIFPvEP1oVEU1nnUAOVGUL+BCnMaM=;
 b=mBOl+MEh0kBNyEeYzzD6Ns7eW2bjVoSR1eB2tuEb3SOd6S6T4MsPM3wrVVBxSj/ZAn
 T6UmmkReHIS90/OsJp+NnKNG+rZaJ6UNIbLqreLVQNZsWhGv5W7nOfgTIAvoYLuYEo1B
 BMZN6J36PycXCyuP0N6i9r12tovSYOa8KFiS67U5THxtBse82HnWBwTEfevF5BMiYAkr
 JkqHJPbWsG5CK0rtT5opjSsH++1spiFbOORIQcBn+UglywQqHQGLfKA4qLeq+1+kFjOC
 CDERjVP1NA3qbhYQTgGP3FlMW5hbI+PWWfJ0ULnmcgkZffVXgeH1tTAM2wsnfrjUm35f
 BA5w==
X-Gm-Message-State: AOAM532QOPg8Ngj6d2GeuE89U9xz4E8dmLzphJfS12+BB4tAJHY/xuEG
 1PW8YY5nC4vo2P/uSYwp0AtUWpCn2jwTvYTY716Qg4h3jxzVRCkvn6rMzLqWfIwx0tTHSgZJG0z
 GH5bDFW1h9AROjJs=
X-Received: by 2002:aa7:c719:: with SMTP id i25mr4789804edq.197.1611670086906; 
 Tue, 26 Jan 2021 06:08:06 -0800 (PST)
X-Google-Smtp-Source: ABdhPJx8KPJ4buuVn3cYr4SWg69MjGC4+B6N1HIvs8CabvCbmOP3MCP9XpdufMa0QzucanQ3G8OuGQ==
X-Received: by 2002:aa7:c719:: with SMTP id i25mr4789768edq.197.1611670086677; 
 Tue, 26 Jan 2021 06:08:06 -0800 (PST)
Received: from ?IPv6:2001:b07:6468:f312:c8dd:75d4:99ab:290a?
 ([2001:b07:6468:f312:c8dd:75d4:99ab:290a])
 by smtp.gmail.com with ESMTPSA id qh13sm9795634ejb.33.2021.01.26.06.08.05
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 26 Jan 2021 06:08:05 -0800 (PST)
Subject: Re: [PATCH] meson: Restrict Cocoa framework check to macOS
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>,
 Peter Maydell <peter.maydell@linaro.org>
References: <20210126132637.3175037-1-philmd@redhat.com>
 <CAFEAcA8q=ZgMYvZfr75RP90T0SVvD1JUnT2sN08H5T8DLpanbg@mail.gmail.com>
 <799ec5a4-7a0f-074b-87dd-99d0f80bbb35@redhat.com>
From: Paolo Bonzini <pbonzini@redhat.com>
Message-ID: <7f090da8-e523-0360-5953-53c46dcaeb78@redhat.com>
Date: Tue, 26 Jan 2021 15:08:04 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.0
MIME-Version: 1.0
In-Reply-To: <799ec5a4-7a0f-074b-87dd-99d0f80bbb35@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=pbonzini@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=63.128.21.124; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -30
X-Spam_score: -3.1
X-Spam_bar: ---
X-Spam_report: (-3.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.255,
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
Cc: Christophe de Dinechin <dinechin@redhat.com>,
 Roman Bolshakov <r.bolshakov@yadro.com>,
 QEMU Developers <qemu-devel@nongnu.org>, Brendan Shanks <brendan@bslabs.net>,
 Gerd Hoffmann <kraxel@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 26/01/21 14:47, Philippe Mathieu-Daudé wrote:
>>>
>>> -cocoa = dependency('appleframeworks', modules: 'Cocoa', required: get_option('cocoa'))
>>> +cocoa = not_found
>>> +if targetos == 'darwin'
>>> +  cocoa = dependency('appleframeworks', modules: 'Cocoa', required: get_option('cocoa'))
>>> +endif
>>>   if cocoa.found() and get_option('sdl').enabled()
>>>     error('Cocoa and SDL cannot be enabled at the same time')
>>>   endif
>> What difference does this change make?
> On my slow Fedora host it run cmake checks if it can build cocoa.
> 

Can you send the meson-logs/meson-log.txt?  On my machine (Meson 0.56.0) 
I see only

Run-time dependency appleframeworks found: NO (tried framework)

and no cmake in sight (in fact no process is spawned to do the check).

Paolo


