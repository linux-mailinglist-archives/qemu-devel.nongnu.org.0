Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E52E76E5F3B
	for <lists+qemu-devel@lfdr.de>; Tue, 18 Apr 2023 12:58:52 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1poj1W-0005hO-BH; Tue, 18 Apr 2023 06:57:22 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <qianfanguijin@163.com>)
 id 1poj1S-0005gV-MG; Tue, 18 Apr 2023 06:57:18 -0400
Received: from m12.mail.163.com ([220.181.12.216])
 by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <qianfanguijin@163.com>)
 id 1poj1G-0001bY-Q4; Tue, 18 Apr 2023 06:57:18 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
 s=s110527; h=Message-ID:Date:MIME-Version:Subject:From:
 Content-Type; bh=InfjB9iOWo/v3KyhBZ2XxdEOVb5O0uNfEoQ96UeV5Do=;
 b=Z2S8QO6YJNQW2f2HNThsTQqKFlumFKYRsIirsdn6epVSr7ZaFWoIRQsCTNjsbR
 4bX+8l3JB+OJya/lxk65fBGomMlShwEW5SM87mN16CSGFJv7Huw2YLKTynKI8SCu
 v4pfgl/C1dlq1P+PU3ftzLzIlB/wj8P3MihAaPPmXu/aU=
Received: from [172.21.25.67] (unknown [218.201.129.19])
 by zwqz-smtp-mta-g5-3 (Coremail) with SMTP id _____wBnnXVudz5kdxJKBw--.47676S2;
 Tue, 18 Apr 2023 18:56:46 +0800 (CST)
Message-ID: <0f6e9f22-cc16-065f-976e-657359297928@163.com>
Date: Tue, 18 Apr 2023 18:56:46 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.0
Subject: Re: [PATCH v2 08/12] hw: arm: allwinner-r40: Fix the mmc controller's
 type
To: Niek Linnenbank <nieklinnenbank@gmail.com>
Cc: qemu-arm@nongnu.org, qemu-devel@nongnu.org,
 Strahinja Jankovic <strahinja.p.jankovic@gmail.com>,
 Peter Maydell <peter.maydell@linaro.org>,
 Beniamino Galvani <b.galvani@gmail.com>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
References: <20230328054654.18620-1-qianfanguijin@163.com>
 <20230328054654.18620-9-qianfanguijin@163.com>
 <CAPan3WrcM_tyfsVQNkZxtpj3pse6O58Nvkcwg7X=XHYt+seGgQ@mail.gmail.com>
Content-Language: en-US
From: qianfan <qianfanguijin@163.com>
In-Reply-To: <CAPan3WrcM_tyfsVQNkZxtpj3pse6O58Nvkcwg7X=XHYt+seGgQ@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CM-TRANSID: _____wBnnXVudz5kdxJKBw--.47676S2
X-Coremail-Antispam: 1Uf129KBjvJXoW7WrW8Zw1xCr1ktF43XF1DWrg_yoW8JF4xpF
 9xCay3KFZ0gay5AF12grn7Za48WayDWr40kanY9r9rXFyDGwnaqrW8tw45CFWkGr45Ca1S
 vwsagF40qFn8ZFDanT9S1TB71UUUUUUqnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
 9KBjDUYxBIdaVFxhVjvjDU0xZFpf9x07URE_iUUUUU=
X-Originating-IP: [218.201.129.19]
X-CM-SenderInfo: htld0w5dqj3xxmlqqiywtou0bp/1tbiXRJV7VWBpR1G8AAAst
Received-SPF: pass client-ip=220.181.12.216;
 envelope-from=qianfanguijin@163.com; helo=m12.mail.163.com
X-Spam_score_int: -43
X-Spam_score: -4.4
X-Spam_bar: ----
X-Spam_report: (-4.4 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 NICE_REPLY_A=-2.284, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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



在 2023/4/7 3:22, Niek Linnenbank 写道:
> Hi Qianfan Zhao,
>
> Is this change really needed as a separate patch?
> Looks like it would make sense just to squash it with the original 
> patch 01?
The class type of TYPE_AW_SDHOST_SUN50I_A64 was introduced when patch-07.
Add patch-01 doesn't has that class.

So this is following the previous patch.
>
> Regards,
> Niek
>
> On Tue, Mar 28, 2023 at 7:47 AM <qianfanguijin@163.com> wrote:
>
>     From: qianfan Zhao <qianfanguijin@163.com>
>
>     R40 has SAMP_DL_REG register and mmc2 controller has only 8K dma
>     buffer.
>     Fix it's compatible string.
>
>     Signed-off-by: qianfan Zhao <qianfanguijin@163.com>
>     ---
>      hw/arm/allwinner-r40.c | 2 +-
>      1 file changed, 1 insertion(+), 1 deletion(-)
>
>     diff --git a/hw/arm/allwinner-r40.c b/hw/arm/allwinner-r40.c
>     index 0e4542d35f..b148c56449 100644
>     --- a/hw/arm/allwinner-r40.c
>     +++ b/hw/arm/allwinner-r40.c
>     @@ -271,7 +271,7 @@ static void allwinner_r40_init(Object *obj)
>
>          for (int i = 0; i < AW_R40_NUM_MMCS; i++) {
>              object_initialize_child(obj, mmc_names[i], &s->mmc[i],
>     -                                TYPE_AW_SDHOST_SUN5I);
>     +                                TYPE_AW_SDHOST_SUN50I_A64);
>          }
>
>          object_initialize_child(obj, "twi0", &s->i2c0,
>     TYPE_AW_I2C_SUN6I);
>     -- 
>     2.25.1
>
>
>
> -- 
> Niek Linnenbank
>


