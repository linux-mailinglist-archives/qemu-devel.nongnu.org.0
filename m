Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 04EDE596C82
	for <lists+qemu-devel@lfdr.de>; Wed, 17 Aug 2022 12:04:08 +0200 (CEST)
Received: from localhost ([::1]:43816 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oOFuA-0006mp-L0
	for lists+qemu-devel@lfdr.de; Wed, 17 Aug 2022 06:04:06 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43430)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1oOFpr-0003vS-9b
 for qemu-devel@nongnu.org; Wed, 17 Aug 2022 05:59:39 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:56480)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1oOFpp-0005Wb-8R
 for qemu-devel@nongnu.org; Wed, 17 Aug 2022 05:59:39 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1660730376;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=GykTeu2ZhOU6JIjSC/tN++Aoc6qvEKUlZtYlaTBi4qY=;
 b=XNtKsUA/hcoz8JcBtjQr5/AtMhuZjStbS26rv8ko2DtYEEB6xJxNeRjLejqFuadhG+Tdt6
 TELTNuA2bce7LGLce4Y9bxpjOclYcLqPuSmwl9S4MmyosWhsOoYp4/ZR5rLMSrpwyixxjP
 nUVyZ8aPeN0aEG/5ugGcqUWYGrILeJk=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-132-MpRdrt62MIWcj0n0LtjIbA-1; Wed, 17 Aug 2022 05:59:31 -0400
X-MC-Unique: MpRdrt62MIWcj0n0LtjIbA-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.rdu2.redhat.com
 [10.11.54.5])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 9A0B13814945;
 Wed, 17 Aug 2022 09:59:30 +0000 (UTC)
Received: from redhat.com (unknown [10.39.192.252])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id A220F94585;
 Wed, 17 Aug 2022 09:59:27 +0000 (UTC)
Date: Wed, 17 Aug 2022 11:59:26 +0200
From: Kevin Wolf <kwolf@redhat.com>
To: Emanuele Giuseppe Esposito <eesposit@redhat.com>
Cc: qemu-block@nongnu.org, Hanna Reitz <hreitz@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>, John Snow <jsnow@redhat.com>,
 Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>,
 Wen Congyang <wencongyang2@huawei.com>,
 Xie Changlong <xiechanglong.d@gmail.com>,
 Markus Armbruster <armbru@redhat.com>,
 Stefan Hajnoczi <stefanha@redhat.com>, Fam Zheng <fam@euphon.net>,
 qemu-devel@nongnu.org
Subject: Re: [PATCH v10 11/21] jobs: group together API calls under the same
 job lock
Message-ID: <Yvy7/rSkJGB0Iqnb@redhat.com>
References: <20220725073855.76049-1-eesposit@redhat.com>
 <20220725073855.76049-12-eesposit@redhat.com>
 <Yuv9cKJotWg0NEno@redhat.com>
 <1ed3c1c5-8393-2dc8-c930-606b73778a6b@redhat.com>
 <Yvyq/jhJ0B0W6mtF@redhat.com>
 <d818712b-b304-7646-5664-0bc262304138@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <d818712b-b304-7646-5664-0bc262304138@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.11.54.5
Received-SPF: pass client-ip=170.10.133.124; envelope-from=kwolf@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Am 17.08.2022 um 11:35 hat Emanuele Giuseppe Esposito geschrieben:
> 
> 
> Am 17/08/2022 um 10:46 schrieb Kevin Wolf:
> >>>> @@ -475,13 +477,15 @@ void *block_job_create(const char *job_id, const BlockJobDriver *driver,
> >>>>      job->ready_notifier.notify = block_job_event_ready;
> >>>>      job->idle_notifier.notify = block_job_on_idle;
> >>>>  
> >>>> -    notifier_list_add(&job->job.on_finalize_cancelled,
> >>>> -                      &job->finalize_cancelled_notifier);
> >>>> -    notifier_list_add(&job->job.on_finalize_completed,
> >>>> -                      &job->finalize_completed_notifier);
> >>>> -    notifier_list_add(&job->job.on_pending, &job->pending_notifier);
> >>>> -    notifier_list_add(&job->job.on_ready, &job->ready_notifier);
> >>>> -    notifier_list_add(&job->job.on_idle, &job->idle_notifier);
> >>>> +    WITH_JOB_LOCK_GUARD() {
> >>>> +        notifier_list_add(&job->job.on_finalize_cancelled,
> >>>> +                          &job->finalize_cancelled_notifier);
> >>>> +        notifier_list_add(&job->job.on_finalize_completed,
> >>>> +                          &job->finalize_completed_notifier);
> >>>> +        notifier_list_add(&job->job.on_pending, &job->pending_notifier);
> >>>> +        notifier_list_add(&job->job.on_ready, &job->ready_notifier);
> >>>> +        notifier_list_add(&job->job.on_idle, &job->idle_notifier);
> >>>> +    }
> >>>>  
> >>>>      error_setg(&job->blocker, "block device is in use by block job: %s",
> >>>>                 job_type_str(&job->job));
> >>> Why is this the right scope for the lock? It looks very arbitrary to
> >>> lock only here, but not for the assignments above or the function calls
> >>> below.
> >>>
> >>> Given that job_create() already puts the job in the job_list so it
> >>> becomes visible for other code, should we not keep the job lock from the
> >>> moment that we create the job until it is fully initialised?
> >> I try to protect only what needs protection, nothing more. Otherwise
> >> then it is not clear what are we protecting and why. According to the
> >> split I made in job.h, things like job_type_str and whatever I did not
> >> protect are not protected because they don't need the lock.
> > I think the last paragraph above explains what it would protect?
> > 
> > Having a half-initialised job in the job list without holding the lock
> > sounds dangerous to me. Maybe it's actually okay in practice because
> > this is GLOBAL_STATE_CODE() and we can assume that code accessing
> > the job list outside of the main thread probably skips over the
> > half-initialised job, but it's another case where relying on the BQL is
> > confusing when there would be a more specific lock for it.
> > 
> 
> Ok, but this would imply:
> 1. create job_create_locked()
> 2. still drop the lock when calling block_job_add_bdrv(), since I am
> pretty sure it can drain. So we still split the function in two (or
> maybe three, if we need to reaqiure the lock after) parts.

Ah, crap. Temporarily dropping the lock makes it useless, the incomplete
state is then still visible to the outside. So the locked section would
have to end before it.

Maybe just leave it as it is then.

Kevin


