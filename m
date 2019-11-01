Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id ACB31EC2D8
	for <lists+qemu-devel@lfdr.de>; Fri,  1 Nov 2019 13:42:01 +0100 (CET)
Received: from localhost ([::1]:38736 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1iQWFc-0006KU-E2
	for lists+qemu-devel@lfdr.de; Fri, 01 Nov 2019 08:42:00 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42046)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <eblake@redhat.com>) id 1iQWEO-0005Z0-Lu
 for qemu-devel@nongnu.org; Fri, 01 Nov 2019 08:40:45 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <eblake@redhat.com>) id 1iQWEL-0006Lj-QZ
 for qemu-devel@nongnu.org; Fri, 01 Nov 2019 08:40:43 -0400
Received: from us-smtp-1.mimecast.com ([205.139.110.61]:40300
 helo=us-smtp-delivery-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <eblake@redhat.com>) id 1iQWEJ-0006De-RX
 for qemu-devel@nongnu.org; Fri, 01 Nov 2019 08:40:40 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1572612034;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=zk74v0gC+DNvjMBYuOPhBn7nW4PGZ3x2jINkHxEweO4=;
 b=TpX1Wog8X3A6vLilixjBXKE147Mts3wu4MKg0tJbXbQDuFQZFveykfp/uSbnMyXr0Ek/+I
 utOKcRzBE9OxoqJQF9jPyUFqpduwfZ/LRto2xpq1P0iCSsLmYPVmOHyyxzWZOI3BTuICIC
 xkwsAMKNH7rBjn4LKPJSx5VRnK8vV2M=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-212-DmbTG27MOY2yevXaN8VelA-1; Fri, 01 Nov 2019 08:40:30 -0400
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 565CA800C77;
 Fri,  1 Nov 2019 12:40:29 +0000 (UTC)
Received: from [10.3.116.202] (ovpn-116-202.phx2.redhat.com [10.3.116.202])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 9A74F1001B32;
 Fri,  1 Nov 2019 12:40:24 +0000 (UTC)
Subject: Re: [PATCH for-4.2 1/4] Revert "qcow2: skip writing zero buffers to
 empty COW areas"
To: Max Reitz <mreitz@redhat.com>, qemu-block@nongnu.org
References: <20191101100019.9512-1-mreitz@redhat.com>
 <20191101100019.9512-2-mreitz@redhat.com>
From: Eric Blake <eblake@redhat.com>
Organization: Red Hat, Inc.
Message-ID: <c4e21028-0321-20ea-21b8-31dec87fac97@redhat.com>
Date: Fri, 1 Nov 2019 13:40:23 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.1.1
MIME-Version: 1.0
In-Reply-To: <20191101100019.9512-2-mreitz@redhat.com>
Content-Language: en-US
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
X-MC-Unique: DmbTG27MOY2yevXaN8VelA-1
X-Mimecast-Spam-Score: 0
Content-Type: text/plain; charset=WINDOWS-1252; format=flowed
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
 [fuzzy]
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
Cc: Kevin Wolf <kwolf@redhat.com>, Anton Nefedov <anton.nefedov@virtuozzo.com>,
 Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>, qemu-devel@nongnu.org,
 Stefan Hajnoczi <stefanha@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 11/1/19 11:00 AM, Max Reitz wrote:
> This reverts commit c8bb23cbdbe32f5c326365e0a82e1b0e68cdcd8a.
>=20
> This commit causes fundamental performance problems on XFS (because
> fallocate() stalls the AIO pipeline), and as such it is not clear that
> we should unconditionally enable this behavior.
>=20
> We expect subclusters to alleviate the performance penalty of small
> writes to newly allocated clusters, so when we get them, the originally
> intended performance gain may actually no longer be significant.
>=20
> If we want to reintroduce something similar to c8bb23cbdbe, it will
> require extensive benchmarking on various systems with subclusters
> enabled.
>=20
> Cc: qemu-stable@nongnu.org
> Signed-off-by: Max Reitz <mreitz@redhat.com>
> ---

> +++ b/qapi/block-core.json
> @@ -3304,8 +3304,6 @@
>   #
>   # @cor_write: a write due to copy-on-read (since 2.11)
>   #
> -# @cluster_alloc_space: an allocation of file space for a cluster (since=
 4.1)
> -#
>   # @none: triggers once at creation of the blkdebug node (since 4.1)

Deleting released qapi is not backwards-compatible.  However, given that=20
the only known user of this interface is debug testing via iotests, I'm=20
not too concerned that we would be impacting any external users.


--=20
Eric Blake, Principal Software Engineer
Red Hat, Inc.           +1-919-301-3226
Virtualization:  qemu.org | libvirt.org


