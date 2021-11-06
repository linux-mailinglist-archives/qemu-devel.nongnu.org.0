Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0CB48446CCB
	for <lists+qemu-devel@lfdr.de>; Sat,  6 Nov 2021 07:56:09 +0100 (CET)
Received: from localhost ([::1]:54916 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mjFcW-0001Sm-6J
	for lists+qemu-devel@lfdr.de; Sat, 06 Nov 2021 02:56:08 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49072)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1mjFa4-0000QT-Lc
 for qemu-devel@nongnu.org; Sat, 06 Nov 2021 02:53:36 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:58934)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1mjFa3-0007zp-7F
 for qemu-devel@nongnu.org; Sat, 06 Nov 2021 02:53:36 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1636181613;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=nrZeeMZnRP3ApwNiz0fVlan+bBxZbOO1iTZjX9rbwPY=;
 b=Gxsu05Q+V2rDl8KBeGaR486LiSszjGFR3Ba81h7qTA2ex9NkJV83rb/fIj+Hi5joY0e8wi
 NnfO8DJ4y5jznp3zNUf5qukeKh9VP0TAQ01ZQkrnEHb+Pg1FJdmpUvpPpxo2O/tFTrhOaN
 f9iRvszEOC+X0a3Q6Uec9TZ6NQyT26I=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-592-ikE5YByzNXiyCrvwtztPvA-1; Sat, 06 Nov 2021 02:53:31 -0400
X-MC-Unique: ikE5YByzNXiyCrvwtztPvA-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 74D02800053;
 Sat,  6 Nov 2021 06:53:29 +0000 (UTC)
Received: from blackfin.pond.sub.org (ovpn-112-7.ams2.redhat.com [10.36.112.7])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id A7C8C60C17;
 Sat,  6 Nov 2021 06:53:28 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id 379ED11380A7; Sat,  6 Nov 2021 07:53:27 +0100 (CET)
From: Markus Armbruster <armbru@redhat.com>
To: Hao Wu <wuhaotsh@google.com>
Subject: Re: [PATCH v4 6/7] hw/nvram: Update at24c EEPROM init function in
 NPCM7xx boards
References: <20211103220133.1422879-1-wuhaotsh@google.com>
 <20211103220133.1422879-4-wuhaotsh@google.com>
Date: Sat, 06 Nov 2021 07:53:27 +0100
In-Reply-To: <20211103220133.1422879-4-wuhaotsh@google.com> (Hao Wu's message
 of "Wed, 3 Nov 2021 15:01:32 -0700")
Message-ID: <874k8pvkpk.fsf@dusky.pond.sub.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.2 (gnu/linux)
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=armbru@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain
Received-SPF: pass client-ip=170.10.133.124; envelope-from=armbru@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.735,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
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
Cc: peter.maydell@linaro.org, thuth@redhat.com, qemu-block@nongnu.org,
 venture@google.com, bin.meng@windriver.com, richard.henderson@linaro.org,
 qemu-devel@nongnu.org, hskinnemoen@google.com, kfting@nuvoton.com,
 qemu-arm@nongnu.org, Avi.Fishman@nuvoton.com, armbru@redhat.com,
 f4bug@amsat.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Hao Wu <wuhaotsh@google.com> writes:

> We made 3 changes to the at24c_eeprom_init function in
> npcm7xx_boards.c:
>
> 1. We allow the function to take a I2CBus* as parameter. This allows
>    us to attach an EEPROM device behind an I2C mux which is not
>    possible with the old method.
>
> 2. We make at24c EEPROMs are backed by drives so that we can
>    specify the content of the EEPROMs.
>
> 3. Instead of using i2c address as unit number, This patch assigns
>    unique unit numbers for each eeproms in each board. This avoids
>    conflict in providing multiple eeprom contents with the same address.
>    In the old method if we specify two drives with the same unit number,
>    the following error will occur: `Device with id 'none85' exists`.

When a commit does three things, chances are splitting it into three
commits would be an improvement.  This is *not* a demand.

>
> Signed-off-by: Hao Wu <wuhaotsh@google.com>
> ---
>  hw/arm/npcm7xx_boards.c | 14 +++++++++-----
>  1 file changed, 9 insertions(+), 5 deletions(-)
>
> diff --git a/hw/arm/npcm7xx_boards.c b/hw/arm/npcm7xx_boards.c
> index dec7d16ae5..9121e081fa 100644
> --- a/hw/arm/npcm7xx_boards.c
> +++ b/hw/arm/npcm7xx_boards.c
> @@ -126,13 +126,17 @@ static I2CBus *npcm7xx_i2c_get_bus(NPCM7xxState *soc, uint32_t num)
>      return I2C_BUS(qdev_get_child_bus(DEVICE(&soc->smbus[num]), "i2c-bus"));
>  }
>  
> -static void at24c_eeprom_init(NPCM7xxState *soc, int bus, uint8_t addr,
> -                              uint32_t rsize)
> +static void at24c_eeprom_init(I2CBus *i2c_bus, int bus, uint8_t addr,
> +                              uint32_t rsize, int unit_number)

I'd keep bus and unit number together.

I'd name the new parameter @unit, to match drive_get().

>  {
> -    I2CBus *i2c_bus = npcm7xx_i2c_get_bus(soc, bus);
>      I2CSlave *i2c_dev = i2c_slave_new("at24c-eeprom", addr);
>      DeviceState *dev = DEVICE(i2c_dev);
> +    DriveInfo *dinfo;
>  
> +    dinfo = drive_get(IF_OTHER, bus, unit_number);
> +    if (dinfo) {
> +        qdev_prop_set_drive(dev, "drive", blk_by_legacy_dinfo(dinfo));
> +    }
>      qdev_prop_set_uint32(dev, "rom-size", rsize);
>      i2c_slave_realize_and_unref(i2c_dev, i2c_bus, &error_abort);
>  }
> @@ -239,8 +243,8 @@ static void quanta_gsj_i2c_init(NPCM7xxState *soc)
>      i2c_slave_create_simple(npcm7xx_i2c_get_bus(soc, 3), "tmp105", 0x5c);
>      i2c_slave_create_simple(npcm7xx_i2c_get_bus(soc, 4), "tmp105", 0x5c);
>  
> -    at24c_eeprom_init(soc, 9, 0x55, 8192);
> -    at24c_eeprom_init(soc, 10, 0x55, 8192);
> +    at24c_eeprom_init(npcm7xx_i2c_get_bus(soc, 9), 9, 0x55, 8192, 0);
> +    at24c_eeprom_init(npcm7xx_i2c_get_bus(soc, 10), 10, 0x55, 8192, 1);
>  
>      /*
>       * i2c-11:


