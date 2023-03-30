Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 05A576D0C78
	for <lists+qemu-devel@lfdr.de>; Thu, 30 Mar 2023 19:16:22 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1phvsV-0007JL-MS; Thu, 30 Mar 2023 13:15:59 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <groeck7@gmail.com>)
 id 1phvsT-0007HS-7q; Thu, 30 Mar 2023 13:15:57 -0400
Received: from mail-yw1-x112f.google.com ([2607:f8b0:4864:20::112f])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <groeck7@gmail.com>)
 id 1phvsR-0007Wp-9X; Thu, 30 Mar 2023 13:15:57 -0400
Received: by mail-yw1-x112f.google.com with SMTP id
 00721157ae682-54601d90118so211174187b3.12; 
 Thu, 30 Mar 2023 10:15:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112; t=1680196553;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:sender:from:to:cc:subject:date:message-id
 :reply-to; bh=RmnUNt2fv7zIJyYexWKIRPZpeYxc2O4UwrnTDCVAxl0=;
 b=VgGqgcb57SAtqW3kYkGNf/JsLUtNoltHuDZRKIl9hWHUazYU2Lg/zYiSjfTemMrs9G
 /QZX9sOnLd3iGJhPzUFVYKB2+vVc1WcJNtOSaEIlxstfLwyoVwUEkzHAdYjcBAKqDJsq
 Uw1qaWATlLYkSu1Q0FmGaDtliZJnhM9Tuo3al+aZ2jUA6n0R3zKAJau+ndN8lunQPJEx
 fzlG9cUFELMIvAlntf/RVnWqnMZIwXFCLsSVXGh9CaIAzq8+t6Pu5AmVW8ATNo70OjSN
 rZunoU8taj8CCGado+wgRbDl6paWjcSTh8dhzu99Drf+Lq9PrHywblL+aVDUtbpTIq+u
 qsFg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1680196553;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:sender:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=RmnUNt2fv7zIJyYexWKIRPZpeYxc2O4UwrnTDCVAxl0=;
 b=qHgwG1oeDPemg6OXo41k9ngtlUsMQ6yutIBpHO4HVMKHtV57U6+cCRziAX6SueW2a9
 PT88U8B1wVHAZ+4trSvhlgdYys/irn+7+1ERtIBNL698jxp2M87/Hd2Eh1oLIYpcGvuY
 3puqOYtdOhQ6ss9YbrSRUa7mOMGblnqZ892X1f2im5ETguxkdQrEj2yOr+kp7vqw8lSX
 75affR05VGnndFR8Q0PYsmi5ylzl0vxlol+SmfWnju4u5cPvojluDSX3WgnGmneTldgl
 FY2EibA5LhI9XVi/2G/rKCZOxdne7XtYpruHyGW/IlEcxUQhqWZlLaS8q5l7w4CJewmX
 n0Gw==
X-Gm-Message-State: AAQBX9cWBPZ1osVhcbheELIrdkCgNaK74upb1oM2xTFpRicXTWsh9Fv/
 uvFI7btW7q6wqzI3SGvyWI8=
X-Google-Smtp-Source: AKy350YjD2T0khxrU/YLN0rXFKxTRhaAe4qiQduFc/yczP92Q9XhdBN9jOCaPTJDzXbhOs1RqxvXyg==
X-Received: by 2002:a0d:f7c1:0:b0:544:c7e0:9706 with SMTP id
 h184-20020a0df7c1000000b00544c7e09706mr20607110ywf.42.1680196553040; 
 Thu, 30 Mar 2023 10:15:53 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
 by smtp.gmail.com with ESMTPSA id
 b2-20020a81bc42000000b00545a08184a7sm3610966ywl.55.2023.03.30.10.15.52
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 30 Mar 2023 10:15:52 -0700 (PDT)
Date: Thu, 30 Mar 2023 10:15:51 -0700
From: Guenter Roeck <linux@roeck-us.net>
To: Peter Maydell <peter.maydell@linaro.org>
Cc: Jean-Christophe Dubois <jcd@tribudubois.net>,
 Andrey Smirnov <andrew.smirnov@gmail.com>,
 Jason Wang <jasowang@redhat.com>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org
Subject: Re: [PATCH 1/5] hw/net/imx_fec: Support two Ethernet interfaces
 connected to single MDIO bus
Message-ID: <a1824028-7aba-4b17-910b-6845834d73f7@roeck-us.net>
References: <20230315145248.1639364-1-linux@roeck-us.net>
 <20230315145248.1639364-2-linux@roeck-us.net>
 <CAFEAcA8=0m-UFj9noTa+J69sEMP5cqTvaMoVoqHVd4V2JF3Oxw@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAFEAcA8=0m-UFj9noTa+J69sEMP5cqTvaMoVoqHVd4V2JF3Oxw@mail.gmail.com>
Received-SPF: pass client-ip=2607:f8b0:4864:20::112f;
 envelope-from=groeck7@gmail.com; helo=mail-yw1-x112f.google.com
X-Spam_score_int: -11
X-Spam_score: -1.2
X-Spam_bar: -
X-Spam_report: (-1.2 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_ENVFROM_END_DIGIT=0.25,
 FREEMAIL_FORGED_FROMDOMAIN=0.25, FREEMAIL_FROM=0.001,
 HEADER_FROM_DIFFERENT_DOMAINS=0.25, RCVD_IN_DNSWL_NONE=-0.0001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=no autolearn_force=no
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

On Thu, Mar 30, 2023 at 05:31:13PM +0100, Peter Maydell wrote:
> On Wed, 15 Mar 2023 at 14:52, Guenter Roeck <linux@roeck-us.net> wrote:
> >
> > The SOC on i.MX6UL and i.MX7 has 2 Ethernet interfaces. The PHY on each may
> > be connected to separate MDIO busses, or both may be connected on the same
> > MDIO bus using different PHY addresses. Commit 461c51ad4275 ("Add a phy-num
> > property to the i.MX FEC emulator") added support for specifying PHY
> > addresses, but it did not provide support for linking the second PHY on
> > a given MDIO bus to the other Ethernet interface.
> >
> > To be able to support two PHY instances on a single MDIO bus, two properties
> > are needed: First, there needs to be a flag indicating if the MDIO bus on
> > a given Ethernet interface is connected. If not, attempts to read from this
> > bus must always return 0xffff. Implement this property as phy-connected.
> > Second, if the MDIO bus on an interface is active, it needs a link to the
> > consumer interface to be able to provide PHY access for it. Implement this
> > property as phy-consumer.
> >
> > Signed-off-by: Guenter Roeck <linux@roeck-us.net>
> 
> > @@ -282,11 +282,19 @@ static uint32_t imx_phy_read(IMXFECState *s, int reg)
> >      uint32_t val;
> >      uint32_t phy = reg / 32;
> >
> > -    if (phy != s->phy_num) {
> > -        trace_imx_phy_read_num(phy, s->phy_num);
> > +    if (!s->phy_connected) {
> >          return 0xffff;
> >      }
> >
> > +    if (phy != s->phy_num) {
> > +        if (s->phy_consumer && phy == s->phy_consumer->phy_num) {
> > +            s = s->phy_consumer;
> 
> This does work, but it leaves me wondering if we should really
> be modelling the phy as a separate device object, so that we
> can use link properties to connect the right phy to the right
> IMXFECState rather than having this odd "actually use the pointer
> to this other instance of the device"... A quick glance through

Possibly, but I don't understand well enough how this would work
to be able to implement it. I'll be happy to test patches from others,
of course.

Thanks,
Guenter

> the code suggests that the phy and the ethernet controller
> proper don't really care about each others' internals.
> (imx_phy_update_irq() does call imx_eth_update() but AFAICT
> that is unnecessary because imx_eth_update() doesn't care about
> any of the phy state...)
> 
> thanks
> -- PMM

