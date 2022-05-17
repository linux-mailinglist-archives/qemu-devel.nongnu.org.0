Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id F394B52A5B2
	for <lists+qemu-devel@lfdr.de>; Tue, 17 May 2022 17:11:02 +0200 (CEST)
Received: from localhost ([::1]:46574 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nqyqk-0000iu-4i
	for lists+qemu-devel@lfdr.de; Tue, 17 May 2022 11:11:02 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54654)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eblake@redhat.com>) id 1nqyGH-0002SV-5h
 for qemu-devel@nongnu.org; Tue, 17 May 2022 10:33:21 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:42143)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eblake@redhat.com>) id 1nqyGF-0000N0-Kb
 for qemu-devel@nongnu.org; Tue, 17 May 2022 10:33:20 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1652797999;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=Ic5hgA0CaGpkOTeEkSg600AV2yBMRATqtdcGMr6Sbmo=;
 b=EKHzVL14GzXtZhMsRz7JXaxzK/qNCkWYUTS1btgOk5NumjxqyqetuQy6JgVYC4dTCo08ob
 gOkwG6ZGy0GJMWzWgPVCx/ioRWmCJrF7gfH+O2ZLNbKQB2f2db84FziVvvoVDpFfaa3v9H
 96ik4scNggu8VA98rwAbGIS8fWlS5GQ=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-308-18qVzht4Pe2GQ22yF6EBbw-1; Tue, 17 May 2022 10:33:17 -0400
X-MC-Unique: 18qVzht4Pe2GQ22yF6EBbw-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.rdu2.redhat.com
 [10.11.54.3])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 0A7E62826518;
 Tue, 17 May 2022 14:32:27 +0000 (UTC)
Received: from redhat.com (unknown [10.2.17.49])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 3DE0B1121331;
 Tue, 17 May 2022 14:32:23 +0000 (UTC)
Date: Tue, 17 May 2022 09:32:21 -0500
From: Eric Blake <eblake@redhat.com>
To: Alberto Faria <afaria@redhat.com>
Cc: qemu-devel@nongnu.org, qemu-block@nongnu.org,
 Paolo Bonzini <pbonzini@redhat.com>, Kevin Wolf <kwolf@redhat.com>,
 Hanna Reitz <hreitz@redhat.com>
Subject: Re: [PATCH v2 06/10] block: Make 'bytes' param of bdrv_co_{pread,
 pwrite, preadv, pwritev}() an int64_t
Message-ID: <20220517143221.3vzwjierhnl4wx4x@redhat.com>
References: <20220513155418.2486450-1-afaria@redhat.com>
 <20220513155749.2488070-4-afaria@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220513155749.2488070-4-afaria@redhat.com>
User-Agent: NeoMutt/20220429-68-cedf86
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.3
Received-SPF: pass client-ip=170.10.133.124; envelope-from=eblake@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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

On Fri, May 13, 2022 at 04:57:45PM +0100, Alberto Faria wrote:
> For consistency with other I/O functions, and in preparation to
> implement bdrv_{pread,pwrite}() using generated_co_wrapper.
> 
> unsigned int fits in int64_t, so all callers remain correct.

However, future callers that pass in something larger than unsigned int...

> +++ b/include/block/block_int-io.h
> @@ -56,7 +56,7 @@ int coroutine_fn bdrv_co_pwritev_part(BdrvChild *child,
>      QEMUIOVector *qiov, size_t qiov_offset, BdrvRequestFlags flags);
>  
>  static inline int coroutine_fn bdrv_co_pread(BdrvChild *child,
> -    int64_t offset, unsigned int bytes, void *buf, BdrvRequestFlags flags)
> +    int64_t offset, int64_t bytes, void *buf, BdrvRequestFlags flags)
>  {
>      QEMUIOVector qiov = QEMU_IOVEC_INIT_BUF(qiov, buf, bytes);

...now end up calling QEMU_IOVEC_INIT_BUF() which tries to do
.local_iov.iov_len = bytes, which can silently overflow on 32-bit
platforms where iov_len is size_t.  We need to add a code guard that
callers do not pass in too large of a buffer.

>      IO_CODE();
> @@ -65,7 +65,7 @@ static inline int coroutine_fn bdrv_co_pread(BdrvChild *child,
>  }
>  
>  static inline int coroutine_fn bdrv_co_pwrite(BdrvChild *child,
> -    int64_t offset, unsigned int bytes, const void *buf, BdrvRequestFlags flags)
> +    int64_t offset, int64_t bytes, const void *buf, BdrvRequestFlags flags)
>  {
>      QEMUIOVector qiov = QEMU_IOVEC_INIT_BUF(qiov, buf, bytes);

Here as well.

-- 
Eric Blake, Principal Software Engineer
Red Hat, Inc.           +1-919-301-3266
Virtualization:  qemu.org | libvirt.org


