Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C0EED4CA4C7
	for <lists+qemu-devel@lfdr.de>; Wed,  2 Mar 2022 13:28:09 +0100 (CET)
Received: from localhost ([::1]:44678 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nPO5Q-0002V1-Rb
	for lists+qemu-devel@lfdr.de; Wed, 02 Mar 2022 07:28:08 -0500
Received: from eggs.gnu.org ([209.51.188.92]:45334)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1nPNw5-0001Su-0e
 for qemu-devel@nongnu.org; Wed, 02 Mar 2022 07:18:31 -0500
Received: from [2a00:1450:4864:20::62c] (port=45809
 helo=mail-ej1-x62c.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1nPNw2-0001gb-Ki
 for qemu-devel@nongnu.org; Wed, 02 Mar 2022 07:18:28 -0500
Received: by mail-ej1-x62c.google.com with SMTP id qa43so3278403ejc.12
 for <qemu-devel@nongnu.org>; Wed, 02 Mar 2022 04:18:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=references:user-agent:from:to:cc:subject:date:in-reply-to
 :message-id:mime-version:content-transfer-encoding;
 bh=jgIaKdgCmX9XzFPul0xeQhCe+1+YoHtNENK9hgsvxN0=;
 b=ZF0xBuWPuetP7AW3J4ql19Tgg8XyE29giS8CtrvnkCRDwvrKA/XRxOWxx117QsjL3h
 zqINYUxOu30NOFHoeshGCHoaZfmmRO1+DbgmVQw9jym8Dv+HShOebZRZIw8xjj6Wlmd2
 lzpvpDHDPVOcnT41rp+/13gdfQMf27DEQFOGqJ7/Qz8j5Baato3IeWSDY9qM7kcUHdd1
 xrziaro7PYObqVwTvGOw0HrdH1vshzVMDo9Z03AQBXAz5xqHF7d/9mOvdS9guYlHh+s5
 I5cfd17oMSXlrUI0ttJnLIHbNar8TEFheHfl9Rah7GxgWuBcaEGg0EVAS6MD5lB4E/lD
 hZ1w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:references:user-agent:from:to:cc:subject:date
 :in-reply-to:message-id:mime-version:content-transfer-encoding;
 bh=jgIaKdgCmX9XzFPul0xeQhCe+1+YoHtNENK9hgsvxN0=;
 b=qva5OZXVfK5y1qbCDY4Vv6z5trvQElYYglcssOgBEo0wOP3fA/v4GiNmcB8Sm8xM8b
 M3DCWdjEpNkAUAF0WdXa+QBEIQkDv9ZPH/WkrmXktFNBehfpMaCGg/2uKkirTo0va7xH
 U/h2LI6OgSND9s/WcRZy8fLXBa8KeJbz99zZkyvWOqSu5JgUevduqg6h7djHVSOWjnAN
 75Xd1m37kFeSdQYmC/4jeSSx5Czc9tT2I7cUnjcy/OIFH9UfzWGa7PXlT4lt3dyARPAD
 HV0rQ4vKCWkhCgbuMNU/QJjnysGYrpxvMHyzImhE3axdrJnSG2GES864sPlsIrMa0R+Q
 4xfw==
X-Gm-Message-State: AOAM532BJjelOBdajfdlJMSbu3NetcK2WJpyhkktc5Nbl7L8fm1PWHXM
 A/Do0zOdGKqxHHdWtC5GsJE0HQ==
X-Google-Smtp-Source: ABdhPJyv9GHDfgeLqQuBcbRZZaoG7y1EDmH3HRMSg6KyY5wtgpeuCGh7yV2un9IYkC6B/nrkUqaA4A==
X-Received: by 2002:a17:907:9712:b0:6b7:98d6:6139 with SMTP id
 jg18-20020a170907971200b006b798d66139mr3095518ejc.498.1646223503432; 
 Wed, 02 Mar 2022 04:18:23 -0800 (PST)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id
 i26-20020a17090671da00b006d9b2150a22sm669505ejk.146.2022.03.02.04.18.22
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 02 Mar 2022 04:18:22 -0800 (PST)
Received: from zen (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id A6F591FFB7;
 Wed,  2 Mar 2022 12:18:21 +0000 (GMT)
References: <20220211120747.3074-1-Jonathan.Cameron@huawei.com>
 <20220211120747.3074-29-Jonathan.Cameron@huawei.com>
User-agent: mu4e 1.7.9; emacs 28.0.91
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Jonathan Cameron <Jonathan.Cameron@huawei.com>
Subject: Re: [PATCH v6 28/43] acpi/cxl: Introduce CFMWS structures in CEDT
Date: Wed, 02 Mar 2022 12:18:15 +0000
In-reply-to: <20220211120747.3074-29-Jonathan.Cameron@huawei.com>
Message-ID: <87bkyok0oi.fsf@linaro.org>
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

> From: Ben Widawsky <ben.widawsky@intel.com>
>
> The CEDT CXL Fixed Window Memory Window Structures (CFMWs)
> define regions of the host phyiscal address map which
> (via an impdef means) are configured such that they have
> a particular interleave setup across one or more CXL Host Bridges.
>
> Reported-by: Alison Schofield <alison.schofield@intel.com>
> Signed-off-by: Ben Widawsky <ben.widawsky@intel.com>
> Signed-off-by: Jonathan Cameron <Jonathan.Cameron@huawei.com>

Reviewed-by: Alex Benn=C3=A9e <alex.bennee@linaro.org>

--=20
Alex Benn=C3=A9e

