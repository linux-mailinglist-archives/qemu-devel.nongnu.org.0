Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 584B74CA216
	for <lists+qemu-devel@lfdr.de>; Wed,  2 Mar 2022 11:24:17 +0100 (CET)
Received: from localhost ([::1]:35422 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nPM9Y-0005up-FR
	for lists+qemu-devel@lfdr.de; Wed, 02 Mar 2022 05:24:16 -0500
Received: from eggs.gnu.org ([209.51.188.92]:46754)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1nPM70-0003zG-Vj
 for qemu-devel@nongnu.org; Wed, 02 Mar 2022 05:21:39 -0500
Received: from [2a00:1450:4864:20::535] (port=34762
 helo=mail-ed1-x535.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1nPM6y-0000iL-Rs
 for qemu-devel@nongnu.org; Wed, 02 Mar 2022 05:21:38 -0500
Received: by mail-ed1-x535.google.com with SMTP id p4so1571750edi.1
 for <qemu-devel@nongnu.org>; Wed, 02 Mar 2022 02:21:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=references:user-agent:from:to:cc:subject:date:in-reply-to
 :message-id:mime-version:content-transfer-encoding;
 bh=/Lv0QiGiMPXUp9tW+ey9C8YoyPBhTcyAOPxIDFYGmLc=;
 b=bpuIj0g9nNVopoEw9zjYo2yi0w4IuNGMA4rcNxAbM9o2pJXD+xjNn6HzT+c78qbQx+
 dhxwhLp9oz5+DXEFWTen1iVt7N2wcSYdcgr7lnTgQ6ROGdTlCf4GAbLB8fvD571px3EU
 1sjot/B++i35UkBwlBfW+WSgkISPp727wMJdEfl3kLK38hUtScHjiiwyaADCeHeafAkT
 2TH89OQzJGW0yM4cfONxxNrg/3RGeILW6fJwbyy1Jg1ifdoj6lieRDPDMR/A7tfJeT9L
 UQeA6C/+j2j1Pvl55HFbKLgxtAI0pw0F/Sgk0ZukdQGTgN40r2GOGvAY6ALAmznyBM3y
 KJwg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:references:user-agent:from:to:cc:subject:date
 :in-reply-to:message-id:mime-version:content-transfer-encoding;
 bh=/Lv0QiGiMPXUp9tW+ey9C8YoyPBhTcyAOPxIDFYGmLc=;
 b=UVpMd97K+8yHJQaetInfUT1stuoRY1sDoyomuICsM4Wxxe9yJP/ZIse6WSCDVAPNEw
 yL9DOL0Q1KKmLFpHkFU4DdMns0xepLKUdn9HHG/oYkTtvu5DUR2qPtmyY7E3PY2X29E0
 0jap7bymKiGIn3AXNrxfgjZ2lv8XdJ+5RvFt5oCuW4t6ktx7WzXmwtSd2AfuY9aAYD1t
 uQdhjLgTWjBITMURMCUYB2RYdRSyNsBqSh/mRmvP/ixc9wBe0qvHEs88bzXPqNOadg4e
 DSP3Jk1Ns2lwkwCg2DOWFGRvNacf+tobu24BizvouHJ29ovSbSbsYm4n9m716xFicKo5
 8hdg==
X-Gm-Message-State: AOAM533vPG2ZSDSb8H4m9AmYs0l3912g77gg0YVIUfB9R6fkYAjJZkO3
 ztV0P8AydOUNP7Itlu7G2bwiuw==
X-Google-Smtp-Source: ABdhPJx1cHpdl6yo5lQMzlsTz2tuYX4VNlAWau8oWy5J3vROkRy9ofdDujiNxl/7XtO4bssWW2DwUQ==
X-Received: by 2002:a50:f1c9:0:b0:415:a0f6:147d with SMTP id
 y9-20020a50f1c9000000b00415a0f6147dmr4589046edl.247.1646216493351; 
 Wed, 02 Mar 2022 02:21:33 -0800 (PST)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id
 r23-20020aa7da17000000b00415a1431488sm1142585eds.4.2022.03.02.02.21.32
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 02 Mar 2022 02:21:32 -0800 (PST)
Received: from zen (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 7F4A91FFB7;
 Wed,  2 Mar 2022 10:21:31 +0000 (GMT)
References: <20220211120747.3074-1-Jonathan.Cameron@huawei.com>
 <20220211120747.3074-24-Jonathan.Cameron@huawei.com>
User-agent: mu4e 1.7.9; emacs 28.0.91
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Jonathan Cameron <Jonathan.Cameron@huawei.com>
Subject: Re: [PATCH v6 23/43] hw/cxl/component: Implement host bridge MMIO
 (8.2.5, table 142)
Date: Wed, 02 Mar 2022 10:20:27 +0000
In-reply-to: <20220211120747.3074-24-Jonathan.Cameron@huawei.com>
Message-ID: <87sfs0k638.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::535
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::535;
 envelope-from=alex.bennee@linaro.org; helo=mail-ed1-x535.google.com
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
> CXL host bridges themselves may have MMIO. Since host bridges don't have
> a BAR they are treated as special for MMIO.  This patch includes
> i386/pc support.
> Also hook up the device reset now that we have have the MMIO
> space in which the results are visible.
>
> Note that we duplicate the PCI express case for the aml_build but
> the implementations will diverge when the CXL specific _OSC is
> introduced.
>
> Signed-off-by: Ben Widawsky <ben.widawsky@intel.com>
> Co-developed-by: Jonathan Cameron <Jonathan.Cameron@huawei.com>
> Signed-off-by: Jonathan Cameron <Jonathan.Cameron@huawei.com>

Looks good to me although I'll defer to the i386 maintainers if they
think otherwise.

Reviewed-by: Alex Benn=C3=A9e <alex.bennee@linaro.org>

--=20
Alex Benn=C3=A9e

