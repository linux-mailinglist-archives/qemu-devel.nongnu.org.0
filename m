Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DB1AA6A95FB
	for <lists+qemu-devel@lfdr.de>; Fri,  3 Mar 2023 12:23:24 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pY3UU-0001Nj-Lp; Fri, 03 Mar 2023 06:22:22 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1pY3US-0001N5-CT
 for qemu-devel@nongnu.org; Fri, 03 Mar 2023 06:22:20 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1pY3UQ-00031y-NY
 for qemu-devel@nongnu.org; Fri, 03 Mar 2023 06:22:20 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1677842536;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=n8X5aQaOrBWXpjTROsAMx9ppByyxH1Rsy+EUt4R2/2I=;
 b=KaOyuFRJxe3Dd8G/VxaLdMwGZq2XvodNFCXkkPvdcdJl5/t0+MVImb5CF3ffNARSuVqgwT
 9Bx/wedUb8FJaYTsdejgVBUOpGnN0nYV9weMwjfGb3GxbTjNWJmIkxB+p5PIZKVlZdlsAS
 ZluOAVINW+WIZLhQH/dm9+o5LvLtvkk=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-119-0YdCC90KOhCsZBwLMdrrBw-1; Fri, 03 Mar 2023 06:22:15 -0500
X-MC-Unique: 0YdCC90KOhCsZBwLMdrrBw-1
Received: by mail-wm1-f72.google.com with SMTP id
 s18-20020a7bc392000000b003deaf780ab6so861277wmj.4
 for <qemu-devel@nongnu.org>; Fri, 03 Mar 2023 03:22:15 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:subject:from:references:cc:to
 :content-language:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=n8X5aQaOrBWXpjTROsAMx9ppByyxH1Rsy+EUt4R2/2I=;
 b=maqQ7s1tY8NB8AYF6yELiujissxAa5uQFZfsTkCHVwVF02YHpE1dSXLakN7TFfsdCX
 hVxhykSZWMdqKoAhreq6kR2LtymV3XfxHt4yUhaeLGaYNnPdXIAvbVKN5fxvbgY4Gduu
 BSaDdskI4+HjLenLR3PfnuXDluBe526tCFYM8JScw7mRc2Htff9nI+apypxr3pwz2eQx
 Zvf5h/8iVsA90hYx+SeE01G3CF6RLnEfam4/eb239AQSzk4XrcSNpRhHv8g1PDcPE3Pu
 4DnpOpYJcOiBj/kVUtE3CKFB3Sw/q5LOq8UdZTdUEHGvrXlzZEz531X/BxgsFi4e5dJw
 85ZA==
X-Gm-Message-State: AO0yUKXEitkq6kh+K+NaCS4cpOgRdyEuabjmgT1P9b+GeesMoCcP+1mH
 LDP/dg0lGPXbpBYURZLs2sO19MyzdE8qBAhPMrBI2EZUNL0HX5NGshemxka6oHkHjIPRt813mz0
 7qqaStDKcLmfB65E=
X-Received: by 2002:a05:600c:3b07:b0:3ea:ea3e:2d36 with SMTP id
 m7-20020a05600c3b0700b003eaea3e2d36mr1407144wms.24.1677842534866; 
 Fri, 03 Mar 2023 03:22:14 -0800 (PST)
X-Google-Smtp-Source: AK7set+p9TRknJ6t4P9vbYDLGtFgS5SVfo80ej4ymN+unp2O1GWX68jl53tV7gROH1puWQh03kA6fA==
X-Received: by 2002:a05:600c:3b07:b0:3ea:ea3e:2d36 with SMTP id
 m7-20020a05600c3b0700b003eaea3e2d36mr1407120wms.24.1677842534612; 
 Fri, 03 Mar 2023 03:22:14 -0800 (PST)
Received: from [192.168.0.2] (ip-109-43-176-203.web.vodafone.de.
 [109.43.176.203]) by smtp.gmail.com with ESMTPSA id
 p16-20020a05600c359000b003e209b45f6bsm6595277wmq.29.2023.03.03.03.22.13
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 03 Mar 2023 03:22:14 -0800 (PST)
Message-ID: <2c7f837f-c156-8525-005f-f47d50591a85@redhat.com>
Date: Fri, 3 Mar 2023 12:22:12 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.13.0
Content-Language: en-US
To: John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>,
 qemu-devel@nongnu.org, Peter Maydell <peter.maydell@linaro.org>,
 Daniel Berrange <berrange@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>
Cc: Markus Armbruster <armbru@redhat.com>,
 =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>, qemu-arm@nongnu.org,
 Maxim Levitsky <mlevitsk@redhat.com>, libvir-list@redhat.com,
 Richard Henderson <richard.henderson@linaro.org>,
 xen-devel@lists.xenproject.org, Reinoud Zandijk <reinoud@netbsd.org>,
 Michael Tokarev <mjt@tls.msk.ru>, Helge Deller <deller@gmx.de>,
 Laurent Vivier <lvivier@redhat.com>
References: <20230302163106.465559-1-thuth@redhat.com>
 <4bed38c3-ab4f-cd32-05a4-afa090ad8b9a@linaro.org>
 <6c1f0d05-924e-854e-0175-5e345945e086@redhat.com>
 <89fd1c916b6c8094ea1a7a52396b3f91025c75c1.camel@physik.fu-berlin.de>
From: Thomas Huth <thuth@redhat.com>
Subject: Re: [PATCH v2 0/6] Deprecate support for 32-bit x86 and arm hosts
In-Reply-To: <89fd1c916b6c8094ea1a7a52396b3f91025c75c1.camel@physik.fu-berlin.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.092, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

On 03/03/2023 12.09, John Paul Adrian Glaubitz wrote:
> Hello!
> 
> On Fri, 2023-03-03 at 10:48 +0100, Thomas Huth wrote:
>> x86 ==> deprecate both, user and system emulation support on
>>           32-bit hosts
>> arm ==> deprecate only system emulation on 32-bit hosts.
> 
> I would recommend against dropping support for 32-bit hosts for qemu-user
> as there are some cases where the emulation of 32-bit user code on 64-bit
> hosts does not work properly [1].
> 
> Adrian
> 
>> [1] https://sourceware.org/bugzilla/show_bug.cgi?id=23960

The ticket is very long and hard to read, but ... oh my, does that mean you 
need to compile qemu-user in 32-bit mode on a 64-bit x86 host to properly 
run 32-bit binaries from other architectures? ... uh, that's ugly ... and 
sounds like bug in QEMU's user mode emulation ... and what if you're running 
a distro (or different 64-bit host architecutre) that does not support 
32-bit userspace libraries anymore? Then you're lost?

  Thomas


