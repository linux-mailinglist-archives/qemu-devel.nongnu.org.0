Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6991362F90E
	for <lists+qemu-devel@lfdr.de>; Fri, 18 Nov 2022 16:14:52 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1ow33V-0000qs-Q8; Fri, 18 Nov 2022 10:13:25 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1ow33T-0000qK-P4
 for qemu-devel@nongnu.org; Fri, 18 Nov 2022 10:13:23 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1ow33R-0001t8-4M
 for qemu-devel@nongnu.org; Fri, 18 Nov 2022 10:13:23 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1668784400;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=3LxWV64UKDAO92LV6RRRQ4AThTSmc/+ZIqOoHhLC1ys=;
 b=H1WayZAk64RJMjeUhjojMrslSkxEmTl8HbQ6NxHIzf4+ZJ4SXSBep1z0KxN7y7LXDfbpbd
 yQwgJqAZUtBYIBZuiqGz9oInACd4WLJIqsCiO4EEA47DPPBjjWG7LT9zGpOBQ9P93dgi0X
 rcJB1NdlUFGtXXDO+2Fr1jWqDd1Z+ZI=
Received: from mail-vs1-f71.google.com (mail-vs1-f71.google.com
 [209.85.217.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-516-bxqn9rX3M2a54b7gaHHQ3g-1; Fri, 18 Nov 2022 10:13:18 -0500
X-MC-Unique: bxqn9rX3M2a54b7gaHHQ3g-1
Received: by mail-vs1-f71.google.com with SMTP id
 w127-20020a676285000000b003aa1ead065eso1447296vsb.16
 for <qemu-devel@nongnu.org>; Fri, 18 Nov 2022 07:13:18 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=3LxWV64UKDAO92LV6RRRQ4AThTSmc/+ZIqOoHhLC1ys=;
 b=gMQUquMi65SumjjZQfRD3ISCZBvxjqtC+6Z+2eFeP72wE5A/1Ft5PKc6utEWGTEOFX
 097AAplaKNgGkO4kdZRjRQVp7eBzCyYIU86DdklZ6w5rYZnJ78P4m79FYFNNmBks8io/
 xtCc7j8z5v5xl55g7sMb5IgQgOc0lkT6K3+BUkadKcZItqvnMGFY355HcGJQq2p6VNIz
 iXaKifl7uGcTo+68MxhrDlpIwqqhFBzLjvUK7t27I4wiDWUbL2U/GPNBVeag7E8ypjP9
 74/jEX4RTqC+AteZzt2cvY+H/vR2zEqZ14zx1DADv9wgVAXSYhSQ6qW0V1fKJBWa08KU
 o6cg==
X-Gm-Message-State: ANoB5pmb1WvaSa5vdDK1IFEYya1CWGyWm48kOzQKxJtaSA0c2s+qk+Ro
 wa0eKJLI85L5n3G2c8l60REtpXUTKIANoA61KcXTe8NOBK/FF/BQEjcosxIJxTJ8lCswqA4DDF/
 vaEgbqFZ1CSwoIhxAvW2VprAB+wJdzJ4=
X-Received: by 2002:a67:ce8d:0:b0:3aa:660:ffcf with SMTP id
 c13-20020a67ce8d000000b003aa0660ffcfmr4852470vse.42.1668784398232; 
 Fri, 18 Nov 2022 07:13:18 -0800 (PST)
X-Google-Smtp-Source: AA0mqf5DJ02iQmhg/T9ehV4CwBKxRUoGVbV+DcyBHkQ2JIwlspZHYZMJgycY3gfB+rw5v4udszHC6EpJ+Tm1qT83FZU=
X-Received: by 2002:a67:ce8d:0:b0:3aa:660:ffcf with SMTP id
 c13-20020a67ce8d000000b003aa0660ffcfmr4852424vse.42.1668784397702; Fri, 18
 Nov 2022 07:13:17 -0800 (PST)
MIME-Version: 1.0
References: <20221116140730.3056048-1-eesposit@redhat.com>
 <e218aa44-6c49-d53f-d377-58a90a84db46@redhat.com>
 <a26e707d-0929-7a6b-6860-72edd32a54d9@redhat.com>
In-Reply-To: <a26e707d-0929-7a6b-6860-72edd32a54d9@redhat.com>
From: Paolo Bonzini <pbonzini@redhat.com>
Date: Fri, 18 Nov 2022 16:13:06 +0100
Message-ID: <CABgObfYOqQA3R0_=-WeJDbBr2ca492doYjr6DD+rX24PNdTGYA@mail.gmail.com>
Subject: Re: [PATCH 00/15] Protect the block layer with a rwlock: part 3
To: Emanuele Giuseppe Esposito <eesposit@redhat.com>
Cc: qemu-block@nongnu.org, Kevin Wolf <kwolf@redhat.com>, 
 Hanna Reitz <hreitz@redhat.com>, Stefan Hajnoczi <stefanha@redhat.com>,
 Ari Sundholm <ari@tuxera.com>, 
 Pavel Dovgalyuk <pavel.dovgaluk@ispras.ru>, John Snow <jsnow@redhat.com>, 
 Vladimir Sementsov-Ogievskiy <vsementsov@yandex-team.ru>,
 Stefan Weil <sw@weilnetz.de>, Fam Zheng <fam@euphon.net>, 
 Ronnie Sahlberg <ronniesahlberg@gmail.com>, Peter Lieven <pl@kamp.de>,
 Eric Blake <eblake@redhat.com>, 
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@linaro.org>, 
 Alberto Garcia <berto@igalia.com>, Ilya Dryomov <idryomov@gmail.com>, 
 Wen Congyang <wencongyang2@huawei.com>,
 Xie Changlong <xiechanglong.d@gmail.com>, 
 "Richard W.M. Jones" <rjones@redhat.com>, Jeff Cody <codyprime@gmail.com>,
 Cleber Rosa <crosa@redhat.com>, 
 qemu-devel@nongnu.org, integration@gluster.org
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=170.10.133.124; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

On Fri, Nov 18, 2022 at 4:01 PM Emanuele Giuseppe Esposito
<eesposit@redhat.com> wrote:
> > - generated_co_wrapper_simple -> coroutine_wrapper
> > - generated_co_wrapper_blk -> coroutine_wrapper_mixed
> > - generated_co_wrapper -> coroutine_wrapper_mixed_bdrv
> >
> > ?  It is not clear to me yet if you will have bdrv_* functions that take
> > the rdlock as well - in which case however coroutine_wrapper_bdrv would
> > not be hard to add.
>
> Why _mixed? I thought _blk was a nice name to identify only the blk_*
> API that have this slightly different behavior (ie do not take the
> rwlock anywhere).

_mixed means that they are callable from both coroutine and
non-coroutine function, but (unlike "normal" functions) they will
suspend if called in coroutine context.

In fact we could also have a coroutine_mixed_fn static analysis
annotation for functions that *call* coroutine_wrapper_mixed (so
ultimately they can suspend when called from coroutine context, e.g.
vhdx_log_write_and_flush or qcow2's update_refcount):

- coroutine_fn can call coroutine_mixed_fn if needed, but cannot call
any coroutine_wrapper*

- coroutine_mixed_fn can call coroutine_mixed_fn or
coroutine_wrapper_mixed{,_bdrv}, but cannot call coroutine_wrapper

This of course is completely independent of your series, but since the
naming is adjacent it would be nice to only change it once.

> No, I don't think there will be bdrv_* functions that will behave as
> blk_*, if that's what you mean.
>
> Regarding the bdrv_* functions in general, there are a couple of
> additional places (which should be all in the main loop) where we need
> to use assert_bdrv_grapg_readable. In those places we theoretically need
> nothing, but if we use the automatic TSA locking checker that is being
> tested by kevin, we need some sort of "placeholder" so that cc/gcc (I
> don't remember anymore which) won't throw false positives.

clang. :)  That can be sorted out with review, but in general I think
asserting is always okay.

Paolo


