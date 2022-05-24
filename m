Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 20451532635
	for <lists+qemu-devel@lfdr.de>; Tue, 24 May 2022 11:17:03 +0200 (CEST)
Received: from localhost ([::1]:53006 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ntQez-0000EU-6b
	for lists+qemu-devel@lfdr.de; Tue, 24 May 2022 05:17:02 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57804)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1ntPnF-0000EW-2A
 for qemu-devel@nongnu.org; Tue, 24 May 2022 04:21:32 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:51187)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1ntPnB-0002lI-Rj
 for qemu-devel@nongnu.org; Tue, 24 May 2022 04:21:27 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1653380484;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:in-reply-to:in-reply-to:  references:references;
 bh=w1/TPdGLV+tLVHZX+X5BUeV4h9J+uniU+RQVMx38Dj4=;
 b=LaNE3ooDmF0tATvwmjOXUX3k1DIzEM6W/cWfxLFZAIoHAfEebWy2YEKj/epZiE135jKMrk
 N7ZO3UwYkFYTSI+kdTM1x04XUW3fX2zzkz0ZzPXCporpWBpP74DE3UdErMIXavwAMkPP+J
 XV6C0vFryAQBdlxFpH7Un5QkZBEMqOQ=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-590-CUP0BjL4OhGlE2sI44bHCw-1; Tue, 24 May 2022 04:21:23 -0400
X-MC-Unique: CUP0BjL4OhGlE2sI44bHCw-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.rdu2.redhat.com
 [10.11.54.8])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id DAB4A85A5BD
 for <qemu-devel@nongnu.org>; Tue, 24 May 2022 08:21:22 +0000 (UTC)
Received: from redhat.com (unknown [10.33.36.159])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 93ACEC27E8E;
 Tue, 24 May 2022 08:21:21 +0000 (UTC)
Date: Tue, 24 May 2022 09:21:18 +0100
From: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
To: Thomas Huth <thuth@redhat.com>
Cc: Markus Armbruster <armbru@redhat.com>, qemu-devel@nongnu.org,
 Gerd Hoffmann <kraxel@redhat.com>, Eric Blake <eblake@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>
Subject: Re: [PATCH v3 2/3] ui: Switch "-display sdl" to use the QAPI parser
Message-ID: <YoyVfgrJiYCI8bEO@redhat.com>
References: <20220519155625.1414365-1-thuth@redhat.com>
 <20220519155625.1414365-3-thuth@redhat.com>
 <87v8tw7470.fsf@pond.sub.org>
 <dd189cec-06ed-5015-cab5-99abd3f69ecf@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <dd189cec-06ed-5015-cab5-99abd3f69ecf@redhat.com>
User-Agent: Mutt/2.2.1 (2022-02-19)
X-Scanned-By: MIMEDefang 2.85 on 10.11.54.8
Received-SPF: pass client-ip=170.10.133.124; envelope-from=berrange@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
Reply-To: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Mon, May 23, 2022 at 09:23:48PM +0200, Thomas Huth wrote:
> On 23/05/2022 15.45, Markus Armbruster wrote:
> > Thomas Huth <thuth@redhat.com> writes:
> > 
> > > The "-display sdl" option still uses a hand-crafted parser for its
> > > parameters since we didn't want to drag an interface we considered
> > > somewhat flawed into the QAPI schema. Since the flaws are gone now,
> > > it's time to QAPIfy.
> > > 
> > > This introduces the new "DisplaySDL" QAPI struct that is used to hold
> > > the parameters that are unique to the SDL display. The only specific
> > > parameter is currently "grab-mod" that is used to specify the required
> > > modifier keys to escape from the mouse grabbing mode.
> > > 
> > > Signed-off-by: Thomas Huth <thuth@redhat.com>
> > > ---
> > >   qapi/ui.json            | 26 ++++++++++++++-
> > >   include/sysemu/sysemu.h |  2 --
> > >   softmmu/globals.c       |  2 --
> > >   softmmu/vl.c            | 70 +----------------------------------------
> > >   ui/sdl2.c               | 10 ++++++
> > >   5 files changed, 36 insertions(+), 74 deletions(-)
> > > 
> > > diff --git a/qapi/ui.json b/qapi/ui.json
> > > index 11a827d10f..413371d5e8 100644
> > > --- a/qapi/ui.json
> > > +++ b/qapi/ui.json
> > > @@ -1295,6 +1295,29 @@
> > >         '*swap-opt-cmd': 'bool'
> > >     } }
> > > +##
> > > +# @HotKeyMod:
> > > +#
> > > +# Set of modifier keys that need to be held for shortcut key actions.
> > > +#
> > > +# Since: 7.1
> > > +##
> > > +{ 'enum'  : 'HotKeyMod',
> > > +  'data'  : [ 'lctrl-lalt', 'lshift-lctrl-lalt', 'rctrl' ] }
> > 
> > I have a somewhat uneasy feeling about encoding what is essentially a
> > subset of the sets of modifier keys as an enumeration, but it's what we
> > have to do to QAPIfy existing grab-mod.
> 
> Well, that's exactly what you suggested here:
> 
>  https://lists.gnu.org/archive/html/qemu-devel/2022-05/msg03401.html
> 
> So I really don't understand your uneasy feeling now?

I think we should consider what happens if we want to allow arbitrary
key combinations in future, consisting of one or more modifiers together
witha non-modifier key. For example CtrlL+ShiftL+F12.  We won't want
to be expressing the combinatorial expansion of all possible key
combinations as an enum.  Instead I think we would want to have an
enum for keycode names and accept an array of them. We already
have QKeyCode, so for SDL grab sequence we need to accept an
arrray of QKeyCode.

  { 'struct'  : 'DisplaySDL',
    'data'    : { '*grab-mod'   : [ 'QKeyCode' ] }

Good for QMP but not entirely pretty on the CLI. But we need back
compat for existing CLI syntax too, so we would have to use an
alternate allowing plain string for the legacy key codes combinations.

IOW we end up needing

   { 'alternate': 'SDLGrabSeq',
     'data': { 'grab-mod': 'HotKeyMod',
               'grab-keys: [ 'QKeyCode' ] } }

  { 'struct'  : 'DisplaySDL',
    'data'    : { '*grab-mod' : [ 'SDLGrabSeq' ] }

deprecating 'grab-mod' for a while, eventually leaving just the
first example above.

Since  IIUC, we can retrofit the alternate after the fact if we
decide to allow arbitrary key combos, it means we could safely
start with what Thomas proposes

  { 'struct'  : 'DisplaySDL',
    'data'    : { '*grab-mod' : 'HotKeyMod' }

and worry about the more general solution another day/month/year

> 
> ...
> > > diff --git a/softmmu/vl.c b/softmmu/vl.c
> > > index 57ab9d5322..484e9d9921 100644
> > > --- a/softmmu/vl.c
> > > +++ b/softmmu/vl.c
> > > @@ -1056,75 +1056,7 @@ static void parse_display(const char *p)
> > >           exit(0);
> > >       }
> > > -    if (strstart(p, "sdl", &opts)) {
> > > -        /*
> > > -         * sdl DisplayType needs hand-crafted parser instead of
> > > -         * parse_display_qapi() due to some options not in
> > > -         * DisplayOptions, specifically:
> > > -         *   - ctrl_grab + alt_grab
> > > -         *     They can't be moved into the QAPI since they use underscores,
> > > -         *     thus they will get replaced by "grab-mod" in the long term
> > > -         */
> > > -#if defined(CONFIG_SDL)
> > > -        dpy.type = DISPLAY_TYPE_SDL;
> > > -        while (*opts) {
> > > -            const char *nextopt;
> > > -
> > > -            if (strstart(opts, ",grab-mod=", &nextopt)) {
> > > -                opts = nextopt;
> > > -                if (strstart(opts, "lshift-lctrl-lalt", &nextopt)) {
> > > -                    alt_grab = 1;
> > > -                } else if (strstart(opts, "rctrl", &nextopt)) {
> > > -                    ctrl_grab = 1;
> > > -                } else {
> > > -                    goto invalid_sdl_args;
> > > -                }
> > > -            } else if (strstart(opts, ",window-close=", &nextopt)) {
> > > -                opts = nextopt;
> > > -                dpy.has_window_close = true;
> > > -                if (strstart(opts, "on", &nextopt)) {
> > > -                    dpy.window_close = true;
> > > -                } else if (strstart(opts, "off", &nextopt)) {
> > > -                    dpy.window_close = false;
> > > -                } else {
> > > -                    goto invalid_sdl_args;
> > > -                }
> > > -            } else if (strstart(opts, ",show-cursor=", &nextopt)) {
> > > -                opts = nextopt;
> > > -                dpy.has_show_cursor = true;
> > > -                if (strstart(opts, "on", &nextopt)) {
> > > -                    dpy.show_cursor = true;
> > > -                } else if (strstart(opts, "off", &nextopt)) {
> > > -                    dpy.show_cursor = false;
> > > -                } else {
> > > -                    goto invalid_sdl_args;
> > > -                }
> > > -            } else if (strstart(opts, ",gl=", &nextopt)) {
> > > -                opts = nextopt;
> > > -                dpy.has_gl = true;
> > > -                if (strstart(opts, "on", &nextopt)) {
> > > -                    dpy.gl = DISPLAYGL_MODE_ON;
> > > -                } else if (strstart(opts, "core", &nextopt)) {
> > > -                    dpy.gl = DISPLAYGL_MODE_CORE;
> > > -                } else if (strstart(opts, "es", &nextopt)) {
> > > -                    dpy.gl = DISPLAYGL_MODE_ES;
> > > -                } else if (strstart(opts, "off", &nextopt)) {
> > > -                    dpy.gl = DISPLAYGL_MODE_OFF;
> > > -                } else {
> > > -                    goto invalid_sdl_args;
> > > -                }
> > > -            } else {
> > > -            invalid_sdl_args:
> > > -                error_report("invalid SDL option string");
> > > -                exit(1);
> > > -            }
> > > -            opts = nextopt;
> > > -        }
> > > -#else
> > > -        error_report("SDL display supported is not available in this binary");
> > > -        exit(1);
> > > -#endif
> > 
> > When CONFIG_SDL is off, the error message changes from
> > 
> >      qemu-system-x86_64: -display sdl: SDL display supported is not available in this binary
> > 
> > to
> > 
> >      qemu-system-x86_64: -display sdl: Parameter 'type' does not accept value 'sdl'
> > 
> > I don't mind, but I'd suggest to mention it in the commit message.
> 
> I can do that if I have to respin this series for some other reasons.
> Otherwise, I don't think this really severe enough to justify a v4.
> 
> > 
> > Reviewed-by: Markus Armbruster <armbru@redhat.com>
> > 
> 
> Thanks!
> 
>  Thomas
> 
> 

With regards,
Daniel
-- 
|: https://berrange.com      -o-    https://www.flickr.com/photos/dberrange :|
|: https://libvirt.org         -o-            https://fstop138.berrange.com :|
|: https://entangle-photo.org    -o-    https://www.instagram.com/dberrange :|


