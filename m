Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 42DD3674F87
	for <lists+qemu-devel@lfdr.de>; Fri, 20 Jan 2023 09:33:26 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pImof-0001y8-4j; Fri, 20 Jan 2023 03:32:05 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1pImoc-0001xK-Dw
 for qemu-devel@nongnu.org; Fri, 20 Jan 2023 03:32:02 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1pImoa-0006h1-IT
 for qemu-devel@nongnu.org; Fri, 20 Jan 2023 03:32:02 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1674203519;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=3EDXz85azz77O8JRizwJwPZKf4f/SKrq+1aOGPaj+6w=;
 b=KMXDa+bA8XluV/ZeUaYe1W1UJXEiyX9pOHTSMxxBT09G4andnq5Hsu1qUKpmM1RKyz9txQ
 WWO70U2EhaZnDKThKHoPNr8jEtba49ICF6r1oTfKs+p6fU3g5N9WUwI/kijr62ISw3nEkx
 D3PEpKraBwkcTTww8fgjkl4wyxH7BXo=
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com
 [209.85.222.199]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-616-X0JAP0yzMQ-J2U8MuE8bVQ-1; Fri, 20 Jan 2023 03:31:58 -0500
X-MC-Unique: X0JAP0yzMQ-J2U8MuE8bVQ-1
Received: by mail-qk1-f199.google.com with SMTP id
 x12-20020a05620a258c00b007051ae500a2so3005208qko.15
 for <qemu-devel@nongnu.org>; Fri, 20 Jan 2023 00:31:57 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=3EDXz85azz77O8JRizwJwPZKf4f/SKrq+1aOGPaj+6w=;
 b=sZ5niUEUf8M5H9z9CyaZvVgUc2JFSXLLuH4d0HY93Mw8qmJL7txmN4+x83lyh9HgSn
 +Ms56whbrsnK+6XW2WWpyyt6rJyS5zOmR6spi7YFHG/mlipUUDR07kHVaLq4HogRxhtL
 JeMcq3EzvuDqknNuLq4R/g5kZCQPxpM0K/ehfofPsZL2FsjkvxPUJ/pVFDn+YKBDA39D
 wgFQZpeAG10JlzzToAmQx10QD803NE2vyeFU7wBF/3wZGE9OrU6V6R7NDOeTDolbaFpl
 KaGwKNhDa9vvI4zDMREgYDzL2ENaqSrQqXWs+tt7b1CpfqEDmekc39/bUqzQF/c2k9pA
 0qdw==
X-Gm-Message-State: AFqh2kp2Kdh3BEPmEsVBPGs5tt21eE1ygWky/xOOeOcnUuUJhu35iJJN
 LqcqvV77TKniDq9bsTrwW3tXCqKpQjI6rUdn1ZP58xibtWG8f6dvIYkZJgdBGWtXn/uj0t5Dnf4
 iCfsA80Y1kLMljSc=
X-Received: by 2002:ac8:669a:0:b0:3ac:dccd:487a with SMTP id
 d26-20020ac8669a000000b003acdccd487amr15616357qtp.53.1674203517539; 
 Fri, 20 Jan 2023 00:31:57 -0800 (PST)
X-Google-Smtp-Source: AMrXdXssblKtzkKbLwh3maOUFiauPFnSrRd/R0zthFhfkwUnL4i56DJ4RdZbNCEH4TesWAZ0CRKVTA==
X-Received: by 2002:ac8:669a:0:b0:3ac:dccd:487a with SMTP id
 d26-20020ac8669a000000b003acdccd487amr15616346qtp.53.1674203517267; 
 Fri, 20 Jan 2023 00:31:57 -0800 (PST)
Received: from [192.168.0.2] (ip-109-43-177-118.web.vodafone.de.
 [109.43.177.118]) by smtp.gmail.com with ESMTPSA id
 y2-20020a05620a44c200b006e42a8e9f9bsm11970127qkp.121.2023.01.20.00.31.55
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 20 Jan 2023 00:31:56 -0800 (PST)
Message-ID: <839268cb-b65c-68d6-1294-47548ed383b1@redhat.com>
Date: Fri, 20 Jan 2023 09:31:54 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.13.0
Subject: Re: MSYS2 and libfdt
Content-Language: en-US
To: =?UTF-8?Q?Marc-Andr=c3=a9_Lureau?= <marcandre.lureau@gmail.com>
Cc: Bin Meng <bin.meng@windriver.com>, Stefan Weil <sw@weilnetz.de>,
 QEMU Developers <qemu-devel@nongnu.org>
References: <c2246b1a-51b3-2843-5164-c424c571874f@redhat.com>
 <CAJ+F1C+EC-tgDOyX5e56utKdUz-DXMMtwrtVyKXT2Jj4r43OCA@mail.gmail.com>
From: Thomas Huth <thuth@redhat.com>
In-Reply-To: <CAJ+F1C+EC-tgDOyX5e56utKdUz-DXMMtwrtVyKXT2Jj4r43OCA@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: 11
X-Spam_score: 1.1
X-Spam_bar: +
X-Spam_report: (1.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.094, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001,
 RCVD_IN_SBL_CSS=3.335, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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

On 19/01/2023 09.56, Marc-André Lureau wrote:
> Hi
> 
> On Thu, Jan 19, 2023 at 12:31 PM Thomas Huth <thuth@redhat.com> wrote:
>>
>>
>>    Hi all,
>>
>> in some spare minutes, I started playing with a patch to try to remove the
>> dtc submodule from the QEMU git repository - according to
>> https://repology.org/project/dtc/versions our supported build platforms
>> should now all provide the minimum required version.
>>
>> However, I'm hitting a problem with Windows / MSYS2 in the CI jobs: The
>> libfdt is packaged as part of the dtc package there:
>>
>>    https://packages.msys2.org/package/dtc
>>
>> ... meaning that it is added with a usr/include and usr/lib path prefix
>> instead of mingw64/include and mingw64/lib like other packages are using
>> (see e.g.
>> https://packages.msys2.org/package/mingw-w64-x86_64-zlib?repo=mingw64). Thus
>> the compiler does not find the library there. Also there does not seem to be
>> a difference between a i686 (32-bit) and x86_64 (64-bit) variant available
>> here? Does anybody know how libfdt is supposed to be used with MSYS2 ?
> 
> The msys environment is a bit special, it's not an environment for a
> particular build target, my understanding is that it holds common
> files/tools.
> 
> dtc should be added to https://github.com/msys2/MINGW-packages for it
> to be available as a target dependency.

Do you have already any experience in requesting a new package there? Could 
you maybe do it? ... since I don't have a proper MinGW installation here, it 
would be very cumbersome for me right now.

  Thomas


