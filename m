Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 334592F1AF9
	for <lists+qemu-devel@lfdr.de>; Mon, 11 Jan 2021 17:32:36 +0100 (CET)
Received: from localhost ([::1]:46416 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kz07N-0001IC-OH
	for lists+qemu-devel@lfdr.de; Mon, 11 Jan 2021 11:32:33 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:38454)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mreitz@redhat.com>) id 1kz034-0000Ff-RO
 for qemu-devel@nongnu.org; Mon, 11 Jan 2021 11:28:06 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:30854)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <mreitz@redhat.com>) id 1kz032-00071Y-Tj
 for qemu-devel@nongnu.org; Mon, 11 Jan 2021 11:28:06 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1610382483;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=li6Lx077uD+/vjiBes6jITRYS6cW0balQKu94jk9PPg=;
 b=OPyobf+K6eukpRwQYJNp5DtC93ydj1MYkwBwR5tOmowmuHObkef6EIqMl7sbggV9O73CkT
 g9cGgngEBvbkUlOl95EwHL9Oduol7LTPSoraMqNjPX+fa8xVkzhCenjbl8XD80LwOALRtN
 sTc4UBaNgl5wDtui+IJYgKN7BBw5qFQ=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-466-vqOv-1SePn6ZX2xE4ywkpQ-1; Mon, 11 Jan 2021 11:28:01 -0500
X-MC-Unique: vqOv-1SePn6ZX2xE4ywkpQ-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id E60AB9CDA2;
 Mon, 11 Jan 2021 16:27:59 +0000 (UTC)
Received: from dresden.str.redhat.com (ovpn-115-17.ams2.redhat.com
 [10.36.115.17])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 2AF4560BE2;
 Mon, 11 Jan 2021 16:27:55 +0000 (UTC)
Subject: Re: [PATCH v3 04/25] block/block-copy: implement block_copy_async
To: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>,
 qemu-block@nongnu.org
References: <20201026171815.13233-1-vsementsov@virtuozzo.com>
 <20201026171815.13233-5-vsementsov@virtuozzo.com>
From: Max Reitz <mreitz@redhat.com>
Message-ID: <0f6163c9-b3c8-f154-1c42-04f478a74c6b@redhat.com>
Date: Mon, 11 Jan 2021 17:27:53 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.5.0
MIME-Version: 1.0
In-Reply-To: <20201026171815.13233-5-vsementsov@virtuozzo.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=mreitz@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=63.128.21.124; envelope-from=mreitz@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.251,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001,
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
Cc: kwolf@redhat.com, wencongyang2@huawei.com, xiechanglong.d@gmail.com,
 qemu-devel@nongnu.org, armbru@redhat.com, den@openvz.org, jsnow@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 26.10.20 18:17, Vladimir Sementsov-Ogievskiy wrote:
> We'll need async block-copy invocation to use in backup directly.
> 
> Signed-off-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
> ---
>   include/block/block-copy.h | 26 ++++++++++++
>   block/block-copy.c         | 81 ++++++++++++++++++++++++++++++++++++--
>   2 files changed, 103 insertions(+), 4 deletions(-)

Reviewed-by: Max Reitz <mreitz@redhat.com>


