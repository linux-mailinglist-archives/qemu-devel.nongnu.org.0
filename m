Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 23C4968C258
	for <lists+qemu-devel@lfdr.de>; Mon,  6 Feb 2023 16:56:55 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pP3pd-0005UD-Tx; Mon, 06 Feb 2023 10:55:01 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>) id 1pP3pa-0005Tb-MW
 for qemu-devel@nongnu.org; Mon, 06 Feb 2023 10:54:58 -0500
Received: from 4.mo548.mail-out.ovh.net ([188.165.42.229])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>) id 1pP3pY-0002V7-M9
 for qemu-devel@nongnu.org; Mon, 06 Feb 2023 10:54:58 -0500
Received: from mxplan5.mail.ovh.net (unknown [10.108.16.128])
 by mo548.mail-out.ovh.net (Postfix) with ESMTPS id 49EB521112;
 Mon,  6 Feb 2023 15:54:52 +0000 (UTC)
Received: from kaod.org (37.59.142.98) by DAG4EX2.mxp5.local (172.16.2.32)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.17; Mon, 6 Feb
 2023 16:54:51 +0100
Authentication-Results: garm.ovh; auth=pass
 (GARM-98R00215416cc7-8e75-49ad-8e27-27be9608fe84,
 CF69EBA19D99189A5BFA69977647E68A070273F7) smtp.auth=clg@kaod.org
X-OVh-ClientIp: 82.64.250.170
Message-ID: <be61e573-1713-472c-899e-ac51b8a22345@kaod.org>
Date: Mon, 6 Feb 2023 16:54:46 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.1
Subject: Re: [PULL 03/38] pflash: Only read non-zero parts of backend image
Content-Language: en-US
To: Kevin Wolf <kwolf@redhat.com>, <qemu-block@nongnu.org>
CC: <peter.maydell@linaro.org>, <qemu-devel@nongnu.org>,
 =?UTF-8?Q?Daniel_P=2e_Berrang=c3=a9?= <berrange@redhat.com>, Xiang Zheng
 <zhengxiang9@huawei.com>
References: <20230120122633.84983-1-kwolf@redhat.com>
 <20230120122633.84983-4-kwolf@redhat.com>
From: =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>
In-Reply-To: <20230120122633.84983-4-kwolf@redhat.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-Originating-IP: [37.59.142.98]
X-ClientProxiedBy: DAG7EX2.mxp5.local (172.16.2.62) To DAG4EX2.mxp5.local
 (172.16.2.32)
X-Ovh-Tracer-GUID: ad3b7254-0bdd-4c41-920b-e8d6b28eb276
X-Ovh-Tracer-Id: 2507379094288304934
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgedvhedrudegiedgkedtucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuqfggjfdpvefjgfevmfevgfenuceurghilhhouhhtmecuhedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujfgurhepkfffgggfuffvvehfhfgjtgfgihesthekredttdefjeenucfhrhhomhepveorughrihgtucfnvgcuifhorghtvghruceotghlgheskhgrohgurdhorhhgqeenucggtffrrghtthgvrhhnpeeikeehkeehheejgfffkeffveegleduffeiteejuefgfedtjeekgefgveffveeigfenucffohhmrghinhepkhgvrhhnvghlrdhorhhgnecukfhppeduvdejrddtrddtrddupdefjedrheelrddugedvrdelkeenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepihhnvghtpeduvdejrddtrddtrddupdhmrghilhhfrhhomhepoegtlhhgsehkrghougdrohhrgheqpdhnsggprhgtphhtthhopedupdhrtghpthhtohepkhifohhlfhesrhgvughhrghtrdgtohhmpdhqvghmuhdqsghlohgtkhesnhhonhhgnhhurdhorhhgpdhpvghtvghrrdhmrgihuggvlhhlsehlihhnrghrohdrohhrghdpqhgvmhhuqdguvghvvghlsehnohhnghhnuhdrohhrghdpsggvrhhrrghnghgvsehrvgguhhgrthdrtghomhdpiihhvghnghigihgrnhhgleeshhhurgifvghirdgtohhmpdfovfetjfhoshhtpehmohehgeekpdhmohguvgepshhmthhpohhuth
Received-SPF: pass client-ip=188.165.42.229; envelope-from=clg@kaod.org;
 helo=4.mo548.mail-out.ovh.net
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-1.148,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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

Hello,

On 1/20/23 13:25, Kevin Wolf wrote:
> From: Xiang Zheng <zhengxiang9@huawei.com>
> 
> Currently we fill the VIRT_FLASH memory space with two 64MB NOR images
> when using persistent UEFI variables on virt board. Actually we only use
> a very small(non-zero) part of the memory while the rest significant
> large(zero) part of memory is wasted.
> 
> So this patch checks the block status and only writes the non-zero part
> into memory. This requires pflash devices to use sparse files for
> backends.
> 
> Signed-off-by: Xiang Zheng <zhengxiang9@huawei.com>
> 
> [ kraxel: rebased to latest master ]
> 
> Signed-off-by: Gerd Hoffmann <kraxel@redhat.com>
> Message-Id: <20221220084246.1984871-1-kraxel@redhat.com>
> Reviewed-by: Daniel P. Berrangé <berrange@redhat.com>
> Reviewed-by: Kevin Wolf <kwolf@redhat.com>
> Signed-off-by: Kevin Wolf <kwolf@redhat.com>

This newly merged patch introduces a "regression" when booting an Aspeed
machine. The following extra m25p80 patch (not yet merged) is required
for the issue to show:

   https://lore.kernel.org/qemu-devel/20221115151000.2080833-1-clg@kaod.org/

U-Boot fails to find the filesystem in that case.

It can be easily reproduced with the witherspoon-bmc machine and seems
to be related to the use of a UBI filesystem. Other Aspeed machines not
using UBI are not impacted.

Here is a tentative fix. I don't know enough the block layer to explain
what is happening :/

Thanks,

C.


@@ -39,7 +39,7 @@ static int blk_pread_nonzeroes(BlockBack
              return ret;
          }
          if (!(ret & BDRV_BLOCK_ZERO)) {
-            ret = bdrv_pread(bs->file, offset, bytes,
+            ret = blk_pread(blk, offset, bytes,
                               (uint8_t *) buf + offset, 0);
              if (ret < 0) {
                  return ret;

