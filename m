Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6B5A545427B
	for <lists+qemu-devel@lfdr.de>; Wed, 17 Nov 2021 09:19:23 +0100 (CET)
Received: from localhost ([::1]:60896 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mnGA6-0004fz-JC
	for lists+qemu-devel@lfdr.de; Wed, 17 Nov 2021 03:19:22 -0500
Received: from eggs.gnu.org ([209.51.188.92]:50656)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <quintela@redhat.com>)
 id 1mnG8p-0003VX-6r
 for qemu-devel@nongnu.org; Wed, 17 Nov 2021 03:18:03 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:38528)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <quintela@redhat.com>)
 id 1mnG8m-0000j9-QR
 for qemu-devel@nongnu.org; Wed, 17 Nov 2021 03:18:02 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1637137079;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:in-reply-to:in-reply-to:  references:references;
 bh=ose6WVLZb/ZaojO3hyOZU0kyXi3K3ogj+G9TKJd+aRA=;
 b=cfUzhlw9LG9mgGv2nCDgUmHA0hi/6Dw7yJ1mAlZ+E4hLinVEkQbrgrtzgubvZTLaCSTIrM
 vp3NL0FIUXTV3eaN/ScfBZmvw3Vt+tc9RAPi4y6SALMcqgRLvpJeSJ3A6QIktPYkF6UlW+
 i01er9HCSoB76s66KmH3e5zRUqPTk2A=
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-447-wjcihWCvNL2ZU9HoLs6-Ew-1; Wed, 17 Nov 2021 03:17:58 -0500
X-MC-Unique: wjcihWCvNL2ZU9HoLs6-Ew-1
Received: by mail-wr1-f71.google.com with SMTP id
 k8-20020a5d5248000000b001763e7c9ce5so181068wrc.22
 for <qemu-devel@nongnu.org>; Wed, 17 Nov 2021 00:17:58 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:in-reply-to:references
 :user-agent:reply-to:date:message-id:mime-version;
 bh=ose6WVLZb/ZaojO3hyOZU0kyXi3K3ogj+G9TKJd+aRA=;
 b=hj0nrtZDZmv+bcqd6+JO/SkFYwbt3+mP0PqqkJB762un5+FMWvH/OkRdyIQqhDyCAY
 NeRT0OaU0aAi9CisP43glbN4acOjRXZLhzJ5yh4GMQWPVlP1tsrLDzPDegOXZ9BTTjK4
 fPrJEoewNXXz++YpylF4sfcDKb305o1ZJKVy2jTVLiisHAsAk/mFD7Nb5RJqHTxlvuok
 Ydi78dXc/P6h9o9XsBidbS33gMrMhQ5PFomx1245T7NPB4CpmHfTU/SBZ5xEQhui/nML
 Zjp2nx4JHNMq6KUDShHWbgYsgwngTzw/MixUTHlC7gTkJiCWsdvG0TZSxYTfKmpAIvtD
 6dFw==
X-Gm-Message-State: AOAM531rVIzGrvG+3QeQAQqbObLJFBW8vX37phjbUMj1Fghda59wjTqV
 Qcl7Sl/E5LEI53JJb9OI+G3pVkG24iGefUZU3+ahyHnhUKqtXJ1rJaJuceWW3Ehk3PrDtJwXbBF
 8CWxFdnqZjdU5L74=
X-Received: by 2002:a5d:6d86:: with SMTP id l6mr17528902wrs.304.1637137077243; 
 Wed, 17 Nov 2021 00:17:57 -0800 (PST)
X-Google-Smtp-Source: ABdhPJy+XLggTSsP0lDeLDrEBnah9kI4WX3Ucu6jEKF/AcDhXu0RcQqq02OSB99dVGLvrApziUbL/g==
X-Received: by 2002:a5d:6d86:: with SMTP id l6mr17528876wrs.304.1637137077046; 
 Wed, 17 Nov 2021 00:17:57 -0800 (PST)
Received: from localhost (static-233-86-86-188.ipcom.comunitel.net.
 [188.86.86.233])
 by smtp.gmail.com with ESMTPSA id r17sm5566026wmq.11.2021.11.17.00.17.56
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 17 Nov 2021 00:17:56 -0800 (PST)
From: Juan Quintela <quintela@redhat.com>
To: "Zhang, Chen" <chen.zhang@intel.com>
Subject: Re: [PATCH 1/2] migration/colo: Optimize COLO start code path
In-Reply-To: <MWHPR11MB003171BA9C71FFC191FD86B39B9A9@MWHPR11MB0031.namprd11.prod.outlook.com>
 (Chen Zhang's message of "Wed, 17 Nov 2021 03:21:40 +0000")
References: <20211110174156.3834330-1-chen.zhang@intel.com>
 <87lf1ouku8.fsf@secure.mitica>
 <MWHPR11MB003171BA9C71FFC191FD86B39B9A9@MWHPR11MB0031.namprd11.prod.outlook.com>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.2 (gnu/linux)
Date: Wed, 17 Nov 2021 09:17:55 +0100
Message-ID: <874k8burf0.fsf@secure.mitica>
MIME-Version: 1.0
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=quintela@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain
Received-SPF: pass client-ip=170.10.129.124; envelope-from=quintela@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.701,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: qemu-dev <qemu-devel@nongnu.org>,
 Hailiang Zhang <zhang.zhanghailiang@huawei.com>, "Dr . David Alan
 Gilbert" <dgilbert@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

"Zhang, Chen" <chen.zhang@intel.com> wrote:
>> -----Original Message-----
>> From: Juan Quintela <quintela@redhat.com>
>> Sent: Wednesday, November 17, 2021 12:28 AM
>> To: Zhang, Chen <chen.zhang@intel.com>
>> Cc: Hailiang Zhang <zhang.zhanghailiang@huawei.com>; Dr . David Alan
>> Gilbert <dgilbert@redhat.com>; qemu-dev <qemu-devel@nongnu.org>
>> Subject: Re: [PATCH 1/2] migration/colo: Optimize COLO start code path
>> 
>> Zhang Chen <chen.zhang@intel.com> wrote:
>> > There is no need to start COLO through MIGRATION_STATUS_ACTIVE.
>> 
>> Hi
>> 
>> I don't understand what you are trying to do.  In my reading, at least the
>> commit message is wrong:
>> 
>> void migrate_start_colo_process(MigrationState *s) {
>>     ...
>>     migrate_set_state(&s->state, MIGRATION_STATUS_ACTIVE,
>>                       MIGRATION_STATUS_COLO);
>>     ...
>> }
>> 
>> and
>> 
>> void *colo_process_incoming_thread(void *opaque) {
>>     ...
>>     migrate_set_state(&mis->state, MIGRATION_STATUS_ACTIVE,
>>                       MIGRATION_STATUS_COLO);
>> 
>> So colo starts with MIGRATION_STATUS_ACTIVE.
>
> Yes, this patch just optimized COLO primary code path(migrate_start_colo_process()).
> We can see this patch removed the 
>  migrate_set_state(&s->state, MIGRATION_STATUS_ACTIVE,
>                       MIGRATION_STATUS_COLO);
> In the migrate_start_colo_process().
>
> Current COLO status path:
>  MIGRATION_STATUS_XXX   --->   MIGRATION_STATUS_ACTIVE ---> MIGRATION_STATUS_COLO ---> MIGRATION_STATUS_COMPLETED
>
> This patch try to remove redundant " MIGRATION_STATUS_ACTIVE " in COLO start. 
> MIGRATION_STATUS_XXX   ---> MIGRATION_STATUS_COLO ---> MIGRATION_STATUS_COMPLETED
>
> Actually COLO primary code did nothing when running on "MIGRATION_STATUS_ACTIVE".
> But for COLO secondary (void *colo_process_incoming_thread()), it shared some code with normal migration. No need to do this.
>
> So, I will fix commit message to:
> Optimize COLO primary start path to:
> MIGRATION_STATUS_XXX   ---> MIGRATION_STATUS_COLO ---> MIGRATION_STATUS_COMPLETED
> No need to start primary COLO through "MIGRATION_STATUS_ACTIVE".
>
> How about it?

Much better, thank.s

>> > Signed-off-by: Zhang Chen <chen.zhang@intel.com>
>> > ---
>> >  migration/colo.c      |  2 --
>> >  migration/migration.c | 18 +++++++++++-------
>> >  2 files changed, 11 insertions(+), 9 deletions(-)
>> >
>> > diff --git a/migration/colo.c b/migration/colo.c index
>> > 2415325262..ad1a4426b3 100644
>> > --- a/migration/colo.c
>> > +++ b/migration/colo.c
>> > @@ -667,8 +667,6 @@ void migrate_start_colo_process(MigrationState *s)
>> >                                  colo_checkpoint_notify, s);
>> >
>> >      qemu_sem_init(&s->colo_exit_sem, 0);
>> > -    migrate_set_state(&s->state, MIGRATION_STATUS_ACTIVE,
>> > -                      MIGRATION_STATUS_COLO);
>> >      colo_process_checkpoint(s);
>> >      qemu_mutex_lock_iothread();
>> >  }
>> > diff --git a/migration/migration.c b/migration/migration.c index
>> > abaf6f9e3d..4c8662a839 100644
>> > --- a/migration/migration.c
>> > +++ b/migration/migration.c
>> > @@ -3222,7 +3222,10 @@ static void migration_completion(MigrationState
>> *s)
>> >          goto fail_invalidate;
>> >      }
>> >
>> > -    if (!migrate_colo_enabled()) {
>> > +    if (migrate_colo_enabled()) {
>> > +        migrate_set_state(&s->state, current_active_state,
>> > +                          MIGRATION_STATUS_COLO);
>> > +    } else {
>> >          migrate_set_state(&s->state, current_active_state,
>> >                            MIGRATION_STATUS_COMPLETED);
>> >      }
>> 
>> This moves the setup to MIGRATION_STATUS_COLO to completion time
>> instead of the beggining of the process.  I have no clue why.  I guess you can
>> put a comment/commit message to say what you ar.e trynig to do.
>
> You are right, no need to setup here.
> I will remove this in next version.

Thanks.

>> > @@ -3607,12 +3610,7 @@ static void
>> migration_iteration_finish(MigrationState *s)
>> >          migration_calculate_complete(s);
>> >          runstate_set(RUN_STATE_POSTMIGRATE);
>> >          break;
>> > -
>> > -    case MIGRATION_STATUS_ACTIVE:
>> > -        /*
>> > -         * We should really assert here, but since it's during
>> > -         * migration, let's try to reduce the usage of assertions.
>> > -         */
>> > +    case MIGRATION_STATUS_COLO:
>> >          if (!migrate_colo_enabled()) {
>> >              error_report("%s: critical error: calling COLO code without "
>> >                           "COLO enabled", __func__); @@ -3622,6
>> > +3620,12 @@ static void migration_iteration_finish(MigrationState *s)
>> >           * Fixme: we will run VM in COLO no matter its old running state.
>> >           * After exited COLO, we will keep running.
>> >           */
>> > +         /* Fallthrough */
>> > +    case MIGRATION_STATUS_ACTIVE:
>> > +        /*
>> > +         * We should really assert here, but since it's during
>> > +         * migration, let's try to reduce the usage of assertions.
>> > +         */
>> >          s->vm_was_running = true;
>> >          /* Fallthrough */
>> >      case MIGRATION_STATUS_FAILED:
>> 
>> I guess this change is related to the previous one, but I don't understand colo
>> enough to review it.
>
> I think this patch is the general code, little background needed.
> You can simple understand COLO is two VMs(primary node and secondary node) entered a state of cyclic migration.
> Thanks your comments.

Later, Juan.


