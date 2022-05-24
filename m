Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id F316F532793
	for <lists+qemu-devel@lfdr.de>; Tue, 24 May 2022 12:29:34 +0200 (CEST)
Received: from localhost ([::1]:56460 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ntRnB-0005ly-Vw
	for lists+qemu-devel@lfdr.de; Tue, 24 May 2022 06:29:34 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53896)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1ntRiN-0004E0-Kz
 for qemu-devel@nongnu.org; Tue, 24 May 2022 06:24:35 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:46427)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1ntRiJ-0005hT-MZ
 for qemu-devel@nongnu.org; Tue, 24 May 2022 06:24:35 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1653387870;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=5cbDvebDcx75dcIDAd5jrYOpt/YZQ72FMoMX2F277a8=;
 b=cdWcOUQmQ1IqwCPRsB/aTKYDdTl7pzUzPQJNaM3jZeyXIBAaJSZ3RI65U/TLO1fbJvAuxB
 44fjPOywhQuEKP5E+oOHezfyoV2qqT39NHxy+j7jMaco/uPrZV4oTKcrsfNIYw6rrBfhs5
 Q6Qjc5XTJR5DK38L/aGvjdj0+dRIxWM=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-189-ptQ3rPfYOmytd9BX4dwVCg-1; Tue, 24 May 2022 06:24:29 -0400
X-MC-Unique: ptQ3rPfYOmytd9BX4dwVCg-1
Received: by mail-wr1-f69.google.com with SMTP id
 z5-20020a5d4d05000000b0020e6457f2b4so4211997wrt.1
 for <qemu-devel@nongnu.org>; Tue, 24 May 2022 03:24:28 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=5cbDvebDcx75dcIDAd5jrYOpt/YZQ72FMoMX2F277a8=;
 b=vFtlIJuDKuD1fqgXgHcxk/qBsstJKxD2WRQkR7gEtYqidjQnQjMoap7f3SoVnayDaJ
 dZDW6wE8Jpa4x1o3MlrUW9NI9y/vtiC3slmK/yhocwZ1pXKT0FeIsGnTYmDq/iv+Vzis
 KIV7gJ0eRuiztZgk2dSXMCLHqysgt11FL8zeKJchWM7vBXy+06EDMUTww5e2TTMOeZEL
 Zzd0PpIQl76GaJGZyxO703NjQVmZ8MdfJaSipwHekGpcqq5mivM2Ld1VYxZ4/Je3KnQC
 m4cA2eu7o6pdO/yePH1UdAYvcQ+5CLGhNz+PUn+wPhZRriTd7LC31xEgJ6V4GqD3TL/Y
 whJg==
X-Gm-Message-State: AOAM5330JD9oC/EhYHEt85ua6LlZywg7hDqKo39Is90cXEnGKOeAjvzA
 b6W2b8IRTUXvb1CCdjtMDGPXA1dVryhm92a8K9AYNesS7f1ooDC9oCZLX0wF5qZArDZZ/VKqhCf
 cYZM+RALnAlfelrA=
X-Received: by 2002:a05:600c:2351:b0:397:3259:1600 with SMTP id
 17-20020a05600c235100b0039732591600mr3062388wmq.87.1653387868027; 
 Tue, 24 May 2022 03:24:28 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyzf6CAuOcgcFCdMa3LDMyZOny5Dw1SzdLPQhSlmu/Lz/r5EJ01waPX4e99QwGLoN+xvazJDA==
X-Received: by 2002:a05:600c:2351:b0:397:3259:1600 with SMTP id
 17-20020a05600c235100b0039732591600mr3062371wmq.87.1653387867789; 
 Tue, 24 May 2022 03:24:27 -0700 (PDT)
Received: from [10.33.192.183] (nat-pool-str-t.redhat.com. [149.14.88.106])
 by smtp.gmail.com with ESMTPSA id
 m185-20020a1ca3c2000000b003942a244ee7sm1658713wme.44.2022.05.24.03.24.26
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 24 May 2022 03:24:27 -0700 (PDT)
Message-ID: <f4f5afc8-0b01-e134-bb83-b3d0ded0439a@redhat.com>
Date: Tue, 24 May 2022 12:24:26 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.0
Subject: Re: [PULL 2/3] qga-win32: Add support for NVME but type
Content-Language: en-US
To: =?UTF-8?Q?Marc-Andr=c3=a9_Lureau?= <marcandre.lureau@redhat.com>,
 Konstantin Kostiuk <kkostiuk@redhat.com>, Stefan Weil <sw@weilnetz.de>
Cc: Richard Henderson <richard.henderson@linaro.org>,
 QEMU <qemu-devel@nongnu.org>, Peter Maydell <peter.maydell@linaro.org>
References: <20220523194111.827805-1-kkostiuk@redhat.com>
 <20220523194111.827805-3-kkostiuk@redhat.com>
 <541f46cf-fc45-f7bb-e121-2aad216e11d5@linaro.org>
 <CAPMcbCq7fzubG4ej7p164vwQkCMChjWBubx27R=kVxukWDhuBg@mail.gmail.com>
 <CAPMcbCqeQ_7YuJg+eS9Qqtq9ptRb57_wfT=jGOuHYtx64M5azA@mail.gmail.com>
 <CAMxuvawvaZBp0sxV-jwQuDwxahuFjN10BDcBcgOn88XpN87RPA@mail.gmail.com>
From: Thomas Huth <thuth@redhat.com>
In-Reply-To: <CAMxuvawvaZBp0sxV-jwQuDwxahuFjN10BDcBcgOn88XpN87RPA@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 24/05/2022 12.14, Marc-André Lureau wrote:
> Hi
> 
> On Tue, May 24, 2022 at 12:02 PM Konstantin Kostiuk <kkostiuk@redhat.com> wrote:
>>
>> Hi Richard and Marc-André
>>
>> I looked into the compilation problem and have 2 solutions:
>> 1. We can add some conditions to the win2qemu definition and
>> skip NVME support when old mingw-headers are used.
>> 2. We can bump the version of the Fedora docker image to 36 or 37
>> that is used for cross-compilation tests.
>>
>> I think the second option is more valuable because we remove
>> pregenerated qga-vss.tlb file and now we can check VSS build only
>> at Fedora 37.
>>
>> What do you think?
> 
> I'd try to do both: fix compilation with older headers, and bump our
> CI to f36. I don't know if our windows build environment has strict
> requirements like the unix/distro (build on old-stable for 2y).

See https://www.qemu.org/docs/master/about/build-platforms.html#windows :

"The project supports building QEMU with current versions of the MinGW 
toolchain, either hosted on Linux (Debian/Fedora) or via MSYS2 on Windows."

Since Fedora 35 is still a supported build host, I think you should make 
sure that it works with the MinGW toolchain from that distro, too.

  Thomas


