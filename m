Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5533D4E99DC
	for <lists+qemu-devel@lfdr.de>; Mon, 28 Mar 2022 16:38:32 +0200 (CEST)
Received: from localhost ([::1]:42800 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nYqVr-00006E-E1
	for lists+qemu-devel@lfdr.de; Mon, 28 Mar 2022 10:38:31 -0400
Received: from eggs.gnu.org ([209.51.188.92]:43534)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>)
 id 1nYq88-0001Eu-Di; Mon, 28 Mar 2022 10:14:01 -0400
Received: from 5.mo552.mail-out.ovh.net ([188.165.45.220]:35663)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>)
 id 1nYq85-0006ah-5F; Mon, 28 Mar 2022 10:13:59 -0400
Received: from mxplan5.mail.ovh.net (unknown [10.108.1.179])
 by mo552.mail-out.ovh.net (Postfix) with ESMTPS id BE1D526FB1;
 Mon, 28 Mar 2022 14:13:52 +0000 (UTC)
Received: from kaod.org (37.59.142.98) by DAG4EX1.mxp5.local (172.16.2.31)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.24; Mon, 28 Mar
 2022 16:13:52 +0200
Authentication-Results: garm.ovh; auth=pass
 (GARM-98R0025545a2f7-e1d3-4446-b257-bd23ea724bce,
 26BDE5DCC9D641057CC543FCC51E49565A23663A) smtp.auth=clg@kaod.org
X-OVh-ClientIp: 82.64.250.170
Message-ID: <4a723bad-e0bf-f987-456c-d994e45aa018@kaod.org>
Date: Mon, 28 Mar 2022 16:13:51 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
Subject: Re: [RFC PATCH 11/17] hw/sd: Add eMMC support
Content-Language: en-US
To: Jerome Forissier <jerome.forissier@linaro.org>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
References: <20220318132824.1134400-1-clg@kaod.org>
 <20220318132824.1134400-12-clg@kaod.org>
 <4c2faa25-d7b3-1a69-587f-f93183327f91@linaro.org>
From: =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>
In-Reply-To: <4c2faa25-d7b3-1a69-587f-f93183327f91@linaro.org>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-Originating-IP: [37.59.142.98]
X-ClientProxiedBy: DAG4EX2.mxp5.local (172.16.2.32) To DAG4EX1.mxp5.local
 (172.16.2.31)
X-Ovh-Tracer-GUID: e036b74f-8d51-4e04-91fd-10db3e034be9
X-Ovh-Tracer-Id: 14024209243824819049
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgedvvddrudehjedgjeegucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuqfggjfdpvefjgfevmfevgfenuceurghilhhouhhtmecuhedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujfgurhepkfffgggfuffvfhfhjggtgfhisehtkeertddtfeejnecuhfhrohhmpeevrogurhhitggpnfgvpgfiohgrthgvrhcuoegtlhhgsehkrghougdrohhrgheqnecuggftrfgrthhtvghrnhepledtueejieeffeffhfeiheeuhfekvdfhkeevveeiteduledtiefhueeifeeijeegnecuffhomhgrihhnpehgihhthhhusgdrtghomhdpkhgrohgurdhorhhgpdhophgvnhgsmhgtrdhorhhgnecukfhppedtrddtrddtrddtpdefjedrheelrddugedvrdelkeenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhhouggvpehsmhhtphhouhhtpdhhvghlohepmhigphhlrghnhedrmhgrihhlrdhovhhhrdhnvghtpdhinhgvtheptddrtddrtddrtddpmhgrihhlfhhrohhmpegtlhhgsehkrghougdrohhrghdpnhgspghrtghpthhtohepuddprhgtphhtthhopehjohgvlhesjhhmshdrihgurdgruh
Received-SPF: pass client-ip=188.165.45.220; envelope-from=clg@kaod.org;
 helo=5.mo552.mail-out.ovh.net
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Cc: Bin Meng <bin.meng@windriver.com>, Vincent Palatin <vpalatin@chromium.org>,
 qemu-devel@nongnu.org, qemu-block@nongnu.org, Joel Stanley <joel@jms.id.au>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Hello Jerome,

On 3/28/22 14:10, Jerome Forissier wrote:
> Hi Cédric,
> 
> On 3/18/22 14:28, Cédric Le Goater wrote:
>> The initial eMMC support from Vincent Palatin was largely reworked to
>> match the current SD framework. The parameters mimick a real 4GB eMMC,
>> but it can be set to various sizes.
>>
>> This adds a new QOM object class for EMMC devices.
> 
> That is interesting. 

This series is really a pre-pre-alpha-0. It's a mixed of changes from
Joel and I on top of Vincent Palatin patches sent ~10 years ago. I
reworked them recently to take into account a proposal of Philippe to
improve the sd models and possibly add eMMC support. They are good
enough to boot a rainier-bmc board.

> Is RPMB emulation implemented? I doesn't look like so, although...

no. it's not.

> 
> 
>> +    sd->ext_csd[EXT_CSD_RPMB_MULT] = 0x1; /* RPMB size */
> 
> ...this indicates that the device has one block (128 KB) of RPMB if I'm
> not mistaken.
> 
> 
> I would be quite interested in testing and possibly helping out
> implement RPMB, although I must admit don't know much about QEMU
> internals. I have written some quick & dirty emulation code for RPMB at
> the Linux ioctl() level, see [1]. This code is useful for CI testing of
> the OP-TEE OS project [2], but having a lower level emulation in QEMU
> would be much better since the Linux kernel would "see" the device and
> report it in sysfs etc.
> 
> [1] https://github.com/OP-TEE/optee_client/blob/3.16.0/tee-supplicant/src/rpmb.c#L494-L571
> [2] https://github.com/OP-TEE/optee_os/


You can give these patches a try using this branch:

   https://github.com/legoater/qemu/commits/aspeed-7.0

Using the above QEMU, I would run a rainier-bmc machine which requires eMMC
support :

   qemu-system-arm -M rainier-bmc \
	-nic user,mac=C0:FF:EE:00:00:02,hostfwd=::2222-:22 \
	-drive file=/path/to/mmc-p10bmc.qcow2,format=qcow2,if=sd,id=sd0,index=2 \
         -nographic -nodefaults -snapshot -serial mon:stdio
	
The bootable qcow2 image :

   https://www.kaod.org/qemu/aspeed/mmc-p10bmc.qcow2

was created from :

   https://jenkins.openbmc.org/view/latest/job/latest-master/label=docker-builder,target=p10bmc/lastSuccessfulBuild/artifact/openbmc/build/tmp/deploy/images/p10bmc/

Booting from the eMMC is a topic by itself but instead of booting
from the eMMC, I would use a custom kernel and userspace.

Compile an AST2600 kernel or grab :

   https://www.kaod.org/qemu/aspeed/zImage
   https://www.kaod.org/qemu/aspeed/aspeed-bmc-ibm-rainier.dtb

Compile a buildroot image or grab :

   https://www.kaod.org/qemu/aspeed/rootfs.cpio.xz
   
and run :

   qemu-system-arm -M rainier-bmc \
	-kernel /path/to/linux/build_ast2600/arch/arm/boot/zImage \
	-initrd /path/to/rootfs.cpio.xz \
	-dtb /path/to/linux/build_ast2600/arch/arm/boot/dts/aspeed-bmc-ibm-rainier.dtb \
	-append 'console=ttyS4,115200n8 root=/dev/ram ro' \
	-nic user,mac=C0:FF:EE:00:00:02,hostfwd=::2222-:22 \
	-drive file=/path/to/mmc-p10bmc.qcow2,format=qcow2,if=sd,id=sd0,index=2 \
         -nographic -nodefaults -serial mon:stdio
  
root/0penBmc to login.

 From there, modify the kernel and the buildroot image, you can scp
some binary, do your testing and possibly send patches to improve QEMU
support !

C.





