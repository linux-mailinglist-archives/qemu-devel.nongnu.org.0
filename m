Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 41225537B41
	for <lists+qemu-devel@lfdr.de>; Mon, 30 May 2022 15:19:54 +0200 (CEST)
Received: from localhost ([::1]:41396 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nvfJJ-00011m-5R
	for lists+qemu-devel@lfdr.de; Mon, 30 May 2022 09:19:53 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:46426)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1nvfFA-0006zf-Vb
 for qemu-devel@nongnu.org; Mon, 30 May 2022 09:15:41 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:26505)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1nvfF9-0001A5-06
 for qemu-devel@nongnu.org; Mon, 30 May 2022 09:15:36 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1653916533;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=OkfMTM28BxZcyfLjiiWYJfQsHLMyYmSIma/wxw6I30Q=;
 b=NTIR2dy7vREZimkiZrvvO2m9aFf+ZB5H6WFqHusS1cAjfo2A9uB69FSrDClROweRz6OReg
 0FQSr9di6m4S6lq47F2SYF6XSphTUSlwJyx1uxbS1b0COl91sLhwiTpz7mT0FmmOTvXxzB
 O5SzgZI2a+DAVm9M5qufwzkrzQ0mUlc=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-564-giwyIFMkOr-x49OsgYWkmw-1; Mon, 30 May 2022 09:15:29 -0400
X-MC-Unique: giwyIFMkOr-x49OsgYWkmw-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.rdu2.redhat.com
 [10.11.54.7])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 1887D100DE6B;
 Mon, 30 May 2022 13:15:29 +0000 (UTC)
Received: from redhat.com (unknown [10.39.195.203])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id A05A61410F37;
 Mon, 30 May 2022 13:15:27 +0000 (UTC)
Date: Mon, 30 May 2022 15:15:26 +0200
From: Kevin Wolf <kwolf@redhat.com>
To: Fabian Ebner <f.ebner@proxmox.com>
Cc: qemu-devel@nongnu.org, hreitz@redhat.com, qemu-block@nongnu.org,
 integration@gluster.org, qemu-stable@nongnu.org, eblake@redhat.com,
 vsementsov@virtuozzo.com, sgarzare@redhat.com
Subject: Re: [PATCH v3] block/gluster: correctly set max_pdiscard
Message-ID: <YpTDbs6BReBLUJsW@redhat.com>
References: <20220520075922.43972-1-f.ebner@proxmox.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220520075922.43972-1-f.ebner@proxmox.com>
X-Scanned-By: MIMEDefang 2.85 on 10.11.54.7
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

Am 20.05.2022 um 09:59 hat Fabian Ebner geschrieben:
> On 64-bit platforms, assigning SIZE_MAX to the int64_t max_pdiscard
> results in a negative value, and the following assertion would trigger
> down the line (it's not the same max_pdiscard, but computed from the
> other one):
> qemu-system-x86_64: ../block/io.c:3166: bdrv_co_pdiscard: Assertion
> `max_pdiscard >= bs->bl.request_alignment' failed.
> 
> On 32-bit platforms, it's fine to keep using SIZE_MAX.
> 
> The assertion in qemu_gluster_co_pdiscard() is checking that the value
> of 'bytes' can safely be passed to glfs_discard_async(), which takes a
> size_t for the argument in question, so it is kept as is. And since
> max_pdiscard is still <= SIZE_MAX, relying on max_pdiscard is still
> fine.
> 
> Fixes: 0c8022876f ("block: use int64_t instead of int in driver discard handlers")
> Cc: qemu-stable@nongnu.org
> Signed-off-by: Fabian Ebner <f.ebner@proxmox.com>

Thanks, applied to the block branch.

Kevin


