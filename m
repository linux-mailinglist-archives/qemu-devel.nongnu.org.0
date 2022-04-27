Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 31F3D511FD2
	for <lists+qemu-devel@lfdr.de>; Wed, 27 Apr 2022 20:38:24 +0200 (CEST)
Received: from localhost ([::1]:49566 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1njmYQ-0000sQ-PD
	for lists+qemu-devel@lfdr.de; Wed, 27 Apr 2022 14:38:22 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54560)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <qemu_oss@crudebyte.com>)
 id 1njmWL-0007NG-7V; Wed, 27 Apr 2022 14:36:13 -0400
Received: from kylie.crudebyte.com ([5.189.157.229]:55549)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <qemu_oss@crudebyte.com>)
 id 1njmWH-0003Qj-Uw; Wed, 27 Apr 2022 14:36:12 -0400
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=crudebyte.com; s=kylie; h=Content-Type:Content-Transfer-Encoding:
 MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
 Content-ID:Content-Description;
 bh=B/6O30L6zh1on5z+1MkXonLo/uGekMT47JdWm3AvfIY=; b=XCy3ZdIcKRHa79orXGCufM291H
 a6fw9u6ZbhETYlw4eZhwp4Oy3ztbIH9F1lT+HZh62riGa6b2yLucUEJJqHDj473n2uyREEn7EjSYh
 mkz3qtHDUrGUXLRwCFTf2nkw5qmDsW60jj0gfEDA3h99pFgMX+f9DUjuUK2wHMkfy2MKyKwtk1I3h
 Kiy0cJ2iELJ5SJLOuLIUkbvCthvs3fDj9Li3mUgqWrbfkOYLrrcW7h8QXw4JOOd9ffZDdVNJZAQpM
 ZC+9WeCE4leiTLoeOGkKV/8FqgchQSrBwkgUWEHvpbWcVWbOPx+2GFR1ASIkLmw6cVXWfP2TLHYXn
 q8AXxXlKxgE2XNYd32c9ffHnXTpdbjT4LjKrRTNlv5261zBeaT+wVtyOXowXb2blg1VtQ2cwEs4mj
 CyijgeLPkIZ3rIPeFvB3k0F6vpJmZX6UIiqouq7/4JXC0v6Vb7Xb5jt4ERs9ncUqCFsF+bTndHfVo
 Zd0n7nQq10soIM/Q5madPJQX/exMcs0v1y9Rb0mBY1cQFnunyY1o25vRY/pvg7Z5cYH6QzCj7KMTr
 6QCLkOSouq/LHHH5Ljmm1nGE4Q/OCBAZ1jsKjcRs03BqPTa6BqLHCBl3896yLNbo+KkSeD4wlBGH7
 H+Ax8bZUmCV1xSolWjAZ4B0VxcNBW0mhlyV0BG8nw=;
From: Christian Schoenebeck <qemu_oss@crudebyte.com>
To: Greg Kurz <groug@kaod.org>
Cc: qemu-devel@nongnu.org, qemu-stable@nongnu.org,
 Keno Fischer <keno@juliacomputing.com>,
 Michael Roitzsch <reactorcontrol@icloud.com>, Will Cohen <wwcohen@gmail.com>, 
 Akihiko Odaki <akihiko.odaki@gmail.com>
Subject: Re: [PATCH v2 2/5] 9pfs: fix qemu_mknodat(S_IFSOCK) on macOS
Date: Wed, 27 Apr 2022 20:36:05 +0200
Message-ID: <2034825.rxTUK30GeI@silver>
In-Reply-To: <20220427193739.4963c60b@bahia>
References: <cover.1650553693.git.qemu_oss@crudebyte.com>
 <2323649.gZi5zFeIBc@silver> <20220427193739.4963c60b@bahia>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="iso-8859-1"
Received-SPF: pass client-ip=5.189.157.229;
 envelope-from=qemu_oss@crudebyte.com; helo=kylie.crudebyte.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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

On Mittwoch, 27. April 2022 19:37:39 CEST Greg Kurz wrote:
> On Wed, 27 Apr 2022 18:18:31 +0200
>=20
> Christian Schoenebeck <qemu_oss@crudebyte.com> wrote:
> > On Mittwoch, 27. April 2022 15:31:42 CEST Greg Kurz wrote:
> > > On Wed, 27 Apr 2022 14:32:53 +0200
> > >=20
> > > Christian Schoenebeck <qemu_oss@crudebyte.com> wrote:
> > > > On Mittwoch, 27. April 2022 12:18:10 CEST Greg Kurz wrote:
> > > > > On Wed, 27 Apr 2022 11:27:28 +0900
> > > > >=20
> > > > > Akihiko Odaki <akihiko.odaki@gmail.com> wrote:
> > > > > > On 2022/04/26 21:38, Greg Kurz wrote:
> > [...]
> >=20
> > > > > > Considering the transient states are tolerated in 9pfs, we need=
 to
> > > > > > design this function to be tolerant with transient states as we=
ll.
> > > > > > The
> > > > > > use of chmod() is not safe when we consider about transient
> > > > > > states. A
> > > > > > malicious actor may replace the file at the path with a symlink
> > > > > > which
> > > > > > may escape the shared directory and chmod() will naively follow
> > > > > > it.
> > > > >=20
> > > > > You get a point here. Thanks for your tenacity ! :-)
> > > >=20
> > > > Yep, I send a v4 with fchmodat_nofollow() instead of chmod(), thank=
s!
> > > >=20
> > > > BTW, why is it actually allowed for client to create a symlink
> > > > pointing
> > > > outside exported directory tree with security_model=3Dpassthrough/n=
one?
> > > > Did
> > > > anybody want that?
> > >=20
> > > The target argument to symlink() is merely a string that is stored in
> > > the inode. It is only evaluated as a path at the time an action is
> > > made on the link. Checking at symlink() time is thus useless.
> > >=20
> > > Anyway, we're safe on this side since it's the client's job to
> > > resolve links and we explicitly don't follow them in the server.
> >=20
> > I wouldn't call it useless, because it is easier to keep exactly 1 hole
> > stuffed instead of being forced to continuously stuff N holes as new on=
es
> > may popup up over time, as this case shows (mea culpa).
> >=20
> > So you are trading (probably minor) performance for security.
> >=20
> > But my question was actually meant seriously: whether there was anybody=
 in
> > the past who probably actually wanted to create relative symlinks outsi=
de
> > the exported tree. For instance for another service with wider host
> > filesystem access.
>=20
> I took the question seriously :-), the problem is that even if you
> do a check on the target at symlink() time, you don't know how it
> will be evaluated in the end.
>=20
> Quick demonstration:
>=20
> $ cd /var/tmp/
> $ mkdir foo
> $ cd foo/
> $ # Suppose foo is the jail
> $ mkdir bar
> $ ln -sf .. bar/link
> $ realpath bar/link
> /var/tmp/foo
> $ # Good, we're still under foo
> $ mv bar/link .
> $ realpath link
> /var/tmp
> $ # Ouch we've escaped
>=20
> So in the end, the only real fix is to ban path based syscalls and
> pass AT_SYMLINK_NOFOLLOW everywhere. This was the justification for
> rewriting nearly all 9p local in order to fix CVE-2016-9602.
>=20
> https://lists.gnu.org/archive/html/qemu-devel/2017-01/msg06225.html

Touch=E9 :) Agreed, it's not worth it.

I mean this simple example could still be addressed by catching the move, b=
ut=20
if you have like several nested directories, each with a huge number of=20
chained symlinks, on top of it non-atomic issues etc., then things would ge=
t=20
way expensive to check, as you would actually have to traverse an entire tr=
ee=20
and validate an even bigger amount of symlink pathes for every single symli=
nk=20
modification attempt on guest, probably even with exclusive locks, and so o=
n.

> > [...]
> >=20
> > > > > This brings up a new problem I hadn't realized before : the
> > > > > fchmodat_nofollow() implementation in 9p-local.c is really
> > > > > a linux only thing to cope with AT_SYMLINK_NOFOLLOW not being
> > > > > supported with fchmodat(). It looks that this should move to
> > > > > 9p-util-linux.c and a proper version should be added for macOS
> > > > > in 9p-util-darwin.c
> > > >=20
> > > > Like already agreed on the other thread, yes, that makes sense. But=
 I
> > > > think
> > > > this can be handled with a follow-up, separate from this series.
> > >=20
> > > Fair enough if you want to handle fchmodat_nofollow() later but you
> > > must at least use fchmodat(AT_SYMLINK_NOFOLLOW) in this patch
> > > instead of chmod().
> >=20
> > Sounds like a quick and easy workaround. However looking at 'man fchmod=
at'
> > on macOS, this probably does not exactly do what you wanted it to, at
> > least not>=20
> > in this particular case:
> >      AT_SYMLINK_NOFOLLOW
> >     =20
> >              If path names a symbolic link, then the mode of the symbol=
ic
> >              link is changed.>     =20
> >      AT_SYMLINK_NOFOLLOW_ANY
> >     =20
> >              If path names a symbolic link, then the mode of the symbol=
ic
> >              link is changed and if if the path has any other symbolic
> >              links, an error is returned.>=20
> > So if somebody replaced the socket file by a 1st order symlink, you wou=
ld
> > adjust the symlink's permissions with both AT_SYMLINK_NOFOLLOW as well =
as
> > with AT_SYMLINK_NOFOLLOW_ANY. I mean it's better than chmod(), but
> > acceptable?
> As long as the link is not followed outside, we're good : it will change =
the
> symlink mode and then what ?

OK, then fine with me. I already filed a bug report with Apple for supporti=
ng=20
fchmod(socket()). Hopefully we'll have a clean atomic solution in near futu=
re=20
for this issue then.

I'll post v4 now. Thanks!

Best regards,
Christian Schoenebeck



