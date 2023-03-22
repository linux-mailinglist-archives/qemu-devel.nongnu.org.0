Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5769F6C53CC
	for <lists+qemu-devel@lfdr.de>; Wed, 22 Mar 2023 19:37:09 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pf3JM-0004sH-P8; Wed, 22 Mar 2023 14:35:48 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <tcminyard@gmail.com>)
 id 1pf3JL-0004s9-JQ
 for qemu-devel@nongnu.org; Wed, 22 Mar 2023 14:35:47 -0400
Received: from mail-qt1-x82b.google.com ([2607:f8b0:4864:20::82b])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <tcminyard@gmail.com>)
 id 1pf3JJ-0008GS-Lh
 for qemu-devel@nongnu.org; Wed, 22 Mar 2023 14:35:47 -0400
Received: by mail-qt1-x82b.google.com with SMTP id r5so23872308qtp.4
 for <qemu-devel@nongnu.org>; Wed, 22 Mar 2023 11:35:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112; t=1679510144;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:reply-to:message-id:subject:cc:to:from:date
 :sender:from:to:cc:subject:date:message-id:reply-to;
 bh=J9Er3n+QdpKVAxQdeH22/E4h1ZLQxo9WO7/ZaTuI0P8=;
 b=bdB4BXkDNuAnGPjxI+PYnewh2QXp0qmOkr11JDDV9kSShDxL2xEofm7rbpqQVt4OUs
 ZMMRXnpMh4lglpixku986NkjXSrYVaj0QaU1ConHnVHeaD/jPVl4vKhpGTR7lFKcDl+4
 mfPpbtbGQWhNizolLd2dZ7tbO5L4PlMfjVj1bA77IsMzsT+DoWXMeB/rtn/wvlJgE8Vx
 7GT34lZptq1zKTweyqYT8oUIr8ww3P1YZC4M8HV6RJ1pRxN0lpXp+Tjs5lVJb1L/sVFM
 oAQTYVAD8AwOpfvUk6qofey6Ujraj/7PJWhnN62VI3LQ+ZH5rIlsaTAxkPNdCrL27m9a
 fazw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1679510144;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:reply-to:message-id:subject:cc:to:from:date
 :sender:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=J9Er3n+QdpKVAxQdeH22/E4h1ZLQxo9WO7/ZaTuI0P8=;
 b=EhKdzC2szdWbZQ6IlafP2c05owan1adn2cEA6Up7zI/3wJm458TxFALb5cul6LbKXw
 vwENduTdXUp/Z/8NNGps/cFxvqwU1YGK+u1ej85JIhHj5MrJmFUgXqKHYtAz4VJHZ7I5
 uDZ4RTFWtKeyqQNhIreuSFsSgSmVljNNNG9Va6Fmszk/x9KgDekyrfRhIKOKdwKEuSWk
 JwGz8WOmgCiCrGU3hce7JcgiRfXdnU9VNCOOpokHbtOnwTUZd10GqzeHBXnyR96gEdmY
 rJeFGCNiADzxI9QD4bfWcKbEfY7ZoxeHIlZo4q8xJ9ggk8WWPR0E6gP3SBxxL7nuRetJ
 o79g==
X-Gm-Message-State: AO0yUKVL/hA+4m2awCzCAEi6B4efvzCbXp7FZ3/4XWxRYDa8rlE16tqd
 LM3Jk4fuNGHabyMKFn9qJw==
X-Google-Smtp-Source: AK7set+DAe7qzgbswKxzlIBi6QUkf+FAKfseL2PwDHkOEUGmFI0jeQv5riIDLBflVYGjgbBLoaArdw==
X-Received: by 2002:a05:622a:650:b0:3d7:b045:d39 with SMTP id
 a16-20020a05622a065000b003d7b0450d39mr7000351qtb.62.1679510143734; 
 Wed, 22 Mar 2023 11:35:43 -0700 (PDT)
Received: from serve.minyard.net ([47.184.185.84])
 by smtp.gmail.com with ESMTPSA id
 p16-20020a05620a057000b00746476405bbsm11736498qkp.122.2023.03.22.11.35.42
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 22 Mar 2023 11:35:43 -0700 (PDT)
Received: from minyard.net (unknown
 [IPv6:2001:470:b8f6:1b:3214:777f:4ba9:15f6])
 by serve.minyard.net (Postfix) with ESMTPSA id DF7AE1800BB;
 Wed, 22 Mar 2023 18:35:41 +0000 (UTC)
Date: Wed, 22 Mar 2023 13:35:40 -0500
From: Corey Minyard <minyard@acm.org>
To: Patrick Venture <venture@google.com>
Cc: cminyard@mvista.com, peter.maydell@linaro.org, qemu-devel@nongnu.org,
 Hao Wu <wuhaotsh@google.com>,
 Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Subject: Re: [PATCH RESEND] hw/i2c: Enable an id for the pca954x devices
Message-ID: <ZBtKfPmZ486quntz@minyard.net>
References: <20230321182744.2814034-1-venture@google.com>
 <ZBpcwnsttm5NSbTc@minyard.net>
 <CAO=notxaTaU5NoNdcEJ_nCvb6FnY8DGSzJcZxdk=5aBzDj1Hgw@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAO=notxaTaU5NoNdcEJ_nCvb6FnY8DGSzJcZxdk=5aBzDj1Hgw@mail.gmail.com>
Received-SPF: pass client-ip=2607:f8b0:4864:20::82b;
 envelope-from=tcminyard@gmail.com; helo=mail-qt1-x82b.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.25,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.25,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Reply-To: minyard@acm.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

On Wed, Mar 22, 2023 at 10:03:27AM -0700, Patrick Venture wrote:
> On Tue, Mar 21, 2023 at 6:41 PM Corey Minyard <cminyard@mvista.com> wrote:
> 
> > On Tue, Mar 21, 2023 at 11:27:44AM -0700, Patrick Venture wrote:
> > > This allows the devices to be more readily found and specified.
> > > Without setting the id field, they can only be found by device type
> > > name, which doesn't let you specify the second of the same device type
> > > behind a bus.
> >
> > So basically, this helps you find a specific device if you have more
> > than one of them.  Yeah, probably a good idea in this case.
> >
> > >
> > > Tested: Verified that by default the device was findable with the id
> > > 'pca954x[77]', for an instance attached at that address.
> > >
> > > Signed-off-by: Patrick Venture <venture@google.com>
> > > Reviewed-by: Hao Wu <wuhaotsh@google.com>
> > > Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>
> > > ---
> > >  hw/i2c/i2c_mux_pca954x.c | 22 ++++++++++++++++++++++
> > >  1 file changed, 22 insertions(+)
> > >
> > > diff --git a/hw/i2c/i2c_mux_pca954x.c b/hw/i2c/i2c_mux_pca954x.c
> > > index a9517b612a..4f8c2d6ae1 100644
> > > --- a/hw/i2c/i2c_mux_pca954x.c
> > > +++ b/hw/i2c/i2c_mux_pca954x.c
> > > @@ -20,6 +20,7 @@
> > >  #include "hw/i2c/i2c_mux_pca954x.h"
> > >  #include "hw/i2c/smbus_slave.h"
> > >  #include "hw/qdev-core.h"
> > > +#include "hw/qdev-properties.h"
> > >  #include "hw/sysbus.h"
> > >  #include "qemu/log.h"
> > >  #include "qemu/module.h"
> > > @@ -43,6 +44,8 @@ typedef struct Pca954xState {
> > >
> > >      bool enabled[PCA9548_CHANNEL_COUNT];
> > >      I2CBus *bus[PCA9548_CHANNEL_COUNT];
> > > +
> > > +    char *id;
> > >  } Pca954xState;
> > >
> > >  /*
> > > @@ -181,6 +184,17 @@ static void pca9548_class_init(ObjectClass *klass,
> > void *data)
> > >      s->nchans = PCA9548_CHANNEL_COUNT;
> > >  }
> > >
> > > +static void pca954x_realize(DeviceState *dev, Error **errp)
> > > +{
> > > +    Pca954xState *s = PCA954X(dev);
> > > +    DeviceState *d = DEVICE(s);
> > > +    if (s->id) {
> > > +        d->id = g_strdup(s->id);
> > > +    } else {
> > > +        d->id = g_strdup_printf("pca954x[%x]", s->parent.i2c.address);
> > > +    }
> > > +}
> > > +
> > >  static void pca954x_init(Object *obj)
> > >  {
> > >      Pca954xState *s = PCA954X(obj);
> > > @@ -197,6 +211,11 @@ static void pca954x_init(Object *obj)
> > >      }
> > >  }
> > >
> > > +static Property pca954x_props[] = {
> > > +    DEFINE_PROP_STRING("id", Pca954xState, id),
> > > +    DEFINE_PROP_END_OF_LIST()
> > > +};
> >
> > There is already an "id=" thing in qemu for doing links between front
> > ends and back ends.  That's probably not the best name to use.  Several
> > devices, like network devices, use "name" for identification in the
> > monitor.
> >
> 
> So I should change it to name? I'm ok with that. I think bus would be
> slightly confusing.  "id" was short and easy.  Will send a v2.

Yes, "name" would be more consistent with other usage.

-corey

> 
> 
> >
> > -corey
> >
> > > +
> > >  static void pca954x_class_init(ObjectClass *klass, void *data)
> > >  {
> > >      I2CSlaveClass *sc = I2C_SLAVE_CLASS(klass);
> > > @@ -209,9 +228,12 @@ static void pca954x_class_init(ObjectClass *klass,
> > void *data)
> > >      rc->phases.enter = pca954x_enter_reset;
> > >
> > >      dc->desc = "Pca954x i2c-mux";
> > > +    dc->realize = pca954x_realize;
> > >
> > >      k->write_data = pca954x_write_data;
> > >      k->receive_byte = pca954x_read_byte;
> > > +
> > > +    device_class_set_props(dc, pca954x_props);
> > >  }
> > >
> > >  static const TypeInfo pca954x_info[] = {
> > > --
> > > 2.35.1.894.gb6a874cedc-goog
> > >
> >

