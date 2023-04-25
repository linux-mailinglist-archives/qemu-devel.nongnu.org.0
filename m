Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 07F326EDE8E
	for <lists+qemu-devel@lfdr.de>; Tue, 25 Apr 2023 10:54:10 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1prEQT-0006Ns-UN; Tue, 25 Apr 2023 04:53:29 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <quintela@redhat.com>)
 id 1prEQR-0006MK-1J
 for qemu-devel@nongnu.org; Tue, 25 Apr 2023 04:53:27 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <quintela@redhat.com>)
 id 1prEQO-0000PY-SX
 for qemu-devel@nongnu.org; Tue, 25 Apr 2023 04:53:26 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1682412799;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:in-reply-to:in-reply-to:  references:references;
 bh=ZIIZvS6vqmCMvuPrGtYyn+sXSDj/0YhGOVOxi1Rl7Ls=;
 b=VHlmrYO1+YlrqF75xrZSoibs4/aZCWq52yJEuPj5UCoQHReUIa6cCwqBkk0r4oE5M1AZz4
 8z6VKxBCj5CnfRbp7w3qI9YC4JYcVN3pc8o8J+Pr0taWb8mtxhZoGKuVTiVrKGeiH1rFVo
 qCQr5RXRMH3h0ktbEeSMwz6a8xBOw6s=
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-654-d4gmi1YJNvGYTU6ms7mdOg-1; Tue, 25 Apr 2023 04:53:18 -0400
X-MC-Unique: d4gmi1YJNvGYTU6ms7mdOg-1
Received: by mail-wr1-f71.google.com with SMTP id
 ffacd0b85a97d-2f479aeddc4so3074201f8f.2
 for <qemu-devel@nongnu.org>; Tue, 25 Apr 2023 01:53:18 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1682412796; x=1685004796;
 h=mime-version:message-id:date:reply-to:user-agent:references
 :in-reply-to:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=ZIIZvS6vqmCMvuPrGtYyn+sXSDj/0YhGOVOxi1Rl7Ls=;
 b=mA2ZFoXTsvaGZhsJsIlbpLSOyZZDlUf3Sd3mrJ5fk6TQjjnFs4Vv6i6xl0fJRimdKe
 IKnNjci6wJBcGj5Y9X4bYHQdl5imlQiyrZtk4BG6/xKji46GOsQHYLAGboQexKEj0HCp
 zlLx8d3UIti4mUWObFkeMS3WkOeCF/gkgmxrA2eQ/OGLrgQdRcCZyJZl2xPGt/XK4Wuz
 jr+BI6z6Mt6BdExo2y1o+GRRe21fv9FHtxaEIXFXvX5Wj43be8vRrtfq390m4Y1bZvvE
 sxQAt80KEyEc9dzb2WTYeAEze63dXYDjwnOSET4HQ1kbNulACXA5ePW/7AxZQ9ZaT4vY
 z5rw==
X-Gm-Message-State: AAQBX9fGb0DUOPpuHM2RVQeKQikiP8Xc7hIXUyph+gMJLAO10u559MqH
 5xuRztdQEKs2n401OGIQGW1zKN4C6N8N/6+Jme3E4GfXx+4UXNNfrtFHQmU3EpgsqnTQEHgrfyy
 6hLcpSimYa6o4gcw=
X-Received: by 2002:a5d:498c:0:b0:301:5615:26e4 with SMTP id
 r12-20020a5d498c000000b00301561526e4mr10288875wrq.32.1682412796706; 
 Tue, 25 Apr 2023 01:53:16 -0700 (PDT)
X-Google-Smtp-Source: AKy350YLMuVDYL8FlcWcXMMZ7d6BlzcEj18PgAWDDcw02CEgudxIr9p8WxDIqT5TlM0eVT9js5oy/A==
X-Received: by 2002:a5d:498c:0:b0:301:5615:26e4 with SMTP id
 r12-20020a5d498c000000b00301561526e4mr10288860wrq.32.1682412796303; 
 Tue, 25 Apr 2023 01:53:16 -0700 (PDT)
Received: from redhat.com (static-214-39-62-95.ipcom.comunitel.net.
 [95.62.39.214]) by smtp.gmail.com with ESMTPSA id
 w23-20020a05600c099700b003f17af4c4e0sm17662589wmp.9.2023.04.25.01.53.15
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 25 Apr 2023 01:53:15 -0700 (PDT)
From: Juan Quintela <quintela@redhat.com>
To: Eric Blake <eblake@redhat.com>
Cc: qemu-devel@nongnu.org
Subject: git-format-patch useAutoBase (was Re: [PATCH v2] migration: Handle
 block ... )
In-Reply-To: <j3mm2jnmanpe6e5v3bvwgiv7av3pno2usmfc4mqnfvhi3gpvoo@zltviuih6b22>
 (Eric Blake's message of "Thu, 20 Apr 2023 09:25:54 -0500")
References: <20230414153358.1452040-1-eblake@redhat.com>
 <878remzvhm.fsf@secure.mitica>
 <j3mm2jnmanpe6e5v3bvwgiv7av3pno2usmfc4mqnfvhi3gpvoo@zltviuih6b22>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/28.2 (gnu/linux)
Date: Tue, 25 Apr 2023 10:53:14 +0200
Message-ID: <87ttx4s5qd.fsf_-_@secure.mitica>
MIME-Version: 1.0
Content-Type: text/plain
Received-SPF: pass client-ip=170.10.133.124; envelope-from=quintela@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -22
X-Spam_score: -2.3
X-Spam_bar: --
X-Spam_report: (-2.3 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.171,
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
Reply-To: quintela@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

Eric Blake <eblake@redhat.com> wrote:
> On Thu, Apr 20, 2023 at 12:41:25PM +0200, Juan Quintela wrote:
>> Eric Blake <eblake@redhat.com> wrote:
>
> ...lots of lines...
>
>> > ---
>> >  migration/migration.c | 5 ++---
>> >  1 file changed, 2 insertions(+), 3 deletions(-)
>
> ...describing a tiny change ;)
>
>> >
>> > diff --git a/migration/migration.c b/migration/migration.c
>> > index bda47891933..cb0d42c0610 100644
>> > --- a/migration/migration.c
>> > +++ b/migration/migration.c
>> > @@ -3444,13 +3444,11 @@ static void migration_completion(MigrationState *s)
>> >                                              MIGRATION_STATUS_DEVICE);
>> >              }
>> >              if (ret >= 0) {
>> > +                s->block_inactive = inactivate;
>> >                  qemu_file_set_rate_limit(s->to_dst_file, INT64_MAX);
>> >                  ret = qemu_savevm_state_complete_precopy(s->to_dst_file, false,
>> >                                                           inactivate);
>> >              }
>> > -            if (inactivate && ret >= 0) {
>> > -                s->block_inactive = true;
>> > -            }
>> >          }
>> >          qemu_mutex_unlock_iothread();
>> 
>> And I still have to look at the file to understand this "simple" patch.
>> (simple in size, not in what it means).
>
> Indeed - hence the long commit message!
>
>> 
>> I will add this to my queue, but if you are in the "mood", I would like
>> to remove the declaration of inactivate and change this to something like:
>> 
>>              if (ret >= 0) {
>>                  /* Colo don't stop disks in normal operation */
>>                  s->block_inactive = !migrate_colo_enabled();
>>                  qemu_file_set_rate_limit(s->to_dst_file, INT64_MAX);
>>                  ret = qemu_savevm_state_complete_precopy(s->to_dst_file, false,
>>                                                           s->block_inactive);
>>              }
>> 
>> Or something around that lines?
>
> Yes, that looks like a trivial refactoring that preserves the same
> semantics.
>
>> 
>> > @@ -3522,6 +3520,7 @@ fail_invalidate:
>> >          bdrv_activate_all(&local_err);
>> >          if (local_err) {
>> >              error_report_err(local_err);
>> > +            s->block_inactive = true;
>> >          } else {
>> >              s->block_inactive = false;
>> >          }
>> > base-commit: 7dbd6f8a27e30fe14adb3d5869097cddf24038d6
>> 
>> Just wondering, what git magic creates this line?
>
> git send-email --base=COMMIT_ID
>
> or even 'git config format.useAutoBase whenAble' to try and automate
> the use of this.  (If my own git habits were cleaner, of always
> sticking patches in fresh branches, --base=auto is handy; but in
> practice, I tend to send one-off patches like this in the middle of
> 'git rebase' of a larger series, at which point I'm not on a clean
> branch where --base=auto works, so I end up having to manually specify
> one at the command line.  Either way, including the base-commit: info
> can be very informative for applying a patch at the branch point then
> rebasing it locally, when attempting to apply the patch sent through
> email hits merge conflicts when applying it directly to changes on
> master in the meantime; I believe 'git am -3' is even able to exploit
> the comment when present to make smarter decisions about which parent
> commit it tries for doing 3-way patch resolution)

Thanks a lot.

It does the right thing for "trivial" stuff, i.e. when I sent a single
patch or a series against qemu/master.

I am not completely sure that it does the right thing when I send a
series on top of my previous pull request.

097387873b (HEAD -> atomic_counters) migration: Make dirty_bytes_last_sync atomic
3f699a13b2 migration: Make dirty_pages_rate atomic
276a275895 (next) migration: Move qmp_migrate_set_parameters() to options.c
ab13b47801 migration: Move migrate_use_tls() to options.c
ecf5c18eac MAINTAINERS: Add Leonardo and Peter as reviewers
6e5dda696c migration: Disable postcopy + multifd migration
ac5f7bf8e2 (qemu/staging, qemu/master, qemu/HEAD) Merge tag 'migration-20230424-pull-request' of https://gitlab.com/juan.quintela/qemu into staging

where the branchs are:

qemu/master: obvious
next: whatever is going to be on next migration PULL request, I will
      rename this to migration-$date and send this series to the list
      1st. I.e. assume they are on list but still not on master.
HEAD/atomic_counters: This is the series that I am sending

I have done:


>>                  ret = qemu_savevm_state_complete_precopy(s->to_dst_file, false,
>>                                                           s->block_inactive);
>>              }
>> 
>> Or something around that lines?
>
> Yes, that looks like a trivial refactoring that preserves the same
> semantics.
>
>> 
>> > @@ -3522,6 +3520,7 @@ fail_invalidate:
>> >          bdrv_activate_all(&local_err);
>> >          if (local_err) {
>> >              error_report_err(local_err);
>> > +            s->block_inactive = true;
>> >          } else {
>> >              s->block_inactive = false;
>> >          }
>> > base-commit: 7dbd6f8a27e30fe14adb3d5869097cddf24038d6
>> 
>> Just wondering, what git magic creates this line?
>
> git send-email --base=COMMIT_ID
>
> or even 'git config format.useAutoBase whenAble' to try and automate
> the use of this.  (If my own git habits were cleaner, of always
> sticking patches in fresh branches, --base=auto is handy; but in
> practice, I tend to send one-off patches like this in the middle of
> 'git rebase' of a larger series, at which point I'm not on a clean
> branch where --base=auto works, so I end up having to manually specify
> one at the command line.  Either way, including the base-commit: info
> can be very informative for applying a patch at the branch point then
> rebasing it locally, when attempting to apply the patch sent through
> email hits merge conflicts when applying it directly to changes on
> master in the meantime; I believe 'git am -3' is even able to exploit
> the comment when present to make smarter decisions about which parent
> commit it tries for doing 3-way patch resolution)

Thanks a lot.

It does the right thing for "trivial" stuff, i.e. when I sent a single
patch or a series against qemu/master.

I am not completely sure that it does the right thing when I send a
series on top of my previous pull request.

097387873b (HEAD -> atomic_counters) migration: Make dirty_bytes_last_sync atomic
3f699a13b2 migration: Make dirty_pages_rate atomic
276a275895 (next) migration: Move qmp_migrate_set_parameters() to options.c
ab13b47801 migration: Move migrate_use_tls() to options.c
ecf5c18eac MAINTAINERS: Add Leonardo and Peter as reviewers
6e5dda696c migration: Disable postcopy + multifd migration
ac5f7bf8e2 (qemu/staging, qemu/master, qemu/HEAD) Merge tag 'migration-20230424-pull-request' of https://gitlab.com/juan.quintela/qemu into staging

where the branchs are:

qemu/master: obvious
next: whatever is going to be on next migration PULL request, I will
      rename this to migration-$date and send this series to the list
      1st. I.e. assume they are on list but still not on master.
HEAD/atomic_counters: This is the series that I am sending


I have done first:

git branch --set-upstream-to=qemu/master

Because that is what the "real" master is, migration-$date is just an
intermediate "state".

git format-patch --cover-letter next -o /tmp/kk

In this case both useAutoBase=whenAble and useAutoBase=true do the same
"right" thing.

From 097387873b2ef1894d5713fdfda8a7b2492476e5 Mon Sep 17 00:00:00 2001
...

Juan Quintela (2):
  migration: Make dirty_pages_rate atomic
  migration: Make dirty_bytes_last_sync atomic

 migration/migration.c | 10 +++++++---
 migration/ram.c       |  8 +++++---
 migration/ram.h       |  4 ++--
 3 files changed, 14 insertions(+), 8 deletions(-)


base-commit: ac5f7bf8e208cd7893dbb1a9520559e569a4677c
prerequisite-patch-id: 08dd37c2ffd8463398e00cade80765b017200b68
prerequisite-patch-id: 3a1d25d5e4f1f615b6e2c6749dcf891959ca48b5
prerequisite-patch-id: 5607c75cc228370df8953987c390682de3093b65
prerequisite-patch-id: ccb4d94973bd111380e4b50f781eeb6cfa7ce5ff

In obvious cases I do the rebase on top of qemu/master, but that is when
there is no dependencies with the PULL request, and that is not the
"interesting" case.

Thanks again, Juan.


