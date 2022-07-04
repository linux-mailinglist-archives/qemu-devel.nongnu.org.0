Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 95F72565D6E
	for <lists+qemu-devel@lfdr.de>; Mon,  4 Jul 2022 20:15:09 +0200 (CEST)
Received: from localhost ([::1]:44606 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o8QbE-00027J-9Y
	for lists+qemu-devel@lfdr.de; Mon, 04 Jul 2022 14:15:08 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57042)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <leobras@redhat.com>)
 id 1o8QZV-0001It-LO
 for qemu-devel@nongnu.org; Mon, 04 Jul 2022 14:13:21 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:32635)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <leobras@redhat.com>)
 id 1o8QZS-00033U-1o
 for qemu-devel@nongnu.org; Mon, 04 Jul 2022 14:13:19 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1656958395;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=qeXZCRi9DLmQN9752mlxLVFqVwqieiP5VVQSMcumU0c=;
 b=JWXYUxRW81zdTYCs+Bu6Y+HODxnLiGU0Y8yQmGK1AGxdgLHcb+QM5SLxNOwRUg8LwmAeQr
 p3JcfvMsjWtwReJQ6q3oTTNi7ASzwbOKh6RxTVbS5p3kzLs0a7+oz0+JpZ2E674AbLMy/X
 TBw/e9QZNBzPXgXPuq6z30vP3vXSlFQ=
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com
 [209.85.160.200]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-110-2SYkTf6XPU2Qlrkt_11xZA-1; Mon, 04 Jul 2022 14:13:14 -0400
X-MC-Unique: 2SYkTf6XPU2Qlrkt_11xZA-1
Received: by mail-qt1-f200.google.com with SMTP id
 n18-20020ac81e12000000b00318b16f53e0so7325127qtl.5
 for <qemu-devel@nongnu.org>; Mon, 04 Jul 2022 11:13:13 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
 :references:content-transfer-encoding:user-agent:mime-version;
 bh=qeXZCRi9DLmQN9752mlxLVFqVwqieiP5VVQSMcumU0c=;
 b=JBIlQ5tIYlYSirB2xz+CbdU/RT1zksRke3cit4inDstIHRfW525cmq56KSYxwr0pP2
 1LqaHqauwTBZ21JDrenERr5SVHQtZ1nHNRh8OK35FUYU8cL7e/53EIo49EWt/YDRURNL
 S8PFkS0FnIDN3Rm0Vi9o7/fs6vlj9vslIMH+4s26OGlGAsCXJHVNJKN7Ydh3cLeP/2tX
 WNoMN06e8ewXZViqhQT3PyRbqOxN5W592aY8WtE1eIytqUWE110CvpHo9quxKdj+9rfo
 AjyCrPPfHCDugwR1ifMZ1La+VfIrGiXSlCeiIcKUsH/YwFAwpfvBijMr0hG0H8AifLuT
 kUOg==
X-Gm-Message-State: AJIora8l6nH5Xb78/1Ta+apCxt5J5PSzy4Wwge7m0iK/BBn2eEhbzevI
 uTsE1waavcVEnQygXTzcD3YTC8CByYT/8iGM+RKwiZX/w2JbDpC3PUgH3/u6Vqev9D7W5vOUVGD
 74Bg5J2yl5FebTnk=
X-Received: by 2002:ac8:5fd0:0:b0:31d:32f0:5db7 with SMTP id
 k16-20020ac85fd0000000b0031d32f05db7mr18960303qta.113.1656958393610; 
 Mon, 04 Jul 2022 11:13:13 -0700 (PDT)
X-Google-Smtp-Source: AGRyM1tW80BbCawGdD+Fym3lHB/GDQ+prNzke298f2Ld8R+JcsxyoQ56jj5sev38eINHQ5rd22fmyQ==
X-Received: by 2002:ac8:5fd0:0:b0:31d:32f0:5db7 with SMTP id
 k16-20020ac85fd0000000b0031d32f05db7mr18960292qta.113.1656958393394; 
 Mon, 04 Jul 2022 11:13:13 -0700 (PDT)
Received: from ?IPv6:2804:431:c7ed:cb75:d392:178:9101:5763?
 ([2804:431:c7ed:cb75:d392:178:9101:5763])
 by smtp.gmail.com with ESMTPSA id
 r132-20020a37a88a000000b006af373cec2csm17010803qke.70.2022.07.04.11.13.10
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 04 Jul 2022 11:13:12 -0700 (PDT)
Message-ID: <97f75348557212d32bb38c20b6800208219e4aa8.camel@redhat.com>
Subject: Re: [PATCH v2 2/3] Add zero-copy-copied migration stat
From: Leonardo =?ISO-8859-1?Q?Br=E1s?= <leobras@redhat.com>
To: "Daniel P." =?ISO-8859-1?Q?Berrang=E9?= <berrange@redhat.com>, Markus
 Armbruster <armbru@redhat.com>, "Dr. David Alan Gilbert"
 <dgilbert@redhat.com>
Cc: Juan Quintela <quintela@redhat.com>, Eric Blake <eblake@redhat.com>, 
 Peter Xu <peterx@redhat.com>, qemu-devel@nongnu.org
Date: Mon, 04 Jul 2022 15:13:08 -0300
In-Reply-To: <YsLnrgIGu5y88ZTu@redhat.com>
References: <20220701155935.482503-1-leobras@redhat.com>
 <20220701155935.482503-3-leobras@redhat.com> <877d4tz9gx.fsf@pond.sub.org>
 <YsKtm2O8+d5d0p/N@redhat.com> <YsLRmYjFpdGw0AjK@work-vm>
 <87k08tw0bq.fsf@pond.sub.org> <YsLaEWcn51z3m52e@redhat.com>
 <87czelvxrt.fsf@pond.sub.org> <YsLnrgIGu5y88ZTu@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.44.2 
MIME-Version: 1.0
Received-SPF: pass client-ip=170.10.133.124; envelope-from=leobras@redhat.com;
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

Thanks Daniel, Markus and Dave for the feedback!

On Mon, 2022-07-04 at 14:14 +0100, Daniel P. Berrang=C3=A9 wrote:
> On Mon, Jul 04, 2022 at 02:59:50PM +0200, Markus Armbruster wrote:
> > Daniel P. Berrang=C3=A9 <berrange@redhat.com> writes:
> >=20
> > > On Mon, Jul 04, 2022 at 02:04:41PM +0200, Markus Armbruster wrote:
> >=20
[...]

>=20
> since 7.1, unless you're planning for really tortuous review :)
>=20

Ok, updated :)

> > [...]
> >=20
> > > > Please rephrase the documentation of @zero-copy-copied in terms of
> > > > @dirty-sync-count.=C2=A0 Here's my attempt.
> > > >=20
> > > > # @zero-copy-copied: Number of times dirty RAM synchronization coul=
d not
> > > > #=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 avoid copying zero pages.=
=C2=A0 This is between 0 and
> > > > #=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 @dirty-sync-count.=C2=A0 (=
since 7.1)

That's a great description! And it's almost 100% correct.

IIUC dirty-sync-count increments on migration_bitmap_sync() once after each=
 full
dirty-bitmap scan, and even with multifd syncing at the same point, it coul=
d
potentially have a increment per multifd channel.

The only change would be having:
# This is between 0 and @dirty-sync-count * @multifd-channel.


> > >=20
> > > Any one have preferences on the name - i get slight put off by the
> > > repeated word in the property name here.
> > >=20
> > > =C2=A0=C2=A0 @zero-copy-rejects ?
> > > =C2=A0=C2=A0 @zero-copy-misses ?
> > > =C2=A0=C2=A0 @zero-copy-fails ?
> >=20
> > I'd consider any of these an improvement.=C2=A0 Not a native speaker, b=
ut
> > perhaps "failures" instead of "fails".
> >=20
> > We could also express the connection to @dirty-sync-count right in the
> > name, like @dirty-sync-rejected-zero-copy, @dirty-sync-missed-zero-copy=
,
> > @dirty-sync-failed-zero-copy.=C2=A0 Or maybe -copies.
>=20
> Yeah, @dirty-sync-missed-zero-copy=C2=A0=C2=A0 is probably my favourite.

Ok then, this one there is :)

I will update my patchset with the suggestions, and I should publish a v3
shortly.=20

Best regards,
Leo

>=20
> With regards,
> Daniel



