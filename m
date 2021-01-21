Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B90292FF7C0
	for <lists+qemu-devel@lfdr.de>; Thu, 21 Jan 2021 23:12:35 +0100 (CET)
Received: from localhost ([::1]:58272 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l2iBu-0000qy-PK
	for lists+qemu-devel@lfdr.de; Thu, 21 Jan 2021 17:12:34 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:40950)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1l2i6Q-0003uK-HF; Thu, 21 Jan 2021 17:06:54 -0500
Received: from mail-ej1-x62b.google.com ([2a00:1450:4864:20::62b]:38667)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1l2i6P-0007lH-0v; Thu, 21 Jan 2021 17:06:54 -0500
Received: by mail-ej1-x62b.google.com with SMTP id 6so4850992ejz.5;
 Thu, 21 Jan 2021 14:06:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=FD/Lnz0jfyE5PYoSqi6tgXnBD0e6UQNzBm9X8MeVZpo=;
 b=PmjuTGQrYjA/clv6anJK6+KvW/R1bGgoTGPU98q7BvCKBm/7lsjhyKNpfKHQeZZTNc
 WcLcudQg8YLEOPie1hl3UkWzTGxqtIvgHALXfV5fBjmWgZdRYq3Huf4qYr0I51nlWriu
 d19QUbMTYAyyvHLsTHJ18zYoBhSJ5PH1akoipsXjEfdf9yfoweSm/Wk4mqgPfrxT/Ac2
 sAdWUyuiIRMC63mfxq55ws5DCY3oo8XXNWyZ8qVNqUQfhGFgEXS5ulU/gVTUkG5vt4TA
 +zj/qq9f/6wEP6XLNoc7o5OeFxf6IEvM4dsfEvX1AlCP/4OWIAp+1pIoVD9JogKh3Qfz
 ciUg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:subject:to:cc:references:from:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=FD/Lnz0jfyE5PYoSqi6tgXnBD0e6UQNzBm9X8MeVZpo=;
 b=jJgdDfQfKdZS7Wwx51OfU7ijvMhzmtBVJDXpANFDEdPnNLQJJKhoVPqZXfTYH9uh0A
 wdy4+/0BBrohUS2hV1lNvIgV/QSzamqpeGlWIQwud+j8zvR6bB3Y97GcXsFxRFs7HlOa
 +PnRHcN/GTzpL9GfH5qACOu2Ii7DT2+a/F/4E5ofFjDZzE4rEi5REbO+ZBkjXALTM/IS
 RwH2aFlydRXUQ0Ly8LQhE2pLxgHuZtXSwiduB7vLnyq40LVtSOzIRcWLSY6Mr4FOMN48
 tNA94b3qEu1Vt/oiaiz+mQkaqqrrtsWMB+BK5pzN6j2VNqlio9te2O8F5s7HmkaWWyzR
 H6vA==
X-Gm-Message-State: AOAM533XwsjR8GnUt7+Dy+sov5IuJWX7RcTgs/Z7xQT+5cZUCcAE4x1y
 O7acFB2qwpMHF88lvKDiqzg=
X-Google-Smtp-Source: ABdhPJyJYxchzRBjiThgFR1AoH1W8Ex95ekJzQXViv75PXP3DqfrbIt9v0jfG6Y+kk3c1LfcBctYBg==
X-Received: by 2002:a17:907:2651:: with SMTP id
 ar17mr1009019ejc.98.1611266811013; 
 Thu, 21 Jan 2021 14:06:51 -0800 (PST)
Received: from [192.168.1.36] (13.red-83-57-169.dynamicip.rima-tde.net.
 [83.57.169.13])
 by smtp.gmail.com with ESMTPSA id da26sm3550938edb.36.2021.01.21.14.06.49
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 21 Jan 2021 14:06:50 -0800 (PST)
Subject: Re: [PATCH 23/25] arm: Don't set freq properties on CMSDK timer,
 dualtimer, watchdog, ARMSSE
To: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org
References: <20210121190622.22000-1-peter.maydell@linaro.org>
 <20210121190622.22000-24-peter.maydell@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
Message-ID: <8028e020-168c-e7b0-3f83-f5176aeaa049@amsat.org>
Date: Thu, 21 Jan 2021 23:06:49 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.0
MIME-Version: 1.0
In-Reply-To: <20210121190622.22000-24-peter.maydell@linaro.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::62b;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-ej1-x62b.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.249, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: Damien Hedde <damien.hedde@greensocs.com>, Luc Michel <luc@lmichel.fr>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 1/21/21 8:06 PM, Peter Maydell wrote:
> Remove all the code that sets frequency properties on the CMSDK
> timer, dualtimer and watchdog devices and on the ARMSSE SoC device:
> these properties are unused now that the devices rely on their Clock
> inputs instead.
> 
> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
> ---
>  hw/arm/armsse.c    | 7 -------
>  hw/arm/mps2-tz.c   | 1 -
>  hw/arm/mps2.c      | 3 ---
>  hw/arm/musca.c     | 1 -
>  hw/arm/stellaris.c | 3 ---
>  5 files changed, 15 deletions(-)

Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>

