Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [IPv6:2001:470:142::17])
	by mail.lfdr.de (Postfix) with ESMTPS id 800FC1C62B3
	for <lists+qemu-devel@lfdr.de>; Tue,  5 May 2020 23:12:27 +0200 (CEST)
Received: from localhost ([::1]:42168 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jW4ra-0005F5-HP
	for lists+qemu-devel@lfdr.de; Tue, 05 May 2020 17:12:26 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53102)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eblake@redhat.com>) id 1jW4pW-000352-8B
 for qemu-devel@nongnu.org; Tue, 05 May 2020 17:10:18 -0400
Received: from us-smtp-delivery-1.mimecast.com ([205.139.110.120]:35406
 helo=us-smtp-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <eblake@redhat.com>) id 1jW4pV-0007j6-Dc
 for qemu-devel@nongnu.org; Tue, 05 May 2020 17:10:17 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1588713016;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=WhprH/89AHRNaC1aVX35DhkOnS5njC9aBivYtrP3CZI=;
 b=PGwLf5z7AKlvGnmmrDZQYmKo73B2uNGCuHpDTY8HsdVS/i6ybejTKFEDQKDbJwdcoN83W7
 poAzk2MnYFBCBHa/y5xkS7B6h9lcFwZgZOxyJBzaruhmiaikco4HsnymauhnIhSoTNqZj7
 NHrFFvdb40lWutHjnH7P+/VHXAvlIXk=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-362-o3vWDqkdOpirDt0T_C_KSA-1; Tue, 05 May 2020 17:10:14 -0400
X-MC-Unique: o3vWDqkdOpirDt0T_C_KSA-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 8BD98461;
 Tue,  5 May 2020 21:10:13 +0000 (UTC)
Received: from [10.3.114.73] (ovpn-114-73.phx2.redhat.com [10.3.114.73])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 07F6262928;
 Tue,  5 May 2020 21:10:12 +0000 (UTC)
Subject: Re: [PATCH v5 15/31] qcow2: Add qcow2_cluster_is_allocated()
To: Alberto Garcia <berto@igalia.com>, qemu-devel@nongnu.org
References: <cover.1588699789.git.berto@igalia.com>
 <020c6e625af4fcf64859c4f37f11d04efbebb0aa.1588699789.git.berto@igalia.com>
From: Eric Blake <eblake@redhat.com>
Organization: Red Hat, Inc.
Message-ID: <71f82bd4-367a-8fea-8bcb-0270e5bd2642@redhat.com>
Date: Tue, 5 May 2020 16:10:12 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.7.0
MIME-Version: 1.0
In-Reply-To: <020c6e625af4fcf64859c4f37f11d04efbebb0aa.1588699789.git.berto@igalia.com>
Content-Language: en-US
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=205.139.110.120; envelope-from=eblake@redhat.com;
 helo=us-smtp-1.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/05/05 15:42:13
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic]
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_PASS=-0.001,
 URIBL_BLOCKED=0.001 autolearn=_AUTOLEARN
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
Cc: Kevin Wolf <kwolf@redhat.com>,
 Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>, qemu-block@nongnu.org,
 Max Reitz <mreitz@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 5/5/20 12:38 PM, Alberto Garcia wrote:
> This helper function tells us if a cluster is allocated (that is,
> there is an associated host offset for it).
> 
> Signed-off-by: Alberto Garcia <berto@igalia.com>
> ---
>   block/qcow2.h | 6 ++++++
>   1 file changed, 6 insertions(+)

Reviewed-by: Eric Blake <eblake@redhat.com>

> 
> diff --git a/block/qcow2.h b/block/qcow2.h
> index be7816a3b8..b5db8d2f36 100644
> --- a/block/qcow2.h
> +++ b/block/qcow2.h
> @@ -763,6 +763,12 @@ QCow2SubclusterType qcow2_get_subcluster_type(BlockDriverState *bs,
>       }
>   }
>   
> +static inline bool qcow2_cluster_is_allocated(QCow2ClusterType type)
> +{
> +    return (type == QCOW2_CLUSTER_COMPRESSED || type == QCOW2_CLUSTER_NORMAL ||
> +            type == QCOW2_CLUSTER_ZERO_ALLOC);
> +}
> +
>   /* Check whether refcounts are eager or lazy */
>   static inline bool qcow2_need_accurate_refcounts(BDRVQcow2State *s)
>   {
> 

-- 
Eric Blake, Principal Software Engineer
Red Hat, Inc.           +1-919-301-3226
Virtualization:  qemu.org | libvirt.org


