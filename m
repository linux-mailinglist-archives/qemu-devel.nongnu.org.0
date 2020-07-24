Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1C44E22C636
	for <lists+qemu-devel@lfdr.de>; Fri, 24 Jul 2020 15:21:00 +0200 (CEST)
Received: from localhost ([::1]:45588 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jyxdD-0004AM-5l
	for lists+qemu-devel@lfdr.de; Fri, 24 Jul 2020 09:20:59 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42300)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1jyxcG-0003Qw-AS
 for qemu-devel@nongnu.org; Fri, 24 Jul 2020 09:20:00 -0400
Received: from mail-ot1-x32d.google.com ([2607:f8b0:4864:20::32d]:39413)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1jyxcD-0008JL-La
 for qemu-devel@nongnu.org; Fri, 24 Jul 2020 09:20:00 -0400
Received: by mail-ot1-x32d.google.com with SMTP id 18so6953249otv.6
 for <qemu-devel@nongnu.org>; Fri, 24 Jul 2020 06:19:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=jTEf1o++WaVJfH5RXYmaRp2hBzAR3Y42Mk52reBi4WA=;
 b=YFZnEp7/W2ybtHY5mYiOP77ckpKkeOvV24exIgBLSWYQ1qi+05rPNOUOEWQvaIq/h6
 0HcGDkdEIxEVRS/IJgdnO1v2vsOE1VXMmBXrl+TrWiAX1Vc1eZO7Ec/I6k1EG+VmJldf
 vXaBz0gKSqob+H5eLh3r9TDm+o3p+rEGIOBVtKiX3RWZJuHwW+9KCisK5dZ003nocBnX
 UWhmSG9WtNrzbkgE+xe1cXTBnsxseS1pPpC3xXPr59XxKHe8vCnhVQuysIOsBJqG6oht
 s4aPZ7hknS/XpDFuKnkYBKhLLix58PGosMYbK+SftlEEYPWM35dzyNAH10bq7oQezgB5
 xZFg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=jTEf1o++WaVJfH5RXYmaRp2hBzAR3Y42Mk52reBi4WA=;
 b=tLPH909JRcwzP8N2H9YZPBQhuJ7uA2vYJxieKI7gBKUsJv1Qw+khia2gQKMn09nUYQ
 dO6PdN+d71a9G+BNXPKNRWth1erVZg01CyNLHpmANnVrPUp7pkBBWPoGx0mSBQN7JQjC
 /OcG9Z7SQtGh1bYcuW/o7ZIwjcatB/rSzbu0/SdrcWlfdd1+lr5WJYdlDuLgWQO9aFHj
 3NoF7H1wayGLd2t9sN0jeGSCAD4MOz2YQPP5shHSrWYAqSkENAaxGfty2JEmJalH1GUK
 hmpTPozctKgCQHfPGHI/+vdsOJmO8llPSBTDaP/VxRgYxF30OyiD0hwBZm6QbE9jtUW7
 hXJA==
X-Gm-Message-State: AOAM533mzENQdRKm/FQYnsgZE6ul/2YkHU/M7Vd2NK7TqgunxPaxll4q
 LtuGwrf5NIc/3YECHLFKchvX857CG1/FKzCSx38CCA==
X-Google-Smtp-Source: ABdhPJyM9eLqy2fs/eTDUfDNPXA7asIAcsJIFHdNItKNLOei76J2z4NNzo1Ekh5f++WB65Edzj5vjj96X6hWeD8U+Hk=
X-Received: by 2002:a05:6830:1bd3:: with SMTP id
 v19mr8710838ota.91.1595596796072; 
 Fri, 24 Jul 2020 06:19:56 -0700 (PDT)
MIME-Version: 1.0
References: <20200721124250.8601-1-f4bug@amsat.org>
In-Reply-To: <20200721124250.8601-1-f4bug@amsat.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 24 Jul 2020 14:19:45 +0100
Message-ID: <CAFEAcA-VSRCR4fFwLkWhOcPtivQJOCM_LEbUafvsW-62Cb15bw@mail.gmail.com>
Subject: Re: [PATCH-for-5.1 v3] hw/misc/aspeed_sdmc: Fix incorrect memory size
To: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2607:f8b0:4864:20::32d;
 envelope-from=peter.maydell@linaro.org; helo=mail-ot1-x32d.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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
Cc: Andrew Jeffery <andrew@aj.id.au>, QEMU Developers <qemu-devel@nongnu.org>,
 QEMU Trivial <qemu-trivial@nongnu.org>, qemu-arm <qemu-arm@nongnu.org>,
 Joel Stanley <joel@jms.id.au>,
 =?UTF-8?Q?C=C3=A9dric_Le_Goater?= <clg@kaod.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Tue, 21 Jul 2020 at 13:42, Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org>=
 wrote:
>
> The SDRAM Memory Controller has a 32-bit address bus, thus
> supports up to 4 GiB of DRAM. There is a signed to unsigned
> conversion error with the AST2600 maximum memory size:
>
>   (uint64_t)(2048 << 20) =3D (uint64_t)(-2147483648)
>                          =3D 0xffffffff40000000
>                          =3D 16 EiB - 2 GiB
>
> Fix by using the IEC suffixes which are usually safer, and add
> an assertion check to verify the memory is valid. This would have
> caught this bug:
>
>   $ qemu-system-arm -M ast2600-evb
>   qemu-system-arm: hw/misc/aspeed_sdmc.c:258: aspeed_sdmc_realize: Assert=
ion `asc->max_ram_size < 4 * GiB' failed.
>   Aborted (core dumped)
>
> Fixes: 1550d72679 ("aspeed/sdmc: Add AST2600 support")
> Reviewed-by: C=C3=A9dric Le Goater <clg@kaod.org>
> Signed-off-by: Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org>
> --



Applied to target-arm.next, thanks.

-- PMM

