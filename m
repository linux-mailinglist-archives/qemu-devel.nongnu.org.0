Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A2EB14E68FE
	for <lists+qemu-devel@lfdr.de>; Thu, 24 Mar 2022 20:03:18 +0100 (CET)
Received: from localhost ([::1]:41618 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nXSjs-0004ps-TJ
	for lists+qemu-devel@lfdr.de; Thu, 24 Mar 2022 15:03:16 -0400
Received: from eggs.gnu.org ([209.51.188.92]:38078)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1nXSX8-00072W-1B
 for qemu-devel@nongnu.org; Thu, 24 Mar 2022 14:50:06 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:37032)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1nXSX4-0000OW-99
 for qemu-devel@nongnu.org; Thu, 24 Mar 2022 14:50:03 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1648147801;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=JL8E3LjELmwUjlMOE/ZFVgJHSM3lSzjH6qaJo81HErM=;
 b=csx/WCnFVHI2/FfbZsU9rX6/egkbc9/U7HKGGPydt7pTvMOs4h4mkBvpx2CTThoaue3fHW
 6e29l7hsN37FBm4kpd8xQ4wV/5cpE3SfNC7dP89aanDhEXtJWO7SEUJBw01VYlG+J0ge6Z
 scB67pWgQUheFTaWvMkg2WpVU1pyrZM=
Received: from mail-ua1-f69.google.com (mail-ua1-f69.google.com
 [209.85.222.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-32-yePLJxSwN86kCKFQy5BA2Q-1; Thu, 24 Mar 2022 14:49:59 -0400
X-MC-Unique: yePLJxSwN86kCKFQy5BA2Q-1
Received: by mail-ua1-f69.google.com with SMTP id
 r14-20020ab070ce000000b0035002b351a6so1504791ual.23
 for <qemu-devel@nongnu.org>; Thu, 24 Mar 2022 11:49:59 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=JL8E3LjELmwUjlMOE/ZFVgJHSM3lSzjH6qaJo81HErM=;
 b=UxRNm3TrfUJsQc4p9D4MfDzKuIDmg/RnTpEFBtAsSn5EPlElipcSCC/6dHjQPZNSg3
 YhCYyLtZ2MfTbhr/yB3+Kmeoc2ZzJ4W2amH4dwTGL6IkJw+MYinEezfPQelDy+rJYCYU
 3pwjky6UiGEPmbPyKGPd3+JxbTfxDjCIXMsI/R1SREJvO9oSmd0PoVNvgB/xNP7EpAOj
 /AAhK4sle9V0l6oOjyUGxKrh7E9RFeCfnlxStIGYgDK4dc5vt5eZrS1JXt0l4uf5iD1Q
 UuncACSpUZD91elK8vwu6YEEK7XpwbUhSJBR/UBWsF+t+JJ6e5B0oDdc+vBjBxZ7NbRQ
 XrDg==
X-Gm-Message-State: AOAM533KIGJbFBhoDWIeZRJ0p9rxQuvCzfUcw3LRewEduYwHseJv5bj3
 6+N4gm4DwjMLcF7SjjcwEVyyAcfIqsHeLJ3dzJq81XFH70aooCHriCT6q90SqFJOBooOA2XJgcP
 3AJQH01qJZcMuL+t+hYRT9LXuG+KV8Sg=
X-Received: by 2002:a67:17c4:0:b0:322:cfd8:15a1 with SMTP id
 187-20020a6717c4000000b00322cfd815a1mr3138085vsx.61.1648147799350; 
 Thu, 24 Mar 2022 11:49:59 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyk0tbLRKPdO++V4ONaN/hgVK865mklR3Boh6BtVP2B3RuWHJOYlYdgeXb3BNZx4tKIvZ7KrMCeLEFy1l0MdJA=
X-Received: by 2002:a67:17c4:0:b0:322:cfd8:15a1 with SMTP id
 187-20020a6717c4000000b00322cfd815a1mr3138067vsx.61.1648147799065; Thu, 24
 Mar 2022 11:49:59 -0700 (PDT)
MIME-Version: 1.0
References: <20220324140907.17192-1-hreitz@redhat.com>
In-Reply-To: <20220324140907.17192-1-hreitz@redhat.com>
From: John Snow <jsnow@redhat.com>
Date: Thu, 24 Mar 2022 14:49:48 -0400
Message-ID: <CAFn=p-b_qv16f6rR7T+_fyfETOM+NJmOe0W0XYGJV=k4iqMFAw@mail.gmail.com>
Subject: Re: [PATCH v2] block/stream: Drain subtree around graph change
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
Cc: Kevin Wolf <kwolf@redhat.com>,
 Vladimir Sementsov-Ogievskiy <v.sementsov-og@mail.ru>,
 qemu-devel <qemu-devel@nongnu.org>, Qemu-block <qemu-block@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Thu, Mar 24, 2022 at 10:09 AM Hanna Reitz <hreitz@redhat.com> wrote:
>
> When the stream block job cuts out the nodes between top and base in
> stream_prepare(), it does not drain the subtree manually; it fetches the
> base node, and tries to insert it as the top node's backing node with
> bdrv_set_backing_hd().  bdrv_set_backing_hd() however will drain, and so
> the actual base node might change (because the base node is actually not
> part of the stream job) before the old base node passed to
> bdrv_set_backing_hd() is installed.
>
> This has two implications:
>
> First, the stream job does not keep a strong reference to the base node.
> Therefore, if it is deleted in bdrv_set_backing_hd()'s drain (e.g.
> because some other block job is drained to finish), we will get a
> use-after-free.  We should keep a strong reference to that node.

Does that introduce any possibility of deadlock if we're now keeping a
strong reference? I guess not, the job can just delete its own
reference and everything's ... fine, right?

>
> Second, even with such a strong reference, the problem remains that the
> base node might change before bdrv_set_backing_hd() actually runs and as
> a result the wrong base node is installed.

ow

>
> Both effects can be seen in 030's TestParallelOps.test_overlapping_5()
> case, which has five nodes, and simultaneously streams from the middle
> node to the top node, and commits the middle node down to the base node.
> As it is, this will sometimes crash, namely when we encounter the
> above-described use-after-free.


Is there a BZ# or is this an occasional failure in 030 you saw? What
does failure look like? Does it require anything special to trigger?

>
> Taking a strong reference to the base node, we no longer get a crash,
> but the resuling block graph is less than ideal: The expected result is
> obviously that all middle nodes are cut out and the base node is the
> immediate backing child of the top node.  However, if stream_prepare()
> takes a strong reference to its base node (the middle node), and then
> the commit job finishes in bdrv_set_backing_hd(), supposedly dropping
> that middle node, the stream job will just reinstall it again.
>
> Therefore, we need to keep the whole subtree drained in
> stream_prepare(), so that the graph modification it performs is
> effectively atomic, i.e. that the base node it fetches is still the base
> node when bdrv_set_backing_hd() sets it as the top node's backing node.
>
> Verify this by asserting in said 030's test case that the base node is
> always the top node's immediate backing child when both jobs are done.
>

(Off-topic: Sometimes I dream about having a block graph rendering
tool that can update step-by-step, so I can visualize what these block
operations look like. My "working memory" is kind of limited and I get
sidetracked too easily tracing code. That we have the ability to
render at a single point is pretty nice, but it's still hard to get
images from intermediate steps when things happen in tight sequence
without the chance for intervention.)

> Signed-off-by: Hanna Reitz <hreitz@redhat.com>
> ---
> v2:
> - Oops, the base can be NULL.  Would have noticed if I had ran all test
>   cases from 030, and not just test_overlapping_5()...
>   That means that keeping a strong reference to the base node must be
>   conditional, based on whether there even is a base node or not.
>   (I mean, technically we do not even need to keep a strong reference to
>   that node, given that we are in a drained section, but I believe it is
>   better style to do it anyway.)
> ---
>  block/stream.c         | 15 ++++++++++++++-
>  tests/qemu-iotests/030 |  5 +++++
>  2 files changed, 19 insertions(+), 1 deletion(-)
>
> diff --git a/block/stream.c b/block/stream.c
> index 3acb59fe6a..694709bd25 100644
> --- a/block/stream.c
> +++ b/block/stream.c
> @@ -64,7 +64,13 @@ static int stream_prepare(Job *job)
>      bdrv_cor_filter_drop(s->cor_filter_bs);
>      s->cor_filter_bs = NULL;
>
> +    bdrv_subtree_drained_begin(s->above_base);
> +
>      base = bdrv_filter_or_cow_bs(s->above_base);
> +    if (base) {
> +        bdrv_ref(base);
> +    }
> +
>      unfiltered_base = bdrv_skip_filters(base);
>
>      if (bdrv_cow_child(unfiltered_bs)) {
> @@ -75,14 +81,21 @@ static int stream_prepare(Job *job)
>                  base_fmt = unfiltered_base->drv->format_name;
>              }
>          }
> +
>          bdrv_set_backing_hd(unfiltered_bs, base, &local_err);
>          ret = bdrv_change_backing_file(unfiltered_bs, base_id, base_fmt, false);
>          if (local_err) {
>              error_report_err(local_err);
> -            return -EPERM;
> +            ret = -EPERM;
> +            goto out;
>          }
>      }
>
> +out:
> +    if (base) {
> +        bdrv_unref(base);
> +    }
> +    bdrv_subtree_drained_end(s->above_base);
>      return ret;
>  }
>
> diff --git a/tests/qemu-iotests/030 b/tests/qemu-iotests/030
> index 567bf1da67..14112835ed 100755
> --- a/tests/qemu-iotests/030
> +++ b/tests/qemu-iotests/030
> @@ -436,6 +436,11 @@ class TestParallelOps(iotests.QMPTestCase):
>          self.vm.run_job(job='node4', auto_dismiss=True)
>          self.assert_no_active_block_jobs()
>
> +        # Assert that node0 is now the backing node of node4
> +        result = self.vm.qmp('query-named-block-nodes')
> +        node4 = next(node for node in result['return'] if node['node-name'] == 'node4')
> +        self.assertEqual(node4['image']['backing-image']['filename'], self.imgs[0])
> +
>      # Test a block-stream and a block-commit job in parallel
>      # Here the stream job is supposed to finish quickly in order to reproduce
>      # the scenario that triggers the bug fixed in 3d5d319e1221 and 1a63a907507
> --
> 2.35.1
>

Seems reasonable, but the best I can give right now is an ACK because
I'm a little rusty with block graph ops ...

--js


