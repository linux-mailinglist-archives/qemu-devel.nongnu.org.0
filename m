Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id AD7D513962E
	for <lists+qemu-devel@lfdr.de>; Mon, 13 Jan 2020 17:28:05 +0100 (CET)
Received: from localhost ([::1]:52598 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ir2ZQ-0006Wz-Nf
	for lists+qemu-devel@lfdr.de; Mon, 13 Jan 2020 11:28:04 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:49355)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <eblake@redhat.com>) id 1ir2Y5-0005ZN-4r
 for qemu-devel@nongnu.org; Mon, 13 Jan 2020 11:26:42 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <eblake@redhat.com>) id 1ir2Y4-0002Ng-0z
 for qemu-devel@nongnu.org; Mon, 13 Jan 2020 11:26:41 -0500
Received: from us-smtp-1.mimecast.com ([207.211.31.81]:24500
 helo=us-smtp-delivery-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <eblake@redhat.com>) id 1ir2Y3-0002Mp-TZ
 for qemu-devel@nongnu.org; Mon, 13 Jan 2020 11:26:39 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1578932799;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=5z98hdWdwBdv7+bSpfYGSRqEcSsubIK8HnTTFU6vSjI=;
 b=JG5FhoakaMtxw0gH2wlkp+8Vb/q8znFYlgKK5eX5k1hR4sklAx877tROomuQsYvUaX84wB
 s1CqY4yoyg69llDPUsRTD1jjgykb5K4+rqHhyOhqLT1H08FM4t2LF6DYBuVkF/oslYiQLF
 VHPXayaU4tbt7J1XwEKmwQFJXGlvxq8=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-371-akdM6DYcMzqzwoM6IvtciA-1; Mon, 13 Jan 2020 11:26:37 -0500
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 9E70D1005502;
 Mon, 13 Jan 2020 16:26:35 +0000 (UTC)
Received: from [10.3.117.16] (ovpn-117-16.phx2.redhat.com [10.3.117.16])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id E2A1A5C1BB;
 Mon, 13 Jan 2020 16:26:34 +0000 (UTC)
Subject: Re: [PATCH RFC 01/12] migration: Add multiRDMA capability support
To: Zhimin Feng <fengzhimin1@huawei.com>, quintela@redhat.com,
 dgilbert@redhat.com, armbru@redhat.com
References: <20200109045922.904-1-fengzhimin1@huawei.com>
 <20200109045922.904-2-fengzhimin1@huawei.com>
From: Eric Blake <eblake@redhat.com>
Organization: Red Hat, Inc.
Message-ID: <dddb1f19-381f-ea7e-5200-46f03b1fa0a2@redhat.com>
Date: Mon, 13 Jan 2020 10:26:34 -0600
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.3.1
MIME-Version: 1.0
In-Reply-To: <20200109045922.904-2-fengzhimin1@huawei.com>
Content-Language: en-US
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
X-MC-Unique: akdM6DYcMzqzwoM6IvtciA-1
X-Mimecast-Spam-Score: 0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
 [fuzzy]
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
Cc: jemmy858585@gmail.com, qemu-devel@nongnu.org,
 zhang.zhanghailiang@huawei.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 1/8/20 10:59 PM, Zhimin Feng wrote:
> From: fengzhimin <fengzhimin1@huawei.com>
> 
> Signed-off-by: fengzhimin <fengzhimin1@huawei.com>
> ---

> +++ b/qapi/migration.json
> @@ -421,6 +421,8 @@
>   # @validate-uuid: Send the UUID of the source to allow the destination
>   #                 to ensure it is the same. (since 4.2)
>   #
> +# @multirdma: Use more than one channels for rdma migration. (since 4.2)

We've missed 4.2; the next release will be 5.0.

> +#
>   # Since: 1.2
>   ##
>   { 'enum': 'MigrationCapability',
> @@ -428,7 +430,7 @@
>              'compress', 'events', 'postcopy-ram', 'x-colo', 'release-ram',
>              'block', 'return-path', 'pause-before-switchover', 'multifd',
>              'dirty-bitmaps', 'postcopy-blocktime', 'late-block-activate',
> -           'x-ignore-shared', 'validate-uuid' ] }
> +           'x-ignore-shared', 'validate-uuid', 'multirdma' ] }
>   
>   ##
>   # @MigrationCapabilityStatus:
> 

-- 
Eric Blake, Principal Software Engineer
Red Hat, Inc.           +1-919-301-3226
Virtualization:  qemu.org | libvirt.org


