Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 01C81690B57
	for <lists+qemu-devel@lfdr.de>; Thu,  9 Feb 2023 15:07:51 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pQ7ZU-00073K-1M; Thu, 09 Feb 2023 09:06:44 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1pQ7ZR-00072z-JE
 for qemu-devel@nongnu.org; Thu, 09 Feb 2023 09:06:41 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1pQ7ZP-0007rC-Be
 for qemu-devel@nongnu.org; Thu, 09 Feb 2023 09:06:41 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1675951598;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=PI41cjApvkQyOOse8Y3Wf5wohdJ1UWChsiUePvRDBi4=;
 b=V7NxSOQpsHdIUhM/F2k+nYtZQta+oCnHFQ4Hq1GEZURgTNFxfZVVk0EFtESh/Od/wg9mWJ
 6Zler81PsqdYLI71iAkBOzFzoxY5OWmYQJCOhlgRLvT12zWtrbUHQH/mfhMiCw0Nj5Udsf
 xXVzNUw6O50VzXjYeyCeSpOXFX2uUao=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-503-kHHKX2JmOoGtWHGuJXTSgw-1; Thu, 09 Feb 2023 09:06:35 -0500
X-MC-Unique: kHHKX2JmOoGtWHGuJXTSgw-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.rdu2.redhat.com
 [10.11.54.4])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 368071875042;
 Thu,  9 Feb 2023 14:06:33 +0000 (UTC)
Received: from redhat.com (unknown [10.33.36.65])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id E7CB52026D68;
 Thu,  9 Feb 2023 14:06:30 +0000 (UTC)
Date: Thu, 9 Feb 2023 14:06:28 +0000
From: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
To: Het Gala <het.gala@nutanix.com>
Cc: qemu-devel@nongnu.org, prerna.saxena@nutanix.com, quintela@redhat.com,
 dgilbert@redhat.com, pbonzini@redhat.com, armbru@redhat.com,
 eblake@redhat.com, manish.mishra@nutanix.com,
 aravind.retnakaran@nutanix.com
Subject: Re: [PATCH v2 4/6] migration: Avoid multiple parsing of uri in
 migration code flow
Message-ID: <Y+T95ChV/BW09/pN@redhat.com>
References: <20230208093600.242665-1-het.gala@nutanix.com>
 <20230208093600.242665-5-het.gala@nutanix.com>
 <Y+TicReIdgA9P6q3@redhat.com>
 <fbc3dc05-181b-9a13-1707-a42227eb0824@nutanix.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <fbc3dc05-181b-9a13-1707-a42227eb0824@nutanix.com>
User-Agent: Mutt/2.2.9 (2022-11-12)
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.4
Received-SPF: pass client-ip=170.10.129.124; envelope-from=berrange@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

On Thu, Feb 09, 2023 at 07:24:48PM +0530, Het Gala wrote:
> 
> On 09/02/23 5:39 pm, Daniel P. Berrangé wrote:
> > On Wed, Feb 08, 2023 at 09:35:58AM +0000, Het Gala wrote:
> > > In existing senario, 'migrate' QAPI argument - string uri, is encoded
> > > twice to extract migration parameters for stream connection. This is
> > > not a good representation of migration wire protocol as it is a data
> > > encoding scheme within a data encoding scheme. Qemu should be able to
> > > directly work with results from QAPI without having to do a second
> > > level parsing.
> > > Modified 'migrate' QAPI design supports well defined MigrateChannel
> > > struct which plays important role in avoiding double encoding
> > > of uri strings.
> > > 
> > > qemu_uri_parsing() parses uri string (kept for backward
> > > compatibility) and populate the MigrateChannel struct parameters.
> > > Migration code flow for all required migration transport types -
> > > socket, exec and rdma is modified.
> > > 
> > > Suggested-by: Daniel P. Berrange<berrange@redhat.com>
> > > Suggested-by: Manish Mishra<manish.mishra@nutanix.com>
> > > Suggested-by: Aravind Retnakaran<aravind.retnakaran@nutanix.com>
> > > Signed-off-by: Het Gala<het.gala@nutanix.com>
> > > ---
> > >   migration/exec.c      | 31 ++++++++++++++++--
> > >   migration/exec.h      |  4 ++-
> > >   migration/migration.c | 75 +++++++++++++++++++++++++++++++++++--------
> > >   migration/rdma.c      | 30 +++++------------
> > >   migration/rdma.h      |  3 +-
> > >   migration/socket.c    | 21 ++++--------
> > >   migration/socket.h    |  3 +-
> > >   7 files changed, 110 insertions(+), 57 deletions(-)
> > > 
> > > diff --git a/migration/exec.c b/migration/exec.c
> > > index 375d2e1b54..4fa9819792 100644
> > > --- a/migration/exec.c
> > > +++ b/migration/exec.c
> > > @@ -23,14 +23,39 @@
> > >   #include "migration.h"
> > >   #include "io/channel-command.h"
> > >   #include "trace.h"
> > > +#include "qapi/error.h"
> > > -void exec_start_outgoing_migration(MigrationState *s, const char *command, Error **errp)
> > > +void init_exec_array(strList *command, const char *argv[], Error **errp)
> > > +{
> > > +    int i = 0;
> > > +    strList *lst;
> > > +
> > > +    for (lst = command; lst ; lst = lst->next) {
> > > +        argv[i++] = lst->value;
> > > +    }
> > > +
> > > +    /*
> > > +     * Considering exec command always has 3 arguments to execute
> > > +     * a command directly from the bash itself.
> > > +     */
> > > +    if (i > 3) {
> > > +        error_setg(errp, "exec accepts maximum of 3 arguments in the list");
> > > +        return;
> > > +    }
> > By the time this check fires, the for() loop above has already
> > done out of bounds writes on argv[].
> Ack. check should be before for loop.
> > > +
> > > +    argv[i] = NULL;
> > > +    return;
> > > +}
> > > +
> > > +void exec_start_outgoing_migration(MigrationState *s, strList *command,
> > > +                                   Error **errp)
> > >   {
> > >       QIOChannel *ioc;
> > > -    const char *argv[] = { "/bin/sh", "-c", command, NULL };
> > > +    const char *argv[4];
> > > +    init_exec_array(command, argv, errp);
> > If someone invokes 'migrate' with the old URI style, the
> > strList will be 3 elements, and thus argv[4] is safe.
> > 
> > If someone invokes 'migrate' with thue new MigrateChannel style,
> > the strList can be arbitrarily long and thus argv[4] will be
> > risk of overflow.
> 
> Okay, Can you give me an example where strList can be very long in the new
> MigrateChannel ? because in that case,

The new MigrateAddress struct allows the user to have arbitrary
command args, so for example I would expect to be able to do


 { "execute": "migrate",
     "arguments": {
         "channel": { "channeltype": "main",
                      "addr": { "transport": "exec",
                                "exec": ["/bin/ssh",
				         "-p", "6000",
					 "-l", "root",
					 "-o", "CheckHostIP=no",
					 "-o", "ConnectTimeout=15",
                                         "somehost" ] } } } }



> 
> trace_migration_exec_outgoing(argv[2]);
> 
> will also be not correct right. Will have to come up with something that is
> dynamic ?

Yes, that will need addressing too.

We already need to convert from strList to char ** in order
to call qio_channel_command_new_spawn.

Given that, you can use g_strjoinv(" ", argv) to generate a
combined string that can be given to the trace func.


With regards,
Daniel
-- 
|: https://berrange.com      -o-    https://www.flickr.com/photos/dberrange :|
|: https://libvirt.org         -o-            https://fstop138.berrange.com :|
|: https://entangle-photo.org    -o-    https://www.instagram.com/dberrange :|


