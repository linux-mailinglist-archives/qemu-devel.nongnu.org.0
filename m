Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9118D5E7266
	for <lists+qemu-devel@lfdr.de>; Fri, 23 Sep 2022 05:23:01 +0200 (CEST)
Received: from localhost ([::1]:52718 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1obZHI-0002Sk-4B
	for lists+qemu-devel@lfdr.de; Thu, 22 Sep 2022 23:23:00 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57282)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jasowang@redhat.com>)
 id 1obZFl-0000qt-Mi
 for qemu-devel@nongnu.org; Thu, 22 Sep 2022 23:21:25 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:50914)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jasowang@redhat.com>)
 id 1obZFi-0007bB-C9
 for qemu-devel@nongnu.org; Thu, 22 Sep 2022 23:21:24 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1663903280;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=HgIhB4q+iJPd3lVnQeerTwKuW/WfLvgfDCRy1cN2wrk=;
 b=dGwd+wWL8FQt3hjKiJ+uMbGgGEPom+tFwHdk2kRJHXTSlcIwSls6uz2JgZ88oxs9EbeZ6t
 VBJB86xnOijzCEB+y0KmwC0niaZY2AoDzZ143Jk+6pWJA7hUHJoOI7yjBrYzIh6HR8YkFc
 nkhC2eJgJ2UHqIjiH12f3J4aQ6RAV5I=
Received: from mail-ot1-f70.google.com (mail-ot1-f70.google.com
 [209.85.210.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-612-BxSxHebYOgKdxn18UVSlfA-1; Thu, 22 Sep 2022 23:21:19 -0400
X-MC-Unique: BxSxHebYOgKdxn18UVSlfA-1
Received: by mail-ot1-f70.google.com with SMTP id
 61-20020a9d0843000000b0065bed802a93so942588oty.2
 for <qemu-devel@nongnu.org>; Thu, 22 Sep 2022 20:21:19 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date;
 bh=HgIhB4q+iJPd3lVnQeerTwKuW/WfLvgfDCRy1cN2wrk=;
 b=Uk/BYmUggtIJeAxKqvsbX6u3vzXlw+1H36RNmfVh80ow0HM+NiWExhr0ErB4d5UbUG
 Zo0DWQAEyQYQ647k5kIgIwYTytUcsuJSSRh+taXpm2Yph9uqUjHaOOAI+UQkf7X5X1C4
 Nt062zo4ZuDv0ujNPWuTX5RLuGk/AQakOhZvGCtxjMXSoiz/zWkBYvhPwr+oPlEsoWfr
 QN4Kw96ZuVSovy38DpD5sadhESFelNKWTq76+9yqTLHH+x7jMUS6YkpNLhpf+oSAR6+H
 nhFZI/buSi+lz8C9OFBtXF4D9MPWYUny1+duOgPOSqWTchjXJfdsRhNRnN2hKLfza2fJ
 BzXw==
X-Gm-Message-State: ACrzQf2LgEhKLw1H9E7hdqdHDytpp7SS3O4YzYEWRb1X5k4rG+lkBRkE
 hT2+zMsWW9zADoMj/tYdraHxfSdlg0gCq1mq02XeeA2ftaPSabw/ed4LxvfkuHumQRk3pr60OI3
 sRgyqUBcFGgEW6LHMx9SvTs5cYbkRE38=
X-Received: by 2002:a05:6830:1550:b0:659:68f7:492b with SMTP id
 l16-20020a056830155000b0065968f7492bmr3092690otp.237.1663903279128; 
 Thu, 22 Sep 2022 20:21:19 -0700 (PDT)
X-Google-Smtp-Source: AMsMyM5/9XRjbRggdtpJ8j/trHSar4QN5A9n6QGCMLR/1YyzE/937DhONKdxw11rDWSddFPFJeP7WQY3wmX6Oy79d+M=
X-Received: by 2002:a05:6830:1550:b0:659:68f7:492b with SMTP id
 l16-20020a056830155000b0065968f7492bmr3092677otp.237.1663903278867; Thu, 22
 Sep 2022 20:21:18 -0700 (PDT)
MIME-Version: 1.0
References: <20220921234646.949273-1-venture@google.com>
 <CAFEAcA8f+JA4WKMwGFNxg7tRxTwL=RzDLgdJLrP8Dw_jB4XoRA@mail.gmail.com>
In-Reply-To: <CAFEAcA8f+JA4WKMwGFNxg7tRxTwL=RzDLgdJLrP8Dw_jB4XoRA@mail.gmail.com>
From: Jason Wang <jasowang@redhat.com>
Date: Fri, 23 Sep 2022 11:21:08 +0800
Message-ID: <CACGkMEvMtAjGQVzwUgjD20Hb=Za8KmRanmp-FWrUQD8xS+7Pkw@mail.gmail.com>
Subject: Re: [PATCH] hw/net: npcm7xx_emc: set MAC in register space
To: Peter Maydell <peter.maydell@linaro.org>
Cc: Patrick Venture <venture@google.com>, hskinnemoen@google.com,
 kfting@nuvoton.com, 
 qemu-arm@nongnu.org, qemu-devel <qemu-devel@nongnu.org>,
 Hao Wu <wuhaotsh@google.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=170.10.133.124; envelope-from=jasowang@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001,
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Thu, Sep 22, 2022 at 8:35 PM Peter Maydell <peter.maydell@linaro.org> wrote:
>
> On Thu, 22 Sept 2022 at 00:47, Patrick Venture <venture@google.com> wrote:
> >
> > The MAC address set from Qemu wasn't being saved into the register space.
> >
> > Reviewed-by: Hao Wu <wuhaotsh@google.com>
> > Signed-off-by: Patrick Venture <venture@google.com>
>
> > @@ -112,6 +115,18 @@ static void emc_reset(NPCM7xxEMCState *emc)
> >
> >      emc->tx_active = false;
> >      emc->rx_active = false;
> > +
> > +    /* Set the MAC address in the register space. */
> > +    uint32_t value = (emc->conf.macaddr.a[0] << 24) |
> > +        (emc->conf.macaddr.a[1] << 16) |
> > +        (emc->conf.macaddr.a[2] << 8) |
> > +        emc->conf.macaddr.a[3];
> > +    npcm7xx_emc_write(emc, REG_CAMM_BASE * sizeof(uint32_t), value,
> > +                      sizeof(uint32_t));
> > +
> > +    value = (emc->conf.macaddr.a[4] << 24) | (emc->conf.macaddr.a[5] << 16);
> > +    npcm7xx_emc_write(emc, REG_CAML_BASE * sizeof(uint32_t), value,
> > +                      sizeof(uint32_t));
>
> If I understand correctly, the issue here is that emc->regs[REG_CAMM_BASE]
> and emc->regs[REG_CAML_BASE] aren't being reset correctly. If so,
> I think the better approach is to simply reset them here, without
> going through the register-write function, the same way we already
> do for the handful of other registers which have non-zero reset values.
> That's the way other devices seem to do it.
>
> A question to which I don't know the answer: if the guest writes to
> the device to change the MAC address, should that persist across
> reset, or should reset revert the device to the original MAC address
> as specified by the user on the command line or whatever ? At the
> moment you have the former behaviour (and end up storing the MAC
> address in two places as a result -- it would be neater to either
> keep it in only one place, or else have emc->regs[] be the current
> programmed MAC address and emc->conf.macaddr the value to reset to).
>
> I'm not sure we're consistent between device models about that,
> eg the e1000 seems to reset to the initial MAC addr, but the
> imx_fec keeps the guest-set value over resets. Jason, is there
> a recommended "right way" to handle guest-programmable MAC addresses
> over device reset ?

I think it depends on the NIC.

E1000 has a EEPROM interface for providing the MAC address for the
ethernet controller before it can be accessed by the driver during
reset. For modern Intel NICs like E810, it has similar semantics but
using NVM instead of EEPROM. So the current e1000 behaviour seems to
be correct (treat the initiali MAC as the one stored in the EEPROM).

I guess most NIC should behave the same as having a persistent storage
for MAC for the controller during reset, but I'm not sure this is the
case for imx_fec.

(Anyhow, if we change the behaviour we need keep migration compatibility)

Thanks

>
> thanks
> -- PMM
>


