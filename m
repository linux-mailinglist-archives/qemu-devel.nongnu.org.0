Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 15FD6443F14
	for <lists+qemu-devel@lfdr.de>; Wed,  3 Nov 2021 10:14:47 +0100 (CET)
Received: from localhost ([::1]:39462 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1miCM1-00068Y-Lz
	for lists+qemu-devel@lfdr.de; Wed, 03 Nov 2021 05:14:45 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50950)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1miCKn-00058B-Me
 for qemu-devel@nongnu.org; Wed, 03 Nov 2021 05:13:29 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:38287)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1miCKk-0004Xt-PM
 for qemu-devel@nongnu.org; Wed, 03 Nov 2021 05:13:28 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1635930805;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=A3kbtzd4Up3wLaA0Xd7QIWShK6pLW44aCcCnEc3QQAg=;
 b=GMAzkBSjMzSU7eAGinI/FQlCMvGplU9W2SDPd/fIShJP2zZ0SDrlZYzIDwbEH4E+tx2oQQ
 yylFjIOvLHmEsuFK7twSXX+7bmC6rVOPrjz0orEyE1ujqk+rLXXt9yLISxgl25pS7DUx7P
 Q+aWJNvEDLaWcfSBYVSH4fN3aJUhZo4=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-382-5s2SafBkPs20iA78iXb4PQ-1; Wed, 03 Nov 2021 05:13:22 -0400
X-MC-Unique: 5s2SafBkPs20iA78iXb4PQ-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id B4CF78066EB;
 Wed,  3 Nov 2021 09:13:20 +0000 (UTC)
Received: from [10.39.192.84] (unknown [10.39.192.84])
 by smtp.corp.redhat.com (Postfix) with ESMTP id F302C60BF1;
 Wed,  3 Nov 2021 09:13:15 +0000 (UTC)
Message-ID: <1567de73-332b-dcf6-9a8e-fea0cd071f9a@redhat.com>
Date: Wed, 3 Nov 2021 10:13:14 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.2.0
Subject: Re: [PATCH v2 5/7] hw/nvram: Update at24c EEPROM init function in
 NPCM7xx boards
To: Hao Wu <wuhaotsh@google.com>, Peter Maydell <peter.maydell@linaro.org>
References: <20211021183956.920822-1-wuhaotsh@google.com>
 <20211021183956.920822-6-wuhaotsh@google.com>
 <CAFEAcA8mwXkPSMubBjmqzFkK6ghmyW_ngz9AejeoF-GKkqSL6A@mail.gmail.com>
 <CAGcCb13jV8r6nRspELZOai_HYJ4t6E1OfOYSx7-wCjaAX8Fodg@mail.gmail.com>
From: Thomas Huth <thuth@redhat.com>
In-Reply-To: <CAGcCb13jV8r6nRspELZOai_HYJ4t6E1OfOYSx7-wCjaAX8Fodg@mail.gmail.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=thuth@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -60
X-Spam_score: -6.1
X-Spam_bar: ------
X-Spam_report: (-6.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.702,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-2.549, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: venture@google.com, hskinnemoen@google.com, qemu-devel@nongnu.org,
 KFTING@nuvoton.com, qemu-arm@nongnu.org, Avi.Fishman@nuvoton.com,
 Markus Armbruster <armbru@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 01/11/2021 18.47, Hao Wu wrote:
> 
> 
> On Mon, Nov 1, 2021 at 10:41 AM Peter Maydell <peter.maydell@linaro.org 
> <mailto:peter.maydell@linaro.org>> wrote:
> 
>     On Thu, 21 Oct 2021 at 19:40, Hao Wu <wuhaotsh@google.com
>     <mailto:wuhaotsh@google.com>> wrote:
>      >
>      > We made 3 changes to the at24c_eeprom_init function in
>      > npcm7xx_boards.c:
>      >
>      > 1. We allow the function to take a I2CBus* as parameter. This allows
>      >    us to attach an EEPROM device behind an I2C mux which is not
>      >    possible with the old method.
>      >
>      > 2. We make at24c EEPROMs are backed by drives so that we can
>      >    specify the content of the EEPROMs.
>      >
>      > 3. Instead of using i2c address as unit number, This patch assigns
>      >    unique unit numbers for each eeproms in each board. This avoids
>      >    conflict in providing multiple eeprom contents with the same address.
>      >    In the old method if we specify two drives with the same unit number,
>      >    the following error will occur: `Device with id 'none85' exists`.
>      >
>      > Signed-off-by: Hao Wu <wuhaotsh@google.com <mailto:wuhaotsh@google.com>>
>      > ---
>      >  hw/arm/npcm7xx_boards.c | 15 ++++++++++-----
>      >  1 file changed, 10 insertions(+), 5 deletions(-)
>      >
>      > diff --git a/hw/arm/npcm7xx_boards.c b/hw/arm/npcm7xx_boards.c
>      > index a656169f61..cdb52b9922 100644
>      > --- a/hw/arm/npcm7xx_boards.c
>      > +++ b/hw/arm/npcm7xx_boards.c
>      > @@ -107,13 +107,18 @@ static I2CBus *npcm7xx_i2c_get_bus(NPCM7xxState
>     *soc, uint32_t num)
>      >      return I2C_BUS(qdev_get_child_bus(DEVICE(&soc->smbus[num]),
>     "i2c-bus"));
>      >  }
>      >
>      > -static void at24c_eeprom_init(NPCM7xxState *soc, int bus, uint8_t addr,
>      > -                              uint32_t rsize)
>      > +static void at24c_eeprom_init(I2CBus *i2c_bus, int bus, uint8_t addr,
>      > +                              uint32_t rsize, int unit_number)
>      >  {
>      > -    I2CBus *i2c_bus = npcm7xx_i2c_get_bus(soc, bus);
>      >      I2CSlave *i2c_dev = i2c_slave_new("at24c-eeprom", addr);
>      >      DeviceState *dev = DEVICE(i2c_dev);
>      > +    BlockInterfaceType type = IF_NONE;
> 
>     Why make this a variable? We only use it in one place...
> 
> You're right, we can actually inline it.

Actually, please do *not* use IF_NONE for such stuff. See the discussion 
here for details:

  https://lists.gnu.org/archive/html/qemu-devel/2021-11/msg00970.html

  Thomas


