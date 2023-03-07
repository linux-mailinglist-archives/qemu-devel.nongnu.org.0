Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0EEBA6AE20F
	for <lists+qemu-devel@lfdr.de>; Tue,  7 Mar 2023 15:22:16 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pZYCH-0007jf-6p; Tue, 07 Mar 2023 09:21:45 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>) id 1pZYCD-0007gq-Gi
 for qemu-devel@nongnu.org; Tue, 07 Mar 2023 09:21:41 -0500
Received: from 8.mo548.mail-out.ovh.net ([46.105.45.231])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>) id 1pZYCB-0005WM-Se
 for qemu-devel@nongnu.org; Tue, 07 Mar 2023 09:21:41 -0500
Received: from mxplan5.mail.ovh.net (unknown [10.109.143.206])
 by mo548.mail-out.ovh.net (Postfix) with ESMTPS id 2591320AA4;
 Tue,  7 Mar 2023 14:21:32 +0000 (UTC)
Received: from kaod.org (37.59.142.96) by DAG4EX2.mxp5.local (172.16.2.32)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.21; Tue, 7 Mar
 2023 15:21:31 +0100
Authentication-Results: garm.ovh; auth=pass
 (GARM-96R0012af7e8f4-6b7e-4a7d-9716-0a1d6ded60f8,
 D586700EEA543FC8D630564B717DAE7078976E4F) smtp.auth=clg@kaod.org
X-OVh-ClientIp: 82.64.250.170
Message-ID: <f8e228dc-3f96-1a5c-feaf-0a9bba08ab1a@kaod.org>
Date: Tue, 7 Mar 2023 15:21:31 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Subject: Re: [PATCH] pflash: Fix blk_pread_nonzeroes()
Content-Language: en-US
To: Kevin Wolf <kwolf@redhat.com>, <qemu-block@nongnu.org>
CC: <kraxel@redhat.com>, <berrange@redhat.com>, <zhengxiang9@huawei.com>,
 <mail@maciej.szmigiero.name>, <qemu-devel@nongnu.org>
References: <20230307140230.59158-1-kwolf@redhat.com>
From: =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>
In-Reply-To: <20230307140230.59158-1-kwolf@redhat.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-Originating-IP: [37.59.142.96]
X-ClientProxiedBy: DAG7EX1.mxp5.local (172.16.2.61) To DAG4EX2.mxp5.local
 (172.16.2.32)
X-Ovh-Tracer-GUID: deba3aa7-6377-4611-932e-b8cad68565e5
X-Ovh-Tracer-Id: 5218546072025533289
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgedvhedrvddutddgheekucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuqfggjfdpvefjgfevmfevgfenuceurghilhhouhhtmecuhedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujfgurhepkfffgggfuffvvehfhfgjtgfgihesthekredttdefjeenucfhrhhomhepveorughrihgtucfnvgcuifhorghtvghruceotghlgheskhgrohgurdhorhhgqeenucggtffrrghtthgvrhhnpeffudefleeiudejfeffhfejffeigffhhffhvdekieejheelvdeufffhjedtheeggeenucfkphepuddvjedrtddrtddruddpfeejrdehledrudegvddrleeinecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehinhgvthepuddvjedrtddrtddruddpmhgrihhlfhhrohhmpeeotghlgheskhgrohgurdhorhhgqedpnhgspghrtghpthhtohepuddprhgtphhtthhopehkfiholhhfsehrvgguhhgrthdrtghomhdpqhgvmhhuqdgslhhotghksehnohhnghhnuhdrohhrghdpkhhrrgigvghlsehrvgguhhgrthdrtghomhdpsggvrhhrrghnghgvsehrvgguhhgrthdrtghomhdpiihhvghnghigihgrnhhgleeshhhurgifvghirdgtohhmpdhmrghilhesmhgrtghivghjrdhsiihmihhgihgvrhhordhnrghmvgdpqhgvmhhuqdguvghvvghlsehnohhnghhnuhdrohhrghdpoffvtefjohhsthepmhhoheegkedpmhhouggvpehsmhhtphhouhht
Received-SPF: pass client-ip=46.105.45.231; envelope-from=clg@kaod.org;
 helo=8.mo548.mail-out.ovh.net
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
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

On 3/7/23 15:02, Kevin Wolf wrote:
> Commit a4b15a8b introduced a new function blk_pread_nonzeroes(). Instead
> of reading directly from the root node of the BlockBackend, it reads
> from its 'file' child node. This can happen to mostly work for raw
> images (as long as the 'raw' format driver is in use, but not actually
> doing anything), but it breaks everything else.
> 
> Fix it to read from the root node instead.
> 
> Fixes: a4b15a8b9ef25b44fa92a4825312622600c1f37c
> Reported-by: Cédric Le Goater <clg@kaod.org>
> Signed-off-by: Kevin Wolf <kwolf@redhat.com>

I have a couple of extra patches for 8.0. I can include this fix if no one does.

Thanks,

C.



> ---
>   hw/block/block.c | 3 +--
>   1 file changed, 1 insertion(+), 2 deletions(-)
> 
> diff --git a/hw/block/block.c b/hw/block/block.c
> index af0710e477..9f52ee6e72 100644
> --- a/hw/block/block.c
> +++ b/hw/block/block.c
> @@ -39,8 +39,7 @@ static int blk_pread_nonzeroes(BlockBackend *blk, hwaddr size, void *buf)
>               return ret;
>           }
>           if (!(ret & BDRV_BLOCK_ZERO)) {
> -            ret = bdrv_pread(bs->file, offset, bytes,
> -                             (uint8_t *) buf + offset, 0);
> +            ret = blk_pread(blk, offset, bytes, (uint8_t *) buf + offset, 0);
>               if (ret < 0) {
>                   return ret;
>               }


