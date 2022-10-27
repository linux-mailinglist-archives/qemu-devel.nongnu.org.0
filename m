Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id AD3A360F2BA
	for <lists+qemu-devel@lfdr.de>; Thu, 27 Oct 2022 10:42:42 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1onyR5-0001Jt-6V; Thu, 27 Oct 2022 04:40:23 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1onyR3-0000xC-Ad
 for qemu-devel@nongnu.org; Thu, 27 Oct 2022 04:40:21 -0400
Received: from mail-wr1-x42a.google.com ([2a00:1450:4864:20::42a])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1onyR1-0007nZ-Pc
 for qemu-devel@nongnu.org; Thu, 27 Oct 2022 04:40:21 -0400
Received: by mail-wr1-x42a.google.com with SMTP id z14so963105wrn.7
 for <qemu-devel@nongnu.org>; Thu, 27 Oct 2022 01:40:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:message-id:in-reply-to:date
 :subject:cc:to:from:user-agent:references:from:to:cc:subject:date
 :message-id:reply-to;
 bh=R72+Byta0ggcrMJ6pBTu9gVKHwUiTbM3bM47Lj1VcUQ=;
 b=HJlW3B32rhTSgzGTIOUVtz3GcIr3wQ2iIN+gBHqCt37IeWfGIH/zx6qei95qNQ9BLm
 eiMZBODbD1UuQh+xkhOJEAxbdPJQMcDMhd3ZUHEnCRCXPaIEjTqUo/EmfeoBiHF+D7Qw
 Fjs5wnHRrmccTQj969nhrxFP6OdzV6GlAuZ/8oN+1eysfp0hZcDydVlyx3InFhvURDCx
 g85iXDodk2UXc7jpZSqgHOpqxxr++Vd0lF8ewq9/RPPr4j5Vu/9Ss6zFYY9AURbRsIkP
 0BFT3Pms9aWDVXXXe1FGVPoKrTt9RdSMCgLRG6LS4Ph91RTHMCf9loKxmYIROzgVhH0M
 l++g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:in-reply-to:date
 :subject:cc:to:from:user-agent:references:x-gm-message-state:from:to
 :cc:subject:date:message-id:reply-to;
 bh=R72+Byta0ggcrMJ6pBTu9gVKHwUiTbM3bM47Lj1VcUQ=;
 b=bWS4YFcY3+OvEuSoM4vSmaiA7wBBPGF95brCEXMzPj78S9oTIBaqZuiWAeTMvCdlPV
 2xUUv6VRPXaUGTaCMCBi7UfeR+fq72QGf5lCpT4t3I45YqFTGEWDljlRQtMy2fOrpycu
 ukon/bpKx8AJcIZeWJSUfOsYwAc/ChIc4lJcO/1eVbZfRXEUgKlkwVj5fpDCLCSUpL1g
 ssBXU3nrQ0HoPx/GVLL4rUr3AXntewr+1A/wQUtOWNVfsngUm85pncOJv4QPsUctFoDK
 uP03MjglaIvBpJra8yOhC40J7awbnZ9/6WjcpZI2A6IUGduOLEZ/55dwtEoOby/DQf5C
 uJWQ==
X-Gm-Message-State: ACrzQf3HOOP/gpmbCVjfchR0VJiipltXLc4+jKWl9lZke2NFZ0Z3ggWy
 6Q8Y1uqw8wZRReQoNN02Ejfb8Q==
X-Google-Smtp-Source: AMsMyM6HkxGVNKU3Muav/IfO9FnY3SnVzozajd22rOaY8YCyg60SONqAX76DzqXaqnJTZPQ29Yxfuw==
X-Received: by 2002:a5d:6185:0:b0:236:776f:2bed with SMTP id
 j5-20020a5d6185000000b00236776f2bedmr11491996wru.535.1666860018100; 
 Thu, 27 Oct 2022 01:40:18 -0700 (PDT)
Received: from zen.linaroharston ([185.81.254.11])
 by smtp.gmail.com with ESMTPSA id
 j8-20020a5d6188000000b0022e035a4e93sm577041wru.87.2022.10.27.01.40.17
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 27 Oct 2022 01:40:17 -0700 (PDT)
Received: from zen (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 14A9E1FFB7;
 Thu, 27 Oct 2022 09:40:17 +0100 (BST)
References: <20221015050750.4185-1-vikram.garhwal@amd.com>
 <20221015050750.4185-11-vikram.garhwal@amd.com>
 <3e504b1b-197d-b77b-16e1-86530eb3d64c@xen.org>
User-agent: mu4e 1.9.1; emacs 28.2.50
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Julien Grall <julien@xen.org>
Cc: Vikram Garhwal <vikram.garhwal@amd.com>, stefano.stabellini@amd.com,
 Peter Maydell <peter.maydell@linaro.org>, Stefano Stabellini
 <sstabellini@kernel.org>, Anthony Perard <anthony.perard@citrix.com>, Paul
 Durrant <paul@xen.org>, "open list:ARM TCG CPUs" <qemu-arm@nongnu.org>,
 "open list:X86 Xen CPUs" <xen-devel@lists.xenproject.org>,
 qemu-devel@nongnu.org
Subject: Re: [PATCH v1 10/12] hw/arm: introduce xenpv machine
Date: Thu, 27 Oct 2022 09:37:43 +0100
In-reply-to: <3e504b1b-197d-b77b-16e1-86530eb3d64c@xen.org>
Message-ID: <87k04l3bim.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::42a;
 envelope-from=alex.bennee@linaro.org; helo=mail-wr1-x42a.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Sender: "Qemu-devel" <qemu-devel-bounces@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org


Julien Grall <julien@xen.org> writes:

> Hi,
>
> There seem to be some missing patches on xen-devel (including the
> cover letter). Is that expected?
>
> On 15/10/2022 06:07, Vikram Garhwal wrote:
>> Add a new machine xenpv which creates a IOREQ server to register/connect=
 with
>> Xen Hypervisor.
>
> I don't like the name 'xenpv' because it doesn't convey the fact that
> some of the HW may be emulated rather than para-virtualized. In fact
> one may only want to use for emulating devices.
>
> Potential name would be 'xen-arm' or re-using 'virt' but with
> 'accel=3Dxen' to select a Xen layout.

I don't think you can re-use the machine name and select by accelerator
because the virt machine does quite a lot of other stuff this model
doesn't support. However I've been calling this concept "xen-virt" or
maybe the explicit "xen-virtio" because that is what it is targeting.

--=20
Alex Benn=C3=A9e

