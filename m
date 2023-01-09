Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 58635663043
	for <lists+qemu-devel@lfdr.de>; Mon,  9 Jan 2023 20:25:31 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pExl6-0005gv-GX; Mon, 09 Jan 2023 14:24:36 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1pExl4-0005g1-1u
 for qemu-devel@nongnu.org; Mon, 09 Jan 2023 14:24:34 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1pExl2-0002C7-Bv
 for qemu-devel@nongnu.org; Mon, 09 Jan 2023 14:24:33 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1673292271;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=VT8OiOnwFB/ia5VFXGoLM0jFYxSiP7w5yEbp43Xdsqw=;
 b=Cc/IZK9pWHoRcu8b+dcVpsH/kl6HG0jAYOh8wUkHhxQ0gXJGl/3OBzxEmkRsRG4+ugsEFX
 oyfa3gGuStMH6eZorzfFo5pVfvL0Ts35prwZ13cRaL3wB3RRguXYoAjyHsNTmbdGIojyrf
 yymQmKO64mnf3amHP7XI8HtOTc796P8=
Received: from mail-lj1-f199.google.com (mail-lj1-f199.google.com
 [209.85.208.199]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-527-1tLKRgZeNPCiej02NhqCog-1; Mon, 09 Jan 2023 14:24:29 -0500
X-MC-Unique: 1tLKRgZeNPCiej02NhqCog-1
Received: by mail-lj1-f199.google.com with SMTP id
 y19-20020a05651c221300b00279958f353fso2217015ljq.1
 for <qemu-devel@nongnu.org>; Mon, 09 Jan 2023 11:24:29 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=VT8OiOnwFB/ia5VFXGoLM0jFYxSiP7w5yEbp43Xdsqw=;
 b=kjh/2c6tNaw8agiLpqmj9gdRsDh/TyUWNVbWDIZVY2O8HixBdHDQTsJeYtsYAoKtC8
 cFSWdj5eDxAmbMvK7oFduLX4aAZhaRbL8LfMwA3ZHysTFPCkErxWmlqpK1LonuRYko4p
 dpivwrIbVDyqF18tCELqYEIRZQp6+m/Ynptk8m2HEGGLhTSQD8ahGHVNjUxahLYHj6AU
 wfxIeO17EEqNlsZJ5oeBlnL2vniGnn2YKqQZwdSfxqf0RTm14w5HKVQiYV3DoCG0oBDs
 Mtmuf8IDmfjcEx8+utZBiLSD2RKiXLvHR5XRpmVMeYefthODn6MHHlc0UWmXGmdDH2lW
 Ka+A==
X-Gm-Message-State: AFqh2kqgi/5z53Uu3nsNyuGDnKPGOj0PRt8M24H33o31zU+W6IN85z6r
 pH9fj8lYaa3MUSStUnjfeEDD/ws8LPMvTaAnd8tbZ1POEEC8u2diix/TepyCJ9rTz9zANbWTBXv
 lbU8m44oWuDpMnFmQZBqgYfG8P8rbsw8=
X-Received: by 2002:a05:6512:208f:b0:4b5:7640:1a with SMTP id
 t15-20020a056512208f00b004b57640001amr2606276lfr.140.1673292268513; 
 Mon, 09 Jan 2023 11:24:28 -0800 (PST)
X-Google-Smtp-Source: AMrXdXv2+B4DSCKaUrllLhem2k3nelMRTbK9iZVjbSOMwsuCFd6n+53Yvd0AMTHuh5MkigFY/cuD5TqFU3BAtKh7VaI=
X-Received: by 2002:a05:6512:208f:b0:4b5:7640:1a with SMTP id
 t15-20020a056512208f00b004b57640001amr2606272lfr.140.1673292268281; Mon, 09
 Jan 2023 11:24:28 -0800 (PST)
MIME-Version: 1.0
References: <20220219080818.327683-1-liavalb@gmail.com>
 <A83604D0-B156-4C34-BAF2-29D13D341386@gmail.com>
In-Reply-To: <A83604D0-B156-4C34-BAF2-29D13D341386@gmail.com>
From: John Snow <jsnow@redhat.com>
Date: Mon, 9 Jan 2023 14:24:16 -0500
Message-ID: <CAFn=p-bzzTM2cyEM_uVpnutj=7D5NgKFb3=854rNQe_Qc4GTfA@mail.gmail.com>
Subject: Re: [PATCH 0/1] hw/ide: share bmdma read and write functions
To: Bernhard Beschow <shentey@gmail.com>
Cc: qemu-devel@nongnu.org, Liav Albani <liavalb@gmail.com>,
 qemu-block@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=170.10.129.124; envelope-from=jsnow@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
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

On Tue, Sep 6, 2022 at 10:27 AM Bernhard Beschow <shentey@gmail.com> wrote:
>
> Am 19. Februar 2022 08:08:17 UTC schrieb Liav Albani <liavalb@gmail.com>:
> >This is a preparation before I send v3 of ich6-ide controller emulation patch.
> >I figured that it's more trivial to split the changes this way, by extracting
> >the bmdma functions from via.c and piix.c and sharing them together. Then,
> >I could easily put these into use when I send v3 of the ich6-ide patch by just
> >using the already separated functions. This was suggested by BALATON Zoltan when
> >he submitted a code review on my ich6-ide controller emulation patch.
>
> Ping. Any news?

*cough*.

Has this been folded into subsequent series, or does this still need attention?

>
> >Liav Albani (1):
> >  hw/ide: share bmdma read and write functions between piix.c and via.c
> >
> > hw/ide/pci.c         | 47 ++++++++++++++++++++++++++++++++++++++++
> > hw/ide/piix.c        | 50 ++-----------------------------------------
> > hw/ide/via.c         | 51 ++------------------------------------------
> > include/hw/ide/pci.h |  4 ++++
> > 4 files changed, 55 insertions(+), 97 deletions(-)
> >
>


