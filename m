Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 067116FDAD9
	for <lists+qemu-devel@lfdr.de>; Wed, 10 May 2023 11:39:32 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pwgHZ-0007by-Ia; Wed, 10 May 2023 05:38:49 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1pwgHX-0007bO-QH
 for qemu-devel@nongnu.org; Wed, 10 May 2023 05:38:47 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1pwgHW-0005Vk-3b
 for qemu-devel@nongnu.org; Wed, 10 May 2023 05:38:47 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1683711524;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=vECjKxNLLx9LXrmYVpMRX3k2RbE503xG3N8OtRsBwxc=;
 b=cZIjsMXTzOTvDsChAxx8zoA8dNd8gvQQe1wmVyCLnxxU6hPK+k3YWyKr66yJu3YTp37J8z
 oYxH1QZG4J0oiqhYwE69Dnk6M+3ow3nLvYwzSIr+wYklnw3P3lYXHSNlzAlz6UNWiXfZa2
 Xf3DJtsEsF1Im0DxmNv6XMfpQdsI0no=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-288-oCAW0OohMSCsxr3wkKXqcg-1; Wed, 10 May 2023 05:38:43 -0400
X-MC-Unique: oCAW0OohMSCsxr3wkKXqcg-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.rdu2.redhat.com
 [10.11.54.5])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 0D0DE802A95
 for <qemu-devel@nongnu.org>; Wed, 10 May 2023 09:38:43 +0000 (UTC)
Received: from redhat.com (unknown [10.42.28.41])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 5431947CD0;
 Wed, 10 May 2023 09:38:42 +0000 (UTC)
Date: Wed, 10 May 2023 10:38:40 +0100
From: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
To: Markus Armbruster <armbru@redhat.com>
Cc: marcandre.lureau@redhat.com, qemu-devel@nongnu.org,
 Paolo Bonzini <pbonzini@redhat.com>
Subject: Re: [PATCH] chardev: report the handshake error
Message-ID: <ZFtmIDzlZw0/Ygtu@redhat.com>
References: <20230510072531.3937189-1-marcandre.lureau@redhat.com>
 <877ctg7csj.fsf@pond.sub.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <877ctg7csj.fsf@pond.sub.org>
User-Agent: Mutt/2.2.9 (2022-11-12)
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.5
Received-SPF: pass client-ip=170.10.133.124; envelope-from=berrange@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

On Wed, May 10, 2023 at 11:31:40AM +0200, Markus Armbruster wrote:
> marcandre.lureau@redhat.com writes:
> 
> > From: Marc-André Lureau <marcandre.lureau@redhat.com>
> >
> > This can help to debug connection issues.
> >
> > Related to:
> > https://bugzilla.redhat.com/show_bug.cgi?id=2196182
> >
> > Signed-off-by: Marc-André Lureau <marcandre.lureau@redhat.com>
> > ---
> >  chardev/char-socket.c | 12 ++++++++++--
> >  1 file changed, 10 insertions(+), 2 deletions(-)
> >
> > diff --git a/chardev/char-socket.c b/chardev/char-socket.c
> > index 8c58532171..e8e3a743d5 100644
> > --- a/chardev/char-socket.c
> > +++ b/chardev/char-socket.c
> > @@ -742,8 +742,12 @@ static void tcp_chr_websock_handshake(QIOTask *task, gpointer user_data)
> >  {
> >      Chardev *chr = user_data;
> >      SocketChardev *s = user_data;
> > +    Error *err = NULL;
> >  
> > -    if (qio_task_propagate_error(task, NULL)) {
> > +    if (qio_task_propagate_error(task, &err)) {
> > +        error_reportf_err(err,
> > +                          "websock handshake of character device %s failed: ",
> > +                          chr->label);
> 
> Code smell: reports an error without failing the function.
> 
> Should it be a warning instead?

Well it isn't a warning, this is a fatal error wrt continued use
of the chardev

Not failing the function is expected in this particular code
pattern. These tcp_chr_(tls,websock)_handshake functions are
callbacks that are used to handle an async operations progress.
From the caller's POV, it doesn't matter whether there is an
error or success. It is upto this function to do whatever is
required based on the status, hence the call to disconnect
the chardev on error:

> >          tcp_chr_disconnect(chr);
> >      } else {
> >          if (s->do_telnetopt) {
> > @@ -778,8 +782,12 @@ static void tcp_chr_tls_handshake(QIOTask *task,
> >  {
> >      Chardev *chr = user_data;
> >      SocketChardev *s = user_data;
> > +    Error *err = NULL;
> >  
> > -    if (qio_task_propagate_error(task, NULL)) {
> > +    if (qio_task_propagate_error(task, &err)) {
> > +        error_reportf_err(err,
> > +                          "TLS handshake of character device %s failed: ",
> > +                          chr->label);
> >          tcp_chr_disconnect(chr);
> >      } else {
> >          if (s->is_websock) {
> 
> Likewise.
> 

With regards,
Daniel
-- 
|: https://berrange.com      -o-    https://www.flickr.com/photos/dberrange :|
|: https://libvirt.org         -o-            https://fstop138.berrange.com :|
|: https://entangle-photo.org    -o-    https://www.instagram.com/dberrange :|


