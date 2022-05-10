Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 81431520E51
	for <lists+qemu-devel@lfdr.de>; Tue, 10 May 2022 09:20:56 +0200 (CEST)
Received: from localhost ([::1]:34426 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1noKAt-0007Xh-PS
	for lists+qemu-devel@lfdr.de; Tue, 10 May 2022 03:20:51 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49838)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>) id 1noK68-0005lq-EK
 for qemu-devel@nongnu.org; Tue, 10 May 2022 03:15:56 -0400
Received: from 6.mo548.mail-out.ovh.net ([188.165.58.48]:44179)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>) id 1noK65-0005GA-IU
 for qemu-devel@nongnu.org; Tue, 10 May 2022 03:15:56 -0400
Received: from mxplan5.mail.ovh.net (unknown [10.108.4.25])
 by mo548.mail-out.ovh.net (Postfix) with ESMTPS id 84B08212A6;
 Tue, 10 May 2022 07:15:49 +0000 (UTC)
Received: from kaod.org (37.59.142.99) by DAG4EX1.mxp5.local (172.16.2.31)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.6; Tue, 10 May
 2022 09:15:48 +0200
Authentication-Results: garm.ovh; auth=pass
 (GARM-99G0031dcf8f1d-e994-411d-bb55-0e2cba802906,
 1EE4DC631931028654B42CA219073376F40F54F0) smtp.auth=clg@kaod.org
X-OVh-ClientIp: 82.64.250.170
Message-ID: <cae0e46b-af2c-88ff-fa45-8362abc25886@kaod.org>
Date: Tue, 10 May 2022 09:15:48 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.0
Subject: Re: [RFC PATCH 11/17] hw/sd: Add eMMC support
Content-Language: en-US
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
CC: Vincent Palatin <vpalatin@chromium.org>, <qemu-block@nongnu.org>, Bin Meng
 <bin.meng@windriver.com>, <qemu-devel@nongnu.org>, Joel Stanley
 <joel@jms.id.au>
References: <20220318132824.1134400-1-clg@kaod.org>
 <20220318132824.1134400-12-clg@kaod.org>
 <ce8fcf3f-c56b-ed68-bd5a-7e599b951aa6@amsat.org>
From: =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>
In-Reply-To: <ce8fcf3f-c56b-ed68-bd5a-7e599b951aa6@amsat.org>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-Originating-IP: [37.59.142.99]
X-ClientProxiedBy: DAG1EX1.mxp5.local (172.16.2.1) To DAG4EX1.mxp5.local
 (172.16.2.31)
X-Ovh-Tracer-GUID: 7dbadc16-5026-4590-b8e7-33bdd38299be
X-Ovh-Tracer-Id: 1235393676886182694
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgedvfedrgedtgdduudelucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuqfggjfdpvefjgfevmfevgfenuceurghilhhouhhtmecuhedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujfgurhepkfffgggfuffvvehfhfgjtgfgihesthekredttdefjeenucfhrhhomhepveorughrihgtpgfnvggpifhorghtvghruceotghlgheskhgrohgurdhorhhgqeenucggtffrrghtthgvrhhnpeejgfeluefgkeejleetvdeffefggeetvdelhfelffdujeffleduhfduuddvtdevudenucffohhmrghinhepohhpvghnsghmtgdrohhrghenucfkpheptddrtddrtddrtddpfeejrdehledrudegvddrleelnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmohguvgepshhmthhpohhuthdphhgvlhhopehmgihplhgrnhehrdhmrghilhdrohhvhhdrnhgvthdpihhnvghtpedtrddtrddtrddtpdhmrghilhhfrhhomheptghlgheskhgrohgurdhorhhgpdhnsggprhgtphhtthhopedupdhrtghpthhtohepjhhovghlsehjmhhsrdhiugdrrghu
Received-SPF: pass client-ip=188.165.58.48; envelope-from=clg@kaod.org;
 helo=6.mo548.mail-out.ovh.net
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

[ ... ]


> Do you mind splitting as:
> 
> - Add TYPE_EMMC, emmc_class_init and sd_proto_emmc[] with
>    already existing handlers (1 patch)
> 
> - Add new handlers, from smaller to sd_emmc_set_csd(),
>    and finally mmc_set_ext_csd() with the EXT_CSD definitions
>    (various patches).

Sure, I will reorganize the patchset. It will ease the review.

> Otherwise LGTM!
> 
> What is your test suite?

Not simple.

Get the latest FW images for the rainier platform from :

   https://jenkins.openbmc.org/view/latest/job/latest-master/label=docker-builder,target=p10bmc/lastSuccessfulBuild/artifact/openbmc/build/tmp/deploy/images/p10bmc/

and build a bootable eMMC with such a sequence :

   dd of=$mmc if=/dev/zero bs=1M count=128
   dd of=$mmc if=${fw_dir}/u-boot-spl.bin conv=notrunc
   dd of=$mmc if=${fw_dir}/u-boot.bin conv=notrunc bs=1K seek=64
   dd of=$mmc if=${fw_dir}/u-boot-env.bin conv=notrunc bs=1K seek=$((896 + 64))
     
   xzdec $wicxz | dd status=progress of=$mmc conv=notrunc bs=1M seek=2
   truncate --size 16G $mmc

We could have a smaller image with a buildroot rootfs.

Then, boot with:

   qemu-system-arm -M rainier-bmc -net nic,netdev=net0 -netdev user \
	-drive file=$mmc.qcow2,format=qcow2,if=sd,id=sd0,index=2

The Aspeed machines (AST2600) can boot from flash or eMMC and the above
command line does the trick. It is not optimal.


Thanks,

C.

