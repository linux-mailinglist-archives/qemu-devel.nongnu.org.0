Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5EF5D4BDAAB
	for <lists+qemu-devel@lfdr.de>; Mon, 21 Feb 2022 16:50:26 +0100 (CET)
Received: from localhost ([::1]:32832 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nMAxE-0002U5-VW
	for lists+qemu-devel@lfdr.de; Mon, 21 Feb 2022 10:50:24 -0500
Received: from eggs.gnu.org ([209.51.188.92]:50912)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1nMAr7-0004aU-Ku
 for qemu-devel@nongnu.org; Mon, 21 Feb 2022 10:44:05 -0500
Received: from [2a00:1450:4864:20::630] (port=46797
 helo=mail-ej1-x630.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1nMAr5-0008T7-Si
 for qemu-devel@nongnu.org; Mon, 21 Feb 2022 10:44:05 -0500
Received: by mail-ej1-x630.google.com with SMTP id qx21so34238033ejb.13
 for <qemu-devel@nongnu.org>; Mon, 21 Feb 2022 07:43:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=references:user-agent:from:to:cc:subject:date:in-reply-to
 :message-id:mime-version:content-transfer-encoding;
 bh=m0MzDSXn5LOqxsXYXXU5qMAd+aE/CSvIBDctF1zCEEs=;
 b=r4OQp6Lj8F7WPUJdLDGjA4ST7XiIzRioLhz9LMHR92pRBOs963egBATy7ZKFEqb0Gd
 CTd48nLXV953XBKdrIS5aJieEjUvJOHw1d3rusKR9OdDJnCu/jv10rdEpK9GifysJ6lL
 ayVC+lYHHt9Co3YbrgakUTa4IuBzVqkVH1WDap0snHBedTuPajZU6bkMjXTM4JHI8iQA
 +R0/rJgi/jKPRCqNUmZv1FDEx3HpCw31FiDsD0J75XacNTZsOQJZ3yz/hO5d/5u+5QaI
 KYkIJlAFFU6m+sRiXdG5+CcsWeQKaelH6EsFv+BdMthFTYN7Bu7JG+QthOxx9c2oi5JJ
 dQNg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:references:user-agent:from:to:cc:subject:date
 :in-reply-to:message-id:mime-version:content-transfer-encoding;
 bh=m0MzDSXn5LOqxsXYXXU5qMAd+aE/CSvIBDctF1zCEEs=;
 b=jttwmVUzBPFzDll05vLOrlwFDccC+wJ3GSGIkqwZeEjJym4OaM9uQRHBSO1DjuMkzP
 VUa4rbyWhggeZ7FWjdQKQVXCzwWwWGOsDV8k4rQ+Bkf5ZF/zOW8e3/xxcWM3RLkbrZUG
 PgGGiL1t6UifgeNsyS2WmEgxrmhOQJ9qRB7qcnVGAElwDj6ydPorXzXXUCbEmmsHLyuX
 Eg73DVi2lYUdwtCSUPAMdWsdv+eC8gp9GsrXn3tlK0amMnJ+MOWnkE0/FjaDjBogLFzu
 3gL1lRwtt8QB9d1QdCpCLgRn0Bapmw0Aj4nhagoGWI8Ur2T2w49te+i75kLfTAQAwG8S
 d7RA==
X-Gm-Message-State: AOAM532jAZZ9yqUEnCcR54tp+CoEOULp1qMoEG8ksuBMHfiabrQSal79
 ghlFgYQWgVZ+a30biz0SNlvZJg==
X-Google-Smtp-Source: ABdhPJwZevHOrVxvCDGeeGOnqVLBlzwFw87ZY3gaYrb7YvBFY615PevT9wuh9nKVMHR3NpoHV8oL+A==
X-Received: by 2002:a17:906:5e13:b0:6cf:42c:56b7 with SMTP id
 n19-20020a1709065e1300b006cf042c56b7mr16302677eju.725.1645458237403; 
 Mon, 21 Feb 2022 07:43:57 -0800 (PST)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id c6sm5234970ejs.130.2022.02.21.07.43.55
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 21 Feb 2022 07:43:56 -0800 (PST)
Received: from zen (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 227971FFB7;
 Mon, 21 Feb 2022 15:43:55 +0000 (GMT)
References: <20220221140750.514557-1-peter.maydell@linaro.org>
User-agent: mu4e 1.7.8; emacs 28.0.91
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Peter Maydell <peter.maydell@linaro.org>
Subject: Re: [PATCH] hw/input/tsc210x: Don't abort on bad SPI word widths
Date: Mon, 21 Feb 2022 15:43:50 +0000
In-reply-to: <20220221140750.514557-1-peter.maydell@linaro.org>
Message-ID: <87sfscmdhg.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::630
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::630;
 envelope-from=alex.bennee@linaro.org; helo=mail-ej1-x630.google.com
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
Cc: Cleber Rosa <crosa@redhat.com>, qemu-arm@nongnu.org, qemu-devel@nongnu.org,
 Philippe =?utf-8?Q?Mathieu?= =?utf-8?Q?-Daud=C3=A9?= <f4bug@amsat.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


Peter Maydell <peter.maydell@linaro.org> writes:

> The tsc210x doesn't support anything other than 16-bit reads on the
> SPI bus, but the guest can program the SPI controller to attempt
> them anyway. If this happens, don't abort QEMU, just log this as
> a guest error.
>
> This fixes our machine_arm_n8x0.py:N8x0Machine.test_n800
> acceptance test, which hits this assertion.
>
> The reason we hit the assertion is because the guest kernel thinks
> there is a TSC2005 on this SPI bus address, not a TSC210x.  (The n810
> *does* have a TSC2005 at this address.) The TSC2005 supports the
> 24-bit accesses which the guest driver makes, and the TSC210x does
> not (that is, our TSC210x emulation is not missing support for a word
> width the hardware can handle).  It's not clear whether the problem
> here is that the guest kernel incorrectly thinks the n800 has the
> same device at this SPI bus address as the n810, or that QEMU's n810
> board model doesn't get the SPI devices right.  At this late date
> there no longer appears to be any reliable information on the web
> about the hardware behaviour, but I am inclined to think this is a
> guest kernel bug.  In any case, we prefer not to abort QEMU for
> guest-triggerable conditions, so logging the error is the right thing
> to do.
>
> Resolves: https://gitlab.com/qemu-project/qemu/-/issues/736
> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>

Reviewed-by: Alex Benn=C3=A9e <alex.bennee@linaro.org>

--=20
Alex Benn=C3=A9e

