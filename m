Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BB9F843CDDB
	for <lists+qemu-devel@lfdr.de>; Wed, 27 Oct 2021 17:43:28 +0200 (CEST)
Received: from localhost ([::1]:50750 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mfl5L-0000rD-S7
	for lists+qemu-devel@lfdr.de; Wed, 27 Oct 2021 11:43:27 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:52234)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1mfkC1-0004pO-Iw
 for qemu-devel@nongnu.org; Wed, 27 Oct 2021 10:46:17 -0400
Received: from mail-lf1-x12f.google.com ([2a00:1450:4864:20::12f]:43740)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1mfkBz-0004Yq-Tr
 for qemu-devel@nongnu.org; Wed, 27 Oct 2021 10:46:17 -0400
Received: by mail-lf1-x12f.google.com with SMTP id bq11so6659920lfb.10
 for <qemu-devel@nongnu.org>; Wed, 27 Oct 2021 07:46:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=references:user-agent:from:to:cc:subject:date:in-reply-to
 :message-id:mime-version:content-transfer-encoding;
 bh=c34hQmPUhdgmqzTo1Y+CpF2P4Cwf0O/GLGeFEbxP7AE=;
 b=jOWMt0WUE8EvI8SAqQeg//e2ZdMRO2Xph+YiJf6EyRITu2TzKG6YCAUyYjo3A8Qx4A
 cVr0EXDEW+eup2PoPbhopBqNmvyoewzwkVRBCdwt/ILPxF+/C1sIYdJxp1nRn8hyH9xB
 wOA6VqBnM+PsTqTiGkd8VupFHWXmEGdMcPVuwi6QiqoV+cnZVTV/lx8ydv3SLWyv/sFQ
 e9oIXZqoaWyxB0I7tzYUY9So+NLQoaGJYB742g/zE71mbMBL5GixWS0bOzwm/1Zn7pAF
 NWUVx9PHAFz2zkBfNQowbpwUDz51ZsTLGrp5fex9NLk6x3hxIT4Qt2eVI/5cP09N4g4k
 cUBA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:references:user-agent:from:to:cc:subject:date
 :in-reply-to:message-id:mime-version:content-transfer-encoding;
 bh=c34hQmPUhdgmqzTo1Y+CpF2P4Cwf0O/GLGeFEbxP7AE=;
 b=lOQMar7V4FFBDhD6ON3+VxaYMMJdK90fqLfC3Iy8N6xYPug/JznDISe5p+50blFpUk
 FgKTR+hy+iXanGW4dmnctL/gzw/6R0i36CbsVWeg2UX8GHlsPxVLI4PkYFsuFklItG21
 u1vSaPPLzQQ+t/sYWJLhYTy86AMUAWcu7QCr8F2VqHu+wOJncpQZC+xuh+ayIXoV7nxk
 p/DTrhHsGhsWv/O8Irqu76XigwIl6vCBcFgbEH6UTGJfA+d2DfkqILunam94ZtnKUDDd
 E4/LxVxrz0vnfY4s2RoWva+NfshBtQh3vuPWKGyvSUFfCtpQjqE3LtCmcZgF6p0BYgBG
 8lcA==
X-Gm-Message-State: AOAM530vItvUddOsHKSJwDsyXnOfMLowCqxJaZZsAfldfY17BsUSB3m8
 NTJn6NnBNndts2PKR0G3gdvXKw==
X-Google-Smtp-Source: ABdhPJxptsqcu/7zrfgtWXlok+G2HbLQfUQzvF7JXvLA9BVUhdE3zWOx7ksum6S49hRfGoZEImZYTA==
X-Received: by 2002:a05:6512:1053:: with SMTP id
 c19mr3653534lfb.223.1635345973874; 
 Wed, 27 Oct 2021 07:46:13 -0700 (PDT)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id b15sm10289ljp.95.2021.10.27.07.46.12
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 27 Oct 2021 07:46:12 -0700 (PDT)
Received: from zen (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id F18231FF96;
 Wed, 27 Oct 2021 15:46:11 +0100 (BST)
References: <20211013010120.96851-1-sjg@chromium.org>
 <20211013010120.96851-6-sjg@chromium.org>
 <CAHFG_=UDFn9MQfJz6oTAg15PiR2nt6QkoZS58+gsOMMVo31AXQ@mail.gmail.com>
User-agent: mu4e 1.7.4; emacs 28.0.60
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: =?utf-8?Q?Fran=C3=A7ois?= Ozog <francois.ozog@linaro.org>
Subject: Re: [PATCH 05/16] arm: qemu: Add a devicetree file for qemu_arm64
Date: Wed, 27 Oct 2021 15:44:08 +0100
In-reply-to: <CAHFG_=UDFn9MQfJz6oTAg15PiR2nt6QkoZS58+gsOMMVo31AXQ@mail.gmail.com>
Message-ID: <87v91iwmoc.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::12f;
 envelope-from=alex.bennee@linaro.org; helo=mail-lf1-x12f.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Albert Aribaud <albert.u.boot@aribaud.net>, Tom Rini <trini@konsulko.com>,
 Heiko Schocher <hs@denx.de>, Neil Armstrong <narmstrong@baylibre.com>,
 qemu-devel@nongnu.org, Andre Przywara <andre.przywara@arm.com>,
 Simon Glass <sjg@chromium.org>, Ilias Apalodimas <ilias.apalodimas@linaro.org>,
 Christian Hewitt <christianshewitt@gmail.com>,
 Kever Yang <kever.yang@rock-chips.com>, Rick Chen <rick@andestech.com>,
 U-Boot Mailing List <u-boot@lists.denx.de>,
 Jagan Teki <jagan@amarulasolutions.com>, Sean Anderson <seanga2@gmail.com>,
 Tuomas Tynkkynen <tuomas.tynkkynen@iki.fi>, Fabio Estevam <festevam@gmail.com>,
 Tim Harvey <tharvey@gateworks.com>, Peter Robinson <pbrobinson@gmail.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


Fran=C3=A7ois Ozog <francois.ozog@linaro.org> writes:

> Hi Simon
>
> The only place I could agree with this file presence is in the documentat=
ion directory, not in dts. It creates a mental picture  for the reader
> an entirely bad mind scheme around Qemu and DT.
>
> And even in a documentation directory I would place a bug warning: don=E2=
=80=99t use this with any kernel , Qemu generates a DT dynamically
> based on cpu, memory and devices specified at the command line.

Certainly for the arm, aarch64 and riscv "virt" machines you should
always use the QEMU generated DTB. I'm not entirely clear what a
qemu_arm and qemu_arm64 def targets are meant to be in this context.

--=20
Alex Benn=C3=A9e

