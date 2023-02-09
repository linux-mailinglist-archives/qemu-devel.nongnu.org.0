Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 52C0B68FE4B
	for <lists+qemu-devel@lfdr.de>; Thu,  9 Feb 2023 05:16:01 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pPyLN-0002dj-84; Wed, 08 Feb 2023 23:15:33 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <leobras@redhat.com>)
 id 1pPyLH-0002XQ-TY
 for qemu-devel@nongnu.org; Wed, 08 Feb 2023 23:15:27 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <leobras@redhat.com>)
 id 1pPyLF-0002qQ-Oy
 for qemu-devel@nongnu.org; Wed, 08 Feb 2023 23:15:27 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1675916124;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=dX8S+ZUZb3YLmb5HSu6nG6dLaiYQI1MtXZiJ8QEy+rE=;
 b=f58eo7JoH++DAOKIO4o9zeSnZxjphMzhdbXixlxbIycDt2Cs/vZetN/fx9SC38/2IJ38hf
 qqkWaxGcy1vUiCw9Nsh97oMW+J8Br74LELVCgpPQtYFX6/gYRxqE63TwPrqhQ6JWjpUDEJ
 ZVvJBCvKNgA6XfgBEfkPDp44MlplPQs=
Received: from mail-oa1-f70.google.com (mail-oa1-f70.google.com
 [209.85.160.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-81-Tk8hU96lOza--IDU-PZxfA-1; Wed, 08 Feb 2023 23:14:18 -0500
X-MC-Unique: Tk8hU96lOza--IDU-PZxfA-1
Received: by mail-oa1-f70.google.com with SMTP id
 586e51a60fabf-163da91d8edso442910fac.1
 for <qemu-devel@nongnu.org>; Wed, 08 Feb 2023 20:14:18 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=mime-version:user-agent:content-transfer-encoding:references
 :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
 :from:to:cc:subject:date:message-id:reply-to;
 bh=dX8S+ZUZb3YLmb5HSu6nG6dLaiYQI1MtXZiJ8QEy+rE=;
 b=tqJBcuUujIi5JYlRcRbxcmFYOgLoELPT7tIX1KoLasaGMfPYWANSQaOv0cUN2nDRVR
 K7KCCCcoWhyKBiBM5wq6MYLBBU5xgPQoDVtHPsTfk1ITqVVFwOXQwnP5Uxwyd0UN7U/e
 BPlAMbFJtCQSC5HhMt2Y8uoB86kwleSKNNIllFSYIXafug2KhdmjVPp3m+66gNrMpCYR
 FAme8X07zjD1QYTQdzUld9216q+A6aDsN+TkP49qZy94iMiowV8bAfienmllmpNW9GJS
 yDxSLDIpQzBirG17AK8bWcUVkDZiar4Y1cgyZdgOJkATj2tOs/bbYpl4rwZK8+Oi97tJ
 AmuQ==
X-Gm-Message-State: AO0yUKXxoUaDfpK6B5TBRPe/a2cxIpgnqEYoXLrDU4crfdBnq7tPl7QF
 KZgU8A9U+bGrtlzjlgJ9eKj5it+E9OmNtXiSA+3u+oePDMRzmnQ4E42Bx79Uu2GHeIpQCpoXkVA
 XDPQS7Zruw1uzmKo=
X-Received: by 2002:a05:6870:5607:b0:163:5760:240b with SMTP id
 m7-20020a056870560700b001635760240bmr5450608oao.36.1675916057673; 
 Wed, 08 Feb 2023 20:14:17 -0800 (PST)
X-Google-Smtp-Source: AK7set+MPaYtgP/wgaNVdr9GePklU1vehVdWp4om33SwbHIB8DSqB9X/A+cBXRqA9BxO9eJv3BDOGA==
X-Received: by 2002:a05:6870:5607:b0:163:5760:240b with SMTP id
 m7-20020a056870560700b001635760240bmr5450601oao.36.1675916057392; 
 Wed, 08 Feb 2023 20:14:17 -0800 (PST)
Received: from ?IPv6:2804:1b3:a800:9aa9:fdcb:7dec:9680:8417?
 ([2804:1b3:a800:9aa9:fdcb:7dec:9680:8417])
 by smtp.gmail.com with ESMTPSA id
 ec22-20020a0568708c1600b00143824af059sm206397oab.7.2023.02.08.20.14.15
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 08 Feb 2023 20:14:16 -0800 (PST)
Message-ID: <038b3c6d5f0ee3b3da5c9e53029a51b8b39d4922.camel@redhat.com>
Subject: Re: [PATCH v1 1/1] migration: Fix yank on postcopy multifd crashing
 guest after migration
From: Leonardo =?ISO-8859-1?Q?Br=E1s?= <leobras@redhat.com>
To: Peter Xu <peterx@redhat.com>
Cc: Juan Quintela <quintela@redhat.com>, "Dr. David Alan Gilbert"
 <dgilbert@redhat.com>, qemu-devel@nongnu.org, Li Xiaohui
 <xiaohli@redhat.com>
Date: Thu, 09 Feb 2023 01:14:12 -0300
In-Reply-To: <Y4ZwhZVDh9ac6MH8@x1n>
References: <20221109055629.789795-1-leobras@redhat.com> <Y3+WGof3MQtaCYdS@x1n>
 <CAJ6HWG4KaEbUYHe75i4ty66nosHEM8ZJW0c1W4Q=s4YeNnP_rA@mail.gmail.com>
 <Y4ZwhZVDh9ac6MH8@x1n>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.46.3 
MIME-Version: 1.0
Received-SPF: pass client-ip=170.10.129.124; envelope-from=leobras@redhat.com;
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

On Tue, 2022-11-29 at 15:50 -0500, Peter Xu wrote:
> On Tue, Nov 29, 2022 at 05:28:26PM -0300, Leonardo Bras Soares Passos wro=
te:
> > Hello Peter,
>=20
> Leo,
>=20
> >=20
> > On Thu, Nov 24, 2022 at 1:04 PM Peter Xu <peterx@redhat.com> wrote:
> > >=20
> > > On Wed, Nov 09, 2022 at 02:56:29AM -0300, Leonardo Bras wrote:
> > > > diff --git a/migration/savevm.c b/migration/savevm.c
> > > > index a0cdb714f7..250caff7f4 100644
> > > > --- a/migration/savevm.c
> > > > +++ b/migration/savevm.c
> > > > @@ -1889,6 +1889,8 @@ static void *postcopy_ram_listen_thread(void =
*opaque)
> > > >          exit(EXIT_FAILURE);
> > > >      }
> > > >=20
> > > > +    migration_load_cleanup();
> > >=20
> > > It's a bit weird to call multifd-load-clean in a listen phase..
> >=20
> > I agree.
> >=20
> > >=20
> > > How about moving it right above
> > > trace_process_incoming_migration_co_postcopy_end_main()?  Then the ne=
w
> > > helper can also be static.
> >=20
> > Seems a nice Idea to have this function to be static.
> >=20
> > We have to guarantee this is run after the migration finished, but
> > before migration_incoming_state_destroy().
>=20
> IIUC it doesn't need to be when migration finished.  It should be fine as
> long as we finished precopy phase, and that's what the migration coroutin=
e
> does, iiuc.  The thing is postcopy doesn't use multifd at all, so logical=
ly
> it can be released before postcopy starts.
>=20
> Actually, IMHO it'll be safer to do it like that, just to make sure we
> won't accidentally receive multifd pages _after_ postcopy starts, because
> that'll be another more severe and hard to debug issue since the guest ca=
n
> see partial copied pages from multifd recv channels.
>=20
> >=20
> > You suggested calling it right above of
> > trace_process_incoming_migration_co_postcopy_end_main(), which git
> > grep pointed me to an if clause in process_incoming_migration_co().
> > If I got the location correctly, it would not help: this coroutine is
> > ran just after the VM went to the target host, and not when the
> > migration finished.
> >=20
> > If we are using multifd channels, this will break the migration with
> > segmentation fault (SIGSEGV), since the channels have not finished
> > sending yet.
>=20
> If this happens, then I had a feeling that there's something else that
> needs syncs.  As I discussed above, we should make sure multifd pages all
> landed before we start vcpu threads.
>=20
> Said that, now I think I'm not against your original proposal to fix this
> immediate crash.  However I am still wondering whether we really should
> disable multifd with postcopy, as there seem to be still a few missing
> pieces even to enable multifd during precopy-only.
>=20
> Thanks,
>=20


I got side-tracked on this issue.

Is there any patch disabling multifd + postcopy, or would it be fine to go =
back
working on a V2 for this one?

Best regards,
Leo



