Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 60C523F1BAF
	for <lists+qemu-devel@lfdr.de>; Thu, 19 Aug 2021 16:36:04 +0200 (CEST)
Received: from localhost ([::1]:37604 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mGj9H-00073K-GR
	for lists+qemu-devel@lfdr.de; Thu, 19 Aug 2021 10:36:03 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57952)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1mGj8J-0005gn-Az
 for qemu-devel@nongnu.org; Thu, 19 Aug 2021 10:35:03 -0400
Received: from mail-ej1-x635.google.com ([2a00:1450:4864:20::635]:42847)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1mGj8H-0001LH-Eq
 for qemu-devel@nongnu.org; Thu, 19 Aug 2021 10:35:02 -0400
Received: by mail-ej1-x635.google.com with SMTP id b10so13341227eju.9
 for <qemu-devel@nongnu.org>; Thu, 19 Aug 2021 07:35:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=IvQN0Tc6cPwNo9BrXAMN1aSviUPuEZ3mh7l4K8hxG+0=;
 b=r9qOcyAhQqKt/HltAHz/alxcZvFZrpuo8egWxaRjUeVOgKeZje5dMEFg4fZpTbrYsk
 XOjYTGBaXSqFRb1eyvD5MD2soByLxoy36VwFqwDmwbyJbP2aARAwJIxBnWEqM/LJDT53
 RWOsPlLC395NzWzh3T8r3SvRGIm4RoUcmtUJxG/3yZi+VbYslyGLUeRdxBPHTm8Xr/kP
 3PYMNjFuZUUTAKiwSMnHDlWLGgkDPCmPtC13v2MsFr2yPtGP6sdJ4icF5qYlFmMyZ7zY
 /fkaMbqPU5BCsd1fqrxfZkQE0QsMkGhO7rAJdtA1LG6xI4czJoA/JuNnv9jXubicVqaE
 Ok6A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=IvQN0Tc6cPwNo9BrXAMN1aSviUPuEZ3mh7l4K8hxG+0=;
 b=nbe294aj0Pzy2OYTS+sHwelNYe4/h2g9PP3tQ1Dyh3LPTM4IX1p3u8pOGpkvj5MwkP
 PkKJjjbTgxxwTtIni/JkXDTCWcfJ71gMnC3EWb8a6OlYrO9bifn2eUeyiNEDPxEy7acX
 LgQ96r1EzYjkytWZJbUCe6sUV50yjfleHMU/wyA3cSVOpbfnJWRNdDIUquoHu5eWlZPg
 PpYWAGkRIlFjUEsYRulf+j/B2TqMWqB4bcfyQZQMz8fxoECsC+PDKqxOYx62Stoxiz8o
 cWLW/0DkzqokR4hVM4ehQgqyfhuGpjE7VPh3Blz5hGpWGda8kvh0Rp8no8mkHAytxZf9
 txAQ==
X-Gm-Message-State: AOAM5312j/nlsiCipHRMS386+aZDSUg3PfSfb/2hHZ/bQMht035NeRyU
 3uTiP4BVZHc3p2NjJiRMNmF9agr6xdbpAggZIRzIig==
X-Google-Smtp-Source: ABdhPJwjrJSZLKqK9PL76A7kxcfU7R1YwrTWM3zcAESHKUstHPrLRmLXhoUsqe8Qts6ACoUnhdJO7Fr2wN7eCDGttIE=
X-Received: by 2002:a17:906:584:: with SMTP id 4mr16508294ejn.56.1629383699124; 
 Thu, 19 Aug 2021 07:34:59 -0700 (PDT)
MIME-Version: 1.0
References: <20210819142039.2825366-1-philmd@redhat.com>
 <20210819142039.2825366-7-philmd@redhat.com>
In-Reply-To: <20210819142039.2825366-7-philmd@redhat.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 19 Aug 2021 15:34:12 +0100
Message-ID: <CAFEAcA_7t-9TpamdbAsyzYT7CFuQSjQt9YFj-1xG9fX_iMv5xA@mail.gmail.com>
Subject: Re: [RFC PATCH 6/6] memory: Have address_space_create() re-use global
 &address_space_memory
To: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::635;
 envelope-from=peter.maydell@linaro.org; helo=mail-ej1-x635.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: David Hildenbrand <david@redhat.com>,
 Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
 Alistair Francis <alistair@alistair23.me>,
 Jianxian Wen <jianxian.wen@verisilicon.com>,
 QEMU Developers <qemu-devel@nongnu.org>, Peter Xu <peterx@redhat.com>,
 qemu-arm <qemu-arm@nongnu.org>, Gerd Hoffmann <kraxel@redhat.com>,
 "Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
 Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Thu, 19 Aug 2021 at 15:21, Philippe Mathieu-Daud=C3=A9 <philmd@redhat.co=
m> wrote:
>
> We already have a global AddressSpace created along with the
> global get_system_memory(): address_space_memory. Return it
> directly instead of creating the same AS with a different name.
>

> diff --git a/softmmu/memory.c b/softmmu/memory.c
> index 16a2b518d8d..e4506b5a0d5 100644
> --- a/softmmu/memory.c
> +++ b/softmmu/memory.c
> @@ -2941,6 +2941,10 @@ AddressSpace *address_space_create(MemoryRegion *r=
oot, const char *name)
>  {
>      AddressSpace *as;
>
> +    if (root =3D=3D get_system_memory()) {
> +        return &address_space_memory;
> +    }

But most ASes aren't set up with address_space_create().
This doesn't do anything for the common case where the
AS is initialized with address_space_init().

This also seems to me to be the tail wagging the dog. If we think
'info mtree' has too much duplicate information (which it certainly
does) then we should make mtree_info() smarter about reducing that
duplication. Off the top of my head, we could change the code that
prints ASes to do something like:

   hashtable =3D an empty hashtable;
   QEMU_FOREACH(as, ...) {
       qemu_printf("address-space: %s\n", as->name);
       name =3D lookup as->root in hashtable;
       if (name) {
           qemu_printf("...same as address-space %s\n", name);
           continue;
       }
       add (as->root, as->name) to hashtable;
       mtree_print_mr(as->root...);
       qemu_printf("\n");
   }

thanks
-- PMM

