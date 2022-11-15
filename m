Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 50DF9628FF2
	for <lists+qemu-devel@lfdr.de>; Tue, 15 Nov 2022 03:34:40 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1oulkk-0001DE-Bl; Mon, 14 Nov 2022 21:32:46 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lsoaresp@redhat.com>)
 id 1oulkj-0001D4-39
 for qemu-devel@nongnu.org; Mon, 14 Nov 2022 21:32:45 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lsoaresp@redhat.com>)
 id 1oulkg-0004tP-QB
 for qemu-devel@nongnu.org; Mon, 14 Nov 2022 21:32:44 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1668479560;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=w85QKWpEMO/yjbpiVurlPLDrweJ17knttlk76Put+XY=;
 b=dlqJF+i4MHwDhCbbxKnXEsdriXHsKTPyQvpTGgveIpw2fbhdURL+nqsyn87sJ7vN/XAsq7
 LcnFDBfOfMZaeEjIMJ0gPMiQxxNlT3BKbcrjRuNMwnZrTCkqn3aikjsZSUJ6XyjxH96M69
 d6Hi1a3Hf0b/PF8QJy4LfswSALc57gs=
Received: from mail-yw1-f200.google.com (mail-yw1-f200.google.com
 [209.85.128.200]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-187-hDyFPy6GNZCPIR5Ht5ivDg-1; Mon, 14 Nov 2022 21:32:38 -0500
X-MC-Unique: hDyFPy6GNZCPIR5Ht5ivDg-1
Received: by mail-yw1-f200.google.com with SMTP id
 00721157ae682-3697bd55974so122276237b3.15
 for <qemu-devel@nongnu.org>; Mon, 14 Nov 2022 18:32:38 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=w85QKWpEMO/yjbpiVurlPLDrweJ17knttlk76Put+XY=;
 b=rm8VQ6dEMqIGjoDvvnUeGVokiSAAE3ex69XzRz4a62tkMFsNKHik8OoRli+aj+FVPt
 +wxuD0mKovPDrBtbwWIgrEQLabVUmlICswhlzPHzTghokr3X2mB7SDVox4xVwLZZFGCH
 ozWnu079X1skigv4qHJBLQXMpdZBwv7BAWABs3dOzxw44LBQZfzFd+wB6xrXBKW9tvSi
 OQCl2Fb4YA1XQfrZr3XF9mJt8jrFfPnvf6KB68xkKw8iwwOyLpOwtUj1ujgbw+mkAPMS
 VwvPVs7IMA7sYqUwL/N134AscrPDcYvJBuZkOv5qHLmmTOYFffDBKu8he1keQ2TlPWCH
 lYJQ==
X-Gm-Message-State: ANoB5pmYq2ruaN9OqkRHe4AL5zyE7CxIgcRn87D3luuTCMUtZVH4y0b+
 R6J6TUhqxPfwXVpoV18OrRdc1zGSM4oYuBf6aWR2bvlhZtti0klCstzXAfAosRxYMWtXneh1KPi
 vW8HHrXdJPRB8Ki8G+QN7g/DOxtIDDy0=
X-Received: by 2002:a05:6902:1342:b0:6dd:9de8:b408 with SMTP id
 g2-20020a056902134200b006dd9de8b408mr14357990ybu.268.1668479557807; 
 Mon, 14 Nov 2022 18:32:37 -0800 (PST)
X-Google-Smtp-Source: AA0mqf7bW2k29hQgYKNdy6f/SZRksa3jDLiO6psVaQiEhERTZZR/nTkHLJ0HI/bUF2nNWJdiwh57MYkWzllS72XRBg8=
X-Received: by 2002:a05:6902:1342:b0:6dd:9de8:b408 with SMTP id
 g2-20020a056902134200b006dd9de8b408mr14357975ybu.268.1668479557523; Mon, 14
 Nov 2022 18:32:37 -0800 (PST)
MIME-Version: 1.0
References: <20221109055629.789795-1-leobras@redhat.com>
 <87tu362a5y.fsf@secure.mitica>
In-Reply-To: <87tu362a5y.fsf@secure.mitica>
From: Leonardo Bras Soares Passos <leobras@redhat.com>
Date: Mon, 14 Nov 2022 23:32:26 -0300
Message-ID: <CAJ6HWG5rwLiVZaJ6oMQQa-UJP3fGHqdQcx63xgJYP+Y1KfR_nA@mail.gmail.com>
Subject: Re: [PATCH v1 1/1] migration: Fix yank on postcopy multifd crashing
 guest after migration
To: quintela@redhat.com
Cc: "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 Peter Xu <peterx@redhat.com>, qemu-devel@nongnu.org, 
 Li Xiaohui <xiaohli@redhat.com>
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

On Thu, Nov 10, 2022 at 10:48 AM Juan Quintela <quintela@redhat.com> wrote:
>
> Leonardo Bras <leobras@redhat.com> wrote:
> D> When multifd and postcopy-ram capabilities are enabled, if a
> > migrate-start-postcopy is attempted, the migration will finish sending the
> > memory pages and then crash with the following error:
> >
> > qemu-system-x86_64: ../util/yank.c:107: yank_unregister_instance: Assertion
> > `QLIST_EMPTY(&entry->yankfns)' failed.
> >
> > This happens because even though all multifd channels could
> > yank_register_function(), none of them could unregister it before
> > unregistering the MIGRATION_YANK_INSTANCE, causing the assert to fail.
> >
> > Fix that by calling multifd_load_cleanup() on postcopy_ram_listen_thread()
> > before MIGRATION_YANK_INSTANCE is unregistered.
>
> Hi
>
> One question,
> What warantees that migration_load_cleanup() is not called twice?
>
> I can't see anything that provides that here?  Or does postcopy have
> never done the cleanup of multifd channels before?

IIUC, postcopy is not doing multifd cleanup for a while, at least
since 6.0.0-rc2.
That is as far as I went back testing, and by fixing other (build)
bugs, I could get the yank to abort the target qemu after the
migration finished on multifd + postcopy scenario.


>
> Later, Juan.
>
>
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
>
> This addition is the one that I don't understand why it was not
> needed/done before.

Please see the above comment, but tl;dr, it was not done before.


Thanks you for reviewing,
Leo

>
> >      migrate_set_state(&mis->state, MIGRATION_STATUS_POSTCOPY_ACTIVE,
> >                                     MIGRATION_STATUS_COMPLETED);
> >      /*
>
> Later, Juan.
>


