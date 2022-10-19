Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5F33C604D36
	for <lists+qemu-devel@lfdr.de>; Wed, 19 Oct 2022 18:22:44 +0200 (CEST)
Received: from localhost ([::1]:49412 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1olBq7-0006z9-9B
	for lists+qemu-devel@lfdr.de; Wed, 19 Oct 2022 12:22:43 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57586)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1olBXG-0006h5-H2
 for qemu-devel@nongnu.org; Wed, 19 Oct 2022 12:03:58 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:33727)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1olBX6-0001TN-Ji
 for qemu-devel@nongnu.org; Wed, 19 Oct 2022 12:03:10 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1666195383;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=0cX8k7GALKq0CDJpYl5cYWNLruwD6HfJjwaz5IZJF34=;
 b=Fj9cNWeY+7VFHt8hXy2VRW9XALxrdUIf3sxtfQ8b9E4DVUZsv/eTSbaAoJ8tAfK7YKUi3Q
 xmzdLHC1/xITxADpx1RjoIwgmqFAXizgugu6XiybLN20HrAx6r6jFHdrFIobP8g2MCQS15
 JjCftR2zlAmnZho/NR2oi5BmlKixCvs=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-664-FjdUuppLMdGjDIq1iNXr7g-1; Wed, 19 Oct 2022 12:02:59 -0400
X-MC-Unique: FjdUuppLMdGjDIq1iNXr7g-1
Received: from smtp.corp.redhat.com (int-mx10.intmail.prod.int.rdu2.redhat.com
 [10.11.54.10])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id C2C2B2932481;
 Wed, 19 Oct 2022 16:02:58 +0000 (UTC)
Received: from redhat.com (unknown [10.33.36.69])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id E2557492B21;
 Wed, 19 Oct 2022 16:02:57 +0000 (UTC)
Date: Wed, 19 Oct 2022 17:02:55 +0100
From: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
To: Nikolay Borisov <nborisov@suse.com>
Cc: dgilbert@redhat.com, qemu-devel@nongnu.org, jfehlig@suse.com,
 Claudio.Fontana@suse.com, dfaggioli@suse.com
Subject: Re: [PATCH v2 03/11] migration: Make migration json writer part of
 MigrationState struct
Message-ID: <Y1Afr7rJ2OCSf/cd@redhat.com>
References: <20221010133408.3214433-1-nborisov@suse.com>
 <20221010133408.3214433-4-nborisov@suse.com>
 <Y056tM+EUKMMC8PI@redhat.com>
 <a6aaff1d-5b07-5e7a-61e7-bfe97582c98b@suse.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <a6aaff1d-5b07-5e7a-61e7-bfe97582c98b@suse.com>
User-Agent: Mutt/2.2.7 (2022-08-07)
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.10
Received-SPF: pass client-ip=170.10.133.124; envelope-from=berrange@redhat.com;
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

On Wed, Oct 19, 2022 at 06:43:46PM +0300, Nikolay Borisov wrote:
> 
> 
> On 18.10.22 г. 13:06 ч., Daniel P. Berrangé wrote:
> > On Mon, Oct 10, 2022 at 04:34:00PM +0300, Nikolay Borisov wrote:
> > > This is required so that migration stream configuration is written
> > > to the migration stream. This would allow analyze-migration to
> > > parse enabled capabilities for the migration and adjust its behavior
> > > accordingly. This is in preparation for analyze-migration.py to support
> > > 'fixed-ram' capability format changes.
> > > 
> > > Signed-off-by: Nikolay Borisov <nborisov@suse.com>
> > > ---
> > >   migration/migration.c |  5 +++++
> > >   migration/migration.h |  3 +++
> > >   migration/savevm.c    | 38 ++++++++++++++++++++++----------------
> > >   3 files changed, 30 insertions(+), 16 deletions(-)
> > > 
> > > diff --git a/migration/migration.c b/migration/migration.c
> > > index 140b0f1a54bd..d0779bbaf862 100644
> > > --- a/migration/migration.c
> > > +++ b/migration/migration.c
> > > @@ -1896,6 +1896,8 @@ static void migrate_fd_cleanup(MigrationState *s)
> > >       g_free(s->hostname);
> > >       s->hostname = NULL;
> > > +    json_writer_free(s->vmdesc);
> > > +
> > >       qemu_savevm_state_cleanup();
> > >       if (s->to_dst_file) {
> > > @@ -2154,6 +2156,7 @@ void migrate_init(MigrationState *s)
> > >       error_free(s->error);
> > >       s->error = NULL;
> > >       s->hostname = NULL;
> > > +    s->vmdesc = NULL;
> > >       migrate_set_state(&s->state, MIGRATION_STATUS_NONE, MIGRATION_STATUS_SETUP);
> > > @@ -4269,6 +4272,8 @@ void migrate_fd_connect(MigrationState *s, Error *error_in)
> > >           return;
> > >       }
> > > +    s->vmdesc = json_writer_new(false);
> > > +
> > >       if (multifd_save_setup(&local_err) != 0) {
> > >           error_report_err(local_err);
> > >           migrate_set_state(&s->state, MIGRATION_STATUS_SETUP,
> > > diff --git a/migration/migration.h b/migration/migration.h
> > > index cdad8aceaaab..96f27aba2210 100644
> > > --- a/migration/migration.h
> > > +++ b/migration/migration.h
> > > @@ -17,6 +17,7 @@
> > >   #include "exec/cpu-common.h"
> > >   #include "hw/qdev-core.h"
> > >   #include "qapi/qapi-types-migration.h"
> > > +#include "qapi/qmp/json-writer.h"
> > >   #include "qemu/thread.h"
> > >   #include "qemu/coroutine_int.h"
> > >   #include "io/channel.h"
> > > @@ -261,6 +262,8 @@ struct MigrationState {
> > >       int state;
> > > +    JSONWriter *vmdesc;
> > > +
> > >       /* State related to return path */
> > >       struct {
> > >           /* Protected by qemu_file_lock */
> > > diff --git a/migration/savevm.c b/migration/savevm.c
> > > index 48e85c052c2c..174cdbefc29d 100644
> > > --- a/migration/savevm.c
> > > +++ b/migration/savevm.c
> > > @@ -1137,13 +1137,18 @@ void qemu_savevm_non_migratable_list(strList **reasons)
> > >   void qemu_savevm_state_header(QEMUFile *f)
> > >   {
> > > +    MigrationState *s = migrate_get_current();
> > >       trace_savevm_state_header();
> > >       qemu_put_be32(f, QEMU_VM_FILE_MAGIC);
> > >       qemu_put_be32(f, QEMU_VM_FILE_VERSION);
> > > -    if (migrate_get_current()->send_configuration) {
> > > +    if (s->send_configuration) {
> > >           qemu_put_byte(f, QEMU_VM_CONFIGURATION);
> > > -        vmstate_save_state(f, &vmstate_configuration, &savevm_state, 0);
> > > +	json_writer_start_object(s->vmdesc, NULL);
> > > +	json_writer_start_object(s->vmdesc, "configuration");
> > > +        vmstate_save_state(f, &vmstate_configuration, &savevm_state, s->vmdesc);
> > > +	json_writer_end_object(s->vmdesc);
> > > +
> > 
> > IIUC, this is changing the info that is written in the VM
> > configuration section, by adding an extra level of nesting
> > to the object.
> > 
> > Isn't this going to cause backwards compatibility problems ?
> > 
> > Nothing in the patch seems to take account of the exctra
> > 'configuiration' object that has been started
> 
> The resulting json looks like:
> 
> {
>     "configuration": {
>         "vmsd_name": "configuration",
>         "version": 1,
>         "fields": [
>             {
>                 "name": "len",
>                 "type": "uint32",
>                 "size": 4
>             },
>             {
>                 "name": "name",
>                 "type": "buffer",
>                 "size": 13
>             }
>         ],
>         "subsections": [
>             {
>                 "vmsd_name": "configuration/capabilities",
>                 "version": 1,
>                 "fields": [
>                     {
>                         "name": "caps_count",
>                         "type": "uint32",
>                         "size": 4
>                     },
>                     {
>                         "name": "capabilities",
>                         "type": "capability",
>                         "size": 10
>                     }
>                 ]
>             }
>         ]
>     },
>     "page_size": 4096,
>     "devices": [
>         {
>             "name": "timer",
>             "instance_id": 0,
> //ommitted
> 
> So the "configuration" object is indeed added, but older versions of qemu
> can ignore it without any problem.

IIUC, after looking further, this JSON is only used by the
analyze-migration.py script ?  If that's right, then we should
have the change to analyze-migration.py that copes with the
"configuration" option in the same patch.

> > Also, there's two  json_writer_start_object calls, but only
> > one json_writer_end_object.
> 
> That's intentional, the first one begins the top-level object and it is
> actually paired with the final call to json_writer_end_object(s->vmdesc); in
> qemu_savevm_state_complete_precopy_non_iterable .

Oh right, can you add a comment to both locations, mentioning
where their respective pair lives.


With regards,
Daniel
-- 
|: https://berrange.com      -o-    https://www.flickr.com/photos/dberrange :|
|: https://libvirt.org         -o-            https://fstop138.berrange.com :|
|: https://entangle-photo.org    -o-    https://www.instagram.com/dberrange :|


