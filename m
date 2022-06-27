Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7107555BAA2
	for <lists+qemu-devel@lfdr.de>; Mon, 27 Jun 2022 17:05:02 +0200 (CEST)
Received: from localhost ([::1]:59124 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o5qIP-0007hM-Es
	for lists+qemu-devel@lfdr.de; Mon, 27 Jun 2022 11:05:01 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34068)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <quic_jaehyoo@quicinc.com>)
 id 1o5qFL-0006LX-7O; Mon, 27 Jun 2022 11:01:51 -0400
Received: from alexa-out-sd-01.qualcomm.com ([199.106.114.38]:2159)
 by eggs.gnu.org with esmtps (TLS1.2:RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <quic_jaehyoo@quicinc.com>)
 id 1o5qFF-0007En-4s; Mon, 27 Jun 2022 11:01:50 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=quicinc.com; i=@quicinc.com; q=dns/txt; s=qcdkim;
 t=1656342105; x=1687878105;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=0NK8q537xL4KMcS0Yj8KK59uWHlo4yFRuPtrNOFIwDM=;
 b=qSwUglEYSxs8GKblAGy8yczJ1FJvqwwpb7vQB6nWqucjlDIpVcUaAExT
 uIp1Iac2zyCcEwntkYpcrGMycEJ8gjUhzmJSCnGMVN94kEQGLhedVtJ1o
 q1NVEdHm+dHde7MVmQ4mZeodEWr/S5IGUwur+5yfK7iLC/2YoecY1Z2b4 Y=;
Received: from unknown (HELO ironmsg05-sd.qualcomm.com) ([10.53.140.145])
 by alexa-out-sd-01.qualcomm.com with ESMTP; 27 Jun 2022 08:01:43 -0700
X-QCInternal: smtphost
Received: from nasanex01c.na.qualcomm.com ([10.47.97.222])
 by ironmsg05-sd.qualcomm.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Jun 2022 08:01:42 -0700
Received: from nalasex01a.na.qualcomm.com (10.47.209.196) by
 nasanex01c.na.qualcomm.com (10.47.97.222) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.986.22; Mon, 27 Jun 2022 08:01:41 -0700
Received: from [10.110.86.108] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.986.22; Mon, 27 Jun
 2022 08:01:40 -0700
Message-ID: <ea4b6f94-e06b-4040-08f1-ca717b95bd9b@quicinc.com>
Date: Mon, 27 Jun 2022 08:01:39 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.10.0
Subject: Re: [PATCH 3/9] hw/arm/aspeed: qcom-dc-scm-v1: add block backed FRU
 device
Content-Language: en-US
To: Patrick Venture <venture@google.com>, =?UTF-8?Q?C=c3=a9dric_Le_Goater?=
 <clg@kaod.org>
CC: Hao Wu <wuhaotsh@google.com>, Peter Maydell <peter.maydell@linaro.org>,
 Titus Rwantare <titusr@google.com>, Andrew Jeffery <andrew@aj.id.au>, "Joel
 Stanley" <joel@jms.id.au>, Graeme Gregory <quic_ggregory@quicinc.com>,
 Maheswara Kurapati <quic_mkurapat@quicinc.com>, qemu-arm
 <qemu-arm@nongnu.org>, QEMU Developers <qemu-devel@nongnu.org>, "Peter
 Delevoryas" <pdel@fb.com>
References: <20220622172830.101210-1-quic_jaehyoo@quicinc.com>
 <20220622172830.101210-4-quic_jaehyoo@quicinc.com>
 <CAO=notzsLW=F6QDu5mAhBCXNMocV1_qF3EazHYLoP_mu8e8QFg@mail.gmail.com>
 <f4d49ce6-f4b6-66fa-e980-43c185652981@kaod.org>
 <CAO=notyrQ3697_79_HtGCO6MryA72LHhaAvf75QLpdR5LH+O4w@mail.gmail.com>
From: Jae Hyun Yoo <quic_jaehyoo@quicinc.com>
In-Reply-To: <CAO=notyrQ3697_79_HtGCO6MryA72LHhaAvf75QLpdR5LH+O4w@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
Received-SPF: pass client-ip=199.106.114.38;
 envelope-from=quic_jaehyoo@quicinc.com; helo=alexa-out-sd-01.qualcomm.com
X-Spam_score_int: -43
X-Spam_score: -4.4
X-Spam_bar: ----
X-Spam_report: (-4.4 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_MED=-2.3, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 6/23/2022 10:37 AM, Patrick Venture wrote:
> 
> 
> On Thu, Jun 23, 2022 at 10:16 AM Cédric Le Goater <clg@kaod.org 
> <mailto:clg@kaod.org>> wrote:
> 
>     On 6/23/22 17:28, Patrick Venture wrote:
>      >
>      >
>      > On Wed, Jun 22, 2022 at 10:48 AM Jae Hyun Yoo
>     <quic_jaehyoo@quicinc.com <mailto:quic_jaehyoo@quicinc.com>
>     <mailto:quic_jaehyoo@quicinc.com <mailto:quic_jaehyoo@quicinc.com>>>
>     wrote:
>      >
>      >     From: Graeme Gregory <quic_ggregory@quicinc.com
>     <mailto:quic_ggregory@quicinc.com> <mailto:quic_ggregory@quicinc.com
>     <mailto:quic_ggregory@quicinc.com>>>
>      >
>      >     The FRU device uses the index 0 device on bus IF_NONE.
>      >
>      >     -drive file=$FRU,format=raw,if=none
>      >
>      >     file must match FRU size of 128k
>      >
>      >     Signed-off-by: Graeme Gregory <quic_ggregory@quicinc.com
>     <mailto:quic_ggregory@quicinc.com> <mailto:quic_ggregory@quicinc.com
>     <mailto:quic_ggregory@quicinc.com>>>
>      >     ---
>      >       hw/arm/aspeed.c | 22 +++++++++++++++++-----
>      >       1 file changed, 17 insertions(+), 5 deletions(-)
>      >
>      >     diff --git a/hw/arm/aspeed.c b/hw/arm/aspeed.c
>      >     index 785cc543d046..36d6b2c33e48 100644
>      >     --- a/hw/arm/aspeed.c
>      >     +++ b/hw/arm/aspeed.c
>      >     @@ -992,17 +992,29 @@ static void
>     fby35_i2c_init(AspeedMachineState *bmc)
>      >            */
>      >       }
>      >
>      >     +static void qcom_dc_scm_fru_init(I2CBus *bus, uint8_t addr,
>     uint32_t rsize)
>      >     +{
>      >     +    I2CSlave *i2c_dev = i2c_slave_new("at24c-eeprom", addr);
>      >     +    DeviceState *dev = DEVICE(i2c_dev);
>      >     +    /* Use First Index for DC-SCM FRU */
>      >     +    DriveInfo *dinfo = drive_get(IF_NONE, 0, 0);
>      >     +
>      >     +    qdev_prop_set_uint32(dev, "rom-size", rsize);
>      >     +
>      >     +    if (dinfo) {
>      >     +        qdev_prop_set_drive(dev, "drive",
>     blk_by_legacy_dinfo(dinfo));
>      >     +    }
>      >     +
>      >     +    i2c_slave_realize_and_unref(i2c_dev, bus, &error_abort);
>      >     +}
>      >
>      >
>      > We've sent a similar patch up for the at24c but in its own file
>     -- but looking at this, we could likely expand it to suite our cases
>     as well - is there a reason it's named qcom_dc_scm_fru_init? 
>     Presumably that's to handle the drive_get parameters.  If you make
>     it use `drive_get(IF_NONE, bus, unit);` You'll be able to associate
>     a drive via parameters like you aim to.
> 
> 
>     I have seen various attempts to populate the Aspeed eeproms with
>     data. The simplest is the g220a_bmc_i2c_init() approach. Some are
>     generating C code from the .bin files and compiling the result in
>     QEMU. Some were generating elf sections, linking them in QEMU and
>     passing the pointer as an eeprom buf.
> 
>     The drive approach is the best I think, but the device/drive
>     association depends on the drive order on the command line when
>     devices are created by the platform.
> 
>     We could may be extend the GenericLoaderState for eeproms ?
>     or introduce a routine which would look for a file under a (pc-bios)
>     per-machine directory and fill the eeprom buf with its contents ?
> 
>     Any idea ?
> 
> 
> So we have this in our eeprom_at24c module because we use it with Aspeed 
> and Nuvoton:
> 
> void at24c_eeprom_init_one(I2CBus *i2c_bus, int bus, uint8_t addr,
>                             uint32_t rsize, int unit_number)
> {
>      I2CSlave *i2c_dev = i2c_slave_new("at24c-eeprom", addr);
>      DeviceState *dev = DEVICE(i2c_dev);
>      BlockInterfaceType type = IF_NONE;
>      DriveInfo *dinfo;
> 
>      dinfo = drive_get(type, bus, unit_number);
>      if (dinfo) {
>          qdev_prop_set_drive(dev, "drive", blk_by_legacy_dinfo(dinfo));
>      }
>      qdev_prop_set_uint32(dev, "rom-size", rsize);
>      i2c_slave_realize_and_unref(i2c_dev, i2c_bus, &error_abort);
> }
> 
> With this style call in the board:
> 
> snippet from downstream version of 
> https://github.com/qemu/qemu/blob/master/hw/arm/npcm7xx_boards.c#L305 
> <https://github.com/qemu/qemu/blob/master/hw/arm/npcm7xx_boards.c#L305> 
> that we still need to finish upstreaming:
> 
> <snip>
>       /* mb_fru */
>      at24c_eeprom_init_one(npcm7xx_i2c_get_bus(soc, 5), 5, 0x50, 8192, 0);
> <snip>
>      /* fan_fru */
>      at24c_eeprom_init_one(pca954x_i2c_get_bus(i2c_mux, 2), 5, 0x51, 
> 8192, 1);
>      /* hsbp_fru */
>      at24c_eeprom_init_one(pca954x_i2c_get_bus(i2c_mux, 3), 5, 0x52, 
> 8192, 2);
> <snip>
> 
> And then we call it with the bus and unit, the pair of those has to be 
> unique for the drive parameter to work:
> 
> -drive 
> file=/export/hda3/tmp/mb_fru@50,if=none,bus=5,unit=0,snapshot=off,format=raw
> -drive 
> file=/export/hda3/tmp/fan_fru@51,if=none,bus=5,unit=1,snapshot=off,format=raw
> -drive 
> file=/export/hda3/tmp/hsbp_fru@52,if=none,bus=5,unit=2,snapshot=off,format=raw
> 
> The above code snippet is what, I'm fairly certain we had sent up for 
> review before, and we can send it again if you want.

Okay. I found that the above code was tried to upstream earlier by Hao
but it's not completed yet and it's pending at below thread.

https://lore.kernel.org/qemu-devel/875ystigke.fsf_-_@dusky.pond.sub.org/

Please complete the upstreaming then I'll use Hao's version.

I'll drop 3/9 patch from this series in v2.

Thanks,
Jae

> 
>     Thanks,
> 
>     C.
> 

