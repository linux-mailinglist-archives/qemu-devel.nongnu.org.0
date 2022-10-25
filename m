Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B85CE60C043
	for <lists+qemu-devel@lfdr.de>; Tue, 25 Oct 2022 02:58:00 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1on8FR-0007uu-Ei; Mon, 24 Oct 2022 20:56:53 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <SRS0=a4uw=22=zx2c4.com=Jason@kernel.org>)
 id 1on8FM-0007u6-OY
 for qemu-devel@nongnu.org; Mon, 24 Oct 2022 20:56:48 -0400
Received: from ams.source.kernel.org ([2604:1380:4601:e00::1])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <SRS0=a4uw=22=zx2c4.com=Jason@kernel.org>)
 id 1on8FK-0007Nm-IA
 for qemu-devel@nongnu.org; Mon, 24 Oct 2022 20:56:48 -0400
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id 67D71B810B2
 for <qemu-devel@nongnu.org>; Tue, 25 Oct 2022 00:56:44 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CA792C433C1
 for <qemu-devel@nongnu.org>; Tue, 25 Oct 2022 00:56:42 +0000 (UTC)
Authentication-Results: smtp.kernel.org;
 dkim=pass (1024-bit key) header.d=zx2c4.com header.i=@zx2c4.com
 header.b="B16NsPQ3"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=zx2c4.com; s=20210105; 
 t=1666659399;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=gpCqHnjAPsoHreUJpgSVFD2fD+Nh/VvQNZU4aLFHHmQ=;
 b=B16NsPQ34ooTNmH/2jJqHe8yt4TsjrRiyZVYWvKKRiH7e4iBN/INjNuv8V7sO2MaF/Wm32
 aLFzla80vAsW4KutDJ0EFbHqCjHpETVInXDNxsGMKsu09Pup8kNBM8R4Hxc9QSA/3Pgjt/
 viF0oadjZ5MepRziNfAfp3yv1yVDvEM=
Received: by mail.zx2c4.com (ZX2C4 Mail Server) with ESMTPSA id 42d127e4
 (TLSv1.3:TLS_AES_256_GCM_SHA384:256:NO) for <qemu-devel@nongnu.org>;
 Tue, 25 Oct 2022 00:56:39 +0000 (UTC)
Received: by mail-vs1-f54.google.com with SMTP id 128so9532548vsz.12
 for <qemu-devel@nongnu.org>; Mon, 24 Oct 2022 17:56:39 -0700 (PDT)
X-Gm-Message-State: ACrzQf3TctNSQoWKTHl1x2Le6DmbC+aGHoiRoZccIUZdQMZ8sWKAsv3v
 6x6Des9W0Ed4twAObnRztxTZA4hC4ZYNLBUnhhE=
X-Google-Smtp-Source: AMsMyM7KivtzRbWzZ9JA7657DKvtP/C5/Tqbspp4EVc1tj+/WfPms/+7Xysk846QIx6/E34UlJirnv0FKizRT5DfvNw=
X-Received: by 2002:a67:c290:0:b0:3aa:123a:6e31 with SMTP id
 k16-20020a67c290000000b003aa123a6e31mr6782835vsj.76.1666659398435; Mon, 24
 Oct 2022 17:56:38 -0700 (PDT)
MIME-Version: 1.0
References: <20221014021653.1461512-1-Jason@zx2c4.com>
 <20221014021653.1461512-2-Jason@zx2c4.com>
 <CAFEAcA8jra50q_DvNTGG8Wi+eF+PEKPHnfLNBhUjG9muqiPe0A@mail.gmail.com>
 <87sfjdqubj.fsf@pond.sub.org>
 <CAFEAcA-TT_zRZQ076k6thP2ANk07EqMg8u7MP_6j24u2CCiEGA@mail.gmail.com>
 <8735bd8ikk.fsf@pond.sub.org>
 <CAFEAcA-xbu_nPFSg8K04nXgHGk3xm0HNRwGeGFgPNmoP3Ay_Fw@mail.gmail.com>
 <871qqx6ryw.fsf@pond.sub.org>
In-Reply-To: <871qqx6ryw.fsf@pond.sub.org>
From: "Jason A. Donenfeld" <Jason@zx2c4.com>
Date: Tue, 25 Oct 2022 02:56:27 +0200
X-Gmail-Original-Message-ID: <CAHmME9oYgdoB5Sv6zFz4N=rHkKuv6ip5PK3qmBDm=VKhebEqUw@mail.gmail.com>
Message-ID: <CAHmME9oYgdoB5Sv6zFz4N=rHkKuv6ip5PK3qmBDm=VKhebEqUw@mail.gmail.com>
Subject: Re: [PATCH v3 1/8] reset: allow registering handlers that aren't
 called by snapshot loading
To: Markus Armbruster <armbru@redhat.com>
Cc: Peter Maydell <peter.maydell@linaro.org>, pbonzini@redhat.com,
 qemu-devel@nongnu.org, richard.henderson@linaro.org
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2604:1380:4601:e00::1;
 envelope-from=SRS0=a4uw=22=zx2c4.com=Jason@kernel.org;
 helo=ams.source.kernel.org
X-Spam_score_int: -67
X-Spam_score: -6.8
X-Spam_bar: ------
X-Spam_report: (-6.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, HEADER_FROM_DIFFERENT_DOMAINS=0.249,
 RCVD_IN_DNSWL_HI=-5, SPF_HELO_NONE=0.001,
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

On Mon, Oct 24, 2022 at 7:40 PM Markus Armbruster <armbru@redhat.com> wrote:
>
> Peter Maydell <peter.maydell@linaro.org> writes:
>
> > On Mon, 24 Oct 2022 at 14:20, Markus Armbruster <armbru@redhat.com> wrote:
> >>
> >> Peter Maydell <peter.maydell@linaro.org> writes:
> >>
> >> > On Mon, 24 Oct 2022 at 13:28, Markus Armbruster <armbru@redhat.com> wrote:
> >> >>
> >> >> Peter Maydell <peter.maydell@linaro.org> writes:
> >> >> > Markus: if we add a new value to the ShutdownCause enumeration,
> >> >> > how annoying is it if we decide we don't want it later? I guess
> >> >> > we can just leave it in the enum unused... (In this case we're
> >> >> > using it for purely internal purposes and it won't ever actually
> >> >> > wind up in any QMP events.)
> >> >>
> >> >> Deleting enumeration values is a compatibility issue only if the value
> >> >> is usable in QMP input.
> >> >>
> >> >> "Purely internal" means it cannot occur in QMP output, and any attempt
> >> >> to use it in input fails.  Aside: feels a bit fragile.
> >> >
> >> > In this case there are as far as I can see no QMP input commands
> >> > which use the enum at all -- it's only used in events, which are
> >> > always output, I think.
> >>
> >> They are.
> >>
> >> Ascertaining "not used in QMP input" is pretty easy, and "not used in
> >> CLI" isn't hard.  My point is that uses could creep in later.  This is
> >> what makes "purely internal" fragile.
> >
> > True. But otoh if there's a meaningful use of the enum constant in
> > input in future we'll want to keep it around anyway.
> >
> > I guess what I'm asking is: do you specifically want this patch
> > done some other way, or to require that "mark some values as
> > internal-only" feature in the QAPI generator, or are you OK with
> > it as-is?  QMP/QAPI is your area, so your call...
>
> QAPI was designed to specify QMP.  We pretty soon discovered that QAPI
> types can be useful elsewhere, and added some to the schema without
> marking them.  Introspection doesn't show these.  Generated
> documentation does.  Known shortcoming of the doc generator.
>
> This case differs in that we're adding an internal-only member to a type
> that is used by QMP.  Both introspection and documentation will show it.
>
> Interface introspection and (especially!) documentation showing stuff
> that doesn't exist in the interface is certainly less than ideal.
> However, I don't want to hold this patch hostage to getting QAPI
> shortcomings addressed.
>
> Instead, I want QMP documentation to make clear that this value cannot
> actually occur.
>
> Fair?

Made mention of it in v4, just posted.

https://lore.kernel.org/all/20221025004327.568476-2-Jason@zx2c4.com/#Z31qapi:run-state.json

