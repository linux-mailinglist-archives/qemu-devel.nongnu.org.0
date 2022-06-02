Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3AB5B53BA1D
	for <lists+qemu-devel@lfdr.de>; Thu,  2 Jun 2022 15:52:33 +0200 (CEST)
Received: from localhost ([::1]:43460 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nwlFX-0007j2-UB
	for lists+qemu-devel@lfdr.de; Thu, 02 Jun 2022 09:52:31 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44412)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>) id 1nwlDj-0006CU-52
 for qemu-devel@nongnu.org; Thu, 02 Jun 2022 09:50:39 -0400
Received: from 8.mo552.mail-out.ovh.net ([46.105.37.156]:54725)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>) id 1nwlDg-0000qp-IN
 for qemu-devel@nongnu.org; Thu, 02 Jun 2022 09:50:38 -0400
Received: from mxplan5.mail.ovh.net (unknown [10.109.146.56])
 by mo552.mail-out.ovh.net (Postfix) with ESMTPS id 877CA240F3;
 Thu,  2 Jun 2022 13:50:31 +0000 (UTC)
Received: from kaod.org (37.59.142.108) by DAG4EX1.mxp5.local (172.16.2.31)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.9; Thu, 2 Jun 2022
 15:50:30 +0200
Authentication-Results: garm.ovh; auth=pass
 (GARM-108S0020be95c99-557b-4d2b-941a-ebcb2ec5eeaa,
 123C0E545D135716686AEE7B3F9DB382F3F098BA) smtp.auth=clg@kaod.org
X-OVh-ClientIp: 82.64.250.170
Message-ID: <00e2d10a-20f5-8357-5b13-41791940ce19@kaod.org>
Date: Thu, 2 Jun 2022 15:50:29 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.0
Subject: Re: [RFC PATCH v2 0/6] hw/i2c: i2c slave mode support
Content-Language: en-US
To: Klaus Jensen <its@irrelevant.dk>
CC: <qemu-devel@nongnu.org>, Jonathan Cameron <Jonathan.Cameron@huawei.com>,
 <qemu-arm@nongnu.org>, Peter Delevoryas <pdel@fb.com>, Peter Maydell
 <peter.maydell@linaro.org>, Corey Minyard <cminyard@mvista.com>, Padmakar
 Kalghatgi <p.kalghatgi@samsung.com>, Damien Hedde
 <damien.hedde@greensocs.com>, Andrew Jeffery <andrew@aj.id.au>, Joel Stanley
 <joel@jms.id.au>, Arun Kumar Kashinath Agasar <arun.kka@samsung.com>, Klaus
 Jensen <k.jensen@samsung.com>, Zev Weiss <zev@bewilderbeest.net>, Jae Hyun
 Yoo <quic_jaehyoo@quicinc.com>
References: <20220601210831.67259-1-its@irrelevant.dk>
 <6e0eb197-25c2-6b1e-2c19-f93597e29cff@kaod.org> <YphzHGNYErSMEfPw@apples>
From: =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>
In-Reply-To: <YphzHGNYErSMEfPw@apples>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-Originating-IP: [37.59.142.108]
X-ClientProxiedBy: DAG3EX2.mxp5.local (172.16.2.22) To DAG4EX1.mxp5.local
 (172.16.2.31)
X-Ovh-Tracer-GUID: dfb3b711-e93c-4f23-b6f2-0050d14d8d32
X-Ovh-Tracer-Id: 13846035582173809537
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgedvfedrledvgdeijecutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfqggfjpdevjffgvefmvefgnecuuegrihhlohhuthemucehtddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpefkffggfgfuvfevfhfhjggtgfhisehtkeertddtfeejnecuhfhrohhmpeevrogurhhitggpnfgvpgfiohgrthgvrhcuoegtlhhgsehkrghougdrohhrgheqnecuggftrfgrthhtvghrnhephfefveevgeeujefhtedtuedvjeetgfekffekjeegueetjefgudeileehtdethfdtnecuffhomhgrihhnpehkvghrnhgvlhdrohhrghdpghhithhhuhgsrdgtohhmnecukfhppedtrddtrddtrddtpdefjedrheelrddugedvrddutdeknecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmohguvgepshhmthhpohhuthdphhgvlhhopehmgihplhgrnhehrdhmrghilhdrohhvhhdrnhgvthdpihhnvghtpedtrddtrddtrddtpdhmrghilhhfrhhomheptghlgheskhgrohgurdhorhhgpdhnsggprhgtphhtthhopedupdhrtghpthhtohepqhhuihgtpghjrggvhhihohhosehquhhitghinhgtrdgtohhmpdfovfetjfhoshhtpehmohehhedv
Received-SPF: pass client-ip=46.105.37.156; envelope-from=clg@kaod.org;
 helo=8.mo552.mail-out.ovh.net
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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

On 6/2/22 10:21, Klaus Jensen wrote:
> On Jun  2 09:52, Cédric Le Goater wrote:
>> On 6/1/22 23:08, Klaus Jensen wrote:
>>> From: Klaus Jensen <k.jensen@samsung.com>
>>>
>>> Hi all,
>>>
>>> This RFC series adds I2C "slave mode" support for the Aspeed I2C
>>
>> I think you can remove the RFC prefix.
>>
>>> controller as well as the necessary infrastructure in the i2c core to
>>> support this.
>>>
>>> v2 changes
>>> ~~~~~~~~~~
>>> I finally got around to working on this again. I'm sorry for not
>>> bringing a v2 to the table earlier.
>>>
>>> Mad props to Peter and Jonathan for putting this series to work and
>>> pushing it forward! Thanks!
>>>
>>> This series is based off Cédric's aspeed-7.1 tree, so it includes the
>>> register fields. This is all "old register mode", but Peter seems to
>>> have added support in new mode.
>>>
>>> There are some loose ends of course, i.e send_async doesn't handle
>>> broadcast and asynchronous slaves being sent stuff can't nack. But I
>>> wanted to get some feedback on the interface before I tackle that.
>>>
>>> This series
>>> ~~~~~~~~~~~
>>> Patch 1 and 2 are small Aspeed I2C changes/additions.
>>>
>>> Patch 3 adds support for multiple masters in the i2c core, allowing
>>> slaves to master the bus and (safely) issue i2c_send/recv().
>>>
>>> Patch 4 adds an asynchronous send i2c_send_async(I2CBus *, uint8) on the
>>> bus that must be paired with an explicit ack using i2c_ack(I2CBus *). We
>>> have previously discussed how we wanted to handle the issue that some
>>> slaves implement this and some do not. Using a QOM interface was up, but
>>> couldn't figure out a good way to do it. I ended up decided against it
>>> since I believe this have to be a run-time check anyway. The problem is
>>> that a slave can master the bus and try to communicate with *anyone* on
>>> the bus - and there is no reason why we should only allow asynchronous
>>> slaves on the bus in that case, or whatever we would want to do when
>>> devices are plugged. So, instead, the current master can issue an
>>> i2c_start_send() and if that fails (because it isnt implemented by the
>>> target slave) it can either bail out or use i2c_start_send_async() if it
>>> itself supports it. This works the other way around as well of course,
>>> but it is probably simpler to handle slaves that respond to
>>> i2c_start_send(). This approach relies on adding a new i2c_event, which
>>> is why a bunch of other devices needs changes in their event handling.
>>>
>>> Patch 5 adds *partial* slave mode functionality to the emulated Aspeed
>>> I2C controller, that is, it only supports asynchronous sends started by
>>> another slave that is currently mastering the bus. No asynchronous
>>> receive.
>>
>> If there are no objections, I think this is a good way to move forward
>> and improve this initial implementation when the need arises.
>>
> 
> There is an outstanding issue with the SLAVE_ADDR_RX_MATCH interrupt bit
> (bit 7). Remember from my first series I had a workaround to make sure
> it wasnt masked.
> 
> I posted this upstream to linux
> 
>    https://lore.kernel.org/lkml/20220602054842.122271-1-its@irrelevant.dk/
> 
> Not sure if that is the right way to fix it. 

That's weird. I would have thought it was already enabled [ Adding Jae ]

> You mentioned something about "fixing" a mask on the ast2600?

This can be addressed later.

The model could be more precise since the driver is masking the value
already we should be fine. See commit 3fb2e2aeafb2 ("i2c: aspeed: disable
additional device addresses on ast2[56]xx") from Zeiv.

 From the datasheet.
On the AST2400 (only 1 slave address)

   * no upper bits

On the AST2500 (2 possible slave addresses),

   * bit[31] : Slave Address match indicator
   * bit[30] : Slave Address Receiving pending

On the AST2600 (3 possible slave addresses),

   * bit[31-30] : Slave Address match indicator
   * bit[29] : Slave Address Receiving pending

Thanks,

C.

> 
> But with the above patch, all works an intended and no "workaround"
> required.
> 
>>> Finally, patch 6 adds an example device using this new API. The device
>>> is a simple "echo" device that upon being sent a set of bytes uses the
>>> first byte as the address of the slave to echo to.
>>>
>>> With this combined I am able to boot up Linux on an emulated Aspeed 2600
>>> evaluation board and have the i2c echo device write into a Linux slave
>>> EEPROM. Assuming the echo device is on address 0x42:
>>>
>>>     # echo slave-24c02 0x1064 > /sys/bus/i2c/devices/i2c-15/new_device
>>>     i2c i2c-15: new_device: Instantiated device slave-24c02 at 0x64
>>>     # i2cset -y 15 0x42 0x64 0x00 0xaa i
>>>     # hexdump /sys/bus/i2c/devices/15-1064/slave-eeprom
>>>     0000000 ffaa ffff ffff ffff ffff ffff ffff ffff
>>>     0000010 ffff ffff ffff ffff ffff ffff ffff ffff
>>>     *
>>>     0000100
>>
>> I have started working on buildroot images  :
>>
>>    https://github.com/legoater/buildroot/commits/aspeed
>>
>> The resulting files are quite small :
>>
>>      $ ll output/images/
>>      total 86040
>>      drwxr-xr-x 2 legoater legoater     4096 Jun  1 20:01 ./
>>      drwxrwxr-x 6 legoater legoater     4096 Jun  1 19:40 ../
>>      -rwxr-xr-x 1 legoater legoater    36837 Jun  1 20:01 aspeed-ast2600-evb.dtb*
>>      -rw-r--r-- 1 legoater legoater 67108864 Jun  1 20:01 flash.img
>>      -rw-r--r-- 1 legoater legoater  6682796 Jun  1 20:01 image.itb
>>      -rw-r--r-- 1 legoater legoater     1846 Jun  1 20:01 image.its
>>      -rw-r--r-- 1 legoater legoater  3168768 Jun  1 20:01 rootfs.cpio
>>      -rw-r--r-- 1 legoater legoater  1026660 Jun  1 20:01 rootfs.cpio.xz
>>      -rw-r--r-- 1 legoater legoater  3788800 Jun  1 20:01 rootfs.tar
>>      -rw-r--r-- 1 legoater legoater   653777 Jun  1 20:00 u-boot.bin
>>      -rw-r--r-- 1 legoater legoater  5617280 Jun  1 20:01 zImage
>>
>> I will probably host them on GH and we could use them under avocado
>> to extend the tests.
>>
>>
>> They should boot real HW. I will submit the defconfigs to buildroot
>> after more tests and cleanups.
>>
> 
> Nice!


