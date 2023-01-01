Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2DFA465A8D8
	for <lists+qemu-devel@lfdr.de>; Sun,  1 Jan 2023 05:35:43 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pBq3B-0001oZ-15; Sat, 31 Dec 2022 23:34:21 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <hpa@zytor.com>) id 1pBq39-0001oC-3J
 for qemu-devel@nongnu.org; Sat, 31 Dec 2022 23:34:19 -0500
Received: from [2607:7c80:54:3::138] (helo=mail.zytor.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <hpa@zytor.com>) id 1pBq37-000559-BQ
 for qemu-devel@nongnu.org; Sat, 31 Dec 2022 23:34:18 -0500
Received: from [IPV6:2601:646:8600:40c1:5967:deb4:a714:2940]
 ([IPv6:2601:646:8600:40c1:5967:deb4:a714:2940])
 (authenticated bits=0)
 by mail.zytor.com (8.17.1/8.17.1) with ESMTPSA id 3014Y4Ss1855911
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NO);
 Sat, 31 Dec 2022 20:34:05 -0800
DKIM-Filter: OpenDKIM Filter v2.11.0 mail.zytor.com 3014Y4Ss1855911
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=zytor.com;
 s=2022120601; t=1672547646;
 bh=VpwZJfHjUoFCQG04147cJw1T6GjsP7kTmWFVBOMEzis=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=FBj19I80P/nTqvFwmpAMVESYgiNL+uPue00zX9GK6uE6lH5ZLMxKP/u7h+zU9c9U+
 VL6mDEnllaUrwWJ+/eWcXib16lPgJGsegWLNVsWJ+6KYPOtK4kRWSji4CUFB7dLBwX
 3SF2nN7UCuGWX6uRVA+UvjgK9e7HXG/N9RzHx1ng6ut2LrXIIzBYbSoA2HL9St6Fh0
 JFj+rWaRfUMF7n/iqo0td/ab6vDdojuMsR15IrAIyOq7Y5PjwYRe8W//TaTWYUNDWg
 DtBOQ6EZxPVwj4Aqzrvw4PM8SD9Osy5sN7Gk/4TCOPEBS974Lbevdhp6QOHyFyeBYe
 SswuztX9dAvkA==
Message-ID: <24908710-09f6-da2a-d821-58a81c572f6c@zytor.com>
Date: Sat, 31 Dec 2022 20:33:59 -0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.0
Subject: Re: [PATCH qemu] x86: don't let decompressed kernel image clobber
 setup_data
Content-Language: en-US
To: "Jason A. Donenfeld" <Jason@zx2c4.com>, Borislav Petkov <bp@alien8.de>
Cc: pbonzini@redhat.com, ebiggers@kernel.org, x86@kernel.org,
 linux-kernel@vger.kernel.org, qemu-devel@nongnu.org, ardb@kernel.org,
 kraxel@redhat.com, philmd@linaro.org
References: <CAHmME9oPUJemVRvO3HX0q4BJGTFuzbLYANeizuRcNq2=Ykk1Gg@mail.gmail.com>
 <Y69B40T9kWfxZpmf@zn.tnic> <E5D0A77E-5ABC-4978-9A66-37B60DA43869@zytor.com>
 <Y69h6ur79SMhu61F@zx2c4.com> <46466e54-25c3-3194-8546-a57cd4a80d9d@zytor.com>
 <Y7A76+IBS4fnucrW@zn.tnic> <Y7A8qP05B0YRbQIN@zx2c4.com>
 <Y7A9nBud6UeH+wYd@zn.tnic> <Y7A+YELM7m5E2PUQ@zx2c4.com>
 <Y7BGIAL4z6o6FEI5@zn.tnic> <Y7B993P1+jYB/etX@zx2c4.com>
From: "H. Peter Anvin" <hpa@zytor.com>
In-Reply-To: <Y7B993P1+jYB/etX@zx2c4.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:7c80:54:3::138
 (failed)
Received-SPF: pass client-ip=2607:7c80:54:3::138; envelope-from=hpa@zytor.com;
 helo=mail.zytor.com
X-Spam_score_int: -24
X-Spam_score: -2.5
X-Spam_bar: --
X-Spam_report: (-2.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-1.153,
 RDNS_NONE=0.793, SPF_HELO_PASS=-0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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



On 12/31/22 10:22, Jason A. Donenfeld wrote:
> On Sat, Dec 31, 2022 at 03:24:32PM +0100, Borislav Petkov wrote:
>> On Sat, Dec 31, 2022 at 02:51:28PM +0100, Jason A. Donenfeld wrote:
>>> That failure is unrelated to the ident mapping issue Peter and
>>> I discussed. The original failure is described in the commit message:
>>> decompression clobbers the data, so sd->next points to garbage.
>>
>> Right
> 
> So with that understanding confirmed, I'm confused at your surprise that
> hpa's unrelated fix to the different issue didn't fix this issue.
> 

If decompression does clobber the data, then we *also* need to figure 
out why that is. There are basically three possibilities:

1. If physical KASLR is NOT used:

	a. The boot loader doesn't honor the kernel safe area properly;
	b. Somewhere in the process a bug in the calculation of the
	   kernel safe area has crept in.

2. If physical KASLR IS used:

	The decompressor doesn't correctly keep track of nor relocate
	all the keep-out zones before picking a target address.

One is a bootloader bug, two is a kernel bug. My guess is (2) is the 
culprit, but (1b) should be checked, too.

	-hpa


