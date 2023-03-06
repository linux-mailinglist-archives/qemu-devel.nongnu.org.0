Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 67B166AC1C7
	for <lists+qemu-devel@lfdr.de>; Mon,  6 Mar 2023 14:49:23 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pZBD4-0002pn-Dy; Mon, 06 Mar 2023 08:49:02 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <nsoffer@redhat.com>)
 id 1pZBCx-0002ke-Qe
 for qemu-devel@nongnu.org; Mon, 06 Mar 2023 08:49:00 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <nsoffer@redhat.com>)
 id 1pZBCw-0003jG-3d
 for qemu-devel@nongnu.org; Mon, 06 Mar 2023 08:48:55 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1678110533;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=03mR9ejaWocg7Ib6/dl+bzxwahc7bm4b+rJsBMEbL/M=;
 b=BzJTUP0Wb251hAT9+zT/S8zkR0TmrG9Im3n7YGs95J2I7Sp5ur7pUTaSM3MSHcuik4PPIo
 K+9qcYkTsYGLE5BJKCJb9pdL8cqOi7kvhOjblX2Cmijb8O2YyaA2DsI7sd2m44I7hoylNG
 AhM+KOG8ItQXQOirF9h0T6NpeXnGscg=
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com
 [209.85.222.197]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-26-vDSqJd-2ORuwi-r9G7xrmA-1; Mon, 06 Mar 2023 08:48:50 -0500
X-MC-Unique: vDSqJd-2ORuwi-r9G7xrmA-1
Received: by mail-qk1-f197.google.com with SMTP id
 u28-20020a05620a085c00b0073b88cae2f5so5381860qku.8
 for <qemu-devel@nongnu.org>; Mon, 06 Mar 2023 05:48:50 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1678110530;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=03mR9ejaWocg7Ib6/dl+bzxwahc7bm4b+rJsBMEbL/M=;
 b=tRj4UWvsZyv6p9im309LXcPtbvonZkn4NuX+ekUsvPEdSXhE+RxwqPJ0aiOeJg8NN4
 xU/PWJ7GXVFLEVJY7BJdC5dtB8wjBZo33A97uLb+RvpSkdHj/2OG2/oHvg4M/l3SvPVO
 mmXJV8Ivj80imxqVnRgPBGucf5qsCH4wyVush5hjbDbs3D2hCp7zdPjHJgEjTHJfPK3g
 InxDNyL5qqU83xBmiDyPiQgTRRv3zhMlYipcTYf3T1uIKcBT9QpTk94Gv7fcNdlCu98b
 MD9H3u/xMwaLv1q3/CQrvGqvh1gyZ9MIi8GvOWmZr3lGvP84F48PD/IKH40vAwIXP+Nw
 hsWw==
X-Gm-Message-State: AO0yUKVX0wWHq3FqhYm9k3Cc5jMHuthZEjCu2Zb+X7/BB35n6Ya1PMHY
 iK6ix+Sqdxf0DLy7RnIZ7UDuY0GQpMC/4dtZR/ywaz6MTZozgYjb7jkdgR2Ngn00LP8ovtk9CKo
 2KkMd+UGALND114pNeXJ1qrxT7XX2UqE=
X-Received: by 2002:a05:6214:1927:b0:56b:ee5a:89f0 with SMTP id
 es7-20020a056214192700b0056bee5a89f0mr2878570qvb.7.1678110529750; 
 Mon, 06 Mar 2023 05:48:49 -0800 (PST)
X-Google-Smtp-Source: AK7set9XlW6qh9UVZegaOqagqGBYzDymxUkaQdxGTaqPJWaaSnSMBDIjIZlsmZmFgABopULN+fQXpo2HAHtXUdmoFvU=
X-Received: by 2002:a05:6214:1927:b0:56b:ee5a:89f0 with SMTP id
 es7-20020a056214192700b0056bee5a89f0mr2878561qvb.7.1678110529330; Mon, 06 Mar
 2023 05:48:49 -0800 (PST)
MIME-Version: 1.0
References: <20221114224141.cm5jgyxfmvie5xb5@redhat.com>
 <20221114224655.2186173-1-eblake@redhat.com>
 <20221114224655.2186173-2-eblake@redhat.com>
 <f350f0ec-34b1-dca7-5bb0-344a6832f327@yandex-team.ru>
 <20230303221740.pdwc6jtozstntih7@redhat.com>
 <ZARVwVaRJbgvv/fO@pc220518.home.grep.be>
In-Reply-To: <ZARVwVaRJbgvv/fO@pc220518.home.grep.be>
From: Nir Soffer <nsoffer@redhat.com>
Date: Mon, 6 Mar 2023 15:48:33 +0200
Message-ID: <CAMRbyyvmbjuZWw1tvTf8SX-0odn79kcPCMoevuS_2WM3shNrkA@mail.gmail.com>
Subject: Re: [Libguestfs] [PATCH v2 1/6] spec: Recommend cap on
 NBD_REPLY_TYPE_BLOCK_STATUS length
To: Wouter Verhelst <w@uter.be>
Cc: Eric Blake <eblake@redhat.com>, libguestfs@redhat.com, nbd@other.debian.org,
 qemu-devel@nongnu.org, qemu-block@nongnu.org, 
 Vladimir Sementsov-Ogievskiy <vsementsov@yandex-team.ru>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=170.10.133.124; envelope-from=nsoffer@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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

On Sun, Mar 5, 2023 at 10:42=E2=80=AFAM Wouter Verhelst <w@uter.be> wrote:
>
> On Fri, Mar 03, 2023 at 04:17:40PM -0600, Eric Blake wrote:
> > On Fri, Dec 16, 2022 at 10:32:01PM +0300, Vladimir Sementsov-Ogievskiy =
wrote:
> > > s-o-b line missed.
> >
> > I'm not sure if the NBD project has a strict policy on including one,
> > but I don't mind adding it.
>
> I've never required it, mostly because it's something that I myself
> always forget, too, so, *shrug*.
>
> (if there were a way in git to make it add that automatically, that
> would help; I've looked but haven't found it)

What I'm using in all projects that require signed-off-by is:

$ cat .git/hooks/commit-msg
#!/bin/sh

# Add Signed-off-by trailer.
sob=3D$(git var GIT_AUTHOR_IDENT | sed -n 's/^\(.*>\).*$/Signed-off-by: \1/=
p')
git interpret-trailers --in-place --trailer "$sob" "$1"

You can also use a pre-commit hook but the commit-msg hook is more
convenient.

And in github you can add the DCO application to the project:
https://github.com/apps/dco

Once installed it will check that all commits are signed off, and
provide helpful error
messages to contributors.

Nir


