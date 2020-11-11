Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6C69D2AF6C6
	for <lists+qemu-devel@lfdr.de>; Wed, 11 Nov 2020 17:42:58 +0100 (CET)
Received: from localhost ([::1]:43232 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kctCz-0008KV-HP
	for lists+qemu-devel@lfdr.de; Wed, 11 Nov 2020 11:42:57 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:37504)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1kcsqH-0002FX-7M
 for qemu-devel@nongnu.org; Wed, 11 Nov 2020 11:19:30 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:21601)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1kcsqC-0008Go-Q0
 for qemu-devel@nongnu.org; Wed, 11 Nov 2020 11:19:28 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1605111563;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=3FFPd37+U1SjKw63UG+N6BfwvcGLDOArgbLGUSZhHRU=;
 b=Uu+4Fb7+maDy0l1dIk6PBMWIgKOLplZa3CPOB0C16MXwO3jEgUKiyqMimUNmTHAppjnl8i
 DiW+9XJgnLT74mRKNUNrhp5VnZn//tvEaOLDpqAjragzqqlQnlC0R/FxHdt5w2LngZA4mt
 JC6+tTZglxnpffeseI5gMPeyECHE4kE=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-240-E_3WXkuANz2smQ3O1rHeFg-1; Wed, 11 Nov 2020 11:19:20 -0500
X-MC-Unique: E_3WXkuANz2smQ3O1rHeFg-1
Received: by mail-wr1-f72.google.com with SMTP id 67so775320wra.2
 for <qemu-devel@nongnu.org>; Wed, 11 Nov 2020 08:19:20 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=7PpZe20bOIUR2ToM4ZTuSZeygDflyacEuiYU83YvUXw=;
 b=FhQInzZjezmcFK+KgtiKE337OMTBILX1efreTa2d51kK+lAf1fZYj2d/+QjoZdNjcI
 qIzwchAMku+XVjz8kfsNqMsNK08SuQwxyD245OUZDvUlUFpC3dDNIKVvC7U1cwTnQU0u
 76K+qscJ1DZUHvrTPflbnYY28dRuJebM1yj9KZAQYbliENX/tkjX/NNFakaweSpO361Y
 L+CLocAQNaa4wyfx/xxom8LXH2To1gdl02SShUbxiUkNzlL4WycrYJV6B7UUHmkIbLAK
 xg6l/hOmLSImISNmW17F5kT6KPbZSGBn00KJGBG5xTt7Kei31zBXzeBYjrwcdOdTf+1R
 OfkQ==
X-Gm-Message-State: AOAM533uWKzM7GysRNFyuUMGGqhzZelggFTBQAkpgN/YRj/XsjBpRh6Z
 q7zMtdzqg+mI8bb0iG427sEIWBqTuNL4jV7KdEGMZRIKicLQVHXnbRjFVFpEyay6/iax7Y/gXq2
 ySsxV4F1TlK4CG4A=
X-Received: by 2002:a1c:f209:: with SMTP id s9mr4797295wmc.115.1605111559119; 
 Wed, 11 Nov 2020 08:19:19 -0800 (PST)
X-Google-Smtp-Source: ABdhPJx+rtIP2g0OGeXonx1rs59oTlxi4gaJV+yzzfqfJxoVh8PNWMSZZl61FDfmU4da0wNPb94ugQ==
X-Received: by 2002:a1c:f209:: with SMTP id s9mr4797282wmc.115.1605111558960; 
 Wed, 11 Nov 2020 08:19:18 -0800 (PST)
Received: from [192.168.1.36] (234.red-83-42-66.dynamicip.rima-tde.net.
 [83.42.66.234])
 by smtp.gmail.com with ESMTPSA id v8sm3081146wmg.28.2020.11.11.08.19.17
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 11 Nov 2020 08:19:18 -0800 (PST)
Subject: Re: [PATCH-for-5.2 v2 2/4] meson: Only build vhost-user when system
 or tools is enabled
To: Stefan Hajnoczi <stefanha@gmail.com>
References: <20201111120912.3245574-1-philmd@redhat.com>
 <20201111120912.3245574-3-philmd@redhat.com>
 <20201111154846.GA1398376@stefanha-x1.localdomain>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Message-ID: <4c5f796c-aa33-82b9-96e4-0dec0b390d38@redhat.com>
Date: Wed, 11 Nov 2020 17:19:16 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.4.0
MIME-Version: 1.0
In-Reply-To: <20201111154846.GA1398376@stefanha-x1.localdomain>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=WINDOWS-1252
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=63.128.21.124; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/11/11 01:42:46
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H5=0.001,
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
Cc: Kevin Wolf <kwolf@redhat.com>, Stefan Hajnoczi <stefanha@redhat.com>,
 qemu-devel@nongnu.org, qemu-block@nongnu.org, Max Reitz <mreitz@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 11/11/20 4:48 PM, Stefan Hajnoczi wrote:
> On Wed, Nov 11, 2020 at 01:09:10PM +0100, Philippe Mathieu-Daudé wrote:
>> It does not make sense to select vhost-user features
>> without system-mode or tools. Return an error when
>> this configuration is selected. Example:
>>
>>   $ ../configure --disable-tools --disable-system --enable-vhost-user-blk-server
>>
>>   ../meson.build:755:4: ERROR: Problem encountered: vhost-user does not make sense without system or tools support enabled
>>
>> Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
>> ---
>>  meson.build | 4 ++++
>>  1 file changed, 4 insertions(+)
>>
>> diff --git a/meson.build b/meson.build
>> index 4b789f18c17..4fc58eb2c3d 100644
>> --- a/meson.build
>> +++ b/meson.build
>> @@ -751,6 +751,10 @@
>>  
>>  has_statx = cc.links(statx_test)
>>  
>> +if 'CONFIG_VHOST_USER' in config_host and not (have_system or have_tools)
>> +    error('vhost-user does not make sense without system or tools support enabled')
>> +endif
> 
> Now the following fails on Linux hosts:
> 
>   $ ./configure --disable-tools --disable-system
>   ../meson.build:755:4: ERROR: Problem encountered: vhost-user does not make sense without system or tools support enabled
> 
> Previously it would succeed and make would build qemu-user binaries,
> documentation, trace-events-all, etc so this looks like a regression.
> 
> In addition, adding this error is inconsistent with all the other
> ./configure options which do not check whether the build target that
> uses them has been disabled. We'd need to implement the same check for
> every option to make ./configure consistent. For example, if SPICE is
> enabled but --disable-system is given then there should be an error
> saying it enabling SPICE does not make sense, etc.

OK. Back to your v1 then =)

> 
> Stefan
> 


