Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1075C51BDC8
	for <lists+qemu-devel@lfdr.de>; Thu,  5 May 2022 13:12:25 +0200 (CEST)
Received: from localhost ([::1]:38648 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nmZPE-0001cx-6a
	for lists+qemu-devel@lfdr.de; Thu, 05 May 2022 07:12:24 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37374)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mlureau@redhat.com>)
 id 1nmZLV-0007P1-6n
 for qemu-devel@nongnu.org; Thu, 05 May 2022 07:08:33 -0400
Received: from us-smtp-delivery-74.mimecast.com ([170.10.133.74]:37275)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mlureau@redhat.com>)
 id 1nmZLR-0008US-T4
 for qemu-devel@nongnu.org; Thu, 05 May 2022 07:08:31 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1651748908;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=mARCJLgq4Gt3jN3KLUozondG9uC2HeF4VT4yjEtrCos=;
 b=R2HaldFgOWslRE4pMUuwSGbhTD6G9pjF9txRGMquVxd+UPyeje2MBQNTyzLz1AdHxtmAei
 TpeNJXS8TwtRAKHefWDlWkMdjir+Np/t4KjTrAWAm42RC1S4RVaf5Sg2fxBTZIDvW7EC8v
 hOrjkG1PbcsaaNWRuHCf0TwFk+NykuQ=
Received: from mail-yb1-f197.google.com (mail-yb1-f197.google.com
 [209.85.219.197]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-422-Mx0pUk0MM8Sh5yHRXLmTbQ-1; Thu, 05 May 2022 07:08:27 -0400
X-MC-Unique: Mx0pUk0MM8Sh5yHRXLmTbQ-1
Received: by mail-yb1-f197.google.com with SMTP id
 w133-20020a25c78b000000b0064847b10a22so3334316ybe.18
 for <qemu-devel@nongnu.org>; Thu, 05 May 2022 04:08:27 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=mARCJLgq4Gt3jN3KLUozondG9uC2HeF4VT4yjEtrCos=;
 b=ESkbfXAxSUjrkmO8gn+CEEcZfzfCuP2+J5PdFb0OB6IbrCTooXB9nlowqsGtL7SQyY
 ftFih5S4qZoxY5ieLBHMlX9kLJNyT8WToMKFPsoTBUT0EzHXJQvFGgZYeHg9cwsfi+bL
 u64GtkSM1iDvIEvZw+5od1vwE4pKOxfy/PD5hazLVwuq4KUnOjrYt26sFPUuVy0o7UUy
 W56H5YKZbBkHRZ6193amwJfJ1aqlCbRDYf1nN5gd5rxN0kKRqHHBB5HeKU6iF1IwyuyH
 CdlepSoPnt6x4tRhNpu+zy25WIXJMK3ZeYr0YAmsIx5r3HmVrdY1ZexTsCGnWR3yLccy
 V4mQ==
X-Gm-Message-State: AOAM531EU5UjjE25JYROCqPTrqUUaMlEQqJutmP62yTG0Ut3Ohy6HgG3
 80s2K3XYyKuAhvgXWddClEPPe/UaKHz1HjvP9XWSD3UMDQxXNcsyEzkP8ScU+zs6uLGtWtAlj7O
 v/y7EjpOq6Lk9LrxP/U2N2qNN/eQQyns=
X-Received: by 2002:a81:7b43:0:b0:2ec:8bb:3aef with SMTP id
 w64-20020a817b43000000b002ec08bb3aefmr23571877ywc.267.1651748906959; 
 Thu, 05 May 2022 04:08:26 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyiPBPgw4rh1czjR50O741uMj9ixlMgjOogB6fF8QtdNkNt83/rRx34zO+HGku9yr+pVyUoReH6CG9ksd9WJTI=
X-Received: by 2002:a81:7b43:0:b0:2ec:8bb:3aef with SMTP id
 w64-20020a817b43000000b002ec08bb3aefmr23571855ywc.267.1651748906770; Thu, 05
 May 2022 04:08:26 -0700 (PDT)
MIME-Version: 1.0
References: <20220505081431.934739-1-marcandre.lureau@redhat.com>
 <20220505081431.934739-4-marcandre.lureau@redhat.com>
 <875ymkxne4.fsf@pond.sub.org>
In-Reply-To: <875ymkxne4.fsf@pond.sub.org>
From: =?UTF-8?B?TWFyYy1BbmRyw6kgTHVyZWF1?= <marcandre.lureau@redhat.com>
Date: Thu, 5 May 2022 15:08:15 +0400
Message-ID: <CAMxuvayhwawMwxGk7Rc3=hsgn4q=kLATsFtbB3jAQbDKxCJoZA@mail.gmail.com>
Subject: Re: [PATCH v2 03/15] tests: make libqmp buildable for win32
To: Markus Armbruster <armbru@redhat.com>
Cc: qemu-devel <qemu-devel@nongnu.org>, Alexander Bulekov <alxndr@bu.edu>,
 Bandan Das <bsd@redhat.com>, 
 Thomas Huth <thuth@redhat.com>, Hanna Reitz <hreitz@redhat.com>, 
 Konstantin Kostiuk <kkostiuk@redhat.com>, Stefan Weil <sw@weilnetz.de>,
 Kevin Wolf <kwolf@redhat.com>, 
 Darren Kenny <darren.kenny@oracle.com>, Laurent Vivier <lvivier@redhat.com>, 
 Michael Roth <michael.roth@amd.com>, Paolo Bonzini <pbonzini@redhat.com>, 
 Qiuhao Li <Qiuhao.Li@outlook.com>, Stefan Hajnoczi <stefanha@redhat.com>, 
 qemu-block <qemu-block@nongnu.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=170.10.133.74; envelope-from=mlureau@redhat.com;
 helo=us-smtp-delivery-74.mimecast.com
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

Hi

On Thu, May 5, 2022 at 2:52 PM Markus Armbruster <armbru@redhat.com> wrote:
>
> marcandre.lureau@redhat.com writes:
>
> > From: Marc-Andr=C3=A9 Lureau <marcandre.lureau@redhat.com>
> >
> > Signed-off-by: Marc-Andr=C3=A9 Lureau <marcandre.lureau@redhat.com>
> > Reviewed-by: Thomas Huth <thuth@redhat.com>
> > ---
> >  tests/qtest/libqmp.h |  2 ++
> >  tests/qtest/libqmp.c | 35 +++++++++++++++++++++++++++++------
> >  2 files changed, 31 insertions(+), 6 deletions(-)
> >
> > diff --git a/tests/qtest/libqmp.h b/tests/qtest/libqmp.h
> > index 94aa97328a17..772f18b73ba3 100644
> > --- a/tests/qtest/libqmp.h
> > +++ b/tests/qtest/libqmp.h
> > @@ -20,8 +20,10 @@
> >  #include "qapi/qmp/qdict.h"
> >
> >  QDict *qmp_fd_receive(int fd);
> > +#ifndef G_OS_WIN32
>
> What's the difference between G_OS_WIN32 and _WIN32?
>
> We have 10 of the former, but >250 of the latter.  If they are
> effectively the same, we should pick one and stick to it.

There are some subtle differences when compiling for cygwin, in which
case G_OS_WIN32 is not defined.

I usually pick G_OS_{UNIX,WIN32} defines, mostly for consistency, but
in many situation _WIN32/WIN32 is fine.

(and we also have CONFIG_WIN32)


