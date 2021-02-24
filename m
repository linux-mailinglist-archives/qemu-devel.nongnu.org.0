Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CDBCF32431D
	for <lists+qemu-devel@lfdr.de>; Wed, 24 Feb 2021 18:24:02 +0100 (CET)
Received: from localhost ([::1]:48344 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lExtJ-0000Qi-RN
	for lists+qemu-devel@lfdr.de; Wed, 24 Feb 2021 12:24:01 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:45812)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1lExaZ-0007gN-1V
 for qemu-devel@nongnu.org; Wed, 24 Feb 2021 12:04:40 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:34484)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1lExaK-0000W2-BE
 for qemu-devel@nongnu.org; Wed, 24 Feb 2021 12:04:38 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1614186261;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=vAKRQMVWy4LJyfobS8j37UjALrYlzzxexycDVD+gCSQ=;
 b=PkhkTDUt4EVe6L+EDXfergwrf1Uks1KoRT38GrEvgYboS+6hKLpdmzjrSsPv+i10KBmgg1
 Bb0SN6QFrhflb0S8LjcXxUf5QgBn2FNzn7CVuFx8W5F74aWTUXKbb/tEIJIDSxzBS0wfY+
 GGBOs2ZKzWa40Oalt1hGs3rcMfX7Wo0=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-536-7J5LbhUKP0Wda37qu4zmZw-1; Wed, 24 Feb 2021 12:04:18 -0500
X-MC-Unique: 7J5LbhUKP0Wda37qu4zmZw-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id BA1F51876555;
 Wed, 24 Feb 2021 17:04:17 +0000 (UTC)
Received: from merkur.fritz.box (ovpn-114-142.ams2.redhat.com [10.36.114.142])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 6F4895D6D3;
 Wed, 24 Feb 2021 17:04:16 +0000 (UTC)
Date: Wed, 24 Feb 2021 18:04:14 +0100
From: Kevin Wolf <kwolf@redhat.com>
To: Stefano Garzarella <sgarzare@redhat.com>
Subject: Re: [PATCH] blockjob: report a better error message
Message-ID: <20210224170414.GG11025@merkur.fritz.box>
References: <20210223131150.124867-1-sgarzare@redhat.com>
 <20210224143620.GB11025@merkur.fritz.box>
 <20210224155925.kzyatjog67ldwpzf@steredhat>
MIME-Version: 1.0
In-Reply-To: <20210224155925.kzyatjog67ldwpzf@steredhat>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=kwolf@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=63.128.21.124; envelope-from=kwolf@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>,
 John Snow <jsnow@redhat.com>, qemu-devel@nongnu.org, qemu-block@nongnu.org,
 Max Reitz <mreitz@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Am 24.02.2021 um 16:59 hat Stefano Garzarella geschrieben:
> On Wed, Feb 24, 2021 at 03:36:20PM +0100, Kevin Wolf wrote:
> > Am 23.02.2021 um 14:11 hat Stefano Garzarella geschrieben:
> > > When a block job fails, we report 'strerror(-job->job.ret)' error
> > > message, also if the job set an error object.
> > > Let's report a better error message using 'error_get_pretty(job->job.err)'.
> > > 
> > > If an error object was not set, strerror(-job->ret) is used as fallback,
> > > as explained in include/qemu/job.h:
> > > 
> > > typedef struct Job {
> > >     ...
> > >     /**
> > >      * Error object for a failed job.
> > >      * If job->ret is nonzero and an error object was not set, it will be set
> > >      * to strerror(-job->ret) during job_completed.
> > >      */
> > >     Error *err;
> > > }
> > 
> > This is true, but there is a short time where job->ret is already set,
> > but not turned into job->err yet if necessary. The latter is done in a
> > bottom half scheduled after the former has happened.
> > 
> > It doesn't matter for block_job_event_completed(), which is called only
> > after both, but block_job_query() could in theory be called in this
> > window.
> > 
> > > Suggested-by: Kevin Wolf <kwolf@redhat.com>
> > > Signed-off-by: Stefano Garzarella <sgarzare@redhat.com>
> > > ---
> > >  blockjob.c | 5 +++--
> > >  1 file changed, 3 insertions(+), 2 deletions(-)
> > > 
> > > diff --git a/blockjob.c b/blockjob.c
> > > index f2feff051d..a696f3408d 100644
> > > --- a/blockjob.c
> > > +++ b/blockjob.c
> > > @@ -319,7 +319,8 @@ BlockJobInfo *block_job_query(BlockJob *job, Error **errp)
> > >      info->auto_finalize = job->job.auto_finalize;
> > >      info->auto_dismiss  = job->job.auto_dismiss;
> > >      info->has_error = job->job.ret != 0;
> > > -    info->error     = job->job.ret ? g_strdup(strerror(-job->job.ret)) : NULL;
> > > +    info->error     = job->job.ret ?
> > > +                        g_strdup(error_get_pretty(job->job.err)) : NULL;
> > 
> > So I think we can't rely on job->job.err being non-NULL here.
> 
> Do you think is better to leave it as it was or do something like this?
> 
>     if (job->job.ret) {
>         info->has_error = true;
>         info->error = job->job.err ? g_strdup(error_get_pretty(job->job.err)) :
>                         g_strdup(strerror(-job->job.ret);
>     }

Yes, I think this is the best solution. Use the error when we have it,
fall back to strerror() when we don't have it.

Kevin


