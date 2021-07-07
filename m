Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B4AE63BED64
	for <lists+qemu-devel@lfdr.de>; Wed,  7 Jul 2021 19:48:41 +0200 (CEST)
Received: from localhost ([::1]:38252 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m1Bf6-00070O-QA
	for lists+qemu-devel@lfdr.de; Wed, 07 Jul 2021 13:48:40 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49618)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1m1BTB-0005Gd-G7
 for qemu-devel@nongnu.org; Wed, 07 Jul 2021 13:36:21 -0400
Received: from mail-ej1-x62d.google.com ([2a00:1450:4864:20::62d]:41783)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1m1BT9-0007rY-Uz
 for qemu-devel@nongnu.org; Wed, 07 Jul 2021 13:36:21 -0400
Received: by mail-ej1-x62d.google.com with SMTP id b2so4546691ejg.8
 for <qemu-devel@nongnu.org>; Wed, 07 Jul 2021 10:36:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=r7P/FFIcUHJB4s1sNv7gmmIsROEFzzS3GrKbUQ6P96E=;
 b=kod0fnAhXqgnpQ6fiUhbEheJmwfZHtQdGiq36YPThfgRH3kh7NDDGEquGiKxGDhJIc
 +ItXZ4N2ssfWlV3+R//fdGpu+1QGnMQXnRQjuRl8xKlh38Zh1DVIgxVInraR3Ehy5d7m
 T+85ZIB8i8CrnQ8yOhmk6n8h4fQydwGDlnneWcBOGf5buZ4zNO7w0S5InlyZVJMfmnZy
 oWlq+0W3AqMfBJOODVsei6nLUnLPkjixZSohCsXu7zlg9ChIW+OeQQnK457mLenO+kpJ
 Ca7qDROg8KCxm5iyDgCj/v9nzrMnlyUxBLqRXVO/UVswAp3X/RDVyNyBKUR6GE1RNejY
 f/7Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=r7P/FFIcUHJB4s1sNv7gmmIsROEFzzS3GrKbUQ6P96E=;
 b=dfeJqtTTlja9U+PKlbq/Y7WXEZ86KA4JihQbciNa+qu5QbJtvy5Zl8ZueXVRcN2z0X
 xXRqirUoAlDfNsog2AMug8J/X7s+U7wwcNdiuJkEDfF4OiO38PLGvb2YHpQZluWauYJU
 2xymj6Om9tUpoKJ6im7rJ+eY7MOMDyBzKcmHEHJMjEVVjKnM0dc8BU+LYfTczktSLKo6
 5pgvBxuJAbV00S3B4SwSRITt2hHcmwZdRWUAR3LtrqQTD2kLKyWaIT2OSMPvJkrhpRp+
 Acd10qkQsM6F1XkMkWN/YQi7X1opy/HELiVkkhGA9NIzVLK1YyffG7ZUrPN83VZRPw/T
 mkjg==
X-Gm-Message-State: AOAM530Tjbv4JWoXhk8mu1DpJ+49IslFyfaNhhoBb11UDI8yCB+ScDXw
 p1QgbtxRu2+MPB6nQuRQ6uxB38/PF3Y6wuZcoynuRA==
X-Google-Smtp-Source: ABdhPJzVFFVdcgx7BgZw5xiEjCIkE+uszQczpKnqQzFAGcPHs5CZ7CAtiYd2MRgDU1AAejGm0cVALnJnmX0n2VfSW60=
X-Received: by 2002:a17:906:a108:: with SMTP id
 t8mr25184480ejy.407.1625679377668; 
 Wed, 07 Jul 2021 10:36:17 -0700 (PDT)
MIME-Version: 1.0
References: <20210706234932.356913-1-richard.henderson@linaro.org>
 <20210706234932.356913-14-richard.henderson@linaro.org>
In-Reply-To: <20210706234932.356913-14-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Wed, 7 Jul 2021 18:35:39 +0100
Message-ID: <CAFEAcA8-p4BUKT3jSGx8bXH0v-=KkU5-BPESw0dAXxus_cPkzA@mail.gmail.com>
Subject: Re: [PATCH v2 13/36] linux-user/arm: Drop v1 signal frames
To: Richard Henderson <richard.henderson@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::62d;
 envelope-from=peter.maydell@linaro.org; helo=mail-ej1-x62d.google.com
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
Cc: qemu-arm <qemu-arm@nongnu.org>,
 =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>,
 QEMU Developers <qemu-devel@nongnu.org>, Laurent Vivier <laurent@vivier.eu>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Wed, 7 Jul 2021 at 00:49, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> Version 2 signal frames are used from 2.6.12.
> Since cbc14e6f286, we have set UNAME_MINIMUM_RELEASE to 2.6.32,
> which means that version 1 signal frames are never used.

This isn't strictly true -- the user can manually set the
uname release to something earlier than 2.6.12 and if they
do we will (currently) honour it. But I don't think anybody's
actually doing that...

-- PMM

