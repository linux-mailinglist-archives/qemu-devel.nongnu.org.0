Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 41C16324FC4
	for <lists+qemu-devel@lfdr.de>; Thu, 25 Feb 2021 13:18:20 +0100 (CET)
Received: from localhost ([::1]:57070 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lFFb1-0004vS-9M
	for lists+qemu-devel@lfdr.de; Thu, 25 Feb 2021 07:18:19 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:50118)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1lFFYr-0003gb-BM
 for qemu-devel@nongnu.org; Thu, 25 Feb 2021 07:16:06 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:47471)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1lFFYm-0000ep-T7
 for qemu-devel@nongnu.org; Thu, 25 Feb 2021 07:16:03 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1614255359;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=dKlCV/EdaKpbLPTcNt4ZaP4mUOHl750bQ8zfei3rBAI=;
 b=dZuoTtZ+DKklZ/qi43KRIQFOxZ5an73jH1cq0YvhPQVKKKbqyKCEv812DSVq6s6eQCeR7N
 Jl46SZLy1xZIp+cOii/5gKvHDocr2W4/gyGdUgFlxY9RGnAV57/H8uIRvpRdUvZPNGzEFX
 Jdpcdkgwf8YqkBnuD9ZLKVW+MMQWqmM=
Received: from mail-ej1-f69.google.com (mail-ej1-f69.google.com
 [209.85.218.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-431-tyqoFLe2O6mrkxQUbp4gtg-1; Thu, 25 Feb 2021 07:15:57 -0500
X-MC-Unique: tyqoFLe2O6mrkxQUbp4gtg-1
Received: by mail-ej1-f69.google.com with SMTP id h8so1701730ejx.12
 for <qemu-devel@nongnu.org>; Thu, 25 Feb 2021 04:15:56 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=dKlCV/EdaKpbLPTcNt4ZaP4mUOHl750bQ8zfei3rBAI=;
 b=FQop8pkKWbxysovhQou9EgTzsCLL1sEc0YAVLpUWhJxm42Y5enGhbixpvoxBRY1K/T
 07t3wYmP4WLMl+eJ5KA32GgYNFHIAYYOI5mpYgNV0pXXBJQhT2/Xx+R5WoPRzj8z/aGJ
 1FNv4uJbjdb9mDhXLy19ji8PBuiXzVKcZMFS/DzYm94wqZz6LRZ0eminhKA2iJYQwpYJ
 YUpcyRlDxT2uc8jcnNrEqi80v5+6CZivuiLgPX5wleJCHEvNRCiJXDyRNUnIwlEQE5S9
 xe8Si3qEiWocad2zrF2s8H41U7XH+QnbeTj6HBKbGJLPFp9n003kwpsEHqaERg/gaBDX
 lxNA==
X-Gm-Message-State: AOAM530MJKQjHKo4M3mg8q26eckD/jb6sXreMS/USJe3pslXEuK6z9pE
 eAvXaZ/W2rQNlhCMVa+fZTVjCxIVp2Oj4oLlHRB5cEoDS9ff7VqjM5NZ4WYV4CV+Srt1W//2YkG
 NedqenwT481Birac=
X-Received: by 2002:a50:fe86:: with SMTP id d6mr2584233edt.80.1614255355763;
 Thu, 25 Feb 2021 04:15:55 -0800 (PST)
X-Google-Smtp-Source: ABdhPJw6xkVq9QlVtpIzFWaJ7jPUgUNzg1tdBBtxspOYz+ZsJuLOJtm4byP/LOnW9Izck1laYbhcKA==
X-Received: by 2002:a50:fe86:: with SMTP id d6mr2584220edt.80.1614255355612;
 Thu, 25 Feb 2021 04:15:55 -0800 (PST)
Received: from ?IPv6:2001:b07:6468:f312:c8dd:75d4:99ab:290a?
 ([2001:b07:6468:f312:c8dd:75d4:99ab:290a])
 by smtp.gmail.com with ESMTPSA id q27sm2879609ejc.74.2021.02.25.04.15.54
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 25 Feb 2021 04:15:54 -0800 (PST)
Subject: Re: [PATCH] multiprocess: move feature to meson_options.txt
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>,
 qemu-devel@nongnu.org, Stefan Hajnoczi <stefanha@redhat.com>
References: <20210224122306.451764-1-pbonzini@redhat.com>
 <72fc7d76-f8e3-2c0f-e890-99509bb6230d@redhat.com>
From: Paolo Bonzini <pbonzini@redhat.com>
Message-ID: <e89873e7-d996-0161-8c4f-587aadd2208f@redhat.com>
Date: Thu, 25 Feb 2021 13:15:53 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.0
MIME-Version: 1.0
In-Reply-To: <72fc7d76-f8e3-2c0f-e890-99509bb6230d@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=pbonzini@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.435, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001,
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
Cc: Elena Ufimtseva <elena.ufimtseva@oracle.com>,
 John G Johnson <john.g.johnson@oracle.com>, Thomas Huth <thuth@redhat.com>,
 Jagannathan Raman <jag.raman@oracle.com>,
 Markus Armbruster <armbru@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 25/02/21 11:38, Philippe Mathieu-Daudé wrote:
> On 2/24/21 1:23 PM, Paolo Bonzini wrote:
>> Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
>> ---
>>   configure         | 12 ++++--------
>>   meson.build       |  9 +++++++--
>>   meson_options.txt |  2 ++
>>   3 files changed, 13 insertions(+), 10 deletions(-)
> ...
> 
>> @@ -2535,6 +2540,7 @@ endif
>>   summary_info += {'target list':       ' '.join(target_dirs)}
>>   if have_system
>>     summary_info += {'default devices':   get_option('default_devices')}
>> +  summary_info += {'Multiprocess QEMU': multiprocess_allowed}
> 
> Since you are changing this, it is a good opportunity to find a
> better description to this feature (similarly how we recently clarified
> the TCI description).
> 
> The current description is confusing with multiprocessing (which is
> by default on QEMU and every developer want to exploit that).
> 
> So the main multiprocess code resides in hw/remote/mpqemu*.
> 
> I have the impression "monolithic application" is common in
> software engineering. What about "polylithic QEMU"?
> 
> Stefan once described it as "out of (main) process device emulation".

Out of process emulation?

Paolo

> Relevant links:
> https://english.stackexchange.com/questions/112633/whats-an-antonym-of-monolithic-as-in-monolithic-architecture/119212#119212
> https://infovis-wiki.net/wiki/Polylithic_design
> 
> ...
>>   if not supported_cpus.contains(cpu)
>> diff --git a/meson_options.txt b/meson_options.txt
>> index 675a9c500a..bf11de7bb2 100644
>> --- a/meson_options.txt
>> +++ b/meson_options.txt
>> @@ -45,6 +45,8 @@ option('cfi', type: 'boolean', value: 'false',
>>          description: 'Control-Flow Integrity (CFI)')
>>   option('cfi_debug', type: 'boolean', value: 'false',
>>          description: 'Verbose errors in case of CFI violation')
>> +option('multiprocess', type: 'feature', value: 'auto',
>> +       description: 'Multiprocess QEMU support')
> 


