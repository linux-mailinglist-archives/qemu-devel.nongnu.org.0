Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DC82C5BEDD1
	for <lists+qemu-devel@lfdr.de>; Tue, 20 Sep 2022 21:32:14 +0200 (CEST)
Received: from localhost ([::1]:52700 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oaiyb-00078I-N1
	for lists+qemu-devel@lfdr.de; Tue, 20 Sep 2022 15:32:13 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39438)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <zhangjian.3032@bytedance.com>)
 id 1oaf0A-0005Iw-Jg
 for qemu-devel@nongnu.org; Tue, 20 Sep 2022 11:17:35 -0400
Received: from mail-lf1-x135.google.com ([2a00:1450:4864:20::135]:38609)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <zhangjian.3032@bytedance.com>)
 id 1oaf04-0006ag-C3
 for qemu-devel@nongnu.org; Tue, 20 Sep 2022 11:17:30 -0400
Received: by mail-lf1-x135.google.com with SMTP id f14so4358186lfg.5
 for <qemu-devel@nongnu.org>; Tue, 20 Sep 2022 08:17:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bytedance-com.20210112.gappssmtp.com; s=20210112;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date;
 bh=yc11HwSM7YgO+gEFfU6wqmQndk/XclUvErpmHtS057w=;
 b=mbq/Ow4oe5dAZTOCkOAr/TvhGVuVkbGD6vMEx2KCWnU0XmjE8+bHRftfTFmmJC+USE
 amBovffcSnpLBKWXlhVBtLS1lSmqMQl0cM7J2G3afo8sW4jV3KMzf27LtPxvyp/3375U
 egxUS7fyRgesjFLqCLE2ZqJIXJ/jNM5Y1vgkI3znn2XbuBpHWs9ypHrjpEeS0TdGOp6e
 OOy2HIh2d+sr40FMSSb8i1hiJdP3in8ZHbxdQ4kXTTG3bD/+d9gD7p3zGxB+b3m2dFNY
 WdD2hkjhRSn/nJUVEzLuPfSctxq25Sdp9K7SWtslHM7cPdBRJn/KdgjS1F1ZUKoGExSX
 l36Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date;
 bh=yc11HwSM7YgO+gEFfU6wqmQndk/XclUvErpmHtS057w=;
 b=PkCeeoUFDSUMJgkSHCgAgXFmDRMkGQ0IbQSI22hLzqo4G/amuDGZTagHV5STsPlxBW
 OIW+2FntyU6u7olYH9QLfJacnUuLWrQ+DNCnpE58SZ+Bh8CPNp3eJoAcAXhik4GWdsCB
 diwxE0/Y2YHH3ClQrYmrAM7JeYLLsdddjd+ujS/vnGfUa9jcWaCFGtZUEFFEJwJFk/y0
 mN637CeOj+H5VG0xxa8iCFLoZiz8vjBV4Zws7EBmUhX5S5cuZ9P8588kHpq2S2iZ2dA1
 kkHCpH0fwj0X8B9VvYNmurX3hECXU0UnakseCskpJziEfFtz0iP67RkJrhUVWDcxpx01
 VMJw==
X-Gm-Message-State: ACrzQf337g5bwgyTfijI1l2ew8OA6sz2NTnXYM2mQI/HYmWppX+EfaHR
 qDZQwNLsK5g36mC4Lg51ntxCYvZ9VeQ/35fulEFT+Q==
X-Google-Smtp-Source: AMsMyM6NJk5PlgxSUTkj1ysPXX3KKGXqXNvtf5h6TrQfzI3lNps/HwttfpvOA7hh3PyBPUhsW3HdAEwZQNWECpUUAws=
X-Received: by 2002:a19:5505:0:b0:497:ad71:39f4 with SMTP id
 n5-20020a195505000000b00497ad7139f4mr8267818lfe.226.1663687045982; Tue, 20
 Sep 2022 08:17:25 -0700 (PDT)
MIME-Version: 1.0
References: <20220919172112.2706026-1-zhangjian.3032@bytedance.com>
 <8aa93a4f-beef-a0a6-8bac-3b69ba25de7e@amsat.org>
In-Reply-To: <8aa93a4f-beef-a0a6-8bac-3b69ba25de7e@amsat.org>
From: Zhang Jian <zhangjian.3032@bytedance.com>
Date: Tue, 20 Sep 2022 23:17:14 +0800
Message-ID: <CA+J-oUt96e0kNwDsee8YgmRkKSzPb==aD=VHU0My9a=CV-8RuQ@mail.gmail.com>
Subject: Re: [Phishing Risk] [External] Re: [PATCH 0/3] Add a host power device
To: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>
Cc: peter.maydell@linaro.org, clg@kaod.org, andrew@aj.id.au, joel@jms.id.au, 
 qemu-devel@nongnu.org, qemu-arm@nongnu.org, yulei.sh@bytedance.com, 
 tangyiwei.2022@bytedance.com, chentingting.2150@bytedance.com, 
 yuhao.17@bytedance.com, wangxiaohua.1217@bytedance.com, 
 xiening.xll@bytedance.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::135;
 envelope-from=zhangjian.3032@bytedance.com; helo=mail-lf1-x135.google.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Hi Philippe,

Thanks for your reply.

On Tue, Sep 20, 2022 at 7:09 AM Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.or=
g> wrote:
>
> Hi Jian,
>
> On 19/9/22 19:21, Jian Zhang wrote:
> > This patchset adds a host power device and added it into the g220a
> > mahcine. The BMC have a important is to control the power of the host,
> > usually it is nessary in a hardware platform.
> >
> > The BMC(soc) usually had a output pin to control the power of the host,
> > and a input pin to get the power status of the host.
> >
> > The host power device is a generic device to simulate the host power,
> > accept the power control command from the BMC and report the power
> > status.
> >
> > Test on the g220a machine, the host power control command can be simply
> > work.
> >
> > Jian Zhang (3):
> >    hw/gpio/aspeed_gpio: Add gpios in/out init
> >    hw/misc/host_power: Add a simple host power device
> >    hw/arm/aspeed: g220a: Add host-power device
>
> "power-good" is just a TYPE_LED object, but it doesn't seem you are
> really interested in using it.
>
yeah, i'd like to just send an irq when the `switch` status changed.

> My understanding of your "power-button" is a latching switch.
>
yeah, this really like a latching switch.

> This could be indeed useful. I'd name this model TYPE_LATCHING_SWITCH
> and put it in hw/misc/latching-switch.c (since it is external to a
> SoC). It has one input and one output. Naming them is not particularly
> useful IMHO.
ok, it's make sense, using input and output directly.
> The triggering edge should be a property (it might have
> a default, positive/negative), and the switch state must to be in
> vmstate for the object to be migratable.
Ok, i got it.
>
> ("power-good"/"power-button" is what this particular board choose to
> use the latch switch input/output for).
>
> Do you mind renaming your series accordingly ("latching switch"),
> and adding the vmstate?
>
Ok, the name latching switch makes more sense and is more generic.

> Also I'd reorder your series as 2,1,3:
> - introduce the new device
> - prepare aspeed_gpio
> - wire aspeed_g220a
>
okay~
> Regards,
>
> Phil.

Thanks for your reply.

Thanks, Jian.

