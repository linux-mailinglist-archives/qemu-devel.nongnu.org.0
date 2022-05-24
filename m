Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4DC125332E6
	for <lists+qemu-devel@lfdr.de>; Tue, 24 May 2022 23:18:02 +0200 (CEST)
Received: from localhost ([::1]:37696 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ntbuj-0002sT-CW
	for lists+qemu-devel@lfdr.de; Tue, 24 May 2022 17:18:01 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41240)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eblake@redhat.com>) id 1ntbrv-0008Te-6O
 for qemu-devel@nongnu.org; Tue, 24 May 2022 17:15:08 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:58460)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eblake@redhat.com>) id 1ntbrh-00049y-Vg
 for qemu-devel@nongnu.org; Tue, 24 May 2022 17:15:06 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1653426893;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=o/YJUDvKZcQX2Bdve9DpG3+MRjJYdZDOIKzgVN5H7TQ=;
 b=XByrHdpCpRPTuB47rLR+Bea+CxOU7SNoowWFa5DU4fRTK4QiTUT1Fs7JbUvfBfEXDqMU5j
 ap1K6eQKz5FUMzRcOftBT00vHLVgxUNgjMe9BR8QIuYF8wf0xTf/syN3ZSkAimSb6pASEa
 3wzzyDezndN7N7s1Q99YBKfLYRU76GI=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-45-NdVk6FiUN-mZh8yf9-y2oQ-1; Tue, 24 May 2022 17:14:50 -0400
X-MC-Unique: NdVk6FiUN-mZh8yf9-y2oQ-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.rdu2.redhat.com
 [10.11.54.2])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 8C9962999B41;
 Tue, 24 May 2022 21:14:49 +0000 (UTC)
Received: from redhat.com (unknown [10.2.16.148])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 76884403D1D2;
 Tue, 24 May 2022 21:14:48 +0000 (UTC)
Date: Tue, 24 May 2022 16:14:46 -0500
From: Eric Blake <eblake@redhat.com>
To: Alberto Faria <afaria@redhat.com>
Cc: qemu-devel@nongnu.org, "Denis V. Lunev" <den@openvz.org>,
 Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>,
 Vladimir Sementsov-Ogievskiy <v.sementsov-og@mail.ru>,
 qemu-block@nongnu.org, Kevin Wolf <kwolf@redhat.com>,
 Stefan Hajnoczi <stefanha@redhat.com>, John Snow <jsnow@redhat.com>,
 Hanna Reitz <hreitz@redhat.com>, Stefan Weil <sw@weilnetz.de>,
 Jeff Cody <codyprime@gmail.com>, Fam Zheng <fam@euphon.net>,
 Ari Sundholm <ari@tuxera.com>
Subject: Re: [PATCH v3 06/10] block: Make 'bytes' param of
 bdrv_co_{pread,pwrite,preadv,pwritev}() an int64_t
Message-ID: <20220524211446.im5ps5h4kk4q3nvw@redhat.com>
References: <20220519144841.784780-1-afaria@redhat.com>
 <20220519144841.784780-7-afaria@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220519144841.784780-7-afaria@redhat.com>
User-Agent: NeoMutt/20220429-77-e284d5
X-Scanned-By: MIMEDefang 2.84 on 10.11.54.2
Received-SPF: pass client-ip=170.10.129.124; envelope-from=eblake@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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

On Thu, May 19, 2022 at 03:48:36PM +0100, Alberto Faria wrote:
> For consistency with other I/O functions, and in preparation to
> implement bdrv_{pread,pwrite}() using generated_co_wrapper.
> 
> unsigned int fits in int64_t, so all callers remain correct.
> 
> Signed-off-by: Alberto Faria <afaria@redhat.com>
> ---
>  block/coroutines.h           | 4 ++--
>  include/block/block_int-io.h | 8 ++++++--
>  2 files changed, 8 insertions(+), 4 deletions(-)
>

Reviewed-by: Eric Blake <eblake@redhat.com>

-- 
Eric Blake, Principal Software Engineer
Red Hat, Inc.           +1-919-301-3266
Virtualization:  qemu.org | libvirt.org


