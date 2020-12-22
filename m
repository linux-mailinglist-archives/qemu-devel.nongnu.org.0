Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6913E2E0C8E
	for <lists+qemu-devel@lfdr.de>; Tue, 22 Dec 2020 16:16:51 +0100 (CET)
Received: from localhost ([::1]:49082 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1krjP8-0004ha-0w
	for lists+qemu-devel@lfdr.de; Tue, 22 Dec 2020 10:16:50 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:60270)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mreitz@redhat.com>) id 1krjO9-000498-RC
 for qemu-devel@nongnu.org; Tue, 22 Dec 2020 10:15:49 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:41173)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <mreitz@redhat.com>) id 1krjO7-0006yw-7m
 for qemu-devel@nongnu.org; Tue, 22 Dec 2020 10:15:49 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1608650145;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=jycGFMWSnmAt9w4g0hsGwVqFj9+w8o7/IkwcyOub3UI=;
 b=VLSzVxvDjunTXeylAeEfSxizHmC5R9cASRmtKSmah+54y8E52qbujswq5uvpeybGbJuRpG
 //+tWOi5nmlvGNoxsj6k06dJ/X4n3JJWo3ELhTCORSeNRuQHE5ZjVvVkrACyyEN0092qwd
 0xAF4o/5m+rmr16eDtgjGwol0TYaR48=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-296-ajfvuotlNlGmXpIZS0f-oA-1; Tue, 22 Dec 2020 10:15:37 -0500
X-MC-Unique: ajfvuotlNlGmXpIZS0f-oA-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 468F71800D42;
 Tue, 22 Dec 2020 15:15:36 +0000 (UTC)
Received: from dresden.str.redhat.com (ovpn-113-243.ams2.redhat.com
 [10.36.113.243])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 11EA55D71B;
 Tue, 22 Dec 2020 15:15:34 +0000 (UTC)
Subject: Re: [PATCH] iotests: fix _check_o_direct
To: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>,
 qemu-block@nongnu.org
References: <20201218182012.47607-1-vsementsov@virtuozzo.com>
From: Max Reitz <mreitz@redhat.com>
Message-ID: <a5f2a6a0-3638-9bb9-8b54-15a8acc3dc78@redhat.com>
Date: Tue, 22 Dec 2020 16:15:32 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.5.0
MIME-Version: 1.0
In-Reply-To: <20201218182012.47607-1-vsementsov@virtuozzo.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=mreitz@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=63.128.21.124; envelope-from=mreitz@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -45
X-Spam_score: -4.6
X-Spam_bar: ----
X-Spam_report: (-4.6 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-2.521, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H4=0.001,
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

On 18.12.20 19:20, Vladimir Sementsov-Ogievskiy wrote:
> Unfortunately commit "iotests: handle tmpfs" break running iotests
> with -nbd -nocache, as _check_o_direct tries to create
> $TEST_IMG.test_o_direct, but in case of nbd TEST_IMG is smothing like
> nbd+unix:///... , and test fails with message
> 
>    qemu-img: nbd+unix:///?socket[...]test_o_direct: Protocol driver
>      'nbd' does not support image creation, and opening the image
>      failed: Failed to connect to '/tmp/tmp.[...]/nbd/test_o_direct': No
>      such file or directory
> 
> Use TEST_DIR instead.
> 
> Fixes: cfdca2b9f9d4ca26bb2b2dfe8de3149092e39170
> Signed-off-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
> ---
>   tests/qemu-iotests/common.rc | 7 ++++---
>   1 file changed, 4 insertions(+), 3 deletions(-)

Thanks, applied to my block branch:

https://git.xanclic.moe/XanClic/qemu/commits/branch/block


