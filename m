Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 127604BA18E
	for <lists+qemu-devel@lfdr.de>; Thu, 17 Feb 2022 14:42:51 +0100 (CET)
Received: from localhost ([::1]:43524 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nKh3Z-0007J9-NR
	for lists+qemu-devel@lfdr.de; Thu, 17 Feb 2022 08:42:49 -0500
Received: from eggs.gnu.org ([209.51.188.92]:48814)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1nKg6d-00073U-Hs
 for qemu-devel@nongnu.org; Thu, 17 Feb 2022 07:41:55 -0500
Received: from [2a00:1450:4864:20::62b] (port=40885
 helo=mail-ej1-x62b.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1nKg6a-0000gl-02
 for qemu-devel@nongnu.org; Thu, 17 Feb 2022 07:41:53 -0500
Received: by mail-ej1-x62b.google.com with SMTP id p15so6923364ejc.7
 for <qemu-devel@nongnu.org>; Thu, 17 Feb 2022 04:41:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=references:user-agent:from:to:cc:subject:date:in-reply-to
 :message-id:mime-version:content-transfer-encoding;
 bh=NWqxa0fX7wT+VsS/TxtlGe7RxlgAE8iSVtKC1Zh/OWs=;
 b=pr6SRuLnjtQo8PekN5Dr5nTPsiMPRVk5v/J/1bl07JvKleWWSyeslUGG4HJHLP0f8K
 Bm+ggirlwFVlCgma7kdwUIQc4wlPi3GRRlbFOv4/WXEdZrF5HSQnxkR0r50lKk08k6C/
 LPMXRB4rqLn9p7MMZSwH37if/k43ho2j0BkS301QOQChdOFtMjQhGFG9bzjlSFJJ/5/U
 l9528aQcMwfGSw+GXzNlcXZsnw1ypyhBWALzc2C6y2ev05trEX6VvS2ilpqjB3vA+Qo7
 +lXvTauoufEyr0VDsvowos4gXp3kW0Saq0cpuVEk3B/MAU3clPBNNU4MVWKfrC5v1sIJ
 K0Rg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:references:user-agent:from:to:cc:subject:date
 :in-reply-to:message-id:mime-version:content-transfer-encoding;
 bh=NWqxa0fX7wT+VsS/TxtlGe7RxlgAE8iSVtKC1Zh/OWs=;
 b=Q6C106XTKMt1U4WY6VqemCs7k+745myN15QEG+B2+X4MsrRuyWOQRuAC9zwgFByV7G
 SQtqMza2ns+A2FC1YkSi6/ETJ9A0y8Ue8NMtLQd0UJ8blcu/jZVXJzH8vPcs+0hfKXe6
 6LAVL28FwfZqX+3CJ1P/Yp7HmeQ1yncU5yIoVuWpmD712SkezjKrttg5M34PDwVedD87
 w6oxnjiL+xqWy+KUDhmsXZWB3nAO+7kiG7ze6r/g6X/VyX4J8QmpG3doWqRsa4n3lOU9
 6DX7wQYCuhJig6KvStLaDRZ4OkjEoQvSJm0KX1h5u+NeYjgyFb/xcxBOJNnSoAdC9QS9
 yU8g==
X-Gm-Message-State: AOAM530y9UWL6tR5x05lvdcAxwyIEvnm73g/BONf1tq/4QYSoaZEL6Kp
 qoV3OgVoJw8nxvSnbUkjb+f4eQ==
X-Google-Smtp-Source: ABdhPJyyIaEreNlQq5OsLQ9gIJRZj/+67i0u3muLxHohfgMD+uY7nlNeeJsxKg31shWC0b+3uQJNEQ==
X-Received: by 2002:a17:906:6d94:b0:6ce:d45b:19b8 with SMTP id
 h20-20020a1709066d9400b006ced45b19b8mr2111259ejt.634.1645101699636; 
 Thu, 17 Feb 2022 04:41:39 -0800 (PST)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id f17sm1139953ejl.36.2022.02.17.04.41.38
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 17 Feb 2022 04:41:38 -0800 (PST)
Received: from zen (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 9992520329;
 Thu, 17 Feb 2022 12:41:37 +0000 (GMT)
References: <20220217034725.272552-1-richard.henderson@linaro.org>
User-agent: mu4e 1.7.7; emacs 28.0.91
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Richard Henderson <richard.henderson@linaro.org>
Subject: Re: [PATCH] tcg: Remove dh_alias indirection for dh_typecode
Date: Thu, 17 Feb 2022 12:41:06 +0000
In-reply-to: <20220217034725.272552-1-richard.henderson@linaro.org>
Message-ID: <878ru9br7i.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::62b
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::62b;
 envelope-from=alex.bennee@linaro.org; helo=mail-ej1-x62b.google.com
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
Cc: Keith Packard <keithp@keithp.com>, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


Richard Henderson <richard.henderson@linaro.org> writes:

> The dh_alias redirect is intended to handle TCG types as distinguished
> from C types.  TCG does not distinguish signed int from unsigned int,
> because they are the same size.  However, we need to retain this
> distinction for dh_typecode, lest we fail to extend abi types properly
> for the host call parameters.
>
> This bug was detected when running the 'arm' emulator on an s390
> system. The s390 uses TCG_TARGET_EXTEND_ARGS which triggers code
> in tcg_gen_callN to extend 32 bit values to 64 bits; the incorrect
> sign data in the typemask for each argument caused the values to be
> extended as unsigned values.
>
> This simple program exhibits the problem:
>
> 	static volatile int num =3D -9;
> 	static volatile int den =3D -5;
>
> 	int
> 	main(void)
> 	{
> 		int quo =3D num / den;
> 		printf("num %d den %d quo %d\n", num, den, quo);
> 		exit(0);
> 	}
>
> When run on the broken qemu, this results in:
>
> 	num -9 den -5 quo 0
>
> The correct result is:
>
> 	num -9 den -5 quo 1
>

Resolves: https://gitlab.com/qemu-project/qemu/-/issues/876

Reviewed-by: Alex Benn=C3=A9e <alex.bennee@linaro.org>

--=20
Alex Benn=C3=A9e

