Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B9C9B702C86
	for <lists+qemu-devel@lfdr.de>; Mon, 15 May 2023 14:18:20 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pyX9F-0002AS-D9; Mon, 15 May 2023 08:17:57 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1pyX96-0002AI-G7
 for qemu-devel@nongnu.org; Mon, 15 May 2023 08:17:44 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1pyX8q-0007uy-Lz
 for qemu-devel@nongnu.org; Mon, 15 May 2023 08:17:44 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1684153047;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=jMvNWBly5+HwyElRRe8Q1v/EpryjVbjasS5PdD+Z9g8=;
 b=g359I24zrTMh+LwZtSOaSesB4Pyl1R5bB1UHjnHXtASqTRpCrmGOrlU14vI+hUb4MwkEPr
 KBNUDHui0CwNrib2j2kkx5qzpQ4OVo5TNiOlx2QpSkIBqfh/VfNWEwIuZKjgVqpS0AnW5O
 I/LrqfftFKeKSiZTVBziQdS7p6hXEyQ=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-620-bbfmVSMHOXmMIufv5fHfJw-1; Mon, 15 May 2023 08:17:24 -0400
X-MC-Unique: bbfmVSMHOXmMIufv5fHfJw-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.rdu2.redhat.com
 [10.11.54.8])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 26A2B800047;
 Mon, 15 May 2023 12:17:23 +0000 (UTC)
Received: from redhat.com (unknown [10.42.28.48])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 10201C164E9;
 Mon, 15 May 2023 12:17:20 +0000 (UTC)
Date: Mon, 15 May 2023 13:17:17 +0100
From: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
To: Juan Quintela <quintela@redhat.com>
Cc: Het Gala <het.gala@nutanix.com>, qemu-devel@nongnu.org,
 prerna.saxena@nutanix.com, dgilbert@redhat.com, pbonzini@redhat.com,
 armbru@redhat.com, eblake@redhat.com, manish.mishra@nutanix.com,
 aravind.retnakaran@nutanix.com
Subject: Re: [PATCH v4 2/8] migration: Converts uri parameter into
 'MigrateAddress' struct
Message-ID: <ZGIizZKhraDNNtak@redhat.com>
References: <20230512143240.192504-1-het.gala@nutanix.com>
 <20230512143240.192504-3-het.gala@nutanix.com>
 <ZGIFmofD8CPJVM/g@redhat.com>
 <5351a3e1-e2e5-9c30-431c-0ce6fff4c0c7@nutanix.com>
 <87ttwdzu40.fsf@secure.mitica>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <87ttwdzu40.fsf@secure.mitica>
User-Agent: Mutt/2.2.9 (2022-11-12)
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.8
Received-SPF: pass client-ip=170.10.133.124; envelope-from=berrange@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 SPF_HELO_NONE=0.001, T_SCC_BODY_TEXT_LINE=-0.01,
 T_SPF_TEMPERROR=0.01 autolearn=ham autolearn_force=no
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

On Mon, May 15, 2023 at 01:55:59PM +0200, Juan Quintela wrote:
> Het Gala <het.gala@nutanix.com> wrote:
> v> Just so that, there is a wider attention, I will try to address and
> > discuss the comments from Daniel and Juan both here, as many of them
> > seems to be overlapping. I hope that is fine with the maintainers.
> >
> > On 15/05/23 3:42 pm, Daniel P. Berrangé wrote:
> >> On Fri, May 12, 2023 at 02:32:34PM +0000, Het Gala wrote:
> >>> This patch introduces code that can parse 'uri' string parameter and
> >>> spit out 'MigrateAddress' struct. All the required migration parameters
> >>> are stored in the struct.
> >>>
> >>> Suggested-by: Aravind Retnakaran <aravind.retnakaran@nutanix.com>
> >>> Signed-off-by: Het Gala <het.gala@nutanix.com>
> >>> ---
> >>>   migration/migration.c | 63 +++++++++++++++++++++++++++++++++++++++++--
> >>>   1 file changed, 61 insertions(+), 2 deletions(-)
> >>>
> >>> diff --git a/migration/migration.c b/migration/migration.c
> >>> index 0ee07802a5..a7e4e286aa 100644
> >>> --- a/migration/migration.c
> >>> +++ b/migration/migration.c
> >>> @@ -64,6 +64,7 @@
> >>>   #include "yank_functions.h"
> >>>   #include "sysemu/qtest.h"
> >>>   #include "options.h"
> >>> +#include "qemu/sockets.h"
> >>>     static NotifierList migration_state_notifiers =
> >>>       NOTIFIER_LIST_INITIALIZER(migration_state_notifiers);
> >>> @@ -408,13 +409,58 @@ void migrate_add_address(SocketAddress *address)
> >>>                         QAPI_CLONE(SocketAddress, address));
> >>>   }
> >>>   +static bool migrate_uri_parse(const char *uri,
> >>> +                              MigrateAddress **channel,
> >>> +                              Error **errp)
> >>> +{
> >>> +    Error *local_err = NULL;
> >>> +    MigrateAddress *addrs = g_new0(MigrateAddress, 1);
> >>> +    SocketAddress *saddr;
> >>> +    InetSocketAddress *isock = &addrs->u.rdma;
> >>> +    strList **tail = &addrs->u.exec.args;
> >>> +
> >>> +    if (strstart(uri, "exec:", NULL)) {
> >>> +        addrs->transport = MIGRATE_TRANSPORT_EXEC;
> >>> +        QAPI_LIST_APPEND(tail, g_strdup("/bin/sh"));
> >>> +        QAPI_LIST_APPEND(tail, g_strdup("-c"));
> >>> +        QAPI_LIST_APPEND(tail, g_strdup(uri + strlen("exec:")));
> >>> +    } else if (strstart(uri, "rdma:", NULL) &&
> >>> +               !inet_parse(isock, uri + strlen("rdma:"), errp)) {
> >>> +        addrs->transport = MIGRATE_TRANSPORT_RDMA;
> >> I would have this as
> >>
> >>      } else if (strstart(uri, "rdma:", NULL)) {
> >>          if (inet_parse(isock, uri + strlen("rdma:"), errp)) {
> >>              addrs->transport = MIGRATE_TRANSPORT_RDMA;
> >> 	}
> >>
> >> as IMHO it is bad practice to have control pass to the next
> >> else if clause when inet_parse() fails, as we know this is
> >> only an RDMA addr
> > Ack. I will change in the next patch.
> >> Also you need to use '&local_err' not 'errp' in the inet_parse
> >> call, otherwise the later code block for cleanup won't run.
> >
> > Yes, thanks for pointing it out Daniel. Will modify that.
> >
> > Also, Juan is of the opinion that we could omit 'local_error' variable
> > and try to address and free the memory there itself. For ex:
> >
> > if (saddr == NULL) {
> >     qapi_free_MigrateAddress(addrs);
> >     return false;
> > }
> >
> > Or, Daniel, can I also define here the variables like you suggested
> > down in the patch ? or is it used in some special case or I am missing
> > something ?
> >
> > g_autoptr(MigrateAddress) addrs = g_new0(MigrateAddress, 1);
> >
> > So we would not have to worry to free MigrateAddress struct.
> 
> https://blogs.gnome.org/desrt/2015/01/30/g_autoptr/
> 
> Yes, but that only happens for the cases where you want to always remove
> them.
> 
> >>> +    } else if (strstart(uri, "tcp:", NULL) ||
> >>> +                strstart(uri, "unix:", NULL) ||
> >>> +                strstart(uri, "vsock:", NULL) ||
> >>> +                strstart(uri, "fd:", NULL)) {
> >>> +        addrs->transport = MIGRATE_TRANSPORT_SOCKET;
> >>> +        saddr = socket_parse(uri, &local_err);
> >>> +        addrs->u.socket = *saddr;
> >> Protect with
> >>
> >>     if (saddr != NULL) {
> >>         addrs->u.socket = *saddr;
> >>     }
> >>
> >>> +    }
> >>> +
> >>> +    if (local_err) {
> >>> +        qapi_free_MigrateAddress(addrs);
> >>> +        qapi_free_SocketAddress(saddr);
> >>> +        qapi_free_InetSocketAddress(isock);
> >>> +        error_propagate(errp, local_err);
> >>> +        return false;
> >>> +    }
> >>> +
> >>> +    *channel = addrs;
> >>> +    return true;
> >>> +}
> >>> +
> >>>   static void qemu_start_incoming_migration(const char *uri, Error **errp)
> >>>   {
> >>>       const char *p = NULL;
> >>> +    MigrateAddress *channel = g_new0(MigrateAddress, 1);
> >> Avoid the later 'out:' cleanup block by using:
> >>
> >>    g_autoptr(MigrateAddress) channel = g_new0(MigrateAddress, 1);
> > Ack. I think this also solves the doubt raised by Juan "I wish, I
> > really wish, that there was a way to free things on error". Am I right
> > ?
> 
> No, that was the case where we have something like:
> 
> Thing *foo(void)
> {
>     OtherThing *bar = g_new0(OtherThing, 1)
> 
>     if (whatever) {
>         goto error;
>     }
>     if (whatever_else) {
>         goto error;
>     }
>     return bar;
> error:
>     g_free(bad);
>     return NULL;
> }
[> 
> See, we have to put the goto because we have to free it in all error
> paths.  Not in the non-error path.
> 
> If it is a pure local variable, i.e. never used after the function
> finishes, then g_autoptr is the right thing to do.

It is still better to use g_autoptr even in that case. You just need
to add in a call to g_steal_pointer in the success path. eg

 Thing *foo(void)
 {
     g_autoptr(OtherThing) bar = g_new0(OtherThing, 1)
 
     if (whatever) {
         return NULL;
     }
     if (whatever_else) {
         return NULL;
     }
     return g_steal_pointer(&bar);
 }


g_steal_pointer(&bar) is the equivalent of doing


    OtherThing *tmp = bar;
    bar = NULL;
    return tmp;

thus avoiding free'ing the pointer you're returning

With regards,
Daniel
-- 
|: https://berrange.com      -o-    https://www.flickr.com/photos/dberrange :|
|: https://libvirt.org         -o-            https://fstop138.berrange.com :|
|: https://entangle-photo.org    -o-    https://www.instagram.com/dberrange :|


