Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A32CE5F6D6A
	for <lists+qemu-devel@lfdr.de>; Thu,  6 Oct 2022 20:17:26 +0200 (CEST)
Received: from localhost ([::1]:53536 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ogVQx-0005gs-Vh
	for lists+qemu-devel@lfdr.de; Thu, 06 Oct 2022 14:17:24 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48338)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1ogUt7-0002mZ-Tf
 for qemu-devel@nongnu.org; Thu, 06 Oct 2022 13:42:27 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:43801)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1ogUt3-0003Jy-M1
 for qemu-devel@nongnu.org; Thu, 06 Oct 2022 13:42:23 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1665078140;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=bS37CFEaq8PB6pAWWnjxWM5b81RegdDh60GD85hXo5I=;
 b=EXsiM8+rIktrvKOLagbuVO8/b4nd8nRp5cxzrnnn+6B7/1UVZ02zldfXcOGLVXZsmntDLy
 PPcZQpTrj/nDNzthpTthJVT15UBcpWjjTwES/q78rKU8yaFy32WSw+0j3RGAgXMEoDy4D1
 6sjPHNHh7vXeIVxoMAL0b0DgQ2MEfVg=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-590-mtk4GKQ3NSacrPnHqepY7A-1; Thu, 06 Oct 2022 13:42:17 -0400
X-MC-Unique: mtk4GKQ3NSacrPnHqepY7A-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.rdu2.redhat.com
 [10.11.54.4])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id EECEF29324B1;
 Thu,  6 Oct 2022 17:42:16 +0000 (UTC)
Received: from redhat.com (unknown [10.39.192.224])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 3BA0E2011567;
 Thu,  6 Oct 2022 17:42:15 +0000 (UTC)
Date: Thu, 6 Oct 2022 19:42:13 +0200
From: Kevin Wolf <kwolf@redhat.com>
To: Emanuele Giuseppe Esposito <eesposit@redhat.com>
Cc: qemu-block@nongnu.org, Hanna Reitz <hreitz@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>, John Snow <jsnow@redhat.com>,
 Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>,
 Wen Congyang <wencongyang2@huawei.com>,
 Xie Changlong <xiechanglong.d@gmail.com>,
 Markus Armbruster <armbru@redhat.com>,
 Stefan Hajnoczi <stefanha@redhat.com>, Fam Zheng <fam@euphon.net>,
 qemu-devel@nongnu.org
Subject: Re: [PATCH v12 00/21] job: replace AioContext lock with job_mutex
Message-ID: <Yz8TdZAzmrit+u3k@redhat.com>
References: <20220926093214.506243-1-eesposit@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220926093214.506243-1-eesposit@redhat.com>
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.4
Received-SPF: pass client-ip=170.10.133.124; envelope-from=kwolf@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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

Am 26.09.2022 um 11:31 hat Emanuele Giuseppe Esposito geschrieben:
> In this series, we want to remove the AioContext lock and instead
> use the already existent job_mutex to protect the job structures
> and list. This is part of the work to get rid of AioContext lock
> usage in favour of smaller granularity locks.
> 
> In order to simplify reviewer's job, job lock/unlock functions and
> macros are added as empty prototypes (nop) in patch 1.
> They are converted to use the actual job mutex only in the last
> patch. In this way we can freely create locking sections
> without worrying about deadlocks with the aiocontext lock.
> 
> Patch 2 defines what fields in the job structure need protection.
> Patches 3-6 are in preparation to the job locks, moving functions
> from global to static and introducing helpers.
> 
> Patch 7-9 introduce the (nop) job lock into the job API and
> its users, and patches 10-13 categorize respectively locked and
> unlocked functions in the job API.
> 
> Patches 14-17 take care of protecting job->aio_context, and
> finally patch 18 makes the prototypes in patch 1 use the
> job_mutex and removes all aiocontext lock at the same time.
> 
> Tested this series by running unit tests, qemu-iotests and qtests
> (x86_64).

Since there only seems to be the one problem in patch 16, I'm taking the
liberty to fix up the type of iostatus (bool -> BlockDeviceIoStatus)
myself.

Thanks, applied to the block branch.

Kevin


