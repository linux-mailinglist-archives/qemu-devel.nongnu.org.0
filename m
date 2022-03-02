Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 57EDC4CA624
	for <lists+qemu-devel@lfdr.de>; Wed,  2 Mar 2022 14:35:50 +0100 (CET)
Received: from localhost ([::1]:45574 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nPP8v-0002Rq-EW
	for lists+qemu-devel@lfdr.de; Wed, 02 Mar 2022 08:35:49 -0500
Received: from eggs.gnu.org ([209.51.188.92]:45178)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1nPNvY-0001I3-FV
 for qemu-devel@nongnu.org; Wed, 02 Mar 2022 07:18:00 -0500
Received: from [2a00:1450:4864:20::62c] (port=38786
 helo=mail-ej1-x62c.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1nPNvV-0001c5-VL
 for qemu-devel@nongnu.org; Wed, 02 Mar 2022 07:17:56 -0500
Received: by mail-ej1-x62c.google.com with SMTP id r13so3354623ejd.5
 for <qemu-devel@nongnu.org>; Wed, 02 Mar 2022 04:17:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=references:user-agent:from:to:cc:subject:date:in-reply-to
 :message-id:mime-version:content-transfer-encoding;
 bh=XFbsNJ/C8bGOizqltxDMSepVZdclwbG6sb4etyg80Ak=;
 b=dmWAoLHD+jxyQfpkqYN6miTKY4pqgOWbiq7KTwnspmAwpUdK3txyqQPQLiICaz0BYo
 S+eaA9ZaL9Fq7vIOyjjNCisHaTPKa4894VTU0udtmWn3nIBKG+sH8Gw9pOk6QZowvN7N
 /15DxiCbZ8enreVFoheClqwPMHJA4ILHYZbnUNQbvGruHyfYibHIqXkrvE5pkEvGSqn0
 lx4B3Z3Ok1iWahrTsq/+D8sWKaoDRVvH0tE1xSzn8+7V65KsMgf9Degiy5gPtoJM/ldk
 VRyez9e1GEt2UdVMbSTnGaYZ4YiRcvbOljc36iVeMkurD/6W+x+d2t+wpowexEu6+e0Y
 X0KQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:references:user-agent:from:to:cc:subject:date
 :in-reply-to:message-id:mime-version:content-transfer-encoding;
 bh=XFbsNJ/C8bGOizqltxDMSepVZdclwbG6sb4etyg80Ak=;
 b=5PS9VMEknpgA2CGd7X8CfqffEF3cLe17lDV1O7osvpy/3vSgbjR6k6no3oIXfLs4Wm
 GMNS/nYn8/VYfki2BM/ujMCip/4GtVQpOHH9DOJoy2pFpkOYLcL/s1+dDZj4qkrWTAJk
 H3rJEwZ0mzwD8PFque7KKzZKBZOPm4srdZj1gWZSSPuEtXAGp6r+ogfu/KQZDJcir4xP
 WOThNBXZJzDdIxF/WK6oguOTKRnpR8mQGEB3HeOaPHhED2PUpzFEz6/7+MiRXPYLI+JJ
 /XB1Z/aMfEX5/PjpDZv0FH5QjcX6uWvY2Ar9C9kMLeIE34ROjM/0O3wSluq4UxzShSec
 9H7w==
X-Gm-Message-State: AOAM530LsvnewtW+BqGwqzhm0W/I0tTv1SbbsC4Fto7tckXzgIOn8x/V
 gdn24/yHOwakP60ohDjFL94DNg==
X-Google-Smtp-Source: ABdhPJxcb3KLiVPqrIY+ap+FGTLMif1vYEWIVSVtnBlP44+TC5zacuoa8DO8MJe7t52mI7A8VBCMMw==
X-Received: by 2002:a17:906:1c57:b0:69f:2625:3f67 with SMTP id
 l23-20020a1709061c5700b0069f26253f67mr21784165ejg.632.1646223462683; 
 Wed, 02 Mar 2022 04:17:42 -0800 (PST)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id
 q9-20020a170906770900b006d20acf7e2bsm6257729ejm.200.2022.03.02.04.17.41
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 02 Mar 2022 04:17:41 -0800 (PST)
Received: from zen (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id E7F9B1FFB7;
 Wed,  2 Mar 2022 12:17:40 +0000 (GMT)
References: <20220211120747.3074-1-Jonathan.Cameron@huawei.com>
 <20220211120747.3074-27-Jonathan.Cameron@huawei.com>
User-agent: mu4e 1.7.9; emacs 28.0.91
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Jonathan Cameron <Jonathan.Cameron@huawei.com>
Subject: Re: [PATCH v6 26/43] hw/cxl/component: Add utils for interleave
 parameter encoding/decoding
Date: Wed, 02 Mar 2022 12:17:35 +0000
In-reply-to: <20220211120747.3074-27-Jonathan.Cameron@huawei.com>
Message-ID: <87fso0k0pn.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::62c
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::62c;
 envelope-from=alex.bennee@linaro.org; helo=mail-ej1-x62c.google.com
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
> Both registers and the CFMWS entries in CDAT use simple encodings
> for the number of interleave ways and the interleave granularity.
> Introduce simple conversion functions to/from the unencoded
> number / size.  So far the iw decode has not been needed so is
> it not implemented.
>
> Signed-off-by: Jonathan Cameron <Jonathan.Cameron@huawei.com>

Reviewed-by: Alex Benn=C3=A9e <alex.bennee@linaro.org>

--=20
Alex Benn=C3=A9e

