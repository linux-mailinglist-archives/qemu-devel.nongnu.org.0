Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 660A02D2DEE
	for <lists+qemu-devel@lfdr.de>; Tue,  8 Dec 2020 16:12:42 +0100 (CET)
Received: from localhost ([::1]:49078 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kmefR-0000u6-G2
	for lists+qemu-devel@lfdr.de; Tue, 08 Dec 2020 10:12:41 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:45372)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <glauber.costa@datadoghq.com>)
 id 1kmdLR-0006gI-Rc
 for qemu-devel@nongnu.org; Tue, 08 Dec 2020 08:47:57 -0500
Received: from mail-yb1-xb41.google.com ([2607:f8b0:4864:20::b41]:41634)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <glauber.costa@datadoghq.com>)
 id 1kmdLP-0001rT-1O
 for qemu-devel@nongnu.org; Tue, 08 Dec 2020 08:47:56 -0500
Received: by mail-yb1-xb41.google.com with SMTP id w127so4630243ybw.8
 for <qemu-devel@nongnu.org>; Tue, 08 Dec 2020 05:47:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=datadoghq.com; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=TfaSDou464bde/2QI/9apaIU7vizq8BEOxLPQAJP8Po=;
 b=LB+UONU3W5ezMMckTKFB8RJLTfkRZAmfDqiFCK1ANr0Gzq8WK3dfS+F3N/sxnZSZSq
 IOAeks/9zuPaWoVMDtZwDoiCXpp96FEYsYsANCivFDmXYV72ei2OiChVS2Qen7pNe7sF
 6vfJf55dgLF4f7LyZS+JWggMZqhC2K2Z2lQJg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=TfaSDou464bde/2QI/9apaIU7vizq8BEOxLPQAJP8Po=;
 b=GCugu43oaJ0O2ZDdMVPtfaBg0wWeq0fZwiypBcO6kUL+scJ42jK0rODI5Oo7pofQRy
 Cdt8agdW6SafShYK+JkmNm9Mt2PvqfBZpEmPa4V7vtUzNwSanNr24gBRUDdchpN9pODj
 SpjkNbG0Gq6r/12Dt4H0xntbdhFmiEBh95lxNIKgK9OFDKsZdTMQOxiQKvOCVu52pYTg
 Exq639zelRHVBuLIZUjZhyK0oBC6weRyWZMIldylojSfXUArQBl+IPvMHqcamezvx7zY
 bJBhumxNy8s+nBwABY7f0VYVZ6iM/AEKao9A9kMUQTCuqbrmCbPU1IkSAN+Da2zMHToF
 P2Lw==
X-Gm-Message-State: AOAM531FGnErPZZ/rw5JYsrjzwA2+GWYgRpyqeFt/Xne9oCLKUPn2wiZ
 ZgNjIczH0g/mXFOLaBqM1PpRA8iVuZjHmer8vJ6S9w==
X-Google-Smtp-Source: ABdhPJyQkMNJrympPNJNCxHTE/4kohmTLrErpMEivsLez6awHB2rha/fuWXbvZ90NxdYBjiPk7/dmI2VjobZ4FUILew=
X-Received: by 2002:a25:860f:: with SMTP id y15mr15712713ybk.83.1607435273694; 
 Tue, 08 Dec 2020 05:47:53 -0800 (PST)
MIME-Version: 1.0
References: <20200917160054.GA2453251@dev>
 <5a5822ec-f3bc-a247-2b5a-f764b941c820@huawei.com>
 <20200918140628.GA2509473@dev>
 <1ba06b0d-3fcf-3676-f9e0-52875851ff19@huawei.com>
 <20200921111435.GA2524022@dev>
 <20201013100033.GB164611@stefanha-x1.localdomain>
 <f70dc6ce-385b-a4f9-04a0-244018f3ddbb@huawei.com>
 <6fd02e2b-50fa-b667-efc6-47d1765bdd8c@redhat.com>
 <4eb92c5e-fa2f-50a5-a0f7-5cabe6e15bb4@huawei.com>
 <ab245c4580cd5aecc8c5d338fd0e2802cac029d5.camel@euphon.net>
 <20201208131057.GB272246@stefanha-x1.localdomain>
In-Reply-To: <20201208131057.GB272246@stefanha-x1.localdomain>
From: Glauber Costa <glauber.costa@datadoghq.com>
Date: Tue, 8 Dec 2020 08:47:42 -0500
Message-ID: <CAMdqtNWGYu-U5pECzffNvu8Dv_hMfwJ9w5RPoLjF-_NX4cfjdw@mail.gmail.com>
Subject: Re: [PATCH v1 0/2] Add timeout mechanism to qmp actions
To: Stefan Hajnoczi <stefanha@redhat.com>
Cc: Fam Zheng <fam@euphon.net>, Zhenyu Ye <yezhenyu2@huawei.com>, 
 Paolo Bonzini <pbonzini@redhat.com>, Kevin Wolf <kwolf@redhat.com>, 
 Zhanghailiang <zhang.zhanghailiang@huawei.com>, qemu-block@nongnu.org, 
 qemu-devel@nongnu.org, xiexiangyou@huawei.com, armbru@redhat.com, 
 mreitz@redhat.com, Glauber Costa <glauber@datadoghq.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::b41;
 envelope-from=glauber.costa@datadoghq.com; helo=mail-yb1-xb41.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
X-Spam_action: no action
X-Mailman-Approved-At: Tue, 08 Dec 2020 10:10:03 -0500
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Tue, Dec 8, 2020 at 8:11 AM Stefan Hajnoczi <stefanha@redhat.com> wrote:
>
> On Thu, Oct 22, 2020 at 05:29:16PM +0100, Fam Zheng wrote:
> > On Tue, 2020-10-20 at 09:34 +0800, Zhenyu Ye wrote:
> > > On 2020/10/19 21:25, Paolo Bonzini wrote:
> > > > On 19/10/20 14:40, Zhenyu Ye wrote:
> > > > > The kernel backtrace for io_submit in GUEST is:
> > > > >
> > > > >         guest# ./offcputime -K -p `pgrep -nx fio`
> > > > >             b'finish_task_switch'
> > > > >             b'__schedule'
> > > > >             b'schedule'
> > > > >             b'io_schedule'
> > > > >             b'blk_mq_get_tag'
> > > > >             b'blk_mq_get_request'
> > > > >             b'blk_mq_make_request'
> > > > >             b'generic_make_request'
> > > > >             b'submit_bio'
> > > > >             b'blkdev_direct_IO'
> > > > >             b'generic_file_read_iter'
> > > > >             b'aio_read'
> > > > >             b'io_submit_one'
> > > > >             b'__x64_sys_io_submit'
> > > > >             b'do_syscall_64'
> > > > >             b'entry_SYSCALL_64_after_hwframe'
> > > > >             -                fio (1464)
> > > > >                 40031912
> > > > >
> > > > > And Linux io_uring can avoid the latency problem.
> >
> > Thanks for the info. What this tells us is basically the inflight
> > requests are high. It's sad that the linux-aio is in practice
> > implemented as a blocking API.

it is.

> >
> > Host side backtrace will be of more help. Can you get that too?
>
> I guess Linux AIO didn't set the BLK_MQ_REQ_NOWAIT flag so the task went
> to sleep when it ran out of blk-mq tags. The easiest solution is to move
> to io_uring. Linux AIO is broken - it's not AIO :).

Agree!
>
> If we know that no other process is writing to the host block device
> then maybe we can determine the blk-mq tags limit (the queue depth) and
> avoid sending more requests. That way QEMU doesn't block, but I don't
> think this approach works when other processes are submitting I/O to the
> same host block device :(.
>
> Fam's original suggestion of invoking io_submit(2) from a worker thread
> is an option, but I'm afraid it will slow down the uncontended case.
>
> I'm CCing Glauber in case he battled this in the past in ScyllaDB.

We have, and a lot. I don't recall seeing this particular lock, but
XFS would block us all the time
if it had to update metadata to submit the operation, lock inodes, etc.

The work we did at the time was in fixing those things in the kernel
as much as we could.
But the API is just like that...

>
> Stefan

