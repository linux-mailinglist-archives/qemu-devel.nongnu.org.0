Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5C4822C4850
	for <lists+qemu-devel@lfdr.de>; Wed, 25 Nov 2020 20:29:33 +0100 (CET)
Received: from localhost ([::1]:43898 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ki0Ts-0000bq-EY
	for lists+qemu-devel@lfdr.de; Wed, 25 Nov 2020 14:29:32 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:50524)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1ki0T0-0000AP-NV
 for qemu-devel@nongnu.org; Wed, 25 Nov 2020 14:28:38 -0500
Received: from mail-ej1-x642.google.com ([2a00:1450:4864:20::642]:33398)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1ki0Sy-0004Pn-U5
 for qemu-devel@nongnu.org; Wed, 25 Nov 2020 14:28:38 -0500
Received: by mail-ej1-x642.google.com with SMTP id 7so4662290ejm.0
 for <qemu-devel@nongnu.org>; Wed, 25 Nov 2020 11:28:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=pYWXnELe/62lDRed6k1bFpzeWnpVKLmKnRZnlKHoTRs=;
 b=TBbtONhBeCYs68mnUvvnni4CgbUNvfVakJOcNOW8qsjPBWU4OydeioaEa9b2+fbPh8
 DMFaZ4zrtJv2Bb3eA7EUuYAZg5MdyH+6X9QYjU4bmbLotAsfeozsRA/pGyweaTB0h6hi
 99sQVRIDBpgl4fiXGpZ5npV4ztsMK7vfwyoksOof5yMqpyZfnBs9tJpDo0zpGyAzTTJg
 U2CCrLMMCOTVNCDLAKqgw/j5Nrwc01jtjBE2vsIZg/aeUAZrMeb+gVJkyHU4v8zEEWJi
 D+24ib9OCNrVWh45dr8pYiwduHSLEpPVBVE+yVCgF8s2+gO17i5q4a+Luu7WONZvJKpj
 fomA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=pYWXnELe/62lDRed6k1bFpzeWnpVKLmKnRZnlKHoTRs=;
 b=JiS0P5bSU+oKjrXtmw/c6HCoW3AQIfkxL0WbAFDWLqBpJsiQuKMvSelp/9LWX8gZNN
 KTiqD3V61VLAVEL0eu8xTq8m1kqFrFjsEkrMLGwCUuy1tu7bYvPQ/gBsRd+3m/Ez9epW
 MizoOj7b1ID2uj3P0Uk/XtfBhS4SgbDHZtw/7wGweRdoU49I9FxeBeFJ8RByJ7mjkd3r
 e/bAStsRwKbNIbmHq0CNTfvarm7iXGppFQmNz2OE3+3szFPZPyR0H+i4vvV9hb/MrGyA
 bcQlkTjjva9xC6+18gqxMM84UJrQi/xBA50xkFaPewffutbbDbfxj4LSSYvTgQCy8eLa
 bOmA==
X-Gm-Message-State: AOAM530flwXEtP9nNE0pBrMe21hejW1fIJDVzC0t6S9QjBpO7N6+yFgq
 SqKZMcYoo1Q58wzcGtP6+Pjd2Np8dfULp+tbORuTGg==
X-Google-Smtp-Source: ABdhPJyYp3fgqYEaqKvMH2JFOsyu1iL8HEDIsOBoyiKDTeTvxw0XPjZaADQSItV0Rj3IXZh2oljVIat/WGTBJtvwirI=
X-Received: by 2002:a17:906:2741:: with SMTP id
 a1mr3846321ejd.85.1606332514355; 
 Wed, 25 Nov 2020 11:28:34 -0800 (PST)
MIME-Version: 1.0
References: <20201125191833.964753-1-sw@weilnetz.de>
In-Reply-To: <20201125191833.964753-1-sw@weilnetz.de>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Wed, 25 Nov 2020 19:28:23 +0000
Message-ID: <CAFEAcA-oo6M8W=uX=-FSyAkioQtPLQ5fe2V1CUaj1KkiK9efig@mail.gmail.com>
Subject: Re: [PATCH for-5.2] nsis: Fix build for 64 bit installer
To: Stefan Weil <sw@weilnetz.de>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::642;
 envelope-from=peter.maydell@linaro.org; helo=mail-ej1-x642.google.com
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
Cc: Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?Q?Daniel_P_=2E_Berrang=C3=A9?= <berrange@redhat.com>,
 QEMU Developers <qemu-devel@nongnu.org>,
 =?UTF-8?B?TWFyYy1BbmRyw6kgTHVyZWF1?= <marcandre.lureau@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Wed, 25 Nov 2020 at 19:23, Stefan Weil <sw@weilnetz.de> wrote:
>
> Pass cpu instead of cpu_family to the NSIS installer script.
>
> That script checks for "x86_64" which is the cpu value,
> while cpu_family is "x86".
>
> Signed-off-by: Stefan Weil <sw@weilnetz.de>
> ---
>  meson.build | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)

Very unfortunate that this has only surfaced after rc3,
which should in theory be the cutoff point for 5.2 changes.
Is it possible to get something into the CI/make check
so that we find Windows installer issues sooner?

thanks
-- PMM

