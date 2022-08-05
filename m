Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 77A2458A808
	for <lists+qemu-devel@lfdr.de>; Fri,  5 Aug 2022 10:28:35 +0200 (CEST)
Received: from localhost ([::1]:54518 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oJsh8-00037c-Ea
	for lists+qemu-devel@lfdr.de; Fri, 05 Aug 2022 04:28:34 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34658)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1oJsTX-0000qI-Sb
 for qemu-devel@nongnu.org; Fri, 05 Aug 2022 04:14:31 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:26856)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1oJsTV-0004Eh-Dt
 for qemu-devel@nongnu.org; Fri, 05 Aug 2022 04:14:31 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1659687268;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=LQp5eZFwSI/xGMEy7umgYoeQSgji1LzJPsclcQD6Hw0=;
 b=Vrzg4bAhMylArF7ZisOGYurkIj6YKr1QHosDFMUuo67S1QJu4RoG6F3++EKIU3WXWFDYBJ
 72cOHehABhdn7tiamfKPDybqW0NIfpaxH+2vP2zDrKwL+GjPHmuhjII3grYYFgvC+yYhh7
 kZVbOlfivjMUqP0sNUpF7eRJhvBEwgo=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-672-ejOK058YPe-z3b2YpbmfiA-1; Fri, 05 Aug 2022 04:14:24 -0400
X-MC-Unique: ejOK058YPe-z3b2YpbmfiA-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.rdu2.redhat.com
 [10.11.54.3])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 4F922811E84;
 Fri,  5 Aug 2022 08:14:24 +0000 (UTC)
Received: from redhat.com (unknown [10.39.193.127])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 096391121314;
 Fri,  5 Aug 2022 08:14:21 +0000 (UTC)
Date: Fri, 5 Aug 2022 10:14:20 +0200
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
Subject: Re: [PATCH v10 12/21] commit and mirror: create new nodes using
 bdrv_get_aio_context, and not the job aiocontext
Message-ID: <YuzRXKdh/+AbQWJu@redhat.com>
References: <20220725073855.76049-1-eesposit@redhat.com>
 <20220725073855.76049-13-eesposit@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220725073855.76049-13-eesposit@redhat.com>
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.3
Received-SPF: pass client-ip=170.10.133.124; envelope-from=kwolf@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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

Am 25.07.2022 um 09:38 hat Emanuele Giuseppe Esposito geschrieben:
> We are always using the given bs AioContext, so there is no need
> to take the job ones (which is identical anyways).
> This also reduces the point we need to check when protecting
> job.aio_context field.
> 
> Reviewed-by: Vladimir Sementsov-Ogievskiy <vsementsov@yandex-team.ru>
> Reviewed-by: Stefan Hajnoczi <stefanha@redhat.com>
> Signed-off-by: Emanuele Giuseppe Esposito <eesposit@redhat.com>

I'm not sure against which scenario this is actually protecting. The
only reason for not using job.aio_context seems to be if someone else
can change the job AioContext in parallel. However, if that is the case
(I don't think it is, but for the hypothetical case this patch seems to
address), the AioContext is not identical any more and the change is
wrong because we actually want things to run in the job AioContext -
otherwise accessing the BlockBackend from the job coroutine wouldn't be
possible.

So I believe the current code expresses how we actually want to use the
BlockBackend and the change doesn't only protect nothing, but is even
misleading because it implies that the job can work with any AioContext,
which is not true.

Kevin


