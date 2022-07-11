Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0B7B25701EC
	for <lists+qemu-devel@lfdr.de>; Mon, 11 Jul 2022 14:22:04 +0200 (CEST)
Received: from localhost ([::1]:43006 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oAsQM-0001uv-Ag
	for lists+qemu-devel@lfdr.de; Mon, 11 Jul 2022 08:22:02 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44634)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@yandex-team.ru>)
 id 1oAsP4-0000N7-4N; Mon, 11 Jul 2022 08:20:42 -0400
Received: from forwardcorp1p.mail.yandex.net
 ([2a02:6b8:0:1472:2741:0:8b6:217]:56590)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@yandex-team.ru>)
 id 1oAsP0-0000lK-NJ; Mon, 11 Jul 2022 08:20:40 -0400
Received: from myt5-70c90f7d6d7d.qloud-c.yandex.net
 (myt5-70c90f7d6d7d.qloud-c.yandex.net
 [IPv6:2a02:6b8:c12:3e2c:0:640:70c9:f7d])
 by forwardcorp1p.mail.yandex.net (Yandex) with ESMTP id 0C3A82E124D;
 Mon, 11 Jul 2022 15:20:26 +0300 (MSK)
Received: from [10.211.6.101] (10.211.6.101-vpn.dhcp.yndx.net [10.211.6.101])
 by myt5-70c90f7d6d7d.qloud-c.yandex.net (smtpcorp/Yandex) with
 ESMTPSA id wdKAuneg6s-KNOie6lo; Mon, 11 Jul 2022 15:20:25 +0300
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
 (Client certificate not present)
X-Yandex-Fwd: 1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yandex-team.ru;
 s=default; 
 t=1657542025; bh=K9XAOGmqCYS27ANsaq+t9mNFdyfHrPMlpbPzfVqsbRw=;
 h=From:In-Reply-To:Cc:Date:References:To:Subject:Message-ID;
 b=mGD/ImbIrtYIahDbL3UMa0LWmwMxYMWBEFPqRSUGrhFqCNZxM4X/RdwIsqAFBP1EI
 arK/h+mYe6swSTXzABqmMe3/gMoaB64epm9ckjWNsyXfVG0AWHmQh8BuJgC3jh3iZL
 iYBi2B6bKL7yuCX6prpokn2WrrJmdFNytAIJ/B00=
Authentication-Results: myt5-70c90f7d6d7d.qloud-c.yandex.net;
 dkim=pass header.i=@yandex-team.ru
Message-ID: <a314643b-3bee-3bd7-f825-79762d5c15a6@yandex-team.ru>
Date: Mon, 11 Jul 2022 15:20:23 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.1
Subject: Re: [PATCH v9 08/21] jobs: add job lock in find_* functions
Content-Language: en-US
To: Emanuele Giuseppe Esposito <eesposit@redhat.com>, qemu-block@nongnu.org
Cc: Kevin Wolf <kwolf@redhat.com>, Hanna Reitz <hreitz@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>, John Snow <jsnow@redhat.com>,
 Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>,
 Wen Congyang <wencongyang2@huawei.com>,
 Xie Changlong <xiechanglong.d@gmail.com>,
 Markus Armbruster <armbru@redhat.com>, Stefan Hajnoczi
 <stefanha@redhat.com>, Fam Zheng <fam@euphon.net>, qemu-devel@nongnu.org
References: <20220706201533.289775-1-eesposit@redhat.com>
 <20220706201533.289775-9-eesposit@redhat.com>
From: Vladimir Sementsov-Ogievskiy <vsementsov@yandex-team.ru>
In-Reply-To: <20220706201533.289775-9-eesposit@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2a02:6b8:0:1472:2741:0:8b6:217;
 envelope-from=vsementsov@yandex-team.ru; helo=forwardcorp1p.mail.yandex.net
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 7/6/22 23:15, Emanuele Giuseppe Esposito wrote:
> Both blockdev.c and job-qmp.c have TOC/TOU conditions, because
> they first search for the job and then perform an action on it.
> Therefore, we need to do the search + action under the same
> job mutex critical section.
> 
> Note: at this stage, job_{lock/unlock} and job lock guard macros
> are*nop*.
> 
> Signed-off-by: Emanuele Giuseppe Esposito<eesposit@redhat.com>
> Reviewed-by: Stefan Hajnoczi<stefanha@redhat.com>

Reviewed-by: Vladimir Sementsov-Ogievskiy <vsementsov@yandex-team.ru>

-- 
Best regards,
Vladimir

