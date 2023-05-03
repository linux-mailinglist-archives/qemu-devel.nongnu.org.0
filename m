Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2EFE16F5B71
	for <lists+qemu-devel@lfdr.de>; Wed,  3 May 2023 17:45:01 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1puEdh-0003r8-8y; Wed, 03 May 2023 11:43:33 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eblake@redhat.com>) id 1puEde-0003iY-RK
 for qemu-devel@nongnu.org; Wed, 03 May 2023 11:43:31 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eblake@redhat.com>) id 1puEdd-00012p-1U
 for qemu-devel@nongnu.org; Wed, 03 May 2023 11:43:30 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1683128607;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=CjS/ZwiVcszJugnxrODzF25XQQ1TNvb3795b6/4rov0=;
 b=GabJZkNhrB1UPWc/FjdYCImpLS5XuB8vM8m3wGSXm7CNIPUmloAZJ77SEks1Qf0pKUHRo+
 O9Qkvr9U5gcMcSnLj+01O5N3VWM+zXdjG6s7e228UabBAQWw3xeDHSTpLpMlAPU2DNIaDA
 XCOmqTI2bu1GrTb7bMuLWmIx/j1YjHU=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-608-tuIf93EUOOW0dk3nZJSRTw-1; Wed, 03 May 2023 11:43:26 -0400
X-MC-Unique: tuIf93EUOOW0dk3nZJSRTw-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.rdu2.redhat.com
 [10.11.54.5])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id A7DD11C0519D;
 Wed,  3 May 2023 15:43:18 +0000 (UTC)
Received: from redhat.com (unknown [10.2.16.118])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id DA5B663F7E;
 Wed,  3 May 2023 15:43:17 +0000 (UTC)
Date: Wed, 3 May 2023 10:43:16 -0500
From: Eric Blake <eblake@redhat.com>
To: Stefan Hajnoczi <stefanha@redhat.com>
Cc: qemu-devel@nongnu.org, qemu-block@nongnu.org, 
 Hanna Reitz <hreitz@redhat.com>, Xie Yongji <xieyongji@bytedance.com>, 
 Kevin Wolf <kwolf@redhat.com>
Subject: Re: [PATCH] block/export: call blk_set_dev_ops(blk, NULL, NULL)
Message-ID: <wsbxzv6mqjsujdacnb42ma7tzmqu26cz7f7sybxu7g6wwieona@k2eclhiu2mhl>
References: <20230502211119.720647-1-stefanha@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230502211119.720647-1-stefanha@redhat.com>
User-Agent: NeoMutt/20230407
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.5
Received-SPF: pass client-ip=170.10.133.124; envelope-from=eblake@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -22
X-Spam_score: -2.3
X-Spam_bar: --
X-Spam_report: (-2.3 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.161,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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

On Tue, May 02, 2023 at 05:11:19PM -0400, Stefan Hajnoczi wrote:
> Most export types install BlockDeviceOps pointers. It is easy to forget
> to remove them because that happens automatically via the "drive" qdev
> property in hw/ but not block/export/.
> 
> Put blk_set_dev_ops(blk, NULL, NULL) calls in the core export.c code so
> the export types don't need to remember.
> 
> This fixes the nbd and vhost-user-blk export types.
> 
> Fixes: fd6afc501a01 ("nbd/server: Use drained block ops to quiesce the server")
> Fixes: ca858a5fe94c ("vhost-user-blk-server: notify client about disk resize")
> Signed-off-by: Stefan Hajnoczi <stefanha@redhat.com>
> ---
>  block/export/export.c    | 2 ++
>  block/export/vduse-blk.c | 1 -
>  2 files changed, 2 insertions(+), 1 deletion(-)

Reviewed-by: Eric Blake <eblake@redhat.com>

I'm happy to add this through my NBD queue.

-- 
Eric Blake, Principal Software Engineer
Red Hat, Inc.           +1-919-301-3266
Virtualization:  qemu.org | libvirt.org


