Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1780F4CA7FA
	for <lists+qemu-devel@lfdr.de>; Wed,  2 Mar 2022 15:26:31 +0100 (CET)
Received: from localhost ([::1]:36678 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nPPvx-0001r6-Br
	for lists+qemu-devel@lfdr.de; Wed, 02 Mar 2022 09:26:29 -0500
Received: from eggs.gnu.org ([209.51.188.92]:43886)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1nPPR8-00075O-Pm
 for qemu-devel@nongnu.org; Wed, 02 Mar 2022 08:54:40 -0500
Received: from [2a00:1450:4864:20::42a] (port=45894
 helo=mail-wr1-x42a.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1nPPR7-0006mm-3Y
 for qemu-devel@nongnu.org; Wed, 02 Mar 2022 08:54:38 -0500
Received: by mail-wr1-x42a.google.com with SMTP id p9so2877911wra.12
 for <qemu-devel@nongnu.org>; Wed, 02 Mar 2022 05:54:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=references:user-agent:from:to:cc:subject:date:in-reply-to
 :message-id:mime-version:content-transfer-encoding;
 bh=veeaUjUn+FUQY470e1mkrwZGuA+EahQ3ScQLbqNSYVM=;
 b=L76R0PXD6zshCdwHrkBD93YVBX4HPuSEsTjsQ89KBRfSAhJq8YOW/bM/MR5suC0leo
 qJRQfXzFCwfMLmrCZirIf2mDatmwHI865tMUY9QqhCqaYaZmG3R4BBYjFJY8SYSUrmVr
 ZGWhubiMuR1kP75DTOBk5waN/VG+5DRAR9iIB6BpVs6AM2jzQPFnCRRZlJTQZFimZMRx
 DZVhCD2zJ5yxLnaNh2K6CNl3hKCtfeUtTn2datMOJ1ybDCuGLfxBT6l9dZefTqItgRXr
 sZLkWxm9Mjke7Dy9kZ/xNqOKAV9zRvvsm2TN+LD7DgRLsB+9cNIs9hgq7XUdEg8rzUgn
 egeQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:references:user-agent:from:to:cc:subject:date
 :in-reply-to:message-id:mime-version:content-transfer-encoding;
 bh=veeaUjUn+FUQY470e1mkrwZGuA+EahQ3ScQLbqNSYVM=;
 b=hBmsROnut7NvMeHCk7uOAqtELGIg5ZILYq0KCpJyEYjfWajQjhNWikRZH4OAEnl2eJ
 LahgsLM9D+ReXoCwx1iV6m58i9DaJnvYR4+221WqlKAJEPfvhUl8XQdPhd43yRSihxOH
 v4R2ktwRecj9nVfFl99LLFjUUTLkfBUK8AhSAJF60jdjDQ7NI8cY/8mQTcflctQY6tcQ
 Bu3jJY4PGqT8No1isBwCbTmvqTXv71goI9OoWGWLtDp7jvl+UchmMJMZDWoOrtsMUuDk
 9uojJ++ub4rFni41zhzDyoAb1chO5MiJ4b5+GJ/e7jhIRmEG/0Dk+DEYAqaO6VMjiLJ3
 CxCQ==
X-Gm-Message-State: AOAM530yA2ihPlejy6fBC4nDxupDTZWlo2jM0nT01ino79CtMbXItkGH
 x4YK6znwtqj0EktcW2WnTMmzTQ==
X-Google-Smtp-Source: ABdhPJz25iERODI7sKKweiwLob9JpOOXsDnn+Cze8Rh2KLpJzVitQ9s2Q6H/oI6LUJWkuqCcPMcHjg==
X-Received: by 2002:a5d:544d:0:b0:1ee:880d:3391 with SMTP id
 w13-20020a5d544d000000b001ee880d3391mr21838854wrv.72.1646229275410; 
 Wed, 02 Mar 2022 05:54:35 -0800 (PST)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id
 n8-20020adf8b08000000b001f046cc8891sm1041497wra.24.2022.03.02.05.54.34
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 02 Mar 2022 05:54:34 -0800 (PST)
Received: from zen (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 81BE01FFB7;
 Wed,  2 Mar 2022 13:54:33 +0000 (GMT)
References: <20220211120747.3074-1-Jonathan.Cameron@huawei.com>
 <20220211120747.3074-30-Jonathan.Cameron@huawei.com>
User-agent: mu4e 1.7.9; emacs 28.0.91
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Jonathan Cameron <Jonathan.Cameron@huawei.com>
Subject: Re: [PATCH v6 29/43] hw/pci-host/gpex-acpi: Add support for dsdt
 construction for pxb-cxl
Date: Wed, 02 Mar 2022 13:53:45 +0000
In-reply-to: <20220211120747.3074-30-Jonathan.Cameron@huawei.com>
Message-ID: <877d9cjw86.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::42a
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::42a;
 envelope-from=alex.bennee@linaro.org; helo=mail-wr1-x42a.google.com
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

> This adds code to instantiate the slightly extended ACPI root port
> description in DSDT as per the CXL 2.0 specification.
>
> Basically a cut and paste job from the i386/pc code.
>
> Signed-off-by: Jonathan Cameron <Jonathan.Cameron@huawei.com>
> Signed-off-by: Ben Widawsky <ben.widawsky@intel.com>
<snip>
> @@ -139,6 +140,7 @@ void acpi_dsdt_add_gpex(Aml *scope, struct GPEXConfig=
 *cfg)
>          QLIST_FOREACH(bus, &bus->child, sibling) {
>              uint8_t bus_num =3D pci_bus_num(bus);
>              uint8_t numa_node =3D pci_bus_numa_node(bus);
> +            bool is_cxl;
>=20=20
>              if (!pci_bus_is_root(bus)) {
>                  continue;
> @@ -153,9 +155,19 @@ void acpi_dsdt_add_gpex(Aml *scope, struct GPEXConfi=
g *cfg)
>                  nr_pcie_buses =3D bus_num;
>              }
>=20=20
> +            is_cxl =3D pci_bus_is_cxl(bus);
> +

nit: you could hoist the setting of is_cxl to the declaration and leave
it to the compiler to move it about if you want.

Anyway:

Reviewed-by: Alex Benn=C3=A9e <alex.bennee@linaro.org>

--=20
Alex Benn=C3=A9e

