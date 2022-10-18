Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0804A603362
	for <lists+qemu-devel@lfdr.de>; Tue, 18 Oct 2022 21:34:40 +0200 (CEST)
Received: from localhost ([::1]:58936 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oksMF-0004SG-R5
	for lists+qemu-devel@lfdr.de; Tue, 18 Oct 2022 15:34:36 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39676)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1oksA5-0006Dm-5Y
 for qemu-devel@nongnu.org; Tue, 18 Oct 2022 15:22:06 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:28671)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1oks9z-0003JJ-TJ
 for qemu-devel@nongnu.org; Tue, 18 Oct 2022 15:22:00 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1666120913;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:in-reply-to:in-reply-to:  references:references;
 bh=fBQLLjcbbwIwb9j3y2nYMXdo7wfufrBF6vL9sgK+TZI=;
 b=XeG2uUq8mDjEVmpqN5awPqLK8LYDVQIsCaHOPR/h7YvokXe799YQXyELuGyYbu3GxsxNXq
 hSeP9dftwzGOguyMTzCU6cKzr7WN8UHMgZhc3XFJMd1+PDfhxMizv7AtsyaAJmErAsL+Kb
 r6z15J/gYY4rTBphaZmblXGeLmYtyq4=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-461-MXpRC37LNpabYn7rCRnMZg-1; Tue, 18 Oct 2022 15:21:52 -0400
X-MC-Unique: MXpRC37LNpabYn7rCRnMZg-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.rdu2.redhat.com
 [10.11.54.8])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id BBC6D381A727;
 Tue, 18 Oct 2022 19:21:51 +0000 (UTC)
Received: from redhat.com (unknown [10.33.36.73])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id F2238C15BAB;
 Tue, 18 Oct 2022 19:21:50 +0000 (UTC)
Date: Tue, 18 Oct 2022 20:21:48 +0100
From: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
To: Peter Maydell <peter.maydell@linaro.org>
Cc: QEMU Developers <qemu-devel@nongnu.org>,
 =?utf-8?Q?Marc-Andr=C3=A9?= Lureau <marcandre.lureau@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>,
 Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Subject: Re: socket chardevs: data loss when other end closes connection?
Message-ID: <Y078zCODLU5XsJYs@redhat.com>
References: <CAFEAcA9t7ujfVVOdg4m0PBt1DkYY+UpDr2tA_doEb71+r-gfXA@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <CAFEAcA9t7ujfVVOdg4m0PBt1DkYY+UpDr2tA_doEb71+r-gfXA@mail.gmail.com>
User-Agent: Mutt/2.2.7 (2022-08-07)
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.8
Received-SPF: pass client-ip=170.10.129.124; envelope-from=berrange@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -16
X-Spam_score: -1.7
X-Spam_bar: -
X-Spam_report: (-1.7 / 5.0 requ) BAYES_00=-1.9, DKIM_INVALID=0.1,
 DKIM_SIGNED=0.1, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=no autolearn_force=no
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

On Tue, Oct 18, 2022 at 06:55:08PM +0100, Peter Maydell wrote:
> I've been looking at a (long-standing) bug where an avocado test
> intermittently fails.
> 
> This happens because at the avocado end we write "halt\r" to the
> serial console, which is wired up to a Unix socket; but at the UART
> model we only ever see the 'h' character and no further data.  As far
> as I can tell this happens because Avocado closes the socket and the
> QEMU socket chardev layer loses the last few characters of data that
> the guest hasn't yet read at that point.
> 
> This is what seems to me to be going on:
>  * Avocado writes the data ('halt\r') and closes the socket
>    pretty much immediately afterwards
>  * At the glib layer, the socket is polled, and it gets G_IO_IN
>    and G_IO_HUP, indicating "readable, and also closed"
>  * glib's source dispatch mechanism first calls tcp_chr_read()
>    to handle the G_IO_IN part
>  * tcp_chr_read() reads a single byte (the 'h'), because
>    SocketChardev::max_size is 1 (which in turn is because the
>    device model's can_write function returned 1 to say that's
>    all it can accept for now). So there's still data to be
>    read in future
>  * glib now calls tcp_chr_hup() because of the G_IO_HUP (as part
>    of the same handle-all-the-sources loop)
>  * tcp_chr_hup() calls tcp_chr_disconnect(), which basically
>    frees everything, tells the chardev backend that the connection
>    just closed, etc
>  * the data remaining in the socket to be read after the 'h'
>    is never read
> 
> How is this intended to work? I guess the socket ought to go
> into some kind of "disconnecting" state, but not actually do
> a tcp_chr_disconnect() until all the data has been read via
> tcp_chr_read() and it's finally got an EOF indication back from
> tcp_chr_recv() ?

Right, this is basically broken by (lack of) design right now.

The main problem here is that we're watching the socket twice.
One set of callbacks added with io_add_watch_poll, and then
a second callback added with qio_chanel_create_watch just for
G_IO_HUP.

We need there to be only 1 callback, and when that callback
gets  G_IO_IN, it should *ignore* G_IO_HUP until tcp_chr_recv
returns 0 to indicate EOF. This would cause tcp_chr_read to
be invoked repeatedly with G_IO_IN | G_IO_HUP, as we read
"halt\r" one byte at a time.

With regards,
Daniel
-- 
|: https://berrange.com      -o-    https://www.flickr.com/photos/dberrange :|
|: https://libvirt.org         -o-            https://fstop138.berrange.com :|
|: https://entangle-photo.org    -o-    https://www.instagram.com/dberrange :|


