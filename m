Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 753D554E2BC
	for <lists+qemu-devel@lfdr.de>; Thu, 16 Jun 2022 15:59:49 +0200 (CEST)
Received: from localhost ([::1]:37024 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o1q2G-0003Y2-Jc
	for lists+qemu-devel@lfdr.de; Thu, 16 Jun 2022 09:59:48 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:52340)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mlureau@redhat.com>)
 id 1o1pQc-0008SR-TR
 for qemu-devel@nongnu.org; Thu, 16 Jun 2022 09:20:56 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:31842)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mlureau@redhat.com>)
 id 1o1pQX-00080u-Bs
 for qemu-devel@nongnu.org; Thu, 16 Jun 2022 09:20:54 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1655385648;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=mShNVimvuzEtrB2ElqwuxIkpfubj4bh80jkmM7CXwW4=;
 b=EGxjMOmWxGgVuiTPKBCPqD5zDxAsaeZ1xvpr7gDexd64hv1YyJK1WXgBemKT/6EA5DC1MO
 j/I8rpFqzp7rZRLSgmhhqRI8Uu08NE6DPRNSQgu3kg5eAEww/atG+HL+VbIQdGcI4YbX4D
 RsFtLcGkhORrjMJ8YXcB61sj0AS/rho=
Received: from mail-ot1-f72.google.com (mail-ot1-f72.google.com
 [209.85.210.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-247-GexApzujMiqN9QuG3_pFig-1; Thu, 16 Jun 2022 09:20:45 -0400
X-MC-Unique: GexApzujMiqN9QuG3_pFig-1
Received: by mail-ot1-f72.google.com with SMTP id
 n18-20020a9d7112000000b0060bdd3bad6fso726324otj.12
 for <qemu-devel@nongnu.org>; Thu, 16 Jun 2022 06:20:45 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=mShNVimvuzEtrB2ElqwuxIkpfubj4bh80jkmM7CXwW4=;
 b=ni3hYSdmUAMEqeBUhgplcAAfA7kwtIdCnf9mueHB2OuyBcWpEP8H7174NrZthSxUxZ
 1byVZ1uoPPrqlSAekPT6TCQbYHzdTk9H6wMbmf/RkAQh9AtqTs3fytz0cUEAXJkinAi/
 zcJtjdD+G2U1mtbvuxw4lx3XyKcTELrHjEjYnCxdcOkgbOOVw6v2NlBJ7aKDJTeSvoQg
 hQy2Eq3UhypLAHtAkYeecn1LJtWZIsPNKGKSOKj3JlFc4F/4pdMGI8HOfsLCjd6BTHnY
 nYUn+dz/c6iaZeuW6mT4sl4iK1MvKEZiJxW9t2Mis/zArEGtBqI3EVYVFghAWwGvVCnE
 6ukg==
X-Gm-Message-State: AJIora9vXO32wN4Nds3hZEApM0KPc59thdxwMkc/ZSHIvDO5nCnXXnd0
 qG9WlZEON57J8I3yqgwBgtRD4w7YAlkfGtXtJ5Cl5Qg7mEdfOnUoeqxtxCsX9MyhIG3ooDkJm1l
 CouvfJtS7E+MkAU9bFGRvHgELTRiEbos=
X-Received: by 2002:a05:6808:3021:b0:2f7:4c5b:2783 with SMTP id
 ay33-20020a056808302100b002f74c5b2783mr2484908oib.53.1655385644455; 
 Thu, 16 Jun 2022 06:20:44 -0700 (PDT)
X-Google-Smtp-Source: AGRyM1vK0ZPVEMOWh8rsgj0yjYELhjU03njByGWEin/LNEcs56JMsmwefEuysRMaqMTIAOyXNHvt2L9qYlrmhAVRg5o=
X-Received: by 2002:a05:6808:3021:b0:2f7:4c5b:2783 with SMTP id
 ay33-20020a056808302100b002f74c5b2783mr2484893oib.53.1655385644236; Thu, 16
 Jun 2022 06:20:44 -0700 (PDT)
MIME-Version: 1.0
References: <20220616124034.3381391-1-marcandre.lureau@redhat.com>
 <ef5aeba2-6f86-89ae-bee9-de16d267f226@redhat.com>
In-Reply-To: <ef5aeba2-6f86-89ae-bee9-de16d267f226@redhat.com>
From: =?UTF-8?B?TWFyYy1BbmRyw6kgTHVyZWF1?= <marcandre.lureau@redhat.com>
Date: Thu, 16 Jun 2022 17:20:33 +0400
Message-ID: <CAMxuvay93P5HdW57a00dBVy0B+POkuxqiYGWLYNeSCaMx86=tw@mail.gmail.com>
Subject: Re: [PATCH 0/9] Preliminary patches for subproject split
To: Paolo Bonzini <pbonzini@redhat.com>
Cc: qemu-devel <qemu-devel@nongnu.org>, Markus Armbruster <armbru@redhat.com>, 
 Michael Roth <michael.roth@amd.com>, Kevin Wolf <kwolf@redhat.com>, 
 Laurent Vivier <laurent@vivier.eu>, Warner Losh <imp@bsdimp.com>,
 Kyle Evans <kevans@freebsd.org>, Hanna Reitz <hreitz@redhat.com>, 
 Vladimir Sementsov-Ogievskiy <vsementsov@yandex-team.ru>,
 Fam Zheng <fam@euphon.net>, 
 Eric Blake <eblake@redhat.com>, "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 qemu-block <qemu-block@nongnu.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=170.10.129.124; envelope-from=mlureau@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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

Hi

On Thu, Jun 16, 2022 at 5:12 PM Paolo Bonzini <pbonzini@redhat.com> wrote:
>
> On 6/16/22 14:40, marcandre.lureau@redhat.com wrote:
> > From: Marc-Andr=C3=A9 Lureau <marcandre.lureau@redhat.com>
> >
> > Hi,
> >
> > Here is another subset of the large "subproject(qga)"" series I intend =
to send
> > soon after (https://gitlab.com/marcandre.lureau/qemu/-/commits/qga).
>
> Hi,
>
> I took a peek there and I have a question.  While the configure script
> has had enough of a diet that it should be possible to compile the
> subprojects as standalone with relatively little effort, how do you plan
> to handle things such as compiler flags that are detected by meson.build
> (especially enabling/disabling warnings)?
>

If you run top-level qemu configure, then I think flags should be
shared with add_global_arguments() (to be verified).

qemu-ga (and qemu-common) in the branch do compile standalone. There
are still small quirks to fix the CI though with the last patches.
Also the last patch could probably deserve a little bit more splitting
(for ex, switching from QEMU_FULL_VERSION to VCS_TAG etc), that branch
is still WIP (after 2 months!).


> Paolo
>
> > Thanks
> >
> > Marc-Andr=C3=A9 Lureau (9):
> >    monitor: make error_vprintf_unless_qmp() static
> >    error-report: misc comment fix
> >    error-report: introduce "detailed" variable
> >    error-report: simplify print_loc()
> >    error-report: introduce ErrorReportDetailedFunc
> >    error-report: add a callback to overwrite error_vprintf
> >    qapi: move QEMU-specific dispatch code in monitor
> >    scripts/qapi-gen: add -i option
> >    scripts/qapi: add required system includes to visitor
> >
> >   include/monitor/monitor.h            |  2 +-
> >   include/qapi/qmp/dispatch.h          |  7 ++-
> >   include/qemu/error-report.h          |  8 +++-
> >   bsd-user/main.c                      |  2 +-
> >   linux-user/main.c                    |  2 +-
> >   monitor/monitor.c                    |  5 +-
> >   monitor/qmp.c                        | 68 +++++++++++++++++++++++++++=
-
> >   qapi/qmp-dispatch.c                  | 64 ++------------------------
> >   qemu-img.c                           |  2 +-
> >   qemu-io.c                            |  2 +-
> >   qemu-nbd.c                           |  2 +-
> >   qga/main.c                           |  2 +-
> >   scsi/qemu-pr-helper.c                |  2 +-
> >   softmmu/vl.c                         |  7 ++-
> >   storage-daemon/qemu-storage-daemon.c |  7 ++-
> >   stubs/error-printf.c                 | 23 ----------
> >   tests/unit/test-qmp-cmds.c           |  6 +--
> >   util/error-report.c                  | 46 ++++++++++++++-----
> >   scripts/qapi/commands.py             | 15 ++++--
> >   scripts/qapi/events.py               | 17 ++++---
> >   scripts/qapi/gen.py                  | 17 +++++++
> >   scripts/qapi/introspect.py           | 11 +++--
> >   scripts/qapi/main.py                 | 17 ++++---
> >   scripts/qapi/types.py                | 17 ++++---
> >   scripts/qapi/visit.py                | 21 ++++++---
> >   stubs/meson.build                    |  1 -
> >   26 files changed, 226 insertions(+), 147 deletions(-)
> >   delete mode 100644 stubs/error-printf.c
> >
>


