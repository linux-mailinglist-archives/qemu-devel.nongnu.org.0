Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 92AFE2D9636
	for <lists+qemu-devel@lfdr.de>; Mon, 14 Dec 2020 11:19:24 +0100 (CET)
Received: from localhost ([::1]:34134 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kokwt-0003Z8-Mw
	for lists+qemu-devel@lfdr.de; Mon, 14 Dec 2020 05:19:23 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:40354)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1kokvP-0002qz-Ge
 for qemu-devel@nongnu.org; Mon, 14 Dec 2020 05:17:51 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:44562)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1kokvN-0000NN-78
 for qemu-devel@nongnu.org; Mon, 14 Dec 2020 05:17:51 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1607941064;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=rABuQ01f4xN4/9IJkTF6M26zuMCOEKUzY7Y45Txfisg=;
 b=XPe4bUF6Q5AJiRxV8MTWUVP47TJYRyg/NXwZ8eGI78uAS3rF+XZey7PfulNYZEvtxMeMWf
 rhfpbee+KA6spAF6e78XOINq2gpZ2KB5lJL4FLNhmT/xzwRysJeaTuaai4WM6TvgM1mUL2
 WESljk80cCgLyk5TtTHeOfLSNMCiJn8=
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-70-aYVzLJsbPnawuM1Q8Z4Kjg-1; Mon, 14 Dec 2020 05:17:43 -0500
X-MC-Unique: aYVzLJsbPnawuM1Q8Z4Kjg-1
Received: by mail-wr1-f70.google.com with SMTP id o12so6364131wrq.13
 for <qemu-devel@nongnu.org>; Mon, 14 Dec 2020 02:17:43 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=rABuQ01f4xN4/9IJkTF6M26zuMCOEKUzY7Y45Txfisg=;
 b=nPkkrk+BBZ2OAO0fUanQRpyeKPDUJE9q31R70X0knhDIsJFO6N5aV1qUok9mot4KSU
 s9bV4Y5WLPn8O58NpE9n3L4IS0kH9UxSdiywug8a25hRSHVYv/uLS5Fcrz5ibK+65dLq
 6L6AkIzHlR5v6LitsAicCErlhfFfY80cP2+PZKyZ7O0Sz8XGGcKp1FojsOuVscz04i0i
 CKj8lLQYu/mTWZnfB6eD5CUd23Tn7zUmIkS4DRa46mAOIVDV/MiyNZfdBJTH6UI2sfO9
 XTnvJJLZJFxq5PhhZAMWXdAzcTc4gtwOi4yLWpxSp0BZwQ2YkAUR4eNxzofQd3TDpDPG
 HUgQ==
X-Gm-Message-State: AOAM530vHp9vTo4G1KY3WDREDukma52GOTkd7Rs6j5UKk8GjqMy3ZQ8V
 yBIjOGTcqhrycUKfMpvWT3rOJ2b6dwV0i9JYxvEmPtTtfyXMhGq81ATAUehBg+boCvGdOMARFlH
 6tKx3GnGCqDyiRb4=
X-Received: by 2002:a05:6000:124e:: with SMTP id
 j14mr22150169wrx.310.1607941061965; 
 Mon, 14 Dec 2020 02:17:41 -0800 (PST)
X-Google-Smtp-Source: ABdhPJxqJL+ArEmh2h1Fbd/p0DwTxOhnlMBoZKGQ8PSaiO0CapA4/tcA4p4VfRG8DdYnnBgO/YwSfw==
X-Received: by 2002:a05:6000:124e:: with SMTP id
 j14mr22150132wrx.310.1607941061678; 
 Mon, 14 Dec 2020 02:17:41 -0800 (PST)
Received: from ?IPv6:2001:b07:6468:f312:5e2c:eb9a:a8b6:fd3e?
 ([2001:b07:6468:f312:5e2c:eb9a:a8b6:fd3e])
 by smtp.gmail.com with ESMTPSA id q73sm31034403wme.44.2020.12.14.02.17.39
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 14 Dec 2020 02:17:40 -0800 (PST)
Subject: Re: [PATCH v3 03/13] compiler.h: remove GCC < 3 __builtin_expect
 fallback
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>,
 marcandre.lureau@redhat.com, qemu-devel@nongnu.org
References: <20201210134752.780923-1-marcandre.lureau@redhat.com>
 <20201210134752.780923-4-marcandre.lureau@redhat.com>
 <fead8bf1-7848-8809-c67a-e6354e7b5cf7@redhat.com>
From: Paolo Bonzini <pbonzini@redhat.com>
Message-ID: <e70d683d-7eb6-5717-eea4-02115935d232@redhat.com>
Date: Mon, 14 Dec 2020 11:17:39 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.4.0
MIME-Version: 1.0
In-Reply-To: <fead8bf1-7848-8809-c67a-e6354e7b5cf7@redhat.com>
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
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H4=-0.01,
 RCVD_IN_MSPIKE_WL=-0.01, SPF_HELO_NONE=0.001,
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Stefano Stabellini <sstabellini@kernel.org>, Paul Durrant <paul@xen.org>,
 Richard Henderson <richard.henderson@linaro.org>,
 Laurent Vivier <laurent@vivier.eu>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>, qemu-arm@nongnu.org,
 Gerd Hoffmann <kraxel@redhat.com>, Stefan Hajnoczi <stefanha@redhat.com>,
 Anthony Perard <anthony.perard@citrix.com>, xen-devel@lists.xenproject.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 10/12/20 15:32, Philippe Mathieu-Daudé wrote:
> On 12/10/20 2:47 PM, marcandre.lureau@redhat.com wrote:
>> From: Marc-André Lureau <marcandre.lureau@redhat.com>
>>
>> Since commit efc6c07 ("configure: Add a test for the minimum compiler
>> version"), QEMU explicitely depends on GCC >= 4.8.
>>
>> (clang >= 3.4 advertizes itself as GCC >= 4.2 compatible and supports
>> __builtin_expect too)
>>
>> Signed-off-by: Marc-André Lureau <marcandre.lureau@redhat.com>
>> ---
>>   include/qemu/compiler.h | 4 ----
>>   1 file changed, 4 deletions(-)
>>
>> diff --git a/include/qemu/compiler.h b/include/qemu/compiler.h
>> index c76281f354..226ead6c90 100644
>> --- a/include/qemu/compiler.h
>> +++ b/include/qemu/compiler.h
>> @@ -44,10 +44,6 @@
>>   #endif
>>   
>>   #ifndef likely
>> -#if __GNUC__ < 3
>> -#define __builtin_expect(x, n) (x)
>> -#endif
>> -
>>   #define likely(x)   __builtin_expect(!!(x), 1)
>>   #define unlikely(x)   __builtin_expect(!!(x), 0)
>>   #endif
>>
> 
> Trying with GCC 10:
> warning: implicit declaration of function ‘likely’
> [-Wimplicit-function-declaration]
> 
> Clang 10:
> warning: implicit declaration of function 'likely' is invalid in C99
> [-Wimplicit-function-declaration]
> 
> Shouldn't it becleaner to test in the configure script or Meson that
> likely() and unlikely() are not defined, and define them here
> unconditionally?

I think the point of the "#ifndef likely" is that some header file 
(maybe something from Linux?) might be defining them unexpectedly.  So 
it's difficult to do the test at configure/meson time.  I would also 
tend towards removing the #ifndef and seeing if something breaks, but 
not as part of this series.

Paolo


