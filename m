Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id AB1CD6E8E85
	for <lists+qemu-devel@lfdr.de>; Thu, 20 Apr 2023 11:48:51 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1ppQtx-0007RB-TP; Thu, 20 Apr 2023 05:48:29 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1ppQts-0007HT-Io
 for qemu-devel@nongnu.org; Thu, 20 Apr 2023 05:48:24 -0400
Received: from mail-ej1-x636.google.com ([2a00:1450:4864:20::636])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1ppQtn-000849-Lz
 for qemu-devel@nongnu.org; Thu, 20 Apr 2023 05:48:24 -0400
Received: by mail-ej1-x636.google.com with SMTP id fy21so4929809ejb.9
 for <qemu-devel@nongnu.org>; Thu, 20 Apr 2023 02:48:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1681984096; x=1684576096;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=EDCO11+ESxmNotWX+1GTo4pr1S9pZha6hA0/GLW6Ppw=;
 b=gq8ukhHOq7d8l6Sr5hbEM++uu44AFJ/fbX9KoNpL7uwQCYczOstHYmsgTxsPa5ne33
 XA53RgdWqRxznqZLDVAstoM4Re9Gs7QPItwkrRgGajkSfM9907zz2k50pyvNYuThthrW
 PYgw14aBcsxfb0NeQXzweWerecMb7L2u1P8w0Lc1apgQI1yq5CNCb3OfC8xdYWmPXxL6
 xqSsw+i50TSjUWeHCcAHnRB5c36wohTOevX8lIV2Zc3FddpOR1vwt7oAl8MpfoWWjUql
 h+6YKFjYZrcpoLDh8HzsXIc/wtVUFZnQO19pbt4VDbsYUeUWLIRLf6AfMqTJdKwD3eSy
 oPqA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1681984096; x=1684576096;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=EDCO11+ESxmNotWX+1GTo4pr1S9pZha6hA0/GLW6Ppw=;
 b=RS6PLp/rz7Mk6OGjQSkU3LSu86fkWc1qcOBrqwRSN9XVodIbI/JUp2XtAJV32YGQiY
 LNU+hRrAQlycf/hkCDcetgcrONejafVmdiSKcI3IgVCqoA4psr4JlLpT9qYd25d48Chk
 O2qoE8GSs20lcK0AkWg5A5KnSxV5vrNzLnqmqb6qjj2rx2TSFQooRBCxxyPCIQLruqwH
 zBM6pmwzvW3lf+NJofb87lEAXVaFPeSMHau7fYmDa5jiPkEEa2MAbl55P0JhGbhvyv8W
 To8pJAzjBZMBCX2pLASB93YNG3Zg7ZoZ5bMG8JUzfOWHrFTDu3d3DqnsKLYiozG6VWh8
 fjUQ==
X-Gm-Message-State: AAQBX9efDGR9iXi6Pw1+qZX/FZbBd8pPo4+YQLwhGBKwTvwAVlG33ib2
 GdbvSUfmnHAtHj5If0gtoqbhDDHiGmxrRnh6UpBa6w==
X-Google-Smtp-Source: AKy350bktdpksA/ff4XXOSr2hptq7A9rlhFm5y2nrbdVndZQgbwsKxZUeXXCsCZC3vghN/pIHoSyt+xixlaY6HCLu+w=
X-Received: by 2002:a17:907:980a:b0:94f:7786:45c2 with SMTP id
 ji10-20020a170907980a00b0094f778645c2mr426527ejc.6.1681984095760; Thu, 20 Apr
 2023 02:48:15 -0700 (PDT)
MIME-Version: 1.0
References: <20230315145248.1639364-1-linux@roeck-us.net>
 <CAFEAcA-ZpQCS33L4MaQaR1S9MN24GgK+cH0vcuiz_7m+6dO4cw@mail.gmail.com>
 <c24f50af-1dbb-6a1b-ca21-414039c10602@roeck-us.net>
 <CAFEAcA9VQHa=Eenyon-kaiabayM5YY7FHEJsEWOzjzj3rXaSaA@mail.gmail.com>
 <79e67479-6785-c064-6aae-edd1ba2327cd@roeck-us.net>
 <CAFEAcA-tOt520nfNdHyGV+0PUvGdw2o+yfpv95cQDHPDJnq0aA@mail.gmail.com>
 <b438fd63-85ec-b765-435c-80512da49e2b@roeck-us.net>
In-Reply-To: <b438fd63-85ec-b765-435c-80512da49e2b@roeck-us.net>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 20 Apr 2023 10:48:04 +0100
Message-ID: <CAFEAcA_f8vg9MsZx2i2JMrc-wT+03nfNYgz71=vemriZEj+TkA@mail.gmail.com>
Subject: Re: [PATCH 0/5] Support both Ethernet interfaces on i.MX6UL and i.MX7
To: Guenter Roeck <linux@roeck-us.net>
Cc: Jean-Christophe Dubois <jcd@tribudubois.net>,
 Andrey Smirnov <andrew.smirnov@gmail.com>, 
 Jason Wang <jasowang@redhat.com>, qemu-arm@nongnu.org, qemu-devel@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::636;
 envelope-from=peter.maydell@linaro.org; helo=mail-ej1-x636.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

On Tue, 18 Apr 2023 at 17:55, Guenter Roeck <linux@roeck-us.net> wrote:
> On 4/18/23 08:32, Peter Maydell wrote:
> > So looking again at that diagram on that website, I think I understand
> > now: for data transfer to/from the outside world, MAC1 talks only through
> > PHY1 and MAC2 only through PHY2 (over the links marked "MII/GMII/XGMII"),
> > but the "control" connection is via MDIO, and on these boards you have to
> > configure PHY2 by doing the MDIO reads and writes via MAC1, even though
> > MAC1 has nothing otherwise to do with PHY2 ? (And MAC2 has no devices on
> > its MDIO bus at all.)
> >
>
> Correct.

Thanks. Now that I understand how the hardware is put together,
I had a think about what the theoretically 'correct' design
would be. We could do it, but it's a bit of a pain -- among
other things, QEMU's architecture doesn't really consider
the idea of devices that are on more than one bus (as the
PHY is on both the MDIO and the MII), so you have to pick
one as the 'real' bus and then use property links or similar
for the other. And we get into having to look at all the
other uses of PHYs in QEMU so we can design the interface
to be general enough to be usable elsewhere. All of which is
more effort than seems worthwhile for just these imx devices.

So I'm going to take this series into target-arm.next;
if anybody in future wants to properly model the MAC-PHY
interface we can feed this use-case in as one of the
requirement then...

-- PMM

