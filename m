Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 83D4D68379F
	for <lists+qemu-devel@lfdr.de>; Tue, 31 Jan 2023 21:38:32 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pMxNN-0004Be-3i; Tue, 31 Jan 2023 15:37:09 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eblake@redhat.com>) id 1pMxNF-0004Av-BK
 for qemu-devel@nongnu.org; Tue, 31 Jan 2023 15:37:02 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eblake@redhat.com>) id 1pMxND-00077d-HS
 for qemu-devel@nongnu.org; Tue, 31 Jan 2023 15:37:00 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1675197417;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=3aKys+egfUzBGmZafgW4WUK472q1taaF/hv72WeM2KE=;
 b=eB4G3NkJ+gvFFHu4oeZsLC8vxynOi7Vb4O9F7eS/HR4c92WY58qZ3bB27mkngKO244MP8x
 NNP+ktJb4bbWGuwyBucr6bn6ZGINIOshFs/Lm5PUuE6dckcaLcvgBY36rG6w2bUT3JXvrW
 ynt+R3O5GyyM5ZXox5GhGX8ZonnRlK4=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-135-2ybeiwgcPRCKzGkSbbEPBA-1; Tue, 31 Jan 2023 15:36:53 -0500
X-MC-Unique: 2ybeiwgcPRCKzGkSbbEPBA-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.rdu2.redhat.com
 [10.11.54.5])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id D1395185A794;
 Tue, 31 Jan 2023 20:36:52 +0000 (UTC)
Received: from redhat.com (unknown [10.2.16.100])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 0978A175A2;
 Tue, 31 Jan 2023 20:36:50 +0000 (UTC)
Date: Tue, 31 Jan 2023 14:36:48 -0600
From: Eric Blake <eblake@redhat.com>
To: Stefan Hajnoczi <stefanha@redhat.com>
Cc: qemu-devel@nongnu.org, qemu-block@nongnu.org,
 Fam Zheng <fam@euphon.net>, Fiona Ebner <f.ebner@proxmox.com>,
 Hanna Reitz <hreitz@redhat.com>, Kevin Wolf <kwolf@redhat.com>,
 qemu-stable@nongnu.org
Subject: Re: [PATCH v2 1/4] block: fix detect-zeroes= with
 BDRV_REQ_REGISTERED_BUF
Message-ID: <20230131203648.thvgl7nkog4ouaac@redhat.com>
References: <20230130215415.919494-1-stefanha@redhat.com>
 <20230130215415.919494-2-stefanha@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230130215415.919494-2-stefanha@redhat.com>
User-Agent: NeoMutt/20220429
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.5
Received-SPF: pass client-ip=170.10.129.124; envelope-from=eblake@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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

On Mon, Jan 30, 2023 at 04:54:12PM -0500, Stefan Hajnoczi wrote:
> When a write request is converted into a write zeroes request by the
> detect-zeroes= feature, it is no longer associated with an I/O buffer.
> The BDRV_REQ_REGISTERED_BUF flag doesn't make sense without an I/O
> buffer and must be cleared because bdrv_co_do_pwrite_zeroes() fails with
> -EINVAL when it's set.
> 
> Fiona Ebner <f.ebner@proxmox.com> bisected and diagnosed this QEMU 7.2
> regression where writes containing zeroes to a blockdev with
> discard=unmap,detect-zeroes=unmap fail.
> 
> Buglink: https://gitlab.com/qemu-project/qemu/-/issues/1404
> Fixes: e8b6535533be ("block: add BDRV_REQ_REGISTERED_BUF request flag")
> Tested-by: Fiona Ebner <f.ebner@proxmox.com>
> Cc: qemu-stable@nongnu.org
> Signed-off-by: Stefan Hajnoczi <stefanha@redhat.com>
> ---
>  block/io.c | 3 +++
>  1 file changed, 3 insertions(+)

Reviewed-by: Eric Blake <eblake@redhat.com>

-- 
Eric Blake, Principal Software Engineer
Red Hat, Inc.           +1-919-301-3266
Virtualization:  qemu.org | libvirt.org


