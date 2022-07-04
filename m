Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C5A09565E06
	for <lists+qemu-devel@lfdr.de>; Mon,  4 Jul 2022 21:32:51 +0200 (CEST)
Received: from localhost ([::1]:39320 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o8RoP-00065V-Rq
	for lists+qemu-devel@lfdr.de; Mon, 04 Jul 2022 15:32:49 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42546)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <afaria@redhat.com>) id 1o8RmV-00054a-Kd
 for qemu-devel@nongnu.org; Mon, 04 Jul 2022 15:30:51 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:24049)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <afaria@redhat.com>) id 1o8RmR-0005ZD-Ez
 for qemu-devel@nongnu.org; Mon, 04 Jul 2022 15:30:49 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1656963046;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Th51lLQYG8Lq+DPsHXujG6yaftnemySW+G89So5MIbU=;
 b=LqNgy3o32zqe3tDs/CtMHl+DKTo9TaWBfj++t5KkJNvg9yEILJ2Zs3L4M6ty+GqPG4tnuQ
 TxDAEiPIPm2tgF6uiJhljxLGCmWzC5OgF2jmzh1zG0qs6KT5MBcCbCpKgBD29jHajUrPIE
 3gaisJWGUGp1EKmLODL8khvdWtiPn8I=
Received: from mail-il1-f197.google.com (mail-il1-f197.google.com
 [209.85.166.197]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-216-AO76wmmFNMuZOKRFGU0G8A-1; Mon, 04 Jul 2022 15:30:45 -0400
X-MC-Unique: AO76wmmFNMuZOKRFGU0G8A-1
Received: by mail-il1-f197.google.com with SMTP id
 i2-20020a056e021b0200b002dadf6a0a0eso4560014ilv.12
 for <qemu-devel@nongnu.org>; Mon, 04 Jul 2022 12:30:45 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=Th51lLQYG8Lq+DPsHXujG6yaftnemySW+G89So5MIbU=;
 b=ojA5OokLg6VzgIENeiXBodHnGNQ7VC/3sPqNg58m0lJkAYDpotQtNXVgTb7JtiUdPa
 rJHDuOBDHFR+DSwR7ugtFv12feRet3IOfSyO5/ZzZ+r/OcV+pl4YsatezeH9EDjdHSOc
 oA3A0e38GPVx/O+kWv7H6wS9SB619TdBTRhkH4v87bFgD3BzScSOWDJhl6OPzpuzzqFx
 qp8OrAU7T2r2vaVvh2OhpefBCWFgDTQfJDXfTq4zk+EERzxtE5jJFi+0NYVZZoyJdSWK
 Uwqa5jVMuaBb5rIIX4QJmRreT9QLwEdx0yFL8k0l71KfvtLTQerA1a6kZlhodT0GC2yT
 d1cA==
X-Gm-Message-State: AJIora+P36Ksw7a/or84DxALw+7zgjSMp8CwXhDaPnf2kTfw99llvjGf
 kNVnzFNRDeUG+iEFgU50Pm8Jjsc7cPXfbSkfiCRtKkTJUqDjaL6qX0rPrEwR4BCQ3Aac46iIlcr
 6LHL/eSgxZjNGE+Hglm6+rFBzcATJaq0=
X-Received: by 2002:a05:6e02:1486:b0:2da:9864:b480 with SMTP id
 n6-20020a056e02148600b002da9864b480mr18702373ilk.70.1656963044857; 
 Mon, 04 Jul 2022 12:30:44 -0700 (PDT)
X-Google-Smtp-Source: AGRyM1v2SMI4fY6u7AvyGH8RU3z/uvi75hQQNH2TxKS4IJpt2Bb4vKxTTFAMdguK+4w5avZBb03Qz005KheGCvUk5vg=
X-Received: by 2002:a05:6e02:1486:b0:2da:9864:b480 with SMTP id
 n6-20020a056e02148600b002da9864b480mr18702355ilk.70.1656963044668; Mon, 04
 Jul 2022 12:30:44 -0700 (PDT)
MIME-Version: 1.0
References: <20220702113331.2003820-1-afaria@redhat.com>
 <YsMVJLqNYmmpqjGc@redhat.com>
In-Reply-To: <YsMVJLqNYmmpqjGc@redhat.com>
From: Alberto Faria <afaria@redhat.com>
Date: Mon, 4 Jul 2022 20:30:08 +0100
Message-ID: <CAELaAXymGtALk+ZeMqWJX0mvj1_2p4MbaS4A+eY8V51KDNOddg@mail.gmail.com>
Subject: Re: [RFC 0/8] Introduce an extensible static analyzer
To: =?UTF-8?Q?Daniel_P=2E_Berrang=C3=A9?= <berrange@redhat.com>
Cc: qemu-devel@nongnu.org, Paolo Bonzini <pbonzini@redhat.com>,
 qemu-block@nongnu.org, "Denis V. Lunev" <den@openvz.org>,
 Emanuele Giuseppe Esposito <eesposit@redhat.com>, 
 Stefan Hajnoczi <stefanha@redhat.com>,
 Ronnie Sahlberg <ronniesahlberg@gmail.com>, 
 Hanna Reitz <hreitz@redhat.com>, Stefano Garzarella <sgarzare@redhat.com>,
 Kevin Wolf <kwolf@redhat.com>, 
 Peter Xu <peterx@redhat.com>, Alberto Garcia <berto@igalia.com>,
 John Snow <jsnow@redhat.com>, 
 Eric Blake <eblake@redhat.com>, Fam Zheng <fam@euphon.net>, 
 Markus Armbruster <armbru@redhat.com>, 
 Vladimir Sementsov-Ogievskiy <vsementsov@yandex-team.ru>,
 Peter Lieven <pl@kamp.de>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=170.10.133.124; envelope-from=afaria@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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

On Mon, Jul 4, 2022 at 5:28 PM Daniel P. Berrang=C3=A9 <berrange@redhat.com=
> wrote:
> Have you done any measurement see how much of the overhead is from
> the checks you implemented, vs how much is inherantly forced on us
> by libclang ? ie what does it look like if you just load the libclang
> framework and run it actross all source files, without doing any
> checks in python.

Running the script with all checks disabled, i.e., doing nothing after
TranslationUnit.from_source():

    $ time ./static-analyzer.py build
    [...]
    Analyzed 8775 translation units in 274.0 seconds.

    real    4m34.537s
    user    49m32.555s
    sys     1m18.731s

    $ time ./static-analyzer.py build block util
    Analyzed 162 translation units in 4.2 seconds.

    real    0m4.804s
    user    0m40.389s
    sys     0m1.690s

This is still with 12 threads on a 12-hardware thread laptop, but
scalability is near perfect. (The time reported by the script doesn't
include loading and inspection of the compilation database.)

So, not great. What's more, TranslationUnit.from_source() delegates
all work to clang_parseTranslationUnit(), so I suspect C libclang
wouldn't do much better.

And with all checks enabled:

    $ time ./static-analyzer.py build block util
    [...]
    Analyzed 162 translation units in 86.4 seconds.

    real    1m26.999s
    user    14m51.163s
    sys     0m2.205s

Yikes. Also not great at all, although the current implementation does
many inefficient things, like redundant AST traversals. Cutting
through some of clang.cindex's abstractions should also help, e.g.,
using libclang's visitor API properly instead of calling
clang_visitChildren() for every get_children().

Perhaps we should set a target for how slow we can tolerate this thing
to be, as a percentage of total build time, and determine if the
libclang approach is viable. I'm thinking maybe 10%?

> If i run 'clang-tidy' across the entire source tree, it takes 3 minutes
> on my machine, but there's overhead of repeatedly starting the process
> in there.

Is that parallelized in some way? It seems strange that clang-tidy
would be so much faster than libclang.

> I think anything that actually fully parses the source files is going
> to have a decent sized unavoidable overhead, when run across the whole
> source tree.
>
> Still having a properly parsed abstract source tree is an inherantly
> useful thing. for certain types of static analysis check. Some things
> get unreliable real fast if you try to anlyse using regex matches and
> similar approaches that are the common alternative. So libclang is
> understandably appealing in this respect.
>
> > The script takes a path to the build directory, and any number of paths
> > to directories or files to analyze. Example run on a 12-thread laptop:
> >
> >     $ time ./static-analyzer.py build block
> >     block/commit.c:525:15: non-coroutine_fn function calls coroutine_fn
> >     block/nbd.c:206:5: non-coroutine_fn function calls coroutine_fn
> >     [...]
> >     block/ssh.c:1167:13: non-coroutine_fn function calls coroutine_fn
> >     block/nfs.c:229:27: non-coroutine_fn function calls coroutine_fn
> >     Analyzed 79 translation units.
> >
> >     real    0m45.277s
> >     user    7m55.496s
> >     sys     0m1.445s
>
> Ouch, that is incredibly slow :-(

Yup :-(

Alberto


