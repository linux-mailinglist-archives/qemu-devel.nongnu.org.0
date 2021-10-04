Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B85ED42130F
	for <lists+qemu-devel@lfdr.de>; Mon,  4 Oct 2021 17:50:59 +0200 (CEST)
Received: from localhost ([::1]:56284 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mXQF0-0003Zs-Pb
	for lists+qemu-devel@lfdr.de; Mon, 04 Oct 2021 11:50:58 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43998)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1mXQ9C-0007q2-9F
 for qemu-devel@nongnu.org; Mon, 04 Oct 2021 11:44:58 -0400
Received: from mail-wm1-x32e.google.com ([2a00:1450:4864:20::32e]:35336)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1mXQ9A-00087s-M3
 for qemu-devel@nongnu.org; Mon, 04 Oct 2021 11:44:58 -0400
Received: by mail-wm1-x32e.google.com with SMTP id
 z184-20020a1c7ec1000000b003065f0bc631so20083047wmc.0
 for <qemu-devel@nongnu.org>; Mon, 04 Oct 2021 08:44:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=references:user-agent:from:to:cc:subject:date:in-reply-to
 :message-id:mime-version:content-transfer-encoding;
 bh=5AoZSg4INhB2bpnoJjW/yhP7o2j/E30FHaLCM8tX7UQ=;
 b=KmHC2Rpv0SlB35fBmVxCKS2+T/rPQCcNq+qYCcpKUYEvsjCTMe7V+Gjb1i9UiR0Z6B
 P4+EbKUj9YLtKXoTyaNb9oLiBr8/8jgGJb+yc0yYj7NBSGUA84pfzmkfcqhov+hqsQ36
 ZDH6EOGCr0HcW5dsGBlxIaEkGz/i9M2FwyMrfVWgK6kiOFuok9LSYA/FjfMbVVtykZjq
 G+Sas/Ap5pMgaTfxIjetESP+wTjYTcFoB/1HFeY96JjyhscXqVQ+3nSzUtLeMLnl2yO+
 TRGnPO5y1chtNkPTGR+fu6TNRYEjoCUHKU+NxMgkDlbvHjFmTGZ4tJ5df7wCx7965VgJ
 XbiQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:references:user-agent:from:to:cc:subject:date
 :in-reply-to:message-id:mime-version:content-transfer-encoding;
 bh=5AoZSg4INhB2bpnoJjW/yhP7o2j/E30FHaLCM8tX7UQ=;
 b=Nm4hTuYeEpb1wpTOd7Io8nX+Gq0/GWij/cFVaa11qf4gWAB7OT+vWSBrYBz438dSGa
 04iAjKJsrN3NFAAPSl8DnDklnwfo/a0o/CGbIEN+k2mM2HxgN4DkAZZ1umaX+1ieyAp2
 sQCKWy99J6BcApbpyPbrFkzTMAW/NVVaIkN5vAAuaNofGZ4QEnQi9ALIHJlihy6vQ7L8
 Xy7G4r4IowklEkshvAUCTbrRr8yRNHX81Et4hd3CmT5vtdOu6tRqooxJBAstZwvE/fFW
 S91P6l1+0C3K5estyZd/DnK6+2IHLCykx5TsogwJA7O+NfGDjPkyxPiXB8bfC1/prq65
 1s5w==
X-Gm-Message-State: AOAM533ZpRgQ0dGjstUhouEuGVw20BVvmnTGdQmOsCJpDEatVEger1kV
 hL93F8TUCT2hpXl2YKASj2T4kw==
X-Google-Smtp-Source: ABdhPJwEf97holPDf8KXlNA8Vuz+z+k3B79o20UtRK5b1lVAlKZ4zpU/A/6iZQ5IGWVEKM3pUqWfUA==
X-Received: by 2002:a05:600c:4f8e:: with SMTP id
 n14mr19377335wmq.63.1633362295305; 
 Mon, 04 Oct 2021 08:44:55 -0700 (PDT)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id d2sm14877035wrc.32.2021.10.04.08.44.54
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 04 Oct 2021 08:44:54 -0700 (PDT)
Received: from zen (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 756981FF96;
 Mon,  4 Oct 2021 16:44:53 +0100 (BST)
References: <20211004134742.2044280-1-alex.bennee@linaro.org>
 <20211004134742.2044280-6-alex.bennee@linaro.org>
User-agent: mu4e 1.7.0; emacs 28.0.60
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Subject: Re: [PATCH v1 5/7] hw/arm/bcm2836: Add the BCM2711 which uses a GICv2
Date: Mon, 04 Oct 2021 16:43:50 +0100
In-reply-to: <20211004134742.2044280-6-alex.bennee@linaro.org>
Message-ID: <87ilycg5fu.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::32e;
 envelope-from=alex.bennee@linaro.org; helo=mail-wm1-x32e.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>, f4bug@amsat.org,
 Andrew Baumann <Andrew.Baumann@microsoft.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


Alex Benn=C3=A9e <alex.bennee@linaro.org> writes:

> From: Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org>
>
> The BCM2711 is improvement of the BCM2837:
> - Cortex-A72 instead of the A53
> - peripheral block and local soc controller are mapped differently,
> - GICv2
> - PCIe block
> - exhanced MMU to address over 4GiB of SDRAM
>
<snip>
> ---
> vAJB:
<snip>
>   - move peri_base/ctrl to locations pointed to by DTB (0x7e000000/0x4000=
0000)
<snip>
> +
> +static void bcm2711_class_init(ObjectClass *oc, void *data)
> +{
> +    DeviceClass *dc =3D DEVICE_CLASS(oc);
> +    BCM283XClass *bc =3D BCM283X_CLASS(oc);
> +
> +    bc->cpu_type =3D ARM_CPU_TYPE_NAME("cortex-a72");
> +    bc->core_count =3D BCM283X_NCPUS;
> +    bc->peri_base =3D 0x7e000000;
> +    bc->ctrl_base =3D 0x40000000;
> +    bc->clusterid =3D 0x0;
> +    bc->gic_base =3D 0x40000,
> +    dc->realize =3D bcm2836_realize;
> +}

It turns out I was misreading the way you calculate addresses from DTS
files. Reverted to:

    bc->peri_base =3D 0xfe000000;
    bc->ctrl_base =3D 0xff800000;

--=20
Alex Benn=C3=A9e

