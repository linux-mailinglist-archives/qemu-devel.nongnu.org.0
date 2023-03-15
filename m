Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B1C0D6BC1A6
	for <lists+qemu-devel@lfdr.de>; Thu, 16 Mar 2023 00:42:58 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pcakB-0003bm-NJ; Wed, 15 Mar 2023 19:41:19 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1pcak5-0003bT-V2
 for qemu-devel@nongnu.org; Wed, 15 Mar 2023 19:41:14 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1pcak3-0003mK-PQ
 for qemu-devel@nongnu.org; Wed, 15 Mar 2023 19:41:13 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1678923669;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=u4ro2iFQxIOIZJYUh+4yiJVGUjsROSF7kc0zKFdqiKM=;
 b=GuBN9ETHdgI9dPzZq8AKsS2ThrIIdrChsMlzzEfmLLj6EvWSPfuasCd7R54bn2KuvyTDqP
 em/lhdzvBbUvUbH4MvLHldZcYT4oUL300eJLqa5/xGAlJfKk5/8JgeCD+wO0ZZml+M7LTV
 Y/B/6xx0eJh+LaJSTyaTdfguEq+K5g4=
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com
 [209.85.214.200]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-326-9L7ilF1eM--Tiel6H-UjSg-1; Wed, 15 Mar 2023 19:41:07 -0400
X-MC-Unique: 9L7ilF1eM--Tiel6H-UjSg-1
Received: by mail-pl1-f200.google.com with SMTP id
 a9-20020a170902b58900b0019e2eafafddso11139816pls.7
 for <qemu-devel@nongnu.org>; Wed, 15 Mar 2023 16:41:06 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1678923666;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=u4ro2iFQxIOIZJYUh+4yiJVGUjsROSF7kc0zKFdqiKM=;
 b=kHYtvXv/K+ETaNlHUzEjCUwl9Ceo6nu0Mv/Y1DxyYLrS7VqQGvbI2TzIEBnbDoGdK2
 8L38/66pKWUrb3avRWgluGaYfUCtG9GsaESuwYh0xDfxdCCzKpyvVFnNpg7D6YJvZdSp
 t9597jI/8LzZ7419sx10OZKQkVafQPjDi2tYQgjvsl3GpJp3F2cGUbax+PR0SAkDJ40Z
 J6ZRKJ51l2iL/4oHbI4+sZSynsmoBQT0GNXaZ9V0b72cVOV3HEoc3L54SAxIkrZwEF7x
 RQ6nvdL/gVR0KaCjObtJcX78U25yztkIXXxHiHghaUxPY+AX04xRdlaG7E6X96uG1cZ0
 oKNQ==
X-Gm-Message-State: AO0yUKX6sVbD0JhIQjulgt7mQbreohyDh2hV7rfM6qE1hL1YgftB81P2
 r1NWfCQmPo/EBt7UOH1Px0fwYG7mDvgWU2/JjFpXU8GCsuFzx/R9fu+9ao3RnrbfKfmVeUUzMgS
 z7gOCB4nVRdyvuAl2YxblW86JhN+VCaQ=
X-Received: by 2002:a17:90a:4f4d:b0:237:8c94:ada9 with SMTP id
 w13-20020a17090a4f4d00b002378c94ada9mr533133pjl.7.1678923665842; 
 Wed, 15 Mar 2023 16:41:05 -0700 (PDT)
X-Google-Smtp-Source: AK7set+njTkKfM2GL5ROExqf0dzhWwfaRxWtqBX+ht1rEzT8pGE1zYkkO9x8LMaEGPR3utgQCim8mWoQMLTAjKeEVJM=
X-Received: by 2002:a17:90a:4f4d:b0:237:8c94:ada9 with SMTP id
 w13-20020a17090a4f4d00b002378c94ada9mr533129pjl.7.1678923665546; Wed, 15 Mar
 2023 16:41:05 -0700 (PDT)
MIME-Version: 1.0
References: <20230313172535.2409370-1-quic_mliebel@quicinc.com>
 <c05ddbd3-8f26-5492-3961-7f3d564373d7@linaro.org>
 <ZBGo8WNlnRZUGYJZ@redhat.com>
 <36dae49c-34c9-0850-82ef-4a098b3e6d5d@linaro.org>
In-Reply-To: <36dae49c-34c9-0850-82ef-4a098b3e6d5d@linaro.org>
From: John Snow <jsnow@redhat.com>
Date: Wed, 15 Mar 2023 19:40:54 -0400
Message-ID: <CAFn=p-YH0Ak6nmFygvBHQA5CMcF0LrZMSNcwmKAgtWRm-Ydjng@mail.gmail.com>
Subject: Re: [PATCH] Use f-strings in python scripts
To: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@linaro.org>
Cc: =?UTF-8?Q?Daniel_P=2E_Berrang=C3=A9?= <berrange@redhat.com>, 
 Marco Liebel <quic_mliebel@quicinc.com>, qemu-devel@nongnu.org, 
 Taylor Simpson <tsimpson@quicinc.com>, Markus Armbruster <armbru@redhat.com>,
 Cleber Rosa <crosa@redhat.com>, 
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Beraldo Leal <bleal@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=170.10.133.124; envelope-from=jsnow@redhat.com;
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

On Wed, Mar 15, 2023 at 8:13=E2=80=AFAM Philippe Mathieu-Daud=C3=A9
<philmd@linaro.org> wrote:
>
> On 15/3/23 12:16, Daniel P. Berrang=C3=A9 wrote:
> > On Wed, Mar 15, 2023 at 08:43:33AM +0100, Philippe Mathieu-Daud=C3=A9 w=
rote:
> >> Hi Marco,
> >>
> >> (+Python experts)
> >>
> >> On 13/3/23 18:25, Marco Liebel wrote:
> >>> Replace python 2 format string with f-strings
> >>>
> >>> Signed-off-by: Marco Liebel <quic_mliebel@quicinc.com>
> >>> ---
> >>>    target/hexagon/gen_helper_funcs.py      |  54 ++--
> >>>    target/hexagon/gen_helper_protos.py     |  10 +-
> >>>    target/hexagon/gen_idef_parser_funcs.py |   8 +-
> >>>    target/hexagon/gen_op_attribs.py        |   4 +-
> >>>    target/hexagon/gen_op_regs.py           |  10 +-
> >>>    target/hexagon/gen_opcodes_def.py       |   2 +-
> >>>    target/hexagon/gen_printinsn.py         |  14 +-
> >>>    target/hexagon/gen_shortcode.py         |   2 +-
> >>>    target/hexagon/gen_tcg_func_table.py    |   2 +-
> >>>    target/hexagon/gen_tcg_funcs.py         | 317 +++++++++++---------=
----
> >>>    target/hexagon/hex_common.py            |   4 +-
> >>>    11 files changed, 198 insertions(+), 229 deletions(-)
> >>
> >> These files use a mix of ', " and '''... Since you are modifying
> >> them, it would be nice to unify. I'm not sure there is a recommended
> >> style; matter of taste, I find the single quote (') less aggressive,
> >> then escaping it using ", and keeping ''' for multi-lines strings.
> >

I pretty much agree with Dan, it's best to use a formatting tool and
just stick with it. We don't have a unified standard across the code
base right now, and it would be rude to make that a pre-requisite of a
patch like this.
Until then, docstrings should use triple-double quotes. Any other
string can use whatever quoting style happens to be most convenient
for the string being written to minimize escaping. Consistency is nice
where reasonable, but minimizing escapes by using different styles on
an as-needed basis is a respectable and good thing.

I glanced *very quickly* at these files and it looks like the style is
to use double quotes for format strings and single quotes for constant
strings. That seems fine to me.

> > FWIW, rather than debating code style issues and coming up with a custo=
m
> > set of rules for QEMU python code, my recommendation would be to consid=
er
> > adopting 'black'
> >
> >    https://black.readthedocs.io/en/stable/
> >
> > There is a trend with recent languages to offer an opinionated code
> > formatting tool as standard to maximise consistency across projects
> > in a given language. 'black' is a decent attempt to bring this to
> > the python world. I found it pretty liberating when doing recent
> > python work in libvirt, to be able to mostly not worry about formatting
> > anymore.
>
> Clever.
>
> So per 'black -t py37' the style is """, I was not even close.
>
> > The main downside is the bulk-reformat in the history, which can
> > make backports more challenging. For "git blame" you can use the
> > .git-blame-ignore-revs file to hide the reformats.
>
> TIL .git-blame-ignore-revs, thanks!
>

Huh, that's awesome.


