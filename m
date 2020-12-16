Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D3AE42DB999
	for <lists+qemu-devel@lfdr.de>; Wed, 16 Dec 2020 04:19:51 +0100 (CET)
Received: from localhost ([::1]:49162 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kpNLy-0008WI-E1
	for lists+qemu-devel@lfdr.de; Tue, 15 Dec 2020 22:19:50 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:40412)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jiaxun.yang@flygoat.com>)
 id 1kpNHf-000753-47
 for qemu-devel@nongnu.org; Tue, 15 Dec 2020 22:15:24 -0500
Received: from relay1.mymailcheap.com ([149.56.97.132]:32916)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jiaxun.yang@flygoat.com>)
 id 1kpNHU-0000pW-0u
 for qemu-devel@nongnu.org; Tue, 15 Dec 2020 22:15:20 -0500
Received: from filter2.mymailcheap.com (filter2.mymailcheap.com
 [91.134.140.82])
 by relay1.mymailcheap.com (Postfix) with ESMTPS id 821893F157;
 Wed, 16 Dec 2020 03:15:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by filter2.mymailcheap.com (Postfix) with ESMTP id C68F22A45B;
 Wed, 16 Dec 2020 04:15:07 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=mymailcheap.com;
 s=default; t=1608088507;
 bh=1xyrlrBIqLtYHaZfwjobQnF/1NiC16uKGYnZgrRLFUM=;
 h=Subject:From:To:Cc:References:Date:In-Reply-To:From;
 b=XhKXL6KX8/R78++ud+WKXAUd0xlt/GiuF0ElYGwtO/t6SnCkmvFbIEYjJi4Mzr87N
 Z1bTyMgJlEde5ff17yfRZ5lcP5Xvv76Iuvz8TB7pWZMW6NJHEdQwOFYfrmTLlYE3Mv
 aOrChDH482+GI9bjIwXDUIrtFWpq3a7u1f9ocZ3w=
X-Virus-Scanned: Debian amavisd-new at filter2.mymailcheap.com
Received: from filter2.mymailcheap.com ([127.0.0.1])
 by localhost (filter2.mymailcheap.com [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id hPgxqFNmWNci; Wed, 16 Dec 2020 04:15:06 +0100 (CET)
Received: from mail20.mymailcheap.com (mail20.mymailcheap.com [51.83.111.147])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by filter2.mymailcheap.com (Postfix) with ESMTPS;
 Wed, 16 Dec 2020 04:15:06 +0100 (CET)
Received: from [148.251.23.173] (ml.mymailcheap.com [148.251.23.173])
 by mail20.mymailcheap.com (Postfix) with ESMTP id 79BD440FF4;
 Wed, 16 Dec 2020 03:15:04 +0000 (UTC)
Authentication-Results: mail20.mymailcheap.com; dkim=pass (1024-bit key;
 unprotected) header.d=flygoat.com header.i=@flygoat.com header.b="SBHa++/5"; 
 dkim-atps=neutral
AI-Spam-Status: Not processed
Received: from [0.0.0.0] (li1000-254.members.linode.com [45.33.50.254])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by mail20.mymailcheap.com (Postfix) with ESMTPSA id 033B141990;
 Wed, 16 Dec 2020 03:14:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=flygoat.com;
 s=default; t=1608088496;
 bh=1xyrlrBIqLtYHaZfwjobQnF/1NiC16uKGYnZgrRLFUM=;
 h=Subject:From:To:Cc:References:Date:In-Reply-To:From;
 b=SBHa++/5ct0rwPmuLmByl3QuSId9+IIvKZ0aIKmZa73pUJ5e8AMXHex9L8nIL1YZs
 /kX+KA2gNhJMXPT3TVaHrnF3loAjRHWzryvS9bOKdaZjL6IyPYwciY9bAN+nDpx7z2
 LhwWfaL2O0KSnM9+/p+WTSxRpZ+GyK314kTNW5mc=
Subject: Re: [PATCH v2 03/24] target/mips/cpu: Introduce isa_rel6_available()
 helper
From: Jiaxun Yang <jiaxun.yang@flygoat.com>
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>,
 Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org,
 Aurelien Jarno <aurelien@aurel32.net>
References: <20201215225757.764263-1-f4bug@amsat.org>
 <20201215225757.764263-4-f4bug@amsat.org>
 <508441db-8748-1b55-5f39-e6a778c0bdc0@linaro.org>
 <40e8df0f-01ab-6693-785b-257b8d3144bf@amsat.org>
 <af357960-40f2-b9e6-485f-d1cf36a4e95d@flygoat.com>
Message-ID: <b1e8b44c-ae6f-786c-abe0-9a03eb5d3d63@flygoat.com>
Date: Wed, 16 Dec 2020 11:14:46 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.5.1
MIME-Version: 1.0
In-Reply-To: <af357960-40f2-b9e6-485f-d1cf36a4e95d@flygoat.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
X-Rspamd-Server: mail20.mymailcheap.com
X-Spamd-Result: default: False [-0.10 / 10.00]; RCVD_VIA_SMTP_AUTH(0.00)[];
 ARC_NA(0.00)[]; R_DKIM_ALLOW(0.00)[flygoat.com:s=default];
 FROM_HAS_DN(0.00)[]; TO_DN_SOME(0.00)[];
 TO_MATCH_ENVRCPT_ALL(0.00)[]; MIME_GOOD(-0.10)[text/plain];
 R_SPF_SOFTFAIL(0.00)[~all]; ML_SERVERS(-3.10)[148.251.23.173];
 DKIM_TRACE(0.00)[flygoat.com:+];
 DMARC_POLICY_ALLOW(0.00)[flygoat.com,none];
 RCPT_COUNT_SEVEN(0.00)[8];
 DMARC_POLICY_ALLOW_WITH_FAILURES(0.00)[];
 RCVD_NO_TLS_LAST(0.10)[]; FROM_EQ_ENVFROM(0.00)[];
 MIME_TRACE(0.00)[0:+];
 ASN(0.00)[asn:24940, ipnet:148.251.0.0/16, country:DE];
 RCVD_COUNT_TWO(0.00)[2]; MID_RHS_MATCH_FROM(0.00)[];
 HFILTER_HELO_BAREIP(3.00)[148.251.23.173,1]
X-Rspamd-Queue-Id: 79BD440FF4
Received-SPF: pass client-ip=149.56.97.132;
 envelope-from=jiaxun.yang@flygoat.com; helo=relay1.mymailcheap.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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



在 2020/12/16 上午10:50, Jiaxun Yang 写道:
>
>
> TBH I do think it doesn't sounds like a good idea to make 32-bit
> and 64-bit different. In fact ISA_MIPS32R6 is always set for targets
> with ISA_MIPS64R6.
>
> We're treating MIPS64R6 as a superset of MIPS32R6, and ISA_MIPS3
> is used to tell if a CPU supports 64-bit.
>
> FYI: 
> https://commons.wikimedia.org/wiki/File:MIPS_instruction_set_family.svg

Just add more cents here...
The current method we handle R6 makes me a little bit annoying.

Given that MIPS is backward compatible until R5, and R6 reorganized a lot
of opcodes, I do think decoding procdure of R6 should be dedicated from 
the rest,
otherwise we may fall into the hell of finding difference between R6 and 
previous
ISAs, also I've heard some R6 only ASEs is occupying opcodes marked as
"removed in R6", so it doesn't looks like a wise idea to check removed in R6
in helpers.

So we may end up having four series of decodetrees for ISA
Series1: MIPS-II, MIPS32, MIPS32R2, MIPS32R5 (32bit "old" ISAs)
Series2: MIPS-III, MIPS64, MIPS64R2, MIPS64R5 (64bit "old" ISAs)

Series3: MIPS32R6 (32bit "new" ISAs)
Series4: MIPS64R6 (64bit "new" ISAs)

Thanks

- Jiaxun
>
> Thanks.
>
> - Jiaxun
>
>
>>
>> Thanks for reviewing the series!
>>
>> Phil.
>

