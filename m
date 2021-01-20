Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0ED572FD59B
	for <lists+qemu-devel@lfdr.de>; Wed, 20 Jan 2021 17:29:58 +0100 (CET)
Received: from localhost ([::1]:55726 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l2GMn-00022a-3k
	for lists+qemu-devel@lfdr.de; Wed, 20 Jan 2021 11:29:57 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:34148)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgilbert@redhat.com>)
 id 1l2GJ4-0008O6-2i
 for qemu-devel@nongnu.org; Wed, 20 Jan 2021 11:26:06 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:47211)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <dgilbert@redhat.com>)
 id 1l2GIx-0006jZ-I5
 for qemu-devel@nongnu.org; Wed, 20 Jan 2021 11:26:05 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1611159958;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=/hlIX/zf3vSfAUBTlG6vlVBogpAUCrBQ2lHCz47GaGc=;
 b=iE7W8bmDLzCznLyk0pcUPiiyAKeEXei/y+l2PlljHNVfUboQoouTnTLOZiT7uLKKSvXXq0
 SmMrwRthXyZUceLSj3uxZdhudUl9Zt6dksbSWaP72IauHQ7MIhZWl0z4YX168H5fdFIGhr
 7dvr9dH/l/PKBsxu6r17QlTgkJSKfNQ=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-408-DGVMiK1DMtSC_IWO_9sLow-1; Wed, 20 Jan 2021 11:25:56 -0500
X-MC-Unique: DGVMiK1DMtSC_IWO_9sLow-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 3E47D180A09F;
 Wed, 20 Jan 2021 16:25:54 +0000 (UTC)
Received: from work-vm (ovpn-115-106.ams2.redhat.com [10.36.115.106])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id DFA3B6B8DA;
 Wed, 20 Jan 2021 16:25:46 +0000 (UTC)
Date: Wed, 20 Jan 2021 16:25:44 +0000
From: "Dr. David Alan Gilbert" <dgilbert@redhat.com>
To: Gerd Hoffmann <kraxel@redhat.com>
Subject: Re: [PATCH v2 3/3] console: make QMP/HMP screendump run in coroutine
Message-ID: <20210120162544.GG2930@work-vm>
References: <20201027133602.3038018-1-marcandre.lureau@redhat.com>
 <20201027133602.3038018-4-marcandre.lureau@redhat.com>
 <20210120141800.73j3xdew7ahvdewg@sirius.home.kraxel.org>
 <CAJ+F1CKVU2_c9n0NbOxZVnxw0e99aamsEpQPXQKJZ-t4+9S0Fg@mail.gmail.com>
 <20210120160947.6nta7ghzn444ya6f@sirius.home.kraxel.org>
MIME-Version: 1.0
In-Reply-To: <20210120160947.6nta7ghzn444ya6f@sirius.home.kraxel.org>
User-Agent: Mutt/1.14.6 (2020-07-11)
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=dgilbert@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=63.128.21.124; envelope-from=dgilbert@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.167,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Kevin Wolf <kwolf@redhat.com>,
 =?iso-8859-1?Q?Marc-Andr=E9?= Lureau <marcandre.lureau@gmail.com>,
 QEMU <qemu-devel@nongnu.org>, Stefan Hajnoczi <stefanha@redhat.com>,
 Markus Armbruster <armbru@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

* Gerd Hoffmann (kraxel@redhat.com) wrote:
> On Wed, Jan 20, 2021 at 06:29:41PM +0400, Marc-André Lureau wrote:
> > Hi Gerd
> > 
> > On Wed, Jan 20, 2021 at 6:18 PM Gerd Hoffmann <kraxel@redhat.com> wrote:
> > >
> > > On Tue, Oct 27, 2020 at 05:36:02PM +0400, marcandre.lureau@redhat.com wrote:
> > > > From: Marc-André Lureau <marcandre.lureau@redhat.com>
> > > >
> > > > Thanks to the monitors' coroutine support (merge commit b7092cda1b3),
> > > > the screendump handler can trigger a graphic_hw_update(), yield and let
> > > > the main loop run until update is done. Then the handler is resumed, and
> > > > ppm_save() will write the screen image to disk in the coroutine context.
> > > >
> > > > The IO is still blocking though, as the file is set blocking so far,
> > > > this could be addressed by some future change (with other caveats).
> > > >
> > > > Related to:
> > > > https://bugzilla.redhat.com/show_bug.cgi?id=1230527
> > > >
> > > > Signed-off-by: Marc-André Lureau <marcandre.lureau@redhat.com>
> > > > Reviewed-by: Gerd Hoffmann <kraxel@redhat.com>
> > >
> > > Hmm, just noticed that with this patch applied screendump hangs for vms
> > > with "-device qxl" ("-device qxl-vga" works fine).
> > >
> > > Can you have a look?
> > 
> > Weird, I cannot reproduce. I tried this way:
> > 
> > $ qemu-system-x86_64 -m 4096 -enable-kvm -device qxl -qmp
> > unix:/tmp/qmp.sock,server -snapshot rhel8
> 
> -vga none or -nodefaults is needed, otherwise you'll get both VGA and
> qxl devices.
> 
> Using gtk ui, just saying "screendump /tmp/x" in the monitor tab.
> 
> > Can you also provide a backtrace?
> 

> Thread 1 (Thread 0x7fab988e4440 (LWP 2822797) "qemu-system-x86"):
> #0  0x00007fab9c8a990e in ppoll () at /lib64/libc.so.6
> #1  0x000055f3f9c33dd5 in fdmon_poll_wait ()
> #2  0x000055f3f9c26c6a in aio_poll ()

> #3  0x000055f3f99552a5 in handle_hmp_command ()

That's the :

1117	        AIO_WAIT_WHILE(qemu_get_aio_context(), !data.done);

Dave

> #4  0x000055f3f99553cd in monitor_command_cb ()
> #5  0x000055f3f9c29a37 in readline_handle_byte ()
> #6  0x000055f3f995541b in monitor_read ()
> #7  0x000055f3f992373c in gd_vc_in ()
> #8  0x00007fab9d84e22d in _vte_marshal_VOID__STRING_UINTv () at /lib64/libvte-2.91.so.0
> #9  0x00007fab9d8e9080 in g_signal_emit_valist () at /lib64/libgobject-2.0.so.0
> #10 0x00007fab9d8e91a3 in g_signal_emit () at /lib64/libgobject-2.0.so.0
> #11 0x00007fab9d858a7e in vte::terminal::Terminal::emit_commit(std::basic_string_view<char, std::char_traits<char> > const&) () at /lib64/libvte-2.91.so.0
> #12 0x00007fab9d85cf1d in vte::terminal::Terminal::send_child(std::basic_string_view<char, std::char_traits<char> > const&) () at /lib64/libvte-2.91.so.0
> #13 0x00007fab9d8715bc in vte_terminal_key_press(_GtkWidget*, _GdkEventKey*) () at /lib64/libvte-2.91.so.0
> #14 0x00007fab9d47eccc in _gtk_marshal_BOOLEAN__BOXEDv () at /lib64/libgtk-3.so.0
> #15 0x00007fab9d8e869a in g_signal_emit_valist () at /lib64/libgobject-2.0.so.0
> #16 0x00007fab9d8e91a3 in g_signal_emit () at /lib64/libgobject-2.0.so.0
> #17 0x00007fab9d441bb4 in gtk_widget_event_internal.part.0.lto_priv () at /lib64/libgtk-3.so.0
> #18 0x00007fab9d45029b in gtk_window_propagate_key_event () at /lib64/libgtk-3.so.0
> #19 0x00007fab9d453283 in gtk_window_key_press_event.lto_priv () at /lib64/libgtk-3.so.0
> #20 0x00007fab9d47eccc in _gtk_marshal_BOOLEAN__BOXEDv () at /lib64/libgtk-3.so.0
> #21 0x00007fab9d8e9080 in g_signal_emit_valist () at /lib64/libgobject-2.0.so.0
> #22 0x00007fab9d8e91a3 in g_signal_emit () at /lib64/libgobject-2.0.so.0
> #23 0x00007fab9d441bb4 in gtk_widget_event_internal.part.0.lto_priv () at /lib64/libgtk-3.so.0
> #24 0x00007fab9d2e000f in propagate_event.lto_priv () at /lib64/libgtk-3.so.0
> #25 0x00007fab9d2e1223 in gtk_main_do_event () at /lib64/libgtk-3.so.0
> #26 0x00007fab9cfbb633 in _gdk_event_emit () at /lib64/libgdk-3.so.0
> #27 0x00007fab9d022ba6 in gdk_event_source_dispatch.lto_priv () at /lib64/libgdk-3.so.0
> #28 0x00007fab9db3296f in g_main_context_dispatch () at /lib64/libglib-2.0.so.0
> #29 0x000055f3f9c24f58 in main_loop_wait ()
> #30 0x000055f3f9a564b1 in qemu_main_loop ()
> #31 0x000055f3f97609ee in main ()
> 
> take care,
>   Gerd
> 
-- 
Dr. David Alan Gilbert / dgilbert@redhat.com / Manchester, UK


