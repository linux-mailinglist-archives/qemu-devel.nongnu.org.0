Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 69A6249E469
	for <lists+qemu-devel@lfdr.de>; Thu, 27 Jan 2022 15:16:30 +0100 (CET)
Received: from localhost ([::1]:37800 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nD5Zd-0007xx-FG
	for lists+qemu-devel@lfdr.de; Thu, 27 Jan 2022 09:16:29 -0500
Received: from eggs.gnu.org ([209.51.188.92]:52090)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1nD5WB-0005E7-Vi
 for qemu-devel@nongnu.org; Thu, 27 Jan 2022 09:12:55 -0500
Received: from [2a00:1450:4864:20::636] (port=40704
 helo=mail-ej1-x636.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1nD5Vz-0001zX-NT
 for qemu-devel@nongnu.org; Thu, 27 Jan 2022 09:12:45 -0500
Received: by mail-ej1-x636.google.com with SMTP id p15so6083474ejc.7
 for <qemu-devel@nongnu.org>; Thu, 27 Jan 2022 06:12:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=references:user-agent:from:to:cc:subject:date:in-reply-to
 :message-id:mime-version:content-transfer-encoding;
 bh=KLTW43m14STAUOT82UxdiR7lbPM9jRR2XlYTsv+pZb8=;
 b=LSKiQNQ/QDgcXDk80fCC+vPvJCCtK4mCR6QO+86xQG0j3STLd3VHVNLvfxMcaNfvfU
 8x0fZYewSKI0Lp2TAiU0Dbd2yexqmNKVJCeN9DZwLjF5Z4WH7b1UEh39MvxEDIa7Zz4/
 QyfVlYh1ORz8cE+cpW5+nHY/pgsuKor8o4aRwtiCjK3vOa21tx1hV3VmmnM2Vadmp4gI
 7HNAwOQBZnBPrEcsg+sw2hHZLCQEkQ1eFmg5xXa57TOYUl7n4l1YSs2NTM1PnEKO0NCZ
 ZU5JnYyHzmF7eMqsfqFpHf0jGSkMnfbMF8feZpqHQZEBdeIz8tkwwwVH7c5GtuwjZ3iC
 rvPQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:references:user-agent:from:to:cc:subject:date
 :in-reply-to:message-id:mime-version:content-transfer-encoding;
 bh=KLTW43m14STAUOT82UxdiR7lbPM9jRR2XlYTsv+pZb8=;
 b=AZk6dXhuhlTX5nHtCelfX4vdDzB7w6iSHbxDIVjwCn/FINNF1ZKNoWaawqWVPGTbVx
 hwvSL4mn55O+oixzcL0tNPX0i093ivGOQVD1UAOBzlM0opBB/kLWiBx0/781MNpky6TF
 uDP9F+nv86gumGnT0xwPfRQ4bsnR2c/1WEYf+Y3jWadEwpv8hg5j8L4GyMy+RM6LgPMu
 kTpxlBq3cw4ObxJGDDCt55HmZYopj1uhan3/4zIRhKwziipcEkvFNxVjy0ir60jMMxvH
 +kgQRCuuEuZ251guHiL3lFjCUF+lryKwKz8qIzqdIxAVvRW3qszPUhO1GW2Mgd4a5jSM
 v6Ww==
X-Gm-Message-State: AOAM533JDVqZrHHwsHuD0tFjJ8wObxVO7NwblFBNm4TjkDJwLS+lD4Df
 s7MagSymDg5/3lWM33HvAkrW8g==
X-Google-Smtp-Source: ABdhPJxRAYsYL5RpikAUlTxLEzPGj4fGnku4zZ0OeqxLswk+XuLJqQDV02jMOOSuyJl7sVPR1NMjRA==
X-Received: by 2002:a17:906:938f:: with SMTP id
 l15mr3028131ejx.99.1643292759195; 
 Thu, 27 Jan 2022 06:12:39 -0800 (PST)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id by22sm8777166ejb.84.2022.01.27.06.12.37
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 27 Jan 2022 06:12:38 -0800 (PST)
Received: from zen (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 7A7F61FFB7;
 Thu, 27 Jan 2022 14:12:37 +0000 (GMT)
References: <20220124171705.10432-1-Jonathan.Cameron@huawei.com>
 <20220124171705.10432-17-Jonathan.Cameron@huawei.com>
User-agent: mu4e 1.7.6; emacs 28.0.91
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Jonathan Cameron <Jonathan.Cameron@huawei.com>
Subject: Re: [PATCH v4 16/42] tests/acpi: Add update DSDT.viot
Date: Thu, 27 Jan 2022 14:12:24 +0000
In-reply-to: <20220124171705.10432-17-Jonathan.Cameron@huawei.com>
Message-ID: <871r0t9siy.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::636
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::636;
 envelope-from=alex.bennee@linaro.org; helo=mail-ej1-x636.google.com
X-Spam_score_int: -12
X-Spam_score: -1.3
X-Spam_bar: -
X-Spam_report: (-1.3 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 PDS_HP_HELO_NORDNS=0.001, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Ben Widawsky <ben.widawsky@intel.com>, "Michael S
 . Tsirkin" <mst@redhat.com>, Samarth Saxena <samarths@cadence.com>,
 Chris Browy <cbrowy@avery-design.com>, qemu-devel@nongnu.org,
 linux-cxl@vger.kernel.org, linuxarm@huawei.com,
 Shreyas Shah <shreyas.shah@elastics.cloud>, Saransh Gupta1 <saransh@ibm.com>,
 Shameerali Kolothum Thodi <shameerali.kolothum.thodi@huawei.com>,
 Marcel Apfelbaum <marcel@redhat.com>, Igor Mammedov <imammedo@redhat.com>,
 Dan Williams <dan.j.williams@intel.com>,
 Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


Jonathan Cameron <Jonathan.Cameron@huawei.com> writes:

> From: Jonathan Cameron <jonathan.cameron@huawei.com>
>
> The consolidation of DSDT AML generation for PCI host bridges
> lead to some minor ordering changes and the addition of _ADR
> with a default of 0 for those case that didn't already have it.
> Only DSDT.viot test is affected.
>
> Changes all similar to:
>
> Scope (\_SB)
>      {
>        Device (PC30)
>        {
> -        Name (_UID, 0x30)  // _UID: Unique ID
>          Name (_BBN, 0x30)  // _BBN: BIOS Bus Number
>          Name (_HID, EisaId ("PNP0A08") /* PCI Express Bus */)  // _HID: =
Hardware ID
>          Name (_CID, EisaId ("PNP0A03") /* PCI Bus */)  // _CID: Compatib=
le ID
> +        Name (_ADR, Zero)  // _ADR: Address
> +        Name (_UID, 0x30)  // _UID: Unique ID
>          Method (_OSC, 4, NotSerialized)  // _OSC: Operating System Capab=
ilities
>
> Signed-off-by: Jonathan Cameron <jonathan.cameron@huawei.com>
> ---
>  tests/data/acpi/q35/DSDT.viot               | Bin 9398 -> 9416 bytes
>  tests/qtest/bios-tables-test-allowed-diff.h |   1 -
>  2 files changed, 1 deletion(-)
>
> diff --git a/tests/data/acpi/q35/DSDT.viot b/tests/data/acpi/q35/DSDT.viot
> index 1c3b4da5cbe81ecab5e1ef50d383b561c5e0f55f..207ac5b9ae4c3a4bc0094c224=
2d1a1b08771b784 100644
> GIT binary patch
> delta 139
> zcmdnydBT&+CD<k8gbD)#<CBeCu5zLdVlnZ-PVv!A?xF$C#s(bmPELMY6KfQhxC}No
> z$Z0Y1qbM*kn0!E9nwKNq(Itq1BR<sAg-ZdbOrCM_F9mK?rG^HRr4><?3V@Yv4pmBI
> F0sxp4B{u*7
>
> delta 143
> zcmX@%xy_TyCD<ion+gL1<MNGMu5zMYqA~HoPVv!Aj-mn1#s(bmp`I>WlVjy%CeC%7
> z+^Kj^(SX5#0jQdxl0g7Ptr1kM!sPw((lEse3<_8k8$uNeOjb|?Dc;<vXwM7)8)+to
>
> diff --git a/tests/qtest/bios-tables-test-allowed-diff.h b/tests/qtest/bi=
os-tables-test-allowed-diff.h
> index 08a8095432..dfb8523c8b 100644
> --- a/tests/qtest/bios-tables-test-allowed-diff.h
> +++ b/tests/qtest/bios-tables-test-allowed-diff.h
> @@ -1,2 +1 @@
>  /* List of comma-separated changed AML files to ignore */
> -"tests/data/acpi/q35/DSDT.viot",

squash with the change please.

--=20
Alex Benn=C3=A9e

