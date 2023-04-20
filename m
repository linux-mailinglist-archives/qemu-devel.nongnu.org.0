Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3D9C16E9702
	for <lists+qemu-devel@lfdr.de>; Thu, 20 Apr 2023 16:26:51 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1ppVEa-0007Wn-8n; Thu, 20 Apr 2023 10:26:04 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eblake@redhat.com>) id 1ppVEX-0007Wa-5W
 for qemu-devel@nongnu.org; Thu, 20 Apr 2023 10:26:01 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eblake@redhat.com>) id 1ppVEV-0007Ub-FJ
 for qemu-devel@nongnu.org; Thu, 20 Apr 2023 10:26:00 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1682000758;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=fcIcRlZ+OBsceIGKawz4rhhm07qxvN/3ghiO047LBIw=;
 b=PAdDP2qazqzJ5WI8IerJGFf1plaCA1JSCN0yzC096umnz55IUWlVC21ydNPNfGEhPe/iGN
 5GcoSTMzF9Ec+yZKCkrICxm8wRsFlnBk1uyrAT0EWWmekHIji3UZJfCYL62wFGlMDO4RMy
 GjqE9CrB4i4+CDg3zcMR31K7Q6/NJPc=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-604-5-Fk6Eb6M2OKIfBHOgpOUA-1; Thu, 20 Apr 2023 10:25:57 -0400
X-MC-Unique: 5-Fk6Eb6M2OKIfBHOgpOUA-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.rdu2.redhat.com
 [10.11.54.8])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id C9AE5800047
 for <qemu-devel@nongnu.org>; Thu, 20 Apr 2023 14:25:56 +0000 (UTC)
Received: from redhat.com (unknown [10.2.16.177])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 84687C16024;
 Thu, 20 Apr 2023 14:25:56 +0000 (UTC)
Date: Thu, 20 Apr 2023 09:25:54 -0500
From: Eric Blake <eblake@redhat.com>
To: Juan Quintela <quintela@redhat.com>
Cc: qemu-devel@nongnu.org
Subject: Re: [PATCH v2] migration: Handle block device inactivation failures
 better
Message-ID: <j3mm2jnmanpe6e5v3bvwgiv7av3pno2usmfc4mqnfvhi3gpvoo@zltviuih6b22>
References: <20230414153358.1452040-1-eblake@redhat.com>
 <878remzvhm.fsf@secure.mitica>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <878remzvhm.fsf@secure.mitica>
User-Agent: NeoMutt/20230407
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.8
Received-SPF: pass client-ip=170.10.133.124; envelope-from=eblake@redhat.com;
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

On Thu, Apr 20, 2023 at 12:41:25PM +0200, Juan Quintela wrote:
> Eric Blake <eblake@redhat.com> wrote:

...lots of lines...

> > ---
> >  migration/migration.c | 5 ++---
> >  1 file changed, 2 insertions(+), 3 deletions(-)

...describing a tiny change ;)

> >
> > diff --git a/migration/migration.c b/migration/migration.c
> > index bda47891933..cb0d42c0610 100644
> > --- a/migration/migration.c
> > +++ b/migration/migration.c
> > @@ -3444,13 +3444,11 @@ static void migration_completion(MigrationState *s)
> >                                              MIGRATION_STATUS_DEVICE);
> >              }
> >              if (ret >= 0) {
> > +                s->block_inactive = inactivate;
> >                  qemu_file_set_rate_limit(s->to_dst_file, INT64_MAX);
> >                  ret = qemu_savevm_state_complete_precopy(s->to_dst_file, false,
> >                                                           inactivate);
> >              }
> > -            if (inactivate && ret >= 0) {
> > -                s->block_inactive = true;
> > -            }
> >          }
> >          qemu_mutex_unlock_iothread();
> 
> And I still have to look at the file to understand this "simple" patch.
> (simple in size, not in what it means).

Indeed - hence the long commit message!

> 
> I will add this to my queue, but if you are in the "mood", I would like
> to remove the declaration of inactivate and change this to something like:
> 
>              if (ret >= 0) {
>                  /* Colo don't stop disks in normal operation */
>                  s->block_inactive = !migrate_colo_enabled();
>                  qemu_file_set_rate_limit(s->to_dst_file, INT64_MAX);
>                  ret = qemu_savevm_state_complete_precopy(s->to_dst_file, false,
>                                                           s->block_inactive);
>              }
> 
> Or something around that lines?

Yes, that looks like a trivial refactoring that preserves the same
semantics.

> 
> > @@ -3522,6 +3520,7 @@ fail_invalidate:
> >          bdrv_activate_all(&local_err);
> >          if (local_err) {
> >              error_report_err(local_err);
> > +            s->block_inactive = true;
> >          } else {
> >              s->block_inactive = false;
> >          }
> > base-commit: 7dbd6f8a27e30fe14adb3d5869097cddf24038d6
> 
> Just wondering, what git magic creates this line?

git send-email --base=COMMIT_ID

or even 'git config format.useAutoBase whenAble' to try and automate
the use of this.  (If my own git habits were cleaner, of always
sticking patches in fresh branches, --base=auto is handy; but in
practice, I tend to send one-off patches like this in the middle of
'git rebase' of a larger series, at which point I'm not on a clean
branch where --base=auto works, so I end up having to manually specify
one at the command line.  Either way, including the base-commit: info
can be very informative for applying a patch at the branch point then
rebasing it locally, when attempting to apply the patch sent through
email hits merge conflicts when applying it directly to changes on
master in the meantime; I believe 'git am -3' is even able to exploit
the comment when present to make smarter decisions about which parent
commit it tries for doing 3-way patch resolution)

-- 
Eric Blake, Principal Software Engineer
Red Hat, Inc.           +1-919-301-3266
Virtualization:  qemu.org | libvirt.org


