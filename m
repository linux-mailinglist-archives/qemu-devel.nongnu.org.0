Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 889D955FEF4
	for <lists+qemu-devel@lfdr.de>; Wed, 29 Jun 2022 13:43:31 +0200 (CEST)
Received: from localhost ([::1]:33528 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o6W6U-0002dU-7b
	for lists+qemu-devel@lfdr.de; Wed, 29 Jun 2022 07:43:30 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37906)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1o6W2c-0001XG-3P
 for qemu-devel@nongnu.org; Wed, 29 Jun 2022 07:39:30 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:47855)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1o6W2X-00013B-Qa
 for qemu-devel@nongnu.org; Wed, 29 Jun 2022 07:39:27 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1656502762;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=o+kCGxdWhIdQAsPHU/IuP8mSDVSiuhSLBLUnETW5Hmk=;
 b=Nj5inzWyxFYryY+avMqNuHCaQbczPF/PjZxYhM/RwgDWqvFg+q0saHpg5UM98VorFvfLj/
 S6e0L5tyxzqYwBaDTgCR8zPj0p0dU5bydLKeS+Dp8JvP2OhVTSFY1PJnsvT6AnUhkqkfYk
 eQdyxMAnczcQ3eTZgg20tClupLNa5F0=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-7-koGsZV4UNiagcZ40_gXkBw-1; Wed, 29 Jun 2022 07:39:21 -0400
X-MC-Unique: koGsZV4UNiagcZ40_gXkBw-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.rdu2.redhat.com
 [10.11.54.7])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id C2F393816848;
 Wed, 29 Jun 2022 11:39:20 +0000 (UTC)
Received: from blackfin.pond.sub.org (unknown [10.39.195.112])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 98E0C1410F3B;
 Wed, 29 Jun 2022 11:39:20 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id 67E0C21E690D; Wed, 29 Jun 2022 13:39:18 +0200 (CEST)
From: Markus Armbruster <armbru@redhat.com>
To: Yongji Xie <xieyongji@bytedance.com>
Cc: Kevin Wolf <kwolf@redhat.com>,  Stefan Hajnoczi <stefanha@redhat.com>,
 qemu-block@nongnu.org,  qemu-devel@nongnu.org
Subject: Re: [PATCH 4/4] libvduse: Check the return value of some ioctls
References: <20220627090203.87-1-xieyongji@bytedance.com>
 <20220627090203.87-5-xieyongji@bytedance.com>
 <8735fnq00u.fsf@pond.sub.org>
 <CACycT3vzA_v_b91=Z7bsngtjgTmdJDtRs-62UCfgWWYPJWSofw@mail.gmail.com>
Date: Wed, 29 Jun 2022 13:39:18 +0200
In-Reply-To: <CACycT3vzA_v_b91=Z7bsngtjgTmdJDtRs-62UCfgWWYPJWSofw@mail.gmail.com>
 (Yongji Xie's message of "Wed, 29 Jun 2022 19:10:53 +0800")
Message-ID: <87k08zg0m1.fsf@pond.sub.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.2 (gnu/linux)
MIME-Version: 1.0
Content-Type: text/plain
X-Scanned-By: MIMEDefang 2.85 on 10.11.54.7
Received-SPF: pass client-ip=170.10.129.124; envelope-from=armbru@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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

Yongji Xie <xieyongji@bytedance.com> writes:

> On Wed, Jun 29, 2022 at 5:41 PM Markus Armbruster <armbru@redhat.com> wrote:
>>
>> Xie Yongji <xieyongji@bytedance.com> writes:
>>
>> > Coverity pointed out (CID 1490222, 1490227) that we called
>> > ioctl somewhere without checking the return value. This
>> > patch fixes these issues.
>> >
>> > Fixes: Coverity CID 1490222, 1490227
>> > Signed-off-by: Xie Yongji <xieyongji@bytedance.com>
>> > ---
>> >  subprojects/libvduse/libvduse.c | 10 ++++++++--
>> >  1 file changed, 8 insertions(+), 2 deletions(-)
>> >
>> > diff --git a/subprojects/libvduse/libvduse.c b/subprojects/libvduse/libvduse.c
>> > index 1a5981445c..bf7302c60a 100644
>> > --- a/subprojects/libvduse/libvduse.c
>> > +++ b/subprojects/libvduse/libvduse.c
>> > @@ -947,7 +947,10 @@ static void vduse_queue_disable(VduseVirtq *vq)
>> >
>> >      eventfd.index = vq->index;
>> >      eventfd.fd = VDUSE_EVENTFD_DEASSIGN;
>> > -    ioctl(dev->fd, VDUSE_VQ_SETUP_KICKFD, &eventfd);
>> > +    if (ioctl(dev->fd, VDUSE_VQ_SETUP_KICKFD, &eventfd)) {
>> > +        fprintf(stderr, "Failed to disable eventfd for vq[%d]: %s\n",
>> > +                vq->index, strerror(errno));
>> > +    }
>> >      close(vq->fd);
>> >
>> >      assert(vq->inuse == 0);
>> > @@ -1337,7 +1340,10 @@ VduseDev *vduse_dev_create(const char *name, uint32_t device_id,
>> >
>> >      return dev;
>> >  err:
>> > -    ioctl(ctrl_fd, VDUSE_DESTROY_DEV, name);
>> > +    if (ioctl(ctrl_fd, VDUSE_DESTROY_DEV, name)) {
>> > +        fprintf(stderr, "Failed to destroy vduse device %s: %s\n",
>> > +                name, strerror(errno));
>> > +    }
>> >  err_dev:
>> >      close(ctrl_fd);
>> >  err_ctrl:
>>
>> Both errors are during cleanup that can't fail.  The program continues
>> as if they didn't happen.  Does the user need to know?
>>
>
> So I printed some error messages. I didn't find any other good way to
> notify the users.

I can think of another way, either.  But my question wasn't about "how",
it was about "why".  The answer depends on the impact of these errors.
Which I can't judge.  Can you?


