Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id AAE7D445293
	for <lists+qemu-devel@lfdr.de>; Thu,  4 Nov 2021 13:00:00 +0100 (CET)
Received: from localhost ([::1]:54202 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mibPT-0001yL-B8
	for lists+qemu-devel@lfdr.de; Thu, 04 Nov 2021 07:59:59 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:55206)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1mibO7-0000nn-3L
 for qemu-devel@nongnu.org; Thu, 04 Nov 2021 07:58:35 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:32536)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1mibO3-00079N-KU
 for qemu-devel@nongnu.org; Thu, 04 Nov 2021 07:58:33 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1636027111;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=bzAO87vZ5cJ1WFBZJVi3YFEc2kQBpnnFtJ5NEOQApqc=;
 b=CK/WCiOuGtT/X2fgOdjOyI0otqxS2FGRkq1+WeiOYCHydU6Av87Icy4BjGpzDCqjL0GbnJ
 NRg0LzeMjobZplxFXt4T6mbiv3wJrK/YrQPmYHRyMHZcnVQKJaMEDtDEnizIGNDbSqSYpG
 Nam7trLIbnztL4V0UkvI+pPWKVCssI0=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-543-t6FmiyngNGagifFn3yej3Q-1; Thu, 04 Nov 2021 07:58:28 -0400
X-MC-Unique: t6FmiyngNGagifFn3yej3Q-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id D4279100A640;
 Thu,  4 Nov 2021 11:58:26 +0000 (UTC)
Received: from redhat.com (unknown [10.39.193.97])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id C3CA467842;
 Thu,  4 Nov 2021 11:58:22 +0000 (UTC)
Date: Thu, 4 Nov 2021 12:58:21 +0100
From: Kevin Wolf <kwolf@redhat.com>
To: Hanna Reitz <hreitz@redhat.com>
Subject: Re: [PATCH 0/7] block: Attempt on fixing 030-reported errors
Message-ID: <YYPK3blXkZldRY0F@redhat.com>
References: <20211104103849.46855-1-hreitz@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20211104103849.46855-1-hreitz@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=kwolf@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=kwolf@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -33
X-Spam_score: -3.4
X-Spam_bar: ---
X-Spam_report: (-3.4 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.648,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
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
Cc: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>,
 qemu-devel@nongnu.org, qemu-block@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Am 04.11.2021 um 11:38 hat Hanna Reitz geschrieben:
> (2A) bdrv_replace_child_noperm() should immediately set bs->file or
>      bs->backing to NULL when it sets bs->{file,backing}->bs to NULL.
>      It should also immediately remove any BdrvChild with .bs == NULL
>      from the parent’s BDS.children list.
>      Implemented in patches 2 through 6.
> 
> (2B) Alternatively, we could always keep the whole subgraph drained
>      while we manipulate it.  Then, the bdrv_parent_drained_end_single()
>      in bdrv_replace_child_noperm() wouldn’t do anything.
>      To fix 030, we would need to add a drained section to
>      stream_prepare(): Namely we’d need to drain the subgraph below the
>      COR filter node.
>      This would be a much simpler solution, but I don’t feel like it’s
>      the right one.

> As you can see, I’m not sure which of 2A or 2B is the right solution.  I
> decided to investigate both: 2A was much more complicated, but seemed
> like the right thing to do; 2B is much simpler, but doesn’t feel as
> right.  Therefore, I decided to go with 2A in this first version of this
> series.

I haven't looked at the patches yet, but if I understand correctly the
choice you're presenting here is between protecting code from accessing
invalid state and not creating the invalid state in the first place. I
agree that the latter is preferable as long as it doesn't make things so
complicated that we would be willing to accept the higher risk of
breakage in the former. If it's doable in five patches, it's probably
not complicated enough to make such compromises.

Kevin


