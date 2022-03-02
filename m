Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6372D4CA629
	for <lists+qemu-devel@lfdr.de>; Wed,  2 Mar 2022 14:39:08 +0100 (CET)
Received: from localhost ([::1]:50346 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nPPC7-0005mK-HI
	for lists+qemu-devel@lfdr.de; Wed, 02 Mar 2022 08:39:07 -0500
Received: from eggs.gnu.org ([209.51.188.92]:43878)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1nPNsU-0005Jp-KB
 for qemu-devel@nongnu.org; Wed, 02 Mar 2022 07:14:47 -0500
Received: from [2a00:1450:4864:20::530] (port=33515
 helo=mail-ed1-x530.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1nPNsT-0000mc-3u
 for qemu-devel@nongnu.org; Wed, 02 Mar 2022 07:14:46 -0500
Received: by mail-ed1-x530.google.com with SMTP id s14so2024530edw.0
 for <qemu-devel@nongnu.org>; Wed, 02 Mar 2022 04:14:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=references:user-agent:from:to:cc:subject:date:in-reply-to
 :message-id:mime-version:content-transfer-encoding;
 bh=NV6NA/Nwe48ecOcCM9J4f7Mq7Gweo54m6HO2YMX84EI=;
 b=q31j2+aRkgwG9MJ6B1vhEGHABIOnU7MXqMHaHAxULrzm5wlog/VshiVPVW+4lTkwzJ
 0ZQqNBmNCHPnqBmm0UeBH4cXZJylcXC0wHG05k6KsDoZZZBJQ4r2VFDQ+pm75vpZf2SV
 Sak4wHu4fzyLq9WnEIvbdt8rh16hHBMhHDMzaZKDzpkDnbC4PzebNLiowlYq8YJ7m1P5
 lDUrCsT+6v/uRrLXPGXjPeTkpO1+dUf/02N836OUYT8Cdh31B/vP01yS4oQsqgNdgFFU
 hoZsbKPxQ3uUEGWbm64mPjhGVT1no1VEKE7wXVhqpkMoFEyddZ2MYs5CULNBXSiZ+b8Z
 SzpQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:references:user-agent:from:to:cc:subject:date
 :in-reply-to:message-id:mime-version:content-transfer-encoding;
 bh=NV6NA/Nwe48ecOcCM9J4f7Mq7Gweo54m6HO2YMX84EI=;
 b=Am/tXgXXH7RiOo0IyT9MQSY8IB5PqpJML7UjAROE8MLcCY2rB/zueVD+xx4dJEsqhV
 SVdyW4M8toii6c84eYr3SAFAmpDzwYJ9pKRZC5We9D+IqVkyhwPcKIMcAKzuvuW9zP7A
 GiuYzy5uJ9S9reXqjPj8drTSAv6VAywMBnSy2GZEDp8lFy3B9z3jlbvtYohboL8MSvX/
 fjtJEzotJmNHxuMz+2sZDd1e8z4tS88pMam7TnLSRT49W1KeXwJYH1HvV3XNl6AvLMwT
 YYUvVfNzNaz7aE4dQfwyeobeKifdyjMf01FW3fmKJu5eoDT7gcPFOrSBAw5vQa7vu5j4
 gyiw==
X-Gm-Message-State: AOAM531YbZSzmsQ/Q6SeCeHOLd19iDHI/klCyyDUSlhKYeFpubomndlg
 hViVomjlS4fft/31inmAhy2Pbg==
X-Google-Smtp-Source: ABdhPJyEC4fp7pQ0GFEdG7j/1PsqJDZz8Hc/EXvtMksf39pzgpjXIv2Wb9mHDVK8qAgaGvSHp1rb6w==
X-Received: by 2002:a05:6402:5304:b0:413:8a0c:c54a with SMTP id
 eo4-20020a056402530400b004138a0cc54amr21032819edb.172.1646223278902; 
 Wed, 02 Mar 2022 04:14:38 -0800 (PST)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id
 my16-20020a1709065a5000b006d6e1023b7bsm1856260ejc.8.2022.03.02.04.14.37
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 02 Mar 2022 04:14:37 -0800 (PST)
Received: from zen (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id D65641FFB7;
 Wed,  2 Mar 2022 12:14:36 +0000 (GMT)
References: <20220211120747.3074-1-Jonathan.Cameron@huawei.com>
 <20220211120747.3074-25-Jonathan.Cameron@huawei.com>
User-agent: mu4e 1.7.9; emacs 28.0.91
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Jonathan Cameron <Jonathan.Cameron@huawei.com>
Subject: Re: [PATCH v6 24/43] acpi/cxl: Add _OSC implementation (9.14.2)
Date: Wed, 02 Mar 2022 12:14:15 +0000
In-reply-to: <20220211120747.3074-25-Jonathan.Cameron@huawei.com>
Message-ID: <87o82ok0ur.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::530
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::530;
 envelope-from=alex.bennee@linaro.org; helo=mail-ed1-x530.google.com
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
> CXL 2.0 specification adds 2 new dwords to the existing _OSC definition
> from PCIe. The new dwords are accessed with a new uuid. This
> implementation supports what is in the specification.
>
> Signed-off-by: Ben Widawsky <ben.widawsky@intel.com>
> Signed-off-by: Jonathan Cameron <Jonathan.Cameron@huawei.com>

From my limited understanding of the ACPI AML DSL we use:

Reviewed-by: Alex Benn=C3=A9e <alex.bennee@linaro.org>

--=20
Alex Benn=C3=A9e

