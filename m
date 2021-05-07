Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3B918376913
	for <lists+qemu-devel@lfdr.de>; Fri,  7 May 2021 18:53:05 +0200 (CEST)
Received: from localhost ([::1]:40168 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lf3iq-0002vf-1n
	for lists+qemu-devel@lfdr.de; Fri, 07 May 2021 12:53:04 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39108)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mreitz@redhat.com>) id 1lf3bu-0008Jq-Bq
 for qemu-devel@nongnu.org; Fri, 07 May 2021 12:45:55 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:47101)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mreitz@redhat.com>) id 1lf3bl-0006Go-H6
 for qemu-devel@nongnu.org; Fri, 07 May 2021 12:45:52 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1620405944;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=hqPfmLZDMRSJ4bbucMn5ktyWIZv3O1K4ofPpKlYQk3U=;
 b=gnhB6TKnLeuXvRwsQs0qMiV/IE6EN/bwteKHIMFPhmpiB80BhmGhDRYztUn94vkTMu5u5/
 dQEPQxffqaw6Tk3388DdWHfJr8nFdZmHbOkVnh06nqUh7sJnfjbVd/FpU//REv5NQeov/o
 iEfBzmSVOtSw2U2WPjQ7l6ImCsmWIuI=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-414-eZUCJRdQMAu_LvN0LR8Jzg-1; Fri, 07 May 2021 12:45:40 -0400
X-MC-Unique: eZUCJRdQMAu_LvN0LR8Jzg-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id C98245B38C;
 Fri,  7 May 2021 16:45:39 +0000 (UTC)
Received: from dresden.str.redhat.com (ovpn-114-35.ams2.redhat.com
 [10.36.114.35])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id DC3955D6A1;
 Fri,  7 May 2021 16:45:38 +0000 (UTC)
Subject: Re: [PATCH] block/copy-on-read: use bdrv_drop_filter() and drop
 s->active
To: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>,
 qemu-block@nongnu.org
References: <20210506194143.394141-1-vsementsov@virtuozzo.com>
From: Max Reitz <mreitz@redhat.com>
Message-ID: <f97780a8-1733-b441-60dc-3afc88824337@redhat.com>
Date: Fri, 7 May 2021 18:45:37 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <20210506194143.394141-1-vsementsov@virtuozzo.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=mreitz@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=mreitz@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.699,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001,
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
Cc: kwolf@redhat.com, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 06.05.21 21:41, Vladimir Sementsov-Ogievskiy wrote:
> Now, after huge update of block graph permission update algorithm, we
> don't need this workaround with active state of the filter. Drop it and
> use new smart bdrv_drop_filter() function.
> 
> Signed-off-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
> ---
>   block/copy-on-read.c | 33 +--------------------------------
>   1 file changed, 1 insertion(+), 32 deletions(-)

Thanks, applied to my block branch:

https://github.com/XanClic/qemu/commits/block

Max


