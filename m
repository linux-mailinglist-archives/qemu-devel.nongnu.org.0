Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2AFA260B1FB
	for <lists+qemu-devel@lfdr.de>; Mon, 24 Oct 2022 18:41:55 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1omyQQ-0008OE-5W; Mon, 24 Oct 2022 10:27:34 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1omyQM-0008Nn-Sa
 for qemu-devel@nongnu.org; Mon, 24 Oct 2022 10:27:30 -0400
Received: from mail-pj1-x1030.google.com ([2607:f8b0:4864:20::1030])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1omyQL-0006Pa-9Z
 for qemu-devel@nongnu.org; Mon, 24 Oct 2022 10:27:30 -0400
Received: by mail-pj1-x1030.google.com with SMTP id
 v13-20020a17090a6b0d00b0021332e5388fso362854pjj.1
 for <qemu-devel@nongnu.org>; Mon, 24 Oct 2022 07:27:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=PTk0fWCUItVIHdURTLAtOf+2B0xgp6Gs199ICmXqWpE=;
 b=lQhXKzJMUSodGXtUtYhIXmqjD4iAI4L4cO/NiT5OK5Xx2NQojpbSLvJQcOvwWfgRWM
 5QdFNZRhaVEjx/WF/aXoejhurzljjup9oMkr0baNQ81uBT2iO56g1L8z0jqaSL17h4wO
 D8bHokf/jdi/LYeZCBQoWUZmFxegDQ5sIlyNQl+ftQGNtr9AzhsuUlOYxzr70itMH1rt
 6UEZT6BlN41emAzFrO5QKjHz8MNrnr4tmvwC2hbq79eTrC7rwXk/f9DTrYVnZMsH63SB
 VEjINTDnxS1hlPB/cNWXN3CEUVKRhVW3k3w/GV4Jf2ZpB4VStHVpiLlKUreQGK78m6WX
 laGw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=PTk0fWCUItVIHdURTLAtOf+2B0xgp6Gs199ICmXqWpE=;
 b=ukjZB4HJgOH+QrFd2PK4YJvZ+cv3z7JH8+dmDd53FnPtxXSbf8EnY3WVcZ+o+bfmYO
 tzcrKypnUmp3X+iithPJLiQddGdl3NoxBCuLo3oiSGtygelPM1PQkxkeUMKX9rS11PK7
 KhTv1iA+iFEfk+wl6874bLDBfSxB+laJlWRwWjXyigM0ZB28xBxAR+AhmQDdi/KuXUi+
 DuwNMyNivjmoDljzFTTcEedM+LdHPP/2XI6FT1mojAuSxl8gA2yjdXNKVAaBHnn+v4Ef
 ZMa0vY0enUHTG1gLinVxeu0KHVOekTHs0jXljicECuW6dRaMpgAvkeP1r9MdiRCkGnP0
 H20g==
X-Gm-Message-State: ACrzQf32bt2ap3Z8qFWttbMgNP2AAF0xA0c40FtNpd+jou7n5YpZH2C0
 3sJ5bIli5i1KLjA3ebdIkF/PYo8/qMijVkA1B8wQ/A==
X-Google-Smtp-Source: AMsMyM6wUm6dOI4pWMJ0eU2xD6Ex8iluw6lILjSDN7ckYsGMt8lTaK8dN7zoN0lYCKRiBOhkD7pEEs0jgjD0Nku22Ek=
X-Received: by 2002:a17:90b:4b81:b0:213:341d:3ea6 with SMTP id
 lr1-20020a17090b4b8100b00213341d3ea6mr758993pjb.19.1666621647705; Mon, 24 Oct
 2022 07:27:27 -0700 (PDT)
MIME-Version: 1.0
References: <20221014021653.1461512-1-Jason@zx2c4.com>
 <20221014021653.1461512-2-Jason@zx2c4.com>
 <CAFEAcA8jra50q_DvNTGG8Wi+eF+PEKPHnfLNBhUjG9muqiPe0A@mail.gmail.com>
 <87sfjdqubj.fsf@pond.sub.org>
 <CAFEAcA-TT_zRZQ076k6thP2ANk07EqMg8u7MP_6j24u2CCiEGA@mail.gmail.com>
 <8735bd8ikk.fsf@pond.sub.org>
In-Reply-To: <8735bd8ikk.fsf@pond.sub.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 24 Oct 2022 15:27:15 +0100
Message-ID: <CAFEAcA-xbu_nPFSg8K04nXgHGk3xm0HNRwGeGFgPNmoP3Ay_Fw@mail.gmail.com>
Subject: Re: [PATCH v3 1/8] reset: allow registering handlers that aren't
 called by snapshot loading
To: Markus Armbruster <armbru@redhat.com>
Cc: "Jason A. Donenfeld" <Jason@zx2c4.com>, pbonzini@redhat.com,
 qemu-devel@nongnu.org, richard.henderson@linaro.org
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::1030;
 envelope-from=peter.maydell@linaro.org; helo=mail-pj1-x1030.google.com
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
Sender: "Qemu-devel" <qemu-devel-bounces@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

On Mon, 24 Oct 2022 at 14:20, Markus Armbruster <armbru@redhat.com> wrote:
>
> Peter Maydell <peter.maydell@linaro.org> writes:
>
> > On Mon, 24 Oct 2022 at 13:28, Markus Armbruster <armbru@redhat.com> wrote:
> >>
> >> Peter Maydell <peter.maydell@linaro.org> writes:
> >> > Markus: if we add a new value to the ShutdownCause enumeration,
> >> > how annoying is it if we decide we don't want it later? I guess
> >> > we can just leave it in the enum unused... (In this case we're
> >> > using it for purely internal purposes and it won't ever actually
> >> > wind up in any QMP events.)
> >>
> >> Deleting enumeration values is a compatibility issue only if the value
> >> is usable in QMP input.
> >>
> >> "Purely internal" means it cannot occur in QMP output, and any attempt
> >> to use it in input fails.  Aside: feels a bit fragile.
> >
> > In this case there are as far as I can see no QMP input commands
> > which use the enum at all -- it's only used in events, which are
> > always output, I think.
>
> They are.
>
> Ascertaining "not used in QMP input" is pretty easy, and "not used in
> CLI" isn't hard.  My point is that uses could creep in later.  This is
> what makes "purely internal" fragile.

True. But otoh if there's a meaningful use of the enum constant in
input in future we'll want to keep it around anyway.

I guess what I'm asking is: do you specifically want this patch
done some other way, or to require that "mark some values as
internal-only" feature in the QAPI generator, or are you OK with
it as-is?  QMP/QAPI is your area, so your call...

-- PMM

