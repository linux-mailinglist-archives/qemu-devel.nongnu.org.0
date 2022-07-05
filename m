Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4976156792E
	for <lists+qemu-devel@lfdr.de>; Tue,  5 Jul 2022 23:07:27 +0200 (CEST)
Received: from localhost ([::1]:40056 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o8plV-0006xK-UX
	for lists+qemu-devel@lfdr.de; Tue, 05 Jul 2022 17:07:25 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37900)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dongwon.kim@intel.com>)
 id 1o8pkh-0006He-Mc
 for qemu-devel@nongnu.org; Tue, 05 Jul 2022 17:06:35 -0400
Received: from mga07.intel.com ([134.134.136.100]:55472)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dongwon.kim@intel.com>)
 id 1o8pkf-0000Ys-Fr
 for qemu-devel@nongnu.org; Tue, 05 Jul 2022 17:06:35 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1657055193; x=1688591193;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=MYz3T35eiQYv2NGHyhV4SC1yOQlqtCrEWgGenJDAfAo=;
 b=ECIFwGlx2MWBI7GY5tC9sIm+X9C+/9nq0E+rb6YlXlM71MZJcNGJLAcw
 rWVsisdPHu8nuJMxnbdnWB5sDKSw7mUBs4agXew9sIvx5aAh7/TKPsQLq
 YH5Y6GLAgAn7WSvCJ5twUatXf0NE5Xd2ZFl0OEFycSnCT/vw7zbvWIJjn
 qECOBqfOW8agmtDDf3sm3JefDFMB4Hk7mjggiYAfWjkLETXPNp2gJjqTv
 6+tiqSNftdQ0UMAQQzHfmRj7PhWXhf2HmQu5Eyrd+79oMj63iBfq9vJTa
 LhBF+Xa1d74pZW4XCsHF7TGVORmLNojBZxi8Nv2SJRzCPsJXAAmR3Bav/ w==;
X-IronPort-AV: E=McAfee;i="6400,9594,10399"; a="347489492"
X-IronPort-AV: E=Sophos;i="5.92,247,1650956400"; d="scan'208";a="347489492"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Jul 2022 14:06:31 -0700
X-IronPort-AV: E=Sophos;i="5.92,247,1650956400"; d="scan'208";a="620010678"
Received: from dongwonk-mobl.amr.corp.intel.com ([10.212.114.205])
 by orsmga008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Jul 2022 14:06:30 -0700
Date: Tue, 5 Jul 2022 14:06:29 -0700
From: Dongwon Kim <dongwon.kim@intel.com>
To: Markus Armbruster <armbru@redhat.com>
Cc: qemu-devel@nongnu.org,
 Daniel P =?iso-8859-1?Q?=2E_Berrang=E9?= <berrange@redhat.com>,
 Philippe =?iso-8859-1?Q?Mathieu-Daud=E9?= <philmd@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>, Gerd Hoffmann <kraxel@redhat.com>,
 Vivek Kasireddy <vivek.kasireddy@intel.com>
Subject: Re: [PATCH v3 2/2] ui/gtk: a new array param monitor to specify the
 target displays
Message-ID: <20220705210628.GB582@dongwonk-MOBL.amr.corp.intel.com>
References: <20220630005141.16680-1-dongwon.kim@intel.com>
 <20220630005141.16680-3-dongwon.kim@intel.com>
 <87wncy41s1.fsf@pond.sub.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <87wncy41s1.fsf@pond.sub.org>
User-Agent: Mutt/1.9.4 (2018-02-28)
Received-SPF: pass client-ip=134.134.136.100;
 envelope-from=dongwon.kim@intel.com; helo=mga07.intel.com
X-Spam_score_int: -44
X-Spam_score: -4.5
X-Spam_bar: ----
X-Spam_report: (-4.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_MED=-2.3, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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

On Thu, Jun 30, 2022 at 05:19:26PM +0200, Markus Armbruster wrote:
> Dongwon Kim <dongwon.kim@intel.com> writes:
> 
> > New integer array parameter, 'monitor' is for specifying the target
> > monitors where individual GTK windows are placed upon launching.
> >
> > Monitor numbers in the array are associated with virtual consoles
> > in the order of [VC0, VC1, VC2 ... VCn].
> >
> > Every GTK window containing each VC will be placed in the region
> > of corresponding monitors.
> >
> > Usage: -display gtk,monitor.<id of VC>=<target monitor>,..
> >        ex)-display gtk,monitor.0=1,monitor.1=0
> >
> > v3: - Revised commit message
> >     - Rewrote desription of the new parameter (Markus Armbruster)
> >     - Replaced unnecessary 'for' loop with 'if' condition
> >       (Markus Armbruster)
> 
> Again, patch history ...
> > Cc: Daniel P. Berrangé <berrange@redhat.com>
> > Cc: Markus Armbruster <armbru@redhat.com>
> > Cc: Philippe Mathieu-Daudé <philmd@redhat.com>
> > Cc: Paolo Bonzini <pbonzini@redhat.com>
> > Cc: Gerd Hoffmann <kraxel@redhat.com>
> > Cc: Vivek Kasireddy <vivek.kasireddy@intel.com>
> > Signed-off-by: Dongwon Kim <dongwon.kim@intel.com>
> > ---
> 
> ... goes here.

No problem moving down the version history but may I ask you if that
is current rule? We don't want to include the history anymore in the
git history?

And FYI, the cover letter has the whole history already. I guess I can
simply remove the history from individual patches then?

Thanks!!

> 
> >  qapi/ui.json    |  9 ++++++++-
> >  qemu-options.hx |  3 ++-
> >  ui/gtk.c        | 31 +++++++++++++++++++++++++++++--
> >  3 files changed, 39 insertions(+), 4 deletions(-)
> >
> > diff --git a/qapi/ui.json b/qapi/ui.json
> > index 413371d5e8..7b4c098bb4 100644
> > --- a/qapi/ui.json
> > +++ b/qapi/ui.json
> > @@ -1195,12 +1195,19 @@
> >  #               assuming the guest will resize the display to match
> >  #               the window size then.  Otherwise it defaults to "off".
> >  #               Since 3.1
> > +# @monitor:     Array of numbers, each of which represents physical
> > +#               monitor where GTK window containing a given VC will be
> > +#               placed. Each monitor number in the array will be
> > +#               associated with a virtual-console starting from VC0.
> 
> Drop the hyphen in "virtual-console".
> 
> Is the term "virtual console" obvious?  Gerd?
> 

I will do so.

> > +#
> > +#               since 7.1
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
> > index 377d22fbd8..aabdfb0636 100644
> > --- a/qemu-options.hx
> > +++ b/qemu-options.hx
> > @@ -1938,7 +1938,8 @@ DEF("display", HAS_ARG, QEMU_OPTION_display,
> >  #endif
> >  #if defined(CONFIG_GTK)
> >      "-display gtk[,full-screen=on|off][,gl=on|off][,grab-on-hover=on|off]\n"
> > -    "            [,show-cursor=on|off][,window-close=on|off]\n"
> > +    "            [,monitor.<id of VC>=<monitor number>][,show-cursor=on|off]"
> > +    "            [,window-close=on|off]\n"
> >  #endif
> >  #if defined(CONFIG_VNC)
> >      "-display vnc=<display>[,<optargs>]\n"
> > diff --git a/ui/gtk.c b/ui/gtk.c
> > index e6878c3209..935176e614 100644
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
> > @@ -2393,10 +2397,33 @@ static void gtk_display_init(DisplayState *ds, DisplayOptions *opts)
> >              gtk_menu_item_activate(GTK_MENU_ITEM(s->untabify_item));
> >          }
> >      }
> > -    if (opts->has_full_screen &&
> > -        opts->full_screen) {
> > +
> > +    if (opts->u.gtk.has_monitor) {
> > +        i = 0;
> > +        n_mon = gdk_display_get_n_monitors(window_display);
> > +        for (mon = opts->u.gtk.monitor; mon; mon = mon->next) {
> > +            if (mon->value < n_mon && i < s->nb_vcs) {
> > +                win = s->vc[i].window ? s->vc[i].window : s->window;
> > +                if (opts->has_full_screen && opts->full_screen) {
> > +                    gtk_window_fullscreen_on_monitor(
> > +                        GTK_WINDOW(win),
> > +                        gdk_display_get_default_screen(window_display),
> > +                        mon->value);
> > +                } else {
> > +                    gdk_monitor_get_geometry(
> > +                        gdk_display_get_monitor(window_display, mon->value),
> > +                        &dest);
> > +                    gtk_window_move(GTK_WINDOW(win),
> > +                                    dest.x, dest.y);
> > +                }
> > +                i++;
> > +            }
> > +        }
> > +    } else if (opts->has_full_screen &&
> > +               opts->full_screen) {
> 
> I'd join these two lines, like
> 
>        } else if (opts->has_full_screen && opts->full_screen) {
> 
> or even exploit the fact that a opts->full_screen is false when absent
> 
>        } else if (opts->full_screen) {

This is simpler. I will go with this.

> 
> >          gtk_menu_item_activate(GTK_MENU_ITEM(s->full_screen_item));
> >      }
> > +
> >      if (opts->u.gtk.has_grab_on_hover &&
> >          opts->u.gtk.grab_on_hover) {
> >          gtk_menu_item_activate(GTK_MENU_ITEM(s->grab_on_hover_item));
> 

