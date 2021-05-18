Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 32D1538758B
	for <lists+qemu-devel@lfdr.de>; Tue, 18 May 2021 11:49:23 +0200 (CEST)
Received: from localhost ([::1]:36934 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1liwLq-0003Gd-7C
	for lists+qemu-devel@lfdr.de; Tue, 18 May 2021 05:49:22 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59514)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1livxC-0002RU-R1
 for qemu-devel@nongnu.org; Tue, 18 May 2021 05:23:54 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:20501)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1livx9-0005bu-Dg
 for qemu-devel@nongnu.org; Tue, 18 May 2021 05:23:54 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1621329830;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=d93SRaJmCR72Gdszt6gP9tFOhSSRtC9jajCWQCOvQdw=;
 b=IrdBgl8GF12gD86m7iAELFuAuBhfskGbNhoIm/B5WtaCdbDz86UN1T1BLF5JY+oIzeo5ui
 +Dn+zZ/XIZT2WTiUEhDa9BDnQU+kgopK6exntGI0CU319fV8LmnuCJl+jlCl1teVQtIlSC
 LIXuRGhTEyZRZpmfoGC9tepWBlCglrk=
Received: from mail-ej1-f69.google.com (mail-ej1-f69.google.com
 [209.85.218.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-464-BzWus4jMMXmZPZ0KZEqyNA-1; Tue, 18 May 2021 05:23:48 -0400
X-MC-Unique: BzWus4jMMXmZPZ0KZEqyNA-1
Received: by mail-ej1-f69.google.com with SMTP id
 z1-20020a1709068141b02903cd421d7803so2123313ejw.22
 for <qemu-devel@nongnu.org>; Tue, 18 May 2021 02:23:48 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=d93SRaJmCR72Gdszt6gP9tFOhSSRtC9jajCWQCOvQdw=;
 b=DCCLaW5sg1aOKJ/7vvA29nf9oSXz7RLjy8j6strXjOMHgypUr4MZ2QAg4Tl3J9T9co
 HCq8qgvXU2Izq/tJrKGNuDydiP1NpUHOoyR9JCDC4re+B5m2IlQtX4976UBtYOFDJ8i3
 dzPI3jWn6mR22caAkRYCyFum8grcfPdTezDyuhkfMKWQVsBeWsH8XdVh8hCf9Jn4or5F
 r1YxwA9wkyV/FGFjpRhNnsoydFulOrAFwFctM298R3WVJEKVxBjR+xmhFIymyQzhJSeK
 q3dku+YyUT9pDEtr5Z0gs6LLeWRvzkpIj4/d2c4k0E/qRJnKxLBG89l/wZxjzTnqwEvG
 Nmqg==
X-Gm-Message-State: AOAM5316MzNBzOrYazKJAU01zSEo36CX8F9huD509gfA4lBE7qSUgO+/
 UbprZUhiXJfzQSyoCPvlPjr3BeNRqrGfG0XNH25HDjqa6huiVCXuW94dxSakV922Q5sSS//TDhg
 Lc83fH8ulN6WzcfM=
X-Received: by 2002:a17:907:9208:: with SMTP id
 ka8mr5003048ejb.71.1621329827815; 
 Tue, 18 May 2021 02:23:47 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxpTlL+iwR6Cka1sloNT9mBalaJy1HkRSD5Viw6rPgvgipv8TtGlksO8cNsOA2qW2q7+HCE8Q==
X-Received: by 2002:a17:907:9208:: with SMTP id
 ka8mr5003034ejb.71.1621329827696; 
 Tue, 18 May 2021 02:23:47 -0700 (PDT)
Received: from ?IPv6:2001:b07:6468:f312:c8dd:75d4:99ab:290a?
 ([2001:b07:6468:f312:c8dd:75d4:99ab:290a])
 by smtp.gmail.com with ESMTPSA id n12sm12644641edw.95.2021.05.18.02.23.46
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 18 May 2021 02:23:47 -0700 (PDT)
Subject: Re: [PATCH v2 14/50] target/i386: Assert !ADDSEG for x86_64 user-only
To: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org
References: <20210514151342.384376-1-richard.henderson@linaro.org>
 <20210514151342.384376-15-richard.henderson@linaro.org>
From: Paolo Bonzini <pbonzini@redhat.com>
Message-ID: <6f3a310d-68e1-33ed-038f-a2ca2cbc86e2@redhat.com>
Date: Tue, 18 May 2021 11:23:46 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <20210514151342.384376-15-richard.henderson@linaro.org>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=pbonzini@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
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
Cc: cfontana@suse.de, f4bug@amsat.org, ehabkost@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 14/05/21 17:13, Richard Henderson wrote:
> LMA disables traditional segmentation, exposing a flat address space.
> This means that ADDSEG is off.
> 
> Since we're adding an accessor macro, pull the value directly out
> of flags otherwise.
> 
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>   target/i386/tcg/translate.c | 11 ++++++-----
>   1 file changed, 6 insertions(+), 5 deletions(-)

Reviewed-by: Paolo Bonzini <pbonzini@redhat.com>


