Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 447D35841DE
	for <lists+qemu-devel@lfdr.de>; Thu, 28 Jul 2022 16:38:20 +0200 (CEST)
Received: from localhost ([::1]:52062 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oH4eY-0002WU-M5
	for lists+qemu-devel@lfdr.de; Thu, 28 Jul 2022 10:38:18 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41328)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1oH47l-0004OC-Ka
 for qemu-devel@nongnu.org; Thu, 28 Jul 2022 10:04:29 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:35081)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1oH47j-0005fV-9H
 for qemu-devel@nongnu.org; Thu, 28 Jul 2022 10:04:24 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1659017061;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=DBSTWQeFU5TTHOWp8ApyBl4dW0QC6YJ/QcqdTdxiyiI=;
 b=aTe/SWlvLg4dBWRO2s4hjwV3QaG541vfn9G5yX0u8YxNUtATBtddEjg09gCUXzp6d2LTAw
 dBJOIAa0gJmV9Cbbbl1qMGiTSvEG4gMitiWMfZfrtqUCWOrF4c92q30eLEJ+nA+mhS+1LH
 aPjpI9UQPhjgw5bCxcA2La+9Td5X8Vg=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-612-XGqdWITFOwGUXicXNovveQ-1; Thu, 28 Jul 2022 10:04:19 -0400
X-MC-Unique: XGqdWITFOwGUXicXNovveQ-1
Received: from smtp.corp.redhat.com (int-mx09.intmail.prod.int.rdu2.redhat.com
 [10.11.54.9])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 1DE301019DE2;
 Thu, 28 Jul 2022 14:04:19 +0000 (UTC)
Received: from redhat.com (unknown [10.39.194.41])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 2536E492C3B;
 Thu, 28 Jul 2022 14:04:18 +0000 (UTC)
Date: Thu, 28 Jul 2022 16:04:16 +0200
From: Kevin Wolf <kwolf@redhat.com>
To: =?iso-8859-1?Q?Marc-Andr=E9?= Lureau <marcandre.lureau@gmail.com>
Cc: Hogan Wang <hogan.wang@huawei.com>, berrange@redhat.com,
 qemu-devel@nongnu.org, wangxinxin.wang@huawei.com, armbru@redhat.com
Subject: Re: [PATCH 3/3] dump: support cancel dump process
Message-ID: <YuKXYEVLYA8BCqjY@redhat.com>
References: <20220727140110.2698-1-hogan.wang@huawei.com>
 <20220727140110.2698-3-hogan.wang@huawei.com>
 <CAJ+F1CK_YZBsy8UEem0aJd6FKgeA1QfYK60Tn0tCTUAuT7LZHw@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAJ+F1CK_YZBsy8UEem0aJd6FKgeA1QfYK60Tn0tCTUAuT7LZHw@mail.gmail.com>
X-Scanned-By: MIMEDefang 2.85 on 10.11.54.9
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

Am 28.07.2022 um 14:37 hat Marc-André Lureau geschrieben:
> Hi
> 
> On Wed, Jul 27, 2022 at 6:02 PM Hogan Wang via <qemu-devel@nongnu.org>
> wrote:
> 
> > Break saving pages or dump iterate when dump job in cancel state,
> > make sure dump process exits as soon as possible.
> >
> > Signed-off-by: Hogan Wang <hogan.wang@huawei.com>
> >
> 
> Overall, the series looks good to me. Please send it with a top cover
> letter, so it can be processed by patchew too.
> 
> I am not familiar with the job infrastructure, it would be nice if Kevin
> could check the usage or give some advice.

There is one big point I see with this series, which is that it could be
considered an incompatible change to 'dump-guest-memory'. Clients are
expected to manage the job now. Though in practice with the default
settings, maybe it actually just results in clients receiving additional
QMP events. (Technically, it is still incompatible because the command
will now fail if you have another job called 'memory-guest-dump' - no
good reason to have that, but it's a scenario that worked and breaks
after this series.)

Markus, do you have an opinion on whether job creation must be
explicitly enabled with a new option or if we can just switch existing
callers?

The implementation of a very basic job looks mostly okay to me, though
of course it doesn't support a few things like pausing the job and
proper progress monitoring. But these things are optional, so it's not a
blocker.

The one thing I would strongly recommend to include is an auto-dismiss
option like every other job has. It is required so that management tools
can query the final job status before it goes away. Most of the
information is in QMP events, too, but events can be lost. auto-finalize
isn't required for this job because it doesn't actually do anything in
the finalize phase.

I'm not sure how safe the whole thing is when it runs in the background
and you can send additional QMP commands while it's running, but that is
preexisting with detach=true.

Kevin


