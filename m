Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 69A8B5B3D0B
	for <lists+qemu-devel@lfdr.de>; Fri,  9 Sep 2022 18:33:37 +0200 (CEST)
Received: from localhost ([::1]:44498 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oWgwi-00084J-IT
	for lists+qemu-devel@lfdr.de; Fri, 09 Sep 2022 12:33:36 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37388)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1oWgti-0006BX-5k
 for qemu-devel@nongnu.org; Fri, 09 Sep 2022 12:30:30 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:34256)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1oWgtd-0006XP-A6
 for qemu-devel@nongnu.org; Fri, 09 Sep 2022 12:30:29 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1662741019;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=V2R40/+qeRzXpaYTkkUizGtAxrKQohgNlEgo28vSsuw=;
 b=CeKgEl1+ykQlswYDdC12SMHN6axaWgwFk1ndRV97tF5Ax52EFsnaVXaaaCtIWN1yUvm8qe
 Ag1UeJ3XrVLQoMropoJDdd9S2U4rN1gOuNKDsxA+WuQQ8hnhTpcu2ep3gHyecMlgBZgJki
 lLTZ2DDP4Yim/llvM9oLrwpZRBokNd8=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-391-5sj_5zWEMLGREMm7YWq8Pw-1; Fri, 09 Sep 2022 12:30:18 -0400
X-MC-Unique: 5sj_5zWEMLGREMm7YWq8Pw-1
Received: by mail-wr1-f72.google.com with SMTP id
 i29-20020adfa51d000000b00228fa8325c0so484642wrb.15
 for <qemu-devel@nongnu.org>; Fri, 09 Sep 2022 09:30:18 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date;
 bh=V2R40/+qeRzXpaYTkkUizGtAxrKQohgNlEgo28vSsuw=;
 b=sgJgNxC4fIOE7rCmlPDv17088K5tQT85l9hd6hEtsOxZ3qz/wAHunVdO68HI4Nvzfh
 nvJvOTBPOEvREjOYmh8hEDFOmQMn4Qyie0Sbfn77lmTi0cAM7wCKddK8q3OQ1eu1h9sv
 VKDfMFCF6cMXVkRa+OzSuyzAxZ6974U0cf9s2VUw1+O3JltRi4JoX7AcxYuhDLT/lVvC
 5/StrnXkD96O49v8lFtQhPQ2X+X3RFvej0RdD9WgkSnb+8nlVEOzj63dKN2L5ylGuQ51
 Q+4zQkt7ahEeKIFjjTXk+Foc0Nqg8OXda8Jp8rAl+e+oUXMSk7/uLSC0TzCfNfMNeO8f
 ZeFQ==
X-Gm-Message-State: ACgBeo3Jfam5WtVjAGo0ahof49MEP/BStkMt6uLs27R52dClYab1hwzt
 1YT0XqGTILo7TRo5qxScKrfh9vH0RBHYnwlYvKBfc5cnjUwhRQao+xb20xtTxmdO0w13NBM377B
 +cTbMxWGnjvYE4oU=
X-Received: by 2002:a5d:4204:0:b0:22a:2e4b:2b1d with SMTP id
 n4-20020a5d4204000000b0022a2e4b2b1dmr5239339wrq.186.1662741016044; 
 Fri, 09 Sep 2022 09:30:16 -0700 (PDT)
X-Google-Smtp-Source: AA6agR76ww2+cAHxo+G7ldweXnZGzZS3rJgBWqjB1LRmRqCcFQe8AaWvEMkIWrNWrVYSsB1P2jpTvA==
X-Received: by 2002:a5d:4204:0:b0:22a:2e4b:2b1d with SMTP id
 n4-20020a5d4204000000b0022a2e4b2b1dmr5239318wrq.186.1662741015843; 
 Fri, 09 Sep 2022 09:30:15 -0700 (PDT)
Received: from [192.168.0.121]
 (cpc76434-belc8-2-0-cust705.2-1.cable.virginm.net. [81.109.50.194])
 by smtp.gmail.com with ESMTPSA id
 z11-20020a7bc7cb000000b003b3401f1e24sm1013613wmk.28.2022.09.09.09.30.14
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 09 Sep 2022 09:30:15 -0700 (PDT)
Message-ID: <087e64b2-fe9d-991e-c0fe-d00c9f114c20@redhat.com>
Date: Fri, 9 Sep 2022 18:30:13 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.12.0
Subject: Re: [PATCH 4/7] .gitlab-ci.d/windows.yml: Drop the sed processing in
 the 64-bit build
Content-Language: en-US
To: =?UTF-8?Q?Marc-Andr=c3=a9_Lureau?= <marcandre.lureau@gmail.com>,
 Bin Meng <bmeng.cn@gmail.com>
Cc: qemu-devel@nongnu.org, Bin Meng <bin.meng@windriver.com>,
 =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 Beraldo Leal <bleal@redhat.com>, =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?=
 <f4bug@amsat.org>, Wainer dos Santos Moschetta <wainersm@redhat.com>
References: <20220908132817.1831008-1-bmeng.cn@gmail.com>
 <20220908132817.1831008-5-bmeng.cn@gmail.com>
 <CAJ+F1C+h=dryHrx_pE8bn-tkZz2JuY+AVb74pXnuMogCawndxQ@mail.gmail.com>
From: Thomas Huth <thuth@redhat.com>
In-Reply-To: <CAJ+F1C+h=dryHrx_pE8bn-tkZz2JuY+AVb74pXnuMogCawndxQ@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -48
X-Spam_score: -4.9
X-Spam_bar: ----
X-Spam_report: (-4.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-2.079, RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001,
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

On 08/09/2022 16.04, Marc-André Lureau wrote:
> Hi
> 
> On Thu, Sep 8, 2022 at 5:33 PM Bin Meng <bmeng.cn@gmail.com 
> <mailto:bmeng.cn@gmail.com>> wrote:
> 
>     From: Bin Meng <bin.meng@windriver.com <mailto:bin.meng@windriver.com>>
> 
>     The sed processing of build/config-host.mak seems to be no longer
>     needed, and there is no such in the 32-bit build too. Drop it.
> 
>     Signed-off-by: Bin Meng <bin.meng@windriver.com
>     <mailto:bin.meng@windriver.com>>
>     ---
> 
>       .gitlab-ci.d/windows.yml | 1 -
>       1 file changed, 1 deletion(-)
> 
>     diff --git a/.gitlab-ci.d/windows.yml b/.gitlab-ci.d/windows.yml
>     index da6013904a..86a4339c48 100644
>     --- a/.gitlab-ci.d/windows.yml
>     +++ b/.gitlab-ci.d/windows.yml
>     @@ -60,7 +60,6 @@ msys2-64bit:
>         - $env:MSYS = 'winsymlinks:native' # Enable native Windows symlink
>         - .\msys64\usr\bin\bash -lc './configure --target-list=x86_64-softmmu
>             --enable-capstone --without-default-devices'
>     -  - .\msys64\usr\bin\bash -lc "sed -i '/^ROMS=/d' build/config-host.mak"
> 
> 
> It looks like it is there to remove the ROMS from the make build. No idea if 
> that still makes sense. Thomas, do you remember?

I originally had to add this sed statement since there was a compile error 
otherwise in the ROMS ... if it now works fine without this line, this 
should be fine, of course, too.

Reviewed-by: Thomas Huth <thuth@redhat.com>


