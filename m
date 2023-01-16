Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7819366C45B
	for <lists+qemu-devel@lfdr.de>; Mon, 16 Jan 2023 16:53:14 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pHRlt-0006Qj-SH; Mon, 16 Jan 2023 10:51:42 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1pHRlp-0006QK-TQ
 for qemu-devel@nongnu.org; Mon, 16 Jan 2023 10:51:37 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1pHRlo-0003g3-Cz
 for qemu-devel@nongnu.org; Mon, 16 Jan 2023 10:51:37 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1673884295;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=8E1bpnzaHij5AEM3xTZQ8OtujE+Rx/3MpQgwih2Swgc=;
 b=NxBBQbZiu7s+GJ3MVYL4o5FVi06WWRnKmZAJqOeBAFdPa9pRbB8nY+kFkwfpKNyBsUMi3E
 XmR5UXLe1yW79BAixyLox4XhyZZUf0urL/KJ1+CQMK40wL/UOIk0vIkYHoxRfaR3hoV7V2
 J6+P2ftSxMqisEXDz7nnZjVZMslGD0Y=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-669-TBArlcooMyaHkLez-vYjSw-1; Mon, 16 Jan 2023 10:51:33 -0500
X-MC-Unique: TBArlcooMyaHkLez-vYjSw-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.rdu2.redhat.com
 [10.11.54.2])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 9B993100F903;
 Mon, 16 Jan 2023 15:51:33 +0000 (UTC)
Received: from redhat.com (unknown [10.39.193.101])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id C658F40C6EC4;
 Mon, 16 Jan 2023 15:51:32 +0000 (UTC)
Date: Mon, 16 Jan 2023 16:51:31 +0100
From: Kevin Wolf <kwolf@redhat.com>
To: Paolo Bonzini <pbonzini@redhat.com>
Cc: qemu-devel@nongnu.org, qemu-block@nongnu.org, eesposit@redhat.com
Subject: Re: [PATCH 00/12] More cleanups and fixes for drain
Message-ID: <Y8Vyg08uUNGFMQ6l@redhat.com>
References: <20221212125920.248567-1-pbonzini@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20221212125920.248567-1-pbonzini@redhat.com>
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.2
Received-SPF: pass client-ip=170.10.129.124; envelope-from=kwolf@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

Am 12.12.2022 um 13:59 hat Paolo Bonzini geschrieben:
> There are a few more lines of code that can be removed around draining
> code, but especially the logic can be simplified by removing unnecessary
> parameters.
> 
> Due to the failure of the block-next branch, the first three patches
> drop patches 14+15 of Kevin's drain cleanup series, and then redo
> patch 15 in a slightly less satisfactory way that still enables the
> remaining cleanups.  These reverts are not supposed to be applied;
> either the offending patches are dropped from the branch, or if the
> issue is fixed then my first three patches can go away.

Can you remind me which problem this was? The patches are in master now,
but I'm not sure if the latest version fixed whatever you had in mind.

> The next three are taken from Emanuele's old subtree drain attempt
> at removing the AioContext.  The main one is the second, which is needed
> to avoid testcase failures, but I included all of them for simplicity.
> 
> Patch 7 fixes another latent bug exposed by the later cleanups, and while
> looking for a fix I noticed a general lack of thread-safety in BlockBackend's
> drain code.  There are some global properties that only need to be documented
> and enforced to be set only at creation time (patches 8/9), but also
> queued_requests is not protected by any mutex, which is fixed in patch 10.
> 
> Finally, patches 11-15 are the actual simplification.
> 
> Applies on top of block-next.

Not any more. :-)

I found out that it applies on top of 6355f90eef, which may work for
some basic review, but the conflicts when rebasing seem non-trivial, so
we'll need a v2.

Kevin


