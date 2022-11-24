Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D3D776377FC
	for <lists+qemu-devel@lfdr.de>; Thu, 24 Nov 2022 12:50:57 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1oyAjM-0002sT-QO; Thu, 24 Nov 2022 06:49:24 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1oyAjK-0002s9-8o
 for qemu-devel@nongnu.org; Thu, 24 Nov 2022 06:49:22 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1oyAjI-0004KX-El
 for qemu-devel@nongnu.org; Thu, 24 Nov 2022 06:49:22 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1669290559;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=iwlFmTfacguqIBtTkPyOW9ZmhPxAifdLxrsr2LRF83g=;
 b=ceiC0/VK4v9MMworu+4kSFsVaSujBxAVXw/chHigFleLkfsMvfVbqBXceIYyULg8tKlFwO
 PFiCGwvxorOLXhZFdB+5GCzR2H89hKM7OJmbNACdvXaqdoSrj4y+PYHhC9BPNsbuRFjXar
 OweYUIFONH6h+8xecn6BKiJV72W9X6w=
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-435-3aWhhhF3MlWLnB3PaSVMEw-1; Thu, 24 Nov 2022 06:49:17 -0500
X-MC-Unique: 3aWhhhF3MlWLnB3PaSVMEw-1
Received: by mail-wr1-f71.google.com with SMTP id
 i24-20020adfa518000000b00241e2f40d8bso343553wrb.14
 for <qemu-devel@nongnu.org>; Thu, 24 Nov 2022 03:49:17 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=iwlFmTfacguqIBtTkPyOW9ZmhPxAifdLxrsr2LRF83g=;
 b=oy1H870bVy8gF/oDzlD1FOxvwYRAfEdLq8Q6BkK18VURtHz8O9jbFEEl6Im1ORnqbf
 td6Dx6WyylFT1RNgI2JTpEHP5lGlf5EdF6bHshcerMMuJsMyD/qgzntctrNEDAvsEfxu
 fQ1EoOb9ogv2L3MrR+0Fo2Tqh7mJTf4hBeP6wS4o5Nj0CFXPYqA1dQiQaHYyxcvkM1yv
 rpjI5tI1lye79osX84pjco0dpOmb53jByF9JfEaVC4lstwd6/fdSdhxRcIQk7J/XPG5p
 om08hXO60uurMnIjoWA9xQ4AnsMK/zHko8RBZSWu+5eZZeNdJfxAa1Kd6BDmn/6v2jwL
 uKQQ==
X-Gm-Message-State: ANoB5pmx05uerHTZ3V5Jn+EVmIvAllJx0rLmY1JBuUyUwAuALgQY9csz
 DX4Ws8hc4YuoRIDaE3JfcM9xxPBWX75MqhN7lEBxhexsA4c0jGDloBG2trlTMnSZp59a91my8aL
 wdokPgec10pDtO7c=
X-Received: by 2002:a05:600c:688:b0:3cf:a18d:39a4 with SMTP id
 a8-20020a05600c068800b003cfa18d39a4mr22726828wmn.125.1669290556613; 
 Thu, 24 Nov 2022 03:49:16 -0800 (PST)
X-Google-Smtp-Source: AA0mqf4ddh4uzpCM1zO71gyVQNURY/L/vGzN9DQW6G47vxsYq1LZzV8u2tnlbVjeiUm1XI6Jy5YW/g==
X-Received: by 2002:a05:600c:688:b0:3cf:a18d:39a4 with SMTP id
 a8-20020a05600c068800b003cfa18d39a4mr22726805wmn.125.1669290556325; 
 Thu, 24 Nov 2022 03:49:16 -0800 (PST)
Received: from [192.168.0.5] (ip-109-43-177-190.web.vodafone.de.
 [109.43.177.190]) by smtp.gmail.com with ESMTPSA id
 m66-20020a1c2645000000b003cf9bf5208esm5282015wmm.19.2022.11.24.03.49.15
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 24 Nov 2022 03:49:15 -0800 (PST)
Message-ID: <70b3b160-83fe-22f3-bdb8-243d50f1b2ff@redhat.com>
Date: Thu, 24 Nov 2022 12:49:14 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.13.0
Subject: Re: [PATCH v6 11/11] tests/qtest: Enable qtest build on Windows
Content-Language: en-US
To: =?UTF-8?Q?Marc-Andr=c3=a9_Lureau?= <marcandre.lureau@gmail.com>
Cc: Bin Meng <bin.meng@windriver.com>, qemu-devel@nongnu.org,
 Laurent Vivier <lvivier@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>
References: <20221028045736.679903-1-bin.meng@windriver.com>
 <20221028045736.679903-12-bin.meng@windriver.com>
 <CAJ+F1CJnW-95ZpfBBKFX=O_XsFOZ+quTU4dYmK8Cr8B-Ww_Hqw@mail.gmail.com>
 <3e3178f9-73a7-031a-6cd0-4a315989b567@redhat.com>
 <CAJ+F1CLvBgX1_t9QhZ6wnJbdE071CFdsuWtWHxSOTDqCsMRxEg@mail.gmail.com>
From: Thomas Huth <thuth@redhat.com>
In-Reply-To: <CAJ+F1CLvBgX1_t9QhZ6wnJbdE071CFdsuWtWHxSOTDqCsMRxEg@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001,
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

On 24/11/2022 12.17, Marc-André Lureau wrote:
> Hi Thomas
> 
> On Wed, Nov 23, 2022 at 6:19 PM Thomas Huth <thuth@redhat.com> wrote:
>>
>> On 23/11/2022 15.13, Marc-André Lureau wrote:
>>> Hi Bin
>>>
>>> On Fri, Oct 28, 2022 at 9:06 AM Bin Meng <bin.meng@windriver.com> wrote:
>>>>
>>>> Now that we have fixed various test case issues as seen when running
>>>> on Windows, let's enable the qtest build on Windows.
>>>>
>>>> Signed-off-by: Bin Meng <bin.meng@windriver.com>
>>>> Reviewed-by: Thomas Huth <thuth@redhat.com>
>>>
>>> We haven't solved the CI timing out or eating all the CPU time, right?
>>>
>>> Can we simply exclude it from CI for now, ie add to this patch
>>>
>>> diff --git a/.gitlab-ci.d/windows.yml b/.gitlab-ci.d/windows.yml
>>> index 093276ddbc..ba9045ec38 100644
>>> --- a/.gitlab-ci.d/windows.yml
>>> +++ b/.gitlab-ci.d/windows.yml
>>> @@ -62,7 +62,7 @@ msys2-64bit:
>>>      - .\msys64\usr\bin\bash -lc './configure --target-list=x86_64-softmmu
>>>          --enable-capstone'
>>>      - .\msys64\usr\bin\bash -lc 'make'
>>> -  - .\msys64\usr\bin\bash -lc 'make check || { cat
>>> build/meson-logs/testlog.txt; exit 1; } ;'
>>> +  - .\msys64\usr\bin\bash -lc 'make check MTESTARGS="--no-suite
>>> qtest" || { cat build/meson-logs/testlog.txt; exit 1; } ;'
>>>
>>>    msys2-32bit:
>>>      extends: .shared_msys2_builder
>>> @@ -96,4 +96,4 @@ msys2-32bit:
>>>      - cd output
>>>      - ..\msys64\usr\bin\bash -lc "../configure --target-list=ppc64-softmmu"
>>>      - ..\msys64\usr\bin\bash -lc 'make'
>>> -  - ..\msys64\usr\bin\bash -lc 'make check || { cat
>>> meson-logs/testlog.txt; exit 1; } ;'
>>> +  - ..\msys64\usr\bin\bash -lc 'make check MTESTARGS="--no-suite
>>> qtest" || { cat meson-logs/testlog.txt; exit 1; } ;'
>>
>> I think it's only the 64-bit job that is really problematic, so we could
>> still run the qtests in the 32-bit job?
>>
>> Alternatively, what about switching the 64-bit to another target that does
>> not have so many qtests enabled? Some mips-softmmu or riscv-softmmu maybe?
>> ... we still check x86_64-softmmu in the .cirrus.yml builds, so this is
>> hopefully not such a big loss...
>>
> 
> The change I propose above is to simply skip the qtests on msys CI
> builds. They are not running today on !POSIX.

Sure ... question is what would be more valuable in the gitlab-CI ... only 
compile-testing x86_64-softmmu on msys2 (since that also compile-tests the 
HAX and WHPX stuff), but without qtests, or also run a (limited) set of 
qtests with another smaller softmmu target?
I don't mind either way, I just wanted to suggest an alternative to consider.

  Thomas


