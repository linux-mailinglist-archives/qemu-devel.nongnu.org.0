Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1D0EE592AE2
	for <lists+qemu-devel@lfdr.de>; Mon, 15 Aug 2022 10:08:16 +0200 (CEST)
Received: from localhost ([::1]:50556 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oNV8x-0007Py-5Z
	for lists+qemu-devel@lfdr.de; Mon, 15 Aug 2022 04:08:15 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37748)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1oNUp1-0006sf-6L
 for qemu-devel@nongnu.org; Mon, 15 Aug 2022 03:47:41 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:60971)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1oNUox-0003cW-5L
 for qemu-devel@nongnu.org; Mon, 15 Aug 2022 03:47:37 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1660549654;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=J5Lo0t4lOyXHwCzXW/rCLU2cvbkr0Sfl0JnoA6nIOZw=;
 b=UIO9Id7A31Da259mwKUYMmK7EA9cwZkRj//TiCcgwOKAdouvSoEconFc3XkDmTHDm+zY7/
 NniJ94LiyKKqT4uZT9qh8uDulo8Vz7N0fh6I+cOqk9nobUaysWPkYp/GbfcurIfu2HU6SL
 Jcks6xoaOASBgn6lDD5HDNn9FwOapQQ=
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-348-CY-WHj13OWGTlCm5htQIbQ-1; Mon, 15 Aug 2022 03:47:32 -0400
X-MC-Unique: CY-WHj13OWGTlCm5htQIbQ-1
Received: by mail-wr1-f70.google.com with SMTP id
 p9-20020adfba89000000b002238405b027so888092wrg.17
 for <qemu-devel@nongnu.org>; Mon, 15 Aug 2022 00:47:31 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:cc:references:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc;
 bh=J5Lo0t4lOyXHwCzXW/rCLU2cvbkr0Sfl0JnoA6nIOZw=;
 b=xOlW7ahljt2E77rLHu5VgLUDMYtiQHbpEYwXFZFImKZ+8iH+XZrm9M1X1aMQDKhc11
 QK49P3D5oeggYuR+MTWKQAR3puyQg/xfeO421JCKUPGassL80rp/cbal104+jAp/olA0
 FRhUiSOTt0C9rcwHtHjrGUofO4vORuafUA0Mb7WPCP1uQmX2O6utVmnnBJajhcPPXlQ4
 QjbEJ2n92NR5QF/D/lLyF4qM5gAIYegAplZvSiPQHlIs2PrMLzOcNEgVRQNT5leWOvb3
 tAAnHlHHL1lDE1piK/iqx7XfE9BkFZr5k5uYIxaTTC0ZOcTIc/1hEHYOq1BEui5rKXZB
 Y6bg==
X-Gm-Message-State: ACgBeo1arB74qQ/CGccjcy4Ln+AsDudJuCIVCn+vDoUix7iwoJ+Y+bdI
 hBjO8CyrZoyvuc9voXrzv91i9GQtpfouWRAn61zVQ5X4zkVbGoQXANsbg19cVZMBiM5p0V960tG
 rohJyNldWHHDBwiI=
X-Received: by 2002:a5d:5a10:0:b0:221:7c17:abee with SMTP id
 bq16-20020a5d5a10000000b002217c17abeemr8101837wrb.698.1660549651118; 
 Mon, 15 Aug 2022 00:47:31 -0700 (PDT)
X-Google-Smtp-Source: AA6agR7DP2uGFhDt8dm+pEBcYvfPCjqJPNICa6NEFIA+cN9RLyCmtgHengpHxSKb4Ge/OCtMtp/1vw==
X-Received: by 2002:a5d:5a10:0:b0:221:7c17:abee with SMTP id
 bq16-20020a5d5a10000000b002217c17abeemr8101824wrb.698.1660549650873; 
 Mon, 15 Aug 2022 00:47:30 -0700 (PDT)
Received: from [192.168.8.103] (tmo-096-168.customers.d1-online.com.
 [80.187.96.168]) by smtp.gmail.com with ESMTPSA id
 g7-20020a05600c4ec700b003a3170a7af9sm8716326wmq.4.2022.08.15.00.47.30
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 15 Aug 2022 00:47:30 -0700 (PDT)
Message-ID: <7fa38fda-0f33-8e43-93f4-956c2917eb74@redhat.com>
Date: Mon, 15 Aug 2022 09:47:29 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.12.0
Subject: Re: [RFC] Unable to use qemu-ppc to run 32-bit powerpc executables
 generated on gcc110 machine
Content-Language: en-US
To: Pierre Muller <pierre@freepascal.org>,
 "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>
References: <66112e17-e4ac-59fd-ceaf-56047015918a@freepascal.org>
 <9d24dd87-782f-ab15-9d48-51653801cee0@redhat.com>
 <1f4c81d1-7127-6441-2435-cfd2aa557550@freepascal.org>
Cc: "qemu-ppc@nongnu.org" <qemu-ppc@nongnu.org>,
 Laurent Vivier <laurent@vivier.eu>
From: Thomas Huth <thuth@redhat.com>
In-Reply-To: <1f4c81d1-7127-6441-2435-cfd2aa557550@freepascal.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
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

On 12/08/2022 09.03, Pierre Muller wrote:
> 
> Le 12/08/2022 à 06:16, Thomas Huth a écrit :
>> On 11/08/2022 23.38, Pierre Muller wrote:
>>>
>>>     I am using qemu to check code generated by Free Pascal compiler
>>> for various CPUs.
>>>
>>>     Recently, this allowed me to find out that Free Pascal was generating
>>> wrong instructions, leading to SIGBUS errors using qemu-mips.
>>>     The same binaries worked without troubles on mips test machines,
>>> probably because SIGBUS is handled directly inside the kernel.
>>>
>>>     Here I would like to report the problem I get when trying to run
>>> powerpc executables using shared libs generated on gcc110 machine.
>>>
>>>     I copied over the needed libraries into a sys-root directory.
>>>
>>>     The problem is that the code crashes with a Illegal Instruction
>>> after only a very few instructions:
>>>
>>> muller@gcc186:~/pas/check$ ~/sys-root/bin/qemu-ppc -cpu g2 -d in_asm -L
>>> ~/sys-root/powerpc-linux ./twide1
>> [...]
>>> 0x3ffc1d60:  f00004d7  xxlxor   v0, v0, v0
>>>
>>> qemu: uncaught target signal 4 (Illegal instruction) - core dumped
>>>
>>> The problem is the the 'xxlxor' instruction is a VSX extension instruction.
>>>
>>>    There is apparently no cpu in the powerpc cpu list that enabled this
>>> extension.
>>> The output of cat /proc/cpuinfo on gcc110 gives that:
>>> .....
>>> processor       : 63
>>> cpu             : POWER7 (architected), altivec supported
>>> clock           : 3550.000000MHz
>>> revision        : 2.1 (pvr 003f 0201)
>>>
>>> timebase        : 512000000
>>> platform        : pSeries
>>> model           : IBM,8231-E2B
>>> machine         : CHRP IBM,8231-E2B
>>>
>>>     Is there a way to enable cpu features separately for ppc like is done 
>>> for
>>> x86_64?
>>> Or would it be possible to define a new cpu inside qemu source that would 
>>> match
>>> the description above?
>>
>> So you are building on a POWER7 host and try to run the binaries on an
>> emulated G2? That sounds weird. Why don't you use
> 
>    The g2 was just an example, I used a script to iterate
> over all possible cpus (as listed by --cpu help),
> but I always get a Illegal instruction on xllxor,
> because none of the cpu in the least seems to enable VSX
> extension.

Ok, I see, so the question is wether it is somehow possible to enable the 
vector extensions on a 32-bit CPU by default somehow...
CC:-ing Laurent, maybe he knows...

  Thomas


