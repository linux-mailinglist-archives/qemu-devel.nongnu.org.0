Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 770A3D4735
	for <lists+qemu-devel@lfdr.de>; Fri, 11 Oct 2019 20:09:29 +0200 (CEST)
Received: from localhost ([::1]:55162 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1iIzM0-0004LE-0T
	for lists+qemu-devel@lfdr.de; Fri, 11 Oct 2019 14:09:28 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40561)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <eblake@redhat.com>) id 1iIxhA-0000rx-IP
 for qemu-devel@nongnu.org; Fri, 11 Oct 2019 12:23:13 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <eblake@redhat.com>) id 1iIxh9-0008KA-6T
 for qemu-devel@nongnu.org; Fri, 11 Oct 2019 12:23:12 -0400
Received: from mx1.redhat.com ([209.132.183.28]:46152)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <eblake@redhat.com>)
 id 1iIxh5-0008Fk-0t; Fri, 11 Oct 2019 12:23:07 -0400
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id 2F98918C4268;
 Fri, 11 Oct 2019 16:23:06 +0000 (UTC)
Received: from [10.3.116.168] (ovpn-116-168.phx2.redhat.com [10.3.116.168])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id ABE7E5D6C8;
 Fri, 11 Oct 2019 16:23:05 +0000 (UTC)
Subject: Re: [PATCH v3 07/16] qcow2: Write v3-compliant snapshot list on
 upgrade
To: Max Reitz <mreitz@redhat.com>, qemu-block@nongnu.org
References: <20191011152814.14791-1-mreitz@redhat.com>
 <20191011152814.14791-8-mreitz@redhat.com>
From: Eric Blake <eblake@redhat.com>
Organization: Red Hat, Inc.
Message-ID: <a9263c74-f958-5859-9db3-a67aefe73ff5@redhat.com>
Date: Fri, 11 Oct 2019 11:23:05 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.1.0
MIME-Version: 1.0
In-Reply-To: <20191011152814.14791-8-mreitz@redhat.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.6.2
 (mx1.redhat.com [10.5.110.62]); Fri, 11 Oct 2019 16:23:06 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
 [fuzzy]
X-Received-From: 209.132.183.28
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
Cc: Kevin Wolf <kwolf@redhat.com>, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 10/11/19 10:28 AM, Max Reitz wrote:
> qcow2 v3 requires every snapshot table entry to have two extra data
> fields: The 64-bit VM state size, and the virtual disk size.  Both are
> optional for v2 images, so they may not be present.
> 
> qcow2_upgrade() therefore should update the snapshot table to ensure all
> entries have these extra data fields.
> 
> Buglink: https://bugzilla.redhat.com/show_bug.cgi?id=1727347
> Reported-by: Eric Blake <eblake@redhat.com>
> Signed-off-by: Max Reitz <mreitz@redhat.com>
> Reviewed-by: Eric Blake <eblake@redhat.com>
> ---
>   block/qcow2.c | 32 ++++++++++++++++++++++++++++++--
>   1 file changed, 30 insertions(+), 2 deletions(-)
> 

> +    need_snapshot_update = false;
> +    for (i = 0; i < s->nb_snapshots; i++) {
> +        if (s->snapshots[i].extra_data_size <
> +            sizeof_field(QCowSnapshotExtraData, vm_state_size_large) +
> +            sizeof_field(QCowSnapshotExtraData, disk_size))

Shorter as:
if (s->snapshots[i].extra_data_size < sizeof(QCowSnapshotExtraData))

but that's stylistic, so R-b still stands.

-- 
Eric Blake, Principal Software Engineer
Red Hat, Inc.           +1-919-301-3226
Virtualization:  qemu.org | libvirt.org

