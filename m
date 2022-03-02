Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0916B4CA9D4
	for <lists+qemu-devel@lfdr.de>; Wed,  2 Mar 2022 17:09:21 +0100 (CET)
Received: from localhost ([::1]:41226 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nPRXU-0002MJ-5N
	for lists+qemu-devel@lfdr.de; Wed, 02 Mar 2022 11:09:20 -0500
Received: from eggs.gnu.org ([209.51.188.92]:55702)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1nPRVX-0000GY-7R
 for qemu-devel@nongnu.org; Wed, 02 Mar 2022 11:07:19 -0500
Received: from [2a00:1450:4864:20::633] (port=36559
 helo=mail-ej1-x633.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1nPRVV-00085w-Pm
 for qemu-devel@nongnu.org; Wed, 02 Mar 2022 11:07:18 -0500
Received: by mail-ej1-x633.google.com with SMTP id a23so4764084eju.3
 for <qemu-devel@nongnu.org>; Wed, 02 Mar 2022 08:07:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=references:user-agent:from:to:cc:subject:date:in-reply-to
 :message-id:mime-version:content-transfer-encoding;
 bh=3HxVcZFOx1bhvGyTKX1xjCIBgYPPeFXCl5LnaVw2CJA=;
 b=rtU+gRGSj7iM6CkiD+y572VUCmSgfALxJU1+CWbLyu+QZL1roMbTAmbVvLTJgnYeZ1
 K3ZMWB3VMf2CFaFh/2m58KiUKZxjhcUZHdEX1jQyf8TxWj6zpz9YkZaY4IpYeeVu/R8l
 4V93UDM9u2M8riU5equWta9tkEe+Q2Lxev3e2wKxVPEXxd5228bsribiH68UTHqyAN6F
 S2Juvt47jv8YznnOvtlwOi5WZKKSXGznM128uZUmi7tjc0abJ3BcOe+F3T244YhA57Aw
 E/IJIQE3iAtdS9JPSyLMaEWhD9zmgJHQlO+aDfb70a7HI+BsuMVOIVe40X2YRkT3fxFQ
 MMcA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:references:user-agent:from:to:cc:subject:date
 :in-reply-to:message-id:mime-version:content-transfer-encoding;
 bh=3HxVcZFOx1bhvGyTKX1xjCIBgYPPeFXCl5LnaVw2CJA=;
 b=23rRCi2PoIlwLaDrBL7dPEkxJiAunHtL3Km3LE6WGnOZQRAGOyBMAPAFtQL/NUDFs2
 /i5EKmqs9fhwNV/GTQEqzwMAJ+qIaCr0yq/mwwGOOZ8RmELo2xwZZXWiw6IdemqTIdYf
 xZStd4A0+rGFq0bzKlF+2QDeRGpDONQ5POS3PB4+guP8B02R7KIvgdldvA+IGOBNPysW
 8hcKdoxdsjI2Y3A+deUJNmWYCr2CTh55PR+TVrtBt3qmoCKM7PtOxdzqelTsSoXMtskA
 aNABvMWCgArVakFxqWVkgu+ISUVrHz3vbukPFoy0MBaMDnzdQUz0xX9snM1YYFdw/HUZ
 I2PQ==
X-Gm-Message-State: AOAM530cqKF2QMHlLFmg0J1KFPbhwDTDFk+uX4J/F1svtE/+q2OFSH3F
 jO3zsMova1UqEwY5ATPlNChOPQ==
X-Google-Smtp-Source: ABdhPJwWxK4cqoNeBoaLHgzQNiQC5hNVfDOBRqDGDx6L5n65VP48fvkszAktjlvuftrjUBh1/ggaWw==
X-Received: by 2002:a17:906:3a84:b0:6cd:e829:ca37 with SMTP id
 y4-20020a1709063a8400b006cde829ca37mr24151790ejd.83.1646237235749; 
 Wed, 02 Mar 2022 08:07:15 -0800 (PST)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id
 zb5-20020a17090687c500b006ce2a98f715sm6393575ejb.117.2022.03.02.08.07.13
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 02 Mar 2022 08:07:14 -0800 (PST)
Received: from zen (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id DBE301FFB7;
 Wed,  2 Mar 2022 16:07:12 +0000 (GMT)
References: <20220211120747.3074-1-Jonathan.Cameron@huawei.com>
 <20220211120747.3074-31-Jonathan.Cameron@huawei.com>
User-agent: mu4e 1.7.9; emacs 28.0.91
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Jonathan Cameron <Jonathan.Cameron@huawei.com>
Subject: Re: [PATCH v6 30/43] pci/pcie_port: Add pci_find_port_by_pn()
Date: Wed, 02 Mar 2022 16:07:06 +0000
In-reply-to: <20220211120747.3074-31-Jonathan.Cameron@huawei.com>
Message-ID: <87y21sibin.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::633
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::633;
 envelope-from=alex.bennee@linaro.org; helo=mail-ej1-x633.google.com
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

> From: Jonathan Cameron <jonathan.cameron@huawei.com>
>
> Simple function to search a PCIBus to find a port by
> it's port number.
>
> CXL interleave decoding uses the port number as a target
> so it is necessary to locate the port when doing interleave
> decoding.
>
> Signed-off-by: Jonathan Cameron <jonathan.cameron@huawei.com>

Reviewed-by: Alex Benn=C3=A9e <alex.bennee@linaro.org>

--=20
Alex Benn=C3=A9e

