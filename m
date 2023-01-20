Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D4F1A67520F
	for <lists+qemu-devel@lfdr.de>; Fri, 20 Jan 2023 11:09:22 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pIoJX-0004VS-FU; Fri, 20 Jan 2023 05:08:03 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1pIoJV-0004U0-Ik
 for qemu-devel@nongnu.org; Fri, 20 Jan 2023 05:08:01 -0500
Received: from mail-wm1-x332.google.com ([2a00:1450:4864:20::332])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1pIoJT-0006RK-EI
 for qemu-devel@nongnu.org; Fri, 20 Jan 2023 05:08:01 -0500
Received: by mail-wm1-x332.google.com with SMTP id l8so3588114wms.3
 for <qemu-devel@nongnu.org>; Fri, 20 Jan 2023 02:07:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:message-id:in-reply-to:date
 :subject:cc:to:from:user-agent:references:from:to:cc:subject:date
 :message-id:reply-to;
 bh=hW1pm6mLmCuIyV9lJRovvE86SCBfTaOaSR51MXQHlpo=;
 b=BEEwHKCILTxU+I2nWbSAWIy5HaW0WmXyrIKvYelG4ELCRSvj0raEIDMd9MvZqxH/iF
 BtoLc8YoI1ZvxOrffU2T6HF8JH9ySEEE0djTSi4o47sr6lUwib7ehFkGLhtDp8uX0DQz
 mMxPJXob003hQGFx09E9Tbww0zgQWaM720hatt+2loZLpCeoj2ht8bdoVYgsy++q94Bk
 4cPB+bBnFUr541ofKBGHo/pJi13dyrujterflstPfIE2lL28Iy3h7RcrNY6+OS8/SSSJ
 BaUOjLY89EbF3gD7OHXcJVt7/lkpsjk6NvkouuOdMcJsTAsVAuB3kAYU+lfzW2kSHT1K
 hNTw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:in-reply-to:date
 :subject:cc:to:from:user-agent:references:x-gm-message-state:from:to
 :cc:subject:date:message-id:reply-to;
 bh=hW1pm6mLmCuIyV9lJRovvE86SCBfTaOaSR51MXQHlpo=;
 b=PYo+5YoH8vW8XJIRIoa7tD2XDaW8OT94CRZu03ZHfPy4VzVTC97a/TkLV3X6bgASc+
 lgWZRG72miW+EZcEAqNAO97xblpOlHa5hO/LSZpPqavJRwh5VuiPXSaFrCm/mdhdi34y
 rr4ePUnxFDoK9hcP5r/XSoO2WjhHyu6IMhED+7cO2j3ttqJQathfBe+1Jbf3c/aehJa8
 VT43pQJnFaUM1RwDFdFypCBcCHMqeU1pGvdnuZ+ijY0gSKO1r6J27A3kukHbhLkOaZnq
 6o/dqWEqhh98E9P/YQWoPm9keo23pQmefrQRN0PUEBTFsuDIo+9wAl0r5xCd+PBH0n5U
 1BNQ==
X-Gm-Message-State: AFqh2krQ46baJSPIqSiSoXEud+htY5L1KmeTRzO4hz6rcS1ULtoKHYxi
 rPQJXjBz2sPto3UG24SFcy/WUw==
X-Google-Smtp-Source: AMrXdXuzkDbHa19jfb7qvTluSkmjofE4S4vlWA46O3p0mcnlMTT8iRyh9B57MnLV3aOdQi9pKP+vZg==
X-Received: by 2002:a05:600c:cc8:b0:3cf:497c:c59e with SMTP id
 fk8-20020a05600c0cc800b003cf497cc59emr9910765wmb.6.1674209277266; 
 Fri, 20 Jan 2023 02:07:57 -0800 (PST)
Received: from zen.linaroharston ([185.81.254.11])
 by smtp.gmail.com with ESMTPSA id
 k10-20020a05600c1c8a00b003db2dbbd710sm2020636wms.25.2023.01.20.02.07.56
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 20 Jan 2023 02:07:56 -0800 (PST)
Received: from zen (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 5D65C1FFB7;
 Fri, 20 Jan 2023 10:07:56 +0000 (GMT)
References: <20230119180419.30304-1-alex.bennee@linaro.org>
 <20230119180419.30304-15-alex.bennee@linaro.org>
 <d6314a22-4c5c-a431-ce37-4cc7f64ac092@linaro.org>
User-agent: mu4e 1.9.15; emacs 29.0.60
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Richard Henderson <richard.henderson@linaro.org>
Cc: qemu-devel@nongnu.org
Subject: Re: [PATCH 14/18] tests/docker: drop debian-tricore-cross's partial
 status
Date: Fri, 20 Jan 2023 10:06:13 +0000
In-reply-to: <d6314a22-4c5c-a431-ce37-4cc7f64ac092@linaro.org>
Message-ID: <87o7qty0w3.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::332;
 envelope-from=alex.bennee@linaro.org; helo=mail-wm1-x332.google.com
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org


Richard Henderson <richard.henderson@linaro.org> writes:

> On 1/19/23 08:04, Alex Benn=C3=A9e wrote:
>> This image is perfectly capable of building QEMU, and indeed we do
>> that on gitlab. Drop the DOCKER_PARTIAL_IMAGES setting so we can also
>> test the gitlab build locally.
>> Signed-off-by: Alex Benn=C3=A9e<alex.bennee@linaro.org>
>> ---
>>   tests/docker/Makefile.include | 1 -
>>   1 file changed, 1 deletion(-)
>
> Why are we doing so, though?

Only so I could debug what was failing upstream.

> Unlike the other container-cross.yml jobs, we are not cross-compiling.
> We are building for an x86_64 host, not a tricore host.
>
> We appear to be using this container simply to provide a
> cross-compiler for compiling tricore tests.  Which is fine, I suppose,
> but I think the job should be modeled more like build-some-softmmu,
> instead of modeled like a cross-build.

It's just to work around the fact we don't have QEMU test coverage for
our debian-all-test-cross because of the custom binutils bits. That's
why it gained the ability to build QEMU (albeit just one target).

--=20
Alex Benn=C3=A9e
Virtualisation Tech Lead @ Linaro

