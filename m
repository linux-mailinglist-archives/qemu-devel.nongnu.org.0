Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5EB1E50B3E9
	for <lists+qemu-devel@lfdr.de>; Fri, 22 Apr 2022 11:20:29 +0200 (CEST)
Received: from localhost ([::1]:58096 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nhpSm-0002vl-FP
	for lists+qemu-devel@lfdr.de; Fri, 22 Apr 2022 05:20:28 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47212)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mlureau@redhat.com>)
 id 1nhpIU-0001ah-G0
 for qemu-devel@nongnu.org; Fri, 22 Apr 2022 05:09:50 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:23631)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mlureau@redhat.com>)
 id 1nhpIO-0002UM-Jd
 for qemu-devel@nongnu.org; Fri, 22 Apr 2022 05:09:46 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1650618583;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=13SPqmWBIP1PmVmgwvss8c/fAPR8kTak8fSY1AZkjBo=;
 b=UyuYMY4ByTMkM09lsK1F1jAUDn1oa9NQqvAcDJa3325upk8tF68r16Q11GjDJVcu/wRIOc
 Kig5zw9msDnlFsCHfNr/mBupzNdU2uBqLTKZCuXTUyAm7mmMGlP9NbdfSP/9CAdcjctAcQ
 zgH3tkPuxlJ+Gmwgz5al5POjdSijcsM=
Received: from mail-yb1-f198.google.com (mail-yb1-f198.google.com
 [209.85.219.198]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-671-AmIdVQUdO4CNsON87Db73A-1; Fri, 22 Apr 2022 05:09:42 -0400
X-MC-Unique: AmIdVQUdO4CNsON87Db73A-1
Received: by mail-yb1-f198.google.com with SMTP id
 c6-20020a25a286000000b00645d8296217so331062ybi.9
 for <qemu-devel@nongnu.org>; Fri, 22 Apr 2022 02:09:41 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=13SPqmWBIP1PmVmgwvss8c/fAPR8kTak8fSY1AZkjBo=;
 b=5qTaodm6/Fl8n2hAVJ2Wu2/HyT02pKdOiXsk2i64WvybleSIU02LzpAyuupjQHfRHN
 PMUCIFVlyJgAxKOpyKFeCoXOK9aDnSADCP6wpeUs9RlH4lx5LKP0mzIzwcOKlJD7Xts8
 CSZQLDVhtnf1fX0EdV6ed1YGkKt31KtA6dl/HD4uoJLJupybS15R/mVkhZu3Fiw8xRcn
 Tk1Dq5T7TApLeXD1f5tOsvl6B7rCCC3x/jpWhm74Rv1XufNPNbb+U2fWchTr8KYRT6pc
 j9dgYMDV+B0gXtLc+E5xy+k+gMXLkuK/1W5PjaaVU2KrNNAyZ+WU0YuvG+cM8ZsXHqYn
 Wtyg==
X-Gm-Message-State: AOAM533cnfoLdwn55vyvQfbOPLEDabpJlOgtnxqEZw5znCLAh0d94CI2
 wWhDS937MD+NNv3L/6YhaTkNpz9JSBK4uSyWU9dF7iBD46gYbyPo/IIj9mwj5Cz85r1/ZcY2CHs
 PEFY8F73B2k/4M9I1Wq2cpuA0OAjaYzE=
X-Received: by 2002:a5b:312:0:b0:633:75de:5ab4 with SMTP id
 j18-20020a5b0312000000b0063375de5ab4mr3782569ybp.124.1650618581544; 
 Fri, 22 Apr 2022 02:09:41 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJy88V3hUUG9MXgqZTiNDga1K/MB03HDBd55UZPHnw88eT0tBmw4yjzLttDIq7mngwJPd7ga8e/+r/F7y4qNhqM=
X-Received: by 2002:a5b:312:0:b0:633:75de:5ab4 with SMTP id
 j18-20020a5b0312000000b0063375de5ab4mr3782550ybp.124.1650618581385; Fri, 22
 Apr 2022 02:09:41 -0700 (PDT)
MIME-Version: 1.0
References: <20220422083639.3156978-1-marcandre.lureau@redhat.com>
 <20220422083639.3156978-7-marcandre.lureau@redhat.com>
 <YmJujaGAGJLDtMzL@redhat.com>
In-Reply-To: <YmJujaGAGJLDtMzL@redhat.com>
From: =?UTF-8?B?TWFyYy1BbmRyw6kgTHVyZWF1?= <marcandre.lureau@redhat.com>
Date: Fri, 22 Apr 2022 13:09:30 +0400
Message-ID: <CAMxuvaxky51tqRr-9VTN5F0G8DrtyxVQpR9i0CEGUmSW4=p9Hw@mail.gmail.com>
Subject: Re: [PATCH 06/10] Replace qemu_pipe() with g_unix_open_pipe()
To: =?UTF-8?Q?Daniel_P=2E_Berrang=C3=A9?= <berrange@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=170.10.129.124; envelope-from=mlureau@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
Cc: Paolo Bonzini <pbonzini@redhat.com>,
 Vladimir Sementsov-Ogievskiy <v.sementsov-og@mail.ru>,
 Eric Blake <eblake@redhat.com>, qemu-devel <qemu-devel@nongnu.org>,
 "open list:Network Block Dev..." <qemu-block@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Hi

On Fri, Apr 22, 2022 at 1:00 PM Daniel P. Berrang=C3=A9 <berrange@redhat.co=
m> wrote:
>
> On Fri, Apr 22, 2022 at 12:36:35PM +0400, marcandre.lureau@redhat.com wro=
te:
> > From: Marc-Andr=C3=A9 Lureau <marcandre.lureau@redhat.com>
> >
> > GLib g_unix_open_pipe() is essentially like qemu_pipe(), available sinc=
e
> > 2.30.
> >
> > Signed-off-by: Marc-Andr=C3=A9 Lureau <marcandre.lureau@redhat.com>
> > ---
> >  include/qemu/osdep.h        |  4 ----
> >  qemu-nbd.c                  |  5 +++--
> >  util/event_notifier-posix.c |  2 +-
> >  util/oslib-posix.c          | 22 ----------------------
> >  4 files changed, 4 insertions(+), 29 deletions(-)
>
> There are a bunch of places still using 'pipe'instead of 'qemu_pipe'
> that should be switched also.
>

Ok, that would be a different patch though. Can you ack this one for now?

>
> With regards,
> Daniel
> --
> |: https://berrange.com      -o-    https://www.flickr.com/photos/dberran=
ge :|
> |: https://libvirt.org         -o-            https://fstop138.berrange.c=
om :|
> |: https://entangle-photo.org    -o-    https://www.instagram.com/dberran=
ge :|
>


