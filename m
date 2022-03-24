Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D41724E6A0B
	for <lists+qemu-devel@lfdr.de>; Thu, 24 Mar 2022 21:53:46 +0100 (CET)
Received: from localhost ([::1]:45484 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nXUSn-0003EA-Vx
	for lists+qemu-devel@lfdr.de; Thu, 24 Mar 2022 16:53:46 -0400
Received: from eggs.gnu.org ([209.51.188.92]:37158)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1nXUQS-0001bp-PD
 for qemu-devel@nongnu.org; Thu, 24 Mar 2022 16:51:21 -0400
Received: from [2a00:1450:4864:20::631] (port=43736
 helo=mail-ej1-x631.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1nXUQR-0007U4-2V
 for qemu-devel@nongnu.org; Thu, 24 Mar 2022 16:51:20 -0400
Received: by mail-ej1-x631.google.com with SMTP id d10so11562014eje.10
 for <qemu-devel@nongnu.org>; Thu, 24 Mar 2022 13:51:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=references:user-agent:from:to:cc:subject:date:in-reply-to
 :message-id:mime-version:content-transfer-encoding;
 bh=Oh1JJ2Xf2ZdQnAF74f8P3bYVsBr3Ytl1T1vTnnRRZiM=;
 b=ao78hvKL75vfoOMN6idKdMiWs3fdERPOwMIbotPibr2faHrXWb953Tk0K03Pk7pnwU
 RUxunF71Z6P2QqK9Ni85jktrPIVNktZctr9rrTpRzTFMH7Q5KUefKLD+n+31qIp0gCzW
 JveRGuPV13f3gTIpv5aH1Lz8TDwcpzJi4T3oNHSchVmaWakRTI2NH/jPq+jcTFhb08Pt
 keQgCGgEcEFiHxFopLW8BAt4U9lZZMO3wViLh1WYz+NPuKuUsJ+b03uCJQ93QgGHt1nx
 bV2UjfPvUInZ21sbs2ngkaCj8o/VyCPn4k8eBkryqYSqosRbONuFjpH0BQpcJC9SSz3a
 hwZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:references:user-agent:from:to:cc:subject:date
 :in-reply-to:message-id:mime-version:content-transfer-encoding;
 bh=Oh1JJ2Xf2ZdQnAF74f8P3bYVsBr3Ytl1T1vTnnRRZiM=;
 b=RuunSEZirKTrzsyH9zBSO0TsK8dsYLrjxkz6Z28i8aYF0dtQTuEIQ6SNl2LSKThbKM
 EcINYW1IRBi4xRypZt/c1GUCnXALuioZiLAR34RyyM+bkplY4xCUcAnePnoazw46YVl6
 ZSZ+5GzsD3D8Acbw6ebD9KgYhhxQHLalqbWVcwQh78gLUR79Wz6sOIZol+VYE/oFMx1N
 YtOGMJfpB+CUH5RFxwqW3l+6KxgVgknFdZ7m5e2kF2LSPe/ZPSOeTCjZmaLJL7ytMJyz
 2OUZbY80DGGMR1lX5vpcGFDEmPymRNRqeUXhNOR7+4GKu/YktcaBynGD5ceXIvdVZTuB
 xPow==
X-Gm-Message-State: AOAM532ij5QyyRbbWkupII2dJSjOsNxtKYXIN9wjqhdeNgCArmWQmAvd
 joIlaG1S1X1wsPRz2BQHJY+PQQ==
X-Google-Smtp-Source: ABdhPJxLBXoTBvc9m3IqnsuVA35uqSzX0UOV1oiQQGedtE+yZwFVjntBle55F4In7bmqsKPCcTkZvQ==
X-Received: by 2002:a17:906:5cb:b0:6cf:954:d84d with SMTP id
 t11-20020a17090605cb00b006cf0954d84dmr7924282ejt.560.1648155076373; 
 Thu, 24 Mar 2022 13:51:16 -0700 (PDT)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id
 b8-20020a056402350800b00419407f0dd9sm1845654edd.0.2022.03.24.13.51.15
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 24 Mar 2022 13:51:15 -0700 (PDT)
Received: from zen (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id AAC631FFB7;
 Thu, 24 Mar 2022 20:51:14 +0000 (GMT)
References: <CAEekfLZ2iJKTZoqDCusrn+Hvcdxxe9TpyshkU9VvrLAVREBWdA@mail.gmail.com>
User-agent: mu4e 1.7.10; emacs 28.0.92
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Sam Price <thesamprice@gmail.com>
Subject: Re: Device driver api
Date: Thu, 24 Mar 2022 20:44:13 +0000
In-reply-to: <CAEekfLZ2iJKTZoqDCusrn+Hvcdxxe9TpyshkU9VvrLAVREBWdA@mail.gmail.com>
Message-ID: <87fsn72hx9.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::631
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::631;
 envelope-from=alex.bennee@linaro.org; helo=mail-ej1-x631.google.com
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
Cc: qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


Sam Price <thesamprice@gmail.com> writes:

> Is there a shared library interface in the works for writing firmware
> device models without recompiling all of qemu?

No - but incremental builds should be fairly cheap especially if you
only build the target you care about, possibly with a reduced config.

> I was reading through=20
> https://sebastienbourdelin.com/2021/06/16/writing-a-custom-device-for-qem=
u/

That's a nice write-up.

> but was wondering if there was a shared library approach where I could bu=
ild my device driver with some basic functions for getting
> memory ranges this library supports / etc and then
>
> https://elinux.org/images/9/95/Jw-ei-elc2010-final.pdf
> 10 years ago there was a presentation mentioning using dlopen to do
> thisd o this type of thing.

The upstream community isn't really motivated to maintain an API for
external device models because ultimately we believe they are best
placed in the QEMU code, if not upstream in a fork. There are some forks
of QEMU which support things like SystemC models but so far none of that
has been submitted for upstream.

--=20
Alex Benn=C3=A9e

