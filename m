Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C361D1DB9D4
	for <lists+qemu-devel@lfdr.de>; Wed, 20 May 2020 18:40:02 +0200 (CEST)
Received: from localhost ([::1]:39506 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jbRlB-00038U-QW
	for lists+qemu-devel@lfdr.de; Wed, 20 May 2020 12:40:01 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48100)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eblake@redhat.com>) id 1jbRiR-00067f-0N
 for qemu-devel@nongnu.org; Wed, 20 May 2020 12:37:11 -0400
Received: from us-smtp-delivery-1.mimecast.com ([207.211.31.120]:45193
 helo=us-smtp-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <eblake@redhat.com>) id 1jbRiQ-0002pG-7j
 for qemu-devel@nongnu.org; Wed, 20 May 2020 12:37:10 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1589992628;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=TBRvMfOMbiXya+uHCxoK5QMvFin67YIdkJDyBoFf+9Y=;
 b=eF+88YwcTFAMizEkPKyiewl81hDk5iUYhptBSlvjl9j1AzbnS9R9mUshiKKhfg1ruVSyFG
 6Lz9D3SVe34udUHoj35HPu4I09LwmIjRkyfVFy484zRslKPTq/UClRFb6PNV8Gdp7naIN6
 n0485lO8zih1bMUtB2y1p+fxcdBiYDM=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-177-jpvSz3yXMuy8ci8kk47WdA-1; Wed, 20 May 2020 12:37:04 -0400
X-MC-Unique: jpvSz3yXMuy8ci8kk47WdA-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 11BAB107ACF4;
 Wed, 20 May 2020 16:37:03 +0000 (UTC)
Received: from [10.3.112.88] (ovpn-112-88.phx2.redhat.com [10.3.112.88])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 0329D34214;
 Wed, 20 May 2020 16:36:58 +0000 (UTC)
Subject: Re: [PATCH v3 4/5] block/io: fix bdrv_is_allocated_above
To: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>,
 qemu-block@nongnu.org
References: <20200520083520.25793-1-vsementsov@virtuozzo.com>
 <20200520083520.25793-5-vsementsov@virtuozzo.com>
From: Eric Blake <eblake@redhat.com>
Organization: Red Hat, Inc.
Message-ID: <6e1143e2-2bd6-f75c-b2ff-2074f4423ca2@redhat.com>
Date: Wed, 20 May 2020 11:36:58 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.7.0
MIME-Version: 1.0
In-Reply-To: <20200520083520.25793-5-vsementsov@virtuozzo.com>
Content-Language: en-US
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=207.211.31.120; envelope-from=eblake@redhat.com;
 helo=us-smtp-1.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/05/20 01:34:51
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_PASS=-0.001, URIBL_BLOCKED=0.001 autolearn=_AUTOLEARN
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
Cc: kwolf@redhat.com, fam@euphon.net, qemu-devel@nongnu.org, mreitz@redhat.com,
 stefanha@redhat.com, den@openvz.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 5/20/20 3:35 AM, Vladimir Sementsov-Ogievskiy wrote:
> bdrv_is_allocated_above wrongly handles short backing files: it reports
> after-EOF space as UNALLOCATED which is wrong, as on read the data is
> generated on the level of short backing file (if all overlays has
> unallocated area at that place).
> 
> Reusing bdrv_common_block_status_above fixes the issue and unifies code
> path.
> 
> Signed-off-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
> ---
>   block/io.c | 43 +++++--------------------------------------
>   1 file changed, 5 insertions(+), 38 deletions(-)
> 

Reviewed-by: Eric Blake <eblake@redhat.com>

-- 
Eric Blake, Principal Software Engineer
Red Hat, Inc.           +1-919-301-3226
Virtualization:  qemu.org | libvirt.org


