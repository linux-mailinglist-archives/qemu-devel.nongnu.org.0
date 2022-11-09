Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0A814622CB1
	for <lists+qemu-devel@lfdr.de>; Wed,  9 Nov 2022 14:47:25 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1oslPE-0007EL-CZ; Wed, 09 Nov 2022 08:46:16 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@yandex-team.ru>)
 id 1oslOy-0007Ci-9k; Wed, 09 Nov 2022 08:46:00 -0500
Received: from forwardcorp1c.mail.yandex.net ([178.154.239.200])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@yandex-team.ru>)
 id 1oslOv-0000Kg-AJ; Wed, 09 Nov 2022 08:45:59 -0500
Received: from iva8-3a65cceff156.qloud-c.yandex.net
 (iva8-3a65cceff156.qloud-c.yandex.net
 [IPv6:2a02:6b8:c0c:2d80:0:640:3a65:ccef])
 by forwardcorp1c.mail.yandex.net (Yandex) with ESMTP id B17FB5E9E1;
 Wed,  9 Nov 2022 16:45:44 +0300 (MSK)
Received: from [IPV6:2a02:6b8:b081:b535::1:28] (unknown
 [2a02:6b8:b081:b535::1:28])
 by iva8-3a65cceff156.qloud-c.yandex.net (smtpcorp/Yandex) with ESMTPSA id
 n0l93GEhG1-jeNuJmZ3; Wed, 09 Nov 2022 16:45:44 +0300
X-Yandex-Fwd: 1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yandex-team.ru;
 s=default; 
 t=1668001544; bh=mU4FCfWyQlJrZsoosnGPJOOSU6LJ9wXgr/mtvkeMvjI=;
 h=From:In-Reply-To:Cc:Date:References:To:Subject:Message-ID;
 b=hNzK6MQLMw6nIGCw+n56unRdq0/k+OinrIPY+jO9UlKGrnhHB/JTMgqGtWk3bQR0j
 zA0AJP2FicrEUTdOjDoEO7mOFM+IvlA0rdrBSltCTRzPYDb6esr3Fwzh0j0lD6CGwo
 oJbJATgEKMruevtBN5PJ5riKvAgr5Xw2FmFzc8V0=
Authentication-Results: iva8-3a65cceff156.qloud-c.yandex.net;
 dkim=pass header.i=@yandex-team.ru
Message-ID: <3947267b-bcf7-eb0b-6307-b371e52bbd0b@yandex-team.ru>
Date: Wed, 9 Nov 2022 16:45:40 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.2.2
Subject: Re: [PATCH 02/13] test-bdrv-drain: Don't yield in
 .bdrv_co_drained_begin/end()
Content-Language: en-US
To: Kevin Wolf <kwolf@redhat.com>, qemu-block@nongnu.org
Cc: eesposit@redhat.com, stefanha@redhat.com, hreitz@redhat.com,
 pbonzini@redhat.com, qemu-devel@nongnu.org
References: <20221108123738.530873-1-kwolf@redhat.com>
 <20221108123738.530873-3-kwolf@redhat.com>
From: Vladimir Sementsov-Ogievskiy <vsementsov@yandex-team.ru>
In-Reply-To: <20221108123738.530873-3-kwolf@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=178.154.239.200;
 envelope-from=vsementsov@yandex-team.ru; helo=forwardcorp1c.mail.yandex.net
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

On 11/8/22 15:37, Kevin Wolf wrote:
> We want to change .bdrv_co_drained_begin/end() back to be non-coroutine
> callbacks, so in preparation, avoid yielding in their implementation.
> 
> This does almost the same as the existing logic in bdrv_drain_invoke(),
> by creating and entering coroutines internally. However, since the test
> case is by far the heaviest user of coroutine code in drain callbacks,
> it is preferable to have the complexity in the test case rather than the
> drain core, which is already complicated enough without this.
> 
> The behaviour for bdrv_drain_begin() is unchanged because we increase
> bs->in_flight and this is still polled. However, bdrv_drain_end()
> doesn't wait for the spawned coroutine to complete any more. This is
> fine, we don't rely on bdrv_drain_end() restarting all operations
> immediately before the next aio_poll().
> 
> Signed-off-by: Kevin Wolf<kwolf@redhat.com>

Reviewed-by: Vladimir Sementsov-Ogievskiy <vsementsov@yandex-team.ru>

-- 
Best regards,
Vladimir


