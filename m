Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id F0AA16D97D1
	for <lists+qemu-devel@lfdr.de>; Thu,  6 Apr 2023 15:18:22 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pkPVE-0007rv-B7; Thu, 06 Apr 2023 09:18:12 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1pkPVA-0007r3-Ou
 for qemu-devel@nongnu.org; Thu, 06 Apr 2023 09:18:09 -0400
Received: from mail-ej1-x62c.google.com ([2a00:1450:4864:20::62c])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1pkPV9-0000t6-2O
 for qemu-devel@nongnu.org; Thu, 06 Apr 2023 09:18:08 -0400
Received: by mail-ej1-x62c.google.com with SMTP id j22so1325766ejv.1
 for <qemu-devel@nongnu.org>; Thu, 06 Apr 2023 06:18:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1680787085; x=1683379085;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=MePkcZK9+0N5SFuUzJVo7UXokkGUia+UbDGQ1kTrS40=;
 b=Qv6oNEHuZ7S+MiwnfElvveJtfKV6cqO2nM8fGkdKQKF5f2u7ocw9gQmVJERXDN5fsX
 AX5AANG7lI5cqWBJvtgb29ncMjHHiqKEhxpx1i6znwpu9Hvidspp16u5PNpEbskZxooT
 frR7WRoSscnwvH5RBFu5KzInIrgyns46bmX4lf33baxnN1m7Dg2Mgm2x7qi+ocTCywH+
 48hhncr66sXrfMT+0L7NS4it4tHQFQLXpRmkU2dbkaLr36h+uu11t/JUNKuwl7W6R5ru
 p5r0fVfmkiWrgezxAQ/dl5jdehYOVDrBBCXrPFJwgpt6+eJFm+6Tq2thc104wfWPHl3o
 XC1Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1680787085; x=1683379085;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=MePkcZK9+0N5SFuUzJVo7UXokkGUia+UbDGQ1kTrS40=;
 b=GimjPllQfj5WL2iKgCtKlxrhEIm0qTH+/MKPlYRS3pumqSHdzNMpEChdsWAk7eKvlA
 gA/b+znEOMTPFmFPPc6LsdaYoF7OnmkaIsL6AmnLKVysSORKhCDIkco6qsOo5d3a/CUw
 +Qg2GxSLPtq/4Fl87KUgWOx6bc8pguFSOEwSChxAMiInpXFSSNkJu0yIj1UHFmeoq8sG
 sKdoV2xVI03lu2T4UaaIceRpGX9Hwd7V68+DwFnJ3IwiMlMTL68tDYQ0F5AOk++oHg1C
 p2P3WLkzeUvZ8d0lQ8tMfWqO3PcXbIXHdxuF1vkYYvBlYgelNiKe6PFCTd8Ig79lt3ky
 mdHQ==
X-Gm-Message-State: AAQBX9ewyAvXUo40feWpmFxQN2RkRJ76udJ1glX2Xkrq82MDw+uZTvI7
 YV6/DVO1SW2FCe4pjw6ydMnrpJYSHPZpR2uZvxhFEVZWDAMuSgCRyYQ=
X-Google-Smtp-Source: AKy350YhFx4tldmBbqI4H/XZzH7e61czZUBkEYH5F2F5jN7u8HBNHTNEnSQmTw6ei9F/LzEMGq+i0jH0fv6zBqWbDQY=
X-Received: by 2002:a17:906:1619:b0:878:4a24:1a5c with SMTP id
 m25-20020a170906161900b008784a241a5cmr3203211ejd.6.1680787084808; Thu, 06 Apr
 2023 06:18:04 -0700 (PDT)
MIME-Version: 1.0
References: <20230313114648.426607-1-marcandre.lureau@redhat.com>
 <20230313114648.426607-6-marcandre.lureau@redhat.com>
 <CAFEAcA9zNpzj_VU3ysWaa24tTqaBDcB9o1+0HhO0R7hhVOdgdA@mail.gmail.com>
In-Reply-To: <CAFEAcA9zNpzj_VU3ysWaa24tTqaBDcB9o1+0HhO0R7hhVOdgdA@mail.gmail.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 6 Apr 2023 14:17:54 +0100
Message-ID: <CAFEAcA9_GP8HqtYgG4mice_ACd8eqFLF6qrMYRz_5oe_HSM=-g@mail.gmail.com>
Subject: Re: [PULL v2 05/25] error: add global &error_warn destination
To: marcandre.lureau@redhat.com
Cc: qemu-devel@nongnu.org,
 =?UTF-8?Q?Daniel_P=2E_Berrang=C3=A9?= <berrange@redhat.com>, 
 Stefan Berger <stefanb@linux.vnet.ibm.com>,
 Markus Armbruster <armbru@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::62c;
 envelope-from=peter.maydell@linaro.org; helo=mail-ej1-x62c.google.com
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

On Thu, 6 Apr 2023 at 14:16, Peter Maydell <peter.maydell@linaro.org> wrote=
:
>
> On Mon, 13 Mar 2023 at 11:47, <marcandre.lureau@redhat.com> wrote:
> >
> > From: Marc-Andr=C3=A9 Lureau <marcandre.lureau@redhat.com>
> >
> > This can help debugging issues or develop, when error handling is
> > introduced.
> >
> > Signed-off-by: Marc-Andr=C3=A9 Lureau <marcandre.lureau@redhat.com>
> > Reviewed-by: Stefan Berger <stefanb@linux.ibm.com>
> > Message-Id: <20230221124802.4103554-6-marcandre.lureau@redhat.com>
>
> Hi; Coverity points out that this introduces a use-after-free
> (CID 1507493):

...and also CID 1508179 (same issue, just one warning about the
callsite in error_setv() and one about the callsite in
error_propagate()).

thanks
-- PMM

