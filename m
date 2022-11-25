Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 70941638D07
	for <lists+qemu-devel@lfdr.de>; Fri, 25 Nov 2022 16:07:05 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1oyaGr-0006ih-47; Fri, 25 Nov 2022 10:05:41 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@yandex-team.ru>)
 id 1oyaGn-0006hE-FP; Fri, 25 Nov 2022 10:05:37 -0500
Received: from forwardcorp1c.mail.yandex.net ([178.154.239.200])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@yandex-team.ru>)
 id 1oyaGj-0006GK-0M; Fri, 25 Nov 2022 10:05:37 -0500
Received: from myt6-23a5e62c0090.qloud-c.yandex.net
 (myt6-23a5e62c0090.qloud-c.yandex.net
 [IPv6:2a02:6b8:c12:1da3:0:640:23a5:e62c])
 by forwardcorp1c.mail.yandex.net (Yandex) with ESMTP id 9C94D5F079;
 Fri, 25 Nov 2022 18:05:20 +0300 (MSK)
Received: from [IPV6:2a02:6b8:b081:16::1:7] (unknown [2a02:6b8:b081:16::1:7])
 by myt6-23a5e62c0090.qloud-c.yandex.net (smtpcorp/Yandex) with
 ESMTPSA id J5Osw00NiW21-gBOtDnKJ; Fri, 25 Nov 2022 18:05:20 +0300
X-Yandex-Fwd: 1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yandex-team.ru;
 s=default; 
 t=1669388720; bh=IPMWN+Y+JjRyfDNXFKt9D4w/90hpEkTZuaHg/WIPGZ0=;
 h=From:In-Reply-To:Cc:Date:References:To:Subject:Message-ID;
 b=ds0h+6bJb9db2GrQBpYAQZR8uEPMsy5oRo9O8h9s+j9tpvejBdITa/YaffGoGJ+KL
 6pUEYg1274F9W/KJDFQEMl9LPdDQRCwN190JCJjLWyH/ah/B9HarE8F41Xrp6Bkd52
 F1ziSo3qJDM10bKpzK3Shp/I8/1Bn4vggMu1aXR4=
Authentication-Results: myt6-23a5e62c0090.qloud-c.yandex.net;
 dkim=pass header.i=@yandex-team.ru
Message-ID: <4a74f24b-a022-a506-3638-d72a7b6076db@yandex-team.ru>
Date: Fri, 25 Nov 2022 18:05:19 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.2.2
Subject: Re: [PATCH v2 12/15] block: Remove ignore_bds_parents parameter from
 drain_begin/end.
Content-Language: en-US
To: Kevin Wolf <kwolf@redhat.com>, qemu-block@nongnu.org
Cc: eesposit@redhat.com, stefanha@redhat.com, hreitz@redhat.com,
 pbonzini@redhat.com, qemu-devel@nongnu.org
References: <20221118174110.55183-1-kwolf@redhat.com>
 <20221118174110.55183-13-kwolf@redhat.com>
From: Vladimir Sementsov-Ogievskiy <vsementsov@yandex-team.ru>
In-Reply-To: <20221118174110.55183-13-kwolf@redhat.com>
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
> ignore_bds_parents is now ignored during drain_begin and drain_end, so
> we can just remove it there. It is still a valid optimisation for
> drain_all in bdrv_drained_poll(), so leave it around there.
> 
> Signed-off-by: Kevin Wolf<kwolf@redhat.com>


Reviewed-by: Vladimir Sementsov-Ogievskiy <vsementsov@yandex-team.ru>

-- 
Best regards,
Vladimir


