Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6A4283A15AB
	for <lists+qemu-devel@lfdr.de>; Wed,  9 Jun 2021 15:32:25 +0200 (CEST)
Received: from localhost ([::1]:55524 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lqyJk-00067B-GI
	for lists+qemu-devel@lfdr.de; Wed, 09 Jun 2021 09:32:24 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57142)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lqyIB-0005Rp-L2
 for qemu-devel@nongnu.org; Wed, 09 Jun 2021 09:30:47 -0400
Received: from mail-ed1-x535.google.com ([2a00:1450:4864:20::535]:36638)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lqyI8-0005iw-DF
 for qemu-devel@nongnu.org; Wed, 09 Jun 2021 09:30:47 -0400
Received: by mail-ed1-x535.google.com with SMTP id w21so28586413edv.3
 for <qemu-devel@nongnu.org>; Wed, 09 Jun 2021 06:30:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=TjBp35r7H+Cw9vhxrBTcOHkrlEyrshWk/sQ8N9z55No=;
 b=pPLRP4EAv4RUrqqJ8UpYbx5YKa8flMrMOd5BVQYygD6Ni9L6hbjkjc1MJ4F5SbzYNv
 Znv12BUUCAmm/BkHsDcz+g6sq2fERrksj7EMaJbzy0BAVkklbP8cKb0uQZxywBS66ync
 Y8qqN5cD8Nh4We+6lpdV+wY1JEYqx8Vu2xtegH1a7EBS2p5FzL51V3PQKq2rrJ1C48vY
 ZVsiKWVSiOWvsv0z3RcGQLnHyceAYalSjd8QBmdkOwnfwCliwMTD++hYvkOkLXJHn0Qs
 wqojJhy7yIPICvkqmznCdNUHiZ0sBOcQSnJebB+sqb8yjcxTyQnUx35yiP5FL96uxhHg
 tScQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=TjBp35r7H+Cw9vhxrBTcOHkrlEyrshWk/sQ8N9z55No=;
 b=ZQx/GeOjQizQR4VRKPHLz7onvZax+6aAk1tLK3B6ZydMYqCd7ERtiyE/XxGA2Pe1j/
 Nm5of5KFvW0Z63gGv9yOcPrTD3Xn4wyBHsB4MefC3l/+pZGLc5zF8gsOPbRi8q5jRfju
 cNl+AjY9GbaolTnUP9jRDXV6UJHTEsdz8Q+RdHk6FrN986SirO18dCaV+lT8hOKQmzUc
 R7t4S3gl45h2IPOhSIorn7c4qkBVbeLwOoAPh/aaE20Wzw/eHj3QnuHhwYSFT2QFdKb5
 xSxQOwkQp9l9EOhL2oZ7JfpWLN+MUgJvN6sYDr2KrFHZD04DT+HdhV9Yuvd6b3W85i5i
 qv7g==
X-Gm-Message-State: AOAM533ZAjbZSjHJll4Ri673y9IrcB2Uao5Kxe6aytSpJyuZHw+ON/H0
 HY9aRPbXwBDWEPmDf4lyi7dtdMh8ZfcvIg7GGoq0Mg==
X-Google-Smtp-Source: ABdhPJwfa1vh/PyJNxTTNWlArhMa6J1oKB6RYJhtXpx80Q3cEFV/oR7LWbdzugEXmOkJO/CqhKRyGng4F2Wh/DxLc4k=
X-Received: by 2002:a05:6402:3482:: with SMTP id
 v2mr20745134edc.44.1623245442853; 
 Wed, 09 Jun 2021 06:30:42 -0700 (PDT)
MIME-Version: 1.0
References: <878s3jrzm0.fsf@gmail.com> <YMC38baIdFTL/q+f@redhat.com>
In-Reply-To: <YMC38baIdFTL/q+f@redhat.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Wed, 9 Jun 2021 14:30:09 +0100
Message-ID: <CAFEAcA-4cakv+K2D0Fy67kFrY3J4SdDUJJ=J89Pp-YX5n=3WvA@mail.gmail.com>
Subject: Re: [PATCH] configure: map x32 to cpu_family x86_64 for meson
To: =?UTF-8?Q?Daniel_P=2E_Berrang=C3=A9?= <berrange@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::535;
 envelope-from=peter.maydell@linaro.org; helo=mail-ed1-x535.google.com
X-Spam_score_int: -19
X-Spam_score: -2.0
X-Spam_bar: --
X-Spam_report: (-2.0 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 URIBL_SBL_A=0.1 autolearn=ham autolearn_force=no
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
 =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>,
 David Michael <fedora.dm0@gmail.com>, QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Wed, 9 Jun 2021 at 13:48, Daniel P. Berrang=C3=A9 <berrange@redhat.com> =
wrote:
>
> On Wed, Jun 09, 2021 at 08:28:39AM -0400, David Michael wrote:
> > The meson.build file defines supported_cpus which does not contain
> > x32, and x32 is not one of meson's stable built-in values:
> > https://mesonbuild.com/Reference-tables.html#cpu-families
> >
> > Signed-off-by: David Michael <fedora.dm0@gmail.com>
> > ---
> >
> > Hi,
> >
> > QEMU fails to build for x32 due to that cpu_family not being defined in
> > supported_cpus.  Can something like this be applied?
> >
> > Alternatively, maybe it could be added to supported_cpus and accepted
> > everywhere that matches x86 in meson.build, but upstream meson does not
> > define a CPU type for x32.
>
> "supported_cpus" serves two distinct purposes in meson.build
>
>  - Identifies whether TCG supports the target
>  - Identifies whether QEMU maintainers consider the target supported
>
> The change proposed below makes x32 be treated the same as x86_64.

I feel like it's more "fixing a regression we introduced by accident
at some point". Looking at the 5.1 configure script (which predates
the meson conversion) x32 is marked as a supported cpu. Currently it
isn't, so that's a regression. (I don't have the setup to bisect that
right now, but it would be interesting to confirm where it stopped
working.) Whether we feel that we no longer want to support x32 is
a separate question and we'd need to go through our usual deprecation
process if we did want to drop it.

thanks
-- PMM

