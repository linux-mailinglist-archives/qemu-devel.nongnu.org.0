Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [IPv6:2001:470:142::17])
	by mail.lfdr.de (Postfix) with ESMTPS id 72CFD1BFDD7
	for <lists+qemu-devel@lfdr.de>; Thu, 30 Apr 2020 16:21:10 +0200 (CEST)
Received: from localhost ([::1]:58708 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jUA3p-0001sH-By
	for lists+qemu-devel@lfdr.de; Thu, 30 Apr 2020 10:21:09 -0400
Received: from eggs.gnu.org ([209.51.188.92]:58648)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <eblake@redhat.com>) id 1jUA0D-0007Ce-Vd
 for qemu-devel@nongnu.org; Thu, 30 Apr 2020 10:17:26 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.90_1)
 (envelope-from <eblake@redhat.com>) id 1jUA0D-0007pV-8a
 for qemu-devel@nongnu.org; Thu, 30 Apr 2020 10:17:25 -0400
Received: from us-smtp-2.mimecast.com ([207.211.31.81]:37749
 helo=us-smtp-delivery-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <eblake@redhat.com>) id 1jUA0C-0007pD-QZ
 for qemu-devel@nongnu.org; Thu, 30 Apr 2020 10:17:24 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1588256244;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=L3k2wVdWqN62Aj6Yj443VnOZvvdYywcqp16Z1MpFeMQ=;
 b=ZKE81TPrn6ERtXXvwv53qMXFA0rYDxNpBcOBek158XIUvlElQzs+3xzpf04PKrGUDhbOxH
 Z0ANv/7PFsIasbC0Yb/X50GbKFp96QMUFsT2zJfDlhfw1gISXux7EedsZXnLkh/Us3TPUl
 1HjzD56AGjBzy1MTOp6USeT7IQw11xY=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-135-yW3Cg5iQOgq4o4aYOuNE9Q-1; Thu, 30 Apr 2020 10:17:21 -0400
X-MC-Unique: yW3Cg5iQOgq4o4aYOuNE9Q-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 7BEC7804042;
 Thu, 30 Apr 2020 14:17:20 +0000 (UTC)
Received: from [10.10.116.80] (ovpn-116-80.rdu2.redhat.com [10.10.116.80])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id C33CE60C87;
 Thu, 30 Apr 2020 14:17:19 +0000 (UTC)
Subject: Re: [PATCH 4/6] vmdk: Don't update L2 table for zero write on zero
 cluster
To: Kevin Wolf <kwolf@redhat.com>, qemu-block@nongnu.org
References: <20200430133007.170335-1-kwolf@redhat.com>
 <20200430133007.170335-5-kwolf@redhat.com>
From: Eric Blake <eblake@redhat.com>
Organization: Red Hat, Inc.
Message-ID: <2c88e019-19ac-bcaf-906f-f9b2ff80f768@redhat.com>
Date: Thu, 30 Apr 2020 09:17:18 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.7.0
MIME-Version: 1.0
In-Reply-To: <20200430133007.170335-5-kwolf@redhat.com>
Content-Language: en-US
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=207.211.31.81; envelope-from=eblake@redhat.com;
 helo=us-smtp-delivery-1.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/04/30 01:31:09
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Received-From: 207.211.31.81
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
Cc: qemu-devel@nongnu.org, mreitz@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 4/30/20 8:30 AM, Kevin Wolf wrote:
> If a cluster is already zeroed, we don't have to call vmdk_L2update(),
> which is rather slow because it flushes the image file.
> 
> Signed-off-by: Kevin Wolf <kwolf@redhat.com>
> ---
>   block/vmdk.c | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 

Reviewed-by: Eric Blake <eblake@redhat.com>

> diff --git a/block/vmdk.c b/block/vmdk.c
> index da25b8992e..dcd30f1419 100644
> --- a/block/vmdk.c
> +++ b/block/vmdk.c
> @@ -2013,7 +2013,7 @@ static int vmdk_pwritev(BlockDriverState *bs, uint64_t offset,
>                       offset_in_cluster == 0 &&
>                       n_bytes >= extent->cluster_sectors * BDRV_SECTOR_SIZE) {
>                   n_bytes = extent->cluster_sectors * BDRV_SECTOR_SIZE;
> -                if (!zero_dry_run) {
> +                if (!zero_dry_run && ret != VMDK_ZEROED) {
>                       /* update L2 tables */
>                       if (vmdk_L2update(extent, &m_data, VMDK_GTE_ZEROED)
>                               != VMDK_OK) {
> 

-- 
Eric Blake, Principal Software Engineer
Red Hat, Inc.           +1-919-301-3226
Virtualization:  qemu.org | libvirt.org


