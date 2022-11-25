Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A66DE638D59
	for <lists+qemu-devel@lfdr.de>; Fri, 25 Nov 2022 16:15:37 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1oyaOs-000296-6T; Fri, 25 Nov 2022 10:13:58 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@yandex-team.ru>)
 id 1oyaOp-00028c-9h; Fri, 25 Nov 2022 10:13:55 -0500
Received: from forwardcorp1c.mail.yandex.net ([178.154.239.200])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@yandex-team.ru>)
 id 1oyaOm-000169-Ie; Fri, 25 Nov 2022 10:13:55 -0500
Received: from iva8-3a65cceff156.qloud-c.yandex.net
 (iva8-3a65cceff156.qloud-c.yandex.net
 [IPv6:2a02:6b8:c0c:2d80:0:640:3a65:ccef])
 by forwardcorp1c.mail.yandex.net (Yandex) with ESMTP id 8052F5F22B;
 Fri, 25 Nov 2022 18:13:29 +0300 (MSK)
Received: from [IPV6:2a02:6b8:b081:16::1:7] (unknown [2a02:6b8:b081:16::1:7])
 by iva8-3a65cceff156.qloud-c.yandex.net (smtpcorp/Yandex) with
 ESMTPSA id SDOv310OaGk1-0Ekzucqv; Fri, 25 Nov 2022 18:13:28 +0300
X-Yandex-Fwd: 1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yandex-team.ru;
 s=default; 
 t=1669389208; bh=mmqWRYGYw73/59mkTK2eOs5usb4fcsUSqc+6hXVLO+8=;
 h=From:In-Reply-To:Cc:Date:References:To:Subject:Message-ID;
 b=gq/8XRBgf9b/WCzaTTObhSsUS/0u2S44kfLPG2HSZu7q4RmdOVfID7CenyPDBlmW3
 h/wJvFcpwZXosgAy0BWkBtqyuG7mcGUiudKdquAhiCyKx7/AWvc17OzPiwdQ4TiFgT
 9Fgy7H0+Twx79PmQhzw793y4ba1jt5D00wJ+jQ4Q=
Authentication-Results: iva8-3a65cceff156.qloud-c.yandex.net;
 dkim=pass header.i=@yandex-team.ru
Message-ID: <d157eaa8-263c-0472-6a77-7e153123f79b@yandex-team.ru>
Date: Fri, 25 Nov 2022 18:13:28 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.2.2
Subject: Re: [PATCH v2 13/15] block: Drop out of coroutine in
 bdrv_do_drained_begin_quiesce()
Content-Language: en-US
To: Kevin Wolf <kwolf@redhat.com>, qemu-block@nongnu.org
Cc: eesposit@redhat.com, stefanha@redhat.com, hreitz@redhat.com,
 pbonzini@redhat.com, qemu-devel@nongnu.org
References: <20221118174110.55183-1-kwolf@redhat.com>
 <20221118174110.55183-14-kwolf@redhat.com>
From: Vladimir Sementsov-Ogievskiy <vsementsov@yandex-team.ru>
In-Reply-To: <20221118174110.55183-14-kwolf@redhat.com>
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

On 11/18/22 20:41, Kevin Wolf wrote:
> The next patch adds a parent drain to bdrv_attach_child_common(), which
> shouldn't be, but is currently called from coroutines in some cases (e.g.
> .bdrv_co_create implementations generally open new nodes). Therefore,
> the assertion that we're not in a coroutine doesn't hold true any more.
> 
> We could just remove the assertion because there is nothing in the
> function that should be in conflict with running in a coroutine, but
> just to be on the safe side, we can reverse the caller relationship
> between bdrv_do_drained_begin() and bdrv_do_drained_begin_quiesce() so
> that the latter also just drops out of coroutine context and we can
> still be certain in the future that any drain code doesn't run in
> coroutines.
> 
> As a nice side effect, the structure of bdrv_do_drained_begin() is now
> symmetrical with bdrv_do_drained_end().
> 
> Signed-off-by: Kevin Wolf<kwolf@redhat.com>

Reviewed-by: Vladimir Sementsov-Ogievskiy <vsementsov@yandex-team.ru>

-- 
Best regards,
Vladimir


