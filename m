Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3C7A65F2F04
	for <lists+qemu-devel@lfdr.de>; Mon,  3 Oct 2022 12:51:31 +0200 (CEST)
Received: from localhost ([::1]:40018 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ofJ2n-0003la-Ot
	for lists+qemu-devel@lfdr.de; Mon, 03 Oct 2022 06:51:29 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:56380)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1ofIts-0006OE-95
 for qemu-devel@nongnu.org; Mon, 03 Oct 2022 06:42:16 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:39345)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1ofItq-0003D1-7j
 for qemu-devel@nongnu.org; Mon, 03 Oct 2022 06:42:15 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1664793732;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=ufFbUf1U/OcPrMH0I4Ti/x2FlYDdvO5/KebJ6X0aL/0=;
 b=RMP2rdaLzH+rz7hiVAEHLrq6o6UMMwRXQAIzNaXTFjKKkJimZTAQJz7SAcPDey4cWJ+/T0
 csHDBooAo2HSP4O+qkBgQ3W0i3s8qAuFh04sxsWS8YfHcmeKjmjC25MoVkdh3jqv6VOa8t
 x4Z1YLkPMuGi5xJjhEXOt44qabZ/5N0=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-35-9xuR7XLIPYuA8kLx2proPA-1; Mon, 03 Oct 2022 06:42:11 -0400
X-MC-Unique: 9xuR7XLIPYuA8kLx2proPA-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.rdu2.redhat.com
 [10.11.54.1])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 75AE03C01DEC
 for <qemu-devel@nongnu.org>; Mon,  3 Oct 2022 10:42:11 +0000 (UTC)
Received: from redhat.com (unknown [10.33.36.10])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id ECEFD40C206B;
 Mon,  3 Oct 2022 10:42:10 +0000 (UTC)
Date: Mon, 3 Oct 2022 11:42:08 +0100
From: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
To: marcandre.lureau@redhat.com
Cc: qemu-devel@nongnu.org
Subject: Re: [PATCH v2 2/3] io/command: implement support for win32
Message-ID: <Yzq8gBg3V/4pdmO0@redhat.com>
References: <20220902111900.3029260-1-marcandre.lureau@redhat.com>
 <20220902111900.3029260-3-marcandre.lureau@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20220902111900.3029260-3-marcandre.lureau@redhat.com>
User-Agent: Mutt/2.2.7 (2022-08-07)
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.1
Received-SPF: pass client-ip=170.10.129.124; envelope-from=berrange@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001,
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
Reply-To: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Fri, Sep 02, 2022 at 03:18:59PM +0400, marcandre.lureau@redhat.com wrote:
> From: Marc-André Lureau <marcandre.lureau@redhat.com>
> 
> This is a fairly straightforward implementation of the equivalent UNIX
> version.
> 
> GLib uses _mkpipe() to setup the FDs. We take that for granted, and set
> the underlying named-pipes to nonblocking. This is done by other
> projects as well (found on github), but I am not confident this works
> reliably (msdn SetNamedPipeHandleState documentation discourage this
> usage).

Well if other projects do this, and our unit tests pass, then that
is good enough for me, until someone complains with an example of
where it fails. It is less broken that today where we disallow
spawn entirely, so wont be a regression regardless :-)

> Alternatively, we could setup the FDs ourself, and use UNIX sockets on
> Windows, which can be used in blocking/non-blocking mode. I haven't
> tried it, as I am not sure it is necessary.

> 
> Signed-off-by: Marc-André Lureau <marcandre.lureau@redhat.com>
> ---
>  io/channel-command.c | 58 ++++++++++++++++++++++++++++----------------
>  1 file changed, 37 insertions(+), 21 deletions(-)

Reviewed-by: Daniel P. Berrangé <berrange@redhat.com>


With regards,
Daniel
-- 
|: https://berrange.com      -o-    https://www.flickr.com/photos/dberrange :|
|: https://libvirt.org         -o-            https://fstop138.berrange.com :|
|: https://entangle-photo.org    -o-    https://www.instagram.com/dberrange :|


