Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 43577581A1A
	for <lists+qemu-devel@lfdr.de>; Tue, 26 Jul 2022 21:09:12 +0200 (CEST)
Received: from localhost ([::1]:49674 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oGPva-0008UV-UH
	for lists+qemu-devel@lfdr.de; Tue, 26 Jul 2022 15:09:10 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:46560)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@yandex-team.ru>)
 id 1oGPtE-0006kp-WA; Tue, 26 Jul 2022 15:06:45 -0400
Received: from forwardcorp1j.mail.yandex.net ([5.45.199.163]:35662)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@yandex-team.ru>)
 id 1oGPtB-0000H6-42; Tue, 26 Jul 2022 15:06:43 -0400
Received: from iva8-3a65cceff156.qloud-c.yandex.net
 (iva8-3a65cceff156.qloud-c.yandex.net
 [IPv6:2a02:6b8:c0c:2d80:0:640:3a65:ccef])
 by forwardcorp1j.mail.yandex.net (Yandex) with ESMTP id 21F8B2E1A69;
 Tue, 26 Jul 2022 22:06:30 +0300 (MSK)
Received: from [172.31.44.48] (172.31.44.48-vpn.dhcp.yndx.net [172.31.44.48])
 by iva8-3a65cceff156.qloud-c.yandex.net (smtpcorp/Yandex) with
 ESMTPSA id 4XzUlrF1Km-6TOOpAxC; Tue, 26 Jul 2022 22:06:29 +0300
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
 (Client certificate not present)
X-Yandex-Fwd: 1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yandex-team.ru;
 s=default; 
 t=1658862389; bh=iChm0rCgzKnG64x7w2SIRLSG4m5Yraf99sPEljrAkkY=;
 h=From:In-Reply-To:Cc:Date:References:To:Subject:Message-ID;
 b=QiqLFOymhRLB8lqRaljoAeWsBm7B9+nnVCsWq7oOVdxdaxVOcknGSnWMrv9jBhdFt
 qmz9Xe5D2FboYlk+ZHOtX2EXmCHjrRiKVLyz2RpHyUCeDNWYG4T2LsIQxUFQPXBCyJ
 1cDvE2lJI2GX+90qFkSQkywJCX9trT85tFSLC0bI=
Authentication-Results: iva8-3a65cceff156.qloud-c.yandex.net;
 dkim=pass header.i=@yandex-team.ru
Message-ID: <5d8d63ac-f5bd-29fb-850b-a73cefdfa75a@yandex-team.ru>
Date: Tue, 26 Jul 2022 22:06:28 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.1
Subject: Re: [PATCH 0/2] block/parallels: Fix buffer-based write call
Content-Language: en-US
To: Hanna Reitz <hreitz@redhat.com>, qemu-block@nongnu.org
Cc: qemu-devel@nongnu.org, Stefan Hajnoczi <stefanha@redhat.com>,
 "Denis V . Lunev" <den@openvz.org>, Kevin Wolf <kwolf@redhat.com>
References: <20220714132801.72464-1-hreitz@redhat.com>
From: Vladimir Sementsov-Ogievskiy <vsementsov@yandex-team.ru>
In-Reply-To: <20220714132801.72464-1-hreitz@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=5.45.199.163;
 envelope-from=vsementsov@yandex-team.ru; helo=forwardcorp1j.mail.yandex.net
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 7/14/22 16:27, Hanna Reitz wrote:
> Hi,
> 
> While reviewing Stefan’s libblkio driver series, I’ve noticed that
> block/parallels.c contains a call to bdrv_co_pwritev() that doesn’t pass
> a QEMUIOVector object but a plain buffer instead.  That seems wrong and
> also pretty dangerous, so change it to a bdrv_co_pwrite() call (as I
> assume it should be), and add a regression test demonstrating the
> problem.
> 
> 
> Hanna Reitz (2):
>    block/parallels: Fix buffer-based write call
>    iotests/131: Add parallels regression test
> 
>   block/parallels.c          |  4 ++--
>   tests/qemu-iotests/131     | 35 ++++++++++++++++++++++++++++++++++-
>   tests/qemu-iotests/131.out | 13 +++++++++++++
>   3 files changed, 49 insertions(+), 3 deletions(-)
> 

Thanks, applied to my block branch.

-- 
Best regards,
Vladimir

