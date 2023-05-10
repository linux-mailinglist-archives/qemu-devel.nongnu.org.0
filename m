Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B29696FE17B
	for <lists+qemu-devel@lfdr.de>; Wed, 10 May 2023 17:22:39 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pwldx-0002FB-Tg; Wed, 10 May 2023 11:22:17 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@yandex-team.ru>)
 id 1pwldu-0002DR-Pi; Wed, 10 May 2023 11:22:15 -0400
Received: from forwardcorp1c.mail.yandex.net ([178.154.239.200])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@yandex-team.ru>)
 id 1pwldq-0006NG-TR; Wed, 10 May 2023 11:22:14 -0400
Received: from mail-nwsmtp-smtp-corp-main-26.myt.yp-c.yandex.net
 (mail-nwsmtp-smtp-corp-main-26.myt.yp-c.yandex.net
 [IPv6:2a02:6b8:c12:4c15:0:640:e9f4:0])
 by forwardcorp1c.mail.yandex.net (Yandex) with ESMTP id 2815C5EC26;
 Wed, 10 May 2023 18:22:01 +0300 (MSK)
Received: from [IPV6:2a02:6b8:b081:2::1:11] (unknown [2a02:6b8:b081:2::1:11])
 by mail-nwsmtp-smtp-corp-main-26.myt.yp-c.yandex.net
 (smtpcorp/Yandex) with ESMTPSA id xLXQx20OfeA0-RFsXMz9W; 
 Wed, 10 May 2023 18:22:00 +0300
X-Yandex-Fwd: 1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yandex-team.ru;
 s=default; 
 t=1683732120; bh=nLpdtDk1s2pUc6VR1VkLxI0pKQyXHTDQqbGzlUV4pM0=;
 h=From:In-Reply-To:Cc:Date:References:To:Subject:Message-ID;
 b=1FfkfGoEQydvZw+QGqWcZmPQ3xzy+/Xh/+q6XxlDQ5vvsCfoziIsq5YjmvcFh1t2v
 FLdB5HriY3xJyEVsm+Vs5QElM0GZgboE8R5/uLupJyXzNw2ztOxtQbKPAWAqop7waK
 Aluqhwq4ymoH6RLgAlwrd/AZ3fQDDoP4ePedwpyQ=
Authentication-Results: mail-nwsmtp-smtp-corp-main-26.myt.yp-c.yandex.net;
 dkim=pass header.i=@yandex-team.ru
Message-ID: <a498899e-60d0-4969-85de-bbd74e04d454@yandex-team.ru>
Date: Wed, 10 May 2023 18:21:59 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.0
Subject: Re: [PATCH v9 0/6] block: refactor blockdev transactions
Content-Language: en-US
To: qemu-block@nongnu.org
Cc: qemu-devel@nongnu.org, kwolf@redhat.com, hreitz@redhat.com,
 den@openvz.org, alexander.ivanov@virtuozzo.com
References: <20230510150624.310640-1-vsementsov@yandex-team.ru>
From: Vladimir Sementsov-Ogievskiy <vsementsov@yandex-team.ru>
In-Reply-To: <20230510150624.310640-1-vsementsov@yandex-team.ru>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=178.154.239.200;
 envelope-from=vsementsov@yandex-team.ru; helo=forwardcorp1c.mail.yandex.net
X-Spam_score_int: -53
X-Spam_score: -5.4
X-Spam_bar: -----
X-Spam_report: (-5.4 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-3.251,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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

Interesting, I see two 5/6 letters, equal body, but a bit different headers (the second has empty "Sender")..

On 10.05.23 18:06, Vladimir Sementsov-Ogievskiy wrote:
> Hi all!
> 
> Let's refactor QMP transactions implementation into new (relatively)
> transaction API.
> 
> v9:
> 01: fix leaks
> 02-03: add r-b
> 04: fix leak, s/Transaction/transaction/
> 05: new, was part of 06
> 06: rework of bitmap-add action moved to 05
> 
> Vladimir Sementsov-Ogievskiy (6):
>    blockdev: refactor transaction to use Transaction API
>    blockdev: transactions: rename some things
>    blockdev: qmp_transaction: refactor loop to classic for
>    blockdev: transaction: refactor handling transaction properties
>    blockdev:  use state.bitmap in block-dirty-bitmap-add action

Probably, the problem starts here: I accidentally add extra whitespace.. And the second (copied) letter doesn't have this mistake. That's something about how mailing list works.

>    blockdev: qmp_transaction: drop extra generic layer
> 
>   blockdev.c | 606 ++++++++++++++++++++++-------------------------------
>   1 file changed, 249 insertions(+), 357 deletions(-)
> 



-- 
Best regards,
Vladimir


