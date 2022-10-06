Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 158485F6D63
	for <lists+qemu-devel@lfdr.de>; Thu,  6 Oct 2022 20:15:38 +0200 (CEST)
Received: from localhost ([::1]:37934 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ogVPE-0004Lh-Gz
	for lists+qemu-devel@lfdr.de; Thu, 06 Oct 2022 14:15:36 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59890)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1ogU35-0008SS-0y
 for qemu-devel@nongnu.org; Thu, 06 Oct 2022 12:48:53 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:21071)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1ogU31-0003Gn-Vh
 for qemu-devel@nongnu.org; Thu, 06 Oct 2022 12:48:38 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1665074914;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=H1YLOn9YsDkJAyu1vVMhYfu/xRZL5Z3HBp+QNbLPgJc=;
 b=fs+y+qqPgGUnAy9QyYK0vCBfkwL9niGRhsrD79dcUq4YS0NVOsiT9fvLPuOWxiAkR5qMy0
 mX/hTQBZr5aeI0Z5RN4c9f2ZOP6UgRLvf10pKfwSQaVmp61SW2qo5rOuv0CkRPLD6JkNOa
 VLCq5YBfsgzG/0ySSOpEeVXmty6M/AU=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-3-tdMsfMP0NdSyO-qGY1wMGw-1; Thu, 06 Oct 2022 12:48:30 -0400
X-MC-Unique: tdMsfMP0NdSyO-qGY1wMGw-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.rdu2.redhat.com
 [10.11.54.7])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 06A0E3817A62;
 Thu,  6 Oct 2022 16:48:30 +0000 (UTC)
Received: from redhat.com (unknown [10.39.192.224])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id A8D1B145BA44;
 Thu,  6 Oct 2022 16:48:27 +0000 (UTC)
Date: Thu, 6 Oct 2022 18:48:26 +0200
From: Kevin Wolf <kwolf@redhat.com>
To: Emanuele Giuseppe Esposito <eesposit@redhat.com>
Cc: qemu-block@nongnu.org, Hanna Reitz <hreitz@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>, John Snow <jsnow@redhat.com>,
 Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>,
 Wen Congyang <wencongyang2@huawei.com>,
 Xie Changlong <xiechanglong.d@gmail.com>,
 Markus Armbruster <armbru@redhat.com>,
 Stefan Hajnoczi <stefanha@redhat.com>, Fam Zheng <fam@euphon.net>,
 qemu-devel@nongnu.org,
 Vladimir Sementsov-Ogievskiy <vsementsov@yandex-team.ru>
Subject: Re: [PATCH v12 16/21] blockjob: protect iostatus field in BlockJob
 struct
Message-ID: <Yz8G2kWGcs+i7lXc@redhat.com>
References: <20220926093214.506243-1-eesposit@redhat.com>
 <20220926093214.506243-17-eesposit@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220926093214.506243-17-eesposit@redhat.com>
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.7
Received-SPF: pass client-ip=170.10.129.124; envelope-from=kwolf@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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

Am 26.09.2022 um 11:32 hat Emanuele Giuseppe Esposito geschrieben:
> iostatus is the only field (together with .job) that needs
> protection using the job mutex.
> 
> It is set in the main loop (GLOBAL_STATE functions) but read
> in I/O code (block_job_error_action).
> 
> In order to protect it, change block_job_iostatus_set_err
> to block_job_iostatus_set_err_locked(), always called under
> job lock.
> 
> Signed-off-by: Emanuele Giuseppe Esposito <eesposit@redhat.com>
> Reviewed-by: Kevin Wolf <kwolf@redhat.com>
> Reviewed-by: Vladimir Sementsov-Ogievskiy <vsementsov@yandex-team.ru>
> ---
>  block/mirror.c | 7 +++++--
>  blockjob.c     | 5 +++--
>  2 files changed, 8 insertions(+), 4 deletions(-)
> 
> diff --git a/block/mirror.c b/block/mirror.c
> index c6bf7f40ce..7e32ee1d31 100644
> --- a/block/mirror.c
> +++ b/block/mirror.c
> @@ -893,7 +893,7 @@ static int coroutine_fn mirror_run(Job *job, Error **errp)
>      MirrorBlockJob *s = container_of(job, MirrorBlockJob, common.job);
>      BlockDriverState *bs = s->mirror_top_bs->backing->bs;
>      BlockDriverState *target_bs = blk_bs(s->target);
> -    bool need_drain = true;
> +    bool need_drain = true, iostatus;

iostatus isn't really a bool, it's BlockDeviceIoStatus.

>      int64_t length;
>      int64_t target_length;
>      BlockDriverInfo bdi;
> @@ -1016,8 +1016,11 @@ static int coroutine_fn mirror_run(Job *job, Error **errp)
>           * We do so every BLKOCK_JOB_SLICE_TIME nanoseconds, or when there is
>           * an error, or when the source is clean, whichever comes first. */
>          delta = qemu_clock_get_ns(QEMU_CLOCK_REALTIME) - s->last_pause_ns;
> +        WITH_JOB_LOCK_GUARD() {
> +            iostatus = s->common.iostatus;
> +        }
>          if (delta < BLOCK_JOB_SLICE_TIME &&
> -            s->common.iostatus == BLOCK_DEVICE_IO_STATUS_OK) {
> +            iostatus == BLOCK_DEVICE_IO_STATUS_OK) {

Your code actually happens to work because the one value that you
compare it against is BLOCK_DEVICE_IO_STATUS_OK, which is 0, so it maps
to false and everything else to true, but... it's still not right. :-)

>              if (s->in_flight >= MAX_IN_FLIGHT || s->buf_free_count == 0 ||
>                  (cnt == 0 && s->in_flight > 0)) {
>                  trace_mirror_yield(s, cnt, s->buf_free_count, s->in_flight);

Kevin


