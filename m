Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9204C638915
	for <lists+qemu-devel@lfdr.de>; Fri, 25 Nov 2022 12:53:01 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1oyXEq-0004kt-Dv; Fri, 25 Nov 2022 06:51:25 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <farosas@suse.de>) id 1oyXEi-0004kZ-PJ
 for qemu-devel@nongnu.org; Fri, 25 Nov 2022 06:51:17 -0500
Received: from smtp-out2.suse.de ([195.135.220.29])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <farosas@suse.de>) id 1oyXEV-0002eW-Od
 for qemu-devel@nongnu.org; Fri, 25 Nov 2022 06:51:09 -0500
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id 01CEA1FD63;
 Fri, 25 Nov 2022 11:51:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1669377060; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=aPke2Zzu4nfrO3cikB15AHewqcPeTtfB5H0X2Dr9w04=;
 b=p6XOhLA5yAFogEwqrvrgHmg9gLESObo63JZWPHRUkSn+pZi4L+PnPEiCh5m95E012FXUCE
 TYtVxZU7tmusc+XRPtdLaGxNl3YsTSKL5J8mTDGraXRfaCHtTeLDSxKuJ+zUII/EydBYb0
 8EOfQIxwsZkLx3fowVJqi2gugrxKWEI=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1669377060;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=aPke2Zzu4nfrO3cikB15AHewqcPeTtfB5H0X2Dr9w04=;
 b=acLN5A7wI0OmdoOBXOth6A1iDd4nFo9llsxT074VW7paFP9DDWxwXaSsjx6CMsHDA5/lOQ
 HT4cZEZ+gUFAcwCw==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 7ACB31361C;
 Fri, 25 Nov 2022 11:50:59 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id lLeRDyOsgGOBFwAAMHmgww
 (envelope-from <farosas@suse.de>); Fri, 25 Nov 2022 11:50:59 +0000
From: Fabiano Rosas <farosas@suse.de>
To: Gerd Hoffmann <kraxel@redhat.com>, Claudio Fontana <cfontana@suse.de>
Cc: qemu-devel <qemu-devel@nongnu.org>
Subject: Re: guest Linux Kernel hangs and reports CPU lockup/stuck gitlab bug
In-Reply-To: <20220921104728.via2xl7dbqhhdyib@sirius.home.kraxel.org>
References: <7d54c218-fc66-b65f-4cc3-915d2ec23a0e@suse.de>
 <20220921104728.via2xl7dbqhhdyib@sirius.home.kraxel.org>
Date: Fri, 25 Nov 2022 08:50:56 -0300
Message-ID: <87h6yn1cdb.fsf@suse.de>
MIME-Version: 1.0
Content-Type: text/plain
Received-SPF: pass client-ip=195.135.220.29; envelope-from=farosas@suse.de;
 helo=smtp-out2.suse.de
X-Spam_score_int: -43
X-Spam_score: -4.4
X-Spam_bar: ----
X-Spam_report: (-4.4 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_MED=-2.3, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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

Gerd Hoffmann <kraxel@redhat.com> writes:

> On Wed, Sep 21, 2022 at 11:55:01AM +0200, Claudio Fontana wrote:
>> Hi,
>> 
>> I think this bug report warrants some attention,
>> 
>> can Gerd take a look here?
>> 
>> The GTK Clipboard commit seems involved:
>> 
>> https://gitlab.com/qemu-project/qemu/-/issues/1150
>
> Had a very quick look.  Seems gtk_clipboard_wait_is_text_available()
> blocks forever for some reason.  Not sure why.  Possibly a gtk bug.
>
> The options I see are:
>   (a) go debug why it hangs.
>   (b) rewrite clipboard support to avoid using the
>       gtk_clipboard_wait*() functions.
>   (c) add a config option to turn off gtk clipboard support.
>
> Don't have the time to dig deeper right now, sorry.

Hi Gerd,

I spent some time looking at this, perhaps it could be of help:

I'm using this reproducer:

1) Run a graphical guest with:
 -display gtk -net user,hostfwd=tcp:127.0.0.1:50022-:22 -net nic

2) From the host, connect via ssh:
 ssh -X -p 50022 <user>@127.0.0.1

3) Run xclip via ssh:
 echo "foo" | xclip -selection c -i

The QEMU process, the ssh client and anything that tries to access the
clipboard on the host will hang for 30s.

It seems that QEMU is waiting for the clipboard owner to respond to a
selection request:

#0  _gdk_x11_display_convert_selection (display=0x55e490da5010, requestor=0x55e491917c30, selection=0x1, target=0x92, time=457372390) at gdkselection-x11.c:189
#1  0x00007f482bcc1dbb in gtk_selection_convert (widget=0x55e490de84b0, selection=0x1, target=0x92, time_=457372390) at gtkselection.c:1210
#2  0x00007f482bda3848 in gtk_clipboard_wait_for_contents (clipboard=clipboard@entry=0x55e49100f480, target=0x92) at gtkclipboard.c:1429
#3  0x00007f482bda3dff in gtk_clipboard_wait_is_text_available (clipboard=0x55e49100f480) at gtkclipboard.c:1720
#4  0x000055e48f003bde in gd_owner_change (clipboard=0x55e49100f480, event=0x55e49105f970, data=0x55e490fc4200) at ../ui/gtk-clipboard.c:173
#5  0x00007f482d52c973 in g_closure_invoke () at /usr/lib64/libgobject-2.0.so.0
#6  0x00007f482d540a7e in  () at /usr/lib64/libgobject-2.0.so.0
#7  0x00007f482d54a684 in g_signal_emit_valist () at /usr/lib64/libgobject-2.0.so.0
#8  0x00007f482d54b11f in g_signal_emit () at /usr/lib64/libgobject-2.0.so.0
#9  0x00007f482bda423c in _gtk_clipboard_handle_event (event=<optimized out>) at gtkclipboard.c:2031
#10 0x00007f482bc3b8fd in gtk_main_do_event (event=0x55e49105f970) at gtkmain.c:1709
#11 0x00007f482b72b195 in _gdk_event_emit (event=event@entry=0x55e49105f970) at gdkevents.c:73
#12 0x00007f482b75d482 in gdk_event_source_dispatch (source=<optimized out>, callback=<optimized out>, user_data=<optimized out>) at gdkeventsource.c:367
#13 0x00007f482d23a7fb in g_main_context_dispatch () at /usr/lib64/libglib-2.0.so.0
#14 0x000055e48f4917e1 in glib_pollfds_poll () at ../util/main-loop.c:297
#15 0x000055e48f49185b in os_host_main_loop_wait (timeout=15269231) at ../util/main-loop.c:320
#16 0x000055e48f491960 in main_loop_wait (nonblocking=0) at ../util/main-loop.c:606
#17 0x000055e48ef75f09 in qemu_main_loop () at ../softmmu/runstate.c:739
#18 0x000055e48ecf2d57 in qemu_default_main () at ../softmmu/main.c:37
#19 0x000055e48ecf2d8d in main (argc=19, argv=0x7ffc10c184c8) at ../softmmu/main.c:48

The last thing the X11 server sends is:

113.10: Client 1 -->   24 bytes
         ............REQUEST: ConvertSelection
                   requestor: WIN 03c00b9b      <--- qemu window
                   selection: <CLIPBOARD>
                      target: ATM 00000201
                    property: ATM 00000185
                        time: TIM 1b3500de

However, the clipboard owner is an entity inside the guest (due to
ssh -X) and it can never reply because the guest is paused.

So the GTK waits until IDLE_ABORT_TIME, i.e. 30 iterations of
gtk_selection_retrieval_timeout (1000 ms).

I'm not familiar with the gtk code, but I understand from the
documentation that we would want to use gtk_clipboard_request_contents,
which allows for a callback when the text is actually available (i.e.,
the clipboard owner has eventually replied).

Naively, I'm thinking we could replace gd_clipboard_request with
gtk_clipboard_request_contents and pass qemu_clipboard_set_data as the
callback. But I haven't experimented with it. Let me know if any of this
makes sense and I could give it a shot.

Thanks!

>
> take care,
>   Gerd

