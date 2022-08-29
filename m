Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0232F5A55F1
	for <lists+qemu-devel@lfdr.de>; Mon, 29 Aug 2022 23:08:47 +0200 (CEST)
Received: from localhost ([::1]:38702 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oSlzx-0004WE-MA
	for lists+qemu-devel@lfdr.de; Mon, 29 Aug 2022 17:08:45 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45778)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <cp@absolutedigital.net>)
 id 1oSlyF-00034f-UT; Mon, 29 Aug 2022 17:06:59 -0400
Received: from mx2.absolutedigital.net ([50.242.207.105]:59950)
 by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <cp@absolutedigital.net>)
 id 1oSly9-00067q-W7; Mon, 29 Aug 2022 17:06:59 -0400
Received: from lancer.cnet.absolutedigital.net
 (lancer.cnet.absolutedigital.net [10.7.5.10])
 by luxor.inet.absolutedigital.net (8.14.4/8.14.4) with ESMTP id 27TL6YdL017919
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=FAIL);
 Mon, 29 Aug 2022 17:06:34 -0400
Received: from localhost (localhost [127.0.0.1])
 by lancer.cnet.absolutedigital.net (8.17.1/8.17.1) with ESMTPS id
 27TL75oY005409
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NO);
 Mon, 29 Aug 2022 17:07:05 -0400
Date: Mon, 29 Aug 2022 17:07:05 -0400 (EDT)
From: Cal Peake <cp@absolutedigital.net>
To: Gerd Hoffmann <kraxel@redhat.com>
cc: qemu-devel@nongnu.org, qemu-stable@nongnu.org
Subject: Re: [PATCH] ui/console: Get tab completion working again in the SDL
 monitor vc
In-Reply-To: <7054816e-99c-7e2-6737-7cf98cc56e2@absolutedigital.net>
Message-ID: <f422e776-1db8-240-3692-e442601dc9ce@absolutedigital.net>
References: <7054816e-99c-7e2-6737-7cf98cc56e2@absolutedigital.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Received-SPF: pass client-ip=50.242.207.105;
 envelope-from=cp@absolutedigital.net; helo=mx2.absolutedigital.net
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01,
 T_SPF_HELO_TEMPERROR=0.01 autolearn=ham autolearn_force=no
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

Hi Gerd,

Can you take a look at this and let me know what you think?

Thanks,
-Cal


On Thu, 11 Aug 2022, Cal Peake wrote:

> Define a QEMU special key constant for the tab key and add an entry for
> it in the qcode_to_keysym table. This allows tab completion to work again
> in the SDL monitor virtual console, which has been broken ever since the
> migration from SDL1 to SDL2.
> 
> Signed-off-by: Cal Peake <cp@absolutedigital.net>
> ---
>  include/ui/console.h | 1 +
>  ui/console.c         | 1 +
>  2 files changed, 2 insertions(+)
> 
> diff --git a/include/ui/console.h b/include/ui/console.h
> index c0520c694c..e400ee9fa7 100644
> --- a/include/ui/console.h
> +++ b/include/ui/console.h
> @@ -70,6 +70,7 @@ void hmp_mouse_set(Monitor *mon, const QDict *qdict);
>  /* keysym is a unicode code except for special keys (see QEMU_KEY_xxx
>     constants) */
>  #define QEMU_KEY_ESC1(c) ((c) | 0xe100)
> +#define QEMU_KEY_TAB        0x0009
>  #define QEMU_KEY_BACKSPACE  0x007f
>  #define QEMU_KEY_UP         QEMU_KEY_ESC1('A')
>  #define QEMU_KEY_DOWN       QEMU_KEY_ESC1('B')
> diff --git a/ui/console.c b/ui/console.c
> index e139f7115e..addaafba28 100644
> --- a/ui/console.c
> +++ b/ui/console.c
> @@ -1368,6 +1368,7 @@ static const int qcode_to_keysym[Q_KEY_CODE__MAX] = {
>      [Q_KEY_CODE_PGUP]   = QEMU_KEY_PAGEUP,
>      [Q_KEY_CODE_PGDN]   = QEMU_KEY_PAGEDOWN,
>      [Q_KEY_CODE_DELETE] = QEMU_KEY_DELETE,
> +    [Q_KEY_CODE_TAB]    = QEMU_KEY_TAB,
>      [Q_KEY_CODE_BACKSPACE] = QEMU_KEY_BACKSPACE,
>  };
>  
> -- 
> 2.35.3
> 
> 

