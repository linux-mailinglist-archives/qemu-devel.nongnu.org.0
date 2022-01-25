Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0B83049B736
	for <lists+qemu-devel@lfdr.de>; Tue, 25 Jan 2022 16:06:43 +0100 (CET)
Received: from localhost ([::1]:55032 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nCNP7-00069W-P3
	for lists+qemu-devel@lfdr.de; Tue, 25 Jan 2022 10:06:41 -0500
Received: from eggs.gnu.org ([209.51.188.92]:51494)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1nCMGk-0007H4-0B
 for qemu-devel@nongnu.org; Tue, 25 Jan 2022 08:53:58 -0500
Received: from [2a00:1450:4864:20::52a] (port=35440
 helo=mail-ed1-x52a.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1nCMGi-00024y-2H
 for qemu-devel@nongnu.org; Tue, 25 Jan 2022 08:53:57 -0500
Received: by mail-ed1-x52a.google.com with SMTP id n10so47251653edv.2
 for <qemu-devel@nongnu.org>; Tue, 25 Jan 2022 05:53:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=references:user-agent:from:to:cc:subject:date:in-reply-to
 :message-id:mime-version:content-transfer-encoding;
 bh=AQLpznwZjUVv3sUgFHwsQE4uBZUuzaht9HIbBFEo6f4=;
 b=oFVlvNme6+1uraHXIpqVTZJooeuciNw3iWAL/Ey8x2RkjnC+h68gn0/gbbr8v9MAMi
 MXbRgdJY/Hm1keH5w9cjeRuuHJXPP6v64vM0CY7rmBKwlITwHNaLUmqrRLxPYAHGoiSG
 A+0hIMaETf6QYNLW5wQJOV5DsO+rBFp/SkDZ9Cfx6tGZtU1pEB1P5qiejX5d/2+4f+by
 jE0NUFh+b/9men+gJGB4WQKRdhUHLiH2vlD9YR1lzrbbupJY67wPVUcrK7SJ6grjKleA
 VMPliylUt1jrUTqfZzuQ8NoLodZtAerxSkbIdn/jGkHiquBXElaA4bWr8FSBmQPmERY4
 4p7g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:references:user-agent:from:to:cc:subject:date
 :in-reply-to:message-id:mime-version:content-transfer-encoding;
 bh=AQLpznwZjUVv3sUgFHwsQE4uBZUuzaht9HIbBFEo6f4=;
 b=5gO63jYzenNI2cYUx/evtgsYyQnfogG38CtzCgqZnL2ap47V4Aw5Q08NIGLcAchEZt
 WXMdfZDwnLzyd5z3SMp0FAEeJ6OYEOxpBxRCEx5G9404la/pcbpspcWATjSbtpCIpbGr
 rk/acDish/MhpSU17PYTgfoF7VOtKXjFyAyN1cwgv1fiw4l3zS08ROsU0xWTJrMnhJxg
 qxU2LtTppom/rAbm/FmVueEeQQf1FUR+yDsx0f5ZdiWsqV3x/xvpdOgtKeyzlefGsLnp
 H742+Kf+36x1YuU4oJ6oE7NCpSSFC3zuiCRjqxeGKGaTAWwEAR8HtphLaN0iMvRbMzl5
 PIng==
X-Gm-Message-State: AOAM530Raa5m4DtnH38LTWEzz8UzAEjTSMt2dEPtDbmEDt0SAzEEKmlL
 mYiITqM4sbUIEk/4N9gMW4XV9A==
X-Google-Smtp-Source: ABdhPJy6DeMd2H4MLD/JsGpZo+K3RcDzCGsRbxaB1boo5gDl5I+vBQoaGm3YmYICFx72cFJXlvGjfg==
X-Received: by 2002:aa7:c412:: with SMTP id j18mr11429475edq.393.1643118833563; 
 Tue, 25 Jan 2022 05:53:53 -0800 (PST)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id v5sm6164216ejc.40.2022.01.25.05.53.52
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 25 Jan 2022 05:53:52 -0800 (PST)
Received: from zen (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id B3DAA1FFB7;
 Tue, 25 Jan 2022 13:53:51 +0000 (GMT)
References: <20220124171705.10432-1-Jonathan.Cameron@huawei.com>
 <20220124171705.10432-2-Jonathan.Cameron@huawei.com>
User-agent: mu4e 1.7.6; emacs 28.0.91
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Jonathan Cameron <Jonathan.Cameron@huawei.com>
Subject: Re: [PATCH v4 01/42] hw/pci/cxl: Add a CXL component type (interface)
Date: Tue, 25 Jan 2022 13:53:45 +0000
In-reply-to: <20220124171705.10432-2-Jonathan.Cameron@huawei.com>
Message-ID: <875yq7exao.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::52a
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::52a;
 envelope-from=alex.bennee@linaro.org; helo=mail-ed1-x52a.google.com
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

> From: Ben Widawsky <ben.widawsky@intel.com>
>
> A CXL component is a hardware entity that implements CXL component
> registers from the CXL 2.0 spec (8.2.3). Currently these represent 3
> general types.
> 1. Host Bridge
> 2. Ports (root, upstream, downstream)
> 3. Devices (memory, other)
>
> A CXL component can be conceptually thought of as a PCIe device with
> extra functionality when enumerated and enabled. For this reason, CXL
> does here, and will continue to add on to existing PCI code paths.
>
> Host bridges will typically need to be handled specially and so they can
> implement this newly introduced interface or not. All other components
> should implement this interface. Implementing this interface allows the
> core PCI code to treat these devices as special where appropriate.
>
> Signed-off-by: Ben Widawsky <ben.widawsky@intel.com>
> Signed-off-by: Jonathan Cameron <Jonathan.Cameron@huawei.com>

Reviewed-by: Alex Benn=C3=A9e <alex.bennee@linaro.org>

--=20
Alex Benn=C3=A9e

