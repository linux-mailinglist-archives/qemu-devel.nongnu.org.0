Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5BAEA4CA9E0
	for <lists+qemu-devel@lfdr.de>; Wed,  2 Mar 2022 17:10:58 +0100 (CET)
Received: from localhost ([::1]:43390 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nPRZ3-0003yQ-6R
	for lists+qemu-devel@lfdr.de; Wed, 02 Mar 2022 11:10:57 -0500
Received: from eggs.gnu.org ([209.51.188.92]:55736)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1nPRVt-0000by-0c
 for qemu-devel@nongnu.org; Wed, 02 Mar 2022 11:07:41 -0500
Received: from [2a00:1450:4864:20::534] (port=33619
 helo=mail-ed1-x534.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1nPRVr-000886-C7
 for qemu-devel@nongnu.org; Wed, 02 Mar 2022 11:07:40 -0500
Received: by mail-ed1-x534.google.com with SMTP id s14so2975847edw.0
 for <qemu-devel@nongnu.org>; Wed, 02 Mar 2022 08:07:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=references:user-agent:from:to:cc:subject:date:in-reply-to
 :message-id:mime-version:content-transfer-encoding;
 bh=3tw+/dxXxPhC+vkYuGpxcbT7uVsWPReMTgAw09Ymdxo=;
 b=CH/HBfJkRkUqcOhRweS+9Bak3CCces6EnsazPPm2bvU0LkNZTusLHGIbrUb5VYNSYi
 EPuGuEvqo53PL3dBo8Q62F5c/7liA/SHqNZgg5BEfF1sf3HEecHw0YqS0W9eqqKTbskx
 yHgNvukTgpcOcaFT7yjBVYuUmpX+Yy4NhZ1VzD9MevlCLxJzRXw+TR63YMbMOSXYnsqV
 2wIcHAl4zz94rrbIdgMt40QPrpkCWJbFW02OULZsKGnN56ZtcSj6dTUBQvD+pwgJtPpw
 5tECg8iCLJjynh6JdxAVMbwI7d8H3w0ZuuK2z+3FRRSl9XRbyjCRvyAqCb6z9FaD5Fn+
 frgg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:references:user-agent:from:to:cc:subject:date
 :in-reply-to:message-id:mime-version:content-transfer-encoding;
 bh=3tw+/dxXxPhC+vkYuGpxcbT7uVsWPReMTgAw09Ymdxo=;
 b=xOireJrPI4WToYVVXexYChitC1Y+DbUVN+VtwP1ENfyjgysFmxPT8XendYQLjP3W4l
 +AfrystzsizY6K/MK9Cb8XUKRuJNe0j8vT8kDpwHJnEKnAig0uFZF6Q8/8VX5EMv2LyU
 USS+U1LAGcgQ3q73e1rXotbAl/ih46GBDFAER31QaQK1hjHnAg8ZYNa/VLNpuxq+FoHX
 GQvWMqkNMyzZejvpM92n8YJVLa3luxm8i6t1vWOgCuCuSKzkec8QA54t1smkWwxofTCA
 7dOJRqH+qA1hBHMJQ4nXSANFv5DR3EaU40OJfQTLyRW/qgnY4JxovrnLILJmRSA1/cqP
 l5EQ==
X-Gm-Message-State: AOAM533EsQGN8SzqTxB4ZsiCLY3ZzHw2gsDXdlPSZaawORonHTwJMrK3
 sVwMr1iGE8OdrqvKfm5QMBT6ug==
X-Google-Smtp-Source: ABdhPJwdNC6d05iW2OqD3Ug2ZdYJ/FQC9oOahHGv2WWXCuh5wPRtw2wC3N+jvBBKoSKz7diYT1Iwrg==
X-Received: by 2002:aa7:dbd6:0:b0:408:4a31:97a5 with SMTP id
 v22-20020aa7dbd6000000b004084a3197a5mr30730277edt.186.1646237257595; 
 Wed, 02 Mar 2022 08:07:37 -0800 (PST)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id
 ky5-20020a170907778500b006d1b2dd8d4csm6520671ejc.99.2022.03.02.08.07.36
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 02 Mar 2022 08:07:36 -0800 (PST)
Received: from zen (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 140E31FFB7;
 Wed,  2 Mar 2022 16:07:36 +0000 (GMT)
References: <20220211120747.3074-1-Jonathan.Cameron@huawei.com>
 <20220211120747.3074-32-Jonathan.Cameron@huawei.com>
User-agent: mu4e 1.7.9; emacs 28.0.91
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Jonathan Cameron <Jonathan.Cameron@huawei.com>
Subject: Re: [PATCH v6 31/43] CXL/cxl_component: Add cxl_get_hb_cstate()
Date: Wed, 02 Mar 2022 16:07:31 +0000
In-reply-to: <20220211120747.3074-32-Jonathan.Cameron@huawei.com>
Message-ID: <87tucgibhz.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::534
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::534;
 envelope-from=alex.bennee@linaro.org; helo=mail-ed1-x534.google.com
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
> Accessor to get hold of the cxl state for a CXL host bridge
> without exposing the internals of the implementation.
>
> Signed-off-by: Jonathan Cameron <jonathan.cameron@huawei.com>

Reviewed-by: Alex Benn=C3=A9e <alex.bennee@linaro.org>

--=20
Alex Benn=C3=A9e

