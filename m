Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 14E27586641
	for <lists+qemu-devel@lfdr.de>; Mon,  1 Aug 2022 10:20:53 +0200 (CEST)
Received: from localhost ([::1]:59254 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oIQfT-0007Kz-QZ
	for lists+qemu-devel@lfdr.de; Mon, 01 Aug 2022 04:20:51 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54266)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <abologna@redhat.com>)
 id 1oIQY9-0001PN-Oq
 for qemu-devel@nongnu.org; Mon, 01 Aug 2022 04:13:17 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:58829)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <abologna@redhat.com>)
 id 1oIQY0-0006j0-3i
 for qemu-devel@nongnu.org; Mon, 01 Aug 2022 04:13:11 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1659341587;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=sqjdrzLZMYqeHxSrKXneKZK9szUruPWpHjIBlxJdB7w=;
 b=EkanV0CG2lYJD/rOw1xe5SPe6f3a5i8ioQgWd3beNjlo6zBUCQhhVUEbpNcy6EG07Tpoqt
 zmHg8BMl3cJhiH/KYqXumTnMMlrNDOvpHGSHWq4YSfKf7ptnIlgWEQ/7PyQ9Gqhnb+Fqgl
 ZsaqeaTl5CaxLKKIxJmm/PlQ4SXYkX8=
Received: from mail-yw1-f198.google.com (mail-yw1-f198.google.com
 [209.85.128.198]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-56-zsUTdZLoOnG_pi9Og9iwww-1; Mon, 01 Aug 2022 04:13:04 -0400
X-MC-Unique: zsUTdZLoOnG_pi9Og9iwww-1
Received: by mail-yw1-f198.google.com with SMTP id
 00721157ae682-324f98aed9eso13496797b3.16
 for <qemu-devel@nongnu.org>; Mon, 01 Aug 2022 01:13:04 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:cc:to:subject:message-id:date:in-reply-to
 :mime-version:references:from:x-gm-message-state:from:to:cc;
 bh=sqjdrzLZMYqeHxSrKXneKZK9szUruPWpHjIBlxJdB7w=;
 b=4itbdm0153LuK0r4nAVBne75P1h0L0eQewJygSG0eKiQtT8z6AdAcapnafL0QVlxS0
 mxcSlat3QImOqcncXNsCwndOs3dTA5fSqfO3YebvteDsEZ4ydakHflru52qCT2HySjAv
 LKFEbDvAx+Lva304FHbwTsU+PpngwlKs8AFAdZ+4npGzXsMTFDSi2T1u+Mt9ZOsWxit3
 7FJom6LGxLGWRea38ziFniQjuFI8ZQuIAQfshMJBtMaNvzqn/pfXsprcWBpj9oNUBHJF
 Bl0niEcHO1+04pzMbxarJzUsX0fh1BECzWr2b5+aCAjpZN7sYOstqCenXfYo+kQ6neme
 /low==
X-Gm-Message-State: ACgBeo05z6wek5i4bm0MZJgsjzcyfZGECaVQB+NoO255SKkWBH+L5IOH
 Cop5ThvF+bhFilRJrjqhFx+QFQXmK8zgAXQjplsYDqxqu8HmBsenIHCHfG5bsjJ2rgb4kBnagjR
 hwtfzLyK6aZo3FID8fvqQqDL6OsoAWvc=
X-Received: by 2002:a81:5a41:0:b0:31e:575c:a521 with SMTP id
 o62-20020a815a41000000b0031e575ca521mr12224775ywb.72.1659341583934; 
 Mon, 01 Aug 2022 01:13:03 -0700 (PDT)
X-Google-Smtp-Source: AA6agR5TAwMi6XxYRGRScf/kw6diqGlewM70G7fCBptuPvpgse5nzHmQEjgPIrNLdhzhF8wHxylG4INFuwwQj/JYI1E=
X-Received: by 2002:a81:5a41:0:b0:31e:575c:a521 with SMTP id
 o62-20020a815a41000000b0031e575ca521mr12224769ywb.72.1659341583682; Mon, 01
 Aug 2022 01:13:03 -0700 (PDT)
Received: from 744723338238 named unknown by gmailapi.google.com with
 HTTPREST; Mon, 1 Aug 2022 04:13:03 -0400
From: Andrea Bolognani <abologna@redhat.com>
References: <20220420160311.248079-1-abologna@redhat.com>
 <20220420160311.248079-3-abologna@redhat.com>
 <YmAxjNgNWT2FNh8r@redhat.com>
 <CABJz62PnnGYV=6qiFYL2Y0+dg61P+nv0VvRUnP1cJkU6THcMEg@mail.gmail.com>
 <CABJz62NTwytWbStj172jOxe_1_f9=K4iv82Zh78twgQ5jNoAfw@mail.gmail.com>
 <YnI4AEYrkUvjuA4g@redhat.com>
 <CABJz62MaG0Bg+gf5_cGwAVQ3XLa_ZZ7B2tV2_J=1KpJmokedfA@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CABJz62MaG0Bg+gf5_cGwAVQ3XLa_ZZ7B2tV2_J=1KpJmokedfA@mail.gmail.com>
Date: Mon, 1 Aug 2022 04:13:03 -0400
Message-ID: <CABJz62Puz-=KtTRn9vNxbSXkVZjSAko50SF4kNgJstnti9=zTw@mail.gmail.com>
Subject: Re: [PATCH 2/2] docs: build-platforms: Clarify stance on minor
 releases and backports
To: =?UTF-8?Q?Daniel_P=2E_Berrang=C3=A9?= <berrange@redhat.com>
Cc: qemu-devel@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=170.10.133.124; envelope-from=abologna@redhat.com;
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

On Tue, Jun 14, 2022 at 06:42:58AM -0700, Andrea Bolognani wrote:
> On Wed, May 04, 2022 at 09:23:28AM +0100, Daniel P. Berrang=C3=A9 wrote:
> > On Wed, May 04, 2022 at 01:01:03AM -0700, Andrea Bolognani wrote:
> > > On Wed, Apr 20, 2022 at 09:18:47AM -0700, Andrea Bolognani wrote:
> > > > On Wed, Apr 20, 2022 at 05:15:08PM +0100, Daniel P. Berrang=C3=A9 w=
rote:
> > > > > On Wed, Apr 20, 2022 at 06:03:11PM +0200, Andrea Bolognani wrote:
> > > > > > These changes match those made in the following libvirt commits=
:
> > > > > >
> > > > > >   2ac78307af docs: Clarify our stance on backported packages
> > > > > >   78cffd450a docs: Spell out our policy concerning minor releas=
es
> > > > > >
> > > > > > Since QEMU's platform support policy is based on libvirt's, it
> > > > > > makes sense to mirror these recent changes made to the latter.
> > > > > >
> > > > > > The policy is not altered significantly - we're simply spelling
> > > > > > out some rules that were likely already being implicitly
> > > > > > enforced.
> > > > >
> > > > > Indeed, I think that's basically defacto the case already.
> > > > >
> > > > > Reviewed-by: Daniel P. Berrang=C3=A9 <berrange@redhat.com>
> > > >
> > > > Thanks! Are you going to bring these in through one of your trees, =
or
> > > > do I need to bug someone else so that they will pick them up? :)
> > >
> > > I see these haven't gone in yet. Anything I can/should do to make
> > > that happen?
> >
> > The tragedy of QEMU not having a central docs maintainer. I'll queue
> > this one for my next pull request.
>
> Still doesn't seem to have been merged. Not pressuring you or
> anything, just making sure it doesn't slip through the cracks :)

I'm still not seeing this in the tree. I figure with 7.1 coming up
you might be preparing a pull request at some point in the near
future so I though I'd ping again :)

--=20
Andrea Bolognani / Red Hat / Virtualization


