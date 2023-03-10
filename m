Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 622156B413F
	for <lists+qemu-devel@lfdr.de>; Fri, 10 Mar 2023 14:51:01 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pad7R-0007I7-L4; Fri, 10 Mar 2023 08:49:13 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <agraf@csgraf.de>)
 id 1pad7P-0007Hn-RP; Fri, 10 Mar 2023 08:49:11 -0500
Received: from mail.csgraf.de ([85.25.223.15] helo=zulu616.server4you.de)
 by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <agraf@csgraf.de>)
 id 1pad7N-00068h-G1; Fri, 10 Mar 2023 08:49:11 -0500
Received: from [0.0.0.0] (ec2-3-122-114-9.eu-central-1.compute.amazonaws.com
 [3.122.114.9]) by csgraf.de (Postfix) with ESMTPSA id 8CA486080292;
 Fri, 10 Mar 2023 14:48:57 +0100 (CET)
Message-ID: <44c6459b-f17f-8cb7-ba2d-a9187f32cde0@csgraf.de>
Date: Fri, 10 Mar 2023 14:48:56 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.8.0
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
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-0.001,
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
> Changing the ITT entry size of QEMU's implementation introduces
> an unnecessary incompatibility in migration and wastes memory
> (we're already a bit unnecessarily profligate with ITT entries
> compared to real hardware).


Follow-up on this: Microsoft has fixed the issue in Windows. That won't 
make older versions work, but the current should be fine with GICv3:

https://fosstodon.org/@itanium/109909281184181276


Alex



