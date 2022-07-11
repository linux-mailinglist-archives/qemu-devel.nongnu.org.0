Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 01093570CA8
	for <lists+qemu-devel@lfdr.de>; Mon, 11 Jul 2022 23:23:38 +0200 (CEST)
Received: from localhost ([::1]:48720 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oB0sT-00061t-57
	for lists+qemu-devel@lfdr.de; Mon, 11 Jul 2022 17:23:37 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44558)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1oB0qk-0004ZB-Fq
 for qemu-devel@nongnu.org; Mon, 11 Jul 2022 17:21:51 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:30984)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1oB0qY-00069Y-Sy
 for qemu-devel@nongnu.org; Mon, 11 Jul 2022 17:21:50 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1657574498;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=ml2iD9TeWmcWg/COeXkgOhjzvySuAf7q3/8MgyF8tss=;
 b=cQuMsOi6STotXS3uZLRttwSjjj/QToZ7+c3LO64J9bw5fmsa83cHQtFgDS4ttAihVEeH8M
 G5S/e5niDK3UMfg1AqhYyJmKgGIWtJ92ZCYPE4OMYQ9fJYGrYTdiHfFyDeawOJAHfO1unB
 Mgrjgr6yNL8v9HDuslKghK1ouvr3TeM=
Received: from mail-ua1-f71.google.com (mail-ua1-f71.google.com
 [209.85.222.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-324-0HOV1DuZMIqU986UyAqX7Q-1; Mon, 11 Jul 2022 17:21:31 -0400
X-MC-Unique: 0HOV1DuZMIqU986UyAqX7Q-1
Received: by mail-ua1-f71.google.com with SMTP id
 y38-20020ab048e9000000b00382bd73d02bso1293050uac.0
 for <qemu-devel@nongnu.org>; Mon, 11 Jul 2022 14:21:31 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=ml2iD9TeWmcWg/COeXkgOhjzvySuAf7q3/8MgyF8tss=;
 b=BapvbKwUz4lY3dt7+GEbV72PhzpxedZCr+jH0ohvvOJM+2HFY0HNA2h5x4VvEociyM
 ND/6SwxkEcZkFRWiw+0aWY5/EdJu55IvZ9/subxhFCUo3l9swC7I/DSdpNU0aLdygyYK
 3gLHj3RsV3/iuzVXLV2IMIYVqJ65iGJpkogY/Ba3MwbBkrSMuqy1LUZjhSjS8WpJBTNi
 GgmH9KweHa4KM6NekY14gBp0pc3o+VOha1OhoGpTtsE8bR9+1pKgX7XtoSj4IsDZcBL9
 ugm2x34s7ElqoHPlGEctD4P5+2NARTGfdOySxCz2mBER6DEVl9F6WSVdlD7DmFxTadxb
 VinQ==
X-Gm-Message-State: AJIora9B+aMRoC6Z3bohM9mw+otpkgwjtC2OewfKbpyS+J+DeSb+tp/+
 5GxGL99UmgSYFqIINwm5sZ3CTrIQPM13gGfKcDvjR6fk2o1l+5kLTjtO2fcFqbSOeAynEWf0j+r
 MmILJtc0/6+i+hlu4GvDvR6l9AqA5deE=
X-Received: by 2002:a67:f4d1:0:b0:357:2c70:79b1 with SMTP id
 s17-20020a67f4d1000000b003572c7079b1mr7877489vsn.11.1657574490898; 
 Mon, 11 Jul 2022 14:21:30 -0700 (PDT)
X-Google-Smtp-Source: AGRyM1vqZq5JtTRBtlt4fCHcf0YvK1dhC5U3kYYYSj3Ip6ot5cLY0LH2bbbwHdRvwAJBU0RU7IEV0uagn31LJlqiYuY=
X-Received: by 2002:a67:f4d1:0:b0:357:2c70:79b1 with SMTP id
 s17-20020a67f4d1000000b003572c7079b1mr7877474vsn.11.1657574490697; Mon, 11
 Jul 2022 14:21:30 -0700 (PDT)
MIME-Version: 1.0
References: <20220624195252.175249-1-vsementsov@yandex-team.ru>
 <CAFn=p-bzPUmF4YZ-461Tzr9MO_ReotL+wuot2egKW7jQgvaHOw@mail.gmail.com>
In-Reply-To: <CAFn=p-bzPUmF4YZ-461Tzr9MO_ReotL+wuot2egKW7jQgvaHOw@mail.gmail.com>
From: John Snow <jsnow@redhat.com>
Date: Mon, 11 Jul 2022 17:21:20 -0400
Message-ID: <CAFn=p-bwAXCJnWPj7JwSmN2N52hv7R0p1Fn2GxPpHPpDaDaDHQ@mail.gmail.com>
Subject: Re: [PATCH] python: QEMUMachine: enable qmp accept timeout by default
To: Vladimir Sementsov-Ogievskiy <vsementsov@yandex-team.ru>
Cc: Qemu-block <qemu-block@nongnu.org>, qemu-devel <qemu-devel@nongnu.org>, 
 Beraldo Leal <bleal@redhat.com>, Cleber Rosa <crosa@redhat.com>,
 Kevin Wolf <kwolf@redhat.com>, Hanna Reitz <hreitz@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=170.10.133.124; envelope-from=jsnow@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
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

On Mon, Jul 11, 2022 at 5:16 PM John Snow <jsnow@redhat.com> wrote:
>
> On Fri, Jun 24, 2022 at 3:53 PM Vladimir Sementsov-Ogievskiy
> <vsementsov@yandex-team.ru> wrote:
> >
> > I've spent much time trying to debug hanging pipeline in gitlab. I
> > started from and idea that I have problem in code in my series (which
> > has some timeouts). Finally I found that the problem is that I've used
> > QEMUMachine class directly to avoid qtest, and didn't add necessary
> > arguments. Qemu fails and we wait for qmp accept endlessly. In gitlab
> > it's just stopped by timeout (one hour) with no sign of what's going
> > wrong.
> >
> > With timeout enabled, gitlab don't wait for an hour and prints all
> > needed information.
> >
> > Signed-off-by: Vladimir Sementsov-Ogievskiy <vsementsov@yandex-team.ru>
> > ---
> >
> > Hi all!
> >
> > Just compare this
> >   https://gitlab.com/vsementsov/qemu/-/pipelines/572232557
> > and this
> >   https://gitlab.com/vsementsov/qemu/-/pipelines/572526252
> >
> > and you'll see that the latter is much better.
> >
> >  python/qemu/machine/machine.py | 2 +-
> >  1 file changed, 1 insertion(+), 1 deletion(-)
> >
> > diff --git a/python/qemu/machine/machine.py b/python/qemu/machine/machine.py
> > index 37191f433b..01a12f6f73 100644
> > --- a/python/qemu/machine/machine.py
> > +++ b/python/qemu/machine/machine.py
> > @@ -131,7 +131,7 @@ def __init__(self,
> >                   drain_console: bool = False,
> >                   console_log: Optional[str] = None,
> >                   log_dir: Optional[str] = None,
> > -                 qmp_timer: Optional[float] = None):
> > +                 qmp_timer: float = 30):
> >          '''
> >          Initialize a QEMUMachine
> >
> > --
> > 2.25.1
> >
>
> Oh, this is because machine.py uses the qmp_timer for *all* timeouts,
> and not just the QMP commands themselves, and this relates to the work
> Marc Andre is doing with regards to changing the launch mechanism to
> handle the race condition when the QEMU launch fails, but the QMP
> connection just sits waiting.
>
> I'm quite of the mind that it's really time to rewrite machine.py to
> use the native asyncio interfaces I've been writing to help manage
> this, but in the meantime I think this is probably a reasonable
> concession and a more useful default.
>
> ...I think. Willing to take it for now and re-investigate when the
> other fixes make it to the tree.
>
> Reviewed-by: John Snow <jsnow@redhat.com>

Oh, keep the type as Optional[float], though, so the timeout can be
disabled again, and keeps the type consistent with the qtest
derivative class. I've staged your patch with that change made, let me
know if that's not OK. Modified patch is on my python branch:

Thanks, merged.

--js


