Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4C64E2E69DE
	for <lists+qemu-devel@lfdr.de>; Mon, 28 Dec 2020 18:56:05 +0100 (CET)
Received: from localhost ([::1]:52996 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ktwkV-0004LJ-TL
	for lists+qemu-devel@lfdr.de; Mon, 28 Dec 2020 12:56:03 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:54708)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <samuel.thibault@gnu.org>)
 id 1ktwiU-0003i4-Bs
 for qemu-devel@nongnu.org; Mon, 28 Dec 2020 12:53:58 -0500
Received: from hera.aquilenet.fr ([185.233.100.1]:43046)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <samuel.thibault@gnu.org>)
 id 1ktwiS-0004Cc-Oa
 for qemu-devel@nongnu.org; Mon, 28 Dec 2020 12:53:58 -0500
Received: from localhost (localhost [127.0.0.1])
 by hera.aquilenet.fr (Postfix) with ESMTP id 8ABAA1EE;
 Mon, 28 Dec 2020 18:53:54 +0100 (CET)
X-Virus-Scanned: Debian amavisd-new at aquilenet.fr
Received: from hera.aquilenet.fr ([127.0.0.1])
 by localhost (hera.aquilenet.fr [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id atyfdvZ7wDtI; Mon, 28 Dec 2020 18:53:53 +0100 (CET)
Received: from function.youpi.perso.aquilenet.fr
 (lfbn-bor-1-56-204.w90-50.abo.wanadoo.fr [90.50.148.204])
 by hera.aquilenet.fr (Postfix) with ESMTPSA id 3C69B52;
 Mon, 28 Dec 2020 18:53:53 +0100 (CET)
Received: from samy by function.youpi.perso.aquilenet.fr with local (Exim 4.94)
 (envelope-from <samuel.thibault@gnu.org>)
 id 1ktwiO-002TeP-2q; Mon, 28 Dec 2020 18:53:52 +0100
Date: Mon, 28 Dec 2020 18:53:52 +0100
From: Samuel Thibault <samuel.thibault@gnu.org>
To: Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <philmd@redhat.com>
Subject: Re: [PATCH] meson: fix ncurses detection on macOS
Message-ID: <20201228175352.4jkugx4umznygooe@function>
References: <20201228151652.235542-1-chris@hofstaedtler.name>
 <ad2133a5-522d-b283-9abb-4c07e790c233@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <ad2133a5-522d-b283-9abb-4c07e790c233@redhat.com>
Organization: I am not organized
User-Agent: NeoMutt/20170609 (1.8.3)
Received-SPF: softfail client-ip=185.233.100.1;
 envelope-from=samuel.thibault@gnu.org; helo=hera.aquilenet.fr
X-Spam_score_int: -11
X-Spam_score: -1.2
X-Spam_bar: -
X-Spam_report: (-1.2 / 5.0 requ) BAYES_00=-1.9, SPF_HELO_PASS=-0.001,
 SPF_SOFTFAIL=0.665 autolearn=no autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: pbonzini@redhat.com, Yonggang Luo <luoyonggang@gmail.com>,
 qemu-devel@nongnu.org, Chris Hofstaedtler <chris@hofstaedtler.name>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Philippe Mathieu-Daudé, le lun. 28 déc. 2020 18:20:13 +0100, a ecrit:
> On 12/28/20 4:16 PM, Chris Hofstaedtler wrote:
> > Without this, meson fails with "curses package not usable"
> > when using ncurses 6.2. Apparently the wide functions
> > (addwstr, etc) are hidden behind the extra define, and
> > meson does not define it at that detection stage.
> 
> Seems reasonable, but still Cc'ing more developers.

That looks sensible indeed.


> > Signed-off-by: Chris Hofstaedtler <chris@hofstaedtler.name>
> > ---
> >  meson.build | 2 +-
> >  1 file changed, 1 insertion(+), 1 deletion(-)
> > 
> > diff --git a/meson.build b/meson.build
> > index 9c152a85bd..7b9d92c14a 100644
> > --- a/meson.build
> > +++ b/meson.build
> > @@ -510,7 +510,7 @@ if have_system and not get_option('curses').disabled()
> >    endforeach
> >    msg = get_option('curses').enabled() ? 'curses library not found' : ''
> >    if curses.found()
> > -    if cc.links(curses_test, dependencies: [curses])
> > +    if cc.links(curses_test, args: '-DNCURSES_WIDECHAR', dependencies: [curses])
> >        curses = declare_dependency(compile_args: '-DNCURSES_WIDECHAR', dependencies: [curses])
> >      else
> >        msg = 'curses package not usable'

