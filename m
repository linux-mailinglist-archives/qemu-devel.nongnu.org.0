Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D921E6BFA04
	for <lists+qemu-devel@lfdr.de>; Sat, 18 Mar 2023 13:21:28 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pdVX4-0003l7-3c; Sat, 18 Mar 2023 08:19:34 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eblake@redhat.com>) id 1pdVX1-0003km-M9
 for qemu-devel@nongnu.org; Sat, 18 Mar 2023 08:19:31 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eblake@redhat.com>) id 1pdVX0-0004Xf-0o
 for qemu-devel@nongnu.org; Sat, 18 Mar 2023 08:19:31 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1679141965;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=Ahi+AcoB0aF6LDB17KrdGfGHs2mE9naerJyr3aQJ1CM=;
 b=jQYiD4CldAK88zs5gnnvpdFYKbR92nwx7kgHpjorKK+qRDVvtqTPly62wSQq7VoFsxW9Sd
 leHt8TRuskyZ0C6DaaMbdbUnyzRD7337bsTo+P+56IWEFFDW+yGE3BhZEHrb86e6t+SeYn
 TiAmMvug0oFAzPM8GTa2GkcLCLSwVTo=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-644-UzwqILy_OZWqQueVIO3zXg-1; Sat, 18 Mar 2023 08:19:24 -0400
X-MC-Unique: UzwqILy_OZWqQueVIO3zXg-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.rdu2.redhat.com
 [10.11.54.8])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 53DFF101A54F;
 Sat, 18 Mar 2023 12:19:23 +0000 (UTC)
Received: from redhat.com (unknown [10.2.16.99])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 656C2C15BAD;
 Sat, 18 Mar 2023 12:19:22 +0000 (UTC)
Date: Sat, 18 Mar 2023 07:19:20 -0500
From: Eric Blake <eblake@redhat.com>
To: Hanna Czenczek <hreitz@redhat.com>
Cc: qemu-block@nongnu.org, qemu-devel@nongnu.org,
 Vladimir Sementsov-Ogievskiy <vsementsov@yandex-team.ru>,
 Kevin Wolf <kwolf@redhat.com>,
 Stefan Hajnoczi <stefanha@redhat.com>, Fam Zheng <fam@euphon.net>
Subject: Re: [PATCH 2/4] block: Split padded I/O vectors exceeding IOV_MAX
Message-ID: <20230318121920.3pibvzhi47s56zbm@redhat.com>
References: <20230317175019.10857-1-hreitz@redhat.com>
 <20230317175019.10857-3-hreitz@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230317175019.10857-3-hreitz@redhat.com>
User-Agent: NeoMutt/20220429
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.8
Received-SPF: pass client-ip=170.10.133.124; envelope-from=eblake@redhat.com;
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

On Fri, Mar 17, 2023 at 06:50:17PM +0100, Hanna Czenczek wrote:
> When processing vectored guest requests that are not aligned to the
> storage request alignment, we pad them by adding head and/or tail
> buffers for a read-modify-write cycle.
> 

> 
> To do this, the use of qemu_iovec_init_extended() in bdrv_pad_request()
> is effectively replaced by the new function bdrv_create_padded_qiov(),
> which not only wraps the request IOV with padding head/tail, but also
> ensures that the resulting vector will not have more than IOV_MAX
> elements.  Putting that functionality into qemu_iovec_init_extended() is
> infeasible because it requires allocating a bounce buffer; doing so
> would require many more parameters (buffer alignment, how to initialize
> the buffer, and out parameters like the buffer, its length, and the
> original elements), which is not reasonable.
> 
> Conversely, it is not difficult to move qemu_iovec_init_extended()'s
> functionality into bdrv_create_padded_qiov() by using public
> qemu_iovec_* functions, so that is what this patch does.
> 
> Because bdrv_pad_request() was the only "serious" user of
> qemu_iovec_init_extended(), the next patch will remove the latter
> function, so the functionality is not implemented twice.
> 
> Buglink: https://bugzilla.redhat.com/show_bug.cgi?id=2141964
> Signed-off-by: Hanna Czenczek <hreitz@redhat.com>
> ---
>  block/io.c | 153 +++++++++++++++++++++++++++++++++++++++++++++++++----
>  1 file changed, 143 insertions(+), 10 deletions(-)

Reviewed-by: Eric Blake <eblake@redhat.com>

-- 
Eric Blake, Principal Software Engineer
Red Hat, Inc.           +1-919-301-3266
Virtualization:  qemu.org | libvirt.org


