Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id F13912DBEFF
	for <lists+qemu-devel@lfdr.de>; Wed, 16 Dec 2020 11:51:47 +0100 (CET)
Received: from localhost ([::1]:38198 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kpUPL-0003e9-2r
	for lists+qemu-devel@lfdr.de; Wed, 16 Dec 2020 05:51:47 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:52652)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1kpUOY-0003DK-9O
 for qemu-devel@nongnu.org; Wed, 16 Dec 2020 05:50:58 -0500
Received: from mail-wr1-x435.google.com ([2a00:1450:4864:20::435]:44821)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1kpUOW-0006ZZ-Mm
 for qemu-devel@nongnu.org; Wed, 16 Dec 2020 05:50:58 -0500
Received: by mail-wr1-x435.google.com with SMTP id w5so18981848wrm.11
 for <qemu-devel@nongnu.org>; Wed, 16 Dec 2020 02:50:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=Xv90pGKHSd1iup8rHBBas7LG9OwRK+eYIdDVNAi+Y4Q=;
 b=Y8WyiA0pXnULlK5az9uL5SaoKyZt5CYUHj2IODFlWsPFIWlHbpVK6r4XiyTQUN33pt
 IYlYtmDt1025FXEkHJzd1vyomivhWp+R5h3zYYPe1dcSrg46dMNtByKsdfn558dHPrrw
 YKadNJktDc3UULjj7Y1QZIP7qNZJN2UYI6Myj1dm3qd/pOKn2tZy8ZyKwReLc7BHQBKA
 P4uyFt7cFABs8qduy8BDvqBOqWVy8R9jf1RcuuRFY5LywS3c73pFG2CThETYIl21szT0
 H/ZiYqa03NTcRd+5JDbwV/fmR0MrDljwS5sjn4eJWTVNOtbsKX0EVi49Yc+2ugWBK95O
 qr9w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:subject:to:cc:references:from:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=Xv90pGKHSd1iup8rHBBas7LG9OwRK+eYIdDVNAi+Y4Q=;
 b=rU99CdyvZhvY/sdy1kE1QSkAlVBeAIEDqYIqgOW5i3HJschgWkKKoMbHuLwzBXeRle
 6WAyh2+Z6ybdz3oduJlzhuwzFwEjXq3V6MUw+1AB8xE9Q9R72FxogYA1PlHn9tZKv2E7
 UDC9FmSB8DZrKTMxaCy32BXsfZJjoUdbjVpat6TNf+weQVmEmBaBpCAWAj3Wzg0HlkW5
 gj8+GsPBb/WJLnlYZJxtRHeKlH3ABjsAVdLQbfWrai58eZ0w9u6aHx3njEOB8mY+oKHI
 4viVpng6bKg3fp2s2GAeBVmXMakD9mc2uCE82OlTJLxF4nZWv+2Fn6urN+wl+BCs3ujF
 oipQ==
X-Gm-Message-State: AOAM531vx8X9RduW9mQwq6XvaWiZJtZs0m4oyuomU55SkHpeQWsDDfcb
 6qjMqS1Y3X/e4/dGSA2J3wI=
X-Google-Smtp-Source: ABdhPJwQfjTDc2P9bNpOrGqtI0lYbrDk2aMoShxBLBmrnbZ3rDbSvb1JSJSTXMYL8iorSSEjtVWgGw==
X-Received: by 2002:adf:f7d2:: with SMTP id a18mr15934993wrq.47.1608115855152; 
 Wed, 16 Dec 2020 02:50:55 -0800 (PST)
Received: from [192.168.1.36] (101.red-88-21-206.staticip.rima-tde.net.
 [88.21.206.101])
 by smtp.gmail.com with ESMTPSA id o13sm2092470wmc.44.2020.12.16.02.50.53
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 16 Dec 2020 02:50:54 -0800 (PST)
Subject: Re: [PATCH v2 03/24] target/mips/cpu: Introduce isa_rel6_available()
 helper
To: Jiaxun Yang <jiaxun.yang@flygoat.com>,
 Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org,
 Aurelien Jarno <aurelien@aurel32.net>
References: <20201215225757.764263-1-f4bug@amsat.org>
 <20201215225757.764263-4-f4bug@amsat.org>
 <508441db-8748-1b55-5f39-e6a778c0bdc0@linaro.org>
 <40e8df0f-01ab-6693-785b-257b8d3144bf@amsat.org>
 <af357960-40f2-b9e6-485f-d1cf36a4e95d@flygoat.com>
 <b1e8b44c-ae6f-786c-abe0-9a03eb5d3d63@flygoat.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
Message-ID: <5977d0f5-7e62-5f8a-d4ec-284f6f1af81d@amsat.org>
Date: Wed, 16 Dec 2020 11:50:53 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.5.0
MIME-Version: 1.0
In-Reply-To: <b1e8b44c-ae6f-786c-abe0-9a03eb5d3d63@flygoat.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::435;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wr1-x435.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.25,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.249, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: Paolo Bonzini <pbonzini@redhat.com>,
 Aleksandar Rikalo <aleksandar.rikalo@syrmia.com>,
 Huacai Chen <chenhuacai@kernel.org>, kvm@vger.kernel.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 12/16/20 4:14 AM, Jiaxun Yang wrote:
> 在 2020/12/16 上午10:50, Jiaxun Yang 写道:
>>
>>
>> TBH I do think it doesn't sounds like a good idea to make 32-bit
>> and 64-bit different. In fact ISA_MIPS32R6 is always set for targets
>> with ISA_MIPS64R6.
>>
>> We're treating MIPS64R6 as a superset of MIPS32R6, and ISA_MIPS3
>> is used to tell if a CPU supports 64-bit.

Which is why I don't understand why they are 2 ISA_MIPS32R6/ISA_MIPS64R6
definitions.

>>
>> FYI:
>> https://commons.wikimedia.org/wiki/File:MIPS_instruction_set_family.svg
> 
> Just add more cents here...
> The current method we handle R6 makes me a little bit annoying.
> 
> Given that MIPS is backward compatible until R5, and R6 reorganized a lot
> of opcodes, I do think decoding procdure of R6 should be dedicated from
> the rest,
> otherwise we may fall into the hell of finding difference between R6 and
> previous
> ISAs, also I've heard some R6 only ASEs is occupying opcodes marked as
> "removed in R6", so it doesn't looks like a wise idea to check removed
> in R6
> in helpers.

I'm not sure I understood well your comment, but I also find how
R6 is handled messy...

I'm doing this removal (from helper to decoder) with the decodetree
conversion.

> So we may end up having four series of decodetrees for ISA
> Series1: MIPS-II, MIPS32, MIPS32R2, MIPS32R5 (32bit "old" ISAs)
> Series2: MIPS-III, MIPS64, MIPS64R2, MIPS64R5 (64bit "old" ISAs)
> 
> Series3: MIPS32R6 (32bit "new" ISAs)
> Series4: MIPS64R6 (64bit "new" ISAs)

Something like that, I'm starting by converting the messier leaves
first, so the R6 and ASEs. My approach is from your "series4" to
"series1" last.

Regards,

Phil.

