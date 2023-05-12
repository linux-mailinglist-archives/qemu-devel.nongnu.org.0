Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7A6F0700D24
	for <lists+qemu-devel@lfdr.de>; Fri, 12 May 2023 18:38:06 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pxVlx-0002z7-09; Fri, 12 May 2023 12:37:37 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eblake@redhat.com>) id 1pxVlu-0002yz-BX
 for qemu-devel@nongnu.org; Fri, 12 May 2023 12:37:34 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eblake@redhat.com>) id 1pxVls-0002lV-UW
 for qemu-devel@nongnu.org; Fri, 12 May 2023 12:37:34 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1683909452;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=4F2+o4PoDxGCuIB0QK+0/aGljTtG9Qst2Mb93Hjz4Ac=;
 b=d6cJvnxgYXiuX77vkebh+PC6Dc0UZCsz0eVT/DXYFQ0K/OtvECTU11s9RA5Ax2RW0ulFGi
 wrcyhSw3fN/krGlvLF9A8QBhMp8v/yxquTHOiZtPD3pFNF8WYoM9RUhePMMyNsBTA4lPtj
 7l9CNEc4GECmHVHfqgwlT5EDjT+5KJw=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-224-slSWpEyjPkalLSGkhwPwMA-1; Fri, 12 May 2023 12:37:30 -0400
X-MC-Unique: slSWpEyjPkalLSGkhwPwMA-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com
 [10.11.54.6])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 776301C0754F;
 Fri, 12 May 2023 16:37:29 +0000 (UTC)
Received: from redhat.com (unknown [10.2.16.49])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id E91C52166B26;
 Fri, 12 May 2023 16:37:25 +0000 (UTC)
Date: Fri, 12 May 2023 11:37:22 -0500
From: Eric Blake <eblake@redhat.com>
To: Kevin Wolf <kwolf@redhat.com>
Cc: qemu-block@nongnu.org, hreitz@redhat.com, stefanha@redhat.com, 
 f.ebner@proxmox.com, qemu-devel@nongnu.org
Subject: Re: [PATCH 8/8] graph-lock: Honour read locks even in the main thread
Message-ID: <gtm756qpcc5qviz6ck7fk5jucvucar5hzbdv7hjycy6ulmpsfx@5eetttl7flvy>
References: <20230510203601.418015-1-kwolf@redhat.com>
 <20230510203601.418015-9-kwolf@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230510203601.418015-9-kwolf@redhat.com>
User-Agent: NeoMutt/20230512
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.6
Received-SPF: pass client-ip=170.10.133.124; envelope-from=eblake@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
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


On Wed, May 10, 2023 at 10:36:01PM +0200, Kevin Wolf wrote:
> 
> There are some conditions under which we don't actually need to do
> anything for taking a reader lock: Writing the graph is only possible
> from the main context while holding the BQL. So if a reader is running
> in the main context under the BQL and knows that it won't be interrupted
> until the next writer runs, we don't actually need to do anything.
> 
> This is the case if the reader code neither has a nested event loop
> (this is forbidden anyway while you hold the lock) nor is a coroutine
> (because a writer could run when the coroutine has yielded).
> 
> These conditions are exactly what bdrv_graph_rdlock_main_loop() asserts.
> They are not fulfilled in bdrv_graph_co_rdlock(), which always runs in a
> coroutine.
> 
> This deletes the shortcuts in bdrv_graph_co_rdlock() that skip taking
> the reader lock in the main thread.
> 
> Reported-by: Fiona Ebner <f.ebner@proxmox.com>
> Signed-off-by: Kevin Wolf <kwolf@redhat.com>
> ---
>  block/graph-lock.c | 10 ----------
>  1 file changed, 10 deletions(-)

Bug fix by deletion is always fun.

Reviewed-by: Eric Blake <eblake@redhat.com>

-- 
Eric Blake, Principal Software Engineer
Red Hat, Inc.           +1-919-301-3266
Virtualization:  qemu.org | libvirt.org


