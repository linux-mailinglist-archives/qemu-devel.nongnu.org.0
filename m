Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id EE72E2BB0E4
	for <lists+qemu-devel@lfdr.de>; Fri, 20 Nov 2020 17:47:53 +0100 (CET)
Received: from localhost ([::1]:55714 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kg9Zg-0006YP-VF
	for lists+qemu-devel@lfdr.de; Fri, 20 Nov 2020 11:47:52 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:40262)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1kg9XY-0004io-Qv
 for qemu-devel@nongnu.org; Fri, 20 Nov 2020 11:45:40 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:46653)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1kg9XX-0002B9-13
 for qemu-devel@nongnu.org; Fri, 20 Nov 2020 11:45:40 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1605890737;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=09rKESvYzZ/5l4b+PBIW7MwjDJ3BSIT0j/cuYBuZdC8=;
 b=MiZqbG/TDDNWykOAtSeoAefLt3uEo8wUl1/ahgemVkfCb6uRsMtzrNW510x4Bi2PGRVcKP
 QWi6Md8XoKfuxySyPZJE0k0b8Eg7xMlq3m4NJGx1ppX3UBr/tY6FXYRwhQe4kkYO6khHIs
 4Ol8oJAowaoyMvDtSw+x4tg23ZaWR7c=
Received: from mail-ej1-f71.google.com (mail-ej1-f71.google.com
 [209.85.218.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-496-ZNayJfPHPEGzLzAdJC3_9g-1; Fri, 20 Nov 2020 11:45:34 -0500
X-MC-Unique: ZNayJfPHPEGzLzAdJC3_9g-1
Received: by mail-ej1-f71.google.com with SMTP id f12so3725055ejk.2
 for <qemu-devel@nongnu.org>; Fri, 20 Nov 2020 08:45:34 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:to:cc:references:from:subject:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=09rKESvYzZ/5l4b+PBIW7MwjDJ3BSIT0j/cuYBuZdC8=;
 b=hX0Uw0pp5JR7YpF2LIIK2F3Gzs8D4Ld2Z/twlcF8Ns4DqaURzMW/9foEVu5sCO/JLa
 iP/HTBTJpiEtW2G8k8WzR1GAJt+kcGvoO3Nvzqz6VYD+t6NOq/aiDMbMFOJ0/Tkaqbls
 q8g+d9SCOfkl7KUZ8y6QLTBxSQ66RrMrNQ2Yb1MMw4y0gmEu+bkbC20bXXxlUzdr8ihe
 fUyFV7JP9XCUgPoXDEWE9fH3q0VmIHZWeoec7i4Q480WoHy+NuDDkFN5TzQ3S0EgdtA3
 fMqzUJzMMpB5dBHIEcOIUuRlCxb3IBtG60guu9rFLFn5aS4gdE5neOf2iZKC2c7f7gkR
 GSkg==
X-Gm-Message-State: AOAM533vR2YlsYMbr1t65yBlcm/dlydq4B+iUsPiyBMjk3vgY3nP4xUC
 d730BXl4H70PhOCv+4A7cdhdJIXvuhnGSudjZJGhdyuhEL+d89uAfmhEa2q23/49zcTYOzZ0by3
 9e3UvJWQ0+dZiu6aWRftB8QNWv1CZo14G0J63UtqJNH5uYrSgQRTpzbGCOPM3O77+zj0=
X-Received: by 2002:a50:8562:: with SMTP id 89mr11726281edr.144.1605890733106; 
 Fri, 20 Nov 2020 08:45:33 -0800 (PST)
X-Google-Smtp-Source: ABdhPJznWpgf9EatSVHdOOl0LNubA5xwqD8Pdz2xmdU9XL082bmWCUP2LrJzpyVYouubWogB7OMTfQ==
X-Received: by 2002:a50:8562:: with SMTP id 89mr11726261edr.144.1605890732819; 
 Fri, 20 Nov 2020 08:45:32 -0800 (PST)
Received: from ?IPv6:2001:b07:6468:f312:c8dd:75d4:99ab:290a?
 ([2001:b07:6468:f312:c8dd:75d4:99ab:290a])
 by smtp.gmail.com with ESMTPSA id ov32sm1316160ejb.123.2020.11.20.08.45.31
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 20 Nov 2020 08:45:32 -0800 (PST)
To: Igor Mammedov <imammedo@redhat.com>
References: <20201027182144.3315885-1-pbonzini@redhat.com>
 <20201027182144.3315885-30-pbonzini@redhat.com>
 <20201120172859.38c76056@redhat.com>
From: Paolo Bonzini <pbonzini@redhat.com>
Subject: Re: [PATCH 29/29] vl: allow -incoming defer with -preconfig
Message-ID: <3641abe2-5590-5400-518d-4abb69473744@redhat.com>
Date: Fri, 20 Nov 2020 17:45:31 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.4.0
MIME-Version: 1.0
In-Reply-To: <20201120172859.38c76056@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=pbonzini@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=63.128.21.124; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H4=0.001,
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
Cc: qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 20/11/20 17:28, Igor Mammedov wrote:
> On Tue, 27 Oct 2020 14:21:44 -0400
> Paolo Bonzini <pbonzini@redhat.com> wrote:
> 
>> Now that there is no RUN_STATE_PRECONFIG anymore that can conflict with
>> RUN_STATE_INMIGRATE, we can allow -incoming defer with -preconfig.
>>
>> Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
>> ---
>>   softmmu/vl.c | 5 ++---
>>   1 file changed, 2 insertions(+), 3 deletions(-)
>>
>> diff --git a/softmmu/vl.c b/softmmu/vl.c
>> index 98666c0612..b0cb539da9 100644
>> --- a/softmmu/vl.c
>> +++ b/softmmu/vl.c
>> @@ -3199,9 +3199,8 @@ static void qemu_validate_options(void)
>>                        "mutually exclusive");
>>           exit(EXIT_FAILURE);
>>       }
>> -    if (incoming && preconfig_requested) {
>> -        error_report("'preconfig' and 'incoming' options are "
>> -                     "mutually exclusive");
>> +    if (incoming && preconfig_requested && strcmp(incoming, "defer") != 0) {
> why limit it only to 'defer'?

After these patches, the difference between "-incoming defer" and 
"-incoming foo" is very small: the latter adds an automatic 
"migrate-incoming foo" at the tail of x-exit-preconfig, and that's it.

At the time I sent these patches, my plan was to replace 
x-exit-preconfig with a command "finish-machine-init" that the user 
would follow with one of "cont", "migrate-incoming" or "loadvm".  So it 
would make sense to have "-incoming defer" only, because without 
"x-exit-preconfig" there's no command that triggers incoming migration 
as specified with "-incoming foo".

Then I sent only the minimal (so to speak) beginning of the series, but 
decided to be consrvative in what to allow on the command line.  Since 
you are interacting with the monitor anyway to exit preconfig, you can 
use it to send the migrate-incoming command.

Thanks,

Paolo


