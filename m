Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D9C22602968
	for <lists+qemu-devel@lfdr.de>; Tue, 18 Oct 2022 12:35:39 +0200 (CEST)
Received: from localhost ([::1]:39690 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1okjwg-0008P1-70
	for lists+qemu-devel@lfdr.de; Tue, 18 Oct 2022 06:35:38 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60104)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1okjqu-0004fU-S0
 for qemu-devel@nongnu.org; Tue, 18 Oct 2022 06:29:42 -0400
Received: from mail-wr1-x429.google.com ([2a00:1450:4864:20::429]:44792)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1okjqt-0005Ox-Bl
 for qemu-devel@nongnu.org; Tue, 18 Oct 2022 06:29:40 -0400
Received: by mail-wr1-x429.google.com with SMTP id r13so22711160wrj.11
 for <qemu-devel@nongnu.org>; Tue, 18 Oct 2022 03:29:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=+eO1Z3KVM9W4mttO5bD4BQzd36+sH3OBA8iaAzcg80Q=;
 b=e9MV33hLDtS1Vcrq4FTT0zAMGALp9WZ+3VXpheB7HEIt/NNx/lLWKy+F6hGtcaF3lS
 974dHS90v8EbpLvwcpiNypcUFw4+0WhxKAdYQdnf0UHdij7dcWQO0q0JIP5HmatvtJYv
 9rl3heUT1BweCeeFsBniYd627xydo0RwUq4Tp0euO9kEghLHuamaHdP0A6eztKug/D/M
 XJ9VjqsrZUfpbm7UsOW7I1pE6Q1/Hxd4MkkOM8Jv896cf9aEU49Cb1fMKMrJjb62mdPX
 lpDPSeqr1Yq0TqIlhsDrI42gI/XximyG2IkgHKH9vP/WD+IcaMlJjrs9iJQNaDWfEGy6
 lX5A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=+eO1Z3KVM9W4mttO5bD4BQzd36+sH3OBA8iaAzcg80Q=;
 b=2f+7hxis9J2FhgThvZB3rm3eZwes+/WqjFNkNSitI0Iil47h/JL/vt3D30T+4JbR23
 7eRagHHR77DjoITqoV1tZZNjkrAIzmYcE4ykGpFhaVxu7/nlSiOjgKk+FrlVYg1txPX+
 6FRt367HxjsusWXE24MjQiyC325ZOLQsGg7AxmV41KTRXr2JLxkgHaUpTX131cD/S4CC
 TqfWEUa/POIQNjMwcr8hGSm0kAg9KWTOAYhE7Lqy+6ehHzEJaQybamgNO1JOKisXgiTj
 3ZB2Tv/GOX+5IBOHtuaBipgiGO8ZuSH6IJCub/bkPsRFa3vLCad8y3LmDOcra21mjZoZ
 H0yg==
X-Gm-Message-State: ACrzQf0hCoRNGJAnWfXkGdKbK+x1wMeKoWS4R57t6gfFEJ/z5ru96Csv
 SqUF1zVUXmfOoC9XFDDbB9zVjg==
X-Google-Smtp-Source: AMsMyM5xiA/H9KJ+n/VRodFOO4l0V3r48r07FJDOClcKcpuCjC8DboIF5FOH13MnNQiwKKl2DkJtyw==
X-Received: by 2002:a5d:588f:0:b0:231:c661:5cee with SMTP id
 n15-20020a5d588f000000b00231c6615ceemr1490525wrf.18.1666088976764; 
 Tue, 18 Oct 2022 03:29:36 -0700 (PDT)
Received: from [192.168.1.115] ([185.126.107.38])
 by smtp.gmail.com with ESMTPSA id
 o5-20020a5d62c5000000b00228cbac7a25sm10777984wrv.64.2022.10.18.03.29.35
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 18 Oct 2022 03:29:36 -0700 (PDT)
Message-ID: <0a504b7d-3b6f-fd74-a4b7-f9b99fa091c1@linaro.org>
Date: Tue, 18 Oct 2022 12:29:34 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:91.0)
 Gecko/20100101 Thunderbird/91.13.1
Subject: Re: [PATCH] bsd-user: Catch up with sys/param.h requirement for
 machine/pmap.h
Content-Language: en-US
To: Warner Losh <imp@bsdimp.com>, qemu-devel@nongnu.org
Cc: Richard Henderson <richard.henderson@linaro.org>,
 John Baldwin <jhb@freebsd.org>, Kyle Evans <kevans@freebsd.org>,
 Muhammad Moinur Rahman <bofh@FreeBSD.org>
References: <20221012185631.89617-1-imp@bsdimp.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
In-Reply-To: <20221012185631.89617-1-imp@bsdimp.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::429;
 envelope-from=philmd@linaro.org; helo=mail-wr1-x429.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 12/10/22 20:56, Warner Losh wrote:
> From: Muhammad Moinur Rahman <bofh@FreeBSD.org>
> 
> Some versions of FreeBSD now require sys/param.h for machine/pmap.h on
> x86. Include them here to meet that requirement. It does no harm on
> older versions, so there's no need to #ifdef it.
> 
> Signed-off-by:  Muhammad Moinur Rahman <bofh@FreeBSD.org>
> Reviewed-by:	John Baldwin <jhb@FreeBSD.org>
> Signed-off-by:	Warner Losh <imp@bsdimp.com>
> ---
>   bsd-user/host/i386/host-signal.h   | 1 +
>   bsd-user/host/x86_64/host-signal.h | 1 +
>   2 files changed, 2 insertions(+)

Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>

