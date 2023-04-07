Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E05AD6DB47C
	for <lists+qemu-devel@lfdr.de>; Fri,  7 Apr 2023 21:51:21 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pks66-0002kH-P9; Fri, 07 Apr 2023 15:50:10 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eblake@redhat.com>) id 1pks64-0002ju-QI
 for qemu-devel@nongnu.org; Fri, 07 Apr 2023 15:50:08 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eblake@redhat.com>) id 1pks62-0001GC-FQ
 for qemu-devel@nongnu.org; Fri, 07 Apr 2023 15:50:08 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1680897005;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=oA+0k8AQO9wa0f4hcCeCj0DXDJqUSkqPWENJQcJQjHU=;
 b=Y9FLbwmefY+jj6anAYGLsKHGjRHwPBURYelxiLvpRTZrs0pirh5SSHZVbH8fZ/I/G0v7p7
 Q7eETv3CfPpxSWjPBubWXR/Z2lqw6/Tu0U768yECxNUKmCjobQmsC0nmh4B88EsXEaK6t8
 A6K/vgWehoKVQxguXKQsuc3Qa6BvTDw=
Received: from mimecast-mx02.redhat.com (66.187.233.88 [66.187.233.88]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-62-ilj4eNhjOxuJvPlWPL7r7g-1; Fri, 07 Apr 2023 15:49:49 -0400
X-MC-Unique: ilj4eNhjOxuJvPlWPL7r7g-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.rdu2.redhat.com
 [10.11.54.7])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id DCE2F101A54F;
 Fri,  7 Apr 2023 19:49:43 +0000 (UTC)
Received: from redhat.com (unknown [10.2.16.67])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 422B114171BF;
 Fri,  7 Apr 2023 19:49:43 +0000 (UTC)
Date: Fri, 7 Apr 2023 14:49:41 -0500
From: Eric Blake <eblake@redhat.com>
To: Paolo Bonzini <pbonzini@redhat.com>
Cc: qemu-devel@nongnu.org, stefanha@redhat.com, kwolf@redhat.com, 
 qemu-block@nongnu.org, hreitz@redhat.com
Subject: Re: [PATCH 5/8] migration/block: replace uses of blk_nb_sectors that
 do not check result
Message-ID: <7ivmxiwgsvilbzktvltsn5z26hcelkd723lrdj4oui6vitejgg@gctqtjfpiw4o>
References: <20230407153303.391121-1-pbonzini@redhat.com>
 <20230407153303.391121-6-pbonzini@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230407153303.391121-6-pbonzini@redhat.com>
User-Agent: NeoMutt/20230322
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.7
Received-SPF: pass client-ip=170.10.133.124; envelope-from=eblake@redhat.com;
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

On Fri, Apr 07, 2023 at 05:33:00PM +0200, Paolo Bonzini wrote:
> Uses of blk_nb_sectors must check whether the result is negative.
> Otherwise, underflow can happen.  Fortunately, alloc_aio_bitmap()
> and bmds_aio_inflight() both have an alternative way to retrieve the
> number of sectors in the file.
> 
> Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
> ---
>  migration/block.c | 5 ++---
>  1 file changed, 2 insertions(+), 3 deletions(-)

Reviewed-by: Eric Blake <eblake@redhat.com>

-- 
Eric Blake, Principal Software Engineer
Red Hat, Inc.           +1-919-301-3266
Virtualization:  qemu.org | libvirt.org


