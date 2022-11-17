Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2427862E2AB
	for <lists+qemu-devel@lfdr.de>; Thu, 17 Nov 2022 18:15:03 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1oviSx-0002tL-3v; Thu, 17 Nov 2022 12:14:19 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>) id 1oviSu-0002sv-OR
 for qemu-devel@nongnu.org; Thu, 17 Nov 2022 12:14:16 -0500
Received: from smtpout3.mo529.mail-out.ovh.net ([46.105.54.81])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>) id 1oviSs-0003WM-Bd
 for qemu-devel@nongnu.org; Thu, 17 Nov 2022 12:14:16 -0500
Received: from mxplan5.mail.ovh.net (unknown [10.108.1.249])
 by mo529.mail-out.ovh.net (Postfix) with ESMTPS id 05A301401732B;
 Thu, 17 Nov 2022 18:14:09 +0100 (CET)
Received: from kaod.org (37.59.142.107) by DAG4EX2.mxp5.local (172.16.2.32)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.16; Thu, 17 Nov
 2022 18:14:09 +0100
Authentication-Results: garm.ovh; auth=pass
 (GARM-107S001281b0407-9c4c-47f8-9661-eb725489ae51,
 AE5717285A2AC47C671D2CB192D1CF6730B7D7F3) smtp.auth=clg@kaod.org
X-OVh-ClientIp: 82.64.250.170
Message-ID: <2ec18c28-7c09-8210-ec40-62b563be5adc@kaod.org>
Date: Thu, 17 Nov 2022 18:14:08 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.1
Subject: Re: [PATCH v2 02/12] tests/avocado: improve behaviour waiting for
 login prompts
Content-Language: en-US
To: =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>
CC: <qemu-devel@nongnu.org>, <fam@euphon.net>, <berrange@redhat.com>,
 <f4bug@amsat.org>, <aurelien@aurel32.net>, <pbonzini@redhat.com>,
 <stefanha@redhat.com>, <crosa@redhat.com>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>, Wainer dos
 Santos Moschetta <wainersm@redhat.com>, Beraldo Leal <bleal@redhat.com>
References: <20221111145529.4020801-1-alex.bennee@linaro.org>
 <20221111145529.4020801-3-alex.bennee@linaro.org>
 <33e63f5c-8a32-8093-6ce8-2641d0d8e325@kaod.org> <87edu18xw5.fsf@linaro.org>
From: =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>
In-Reply-To: <87edu18xw5.fsf@linaro.org>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-Originating-IP: [37.59.142.107]
X-ClientProxiedBy: DAG4EX1.mxp5.local (172.16.2.31) To DAG4EX2.mxp5.local
 (172.16.2.32)
X-Ovh-Tracer-GUID: 1075eb4c-2ac0-4c93-903f-4b3472f3ecd3
X-Ovh-Tracer-Id: 7773494432890260472
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgedvgedrgeekgdeliecutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfqggfjpdevjffgvefmvefgnecuuegrihhlohhuthemucehtddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpefkffggfgfuvfevfhfhjggtgfhisehtkeertddtfeejnecuhfhrohhmpeevrogurhhitgcunfgvucfiohgrthgvrhcuoegtlhhgsehkrghougdrohhrgheqnecuggftrfgrthhtvghrnhepffdufeeliedujeeffffhjeffiefghffhhfdvkeeijeehledvueffhfejtdehgeegnecukfhppeduvdejrddtrddtrddupdefjedrheelrddugedvrddutdejnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehinhgvthepuddvjedrtddrtddruddpmhgrihhlfhhrohhmpeeotghlgheskhgrohgurdhorhhgqedpnhgspghrtghpthhtohepuddprhgtphhtthhopegrlhgvgidrsggvnhhnvggvsehlihhnrghrohdrohhrghdpqhgvmhhuqdguvghvvghlsehnohhnghhnuhdrohhrghdpfhgrmhesvghuphhhohhnrdhnvghtpdgsvghrrhgrnhhgvgesrhgvughhrghtrdgtohhmpdhfgegsuhhgsegrmhhsrghtrdhorhhgpdgruhhrvghlihgvnhesrghurhgvlhefvddrnhgvthdpphgsohhniihinhhisehrvgguhhgrthdrtghomhdpshhtvghfrghnhhgrsehrvgguhhgrthdrtghomhdptghrohhsrgesrhgvughhrghtrdgtohhmpdhphhhilhhmugeslh
 hinhgrrhhordhorhhgpdifrghinhgvrhhsmhesrhgvughhrghtrdgtohhmpdgslhgvrghlsehrvgguhhgrthdrtghomhdpoffvtefjohhsthepmhhohedvledpmhhouggvpehsmhhtphhouhht
Received-SPF: pass client-ip=46.105.54.81; envelope-from=clg@kaod.org;
 helo=smtpout3.mo529.mail-out.ovh.net
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

On 11/17/22 15:04, Alex Bennée wrote:
> 
> Cédric Le Goater <clg@kaod.org> writes:
> 
>> Hello Alex,
>>
>> On 11/11/22 15:55, Alex Bennée wrote:
>>> This attempts to deal with the problem of login prompts not being
>>> guaranteed to be terminated with a newline. The solution to this is to
>>> peek at the incoming data looking to see if we see an up-coming match
>>> before we fall back to the old readline() logic. The reason to mostly
>>> rely on readline is because I am occasionally seeing the peek stalling
>>> despite data being there.
>>> This seems kinda hacky and gross so I'm open to alternative
>>> approaches
>>> and cleaner python code.
>>> Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
>>> Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>
>>
>> I have pulled this patch in the aspeed tree hoping it would improve tests:
>>
>>    AST2x00MachineSDK.test_arm_ast2500_evb_sdk
>>    AST2x00MachineSDK.test_arm_ast2600_evb_sdk
>>
>> but the failure rate has increased :/ I have seen failures in these also :
>>
>>    AST2x00Machine.test_arm_ast2500_evb_buildroot
>>    AST2x00Machine.test_arm_ast2600_evb_buildroot
>>
>> which used to be quite stable.
>>
>> Sorry, this is not of much help. the issue might be elsewhere.
> 
> Do you see what is happening in the logs? I've made a couple of tweaks
> since and it gets through the negotiation but then timesout:
> 
>    console: looking for 22:(ast2600-default login:), sending None (always=False)
>    /console: [    0.939039] aspeed-pcie 1e7700c0.pcie: [1] : tx idle timeout [0]
>    -console: [    1.385144] spi-nor spi0.1: unrecognized JEDEC id bytes: 00 00 00 00 00 00
>    console: [    1.413028] spi-nor spi2.0: unrecognized JEDEC id bytes: 00 00 00 00 00 00
>    console: [    1.617539] aspeed-rtc 1e781000.rtc: hctosys: unable to read the hardware clock
>    -console: rofs = mtd4 squashfs rwfs = mtd5 jffs2
>    /console: [   14.563495] systemd[1]: Failed to find module 'autofs4'
>    -console: [   18.034371] systemd[176]: /lib/systemd/system-generators/systemd-gpt-auto-generator failed with exit status 1.
>    |console: [FAILED] Failed to start Intel Power Control for the Host 0.
>    /console: [FAILED] Failed to start Phosphor C…istening on device /dev/ttyS2.
>    console: [DEPEND] Dependency failed for Host logger for ttyS2.
>    -console: Phosphor OpenBMC (Phosphor OpenBMC Project Reference Distro) nodistro.0 ast2600-default ttyS4
>    console: ast2600-default login:
>     (always=False)g for 9:(Password:), sending root
>    console: root
>    |console: Password:
>     (always=False)g for 23:(root@ast2600-default:~#), sending 0penBmc
>    console: Login timed out after 60 seconds.
>    |console: Phosphor OpenBMC (Phosphor OpenBMC Project Reference Distro) nodistro.0 ast2600-default ttyS4
>    /avocado.test:

Same for me :

console: Starting kernel ...
console: looking for 22:(ast2600-default login:), sending None (always=False)
\console: [    0.845678] aspeed-pcie 1e7700c0.pcie: [1] : tx idle timeout [0]
|console: [    1.388468] spi-nor spi0.1: unrecognized JEDEC id bytes: 00 00 00 00 00 00
console: [    1.409448] spi-nor spi2.0: unrecognized JEDEC id bytes: 00 00 00 00 00 00
console: [    1.564132] aspeed-rtc 1e781000.rtc: hctosys: unable to read the hardware clock
\console: rofs = mtd4 squashfs rwfs = mtd5 jffs2
/console: [   12.708097] systemd[1]: Failed to find module 'autofs4'
|console: [   14.757409] systemd[177]: /lib/systemd/system-generators/systemd-gpt-auto-generator failed with exit status 1.
|console: [DEPEND] Dependency failed for Host logger for ttyS2.
\console: Phosphor OpenBMC (Phosphor OpenBMC Project Reference Distro) nodistro.0 ast2600-default ttyS4
console:
ast2600-default login:
  (always=False)g for 9:(Password:), sending root
console: root
-console: Password:
  (always=False)g for 23:(root@ast2600-default:~#), sending 0penBmc
INTERRUPTED: Test interrupted by SIGTERM\nRunner error occurred: Timeout reached\nOriginal status: ERROR\n{'name': '1-build/tests/avocado/machine_aspeed.py:AST2x00MachineSDK.test_arm_ast2600_evb_sdk', 'logdir': '/home/legoater/avocado/job-results/job-2022-11-17T18.03-780... (240.28 s)



