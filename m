Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 389834CA59D
	for <lists+qemu-devel@lfdr.de>; Wed,  2 Mar 2022 14:09:48 +0100 (CET)
Received: from localhost ([::1]:33194 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nPOjj-0006FC-2Q
	for lists+qemu-devel@lfdr.de; Wed, 02 Mar 2022 08:09:47 -0500
Received: from eggs.gnu.org ([209.51.188.92]:45050)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1nPNuh-0000ci-Uu
 for qemu-devel@nongnu.org; Wed, 02 Mar 2022 07:17:04 -0500
Received: from [2a00:1450:4864:20::62a] (port=43750
 helo=mail-ej1-x62a.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1nPNuf-0001Rh-R3
 for qemu-devel@nongnu.org; Wed, 02 Mar 2022 07:17:03 -0500
Received: by mail-ej1-x62a.google.com with SMTP id d10so3291631eje.10
 for <qemu-devel@nongnu.org>; Wed, 02 Mar 2022 04:16:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=references:user-agent:from:to:cc:subject:date:in-reply-to
 :message-id:mime-version:content-transfer-encoding;
 bh=/84AvN/V83Oq1qZvODm1Fitth6dVROGE3KJULt/rHIU=;
 b=HpEBHuANEXVPI3QwoIH+rLLe9O/rvn9WzHl4I4vxC+rAj9Q2W94G2Gwanldwr3acs3
 2wXJNu0sCAnRw74sjWvqtH8YKF80XYaGLoHLdIJUV0wuKjykMlhwtP/COatoGKZUHwFh
 VRdCI+yqVLQfw138Oyw3txw9xdT9XbyHFgWNYa4qn2Bhd9jJQO4eIObT6nOoMn6aaSkT
 ehC9+yrjWwQ7y21PK7JWPhcirx6qxe5fY4o+WZGj3oSWQ9N1KoVoQBFzIlhLF8L56P3p
 wm25ouCm13LvgVoXRJ5JntvsiPxL1p9UPY4qDe3gkpGeWezjgojkfVN+fv09DEBTIw9a
 P1Dg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:references:user-agent:from:to:cc:subject:date
 :in-reply-to:message-id:mime-version:content-transfer-encoding;
 bh=/84AvN/V83Oq1qZvODm1Fitth6dVROGE3KJULt/rHIU=;
 b=WmtOZ6AS3AZ+22Nuu/is1APx6xNbFOkkBZWuyWFhPhAT9ydidN9BDUU/S+2oYhUIfJ
 zdGn0qX0HDk1H30yYyMpmEArXRsUe1WYna7XeW+hPMMHCA8ssS38zTp2oGFbms92tqib
 SBDj+sn2X+2DIq1/agHiMQ9NMmL9OW16ioklYJqoLAl7OLRXiNjZs51UUcoIG+BAA8N4
 voYN8xr/s1DCHTphwnK6/oQ1XPWPaucBwlZI4Onbb7LtWCiSIHnU8NRRwqtK02t78UM6
 NHn8vAjxlqX61d60tnrLrR7VwUlHKAwSwIEhRXXHMiwyuk0xyyq24KCde7L0w2wPkAUj
 +sVw==
X-Gm-Message-State: AOAM532QlHytyDoSul3aQbMz3vZaQ9yW0XdcUuKwMqAPW9x6B/aS0y0H
 aRykhYJ+dqhz5J0F1WoOdKv5MQ==
X-Google-Smtp-Source: ABdhPJzyb8qNK78797w/gXMaIuX6BOJSFa4o0M//VStsYBxdVWN024aMfnRXfLONMHXVf78ZmKwyDQ==
X-Received: by 2002:a17:907:9898:b0:6cd:ed45:1123 with SMTP id
 ja24-20020a170907989800b006cded451123mr23613605ejc.155.1646223417953; 
 Wed, 02 Mar 2022 04:16:57 -0800 (PST)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id
 f5-20020a1709067f8500b006da68bfdfc7sm399202ejr.12.2022.03.02.04.16.56
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 02 Mar 2022 04:16:56 -0800 (PST)
Received: from zen (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id E9D481FFB7;
 Wed,  2 Mar 2022 12:16:55 +0000 (GMT)
References: <20220211120747.3074-1-Jonathan.Cameron@huawei.com>
 <20220211120747.3074-26-Jonathan.Cameron@huawei.com>
User-agent: mu4e 1.7.9; emacs 28.0.91
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Jonathan Cameron <Jonathan.Cameron@huawei.com>
Subject: Re: [PATCH v6 25/43] acpi/cxl: Create the CEDT (9.14.1)
Date: Wed, 02 Mar 2022 12:16:48 +0000
In-reply-to: <20220211120747.3074-26-Jonathan.Cameron@huawei.com>
Message-ID: <87k0dck0qw.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::62a
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::62a;
 envelope-from=alex.bennee@linaro.org; helo=mail-ej1-x62a.google.com
X-Spam_score_int: -6
X-Spam_score: -0.7
X-Spam_bar: /
X-Spam_report: (-0.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 PDS_HP_HELO_NORDNS=0.659, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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
 .  Tsirkin" <mst@redhat.com>, Samarth Saxena <samarths@cadence.com>,
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

> From: Ben Widawsky <ben.widawsky@intel.com>
>
> The CXL Early Discovery Table is defined in the CXL 2.0 specification as
> a way for the OS to get CXL specific information from the system
> firmware.
>
> CXL 2.0 specification adds an _HID, ACPI0016, for CXL capable host
> bridges, with a _CID of PNP0A08 (PCIe host bridge). CXL aware software
> is able to use this initiate the proper _OSC method, and get the _UID
> which is referenced by the CEDT. Therefore the existence of an ACPI0016
> device allows a CXL aware driver perform the necessary actions. For a
> CXL capable OS, this works. For a CXL unaware OS, this works.
>
> CEDT awaremess requires more. The motivation for ACPI0017 is to provide
> the possibility of having a Linux CXL module that can work on a legacy
> Linux kernel. Linux core PCI/ACPI which won't be built as a module,
> will see the _CID of PNP0A08 and bind a driver to it. If we later loaded
> a driver for ACPI0016, Linux won't be able to bind it to the hardware
> because it has already bound the PNP0A08 driver. The ACPI0017 device is
> an opportunity to have an object to bind a driver will be used by a
> Linux driver to walk the CXL topology and do everything that we would
> have preferred to do with ACPI0016.
>
> There is another motivation for an ACPI0017 device which isn't
> implemented here. An operating system needs an attach point for a
> non-volatile region provider that understands cross-hostbridge
> interleaving. Since QEMU emulation doesn't support interleaving yet,
> this is more important on the OS side, for now.
>
> As of CXL 2.0 spec, only 1 sub structure is defined, the CXL Host Bridge
> Structure (CHBS) which is primarily useful for telling the OS exactly
> where the MMIO for the host bridge is.
>
> Link: https://lore.kernel.org/linux-cxl/20210115034911.nkgpzc756d6qmjpl@i=
ntel.com/T/#t
> Signed-off-by: Ben Widawsky <ben.widawsky@intel.com>
> Signed-off-by: Jonathan Cameron <Jonathan.Cameron@huawei.com>

Reviewed-by: Alex Benn=C3=A9e <alex.bennee@linaro.org>

--=20
Alex Benn=C3=A9e

