Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 68A8D37FB40
	for <lists+qemu-devel@lfdr.de>; Thu, 13 May 2021 18:09:13 +0200 (CEST)
Received: from localhost ([::1]:43792 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lhDtg-0003k0-BZ
	for lists+qemu-devel@lfdr.de; Thu, 13 May 2021 12:09:12 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34578)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>)
 id 1lhDoN-0005Bv-L1; Thu, 13 May 2021 12:03:45 -0400
Received: from mout.kundenserver.de ([212.227.17.10]:49109)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>)
 id 1lhDoH-0004rm-Vc; Thu, 13 May 2021 12:03:43 -0400
Received: from [192.168.100.1] ([82.142.31.78]) by mrelayeu.kundenserver.de
 (mreue106 [213.165.67.119]) with ESMTPSA (Nemesis) id
 1MadC8-1l6VL32CUc-00c8NW; Thu, 13 May 2021 18:03:11 +0200
Subject: Re: [PATCH v3 0/2] hw: Convert mc146818rtc & etraxfs_timer to 3-phase
 reset interface
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>,
 qemu-devel@nongnu.org
References: <20210502163931.552675-1-f4bug@amsat.org>
 <89ae6ce0-7959-0d74-2f14-f5943a74bec2@amsat.org>
From: Laurent Vivier <laurent@vivier.eu>
Message-ID: <7421b58c-d777-3295-4139-cbc95a63ce2b@vivier.eu>
Date: Thu, 13 May 2021 18:03:09 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <89ae6ce0-7959-0d74-2f14-f5943a74bec2@amsat.org>
Content-Type: text/plain; charset=utf-8
Content-Language: fr
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:KTdAXCCoYRYJUj0gn/Nco4GyTvaSLHOVituXyPu9uy92kN1oXq9
 nmuNXQo1TVWpbkwSKd6XXrfpRbA/pJ6dDqDOBlafMf1Qs+xLEk5IMTYgYU6/o3X3ZldXELi
 3Fbd7cuKU/MS7JDIeAVVu6sweuMmxbNN/17NdCn5cjhDFWSLATS5SfohAMI0h/vcPn9dD0o
 tsMS0Q9Y3GHdpszhGYaJw==
X-UI-Out-Filterresults: notjunk:1;V03:K0:k26zp04H2c4=:MQr6JkLUs1/JivhfqJvBu0
 Sj2gv1I8KUcltssFPVJQ8EhQZXHEeLGa0Wqco8OnyvygQRtVGxR/huvBjuG/10P8Huv6d+sBW
 CLq52eFhiXgEfvMhGqCQIS37q+4sZ0c55Q/fatyi3P3y504xpCD5d+Tu4R4K3abOlbpsMffZb
 /bkb+/ua2aTIA3s/ZjowBQ3qwRz9Ppo9tGCO4YWzMQWHNDBwvYF/mDPS+lxVKKM1OvUbwz3CJ
 omFcHo5VY5fzd94uOf3k3eJsNd3aJawRHJx+wEDQIakhvt2o/PP3J+L/iwfJtQWIZDO6UIEcj
 xFrOnumVj31swA7TGxuZwtIvA+0MROl/1o+s3hJk6X0S7pIZRHXPibYRvxzDd8D0DjFxrVnFN
 ZA27eX9AJPiNVwB65d91u3qYqrEiVPT5Xp3vX6kNP3F0u0cdub3y3XzOOZ6+zT706gcA31KoU
 cFDf/ugl6xFWzjGQNnlRryOwJeJ9gIB+bp0W3v5+vQly58GoaGjcFt3HTwgZSeocxZaQvEfVB
 LayF6jM0nhr8in/t/XHnDg=
Received-SPF: none client-ip=212.227.17.10; envelope-from=laurent@vivier.eu;
 helo=mout.kundenserver.de
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_NONE=0.001 autolearn=ham autolearn_force=no
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
Cc: "qemu-trivial@nongnu.org" <qemu-trivial@nongnu.org>,
 Peter Maydell <peter.maydell@linaro.org>, Paolo Bonzini <pbonzini@redhat.com>,
 "Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
 "Michael S. Tsirkin" <mst@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Le 11/05/2021 à 05:29, Philippe Mathieu-Daudé a écrit :
> Hi Laurent,
> 
> I addressed your comments from v1, and this series is
> now reviewed. Can it get merged via your qemu-trivial tree?

Yes, but next time cc: trivial to be sure ;)

Applied to my trivial-patches branch.

Thanks,
Laurent

> On 5/2/21 6:39 PM, Philippe Mathieu-Daudé wrote:
>> Remove qemu_register_reset() when a qdev type has a qbus parent,
>> implementing the 3-phase Resettable interface.
>>
>> Since v2:
>> - Lower IRQ in 'hold' phase, not 'exit' one (Edgar)
>>
>> Since v1:
>> - Use 3-phase reset interface instead of qdev one (Laurent)
>>
>> Supersedes: <20210423233652.3042941-1-f4bug@amsat.org>
>>
>> Philippe Mathieu-Daudé (2):
>>   hw/timer/etraxfs_timer: Convert to 3-phase reset (Resettable
>>     interface)
>>   hw/rtc/mc146818rtc: Convert to 3-phase reset (Resettable interface)
>>
>>  hw/rtc/mc146818rtc.c     | 42 +++++++++++++++++++++-------------------
>>  hw/timer/etraxfs_timer.c | 14 +++++++++++---
>>  2 files changed, 33 insertions(+), 23 deletions(-)
>>


