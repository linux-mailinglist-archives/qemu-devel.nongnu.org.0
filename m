Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C103E2D76A8
	for <lists+qemu-devel@lfdr.de>; Fri, 11 Dec 2020 14:36:27 +0100 (CET)
Received: from localhost ([::1]:40714 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kniaw-0004fv-Pi
	for lists+qemu-devel@lfdr.de; Fri, 11 Dec 2020 08:36:26 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:57478)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1kniZq-0003zs-3z
 for qemu-devel@nongnu.org; Fri, 11 Dec 2020 08:35:18 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:26775)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1kniZn-0007xH-Hr
 for qemu-devel@nongnu.org; Fri, 11 Dec 2020 08:35:17 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1607693713;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=osH/JA+Wv9MSqp1jYXgjtblw2aM6RdiWnx1TMalutuI=;
 b=Vs+v0aGcvOTn199NxgBcBJeGMg/Au7Th3pDqe6BtMkxeldV02bDE0zWy53/At2TfktZbGU
 uz6lEmsM7BQMAxhFRMW92x3gUIV0b8zmpSjUmOJ+R57P6AZNOQNvdEmjjBNPm2D1gxOxyc
 pnH2GIL16MVHq4D9tl9S026Czeh+rls=
Received: from mail-ej1-f69.google.com (mail-ej1-f69.google.com
 [209.85.218.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-296-OSObP42ZOl-uM4Bl2mrKZQ-1; Fri, 11 Dec 2020 08:35:11 -0500
X-MC-Unique: OSObP42ZOl-uM4Bl2mrKZQ-1
Received: by mail-ej1-f69.google.com with SMTP id d19so817559ejo.18
 for <qemu-devel@nongnu.org>; Fri, 11 Dec 2020 05:35:11 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=osH/JA+Wv9MSqp1jYXgjtblw2aM6RdiWnx1TMalutuI=;
 b=rmZ+I9eRGeE0OgEOwA/3UahOoLsFp+SiYG9i00f1swDpiwka1m0c7be1WjljCMKBRX
 C37wfz3SM017hzJyQL0nYeJirVZn7Plqm4CTOYrRoVg+Ut0wk/yi6+5eLdvppfwyPUN0
 aJuXAhWqcEq+obfgxtOfuxAuV9qYW6Vckob/PDl3sl1F7J1y34qkj6w+c4g0XBAstFmH
 Psgali6A6ECPVuApMBZuv1tzyaffOlaqp5mO9Ap785h3dd8PAwzyszxxKGay/bEn8mWo
 M9eQEbNxyW0QQHzIYw02MwnMVdE/uTeF/i2CPyY1TRpt9WlDvXDACmPvAxm+PwYKXTQ4
 WDyw==
X-Gm-Message-State: AOAM533k/tLFIQcSayxl6EN/o5e0NQy9Ltby2TvgxPt+ZipvWfvdkc59
 bhywTka8dPaSZb9s5kpzX2iCG86qlvnrAQYXqpJVUF4sbYeKYC+gIq49rmatus3fb+4+OEqBAH8
 EKzkN7NuO6Yd2C9E=
X-Received: by 2002:a17:906:81ca:: with SMTP id
 e10mr10939956ejx.449.1607693710631; 
 Fri, 11 Dec 2020 05:35:10 -0800 (PST)
X-Google-Smtp-Source: ABdhPJyGoIdrP8vA/cS0g60JbOQwkfrd/B0RMtL7IBW611K1OwqbaxiSc6bWCPybNvwnuZCtsbQjpw==
X-Received: by 2002:a17:906:81ca:: with SMTP id
 e10mr10939947ejx.449.1607693710455; 
 Fri, 11 Dec 2020 05:35:10 -0800 (PST)
Received: from [192.168.1.36] (101.red-88-21-206.staticip.rima-tde.net.
 [88.21.206.101])
 by smtp.gmail.com with ESMTPSA id da9sm7688352edb.84.2020.12.11.05.35.09
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 11 Dec 2020 05:35:09 -0800 (PST)
Subject: Re: [RFC PATCH v4] compiler.h: remove GCC < 3 __builtin_expect
 fallback
To: Claudio Fontana <cfontana@suse.de>, qemu-devel@nongnu.org
References: <20201211131346.473882-1-philmd@redhat.com>
 <d15617d9-4892-b349-2e22-8f6bb7c4a715@suse.de>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Message-ID: <3431678f-5d54-b35a-285c-3138f17a5d08@redhat.com>
Date: Fri, 11 Dec 2020 14:35:08 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.5.0
MIME-Version: 1.0
In-Reply-To: <d15617d9-4892-b349-2e22-8f6bb7c4a715@suse.de>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=63.128.21.124; envelope-from=philmd@redhat.com;
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
Cc: =?UTF-8?Q?Marc-Andr=c3=a9_Lureau?= <marcandre.lureau@redhat.com>,
 Peter Maydell <peter.maydell@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 12/11/20 2:28 PM, Claudio Fontana wrote:
> On 12/11/20 2:13 PM, Philippe Mathieu-Daudé wrote:
>> Since commit efc6c07 ("configure: Add a test for the minimum compiler
>> version"), QEMU explicitely depends on GCC >= 4.8.
>>
>> (clang >= 3.4 advertizes itself as GCC >= 4.2 compatible and supports
>> __builtin_expect too)
>>
>> Signed-off-by: Marc-André Lureau <marcandre.lureau@redhat.com>
>> [PMD: #error if likely/unlikely already defined]
>> Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
>> ---
>> Supersedes: <20201210134752.780923-4-marcandre.lureau@redhat.com>
>> ---
>>  include/qemu/compiler.h | 7 ++-----
>>  1 file changed, 2 insertions(+), 5 deletions(-)
>>
>> diff --git a/include/qemu/compiler.h b/include/qemu/compiler.h
>> index c76281f3540..ae1aee79c8d 100644
>> --- a/include/qemu/compiler.h
>> +++ b/include/qemu/compiler.h
>> @@ -43,14 +43,11 @@
>>  #define tostring(s)	#s
>>  #endif
>>  
>> -#ifndef likely
>> -#if __GNUC__ < 3
>> -#define __builtin_expect(x, n) (x)
>> +#if defined(likely) || defined(unlikely)
>> +#error building with likely/unlikely is not supported
> 
> I'd put the argument of #error as a single string constant delimited by quotes ",
> doesn't matter in this case though as there are no problem characters in the string.

This is the style I prefer too, but I this seems the QEMU style...:

$ git grep -E \#\s*error|wc -l
82
$ git grep -E \#\s*error|fgrep \"|wc -l
11

> 
>>  #endif
>> -
>>  #define likely(x)   __builtin_expect(!!(x), 1)
>>  #define unlikely(x)   __builtin_expect(!!(x), 0)
>> -#endif
>>  
>>  #ifndef container_of
>>  #define container_of(ptr, type, member) ({                      \
>>
> 
> Reviewed-by: Claudio Fontana <cfontana@suse.de>
> 


