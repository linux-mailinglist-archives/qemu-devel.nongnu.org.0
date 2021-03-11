Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A9E1033723F
	for <lists+qemu-devel@lfdr.de>; Thu, 11 Mar 2021 13:18:45 +0100 (CET)
Received: from localhost ([::1]:51930 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lKKH6-00055x-OR
	for lists+qemu-devel@lfdr.de; Thu, 11 Mar 2021 07:18:44 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:47694)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1lKKFt-00044V-UO
 for qemu-devel@nongnu.org; Thu, 11 Mar 2021 07:17:31 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:43099)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1lKKFo-0004KK-2n
 for qemu-devel@nongnu.org; Thu, 11 Mar 2021 07:17:29 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1615465042;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=3H3rloSBEyk2RfZxRpJkkpP4HOcKg/qWbniVqbIXmRA=;
 b=F7A6Y8ToWdz7ct+TfI7+gCD0Orpn6bXsP6n2RtWpwIe5AbfnJDGKe+HtU6QrTogaZhtlCF
 k3fbie+r/r4jUL8VXpoEPXlNJciFHwFiCb6CCL7VNAvz5o6TWhXd1khOyXvDq6+rYRZAat
 ji16T6gda6QSYFED5iWPQE9z+muEmHQ=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-339-RP4XVz7mPoaBFYPUYwU4rw-1; Thu, 11 Mar 2021 07:17:20 -0500
X-MC-Unique: RP4XVz7mPoaBFYPUYwU4rw-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id BD3A639382;
 Thu, 11 Mar 2021 12:17:19 +0000 (UTC)
Received: from redhat.com (ovpn-115-85.ams2.redhat.com [10.36.115.85])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id D3F302B16E;
 Thu, 11 Mar 2021 12:17:17 +0000 (UTC)
Date: Thu, 11 Mar 2021 12:17:14 +0000
From: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
To: "Dr. David Alan Gilbert" <dgilbert@redhat.com>
Subject: Re: [PATCH 05/33] migration: push Error **errp into
 qemu_loadvm_state_main()
Message-ID: <YEoKSp1uCbOYLyLW@redhat.com>
References: <20210204171907.901471-1-berrange@redhat.com>
 <20210204171907.901471-6-berrange@redhat.com>
 <YCq+4/8hUcAWV1HM@work-vm>
MIME-Version: 1.0
In-Reply-To: <YCq+4/8hUcAWV1HM@work-vm>
User-Agent: Mutt/2.0.5 (2021-01-21)
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=berrange@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=berrange@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.25,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Reply-To: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
Cc: Hailiang Zhang <zhang.zhanghailiang@huawei.com>, qemu-devel@nongnu.org,
 Juan Quintela <quintela@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Mon, Feb 15, 2021 at 06:35:15PM +0000, Dr. David Alan Gilbert wrote:
> * Daniel P. Berrangé (berrange@redhat.com) wrote:
> > This is an incremental step in converting vmstate loading code to report
> > via Error objects instead of printing directly to the console/monitor.
> > 
> > Signed-off-by: Daniel P. Berrangé <berrange@redhat.com>
> > ---
> >  migration/colo.c   |  3 +-
> >  migration/savevm.c | 73 +++++++++++++++++++++++++++++++---------------
> >  migration/savevm.h |  3 +-
> >  3 files changed, 52 insertions(+), 27 deletions(-)
> > 
> > diff --git a/migration/colo.c b/migration/colo.c
> > index e344b7cf32..4a050ac579 100644
> > --- a/migration/colo.c
> > +++ b/migration/colo.c
> > @@ -705,11 +705,10 @@ static void colo_incoming_process_checkpoint(MigrationIncomingState *mis,
> >  
> >      qemu_mutex_lock_iothread();
> >      cpu_synchronize_all_states();
> > -    ret = qemu_loadvm_state_main(mis->from_src_file, mis);
> > +    ret = qemu_loadvm_state_main(mis->from_src_file, mis, errp);
> >      qemu_mutex_unlock_iothread();
> >  
> >      if (ret < 0) {
> > -        error_setg(errp, "Load VM's live state (ram) error");
> >          return;
> >      }
> >  
> > diff --git a/migration/savevm.c b/migration/savevm.c
> > index dd41292d4e..e47aec435c 100644
> > --- a/migration/savevm.c
> > +++ b/migration/savevm.c
> > @@ -1819,6 +1819,7 @@ static void *postcopy_ram_listen_thread(void *opaque)
> >      QEMUFile *f = mis->from_src_file;
> >      int load_res;
> >      MigrationState *migr = migrate_get_current();
> > +    Error *local_err = NULL;
> >  
> >      object_ref(OBJECT(migr));
> >  
> > @@ -1833,7 +1834,7 @@ static void *postcopy_ram_listen_thread(void *opaque)
> >       * in qemu_file, and thus we must be blocking now.
> >       */
> >      qemu_file_set_blocking(f, true);
> > -    load_res = qemu_loadvm_state_main(f, mis);
> > +    load_res = qemu_loadvm_state_main(f, mis, &local_err);
> >  
> >      /*
> >       * This is tricky, but, mis->from_src_file can change after it
> > @@ -1849,6 +1850,7 @@ static void *postcopy_ram_listen_thread(void *opaque)
> >      if (load_res < 0) {
> >          qemu_file_set_error(f, load_res);
> >          dirty_bitmap_mig_cancel_incoming();
> > +        error_report_err(local_err);
> >          if (postcopy_state_get() == POSTCOPY_INCOMING_RUNNING &&
> >              !migrate_postcopy_ram() && migrate_dirty_bitmaps())
> >          {
> > @@ -1859,12 +1861,10 @@ static void *postcopy_ram_listen_thread(void *opaque)
> >                           __func__, load_res);
> >              load_res = 0; /* prevent further exit() */
> >          } else {
> > -            error_report("%s: loadvm failed: %d", __func__, load_res);
> >              migrate_set_state(&mis->state, MIGRATION_STATUS_POSTCOPY_ACTIVE,
> >                                             MIGRATION_STATUS_FAILED);
> >          }
> > -    }
> > -    if (load_res >= 0) {
> > +    } else {
> >          /*
> >           * This looks good, but it's possible that the device loading in the
> >           * main thread hasn't finished yet, and so we might not be in 'RUN'
> > @@ -2116,14 +2116,17 @@ static int loadvm_postcopy_handle_resume(MigrationIncomingState *mis)
> >   * @mis: Incoming state
> >   * @length: Length of packaged data to read
> >   *
> > - * Returns: Negative values on error
> > - *
> > + * Returns:
> > + *   0: success
> > + *   LOADVM_QUIT: success, but stop
> > + *   -1: error
> >   */
> >  static int loadvm_handle_cmd_packaged(MigrationIncomingState *mis)
> >  {
> >      int ret;
> >      size_t length;
> >      QIOChannelBuffer *bioc;
> > +    Error *local_err = NULL;
> >  
> >      length = qemu_get_be32(mis->from_src_file);
> >      trace_loadvm_handle_cmd_packaged(length);
> > @@ -2149,8 +2152,11 @@ static int loadvm_handle_cmd_packaged(MigrationIncomingState *mis)
> >  
> >      QEMUFile *packf = qemu_fopen_channel_input(QIO_CHANNEL(bioc));
> >  
> > -    ret = qemu_loadvm_state_main(packf, mis);
> > +    ret = qemu_loadvm_state_main(packf, mis, &local_err);
> >      trace_loadvm_handle_cmd_packaged_main(ret);
> > +    if (ret < 0) {
> > +        error_report_err(local_err);
> > +    }
> >      qemu_fclose(packf);
> >      object_unref(OBJECT(bioc));
> >  
> > @@ -2568,7 +2574,14 @@ static bool postcopy_pause_incoming(MigrationIncomingState *mis)
> >      return true;
> >  }
> >  
> > -int qemu_loadvm_state_main(QEMUFile *f, MigrationIncomingState *mis)
> > +/*
> > + * Returns:
> > + *   0: success
> > + *   LOADVM_QUIT: success, but stop
> > + *   -1: error
> > + */
> > +int qemu_loadvm_state_main(QEMUFile *f, MigrationIncomingState *mis,
> > +                           Error **errp)
> >  {
> >      uint8_t section_type;
> >      int ret = 0;
> > @@ -2579,7 +2592,9 @@ retry:
> >  
> >          if (qemu_file_get_error(f)) {
> >              ret = qemu_file_get_error(f);
> > -            break;
> > +            error_setg(errp,
> > +                       "Failed to load device state section ID: %d", ret);
> 
> Can I ask why these don't use strerror(ret) ?
> 
> The test I'm running is, start a VM with an actual guest and a useful
> amount of ram:
> 
> ./x86_64-softmmu/qemu-system-x86_64 -M pc,accel=kvm -nographic -m 8G -drive if=virtio,file=/home/vmimages/fedora-33-nest.qcow
> 
> ./x86_64-softmmu/qemu-system-x86_64 -M pc,accel=kvm -nographic -m 8G -drive if=virtio,file=/home/vmimages/fedora-33-nest.qcow -incoming tcp:0:4444
> 
> source:
>   migrate_set_speed 1m
>   migrate -d tcp:0:4444
>   <Now quickly>
>   migrate_cancel
> 
> In the old world I get:
> qemu-system-x86_64: load of migration failed: Input/output error
> 
> In your world I get:
> qemu-system-x86_64: Failed to load device state section ID: -5
> 
> (5 being EIO)

Ok, so it looks like I do indeed need to pay more attention to
correctly using error_setg_errno() instead of error_setg(), as
Philippe suggested in the earlier patches.


Regards,
Daniel
-- 
|: https://berrange.com      -o-    https://www.flickr.com/photos/dberrange :|
|: https://libvirt.org         -o-            https://fstop138.berrange.com :|
|: https://entangle-photo.org    -o-    https://www.instagram.com/dberrange :|


