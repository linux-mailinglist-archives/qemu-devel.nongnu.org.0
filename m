Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0F1762FF7AC
	for <lists+qemu-devel@lfdr.de>; Thu, 21 Jan 2021 23:03:12 +0100 (CET)
Received: from localhost ([::1]:38958 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l2i2p-0000Ga-4E
	for lists+qemu-devel@lfdr.de; Thu, 21 Jan 2021 17:03:11 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:39132)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eblake@redhat.com>) id 1l2hy9-0005TT-Hs
 for qemu-devel@nongnu.org; Thu, 21 Jan 2021 16:58:21 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:53260)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <eblake@redhat.com>) id 1l2hy6-000521-T3
 for qemu-devel@nongnu.org; Thu, 21 Jan 2021 16:58:20 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1611266297;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=+NPKBTdzaB78nWDaOvJfiaYMHhfkkD7fZgnAEqALHIY=;
 b=Y4rXa5lCXLxg/joRT12mDed6+e3oLWAciVQDSjBjJdCZ01DMJr92f/cMHSCRfgHwbhA6A2
 hSM/of72cfkhCORO74jD7qdFAerDxBwsLlxHln53Un2skwtk3LKfvWanTb2W8yorSFTH7f
 NfXPwWU09p2smH1LPjviTUelsNOzyUI=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-191-_2RQ4NIYOqasb_EcP_RXsQ-1; Thu, 21 Jan 2021 16:58:13 -0500
X-MC-Unique: _2RQ4NIYOqasb_EcP_RXsQ-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id E26521081B2D;
 Thu, 21 Jan 2021 21:58:11 +0000 (UTC)
Received: from [10.3.113.116] (ovpn-113-116.phx2.redhat.com [10.3.113.116])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 3CA545D9DD;
 Thu, 21 Jan 2021 21:58:08 +0000 (UTC)
Subject: Re: [PATCH v4 02/16] util/iov: make qemu_iovec_init_extended() honest
To: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>,
 qemu-block@nongnu.org
References: <20201211183934.169161-1-vsementsov@virtuozzo.com>
 <20201211183934.169161-3-vsementsov@virtuozzo.com>
From: Eric Blake <eblake@redhat.com>
Organization: Red Hat, Inc.
Message-ID: <4750df02-7597-33af-f2b1-40cd8ca44135@redhat.com>
Date: Thu, 21 Jan 2021 15:58:07 -0600
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.0
MIME-Version: 1.0
In-Reply-To: <20201211183934.169161-3-vsementsov@virtuozzo.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=eblake@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=eblake@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.168,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001,
 RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: fam@euphon.net, kwolf@redhat.com, berto@igalia.com, qemu-devel@nongnu.org,
 mreitz@redhat.com, stefanha@redhat.com, den@openvz.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 12/11/20 12:39 PM, Vladimir Sementsov-Ogievskiy wrote:
> Actually, we can't extend the io vector in all cases. Handle possible
> MAX_IOV and size_t overflows.
> 
> For now add assertion to callers (actually they rely on success anyway)
> and fix them in the following patch.
> 
> Add also some additional good assertions to qemu_iovec_init_slice()
> while being here.
> 
> Signed-off-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
> ---
>  include/qemu/iov.h |  2 +-
>  block/io.c         | 10 +++++++---
>  util/iov.c         | 25 +++++++++++++++++++++++--
>  3 files changed, 31 insertions(+), 6 deletions(-)
> 

> @@ -492,7 +506,14 @@ bool qemu_iovec_is_zero(QEMUIOVector *qiov, size_t offset, size_t bytes)
>  void qemu_iovec_init_slice(QEMUIOVector *qiov, QEMUIOVector *source,
>                             size_t offset, size_t len)
>  {
> -    qemu_iovec_init_extended(qiov, NULL, 0, source, offset, len, NULL, 0);
> +    int ret;
> +
> +    assert(source->size >= len);
> +    assert(source->size - len >= offset);
> +
> +    /* We shrink the request, so we can't overflow neither size_t nor MAX_IOV */

We shrink the request, so neither size_t nor MAX_IOV will overflow

> +    ret = qemu_iovec_init_extended(qiov, NULL, 0, source, offset, len, NULL, 0);
> +    assert(ret == 0);
>  }
>  
>  void qemu_iovec_destroy(QEMUIOVector *qiov)
> 

Reviewed-by: Eric Blake <eblake@redhat.com>

-- 
Eric Blake, Principal Software Engineer
Red Hat, Inc.           +1-919-301-3226
Virtualization:  qemu.org | libvirt.org


