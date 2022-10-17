Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id ABF62600F7C
	for <lists+qemu-devel@lfdr.de>; Mon, 17 Oct 2022 14:49:28 +0200 (CEST)
Received: from localhost ([::1]:37886 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1okPYd-0008GY-BR
	for lists+qemu-devel@lfdr.de; Mon, 17 Oct 2022 08:49:27 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50200)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1okPLd-0004E1-AP
 for qemu-devel@nongnu.org; Mon, 17 Oct 2022 08:36:06 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:31428)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1okPLM-0001uc-Lp
 for qemu-devel@nongnu.org; Mon, 17 Oct 2022 08:36:00 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1666010138;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=I4jgLpMuohybf/VyGwXHPNwt5ASJMYADfGfkqb+akEE=;
 b=Wx3y4HoSxzC30i+fQ9efkkkVhuHko0zohSxSQ/zgZXAwv7GpkG79evJZ1F9yo45z9Rbd1z
 YUz1CcKz2hsA5jhMMC1EpMkmaqs1uZFo+h/gpFLkWk1GLWkL9ta29iUxlbAYQScWgqH9ry
 /v/fmrvlPftBtTx2aSc2CsxZWABEY3o=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-35-Me7NMBdXOPGlcYryIy1aHA-1; Mon, 17 Oct 2022 08:35:35 -0400
X-MC-Unique: Me7NMBdXOPGlcYryIy1aHA-1
Received: from smtp.corp.redhat.com (int-mx09.intmail.prod.int.rdu2.redhat.com
 [10.11.54.9])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 981A9857D0A;
 Mon, 17 Oct 2022 12:35:34 +0000 (UTC)
Received: from redhat.com (unknown [10.33.36.113])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 014D4409AE3;
 Mon, 17 Oct 2022 12:35:33 +0000 (UTC)
Date: Mon, 17 Oct 2022 13:35:31 +0100
From: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
To: Bin Meng <bmeng.cn@gmail.com>
Cc: qemu-devel@nongnu.org, Bin Meng <bin.meng@windriver.com>
Subject: Re: [PATCH 49/51] io/channel-watch: Fix socket watch on Windows
Message-ID: <Y01ME/r9yzdsiq9b@redhat.com>
References: <20220824094029.1634519-1-bmeng.cn@gmail.com>
 <20220824094029.1634519-50-bmeng.cn@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20220824094029.1634519-50-bmeng.cn@gmail.com>
User-Agent: Mutt/2.2.7 (2022-08-07)
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.9
Received-SPF: pass client-ip=170.10.129.124; envelope-from=berrange@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -16
X-Spam_score: -1.7
X-Spam_bar: -
X-Spam_report: (-1.7 / 5.0 requ) BAYES_00=-1.9, DKIM_INVALID=0.1,
 DKIM_SIGNED=0.1, SPF_PASS=-0.001,
 T_SPF_HELO_TEMPERROR=0.01 autolearn=no autolearn_force=no
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

On Wed, Aug 24, 2022 at 05:40:27PM +0800, Bin Meng wrote:
> From: Bin Meng <bin.meng@windriver.com>
> 
> Random failure was observed when running qtests on Windows due to
> "Broken pipe" detected by qmp_fd_receive(). What happened is that
> the qtest executable sends testing data over a socket to the QEMU
> under test but no response is received. The errno of the recv()
> call from the qtest executable indicates ETIMEOUT, due to the qmp
> chardev's tcp_chr_read() is never called to receive testing data
> hence no response is sent to the other side.
> 
> tcp_chr_read() is registered as the callback of the socket watch
> GSource. The reason of the callback not being called by glib, is
> that the source check fails to indicate the source is ready. There
> are two socket watch sources created to monitor the same socket
> event object from the char-socket backend in update_ioc_handlers().
> During the source check phase, qio_channel_socket_source_check()
> calls WSAEnumNetworkEvents() to discovers occurrences of network
> events for the indicated socket, clear internal network event records,
> and reset the event object. Testing shows that if we don't reset the
> event object by not passing the event handle to WSAEnumNetworkEvents()
> the symptom goes away and qtest runs very stably.
> 
> It looks we don't need to call WSAEnumNetworkEvents() at all, as we
> don't parse the result of WSANETWORKEVENTS returned from this API.
> We use select() to poll the socket status. Fix this instability by
> dropping the WSAEnumNetworkEvents() call.
> 
> Signed-off-by: Bin Meng <bin.meng@windriver.com>
> ---
> During the testing, I removed the following codes in update_ioc_handlers():
> 
>     remove_hup_source(s);
>     s->hup_source = qio_channel_create_watch(s->ioc, G_IO_HUP);
>     g_source_set_callback(s->hup_source, (GSourceFunc)tcp_chr_hup,
>                           chr, NULL);
>     g_source_attach(s->hup_source, chr->gcontext);
> 
> and such change also makes the symptom go away.
> 
> And if I moved the above codes to the beginning, before the call to
> io_add_watch_poll(), the symptom also goes away.
> 
> It seems two sources watching on the same socket event object is
> the key that leads to the instability. The order of adding a source
> watch seems to also play a role but I can't explain why.
> Hopefully a Windows and glib expert could explain this behavior.
> 
>  io/channel-watch.c | 4 ----
>  1 file changed, 4 deletions(-)

Reviewed-by: Daniel P. Berrangé <berrange@redhat.com>

and queued


With regards,
Daniel
-- 
|: https://berrange.com      -o-    https://www.flickr.com/photos/dberrange :|
|: https://libvirt.org         -o-            https://fstop138.berrange.com :|
|: https://entangle-photo.org    -o-    https://www.instagram.com/dberrange :|


