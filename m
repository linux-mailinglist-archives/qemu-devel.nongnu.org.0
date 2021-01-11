Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2D6A42F1CA1
	for <lists+qemu-devel@lfdr.de>; Mon, 11 Jan 2021 18:40:10 +0100 (CET)
Received: from localhost ([::1]:46120 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kz1Ah-0005BJ-TU
	for lists+qemu-devel@lfdr.de; Mon, 11 Jan 2021 12:40:03 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:54332)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1kz15w-0000Hc-8y
 for qemu-devel@nongnu.org; Mon, 11 Jan 2021 12:35:09 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:49374)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1kz15p-0002XS-3O
 for qemu-devel@nongnu.org; Mon, 11 Jan 2021 12:35:07 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1610386499;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=NRXs135Dj2gROVKRew4rggpRmEhtYcC6N1TenuBOtPs=;
 b=Oku6SQHeOAi+D0FqVX1O6bGfyNWfseqmIFKHPqwDXijzgPK629iJpY/AheCvlTkMjMex2D
 VpbLlOWkg7OLK3G49rpUEvw7Wlq6AXhrAqWtC6TvpW0OpxvkSyMuJa9QXVCzWsKgdPpl3I
 pF0oKzcl5mIGhgK3McOYOzuGmq+iV9I=
Received: from mail-ed1-f69.google.com (mail-ed1-f69.google.com
 [209.85.208.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-268-gtduFcQLPpGow1uLUqhZew-1; Mon, 11 Jan 2021 12:34:57 -0500
X-MC-Unique: gtduFcQLPpGow1uLUqhZew-1
Received: by mail-ed1-f69.google.com with SMTP id u17so8641edi.18
 for <qemu-devel@nongnu.org>; Mon, 11 Jan 2021 09:34:56 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=NRXs135Dj2gROVKRew4rggpRmEhtYcC6N1TenuBOtPs=;
 b=V56rvP5UFJrmNQtDe2DVimjbqzGU3LHAioN0bQYhKfDACpa8PNWTTHKt4KvXnjwBZa
 9CW17tUGSLe9V17CLKD+sXVZpgzn4wfdSusFEO56V+AbwTT3eqjlno4umxdfXpRSEuO7
 7csQJ/d5NBsepIiIaPt/A6s6vXDnLcsfw9Azh0DYlJkmBijXxyE/pNKXHgsu0sWbGEIm
 /2KzGxyzwBNGKtS3QgzqhXjZrs0Iw4Lf3qAtMOfeMeprEuRTf9xg1ACeMBnutDXyJaz7
 HNbcsoJfZU5Ccig/Y/o3155H6Nnusorxyvl8Glr3Uq1K4DMJ/wcff70ujm5WdYze4b+J
 BvYA==
X-Gm-Message-State: AOAM531Viwou/uK/YoXLYaqiZLr2KNZtzzlBv9lMBLdWHzkFve4T8S1Z
 SYhlJwjrTRCcb/kiL9lEw2zjw1KJUiWGCQjzYH0vcI5ql+tkG4iErLpEoVuv5UsS2hCtcOq9XXU
 qAwgvEUk5u0drrRI=
X-Received: by 2002:aa7:dcd0:: with SMTP id w16mr337917edu.229.1610386495652; 
 Mon, 11 Jan 2021 09:34:55 -0800 (PST)
X-Google-Smtp-Source: ABdhPJwaoNuXfQXmNjFY9U3w74cpMr9JEoEE/WVB6vBgeKtNVp4rbemYeMckDUPgIb+4GKtunLLWAA==
X-Received: by 2002:a17:906:298c:: with SMTP id
 x12mr406976eje.244.1610386494717; 
 Mon, 11 Jan 2021 09:34:54 -0800 (PST)
Received: from ?IPv6:2001:b07:6468:f312:c8dd:75d4:99ab:290a?
 ([2001:b07:6468:f312:c8dd:75d4:99ab:290a])
 by smtp.gmail.com with ESMTPSA id ci20sm123876ejc.26.2021.01.11.09.34.53
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 11 Jan 2021 09:34:53 -0800 (PST)
Subject: Re: [PATCH] configure: Add flags for MinGW32 standalone build
To: Joshua Watt <jpewhacker@gmail.com>
References: <20210107213856.34170-1-JPEWhacker@gmail.com>
 <8ea87ea1-093d-81b0-13d6-60caa9fcdad4@redhat.com>
 <0e956e41-4862-f979-3247-40d03c5054e4@gmail.com>
 <e2885e2e-cf8a-51f7-6dd8-a28ac4871eef@redhat.com>
 <a0cbc0c3-7c5b-ed81-8cfa-2129dda6a268@weilnetz.de>
 <b7585238-25c7-d25f-dae1-d682dc084284@redhat.com>
 <CAJdd5GZX=Kv04Vdm84WYAU9404wP_B5DDMb6E8DSX8aTv9PjmQ@mail.gmail.com>
From: Paolo Bonzini <pbonzini@redhat.com>
Message-ID: <823d4f79-2b94-1fdc-e0ba-4244bded8d14@redhat.com>
Date: Mon, 11 Jan 2021 18:34:52 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.5.0
MIME-Version: 1.0
In-Reply-To: <CAJdd5GZX=Kv04Vdm84WYAU9404wP_B5DDMb6E8DSX8aTv9PjmQ@mail.gmail.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=pbonzini@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=63.128.21.124; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.251,
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
Cc: Stefan Weil <sw@weilnetz.de>, Thomas Huth <thuth@redhat.com>,
 qemu-devel@nongnu.org, Yonggang Luo <luoyonggang@gmail.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 11/01/21 17:01, Joshua Watt wrote:
>> I agree, it was an issue before 5.2 but now we have relocatable
>> installations.  So it would be better to remove all the special casing
>> of mingw, except that (for backwards compatibility) on mingw bindir
>> defaults to $prefix instead of $prefix/bin.  Then Joshua's usecase is
>> covered simply by --bindir=/mingw/bin.
> Right. Removing the special case for MinGW would solve my problem and
> be fine with me; the thing I don't know is if we need to preserve the
> backward compatibility of forcing a specific "flat" layout in $prefix
> when building for MinGW. There are basically 2 options I can see:
>   1) Add a flag to default MinGW to the "flat" layout, but allow it to
> be overridden so that it can follow a normal layout (e.g. --bindir,
> etc. are respected). This what my patch adds
>   2) Remove the special casing for MinGW entirely. A "flat" layout
> would still be possible by doing e.g. "--bindir=$prefix
> --datadir=$prefix ..." manually but it would no longer be the default.
> 
> I'm fine with either option, but I'm not familiar enough with the
> project to be able to know which is better.

I think it's okay if you remove the special case _almost_ entirely. 
That is, MinGW would still default to --bindir=$prefix (and that would 
be the only "flattened" directory), but it would be possible to override 
it for your use case.

Paolo


