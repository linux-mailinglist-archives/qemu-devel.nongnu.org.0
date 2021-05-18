Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C359B387BFB
	for <lists+qemu-devel@lfdr.de>; Tue, 18 May 2021 17:08:15 +0200 (CEST)
Received: from localhost ([::1]:38714 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lj1KQ-00063H-GS
	for lists+qemu-devel@lfdr.de; Tue, 18 May 2021 11:08:14 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54266)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mreitz@redhat.com>) id 1lj0zk-0004dT-SN
 for qemu-devel@nongnu.org; Tue, 18 May 2021 10:46:52 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:30689)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mreitz@redhat.com>) id 1lj0zi-0003u0-9v
 for qemu-devel@nongnu.org; Tue, 18 May 2021 10:46:52 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1621349209;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=JIRRvd1PzjFNzX/O/WftAqbcGUztAdGqfBrl9FxpM7I=;
 b=J7N5ddFgA/X4/6HkXvjmwMa3PkcGDW4OW/anlu2ckF4rq3c8v24sIUIuoQSpC+RCRyR2UZ
 a98Iljket9SJGCO8J6grsI2vXkuXVOtIw8f+19kCU66y3c5BKGdkIt5LlpfPl/TpV7aLFR
 dKed7a+CkdIWdrh7U/d2wV1A0BmY0Go=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-319-jTFsn7AdNNu2C6DmIi6eTA-1; Tue, 18 May 2021 10:46:48 -0400
X-MC-Unique: jTFsn7AdNNu2C6DmIi6eTA-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 33893814263;
 Tue, 18 May 2021 14:46:32 +0000 (UTC)
Received: from dresden.str.redhat.com (ovpn-115-121.ams2.redhat.com
 [10.36.115.121])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 0C23519D7C;
 Tue, 18 May 2021 14:46:29 +0000 (UTC)
Subject: Re: [PATCH 19/21] block/copy-before-write: make public block driver
To: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>,
 qemu-block@nongnu.org
References: <20210517064428.16223-1-vsementsov@virtuozzo.com>
 <20210517064428.16223-21-vsementsov@virtuozzo.com>
From: Max Reitz <mreitz@redhat.com>
Message-ID: <6802f72e-e7c7-16be-1dcd-51f2d8b23eb6@redhat.com>
Date: Tue, 18 May 2021 16:46:28 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <20210517064428.16223-21-vsementsov@virtuozzo.com>
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
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.374,
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
Cc: kwolf@redhat.com, berrange@redhat.com, ehabkost@redhat.com,
 jsnow@redhat.com, qemu-devel@nongnu.org, armbru@redhat.com, den@openvz.org,
 pbonzini@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 17.05.21 08:44, Vladimir Sementsov-Ogievskiy wrote:
> Finally, copy-before-write gets own .bdrv_open and .bdrv_close
> handlers, block_init() call and becomes available through bdrv_open().
> 
> To achieve this:
> 
>   - cbw_init gets unused flags argument and becomes cbw_open
>   - block_copy_state_free() call moved to new cbw_close()
>   - in bdrv_cbw_append:
>     - options are completed with driver and node-name, and we can simply
>       use bdrv_insert_node() to do both open and drained replacing
>   - in bdrv_cbw_drop:
>     - cbw_close() is now responsible for freeing s->bcs, so don't do it
>       here
> 
> Signed-off-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
> ---
>   block/copy-before-write.c | 60 ++++++++++++++++++---------------------
>   1 file changed, 28 insertions(+), 32 deletions(-)

Reviewed-by: Max Reitz <mreitz@redhat.com>


