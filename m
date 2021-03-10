Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 97167334224
	for <lists+qemu-devel@lfdr.de>; Wed, 10 Mar 2021 16:54:47 +0100 (CET)
Received: from localhost ([::1]:35662 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lK1Ac-0005FI-Ki
	for lists+qemu-devel@lfdr.de; Wed, 10 Mar 2021 10:54:46 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:59654)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <akihiko.odaki@gmail.com>)
 id 1lK15h-0000XZ-C8
 for qemu-devel@nongnu.org; Wed, 10 Mar 2021 10:49:41 -0500
Received: from mail-ej1-x62b.google.com ([2a00:1450:4864:20::62b]:47000)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <akihiko.odaki@gmail.com>)
 id 1lK15f-00061g-Oc
 for qemu-devel@nongnu.org; Wed, 10 Mar 2021 10:49:41 -0500
Received: by mail-ej1-x62b.google.com with SMTP id r17so39613279ejy.13
 for <qemu-devel@nongnu.org>; Wed, 10 Mar 2021 07:49:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=VfhtpSu4sIHn9LmbZAGFebrRtbWy6kf8hNej/zFuV9g=;
 b=XG/3uc2j1k69VoyfkaR4w4WHbkeUNjR6ciYWGHMe5LhAVUa+nwbikrpQnfaM6JXsAA
 EqEjecyG9AW5o17cqUrYbfd7kt2kxAQRuB51qn0QPgjdn9qVneePiOQx8aKHOI8PJ5+d
 nmJ55NIUwNwYyV55ongZDW3P15YApKcc0nzJfnAFJjUi6nQFIGc60MVMr2gjBWxIEB/z
 i351szG5HZAnnpTn/KzEWSyy6mtXnGyN4wH5d+qzntjHFnnT4lE8UzOwYQ3U4Iu6KPCZ
 AhWBCTCChS5nlI2chtRqt3GTGtLulXKhsFZEuwGvIPOyfm2EFw3MIPT9jLJ/FDjHsqpK
 PrWQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=VfhtpSu4sIHn9LmbZAGFebrRtbWy6kf8hNej/zFuV9g=;
 b=gXaPVASWPl8cYQGG6N3pdqt5jMpGubg3/8inX9OK574VNhFdy+uEp1ev+wt32lR5WS
 kI1p/BUlcbqt7kIxi2G6fVt6NIyshrxJ+I/aHzPwiKBZQrIypzn97N+Zq4ZrIVgx4SGS
 2YI/TpWlpEo0Pl6ldwBvpOxbTJ3k6C1ZN7kIIEiXPv/I3YUI+6gBvSaartX+ENSqemCB
 1iqNV/VphAAKI51frJhJHvcSnPC8Ccd8GcHUW0S/NMwl8Yn6FgMnWUIO1DYafbfJg8XG
 h2rpGNiplK+2bKw0QgrkhKMIBQ7391crvafx3rCvfMyrUor6WWrsC/2w4RRFQAQt0yQT
 K6DQ==
X-Gm-Message-State: AOAM530eHvWLQBaXEIyNEuoejmOyt9cudUtxQwOou+lt2PO0juIfl5d1
 eAK0UTb7XfMIRFW9SPZTxNHfUM/bt/I4FKyzkzE=
X-Google-Smtp-Source: ABdhPJzIwmzADEe/HwAIXu5dG7jraZP+2QbemhdRqtC2nmRmeIynHCBVkiBP6B8qg2hLgLWNExFem53RIRqyTevms58=
X-Received: by 2002:a17:906:3856:: with SMTP id
 w22mr4380822ejc.77.1615391378283; 
 Wed, 10 Mar 2021 07:49:38 -0800 (PST)
MIME-Version: 1.0
References: <20210309122226.23117-1-akihiko.odaki@gmail.com>
 <20210309122226.23117-2-akihiko.odaki@gmail.com>
 <30b88283-8d6b-502b-9032-33c81e26d97@eik.bme.hu>
 <CAMVc7JWO0o9NUwPaE6wBMG+u7zHocWDPxr-6o3OcS5Zm0oT+HA@mail.gmail.com>
 <20210310122223.fq3zae5y42kmpl66@sirius.home.kraxel.org>
In-Reply-To: <20210310122223.fq3zae5y42kmpl66@sirius.home.kraxel.org>
From: Akihiko Odaki <akihiko.odaki@gmail.com>
Date: Thu, 11 Mar 2021 00:49:27 +0900
Message-ID: <CAMVc7JUX2yqC0-gVhWAJt2rf6x9uJx=eGcABZBFGQrgWVNSyJQ@mail.gmail.com>
Subject: Re: [PATCH 2/2] ui/cocoa: Do not rely on the first argument
To: Gerd Hoffmann <kraxel@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::62b;
 envelope-from=akihiko.odaki@gmail.com; helo=mail-ej1-x62b.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
 qemu Developers <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

2021=E5=B9=B43=E6=9C=8810=E6=97=A5(=E6=B0=B4) 21:22 Gerd Hoffmann <kraxel@r=
edhat.com>:
>
> > > > +    if (bundle) {
> > >
> > > Does this break about window if the executable is not in a bundle (li=
ke
> > > when run from the command line after compiling)? Shouldn't you only p=
ut
> > > the qemu_name in this if and have some default name if bundle is not
> > > available (or fall back to argv[0] in that case?
> > >
> > > Regards,
> > > BALATON Zoltan
> > >
> >
> > No, it just doesn't show the application name. Everything else is fine.
>
> Having a fallback would still be nice, even if it is just the fixed
> string "qemu".  Starting a fresh build without installing it first is
> common while developing.
>
> take care,
>   Gerd
>

It shows "QEMU emulator version %s" just below. Also, it can show the
name even in a build tree without installing so it should be ok.

Regards,
Akihiko Odaki

