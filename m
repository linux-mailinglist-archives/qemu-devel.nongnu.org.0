Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0436A2F19DE
	for <lists+qemu-devel@lfdr.de>; Mon, 11 Jan 2021 16:41:28 +0100 (CET)
Received: from localhost ([::1]:36790 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kyzJs-0002ab-OB
	for lists+qemu-devel@lfdr.de; Mon, 11 Jan 2021 10:41:24 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:53848)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1kyzD8-0005aU-0R
 for qemu-devel@nongnu.org; Mon, 11 Jan 2021 10:34:26 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:34187)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1kyzD5-0005z7-Jb
 for qemu-devel@nongnu.org; Mon, 11 Jan 2021 10:34:25 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1610379263;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=lM+jdFO86j9foXQsJJLV0yH/AxIpWuravSnIwRVQSIM=;
 b=bCmME8ryoMVWmw59SNu4uEn7G8J7xrZ6t42r+GZ+EL8xYsE0L8wQzXoyyx4Jj3xIT1J3+a
 vo4Xgp1fKFqC4FHi7r8XLCazzRJc2f6g49lcBQN91y5E2vzCm8tNtVvMDhi/thdZPyQYnj
 4SV5FgpAKSrEYJXXjpLfjbVdSNsArok=
Received: from mail-ej1-f69.google.com (mail-ej1-f69.google.com
 [209.85.218.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-409-4L04lYNkOnKfsL2Z4gJ3gw-1; Mon, 11 Jan 2021 10:34:19 -0500
X-MC-Unique: 4L04lYNkOnKfsL2Z4gJ3gw-1
Received: by mail-ej1-f69.google.com with SMTP id dv25so47309ejb.15
 for <qemu-devel@nongnu.org>; Mon, 11 Jan 2021 07:34:19 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=lM+jdFO86j9foXQsJJLV0yH/AxIpWuravSnIwRVQSIM=;
 b=OaUUPlbAXPekYsVmEt0KOcgd32pRhOnGGaeILXKBK2HzwpM8YW8PfT+qpQp8abEfp+
 FtCIqqUdiOWLJ9DqwPUE2mdHnKx/xvE95d6RB/xmYbs5rEWGVNll5w+mtInfN/nMZDBF
 P7VuTWxY1niGO4cq9Id9vmfTGO4fLyGKaq06SbXvDS7CFt+Qpadt6iJhf4iJwyFTxe99
 +AeCGNQbuE8PzCG4e8dXKToUApxf1BZvT7AVusnZOrj4mozBZYd0IZ5f6ErSVyuKs7Yr
 M6+mGk/EYglg49QDQLEdkJ0FIoWrLAtIRywcjvlN8X8s6mBJUgRvrQjYTScB6IUOF48T
 izSA==
X-Gm-Message-State: AOAM533IQVZhiBNdLiP0o90erEjBYjLpW3b31aUMrejlDF0hJfvx46Un
 /rmC8bvKDf+ZIcKToz3GyzydzXZm64bChJnMsqw/S0sF0tnekKNo6A0rFKhWb/Hf2omhggtiM4G
 qoul8dOzDd4byOOs=
X-Received: by 2002:a05:6402:a5b:: with SMTP id
 bt27mr14731974edb.222.1610379258749; 
 Mon, 11 Jan 2021 07:34:18 -0800 (PST)
X-Google-Smtp-Source: ABdhPJxSrZn/HzjbSm+Mx2MBp74Kvk3UMEgnEdHPRS/9wyRBby9gHoUtcG27VxFrIW8Kl5ylMVxPVg==
X-Received: by 2002:a05:6402:a5b:: with SMTP id
 bt27mr14731958edb.222.1610379258539; 
 Mon, 11 Jan 2021 07:34:18 -0800 (PST)
Received: from [192.168.1.36] (129.red-88-21-205.staticip.rima-tde.net.
 [88.21.205.129])
 by smtp.gmail.com with ESMTPSA id d4sm99773edq.36.2021.01.11.07.34.16
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 11 Jan 2021 07:34:17 -0800 (PST)
Subject: Re: [PATCH v1 13/20] semihosting: Change common-semi API to be
 architecture-independent
To: =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 qemu-devel@nongnu.org
References: <20210108224256.2321-1-alex.bennee@linaro.org>
 <20210108224256.2321-14-alex.bennee@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Message-ID: <3e3340c7-7eac-9385-1fb4-707be4a1f598@redhat.com>
Date: Mon, 11 Jan 2021 16:34:15 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.0
MIME-Version: 1.0
In-Reply-To: <20210108224256.2321-14-alex.bennee@linaro.org>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.251,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001,
 RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: Peter Maydell <peter.maydell@linaro.org>, Keith Packard <keithp@keithp.com>,
 "open list:ARM TCG CPUs" <qemu-arm@nongnu.org>,
 Alistair Francis <alistair.francis@wdc.com>,
 Laurent Vivier <laurent@vivier.eu>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 1/8/21 11:42 PM, Alex Bennée wrote:
> From: Keith Packard <keithp@keithp.com>
> 
> The public API is now defined in
> hw/semihosting/common-semi.h. do_common_semihosting takes CPUState *
> instead of CPUARMState *. All internal functions have been renamed
> common_semi_ instead of arm_semi_ or arm_. Aside from the API change,
> there are no functional changes in this patch.
> 
> Signed-off-by: Keith Packard <keithp@keithp.com>
> Reviewed-by: Alistair Francis <alistair.francis@wdc.com>
> Message-Id: <20210107170717.2098982-3-keithp@keithp.com>
> Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
> ---
>  hw/semihosting/common-semi.h  | 36 +++++++++++++++++++++++++++++++++++
>  target/arm/cpu.h              |  8 --------
>  hw/semihosting/common-semi.c  | 16 ++++++++++------
>  linux-user/aarch64/cpu_loop.c |  3 ++-
>  linux-user/arm/cpu_loop.c     |  3 ++-
>  target/arm/helper.c           |  5 +++--
>  target/arm/m_helper.c         |  7 ++++++-
>  7 files changed, 59 insertions(+), 19 deletions(-)
>  create mode 100644 hw/semihosting/common-semi.h
> 
> diff --git a/hw/semihosting/common-semi.h b/hw/semihosting/common-semi.h
> new file mode 100644
> index 0000000000..bc53e92c79
> --- /dev/null
> +++ b/hw/semihosting/common-semi.h
> @@ -0,0 +1,36 @@
> +/*
> + *  Semihosting support for systems modeled on the Arm "Angel"
> + *  semihosting syscalls design.
> + *
> + *  Copyright (c) 2005, 2007 CodeSourcery.
> + *  Copyright (c) 2019 Linaro
> + *  Written by Paul Brook.
> + *
> + *  Copyright © 2020 by Keith Packard <keithp@keithp.com>
> + *  Adapted for systems other than ARM, including RISC-V, by Keith Packard
> + *
> + *  This program is free software; you can redistribute it and/or modify
> + *  it under the terms of the GNU General Public License as published by
> + *  the Free Software Foundation; either version 2 of the License, or
> + *  (at your option) any later version.
> + *
> + *  This program is distributed in the hope that it will be useful,
> + *  but WITHOUT ANY WARRANTY; without even the implied warranty of
> + *  MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
> + *  GNU General Public License for more details.
> + *
> + *  You should have received a copy of the GNU General Public License
> + *  along with this program; if not, see <http://www.gnu.org/licenses/>.
> + *
> + *  ARM Semihosting is documented in:
> + *     Semihosting for AArch32 and AArch64 Release 2.0
> + *     https://static.docs.arm.com/100863/0200/semihosting.pdf
> + *
> + */
> +
> +#ifndef COMMON_SEMI_H
> +#define COMMON_SEMI_H
> +
> +target_ulong do_common_semihosting(CPUState *cs);

Can we name this do_arm_compat_semihosting(CPUState *cs)?


