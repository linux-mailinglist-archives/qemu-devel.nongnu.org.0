Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7E5705537EB
	for <lists+qemu-devel@lfdr.de>; Tue, 21 Jun 2022 18:35:58 +0200 (CEST)
Received: from localhost ([::1]:52238 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o3gr7-0003Ig-DV
	for lists+qemu-devel@lfdr.de; Tue, 21 Jun 2022 12:35:57 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47924)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dongwon.kim@intel.com>)
 id 1o3gpA-0002Rf-G5
 for qemu-devel@nongnu.org; Tue, 21 Jun 2022 12:33:57 -0400
Received: from mga02.intel.com ([134.134.136.20]:40152)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dongwon.kim@intel.com>)
 id 1o3gp7-0001AC-Ll
 for qemu-devel@nongnu.org; Tue, 21 Jun 2022 12:33:56 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1655829233; x=1687365233;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=qjtZ61mO7E/p4LeTtwZakHRfvZOzx/T8I2Br7hllx6g=;
 b=ehnB1Z8w/Ebr/Gyma0IfMej/Mlj+Ubqj62KoFjIZ352+hEG+kc71Kx9d
 nenzJNaz/7vE81dQ1s37cZKxS1flvvUWI51t5lGM0+ZCUPCebsrSZJQk0
 F34wxqf1YXRK5dxjNYZtIRxY8rdljXGi1N4nxnvEjld+H1bpW/gg7dNMw
 ZYoGofv4D1NxvRo6ZuL7tCQt3HXoWK9brHsaVyJZAyey54nTRNFKYfaIn
 G9ON/fCtvUmkF9PozcKsOl4DoN2+ErePkJBYulz2dbGAlkzGSvmVITvlE
 wCQJoUV+C0Mjor+t4Vy1bwLkY3VhrmKFbZBHvvCGOl8iotzFQma0xWfGm Q==;
X-IronPort-AV: E=McAfee;i="6400,9594,10385"; a="268883470"
X-IronPort-AV: E=Sophos;i="5.92,209,1650956400"; d="scan'208";a="268883470"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
 by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Jun 2022 09:33:37 -0700
X-IronPort-AV: E=Sophos;i="5.92,209,1650956400"; d="scan'208";a="833649699"
Received: from dongwonk-mobl.amr.corp.intel.com ([10.212.82.132])
 by fmsmga006-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Jun 2022 09:33:36 -0700
Date: Tue, 21 Jun 2022 09:33:35 -0700
From: Dongwon Kim <dongwon.kim@intel.com>
To: Markus Armbruster <armbru@redhat.com>
Cc: qemu-devel@nongnu.org,
 Daniel P =?iso-8859-1?Q?=2E_Berrang=E9?= <berrange@redhat.com>,
 Philippe =?iso-8859-1?Q?Mathieu-Daud=E9?= <philmd@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>, Gerd Hoffmann <kraxel@redhat.com>,
 Vivek Kasireddy <vivek.kasireddy@intel.com>
Subject: Re: [PATCH v2 2/2] ui/gtk: a new array param monitor to specify the
 target displays
Message-ID: <20220621163335.GA21@dongwonk-MOBL.amr.corp.intel.com>
References: <20220615231942.29981-1-dongwon.kim@intel.com>
 <20220615231942.29981-3-dongwon.kim@intel.com>
 <87o7yn6cfb.fsf@pond.sub.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <87o7yn6cfb.fsf@pond.sub.org>
User-Agent: Mutt/1.9.4 (2018-02-28)
Received-SPF: pass client-ip=134.134.136.20;
 envelope-from=dongwon.kim@intel.com; helo=mga02.intel.com
X-Spam_score_int: -44
X-Spam_score: -4.5
X-Spam_bar: ----
X-Spam_report: (-4.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_MED=-2.3, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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

Hi Markus,

On Mon, Jun 20, 2022 at 09:07:04AM +0200, Markus Armbruster wrote:
> Dongwon Kim <dongwon.kim@intel.com> writes:
> 
> > New integer array parameter, 'monitor' is for specifying the target
> > displays where individual QEMU windows are placed upon launching.
> >
> > The array contains a series of numbers representing the monitor where
> > QEMU windows are placed.
> >
> > Numbers in the array are mapped to QEMU windows like,
> >
> > [1st detached window, 2nd detached window,.... Main window]
> >
> > Usage example: -display gtk,monitor.0=0,monitor.1=1.....
> >
> > Cc: Daniel P. Berrangé <berrange@redhat.com>
> > Cc: Markus Armbruster <armbru@redhat.com>
> > Cc: Philippe Mathieu-Daudé <philmd@redhat.com>
> > Cc: Paolo Bonzini <pbonzini@redhat.com>
> > Cc: Gerd Hoffmann <kraxel@redhat.com>
> > Cc: Vivek Kasireddy <vivek.kasireddy@intel.com>
> > Signed-off-by: Dongwon Kim <dongwon.kim@intel.com>
> > ---
> >  qapi/ui.json    |  7 ++++++-
> >  qemu-options.hx |  2 +-
> >  ui/gtk.c        | 32 +++++++++++++++++++++++++++++++-
> >  3 files changed, 38 insertions(+), 3 deletions(-)
> >
> > diff --git a/qapi/ui.json b/qapi/ui.json
> > index 413371d5e8..5980f30c7f 100644
> > --- a/qapi/ui.json
> > +++ b/qapi/ui.json
> > @@ -1195,12 +1195,17 @@
> >  #               assuming the guest will resize the display to match
> >  #               the window size then.  Otherwise it defaults to "off".
> >  #               Since 3.1
> > +# @monitor:     Array of numbers, each of which represents physical
> > +#               monitor where individual QEMU window is placed in case
> > +#               there are multiple of them
> 
> End you sentence with a period, and ...
> 
> > +#               since 7.1
> 
> ... start the next phrase with a capital letter.
> 
> The documentation text feels vague.  Possibly because I lack familiarity
> with this part of the user interface.  What are the "individual QEMU
> windows"?  How are they numbered?
> 

Will rework on the phrase. So there is only one QEMU window normally
when you start the guest os. And this window usually contains multiple
virtual consoles by default. You can detach any of them by clicking detach
menu item from UI. In this case, a new window will be created for the
detached VC. By doing this, we could have primary window and newly
created n number of windows. Individual windows means these windows.

In this patch, VC number is being used as windows number. The primary
one - guest display is '0'. The guest's secondary display will be '1'
and so on.

Thanks for the feedback.

> >  #
> >  # Since: 2.12
> >  ##
> >  { 'struct'  : 'DisplayGTK',
> >    'data'    : { '*grab-on-hover' : 'bool',
> > -                '*zoom-to-fit'   : 'bool'  } }
> > +                '*zoom-to-fit'   : 'bool',
> > +                '*monitor'       : ['uint16']  } }
> >  
> >  ##
> >  # @DisplayEGLHeadless:
> > diff --git a/qemu-options.hx b/qemu-options.hx
> > index 377d22fbd8..f79f533e9d 100644
> > --- a/qemu-options.hx
> > +++ b/qemu-options.hx
> > @@ -1938,7 +1938,7 @@ DEF("display", HAS_ARG, QEMU_OPTION_display,
> >  #endif
> >  #if defined(CONFIG_GTK)
> >      "-display gtk[,full-screen=on|off][,gl=on|off][,grab-on-hover=on|off]\n"
> > -    "            [,show-cursor=on|off][,window-close=on|off]\n"
> > +    "            [,monitor.<order>=<value>][,show-cursor=on|off][,window-close=on|off]\n"
> >  #endif
> >  #if defined(CONFIG_VNC)
> >      "-display vnc=<display>[,<optargs>]\n"
> > diff --git a/ui/gtk.c b/ui/gtk.c
> > index e6878c3209..fc9bf04680 100644
> > --- a/ui/gtk.c
> > +++ b/ui/gtk.c
> > @@ -2316,6 +2316,10 @@ static void gtk_display_init(DisplayState *ds, DisplayOptions *opts)
> >      GtkDisplayState *s = g_malloc0(sizeof(*s));
> >      GdkDisplay *window_display;
> >      GtkIconTheme *theme;
> > +    GtkWidget *win;
> > +    GdkRectangle dest;
> > +    uint16List *mon;
> > +    int n_mon;
> >      int i;
> >      char *dir;
> >  
> > @@ -2393,7 +2397,33 @@ static void gtk_display_init(DisplayState *ds, DisplayOptions *opts)
> >              gtk_menu_item_activate(GTK_MENU_ITEM(s->untabify_item));
> >          }
> >      }
> > -    if (opts->has_full_screen &&
> > +    if (opts->u.gtk.has_monitor) {
> > +        i = 0;
> > +        n_mon = gdk_display_get_n_monitors(window_display);
> > +        for (mon = opts->u.gtk.monitor; mon; mon = mon->next) {
> > +            if (mon->value < n_mon) {
> > +                for (; i < s->nb_vcs; i++) {
> > +                    win = s->vc[i].window ? s->vc[i].window : s->window;
> > +                    if (opts->has_full_screen && opts->full_screen) {
> > +                        gtk_window_fullscreen_on_monitor(
> > +                            GTK_WINDOW(win),
> > +                            gdk_display_get_default_screen(window_display),
> > +                            mon->value);
> > +                    } else {
> > +                        gdk_monitor_get_geometry(
> > +                            gdk_display_get_monitor(window_display, mon->value),
> > +                            &dest);
> > +                        gtk_window_move(GTK_WINDOW(win),
> > +                                        dest.x, dest.y);
> > +                    }
> > +                    i++;
> > +                    break;
> > +                }
> 
> This loop is odd.  It's of the form
> 
>                    for (; COND; STEP) {
>                        ...
>                        break;
>                    }
> 
> STEP is unreachable.  The whole thing boils down to
> 
>                    if (COND) {
>                        ....
>                    }
> 
> doesn't it?

You are definitely right. if (COND) should be the one here. I will fix this in the
next version.

> 
> > +            }
> > +        }
> > +    }
> > +    if (!opts->u.gtk.has_monitor &&
> > +        opts->has_full_screen &&
> >          opts->full_screen) {
> >          gtk_menu_item_activate(GTK_MENU_ITEM(s->full_screen_item));
> >      }
> 
> 
> This is
> 
>        if (COND1) {
>            ...
>        }
>        if (!COND1 && COND2) {
>            ...
>        }
> 
> I'd prefer
> 
>        if (COND1) {
>            ...
>        } else if (COND2) {
>            ...
>        }
> 

I will take a look at this as well.


