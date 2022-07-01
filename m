Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D411C563139
	for <lists+qemu-devel@lfdr.de>; Fri,  1 Jul 2022 12:18:47 +0200 (CEST)
Received: from localhost ([::1]:41868 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o7Dja-0002Pw-ES
	for lists+qemu-devel@lfdr.de; Fri, 01 Jul 2022 06:18:46 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39040)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1o7Dfk-0000FY-Fy
 for qemu-devel@nongnu.org; Fri, 01 Jul 2022 06:14:49 -0400
Received: from mail-yw1-x112b.google.com ([2607:f8b0:4864:20::112b]:42555)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1o7DfW-0004ma-VO
 for qemu-devel@nongnu.org; Fri, 01 Jul 2022 06:14:48 -0400
Received: by mail-yw1-x112b.google.com with SMTP id
 00721157ae682-2ef5380669cso18633637b3.9
 for <qemu-devel@nongnu.org>; Fri, 01 Jul 2022 03:14:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=39rIdNazgW1JDjtzaijGrK5v11EsrSQuEozZpECwrCY=;
 b=BGgkGN58lOeCC5q3nfpPWRHeITVzx3jLKNhAr7xhNmSMLfVutG+PM9M8TKkxNb03GE
 emRT45j1iyTfvRICZbW6t1heqi81I/tC6xWSHBQu4/sdsf6xQIk6SvK8AOpXxdceiNYu
 l5d6dd4xHlXViHRWY0XEmlQ5JjiQuD/l+rQREVlTW74+7vBNN8s1rB+c5F/iKqT+Ef2I
 XkUyv0NQdF8c76120wSjK4hFIZwYl1XnFqTth2t3DXLkiKs+AhNhIpFFHouhiXzl6Lze
 rx4XxfBaYYaEKG1OMg8S0qn+++fzhg09KODyffopqoTpOdcIEWPkZAZHdtXKbvAFe8VH
 X6VQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=39rIdNazgW1JDjtzaijGrK5v11EsrSQuEozZpECwrCY=;
 b=dMg0L1gnCyuwJntAcL6B/HNSRNPuvPhwlKg0GBFErVYU5CwLm/h+ib/g55jjJl4hwB
 R3xCWhJJmbYHfzQcp+B6brewfDiJlRotrV835lFdfcbbjCbUrd8yGWIY1S5v6FP4st//
 OtNjcV8qS5AYo1BJgBI3xSlGgVc4HI6wDdiKGA02OHQv8SMzhKx0hRPmf8OpaAh7PlVi
 ClX02oRJeDjjuMVDhNlk2+BOQMZ58IKhiOxPg7HKevhYSYWpfSxXWg4DOjqKbADTHf7e
 YTYBlijLgbdo9dVzeOb6zwaw76At2UW2ckYsxFKF9Dr2zWahXmLCxIe3xkz9H6mGOsS6
 dBxQ==
X-Gm-Message-State: AJIora+QItcbHCUT4AaXpGpN5BZslO+qAv+h2u3yO0knkcPQJHuPvVWn
 BqpUOFi3DKzR7G8fz1jgDf4TkZlohUlYdzFjYWFLng==
X-Google-Smtp-Source: AGRyM1uNE0GAr2FcfCl8iB6wu4zoCbKSyX2BRT/ysouNmvPOY7zdB3Funxh6IWgprKZeH5cjkOXx7/iEjmKn+/VPThw=
X-Received: by 2002:a81:106:0:b0:2d0:e682:8a7a with SMTP id
 6-20020a810106000000b002d0e6828a7amr15969144ywb.257.1656670473978; Fri, 01
 Jul 2022 03:14:33 -0700 (PDT)
MIME-Version: 1.0
References: <20220620202921.21062-1-akihiko.odaki@gmail.com>
 <CAFEAcA-xUnoM9NSuqdgx6i3n==fk+Uxr3_5dk3hqdWvucwZ6oQ@mail.gmail.com>
 <20220701101055.ru3j4b2r5nuvwfgx@sirius.home.kraxel.org>
In-Reply-To: <20220701101055.ru3j4b2r5nuvwfgx@sirius.home.kraxel.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 1 Jul 2022 11:13:56 +0100
Message-ID: <CAFEAcA_4d8dUk+JuKD-+658p5t4LPdBt_K3aC+UKF+oKwPXQEg@mail.gmail.com>
Subject: Re: [PATCH v3] ui/cocoa: Take refresh rate into account
To: Gerd Hoffmann <kraxel@redhat.com>
Cc: Akihiko Odaki <akihiko.odaki@gmail.com>,
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>, 
 qemu-devel@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::112b;
 envelope-from=peter.maydell@linaro.org; helo=mail-yw1-x112b.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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

On Fri, 1 Jul 2022 at 11:11, Gerd Hoffmann <kraxel@redhat.com> wrote:
>
> On Tue, Jun 21, 2022 at 09:51:38AM +0100, Peter Maydell wrote:
> > On Mon, 20 Jun 2022 at 21:29, Akihiko Odaki <akihiko.odaki@gmail.com> wrote:
> > >
> > > Retreieve the refresh rate of the display and reflect it with
> > > dpy_set_ui_info() and update_displaychangelistener(), allowing the
> > > guest and DisplayChangeListener to consume the information.
> >
> > But why? What goes wrong if we don't bother to do this?
>
> Nothing goes wrong.  This provides a hint to the guest how often the
> display is updated, so the guest has the chance to adapt to that.
> When we run 30 Hz display updates on the host side it is pointless for
> the guest to update the screen at 60Hz frequency, the guest can spare
> some cpu cycles instead.
>
> [ this should be better explained in the commit message ]

Thanks for the explanation.

-- PMM

