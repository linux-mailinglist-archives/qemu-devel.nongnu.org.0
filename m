Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0D1112E7CF4
	for <lists+qemu-devel@lfdr.de>; Wed, 30 Dec 2020 23:21:35 +0100 (CET)
Received: from localhost ([::1]:46936 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kujqY-00010t-4K
	for lists+qemu-devel@lfdr.de; Wed, 30 Dec 2020 17:21:34 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:51258)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <samuel.thibault@gnu.org>)
 id 1kujoz-0000Te-L4
 for qemu-devel@nongnu.org; Wed, 30 Dec 2020 17:19:57 -0500
Received: from hera.aquilenet.fr ([185.233.100.1]:55326)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <samuel.thibault@gnu.org>)
 id 1kujoy-0002oc-1s
 for qemu-devel@nongnu.org; Wed, 30 Dec 2020 17:19:57 -0500
Received: from localhost (localhost [127.0.0.1])
 by hera.aquilenet.fr (Postfix) with ESMTP id 9840F509;
 Wed, 30 Dec 2020 23:19:53 +0100 (CET)
X-Virus-Scanned: Debian amavisd-new at aquilenet.fr
Received: from hera.aquilenet.fr ([127.0.0.1])
 by localhost (hera.aquilenet.fr [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id tgRAp_XJRnrx; Wed, 30 Dec 2020 23:19:52 +0100 (CET)
Received: from function.youpi.perso.aquilenet.fr
 (lfbn-bor-1-56-204.w90-50.abo.wanadoo.fr [90.50.148.204])
 by hera.aquilenet.fr (Postfix) with ESMTPSA id 9BDB523C;
 Wed, 30 Dec 2020 23:19:52 +0100 (CET)
Received: from samy by function.youpi.perso.aquilenet.fr with local (Exim 4.94)
 (envelope-from <samuel.thibault@gnu.org>)
 id 1kujos-00C6zv-VS; Wed, 30 Dec 2020 23:19:50 +0100
Date: Wed, 30 Dec 2020 23:19:50 +0100
From: Samuel Thibault <samuel.thibault@gnu.org>
To: Chris Hofstaedtler <chris@hofstaedtler.name>
Subject: Re: [PATCH v2] meson: fix ncurses detection on macOS
Message-ID: <20201230221950.m4ila6u5k56zg353@function>
References: <20201230221727.60579-1-chris@hofstaedtler.name>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20201230221727.60579-1-chris@hofstaedtler.name>
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Yonggang Luo <luoyonggang@gmail.com>,
 Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Chris Hofstaedtler, le mer. 30 déc. 2020 23:17:27 +0100, a ecrit:
> Without this, meson fails with "curses package not usable" when using ncurses
> 6.2. Apparently the wide functions (addwstr, etc) are hidden behind the extra
> define, and meson does not define it at that detection stage.
> 
> Regression from b01a4fd3bd7d6f2 ("configure: Define NCURSES_WIDECHAR if we're
> using curses"). The meson conversion has seen many iterations of the curses
> check, so pinpointing the exact commit breaking this is not so easy.
> 
> Signed-off-by: Chris Hofstaedtler <chris@hofstaedtler.name>
> Cc: Peter Maydell <peter.maydell@linaro.org>
> Cc: Philippe Mathieu-Daudé <philmd@redhat.com>
> Cc: Samuel Thibault <samuel.thibault@gnu.org>
> Cc: Yonggang Luo <luoyonggang@gmail.com>

Reviewed-by: Samuel Thibault <samuel.thibault@ens-lyon.org>

> ---
>  meson.build | 6 +++---
>  1 file changed, 3 insertions(+), 3 deletions(-)
> 
> diff --git a/meson.build b/meson.build
> index 372576f82c..fd74728674 100644
> --- a/meson.build
> +++ b/meson.build
> @@ -500,16 +500,16 @@ if have_system and not get_option('curses').disabled()
>      endif
>    endforeach
>    msg = get_option('curses').enabled() ? 'curses library not found' : ''
> +  curses_compile_args = ['-DNCURSES_WIDECHAR']
>    if curses.found()
> -    if cc.links(curses_test, dependencies: [curses])
> -      curses = declare_dependency(compile_args: '-DNCURSES_WIDECHAR', dependencies: [curses])
> +    if cc.links(curses_test, args: curses_compile_args, dependencies: [curses])
> +      curses = declare_dependency(compile_args: curses_compile_args, dependencies: [curses])
>      else
>        msg = 'curses package not usable'
>        curses = not_found
>      endif
>    endif
>    if not curses.found()
> -    curses_compile_args = ['-DNCURSES_WIDECHAR']
>      has_curses_h = cc.has_header('curses.h', args: curses_compile_args)
>      if targetos != 'windows' and not has_curses_h
>        message('Trying with /usr/include/ncursesw')
> -- 
> 2.29.2
> 

