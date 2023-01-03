Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E20EC65C78C
	for <lists+qemu-devel@lfdr.de>; Tue,  3 Jan 2023 20:31:45 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pCmzd-0005pw-Ke; Tue, 03 Jan 2023 14:30:37 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <agraf@csgraf.de>)
 id 1pCmzW-0005p1-Fx; Tue, 03 Jan 2023 14:30:30 -0500
Received: from mail.csgraf.de ([85.25.223.15] helo=zulu616.server4you.de)
 by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <agraf@csgraf.de>)
 id 1pCmzU-0001GJ-Lx; Tue, 03 Jan 2023 14:30:30 -0500
Received: from [192.168.106.127]
 (dynamic-092-225-244-121.92.225.pool.telefonica.de [92.225.244.121])
 by csgraf.de (Postfix) with ESMTPSA id 8B96B6080408;
 Tue,  3 Jan 2023 20:30:17 +0100 (CET)
Message-ID: <0920bfd7-1274-5f9c-ff71-62deb7de5789@csgraf.de>
Date: Tue, 3 Jan 2023 20:30:16 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.6.1
Subject: Re: [PATCH 0/2] hw/intc/arm_gicv3: Bump ITT entry size to 16
Content-Language: en-US
To: Peter Maydell <peter.maydell@linaro.org>
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org,
 Yanan Wang <wangyanan55@huawei.com>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Eduardo Habkost <eduardo@habkost.net>,
 Shashi Mallela <shashi.mallela@linaro.org>,
 Eric Auger <eric.auger@redhat.com>, Neil Armstrong <narmstrong@baylibre.com>
References: <20221223085047.94832-1-agraf@csgraf.de>
 <CAFEAcA-1PUCFZPAF25uy1VqjgciKXiYmfW-89q6QqKhf1io7Lw@mail.gmail.com>
From: Alexander Graf <agraf@csgraf.de>
In-Reply-To: <CAFEAcA-1PUCFZPAF25uy1VqjgciKXiYmfW-89q6QqKhf1io7Lw@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=85.25.223.15; envelope-from=agraf@csgraf.de;
 helo=zulu616.server4you.de
X-Spam_score_int: -49
X-Spam_score: -5.0
X-Spam_bar: -----
X-Spam_report: (-5.0 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-3.103,
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

Hi Peter,

On 03.01.23 18:41, Peter Maydell wrote:
> On Fri, 23 Dec 2022 at 08:50, Alexander Graf <agraf@csgraf.de> wrote:
>> While trying to make Windows work with GICv3 emulation, I stumbled over
>> the fact that it only supports ITT entry sizes that are power of 2 sized.
>>
>> While the spec allows arbitrary sizes, in practice hardware will always
>> expose power of 2 sizes and so this limitation is not really a problem
>> in real world scenarios. However, we only expose a 12 byte ITT entry size
>> which makes Windows blue screen on boot.
>>
>> The easy way to get around that problem is to bump the size to 16. That
>> is a power of 2, basically is what hardware would expose given the amount
>> of bits we need per entry and doesn't break any existing scenarios. To
>> play it safe, this patch set only bumps them on newer machine types.
> This is a Windows bug and should IMHO be fixed in that guest OS.


I don't have access to the Windows source code, but the compiled binary 
very explicitly checks and validates that an ITT entry is Po2 sized. 
That means the MS folks deliberately decided to make simplifying 
assumptions that hardware will never use any other sizes.

After thinking about it for a while, I ended up with the same 
conclusion: Hardware would never use anything but Po2 sizes because 
those are trivial to map to indexes in hardware, while anything even 
remotely odd is much more costly (in die space and/or time) to extract 
an index from.

So while I'm really curious about the rationale they had here, I doubt 
it's a bug. It's a deliberate decision. And one that makes sense in the 
context of hardware. I don't see a good reason for them to change the 
behavior, given that there's a close-to-0 chance we will ever see real 
hardware ITS structures with ITT entries that are not Po2 sized.


> Changing the ITT entry size of QEMU's implementation introduces
> an unnecessary incompatibility in migration and wastes memory

The patch set deals with migration through machine versions. We do these 
type of changes all the time, why would it be a problem here?

As for memory waste, I agree. If I understand the ITS code correctly, 
basically all of the contents that are >8 bytes is GICv4 related and 
useless in a GICv3 vGIC. So I think if we really care strongly about 
memory waste, we could try to condense it down to 8 bytes in the GICv3 
case and make it 16 only for GICv4.

I think keeping GICv3 and GICv4 code paths identical does have its 
attractiveness though, so I'd prefer not to do it.


> (we're already a bit unnecessarily profligate with ITT entries
> compared to real hardware).

Do you mean the number of entries or the size per entry?


Alex



