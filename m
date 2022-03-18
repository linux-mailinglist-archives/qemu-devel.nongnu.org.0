Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D0AFB4DE41E
	for <lists+qemu-devel@lfdr.de>; Fri, 18 Mar 2022 23:38:39 +0100 (CET)
Received: from localhost ([::1]:43246 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nVLF0-0004Cn-BX
	for lists+qemu-devel@lfdr.de; Fri, 18 Mar 2022 18:38:38 -0400
Received: from eggs.gnu.org ([209.51.188.92]:47764)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1nVLDb-0003NA-IC
 for qemu-devel@nongnu.org; Fri, 18 Mar 2022 18:37:11 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:37651)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1nVLDY-000789-Fa
 for qemu-devel@nongnu.org; Fri, 18 Mar 2022 18:37:10 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1647643027;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=VFZB0WulLFalfZocvEG+ld7MvV5dFakFJARcy+HfVLY=;
 b=SD3wEjlopYXG1KEKSpdcW0k1/8n0k1UoUAdLL+KUDw4NH54cFOnppeynfUKZ7BE0MjfdB5
 ZVJhoo+yBYmF80udbl2CdrCNAFLYhw/P0yL6F5G0sVfuROwjNC5/Ng5ui5r39adYb4rLj9
 JTYb+him6VTs/uuez4I/DAGGlvv4SOI=
Received: from mail-ua1-f70.google.com (mail-ua1-f70.google.com
 [209.85.222.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-22-1Aj9M9i8PdyZmauF9IrK2A-1; Fri, 18 Mar 2022 18:37:03 -0400
X-MC-Unique: 1Aj9M9i8PdyZmauF9IrK2A-1
Received: by mail-ua1-f70.google.com with SMTP id
 s13-20020a056130020d00b0034dfb85694dso4450029uac.2
 for <qemu-devel@nongnu.org>; Fri, 18 Mar 2022 15:37:03 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=VFZB0WulLFalfZocvEG+ld7MvV5dFakFJARcy+HfVLY=;
 b=BPii5ahbcOgxd+tJWOLm0m9FLJURWckmHGkAsuMC2hpShbjkwkr2Q5MKGruOPpsPhS
 tjGTCvufB+WkKhBwNgJyW8hFu28OHpu5NH3474d8wlIBYrPxkeS0o+fmHrRQsq522Y/W
 UC6iziKJSAAu5RP7FqYhv/kAK4vr9oHaqKs0/+29IWq76g/Iit744yWYj2AlIfae4Inf
 mwZbDbN/5sy6VkKV55lvFLiwu4c0HcZ3nCMgRocxoj/XWZw8GnSkisda9VerL36e00CP
 FYNOttaXxg0NwcdkxRYdLPArDAhyf04b6vwvRJujufZxi2ZHwAj8YeizI/cbeFrG0Cww
 LwhQ==
X-Gm-Message-State: AOAM530cFnBMAin+yhdDSIGTzLUmQ+s7fZzfS50yPfYVuQu9BS0td8Z9
 LulXcxuoIwkD8v2sZJDJ1fUQGCVf52zpFv6tnlmauCrcb8xCSBC5v7jTI/K3Cb8m0h4Eg4mHUrE
 mawFw0XPU9u/XRXoyAUEHCG83LwNTaZ8=
X-Received: by 2002:a67:4c3:0:b0:324:ddd7:70d3 with SMTP id
 186-20020a6704c3000000b00324ddd770d3mr2015992vse.61.1647643022702; 
 Fri, 18 Mar 2022 15:37:02 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzLM3wVE4/Gcjg6wt9nPd2GLOon9otcgEPDKJUpgJgvtLkFc46fEE3uaMaAfcS0gkekBop3+gLx+UtaMniKVZc=
X-Received: by 2002:a67:4c3:0:b0:324:ddd7:70d3 with SMTP id
 186-20020a6704c3000000b00324ddd770d3mr2015983vse.61.1647643022388; Fri, 18
 Mar 2022 15:37:02 -0700 (PDT)
MIME-Version: 1.0
References: <20220318125304.66131-1-hreitz@redhat.com>
 <20220318125304.66131-2-hreitz@redhat.com>
In-Reply-To: <20220318125304.66131-2-hreitz@redhat.com>
From: John Snow <jsnow@redhat.com>
Date: Fri, 18 Mar 2022 18:36:51 -0400
Message-ID: <CAFn=p-bztKQOx+OvjshwRBUO47MUJhMJMEvt13i6jsMyKQskeA@mail.gmail.com>
Subject: Re: [PATCH 1/2] iotests.py: Filters for VM.run_job()
To: Hanna Reitz <hreitz@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=jsnow@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=170.10.133.124; envelope-from=jsnow@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H5=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
Cc: Kevin Wolf <kwolf@redhat.com>, qemu-devel <qemu-devel@nongnu.org>,
 Qemu-block <qemu-block@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Fri, Mar 18, 2022 at 8:53 AM Hanna Reitz <hreitz@redhat.com> wrote:
>
> Allow filters for VM.run_job(), and pass the filters given to
> VM.blockdev_create() to it.
>
> (Use this opportunity to annotate VM.run_job()'s parameter types;
> unfortunately, for the filter, I could not come up with anything better
> than Callable[[Any], Any] that would pass mypy's scrutiny.)
>

Yeah, I wrote some of this stuff ... before I started using mypy, and
I'd do it differently if I had to again.

(And might still do so: pulling out things like a generalized Job
Runner is still on my Someday pile, especially now that I have an
async QMP module to play with.)

Long story short: Yeah, sure, cool, I don't want to do any better than
this right now either.

> At one point, a plain string is logged, so the filters passed to it must
> work fine with plain strings.  The only filters passed to it at this
> point are the ones from VM.blockdev_create(), which are
> filter_qmp_test_files() (by default) and 207's filter_hash().  Both
> cannot handle plain strings yet, but we can make them by amending
> filter_qmp() to treat them as plain values with a None key.
>
> Signed-off-by: Hanna Reitz <hreitz@redhat.com>

Looks fine enough to me for now.

Reviewed-by: John Snow <jsnow@redhat.com>

> ---
>  tests/qemu-iotests/iotests.py | 26 ++++++++++++++++----------
>  1 file changed, 16 insertions(+), 10 deletions(-)
>
> diff --git a/tests/qemu-iotests/iotests.py b/tests/qemu-iotests/iotests.py
> index 508adade9e..ad62d1f641 100644
> --- a/tests/qemu-iotests/iotests.py
> +++ b/tests/qemu-iotests/iotests.py
> @@ -521,8 +521,10 @@ def filter_qmp(qmsg, filter_fn):
>      # Iterate through either lists or dicts;
>      if isinstance(qmsg, list):
>          items = enumerate(qmsg)
> -    else:
> +    elif isinstance(qmsg, dict):
>          items = qmsg.items()
> +    else:
> +        return filter_fn(None, qmsg)
>
>      for k, v in items:
>          if isinstance(v, (dict, list)):
> @@ -858,8 +860,12 @@ def qmp_log(self, cmd, filters=(), indent=None, **kwargs):
>          return result
>
>      # Returns None on success, and an error string on failure
> -    def run_job(self, job, auto_finalize=True, auto_dismiss=False,
> -                pre_finalize=None, cancel=False, wait=60.0):
> +    def run_job(self, job: str, auto_finalize: bool = True,
> +                auto_dismiss: bool = False,
> +                pre_finalize: Optional[Callable[[], None]] = None,
> +                cancel: bool = False, wait: float = 60.0,
> +                filters: Iterable[Callable[[Any], Any]] = (),
> +                ) -> Optional[str]:
>          """
>          run_job moves a job from creation through to dismissal.
>
> @@ -889,7 +895,7 @@ def run_job(self, job, auto_finalize=True, auto_dismiss=False,
>          while True:
>              ev = filter_qmp_event(self.events_wait(events, timeout=wait))
>              if ev['event'] != 'JOB_STATUS_CHANGE':
> -                log(ev)
> +                log(ev, filters=filters)
>                  continue
>              status = ev['data']['status']
>              if status == 'aborting':
> @@ -897,18 +903,18 @@ def run_job(self, job, auto_finalize=True, auto_dismiss=False,
>                  for j in result['return']:
>                      if j['id'] == job:
>                          error = j['error']
> -                        log('Job failed: %s' % (j['error']))
> +                        log('Job failed: %s' % (j['error']), filters=filters)
>              elif status == 'ready':
> -                self.qmp_log('job-complete', id=job)
> +                self.qmp_log('job-complete', id=job, filters=filters)
>              elif status == 'pending' and not auto_finalize:
>                  if pre_finalize:
>                      pre_finalize()
>                  if cancel:
> -                    self.qmp_log('job-cancel', id=job)
> +                    self.qmp_log('job-cancel', id=job, filters=filters)
>                  else:
> -                    self.qmp_log('job-finalize', id=job)
> +                    self.qmp_log('job-finalize', id=job, filters=filters)
>              elif status == 'concluded' and not auto_dismiss:
> -                self.qmp_log('job-dismiss', id=job)
> +                self.qmp_log('job-dismiss', id=job, filters=filters)
>              elif status == 'null':
>                  return error
>
> @@ -921,7 +927,7 @@ def blockdev_create(self, options, job_id='job0', filters=None):
>
>          if 'return' in result:
>              assert result['return'] == {}
> -            job_result = self.run_job(job_id)
> +            job_result = self.run_job(job_id, filters=filters)
>          else:
>              job_result = result['error']
>
> --
> 2.35.1
>


