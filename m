Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E35C969E7A6
	for <lists+qemu-devel@lfdr.de>; Tue, 21 Feb 2023 19:38:15 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pUXVF-0005C6-LU; Tue, 21 Feb 2023 13:36:37 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <edgar.iglesias@gmail.com>)
 id 1pUXVD-0005Ao-Gl; Tue, 21 Feb 2023 13:36:35 -0500
Received: from mail-ed1-x530.google.com ([2a00:1450:4864:20::530])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <edgar.iglesias@gmail.com>)
 id 1pUXVA-0005fy-Eg; Tue, 21 Feb 2023 13:36:35 -0500
Received: by mail-ed1-x530.google.com with SMTP id cq23so20773596edb.1;
 Tue, 21 Feb 2023 10:36:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=TirRXkHZ5nbttx9Wz+8L+/5sB06ejdTLlQyzfKohnmc=;
 b=Q163Li61zJPGD8aiIW0yLAwlbytjhhUViglfYYYHeSd8MpxIN8Fc1B7U9XnYWachM/
 DLQX04yk7yn6cJJ9v6W3udXUbaZA15/wh5QLpfvxTn6l95xXOpCA78ECgC1GQ+f1VWpq
 f3jKqhiwLoe7tt43GjLJCOjXk6ItPsIdwrKODiuhQefJdXB0ZN4HFcv6XUp/WDgEIjWs
 02oSaq6sbO/61SBz7mhw4B+CwC0D0FozyA+u4EgtemaB3w2y7yc3yiJrthY74M+VzMi8
 YqYv6eCDbjYhs5zHmKcGyDS+ag0xIBdMUL9TyXwTvJbRSSjtXeK0540+iD3Y/luFQiON
 V6Ow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=TirRXkHZ5nbttx9Wz+8L+/5sB06ejdTLlQyzfKohnmc=;
 b=c5r6nzdt0vW73tBu/BJvtu8SBkJTU+0bw7N0nrjWqAppWRoReb6FRoyjiIVjiTUo82
 OuKMJlQanAiv4MRG7LEtNLp1q56xSBqlH1p/LH9PJNzTl1I+IkY3sVI7QCA78sV+MjHM
 iBgJdg0VBLkVJI4Pc4ahUtAKT2KmySHj8gz5lvOPGVArduvB48Vvs9V6m1cLEJIdIuZ0
 otXbFwjcHUA5UZkb9b4XZj/l20UME3KasS0lECi5BPBi/uITEnveW6S3rDrYXxTUXER3
 C4yK+SJ73oQSFMwA3Mey6ricCsiyEoq9qbbu4Jp6J600SEBlvr4FpnmfknP1MyqRm7Bw
 hJhg==
X-Gm-Message-State: AO0yUKUgqdSkrXLUkFwYqMIv9k6MHx74OZsse9tqTMFjNe7AjxEWwEVr
 bNjymiFPmARJSV5ZklkV5GVdEbMY0vbc7y+ukBA=
X-Google-Smtp-Source: AK7set+ld6jSCbINRTQZ1DuMjZlr97yH8DJIjFGWHDvaOK0fHiGCZblRzEdlsdODCz6hrlIL0jnbo6KAbXs9iRa9+9E=
X-Received: by 2002:a17:906:9f25:b0:8d9:8f8f:d545 with SMTP id
 fy37-20020a1709069f2500b008d98f8fd545mr4053832ejc.0.1677004589983; Tue, 21
 Feb 2023 10:36:29 -0800 (PST)
MIME-Version: 1.0
References: <bfee4925-4de3-0f2a-1d97-6ae641ed287f@linaro.org>
In-Reply-To: <bfee4925-4de3-0f2a-1d97-6ae641ed287f@linaro.org>
From: "Edgar E. Iglesias" <edgar.iglesias@gmail.com>
Date: Tue, 21 Feb 2023 12:36:18 -0600
Message-ID: <CAJy5ezrOpmxZKpGaS=QSEDvRhS8-xPd6qX_veEKkcNTbuRPqEQ@mail.gmail.com>
Subject: Re: hw/ppc/virtex_ml507: Problem with CPU IRQ#3 (PPC40x_INPUT_CINT)
To: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@linaro.org>
Cc: QEMU Developers <qemu-devel@nongnu.org>,
 =?UTF-8?Q?C=C3=A9dric_Le_Goater?= <clg@kaod.org>, 
 qemu-ppc <qemu-ppc@nongnu.org>
Content-Type: multipart/alternative; boundary="000000000000df6d2e05f53a0e00"
Received-SPF: pass client-ip=2a00:1450:4864:20::530;
 envelope-from=edgar.iglesias@gmail.com; helo=mail-ed1-x530.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 HTML_MESSAGE=0.001, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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

--000000000000df6d2e05f53a0e00
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Feb 21, 2023 at 7:28 AM Philippe Mathieu-Daud=C3=A9 <philmd@linaro.=
org>
wrote:

> Hi Edgar,
>
> The Xilinx Virtex ML507 model uses 2 different interrupt controllers:
> - Universal Interrupt Controller
> - Xilinx OPB Interrupt Controller
> Both are connected to the same CPU IRQ line, IRQ#3 (PPC40x_INPUT_CINT):
>
> 108     uicdev =3D qdev_new(TYPE_PPC_UIC);
> 109     ppc4xx_dcr_realize(PPC4xx_DCR_DEVICE(uicdev), cpu, &error_fatal);
> 110     object_unref(OBJECT(uicdev));
> 111     uicsbd =3D SYS_BUS_DEVICE(uicdev);
> 112     sysbus_connect_irq(uicsbd, PPCUIC_OUTPUT_INT,
> 113                        qdev_get_gpio_in(DEVICE(cpu),
> PPC40x_INPUT_INT));
>
> 240     cpu_irq =3D qdev_get_gpio_in(DEVICE(cpu), PPC40x_INPUT_INT);
> 241     dev =3D qdev_new("xlnx.xps-intc");
> 242     qdev_prop_set_uint32(dev, "kind-of-intr", 0);
> 243     sysbus_realize_and_unref(SYS_BUS_DEVICE(dev), &error_fatal);
> 244     sysbus_mmio_map(SYS_BUS_DEVICE(dev), 0, INTC_BASEADDR);
> 245     sysbus_connect_irq(SYS_BUS_DEVICE(dev), 0, cpu_irq);
>
> How is the hardware wired, is it using an OR gate?
>

Hi Philippe,

I'm not sure if the UIC should be there at all, but I'm not sure.
Either the UIC should go or there should be an OR gate I guess.

The ml507 model was created a little bit empirically trying to get existing
images to run (long time ago).
I don't remember the exact details TBH...

I'll see if I can dig for more details...

Best regards,
Edgar



>
> I couldn't figure it out looking here:
>   * https://docs.xilinx.com/v/u/en-US/ug347
>   *
>
> https://www.xilinx.com/content/dam/xilinx/support/documents/boards_and_ki=
ts/ml50x_schematics.pdf
>
> Thanks,
>
> Phil.
>

--000000000000df6d2e05f53a0e00
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr">On Tue, Feb 21, 2023 at 7:28 AM Philippe =
Mathieu-Daud=C3=A9 &lt;<a href=3D"mailto:philmd@linaro.org">philmd@linaro.o=
rg</a>&gt; wrote:<br></div><div class=3D"gmail_quote"><blockquote class=3D"=
gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(20=
4,204,204);padding-left:1ex">Hi Edgar,<br>
<br>
The Xilinx Virtex ML507 model uses 2 different interrupt controllers:<br>
- Universal Interrupt Controller<br>
- Xilinx OPB Interrupt Controller<br>
Both are connected to the same CPU IRQ line, IRQ#3 (PPC40x_INPUT_CINT):<br>
<br>
108=C2=A0 =C2=A0 =C2=A0uicdev =3D qdev_new(TYPE_PPC_UIC);<br>
109=C2=A0 =C2=A0 =C2=A0ppc4xx_dcr_realize(PPC4xx_DCR_DEVICE(uicdev), cpu, &=
amp;error_fatal);<br>
110=C2=A0 =C2=A0 =C2=A0object_unref(OBJECT(uicdev));<br>
111=C2=A0 =C2=A0 =C2=A0uicsbd =3D SYS_BUS_DEVICE(uicdev);<br>
112=C2=A0 =C2=A0 =C2=A0sysbus_connect_irq(uicsbd, PPCUIC_OUTPUT_INT,<br>
113=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 qdev_get_gpio_in(DEVICE(cpu), PPC40x_INPUT_INT));<br>
<br>
240=C2=A0 =C2=A0 =C2=A0cpu_irq =3D qdev_get_gpio_in(DEVICE(cpu), PPC40x_INP=
UT_INT);<br>
241=C2=A0 =C2=A0 =C2=A0dev =3D qdev_new(&quot;xlnx.xps-intc&quot;);<br>
242=C2=A0 =C2=A0 =C2=A0qdev_prop_set_uint32(dev, &quot;kind-of-intr&quot;, =
0);<br>
243=C2=A0 =C2=A0 =C2=A0sysbus_realize_and_unref(SYS_BUS_DEVICE(dev), &amp;e=
rror_fatal);<br>
244=C2=A0 =C2=A0 =C2=A0sysbus_mmio_map(SYS_BUS_DEVICE(dev), 0, INTC_BASEADD=
R);<br>
245=C2=A0 =C2=A0 =C2=A0sysbus_connect_irq(SYS_BUS_DEVICE(dev), 0, cpu_irq);=
<br>
<br>
How is the hardware wired, is it using an OR gate?<br></blockquote><div><br=
></div><div>Hi Philippe,</div><div><br></div><div>I&#39;m not sure if the U=
IC should be there at all, but I&#39;m not sure.</div><div>Either the UIC s=
hould go or there should be an OR gate I guess.</div><div><br></div><div>Th=
e ml507 model was created a little bit empirically trying to get existing i=
mages to run (long time ago).</div><div>I don&#39;t remember the exact deta=
ils TBH...</div><div><br></div><div>I&#39;ll see if I can dig for more deta=
ils...</div><div><br></div><div>Best regards,</div><div>Edgar</div><div><br=
></div><div>=C2=A0</div><blockquote class=3D"gmail_quote" style=3D"margin:0=
px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">
<br>
I couldn&#39;t figure it out looking here:<br>
=C2=A0 * <a href=3D"https://docs.xilinx.com/v/u/en-US/ug347" rel=3D"norefer=
rer" target=3D"_blank">https://docs.xilinx.com/v/u/en-US/ug347</a><br>
=C2=A0 * <br>
<a href=3D"https://www.xilinx.com/content/dam/xilinx/support/documents/boar=
ds_and_kits/ml50x_schematics.pdf" rel=3D"noreferrer" target=3D"_blank">http=
s://www.xilinx.com/content/dam/xilinx/support/documents/boards_and_kits/ml5=
0x_schematics.pdf</a><br>
<br>
Thanks,<br>
<br>
Phil.<br>
</blockquote></div></div>

--000000000000df6d2e05f53a0e00--

