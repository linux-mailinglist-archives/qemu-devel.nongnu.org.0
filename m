Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6D3E31B5EFA
	for <lists+qemu-devel@lfdr.de>; Thu, 23 Apr 2020 17:20:24 +0200 (CEST)
Received: from localhost ([::1]:45478 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jRdeJ-0003AQ-DY
	for lists+qemu-devel@lfdr.de; Thu, 23 Apr 2020 11:20:23 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47194)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <eblake@redhat.com>) id 1jRdcN-0000w3-Ru
 for qemu-devel@nongnu.org; Thu, 23 Apr 2020 11:18:24 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.90_1)
 (envelope-from <eblake@redhat.com>) id 1jRdcC-0003s1-QQ
 for qemu-devel@nongnu.org; Thu, 23 Apr 2020 11:18:23 -0400
Received: from us-smtp-2.mimecast.com ([205.139.110.61]:59176
 helo=us-smtp-delivery-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <eblake@redhat.com>) id 1jRdcC-0003mN-Bo
 for qemu-devel@nongnu.org; Thu, 23 Apr 2020 11:18:12 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1587655090;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=VEHE7BuLQDAdTK6kvU9kHt3ElIKIsUSzN1sLVT7wQHQ=;
 b=BN7REdJUwkuYpm4Y99oHnkl8mcoEULfJwy16U6x8aW4rl9zYaJ9EWoQlpnP5eDNp+6FrFi
 cg1Fp18d5h/MZCIvmhCM/CIP/dcntx7XdVY+cvUjMCPLFWtbGx1nZwR763FFU16NyOfXhy
 61cKALwSbp/2mkHXnlweWUxdlopmi6c=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-96-k-n0ew1lMrG1T_xc7GWCjA-1; Thu, 23 Apr 2020 11:18:04 -0400
X-MC-Unique: k-n0ew1lMrG1T_xc7GWCjA-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 5B87F107B7C3;
 Thu, 23 Apr 2020 15:18:03 +0000 (UTC)
Received: from [10.10.116.80] (ovpn-116-80.rdu2.redhat.com [10.10.116.80])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 048141002381;
 Thu, 23 Apr 2020 15:18:01 +0000 (UTC)
Subject: Re: [PATCH v6 04/10] qcow2: Support BDRV_REQ_ZERO_WRITE for truncate
To: Kevin Wolf <kwolf@redhat.com>, qemu-block@nongnu.org
References: <20200423150127.142609-1-kwolf@redhat.com>
 <20200423150127.142609-5-kwolf@redhat.com>
From: Eric Blake <eblake@redhat.com>
Organization: Red Hat, Inc.
Message-ID: <b9d97ddb-b13d-637a-1848-1d93a2d44736@redhat.com>
Date: Thu, 23 Apr 2020 10:18:00 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.7.0
MIME-Version: 1.0
In-Reply-To: <20200423150127.142609-5-kwolf@redhat.com>
Content-Language: en-US
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=205.139.110.61; envelope-from=eblake@redhat.com;
 helo=us-smtp-delivery-1.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/04/23 03:23:21
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic]
X-Received-From: 205.139.110.61
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
Cc: vsementsov@virtuozzo.com, berto@igalia.com, qemu-devel@nongnu.org,
 mreitz@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 4/23/20 10:01 AM, Kevin Wolf wrote:
> If BDRV_REQ_ZERO_WRITE is set and we're extending the image, calling
> qcow2_cluster_zeroize() with flags=0 does the right thing: It doesn't
> undo any previous preallocation, but just adds the zero flag to all
> relevant L2 entries. If an external data file is in use, a write_zeroes
> request to the data file is made instead.
> 
> Signed-off-by: Kevin Wolf <kwolf@redhat.com>
> Reviewed-by: Max Reitz <mreitz@redhat.com>
> ---
>   block/qcow2-cluster.c |  2 +-
>   block/qcow2.c         | 33 +++++++++++++++++++++++++++++++++
>   2 files changed, 34 insertions(+), 1 deletion(-)
> 

> +    if ((flags & BDRV_REQ_ZERO_WRITE) && offset > old_length) {
> +        uint64_t zero_start = QEMU_ALIGN_UP(old_length, s->cluster_size);
> +
> +        /*
> +         * Use zero clusters as much as we can. qcow2_cluster_zeroize()
> +         * requires a cluster-aligned start. The end may be unaligned if it is
> +         * at the end of the image (which it is here).
> +         */
> +        ret = qcow2_cluster_zeroize(bs, zero_start, offset - zero_start, 0);
> +        if (ret < 0) {
> +            error_setg_errno(errp, -ret, "Failed to zero out new clusters");
> +            goto fail;
> +        }
> +
> +        /* Write explicit zeros for the unaligned head */
> +        if (zero_start > old_length) {
> +            uint8_t *buf = qemu_blockalign0(bs, s->cluster_size);
> +            QEMUIOVector qiov;
> +            qemu_iovec_init_buf(&qiov, buf, zero_start - old_length);
> +
> +            qemu_co_mutex_unlock(&s->lock);
> +            ret = qcow2_co_pwritev_part(bs, old_length, qiov.size, &qiov, 0, 0);

This works, but would it be any more efficient to use 
qcow2_co_pwrite_zeroes?  If the head of the cluster is already zero, 
then qcow2_co_pwrite_zeroes can turn into qcow2_cluster_zeroize for this 
cluster, while qcow2_co_pwritev_part cannot.

Because what you have works, and because we can use 
qcow2_co_pwrite_zeroes as an optimization in a later patch,

Reviewed-by: Eric Blake <eblake@redhat.com>

-- 
Eric Blake, Principal Software Engineer
Red Hat, Inc.           +1-919-301-3226
Virtualization:  qemu.org | libvirt.org


