Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id EAAD641837D
	for <lists+qemu-devel@lfdr.de>; Sat, 25 Sep 2021 19:12:38 +0200 (CEST)
Received: from localhost ([::1]:51904 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mUBE5-0008Im-QM
	for lists+qemu-devel@lfdr.de; Sat, 25 Sep 2021 13:12:37 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33434)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <i.qemu@xen0n.name>) id 1mUBCm-0007bK-6u
 for qemu-devel@nongnu.org; Sat, 25 Sep 2021 13:11:16 -0400
Received: from [115.28.160.31] (port=56686 helo=mailbox.box.xen0n.name)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <i.qemu@xen0n.name>) id 1mUBCj-0004mN-IT
 for qemu-devel@nongnu.org; Sat, 25 Sep 2021 13:11:15 -0400
Received: from [192.168.9.172] (unknown [101.88.29.172])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits))
 (No client certificate requested)
 by mailbox.box.xen0n.name (Postfix) with ESMTPSA id 9B52060B2F;
 Sun, 26 Sep 2021 01:11:06 +0800 (CST)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=xen0n.name; s=mail;
 t=1632589866; bh=z45vgP1us5c0jf4cBkA6Gf7Ig9RAt9B7/gvXh2N7BF0=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=C4gXWeLKsslMXfRYstEqKA0l/AuW2JplIuSUEQ6Mi24R1ChS5cT1ZmX4cAveaoEXw
 qblKfaPEkNUODWUOm5CZ6TlMkiRQpkR/h4AQ+6uuDunmXaxB7gEOGrxs5/QDyfM+r+
 hrVEfpO4xsUtqWqksTOlyV+s8JTOn7/KV5za1UhA=
Message-ID: <a48e885b-0027-68fb-ea0d-3edc8918693a@xen0n.name>
Date: Sun, 26 Sep 2021 01:11:06 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:94.0) Gecko/20100101
 Thunderbird/94.0a1
Subject: Re: [PATCH v5 04/30] tcg/loongarch64: Add generated instruction
 opcodes and encoding helpers
Content-Language: en-US
To: Richard Henderson <richard.henderson@linaro.org>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>,
 Yunqiang Su <syq@debian.org>, Huacai Chen <chenhuacai@kernel.org>,
 =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>
References: <20210924172527.904294-1-git@xen0n.name>
 <20210924172527.904294-5-git@xen0n.name>
 <313df1b0-9edf-7333-da46-7342ca308dfb@xen0n.name>
 <6bc47454-7475-7b02-3621-54d064a975e7@linaro.org>
 <9c7adce3-6e51-10cb-9935-4857f822c332@amsat.org>
 <cab11f59-c90d-8228-2226-1e3d1a727196@linaro.org>
From: WANG Xuerui <i.qemu@xen0n.name>
In-Reply-To: <cab11f59-c90d-8228-2226-1e3d1a727196@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 115.28.160.31 (failed)
Received-SPF: pass client-ip=115.28.160.31; envelope-from=i.qemu@xen0n.name;
 helo=mailbox.box.xen0n.name
X-Spam_score_int: -12
X-Spam_score: -1.3
X-Spam_bar: -
X-Spam_report: (-1.3 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
 RDNS_NONE=0.793, SPF_HELO_NONE=0.001,
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Laurent Vivier <laurent@vivier.eu>, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Hi Richard,

On 9/25/21 23:20, Richard Henderson wrote:
> Adding Alex to the Cc list re docker testing.
>
> On 9/25/21 10:31 AM, Philippe Mathieu-Daudé wrote:
>> Xuerui said on the cover 1/ we can buy a board on Taobao and 2/ Loongson
>> might help the community with hardware.
>>
>> I tried 1/, spend more than 2h to read a translated version of the EULA,
>> succeeded at the SMS verification, but then when I tried to log in to
>> search for boards my account got banned with no explanation. This
>> doesn't seem easy to use outside of China, so I guess we're back on 2/.
>>
>> Cc'ing other QEMU Loongson contributors in case they might give us ideas
>> about how to add this arch into our CI.
>
> It does seem like a good idea to have some sort of testing in place.
>
> Perhaps build upon debian-hexagon-cross.docker to set up a cross-build 
> environment for loongarch.  Add just enough more that it's good for a 
> full cross-build of qemu (glib and pixman?).
>
> Like the hexagon docker image, the build time would be substantial, so 
> we'd push a golden copy to the qemu-project repo.
Testing is of course very important for infra projects, including qemu; 
I'll craft something and post a followup series later. I'll need maybe 2 
or 3 days; the entirety of cross toolchain must be built, and I'm doing 
all these in spare time, usually midnight.
>
>
> r~

