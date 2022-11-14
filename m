Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0F31B628EEA
	for <lists+qemu-devel@lfdr.de>; Tue, 15 Nov 2022 02:09:13 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1oujM9-0001OF-7L; Mon, 14 Nov 2022 18:59:13 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1oujM7-0001L2-2m
 for qemu-devel@nongnu.org; Mon, 14 Nov 2022 18:59:11 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1oujM5-0002ZG-EE
 for qemu-devel@nongnu.org; Mon, 14 Nov 2022 18:59:10 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1668470348;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=4l33kzX4bQAStMzzPZereX1E92GmG5pJK5tsAObpguk=;
 b=XC6UCtj3Fwzr+DJjOv2W5FkLVDsfUKodzo7Pq9Yyy+goF1kTnG/wcp5YlvqmC3b0Q6tX2g
 My9das3uJwlNHsgtSqzNyQqcYztbyKCtvwBRnPkU+X40tRtBU5eri2l2WkokePvIzmQjR4
 H4NNHXH6ig2DY1D8VfPITyt2CxwM4DU=
Received: from mail-lj1-f197.google.com (mail-lj1-f197.google.com
 [209.85.208.197]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-331-R8Jvd3viMHKjsObwdEknoA-1; Mon, 14 Nov 2022 18:59:07 -0500
X-MC-Unique: R8Jvd3viMHKjsObwdEknoA-1
Received: by mail-lj1-f197.google.com with SMTP id
 c15-20020a2ebf0f000000b0026e5ee94251so4575591ljr.10
 for <qemu-devel@nongnu.org>; Mon, 14 Nov 2022 15:59:06 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=4l33kzX4bQAStMzzPZereX1E92GmG5pJK5tsAObpguk=;
 b=Lgqq469gIhwqpRDS8+yM3GODgcCdnolsqyfrtVi2u/Y2n2i3AYWDw3W1LdN99Vtpr4
 SODY9d245LEQxMg64t0Gzv7VgxfsylXzSidJZ3SJs8N3sv87ieXUx7LDJ9S0hpQH1gkY
 cmrxmuvEiLaiNSqNVUEN1Rg/Ly0eVtC1rBgWAIiLWPVzwbevdZLaud5SsUIasA1TGrnp
 +5v2F35s72rAtTSNX6gic7FWXTZfN379vxq8kj3MgtE4amHqKdTyZ6m90nAMpfBZjlQ9
 bWUNyz1ZfyCxpIGDYCyy1+N8BGNjE2jKXHUmI0tGsfA53rF6G/HLvbjeTuTY+SwYAnlp
 qhAQ==
X-Gm-Message-State: ANoB5plaDt3CV1KDWbvArg0rJ4F26WvAIrf6pLrRekaAVgjUxR8SDFS9
 3jQLnPjrbnZzYHoTFDnjRnn+z9xKTjV+XQXdz69ZVezQ5sJ9//VDhwyboYzK1wjoknyU9oXzCCO
 7ag0jGZXsq71eeuxRinFV9F831MfBQYk=
X-Received: by 2002:a05:6512:3d8c:b0:4a7:5a63:71e1 with SMTP id
 k12-20020a0565123d8c00b004a75a6371e1mr5180187lfv.399.1668470345681; 
 Mon, 14 Nov 2022 15:59:05 -0800 (PST)
X-Google-Smtp-Source: AA0mqf4OlEZi1Wy4P4Kz2KI+4zV6Aj3xa4PN1AvattX5DIG87yKBEKVRmjFvc5oLnwi030bOepDvMw1vA7a76xldGDg=
X-Received: by 2002:a05:6512:3d8c:b0:4a7:5a63:71e1 with SMTP id
 k12-20020a0565123d8c00b004a75a6371e1mr5180173lfv.399.1668470345319; Mon, 14
 Nov 2022 15:59:05 -0800 (PST)
MIME-Version: 1.0
References: <20221111152744.261358-1-kwolf@redhat.com>
 <CAJSP0QVgzEAEdzrBd2Q3KsPBmCPTwzdO1dOb6KrY729esKLkZA@mail.gmail.com>
 <Y3Ie4aH6Da4qgWbU@redhat.com>
In-Reply-To: <Y3Ie4aH6Da4qgWbU@redhat.com>
From: John Snow <jsnow@redhat.com>
Date: Mon, 14 Nov 2022 18:58:53 -0500
Message-ID: <CAFn=p-YnmrM4X0sbYsVq=GY-7y8kwevqW=jxWV79twTx+sxmGw@mail.gmail.com>
Subject: Re: [PULL 00/11] Block layer patches
To: Kevin Wolf <kwolf@redhat.com>
Cc: Stefan Hajnoczi <stefanha@gmail.com>, Hanna Reitz <hreitz@redhat.com>,
 qemu-block@nongnu.org, stefanha@redhat.com, qemu-devel@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=170.10.129.124; envelope-from=jsnow@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
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

On Mon, Nov 14, 2022 at 5:56 AM Kevin Wolf <kwolf@redhat.com> wrote:
>
> Am 11.11.2022 um 20:20 hat Stefan Hajnoczi geschrieben:
> > > Hanna Reitz (9):
> > >       block/mirror: Do not wait for active writes
> > >       block/mirror: Drop mirror_wait_for_any_operation()
> > >       block/mirror: Fix NULL s->job in active writes
> > >       iotests/151: Test that active mirror progresses
> > >       iotests/151: Test active requests on mirror start
> > >       block: Make bdrv_child_get_parent_aio_context I/O
> > >       block-backend: Update ctx immediately after root
> > >       block: Start/end drain on correct AioContext
> > >       tests/stream-under-throttle: New test
> >
> > Hi Hanna,
> > This test is broken, probably due to the minimum Python version:
> > https://gitlab.com/qemu-project/qemu/-/jobs/3311521303
>
> This is exactly the problem I saw with running linters in a gating CI,
> but not during 'make check'. And of course, we're hitting it during the
> -rc phase now. :-(

I mean. I'd love to have it run in make check too. The alternative was
never seeing this *anywhere* ...

...but I'm sorry it's taken me so long to figure out how to get this
stuff to work in "make check" and also from manual iotests runs
without adding any kind of setup that you have to manage. It's just
fiddly, sorry :(

>
> But yes, it seems that asyncio.TimeoutError should be used instead of
> asyncio.exceptions.TimeoutError, and Python 3.6 has only the former.
> I'll fix this up and send a v2 if it fixes check-python-pipenv.

Hopefully this goes away when we drop 3.6. I want to, but I recall
there was some question about some platforms that don't support 3.7+
"by default" and how annoying that was or wasn't. We're almost a year
out from 3.6 being EOL, so maybe after this release it's worth a crack
to see how painful it is to move on.

>
> Kevin
>


