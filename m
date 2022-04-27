Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1C2C35115AA
	for <lists+qemu-devel@lfdr.de>; Wed, 27 Apr 2022 13:33:20 +0200 (CEST)
Received: from localhost ([::1]:40274 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1njfv5-0000v5-6I
	for lists+qemu-devel@lfdr.de; Wed, 27 Apr 2022 07:33:19 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43976)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lsoaresp@redhat.com>)
 id 1njfso-0007Bv-J1
 for qemu-devel@nongnu.org; Wed, 27 Apr 2022 07:31:05 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:60704)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lsoaresp@redhat.com>)
 id 1njfsl-0001aY-3g
 for qemu-devel@nongnu.org; Wed, 27 Apr 2022 07:30:57 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1651059054;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=x/y1wx0fcStzyf9XU2BLKw/tAIK4B1AaU5rTVevDrY0=;
 b=cEUKXov7JbMoc4ZylcRjWaxSGb9FFjMtZSbRMeU4jr4AinPKVw7PijLCs410lqzExrskHw
 D8YB7hDNXTikqu31g7BcL+MeBL3hXgWo2W+SavvHw0P8+htv9rtolb1krLzS4wnLKBKu+0
 yoFpCj8LeSBwFC+yFXGVRh27Rd7IET8=
Received: from mail-lf1-f72.google.com (mail-lf1-f72.google.com
 [209.85.167.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-644-8xl1eeWWOvenJNdeVV3v_A-1; Wed, 27 Apr 2022 07:30:53 -0400
X-MC-Unique: 8xl1eeWWOvenJNdeVV3v_A-1
Received: by mail-lf1-f72.google.com with SMTP id
 bq38-20020a056512152600b0047214ad540dso625556lfb.13
 for <qemu-devel@nongnu.org>; Wed, 27 Apr 2022 04:30:52 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=x/y1wx0fcStzyf9XU2BLKw/tAIK4B1AaU5rTVevDrY0=;
 b=DuSB/9RPgmbRZFZNmCETdJDbWMC69R3Yt7/sXoc5Sv/qtiSUG5Pi47qXu9SPvAiAAX
 7tPgEocCIRPWsvdcBuWTURdELM9tLx6ZNRUeS2+5aKrAwvr6NOOEKUTN0eGO03vA6jmQ
 hNN6HsE8EKc9wWzH4/v3gm16plRbUvedz2r1uOl2UYa2FfeP+X+Z6EvetQ51CfzDji2X
 D4+n0gT206+dxcotjm9TPruXT18OuFdLF1Ib/PdyEHVW2AmEjAuBupHHr37OrEo9CTKf
 6zJttD8yHYxZ20psz2cUIu3yeH3W7PtD8QjL0dWnoCGWXlL5DgxMeoQfnpKsEneIx/Be
 ibqQ==
X-Gm-Message-State: AOAM532RpQ6RpIo159t734oxb2YrZ30p0qBho9fyELiuHPlJH1WmqCCp
 3LK8BF0NTQlb6acDHzqwg4GpTqPImb998aITqx3PsOp+APe2pGO4PgnntfdFqdQKy57RhJsWLyb
 sowWZ7M4DOsLOtB2ovkXVDyqmUzlTOIA=
X-Received: by 2002:a2e:7208:0:b0:24f:1821:6953 with SMTP id
 n8-20020a2e7208000000b0024f18216953mr6543401ljc.162.1651059051378; 
 Wed, 27 Apr 2022 04:30:51 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJw7gBUeZEhSSCugkHIa9peGVIX+xyE/66oAxzUbmKeZJbLHG2StF89lMir1pS94KPRy2sb9/k0D8LOm3mm+OWA=
X-Received: by 2002:a2e:7208:0:b0:24f:1821:6953 with SMTP id
 n8-20020a2e7208000000b0024f18216953mr6543377ljc.162.1651059051119; Wed, 27
 Apr 2022 04:30:51 -0700 (PDT)
MIME-Version: 1.0
References: <20220426230654.637939-1-leobras@redhat.com>
 <20220426230654.637939-7-leobras@redhat.com>
 <YmkCXwVA6PnwGHmH@redhat.com>
In-Reply-To: <YmkCXwVA6PnwGHmH@redhat.com>
From: Leonardo Bras Soares Passos <leobras@redhat.com>
Date: Wed, 27 Apr 2022 08:30:40 -0300
Message-ID: <CAJ6HWG4uft-ZXOsrANH55E0XPNZeJo7g=j_dADVd8u5-wsmQUQ@mail.gmail.com>
Subject: Re: [PATCH v10 6/7] multifd: Send header packet without flags if
 zero-copy-send is enabled
To: =?UTF-8?Q?Daniel_P=2E_Berrang=C3=A9?= <berrange@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=170.10.133.124; envelope-from=lsoaresp@redhat.com;
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
Cc: Elena Ufimtseva <elena.ufimtseva@oracle.com>,
 John G Johnson <john.g.johnson@oracle.com>,
 Jagannathan Raman <jag.raman@oracle.com>, qemu-block@nongnu.org,
 Juan Quintela <quintela@redhat.com>, qemu-devel <qemu-devel@nongnu.org>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>, Peter Xu <peterx@redhat.com>,
 Markus Armbruster <armbru@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?B?TWFyYy1BbmRyw6kgTHVyZWF1?= <marcandre.lureau@redhat.com>,
 Fam Zheng <fam@euphon.net>, Eric Blake <eblake@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Wed, Apr 27, 2022 at 5:44 AM Daniel P. Berrang=C3=A9 <berrange@redhat.co=
m> wrote:
>
> On Tue, Apr 26, 2022 at 08:06:55PM -0300, Leonardo Bras wrote:
> > Since d48c3a0445 ("multifd: Use a single writev on the send side"),
> > sending the header packet and the memory pages happens in the same
> > writev, which can potentially make the migration faster.
> >
> > Using channel-socket as example, this works well with the default copyi=
ng
> > mechanism of sendmsg(), but with zero-copy-send=3Dtrue, it will cause
> > the migration to often break.
> >
> > This happens because the header packet buffer gets reused quite often,
> > and there is a high chance that by the time the MSG_ZEROCOPY mechanism =
get
> > to send the buffer, it has already changed, sending the wrong data and
> > causing the migration to abort.
> >
> > It means that, as it is, the buffer for the header packet is not suitab=
le
> > for sending with MSG_ZEROCOPY.
> >
> > In order to enable zero copy for multifd, send the header packet on an
> > individual write(), without any flags, and the remanining pages with a
> > writev(), as it was happening before. This only changes how a migration
> > with zero-copy-send=3Dtrue works, not changing any current behavior for
> > migrations with zero-copy-send=3Dfalse.
> >
> > Signed-off-by: Leonardo Bras <leobras@redhat.com>
> > ---
> >  migration/multifd.c | 23 ++++++++++++++++++++---
> >  1 file changed, 20 insertions(+), 3 deletions(-)
>
> Reviewed-by: Daniel P. Berrang=C3=A9 <berrange@redhat.com>
>
>
> With regards,
> Daniel

Thanks for reviewing Daniel!

Best regards,
Leo

> --
> |: https://berrange.com      -o-    https://www.flickr.com/photos/dberran=
ge :|
> |: https://libvirt.org         -o-            https://fstop138.berrange.c=
om :|
> |: https://entangle-photo.org    -o-    https://www.instagram.com/dberran=
ge :|
>


