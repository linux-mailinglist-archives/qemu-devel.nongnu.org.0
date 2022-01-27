Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8EBB749E221
	for <lists+qemu-devel@lfdr.de>; Thu, 27 Jan 2022 13:13:50 +0100 (CET)
Received: from localhost ([::1]:39624 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nD3ev-0007ZZ-N4
	for lists+qemu-devel@lfdr.de; Thu, 27 Jan 2022 07:13:49 -0500
Received: from eggs.gnu.org ([209.51.188.92]:46256)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1nD3C1-0001aU-FX
 for qemu-devel@nongnu.org; Thu, 27 Jan 2022 06:43:57 -0500
Received: from [2a00:1450:4864:20::62b] (port=42716
 helo=mail-ej1-x62b.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1nD3Bz-0002bx-SY
 for qemu-devel@nongnu.org; Thu, 27 Jan 2022 06:43:57 -0500
Received: by mail-ej1-x62b.google.com with SMTP id m4so5137170ejb.9
 for <qemu-devel@nongnu.org>; Thu, 27 Jan 2022 03:43:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=references:user-agent:from:to:cc:subject:date:in-reply-to
 :message-id:mime-version:content-transfer-encoding;
 bh=2N9cN3h/UZ0Mx+yontKSZ6W8jCJoG/OyvT9j9ERzeeU=;
 b=SqHrleKW7mHYf01f1d8nxX03OHXGMR9oTw4lJ7yYBnSFjkNZZJapn20HwgtP03FSAJ
 etP0GuBaTTpqMTuN6vxYQddNbFvENeCktrd7uCGXJkpnubkk/JWPxXGV4qfxRSLrL7SC
 efYAf/h5YBHaFCZj2tRijNC0uLOfa5Yw3yfbgVaAP4Ub6ciSoq+o7lZIvEXFNPXde3mK
 KReVQgGUGofDYhmaW8RN2Zb076gfkWv1lWiMUrw/tpB4oc8lv5IUfqI+6npXPpwwlrXQ
 dpLytUbTJgjayUoTMrufaPhN28Fr2f2jvIjPCVWhitvMp+p9jdsqzb8wGfsAGoV2Wm9w
 aYTw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:references:user-agent:from:to:cc:subject:date
 :in-reply-to:message-id:mime-version:content-transfer-encoding;
 bh=2N9cN3h/UZ0Mx+yontKSZ6W8jCJoG/OyvT9j9ERzeeU=;
 b=3CgYG5FRcXqgOUdgG2h2cZ1w+sKVFiG2WRMBsTt5jpr2KjDQfGRhhTZHCq+VTynYfs
 gMnWKfwDh/ixx7bwbGgDvSLIVbnH7Gr43+hW2WMu+u9SIDuP4mJ04wSy4q4+LcC9CPVA
 5iRO5ucAuAxJQZnqTrMMZSifGVrxf1LD3UWYvO/Yhp+sJDI2Ura+aECt6LGlfqIp0FdK
 yn8H833YC4lojFRLpJJDrc18aAhhUubLoE+ZGd+s/KAfSQvKilPdz/XV54ZAi/4eWw+h
 6106c2tm4yLACBlDj37eTw9lPBtwba9ipF7ALs/+bOSp/IaH5LLSSrW4xSpo1KPNY245
 0oRw==
X-Gm-Message-State: AOAM532k9iSMK4F/Pkv2jnZoIiGA7BUjcEq7YSLSKgXK5seATlFT2gao
 sjWSz8aZ6Ib0TmB7eTBbN5WP9HFBv8f1lQ==
X-Google-Smtp-Source: ABdhPJxTIUV4T5ohOksd0JWN9v1WHYWW2CAyEsEulLdSrB5UwGfgkdQSOdBbnqqNSMPzitiShCmk/w==
X-Received: by 2002:a17:906:5d0a:: with SMTP id
 g10mr2517012ejt.37.1643283834397; 
 Thu, 27 Jan 2022 03:43:54 -0800 (PST)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id lo15sm8554102ejb.28.2022.01.27.03.43.53
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 27 Jan 2022 03:43:53 -0800 (PST)
Received: from zen (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id C2EC21FFB7;
 Thu, 27 Jan 2022 11:43:52 +0000 (GMT)
References: <20220124171705.10432-1-Jonathan.Cameron@huawei.com>
 <20220124171705.10432-9-Jonathan.Cameron@huawei.com>
User-agent: mu4e 1.7.6; emacs 28.0.91
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Jonathan Cameron <Jonathan.Cameron@huawei.com>
Subject: Re: [PATCH v4 08/42] hw/cxl/device: Add cheap EVENTS implementation
 (8.2.9.1)
Date: Thu, 27 Jan 2022 11:43:48 +0000
In-reply-to: <20220124171705.10432-9-Jonathan.Cameron@huawei.com>
Message-ID: <878rv1bdzb.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::62b
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::62b;
 envelope-from=alex.bennee@linaro.org; helo=mail-ej1-x62b.google.com
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
> Using the previously implemented stubbed helpers, it is now possible to
> easily add the missing, required commands to the implementation.
>
> Signed-off-by: Ben Widawsky <ben.widawsky@intel.com>
> Signed-off-by: Jonathan Cameron <Jonathan.Cameron@huawei.com>

Reviewed-by: Alex Benn=C3=A9e <alex.bennee@linaro.org>

--=20
Alex Benn=C3=A9e

