Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2F7F62D77DA
	for <lists+qemu-devel@lfdr.de>; Fri, 11 Dec 2020 15:31:47 +0100 (CET)
Received: from localhost ([::1]:54152 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1knjST-0002fp-V7
	for lists+qemu-devel@lfdr.de; Fri, 11 Dec 2020 09:31:45 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:40364)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mreitz@redhat.com>) id 1knjQb-00020h-Lw
 for qemu-devel@nongnu.org; Fri, 11 Dec 2020 09:29:49 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:42672)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <mreitz@redhat.com>) id 1knjQY-0002bc-RM
 for qemu-devel@nongnu.org; Fri, 11 Dec 2020 09:29:49 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1607696985;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=EiJM1ck5YYSDW0JbnD3J/uN1mMG3zvUcUszQJuglB1s=;
 b=Np1dlvm9qpbTz5GDK3XzXU0djKhJzbFEuUGmHMcFMQ1hWpbelPVod/3MuAJTNUqVgaYCnN
 J3nUqSULbFJrA4YNwIURuT3ezvTX3486MC9uITXXtIntqfDx+4PN5vglsrFQ8Scb95jYkS
 BUyPUR66o9s0jehtfFDjtnYjHe2i2NM=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-199-3tQdXxGlNDSyc5kFdNeFmg-1; Fri, 11 Dec 2020 09:29:42 -0500
X-MC-Unique: 3tQdXxGlNDSyc5kFdNeFmg-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id B61D1195D57C;
 Fri, 11 Dec 2020 14:29:35 +0000 (UTC)
Received: from dresden.str.redhat.com (ovpn-112-98.ams2.redhat.com
 [10.36.112.98])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 7419919C78;
 Fri, 11 Dec 2020 14:29:33 +0000 (UTC)
Subject: Re: [PATCH v14 08/13] copy-on-read: skip non-guest reads if no copy
 needed
To: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>,
 qemu-block@nongnu.org
References: <20201204220758.2879-1-vsementsov@virtuozzo.com>
 <20201204220758.2879-9-vsementsov@virtuozzo.com>
From: Max Reitz <mreitz@redhat.com>
Message-ID: <c242fda4-23c5-a907-0599-6e611318509c@redhat.com>
Date: Fri, 11 Dec 2020 15:29:30 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.5.0
MIME-Version: 1.0
In-Reply-To: <20201204220758.2879-9-vsementsov@virtuozzo.com>
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=mreitz@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=mreitz@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H3=0.001,
 RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: fam@euphon.net, kwolf@redhat.com, qemu-devel@nongnu.org, armbru@redhat.com,
 stefanha@redhat.com, andrey.shinkevich@virtuozzo.com, den@openvz.org,
 jsnow@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 04.12.20 23:07, Vladimir Sementsov-Ogievskiy wrote:
> From: Andrey Shinkevich <andrey.shinkevich@virtuozzo.com>
> 
> If the flag BDRV_REQ_PREFETCH was set, skip idling read/write
> operations in COR-driver. It can be taken into account for the
> COR-algorithms optimization. That check is being made during the
> block stream job by the moment.
> 
> Add the BDRV_REQ_PREFETCH flag to the supported_read_flags of the
> COR-filter.
> 
> block: Modify the comment for the flag BDRV_REQ_PREFETCH as we are
> going to use it alone and pass it to the COR-filter driver for further
> processing.
> 
> Signed-off-by: Andrey Shinkevich <andrey.shinkevich@virtuozzo.com>
> Reviewed-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
> ---
>   include/block/block.h |  8 +++++---
>   block/copy-on-read.c  | 14 ++++++++++----
>   2 files changed, 15 insertions(+), 7 deletions(-)

Reviewed-by: Max Reitz <mreitz@redhat.com>


