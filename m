Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7F0906230E9
	for <lists+qemu-devel@lfdr.de>; Wed,  9 Nov 2022 18:01:23 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1osoQw-0003kW-MT; Wed, 09 Nov 2022 12:00:15 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lsoaresp@redhat.com>)
 id 1osoQr-0003jE-Rx
 for qemu-devel@nongnu.org; Wed, 09 Nov 2022 12:00:09 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lsoaresp@redhat.com>)
 id 1osoQp-00017d-Gk
 for qemu-devel@nongnu.org; Wed, 09 Nov 2022 12:00:09 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1668013205;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=xn51H6DYjVjf9shp6E/0IMC7E07oTaEPCEAUwKlDDzU=;
 b=fLZvlEikKl400GZ+j0gXnuUSn84toTbifcVegoOWTzRMSqCuZGSJ+PpbUcRSU2VrQfiFDk
 3ZiqekvRTSD6EPvFhk+RdCb4HUGTdOAhOX6Bfs4Q0ysbhzvnLDYe1+aX2m531KsJDfTzYV
 KhXtyjhO3eGLfTMbwZBZvBijzKS882k=
Received: from mail-yw1-f199.google.com (mail-yw1-f199.google.com
 [209.85.128.199]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-641-RXSMDNqWO1mi_GGy8m2Q4w-1; Wed, 09 Nov 2022 12:00:03 -0500
X-MC-Unique: RXSMDNqWO1mi_GGy8m2Q4w-1
Received: by mail-yw1-f199.google.com with SMTP id
 00721157ae682-349423f04dbso169061237b3.13
 for <qemu-devel@nongnu.org>; Wed, 09 Nov 2022 09:00:03 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=xn51H6DYjVjf9shp6E/0IMC7E07oTaEPCEAUwKlDDzU=;
 b=WP8zO9RA+Fie0AXR6BXeMe8M5GIuPp59JNRd9XWUILOu0i455GCF3DdlQaI4zsrKFD
 jPAAvmHowTaew4Q1tKe+nWRGUU3bFtN90JI7OuoTxq5hhtP7vsCFWIrL3rSusQdmijdd
 xX3jv3KtnByHITaWbQ1MmYMkOvaP4jtQNWJyTiuBnz5+MILbk+jgAm9yNNdZCTA5R+zS
 7QXOPtafOxhZWRKT31/G5/89A93MYxAG4Y47fd0lN2pBSUGfzCXxgPaiZpSpE+a6Bcp2
 Yv01tHb9QWgE72naETDNMo1HNp8B6ItEogQj5rBfiaARAISPg1worH9JPWw1xgY/YM6y
 fqDQ==
X-Gm-Message-State: ACrzQf1k2ln02f9t8/SM8vvlHh1a/iH6f0qs/ExQx4qskNyinbr3Ks0J
 OsxdOK+vHS8oQhz/Au55tmASziciNXjq1GBhyk01vpHW9Nd9gg2Ier66codvXbVynUoSrbkwN6I
 GYwWxMZB1kZe/simd5sL5+vz2548PogQ=
X-Received: by 2002:a25:aa33:0:b0:6d1:a5f:f99 with SMTP id
 s48-20020a25aa33000000b006d10a5f0f99mr32200069ybi.268.1668013202682; 
 Wed, 09 Nov 2022 09:00:02 -0800 (PST)
X-Google-Smtp-Source: AMsMyM7LuMwEsBlc0mwlpKPQ2ShnkMfKPzpGRmSJ+9178s4QlPmIO9iFECEYgwcZ7W5/mxOTZ9h5Zju1vS1264ApJY8=
X-Received: by 2002:a25:aa33:0:b0:6d1:a5f:f99 with SMTP id
 s48-20020a25aa33000000b006d10a5f0f99mr32200040ybi.268.1668013202282; 
 Wed, 09 Nov 2022 09:00:02 -0800 (PST)
MIME-Version: 1.0
References: <20221109055629.789795-1-leobras@redhat.com>
 <Y2urmk6gG4otYTaZ@work-vm>
In-Reply-To: <Y2urmk6gG4otYTaZ@work-vm>
From: Leonardo Bras Soares Passos <leobras@redhat.com>
Date: Wed, 9 Nov 2022 13:59:51 -0300
Message-ID: <CAJ6HWG4p78xat61xwPFZT+VAk7ZYFyTvZqqVLNyxw_s3KJ+qJw@mail.gmail.com>
Subject: Re: [PATCH v1 1/1] migration: Fix yank on postcopy multifd crashing
 guest after migration
To: "Dr. David Alan Gilbert" <dgilbert@redhat.com>
Cc: Juan Quintela <quintela@redhat.com>, Peter Xu <peterx@redhat.com>,
 qemu-devel@nongnu.org, Li Xiaohui <xiaohli@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=170.10.129.124; envelope-from=lsoaresp@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, URG_BIZ=0.573 autolearn=ham autolearn_force=no
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

On Wed, Nov 9, 2022 at 10:31 AM Dr. David Alan Gilbert
<dgilbert@redhat.com> wrote:
>
> * Leonardo Bras (leobras@redhat.com) wrote:
> > When multifd and postcopy-ram capabilities are enabled, if a
> > migrate-start-postcopy is attempted, the migration will finish sending the
> > memory pages and then crash with the following error:
>
> How does that happen? Isn't multifd+postcopy still disabled, I see in
> migrate_caps_check
>
>     if (cap_list[MIGRATION_CAPABILITY_POSTCOPY_RAM]) {
>     ....
>         if (cap_list[MIGRATION_CAPABILITY_MULTIFD]) {
>             error_setg(errp, "Postcopy is not yet compatible with multifd");
>             return false;
>         }
>     }
>

I can't see this happening in upstream code (v7.2.0-rc0). Could you
please tell me the lines where this happens?

I mean, I see cap_list[MIGRATION_CAPABILITY_MULTIFD] and
cap_list[MIGRATION_CAPABILITY_POSTCOPY_RAM] in migrate_caps_check()
but I can't see them nested like this, so I am probably missing
something.

This procedure to reproduce was shared by Xiaohui Li (I added a few tweaks):

1.Boot a guest with any qemu command on source host;
2.Boot a guest with same qemu command but append '-incoming defer' on
destination host;
3.Enable multifd and postcopy capabilities on src and dst hosts:
{"execute":"migrate-set-capabilities","arguments":{"capabilities":[{"capability":"multifd","state":true}]}}
{"execute":"migrate-set-capabilities","arguments":{"capabilities":[{"capability":"postcopy-ram","state":true}]}}
4.During migration is active, switch to postcopy mode:
{"execute":"migrate-start-postcopy"}

Best regards,
Leo


>
> Dave
>
> > qemu-system-x86_64: ../util/yank.c:107: yank_unregister_instance: Assertion
> > `QLIST_EMPTY(&entry->yankfns)' failed.
> >
> > This happens because even though all multifd channels could
> > yank_register_function(), none of them could unregister it before
> > unregistering the MIGRATION_YANK_INSTANCE, causing the assert to fail.
> >
> > Fix that by calling multifd_load_cleanup() on postcopy_ram_listen_thread()
> > before MIGRATION_YANK_INSTANCE is unregistered.
> >
> > Fixes: b5eea99ec2 ("migration: Add yank feature")
> > Reported-by: Li Xiaohui <xiaohli@redhat.com>
> > Signed-off-by: Leonardo Bras <leobras@redhat.com>
> > ---
> >  migration/migration.h |  1 +
> >  migration/migration.c | 18 +++++++++++++-----
> >  migration/savevm.c    |  2 ++
> >  3 files changed, 16 insertions(+), 5 deletions(-)
> >
> > diff --git a/migration/migration.h b/migration/migration.h
> > index cdad8aceaa..240f64efb0 100644
> > --- a/migration/migration.h
> > +++ b/migration/migration.h
> > @@ -473,6 +473,7 @@ void migration_make_urgent_request(void);
> >  void migration_consume_urgent_request(void);
> >  bool migration_rate_limit(void);
> >  void migration_cancel(const Error *error);
> > +bool migration_load_cleanup(void);
> >
> >  void populate_vfio_info(MigrationInfo *info);
> >  void postcopy_temp_page_reset(PostcopyTmpPage *tmp_page);
> > diff --git a/migration/migration.c b/migration/migration.c
> > index 739bb683f3..4f363b2a95 100644
> > --- a/migration/migration.c
> > +++ b/migration/migration.c
> > @@ -486,6 +486,17 @@ void migrate_add_address(SocketAddress *address)
> >                        QAPI_CLONE(SocketAddress, address));
> >  }
> >
> > +bool migration_load_cleanup(void)
> > +{
> > +    Error *local_err = NULL;
> > +
> > +    if (multifd_load_cleanup(&local_err)) {
> > +        error_report_err(local_err);
> > +        return true;
> > +    }
> > +    return false;
> > +}
> > +
> >  static void qemu_start_incoming_migration(const char *uri, Error **errp)
> >  {
> >      const char *p = NULL;
> > @@ -540,8 +551,7 @@ static void process_incoming_migration_bh(void *opaque)
> >       */
> >      qemu_announce_self(&mis->announce_timer, migrate_announce_params());
> >
> > -    if (multifd_load_cleanup(&local_err) != 0) {
> > -        error_report_err(local_err);
> > +    if (migration_load_cleanup()) {
> >          autostart = false;
> >      }
> >      /* If global state section was not received or we are in running
> > @@ -646,9 +656,7 @@ fail:
> >      migrate_set_state(&mis->state, MIGRATION_STATUS_ACTIVE,
> >                        MIGRATION_STATUS_FAILED);
> >      qemu_fclose(mis->from_src_file);
> > -    if (multifd_load_cleanup(&local_err) != 0) {
> > -        error_report_err(local_err);
> > -    }
> > +    migration_load_cleanup();
> >      exit(EXIT_FAILURE);
> >  }
> >
> > diff --git a/migration/savevm.c b/migration/savevm.c
> > index a0cdb714f7..250caff7f4 100644
> > --- a/migration/savevm.c
> > +++ b/migration/savevm.c
> > @@ -1889,6 +1889,8 @@ static void *postcopy_ram_listen_thread(void *opaque)
> >          exit(EXIT_FAILURE);
> >      }
> >
> > +    migration_load_cleanup();
> > +
> >      migrate_set_state(&mis->state, MIGRATION_STATUS_POSTCOPY_ACTIVE,
> >                                     MIGRATION_STATUS_COMPLETED);
> >      /*
> > --
> > 2.38.1
> >
> --
> Dr. David Alan Gilbert / dgilbert@redhat.com / Manchester, UK
>


