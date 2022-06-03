Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BB76053CD20
	for <lists+qemu-devel@lfdr.de>; Fri,  3 Jun 2022 18:23:54 +0200 (CEST)
Received: from localhost ([::1]:50782 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nxA5Z-0001vV-TO
	for lists+qemu-devel@lfdr.de; Fri, 03 Jun 2022 12:23:53 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48908)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1nx9zb-00045Q-94
 for qemu-devel@nongnu.org; Fri, 03 Jun 2022 12:17:44 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:32650)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1nx9zY-00035Q-4d
 for qemu-devel@nongnu.org; Fri, 03 Jun 2022 12:17:41 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1654273058;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=pQgff9nEORqu/5tVhp0EoSpgvRPX1RAtXgw4Adw8ZtQ=;
 b=CKJzez6KP9J79eXMHwv00We6JRiqLKGUK3uFXSF8mxy8nOez5YxtGyPm/2opAowmVhKdny
 60J+6huEnUPzltSiiWpuM0tcvCtaf6Daf7v0S74DyhAkdsjaF6j/My2MEj3vZG9Ifm2WPO
 UCY/SZd2J0KvSYL5KW3SHbg0aQ8TLLs=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-26-5z6tcLPkOVKL-ZI7BgYQKA-1; Fri, 03 Jun 2022 12:17:35 -0400
X-MC-Unique: 5z6tcLPkOVKL-ZI7BgYQKA-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.rdu2.redhat.com
 [10.11.54.3])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 1A015185A79C;
 Fri,  3 Jun 2022 16:17:35 +0000 (UTC)
Received: from redhat.com (unknown [10.39.194.36])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 0CC261121314;
 Fri,  3 Jun 2022 16:17:32 +0000 (UTC)
Date: Fri, 3 Jun 2022 18:17:31 +0200
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
Subject: Re: [PATCH v6 05/18] job.h: add _locked duplicates for job API
 functions called with and without job_mutex
Message-ID: <Ypo0G0/jK+mLOuAm@redhat.com>
References: <20220314133707.2206082-1-eesposit@redhat.com>
 <20220314133707.2206082-6-eesposit@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220314133707.2206082-6-eesposit@redhat.com>
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.3
Received-SPF: pass client-ip=170.10.133.124; envelope-from=kwolf@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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

Am 14.03.2022 um 14:36 hat Emanuele Giuseppe Esposito geschrieben:
> In preparation to the job_lock/unlock usage, create _locked
> duplicates of some functions, since they will be sometimes called with
> job_mutex held (mostly within job.c),
> and sometimes without (mostly from JobDrivers using the job API).
> 
> Therefore create a _locked version of such function, so that it
> can be used in both cases.
> 
> List of functions duplicated as _locked:
> job_is_ready (both versions are public)
> job_is_completed (both versions are public)
> job_is_cancelled (_locked version is public, needed by mirror.c)
> job_pause_point (_locked version is static, purely done to simplify the code)
> job_cancel_requested (_locked version is static)
> 
> Note: at this stage, job_{lock/unlock} and job lock guard macros
> are *nop*.
> 
> Signed-off-by: Emanuele Giuseppe Esposito <eesposit@redhat.com>
> ---
>  include/qemu/job.h | 25 +++++++++++++++++++++---
>  job.c              | 48 ++++++++++++++++++++++++++++++++++++++++------
>  2 files changed, 64 insertions(+), 9 deletions(-)
> 
> diff --git a/include/qemu/job.h b/include/qemu/job.h
> index 6000463126..aa33d091b1 100644
> --- a/include/qemu/job.h
> +++ b/include/qemu/job.h
> @@ -473,21 +473,40 @@ const char *job_type_str(const Job *job);
>  /** Returns true if the job should not be visible to the management layer. */
>  bool job_is_internal(Job *job);
>  
> -/** Returns whether the job is being cancelled. */
> +/**
> + * Returns whether the job is being cancelled.
> + * Called with job_mutex *not* held.
> + */
>  bool job_is_cancelled(Job *job);
>  
> +/** Just like job_is_cancelled, but called between job_lock and job_unlock */
> +bool job_is_cancelled_locked(Job *job);
> +
>  /**
>   * Returns whether the job is scheduled for cancellation (at an
>   * indefinite point).
> + * Called with job_mutex *not* held.
>   */
>  bool job_cancel_requested(Job *job);
>  
> -/** Returns whether the job is in a completed state. */
> +/**
> + * Returns whether the job is in a completed state.
> + * Called with job_mutex *not* held.
> + */
>  bool job_is_completed(Job *job);
>  
> -/** Returns whether the job is ready to be completed. */
> +/** Same as job_is_completed(), but assumes job_lock is held. */
> +bool job_is_completed_locked(Job *job);

Any reason why this comment is phrased differently than for
job_is_cancelled_locked()? I don't mind which one we use, but if they
should express the same thing, it would be better to have the same
wording. If they should express different things, it need to be clearer
what they are.

Also, I assume job_mutex is meant because job_lock() is a function, not
the lock that is held.

> +/**
> + * Returns whether the job is ready to be completed.
> + * Called with job_mutex *not* held.
> + */
>  bool job_is_ready(Job *job);
>  
> +/** Same as job_is_ready(), but assumes job_lock is held. */
> +bool job_is_ready_locked(Job *job);

Same as above.

>  /**
>   * Request @job to pause at the next pause point. Must be paired with
>   * job_resume(). If the job is supposed to be resumed by user action, call

Kevin


