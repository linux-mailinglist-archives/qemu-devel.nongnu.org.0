Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BB8D33D0465
	for <lists+qemu-devel@lfdr.de>; Wed, 21 Jul 2021 00:18:41 +0200 (CEST)
Received: from localhost ([::1]:50718 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m5y4W-0004xv-OG
	for lists+qemu-devel@lfdr.de; Tue, 20 Jul 2021 18:18:40 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:56942)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dongwon.kim@intel.com>)
 id 1m5y2y-0002qC-7N
 for qemu-devel@nongnu.org; Tue, 20 Jul 2021 18:17:04 -0400
Received: from mga12.intel.com ([192.55.52.136]:40527)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dongwon.kim@intel.com>)
 id 1m5y2v-0000tL-SW
 for qemu-devel@nongnu.org; Tue, 20 Jul 2021 18:17:03 -0400
X-IronPort-AV: E=McAfee;i="6200,9189,10051"; a="190920693"
X-IronPort-AV: E=Sophos;i="5.84,256,1620716400"; d="scan'208";a="190920693"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
 by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Jul 2021 15:16:39 -0700
X-IronPort-AV: E=Sophos;i="5.84,256,1620716400"; d="scan'208";a="432711991"
Received: from dongwonk-mobl.amr.corp.intel.com ([10.254.47.107])
 by orsmga002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Jul 2021 15:16:37 -0700
Date: Tue, 20 Jul 2021 15:16:35 -0700
From: Dongwon Kim <dongwon.kim@intel.com>
To: Thomas Huth <thuth@redhat.com>
Subject: Re: [PATCH 1/2] ui/gtk: detach_all option for making all VCs
 detached upon starting
Message-ID: <20210720221635.GA4519@dongwonk-MOBL.amr.corp.intel.com>
References: <20210719214157.5863-1-dongwon.kim@intel.com>
 <885e977c-f697-dd02-4be1-b5283fdf343d@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <885e977c-f697-dd02-4be1-b5283fdf343d@redhat.com>
User-Agent: Mutt/1.9.4 (2018-02-28)
Received-SPF: pass client-ip=192.55.52.136; envelope-from=dongwon.kim@intel.com;
 helo=mga12.intel.com
X-Spam_score_int: -41
X-Spam_score: -4.2
X-Spam_bar: ----
X-Spam_report: (-4.2 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_MED=-2.3,
 SPF_HELO_PASS=-0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Khairul Anuar Romli <khairul.anuar.romli@intel.com>, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Tue, Jul 20, 2021 at 03:42:16PM +0200, Thomas Huth wrote:
> On 19/07/2021 23.41, Dongwon Kim wrote:
> > With "detach-all=on" for display, all VCs are detached from the beginning.
> > This is useful when there are multiple displays assigned to a guest OS.
> 
> Can you elaborate? (i.e. why is it useful? Do you just want to avoid having
> multiple things opened at startup? Or is there a different reason?)
Hi,

The original motivation is related to an use-case with a guest with
multi-displays. In that use case, we wanted to have all guest displays
placed side by side from beginning. Virtual consoles other than guest
displays (e.g. virtio-gpu-pci) are not actually needed but I found doing
"detach-all" is the simplest way.

> 
> > Signed-off-by: Dongwon Kim <dongwon.kim@intel.com>
> > Signed-off-by: Khairul Anuar Romli <khairul.anuar.romli@intel.com>
> > ---
> >   qapi/ui.json | 4 +++-
> >   ui/gtk.c     | 7 +++++++
> >   2 files changed, 10 insertions(+), 1 deletion(-)
> > 
> > diff --git a/qapi/ui.json b/qapi/ui.json
> > index 1052ca9c38..ff14bb2f46 100644
> > --- a/qapi/ui.json
> > +++ b/qapi/ui.json
> > @@ -1141,6 +1141,7 @@
> >   # @show-cursor:   Force showing the mouse cursor (default: off).
> >   #                 (since: 5.0)
> >   # @gl:            Enable OpenGL support (default: off).
> > +# @detach-all:    Detatch all VirtualConsoles from beginning (default: off).
> 
> Needs a comment à la "(since: 6.2)" at the end (like the one after
> "show-cursor" some lines earlier.
> 
> >   #
> >   # Since: 2.12
> >   #
> > @@ -1150,7 +1151,8 @@
> >                   '*full-screen'   : 'bool',
> >                   '*window-close'  : 'bool',
> >                   '*show-cursor'   : 'bool',
> > -                '*gl'            : 'DisplayGLMode' },
> > +                '*gl'            : 'DisplayGLMode',
> > +                '*detach-all'    : 'bool' },
> 
> If this is for GTK only, shouldn't this rather go into DisplayGTK instead?
> Or will this be also useful for other display types later?

This option might not be that useful for other use cases.. but at the
same time, I'm pretty sure this will work universally (won't break
anything..) but for now, I think it's good idea to limit this to GTK.

-DW

> 
>  Thomas
> 
> 
> >     'discriminator' : 'type',
> >     'data'    : { 'gtk'            : 'DisplayGTK',
> >                   'curses'         : 'DisplayCurses',
> > diff --git a/ui/gtk.c b/ui/gtk.c
> > index ce885d2ca3..a07e5a049e 100644
> > --- a/ui/gtk.c
> > +++ b/ui/gtk.c
> > @@ -2211,6 +2211,7 @@ static void gtk_display_init(DisplayState *ds, DisplayOptions *opts)
> >       GdkDisplay *window_display;
> >       GtkIconTheme *theme;
> >       char *dir;
> > +    int i;
> >       if (!gtkinit) {
> >           fprintf(stderr, "gtk initialization failed\n");
> > @@ -2290,6 +2291,12 @@ static void gtk_display_init(DisplayState *ds, DisplayOptions *opts)
> >           gtk_menu_item_activate(GTK_MENU_ITEM(s->grab_on_hover_item));
> >       }
> >       gd_clipboard_init(s);
> > +
> > +    if (opts->detach_all) {
> > +        for (i = 0; i < s->nb_vcs - 1; i++) {
> > +            gtk_menu_item_activate(GTK_MENU_ITEM(s->untabify_item));
> > +        }
> > +    }
> >   }
> >   static void early_gtk_display_init(DisplayOptions *opts)
> > 
> 

