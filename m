Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8CBCF1FADBD
	for <lists+qemu-devel@lfdr.de>; Tue, 16 Jun 2020 12:19:34 +0200 (CEST)
Received: from localhost ([::1]:52734 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jl8gn-0003Cb-KE
	for lists+qemu-devel@lfdr.de; Tue, 16 Jun 2020 06:19:33 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:56226)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1jl8fM-0002Dc-6w
 for qemu-devel@nongnu.org; Tue, 16 Jun 2020 06:18:04 -0400
Received: from mail-oi1-x243.google.com ([2607:f8b0:4864:20::243]:46171)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1jl8fK-0007hA-OP
 for qemu-devel@nongnu.org; Tue, 16 Jun 2020 06:18:03 -0400
Received: by mail-oi1-x243.google.com with SMTP id 25so18709393oiy.13
 for <qemu-devel@nongnu.org>; Tue, 16 Jun 2020 03:18:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=V90nUl0nGN3ZaSTqSpnvxDZFfC3709HrtSe5tJwmIJw=;
 b=P5vQp/ddutgi3LHR+7Td0t2DPWhFb5tL9Tr2PLVs0W8y3WQipHMlVhc7xHDOs7efWL
 t32bbhaypKjhijmt8x4Bc8EZU+e/umRdkqdni0neSo1nEKff0IdCd6CXdXc8Dgv+xAqQ
 3ed4CdJ6WJO13/vsWgQgpddnkHjsNxxajpY3kztL7PeqhneJTyNCfIQ6KzUuIhTS4W7J
 7siv05gt/wHz2RB0Y9b1qNfRtLbqh5tzwsuBcXgmw/FDFXLiCJvw0DNglyHnDq2lpVtP
 1qnxcfeZDCbkcx2MeRTeKzUN7lEFf7xIjDqWEnYtlQ4j6iiLgVWE9Squw3kNuQHqVas5
 vddA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=V90nUl0nGN3ZaSTqSpnvxDZFfC3709HrtSe5tJwmIJw=;
 b=segu1diBa+kn2m74pwd+tfJvsQyAhzP73n76ZS1p00+mQ5Un1qjsFk5XESxZVrtykc
 Eb9Xe17HqszcaLRzbQpGJ5OKEeqsIpAMYtoY6rVAjS3EvZ6u4NC7niekb2wE6UpLXqvv
 GHIJkMfZDKXb00/CLOE/zth9wFqy+UfrEQPYYljt6Gq+CwTWxK+os5Q2G/qbhhHOs8hk
 yotqrnfbYuP69PV4qU9u4kFkRmUFZ8es1xuHFyNfzliKlO0QdzvFFNvsQFcU3leCE5vx
 BtUdK8CbrqxXU2PCM49pIsnm8ptHAdSwLVnTnu0LtMdOgrsuTK4fY3Z66ExEJ+z5v+W5
 HVCA==
X-Gm-Message-State: AOAM5305A/pivYjQMPWwUIOWXLHrX/Sazm41mxQ6ShuDnJkFTF6OUbcO
 twkZlpZUfZZH6cWDX4oPEXDbVGM3mbKqc3DyYfwUhA==
X-Google-Smtp-Source: ABdhPJyipYgxY25bgsz+lsVMrxqkyzW6DOMmAnKA8Dzjlkj5qsX+PDFCJOGpkaG2zY9ojiWYDMMYFs0NxEXUn5nCN2I=
X-Received: by 2002:aca:1a07:: with SMTP id a7mr2693048oia.163.1592302681579; 
 Tue, 16 Jun 2020 03:18:01 -0700 (PDT)
MIME-Version: 1.0
References: <20200616063157.16389-1-f4bug@amsat.org>
 <20200616063157.16389-4-f4bug@amsat.org>
In-Reply-To: <20200616063157.16389-4-f4bug@amsat.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 16 Jun 2020 11:17:50 +0100
Message-ID: <CAFEAcA9335-h=44X-kRMd3vSaGqeRwJnFtWkGUbzt3jeChNEmw@mail.gmail.com>
Subject: Re: [PATCH 3/7] hw/arm/mps2: Add CMSDK APB watchdog as unimplemented
 device
To: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2607:f8b0:4864:20::243;
 envelope-from=peter.maydell@linaro.org; helo=mail-oi1-x243.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=_AUTOLEARN
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
Cc: Esteban Bosse <estebanbosse@gmail.com>,
 Joaquin de Andres <me@xcancerberox.com.ar>, qemu-arm <qemu-arm@nongnu.org>,
 QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Tue, 16 Jun 2020 at 07:32, Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org>=
 wrote:
>
> Register the watchdog peripheral as unimplemented to better
> follow its accesses, for example booting Zephyr:

We have a TYPE_CMSDK_APB_WATCHDOG device; so we could use
that, I think ?

thanks
-- PMM

