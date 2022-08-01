Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 93415586AFB
	for <lists+qemu-devel@lfdr.de>; Mon,  1 Aug 2022 14:40:19 +0200 (CEST)
Received: from localhost ([::1]:36288 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oIUiY-0004S6-6E
	for lists+qemu-devel@lfdr.de; Mon, 01 Aug 2022 08:40:18 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48392)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1oIUgb-0002or-R3
 for qemu-devel@nongnu.org; Mon, 01 Aug 2022 08:38:17 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:53780)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1oIUgY-0000gO-0G
 for qemu-devel@nongnu.org; Mon, 01 Aug 2022 08:38:15 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1659357492;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=7mtpoDNcCeBamIwefRAQCNpbDGREQX316r+ZSmKgM18=;
 b=WDro/blu/oqEsk9VMRifBztUGTIkmS82qO/O4FcyePJK3ayw20Law2S0FizYdyC1ioiDUn
 wObsXJi2xhRWZWbtAHzue/6QPYIU8cpfI0JP8GWF50ebzMOpI3r1J98DP2jAfK0W3BspFf
 3zxVR7pGxY/UnQpqZRrmn4vSGyZlwnE=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-145-OL79Yt2mMSaD4Q6bogw3sQ-1; Mon, 01 Aug 2022 08:38:11 -0400
X-MC-Unique: OL79Yt2mMSaD4Q6bogw3sQ-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.rdu2.redhat.com
 [10.11.54.1])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id EE1BA811E7A;
 Mon,  1 Aug 2022 12:38:10 +0000 (UTC)
Received: from blackfin.pond.sub.org (unknown [10.39.194.81])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id A2B5340CF8ED;
 Mon,  1 Aug 2022 12:38:10 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id 7D34621E6930; Mon,  1 Aug 2022 14:38:09 +0200 (CEST)
From: Markus Armbruster <armbru@redhat.com>
To: Kevin Wolf <kwolf@redhat.com>
Cc: =?utf-8?Q?Marc-Andr=C3=A9?= Lureau <marcandre.lureau@gmail.com>,  Hogan
 Wang <hogan.wang@huawei.com>,  berrange@redhat.com,  qemu-devel@nongnu.org,
 wangxinxin.wang@huawei.com
Subject: Re: [PATCH 3/3] dump: support cancel dump process
References: <20220727140110.2698-1-hogan.wang@huawei.com>
 <20220727140110.2698-3-hogan.wang@huawei.com>
 <CAJ+F1CK_YZBsy8UEem0aJd6FKgeA1QfYK60Tn0tCTUAuT7LZHw@mail.gmail.com>
 <YuKXYEVLYA8BCqjY@redhat.com>
Date: Mon, 01 Aug 2022 14:38:09 +0200
In-Reply-To: <YuKXYEVLYA8BCqjY@redhat.com> (Kevin Wolf's message of "Thu, 28
 Jul 2022 16:04:16 +0200")
Message-ID: <8735eggmvi.fsf@pond.sub.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.2 (gnu/linux)
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-Scanned-By: MIMEDefang 2.84 on 10.11.54.1
Received-SPF: pass client-ip=170.10.129.124; envelope-from=armbru@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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

Kevin Wolf <kwolf@redhat.com> writes:

> Am 28.07.2022 um 14:37 hat Marc-Andr=C3=A9 Lureau geschrieben:
>> Hi
>>=20
>> On Wed, Jul 27, 2022 at 6:02 PM Hogan Wang via <qemu-devel@nongnu.org>
>> wrote:
>>=20
>> > Break saving pages or dump iterate when dump job in cancel state,
>> > make sure dump process exits as soon as possible.
>> >
>> > Signed-off-by: Hogan Wang <hogan.wang@huawei.com>
>> >
>>=20
>> Overall, the series looks good to me. Please send it with a top cover
>> letter, so it can be processed by patchew too.
>>=20
>> I am not familiar with the job infrastructure, it would be nice if Kevin
>> could check the usage or give some advice.
>
> There is one big point I see with this series, which is that it could be
> considered an incompatible change to 'dump-guest-memory'. Clients are
> expected to manage the job now. Though in practice with the default
> settings, maybe it actually just results in clients receiving additional
> QMP events. (Technically, it is still incompatible because the command
> will now fail if you have another job called 'memory-guest-dump' - no
> good reason to have that, but it's a scenario that worked and breaks
> after this series.)
>
> Markus, do you have an opinion on whether job creation must be
> explicitly enabled with a new option or if we can just switch existing
> callers?

The conservative answer is to create a job only when new optional
argument @job-id is present, else maintain the traditional behavior.
This means we get to maintain two variations of the command: with and
without a job.

I can see the following alternatives:

(1) Keep both variations forever.  This could make sense if we believe
    the additional complexity and maintenance burden is insignificant.

(2) Deprecate "without a job", and remove it after a suitable grace
    period.  @job-id becomes mandatory then.

(3) Create a job even when the user doesn't ask for it (@job-id absent),
    accept the change in behavior.  This could make sense if we're
    confident the change is harmless in practice.  First step would be
    documenting the change in behavior.  Second step would be the
    argument why it's harmless.

    We may want to deprecate absent @job-id then, so we can get rid of
    the special case after a suitable grace period.

Does this answer your question, Kevin?

> The implementation of a very basic job looks mostly okay to me, though
> of course it doesn't support a few things like pausing the job and
> proper progress monitoring. But these things are optional, so it's not a
> blocker.

We can always improve on top.

> The one thing I would strongly recommend to include is an auto-dismiss
> option like every other job has. It is required so that management tools
> can query the final job status before it goes away. Most of the
> information is in QMP events, too, but events can be lost.

Concur.  Transmitting important information in QMP events only is an
interface design flaw.

>                                                            auto-finalize
> isn't required for this job because it doesn't actually do anything in
> the finalize phase.
>
> I'm not sure how safe the whole thing is when it runs in the background
> and you can send additional QMP commands while it's running, but that is
> preexisting with detach=3Dtrue.
>
> Kevin


