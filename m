Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3835F3C13C7
	for <lists+qemu-devel@lfdr.de>; Thu,  8 Jul 2021 15:04:40 +0200 (CEST)
Received: from localhost ([::1]:45346 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m1Thn-0003cF-8f
	for lists+qemu-devel@lfdr.de; Thu, 08 Jul 2021 09:04:39 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41458)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1m1TZk-0005Ki-Ed
 for qemu-devel@nongnu.org; Thu, 08 Jul 2021 08:56:21 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:32902)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1m1TZf-0005l4-4C
 for qemu-devel@nongnu.org; Thu, 08 Jul 2021 08:56:18 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1625748973;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=wVYQz76PJMsxb6i1TYDCsClwk+RQFe8O7mo7oWqIiK0=;
 b=Gvi6kLL1LZSYGJo0bEQy9zOxaWWtOtYqbumnknA78FMUjjH0p6VWJ6JqJyuX4biJ9lT7OD
 iEu7VsBpfqiirwq/r10Q2ylqyr2Ro7L1zaiAtis0aSPbg5QJOrh2kFikVI+USMwE9/myHg
 /Ah4KR0HSQUz9C02cUU8nJinWM8xcMo=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-203-BJczqGbhNru8Zx4rH14aGw-1; Thu, 08 Jul 2021 08:56:12 -0400
X-MC-Unique: BJczqGbhNru8Zx4rH14aGw-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id AA5C8193F560;
 Thu,  8 Jul 2021 12:56:10 +0000 (UTC)
Received: from localhost (ovpn-114-141.ams2.redhat.com [10.36.114.141])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 9FDAF5D9FC;
 Thu,  8 Jul 2021 12:56:09 +0000 (UTC)
Date: Thu, 8 Jul 2021 13:56:08 +0100
From: Stefan Hajnoczi <stefanha@redhat.com>
To: Emanuele Giuseppe Esposito <eesposit@redhat.com>
Subject: Re: [RFC PATCH 5/6] job: use global job_mutex to protect struct Job
Message-ID: <YOb16JltX56P88Vo@stefanha-x1.localdomain>
References: <20210707165813.55361-1-eesposit@redhat.com>
 <20210707165813.55361-6-eesposit@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20210707165813.55361-6-eesposit@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=stefanha@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="IuxuGRpfjYjW2hcl"
Content-Disposition: inline
Received-SPF: pass client-ip=216.205.24.124; envelope-from=stefanha@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.45,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: Kevin Wolf <kwolf@redhat.com>,
 Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>, qemu-block@nongnu.org,
 qemu-devel@nongnu.org, Wen Congyang <wencongyang2@huawei.com>,
 Xie Changlong <xiechanglong.d@gmail.com>,
 Markus Armbruster <armbru@redhat.com>, Max Reitz <mreitz@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>, John Snow <jsnow@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

--IuxuGRpfjYjW2hcl
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Jul 07, 2021 at 06:58:12PM +0200, Emanuele Giuseppe Esposito wrote:
> This lock is going to replace most of the AioContext locks
> in the job and blockjob, so that a Job can run in an arbitrary
> AioContext.
>=20
> Signed-off-by: Emanuele Giuseppe Esposito <eesposit@redhat.com>
> ---
>  include/block/blockjob_int.h |   1 +
>  include/qemu/job.h           |   2 +
>  block/backup.c               |   4 +
>  block/mirror.c               |  11 +-
>  blockdev.c                   |  62 ++++----
>  blockjob.c                   |  67 +++++++--
>  job-qmp.c                    |  55 +++----
>  job.c                        | 284 +++++++++++++++++++++++++++--------
>  qemu-img.c                   |  15 +-
>  9 files changed, 350 insertions(+), 151 deletions(-)
>=20
> diff --git a/include/block/blockjob_int.h b/include/block/blockjob_int.h
> index 6633d83da2..8b91126506 100644
> --- a/include/block/blockjob_int.h
> +++ b/include/block/blockjob_int.h
> @@ -53,6 +53,7 @@ struct BlockJobDriver {
>       */
>      void (*attached_aio_context)(BlockJob *job, AioContext *new_context)=
;
> =20
> +    /* Called with job mutex *not* held. */
>      void (*set_speed)(BlockJob *job, int64_t speed);
>  };
> =20
> diff --git a/include/qemu/job.h b/include/qemu/job.h
> index 4421d08d93..359f4e6b3a 100644
> --- a/include/qemu/job.h
> +++ b/include/qemu/job.h
> @@ -49,6 +49,8 @@ typedef struct Job {
>      /**
>       * The type of this job.
>       * Set it in job_create and just read.
> +     * All calls to the driver function must be not locked by job_mutex,
> +     * to avoid deadlocks.
>       */
>      const JobDriver *driver;
> =20
> diff --git a/block/backup.c b/block/backup.c
> index bd3614ce70..80ce956299 100644
> --- a/block/backup.c
> +++ b/block/backup.c
> @@ -315,6 +315,10 @@ static void coroutine_fn backup_pause(Job *job)
>      }
>  }
> =20
> +/*
> + * Called with job mutex *not* held (we don't want to call block_copy_ki=
ck
> + * with the lock held!)
> + */
>  static void coroutine_fn backup_set_speed(BlockJob *job, int64_t speed)
>  {
>      BackupBlockJob *s =3D container_of(job, BackupBlockJob, common);
> diff --git a/block/mirror.c b/block/mirror.c
> index 49aaaafffa..deefaa6a39 100644
> --- a/block/mirror.c
> +++ b/block/mirror.c
> @@ -1150,9 +1150,11 @@ static void mirror_complete(Job *job, Error **errp=
)
>      s->should_complete =3D true;
> =20
>      /* If the job is paused, it will be re-entered when it is resumed */
> +    job_lock();
>      if (!job_is_paused(job)) {
> -        job_enter(job);
> +        job_enter_locked(job);
>      }
> +    job_unlock();
>  }
> =20
>  static void coroutine_fn mirror_pause(Job *job)
> @@ -1171,10 +1173,13 @@ static bool mirror_drained_poll(BlockJob *job)
>       * from one of our own drain sections, to avoid a deadlock waiting f=
or
>       * ourselves.
>       */
> -    if (!job_is_paused(&s->common.job) && !job_is_cancelled(&s->common.j=
ob) &&
> -        !s->in_drain) {
> +    job_lock();
> +    if (!job_is_paused(&s->common.job) &&
> +        !job_is_cancelled_locked(&s->common.job) && !s->in_drain) {
> +        job_unlock();
>          return true;
>      }
> +    job_unlock();
> =20
>      return !!s->in_flight;
>  }
> diff --git a/blockdev.c b/blockdev.c
> index 8e2c15370e..9255aea6a2 100644
> --- a/blockdev.c
> +++ b/blockdev.c
> @@ -150,9 +150,11 @@ void blockdev_mark_auto_del(BlockBackend *blk)
>              AioContext *aio_context =3D job_get_aiocontext(&job->job);
>              aio_context_acquire(aio_context);
> =20
> +            job_lock();
>              job_cancel(&job->job, false);
> =20
>              aio_context_release(aio_context);
> +            job_unlock();

This looks strange. The way it's written suggests there is a reason why
job_unlock() has to be called after aio_context_release(). Can
job_unlock() be called immediately after job_cancel()?

>          }
>      }
> =20
> @@ -3309,48 +3311,44 @@ out:
>      aio_context_release(aio_context);
>  }
> =20
> -/* Get a block job using its ID and acquire its AioContext */
> -static BlockJob *find_block_job(const char *id, AioContext **aio_context=
,
> -                                Error **errp)
> +/* Get a block job using its ID and acquire its job_lock */

"its" suggests job_lock is per-Job. I suggest saying something like
"Returns with job_lock held on success" instead.

--IuxuGRpfjYjW2hcl
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhpWov9P5fNqsNXdanKSrs4Grc8gFAmDm9egACgkQnKSrs4Gr
c8jJDggAnhDYntoo2g5CiAPorLSzqqB4gxRVFmsvY4BrkBIwGk0uvsFUyJmUMj3O
50wPJ99pI75JLKAI1mHy16L8E+UHZyIdiP+cwXu1lGVRp3z1KhhEFrEVNwFee72S
jqN4o6fvdy4zTjWqOVSunkGDW11v3UzX+u+bytmkJs7YMbbI4QJ75TNIDJlHKlEZ
Vn/Q7Ni3PjbYZLVU/LyF5Pg4clq3zYTiXfhRNbLdElaDpaXDUc8SDZAQ2nqJZvSB
bTKLZoLlx07dfjE/2hpIoYm6s4P9cUR9WIKZp6mOUqV7OFH2H5tQkk/wxZgE1u0N
rYfqpJ29qtSRQ6JsnxQ8Xi8DR0QOqQ==
=nUry
-----END PGP SIGNATURE-----

--IuxuGRpfjYjW2hcl--


