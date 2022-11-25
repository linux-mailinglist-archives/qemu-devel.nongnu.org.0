Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C9A3C6390E6
	for <lists+qemu-devel@lfdr.de>; Fri, 25 Nov 2022 21:57:11 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1oyfkS-0002bL-PW; Fri, 25 Nov 2022 15:56:36 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@yandex-team.ru>)
 id 1oyfkF-0002T7-Sr; Fri, 25 Nov 2022 15:56:26 -0500
Received: from forwardcorp1b.mail.yandex.net ([178.154.239.136])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@yandex-team.ru>)
 id 1oyfkD-0008HQ-4q; Fri, 25 Nov 2022 15:56:22 -0500
Received: from myt5-70c90f7d6d7d.qloud-c.yandex.net
 (myt5-70c90f7d6d7d.qloud-c.yandex.net
 [IPv6:2a02:6b8:c12:3e2c:0:640:70c9:f7d])
 by forwardcorp1b.mail.yandex.net (Yandex) with ESMTP id 269AA5FD21;
 Fri, 25 Nov 2022 23:56:05 +0300 (MSK)
Received: from [IPV6:2a02:6b8:b081:16::1:7] (unknown [2a02:6b8:b081:16::1:7])
 by myt5-70c90f7d6d7d.qloud-c.yandex.net (smtpcorp/Yandex) with
 ESMTPSA id 3uTQg20NWCg1-SpCPKaei; Fri, 25 Nov 2022 23:56:04 +0300
X-Yandex-Fwd: 1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yandex-team.ru;
 s=default; 
 t=1669409764; bh=+onFFm1QKlhkYtCo2sYxzjSXkje75nMEnCu1ws1m/k4=;
 h=From:In-Reply-To:Cc:Date:References:To:Subject:Message-ID;
 b=tozOsPU/hcpvie36t3x7ilIshT3px8HXqNvOi2CXrMke7pOqW/VrgUGXX5keYigUc
 FgHEx320LNpvSyVMmaETpMHH1euFdNLUNG5+OCqeGa/TounAZu0DyWkvG0JzLpvNF1
 g6e5P6SnV3e0Zciozh56ao+Ru4Bo/lhRjyi9U0N4=
Authentication-Results: myt5-70c90f7d6d7d.qloud-c.yandex.net;
 dkim=pass header.i=@yandex-team.ru
Message-ID: <d39b3871-5b49-4e31-368b-1c6da1cb8a84@yandex-team.ru>
Date: Fri, 25 Nov 2022 23:56:03 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.2.2
Subject: Re: [PATCH v6 13/14] block: convert bdrv_create to co_wrapper
Content-Language: en-US
To: Emanuele Giuseppe Esposito <eesposit@redhat.com>, qemu-block@nongnu.org
Cc: Kevin Wolf <kwolf@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Hanna Reitz <hreitz@redhat.com>, John Snow <jsnow@redhat.com>,
 Eric Blake <eblake@redhat.com>, Fam Zheng <fam@euphon.net>,
 Stefan Hajnoczi <stefanha@redhat.com>, "Denis V. Lunev" <den@openvz.org>,
 Stefan Weil <sw@weilnetz.de>, Jeff Cody <codyprime@gmail.com>,
 Cleber Rosa <crosa@redhat.com>, qemu-devel@nongnu.org
References: <20221125133518.418328-1-eesposit@redhat.com>
 <20221125133518.418328-14-eesposit@redhat.com>
From: Vladimir Sementsov-Ogievskiy <vsementsov@yandex-team.ru>
In-Reply-To: <20221125133518.418328-14-eesposit@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=178.154.239.136;
 envelope-from=vsementsov@yandex-team.ru; helo=forwardcorp1b.mail.yandex.net
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

On 11/25/22 16:35, Emanuele Giuseppe Esposito wrote:
> This function is never called in coroutine context, therefore
> instead of manually creating a new coroutine, delegate it to the
> block-coroutine-wrapper script, defining it as co_wrapper.
> 
> Signed-off-by: Emanuele Giuseppe Esposito<eesposit@redhat.com>
> Reviewed-by: Kevin Wolf<kwolf@redhat.com>


Reviewed-by: Vladimir Sementsov-Ogievskiy <vsementsov@yandex-team.ru>

(if you merge 07 here, keep my r-b)

-- 
Best regards,
Vladimir


