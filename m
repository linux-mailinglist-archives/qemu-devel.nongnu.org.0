Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BA166570413
	for <lists+qemu-devel@lfdr.de>; Mon, 11 Jul 2022 15:19:17 +0200 (CEST)
Received: from localhost ([::1]:55360 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oAtJk-00029J-7H
	for lists+qemu-devel@lfdr.de; Mon, 11 Jul 2022 09:19:16 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57632)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@yandex-team.ru>)
 id 1oAtG5-0007nw-S6; Mon, 11 Jul 2022 09:15:33 -0400
Received: from forwardcorp1o.mail.yandex.net ([95.108.205.193]:34662)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@yandex-team.ru>)
 id 1oAtFt-0003J5-DT; Mon, 11 Jul 2022 09:15:19 -0400
Received: from myt6-81d8ab6a9f9d.qloud-c.yandex.net
 (myt6-81d8ab6a9f9d.qloud-c.yandex.net
 [IPv6:2a02:6b8:c12:520a:0:640:81d8:ab6a])
 by forwardcorp1o.mail.yandex.net (Yandex) with ESMTP id 910542E0F8F;
 Mon, 11 Jul 2022 16:15:06 +0300 (MSK)
Received: from [10.211.6.101] (10.211.6.101-vpn.dhcp.yndx.net [10.211.6.101])
 by myt6-81d8ab6a9f9d.qloud-c.yandex.net (smtpcorp/Yandex) with
 ESMTPSA id vT0W4XS7we-F4OGAk4V; Mon, 11 Jul 2022 16:15:05 +0300
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
 (Client certificate not present)
X-Yandex-Fwd: 1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yandex-team.ru;
 s=default; 
 t=1657545305; bh=or8jVByBD1t/2sqbBdCQnP3srjuZz1xmjhNyRmlF8Bo=;
 h=From:In-Reply-To:Cc:Date:References:To:Subject:Message-ID;
 b=woBareYzrA3Pc3scJE5xTVMO115RGoAkUFiZi3SYloCbr8WSHb3rlnmUPjvMGf9IE
 dBiB0NRRH3MiVvL/xKhpceYGc3oc2NvI9OjAOvYqynLZE2QF7DRf9qhE65gbFHXwtn
 5VEBXk8bU0wPlt/ABaeRInX2aVbbI+X5teAbySSQ=
Authentication-Results: myt6-81d8ab6a9f9d.qloud-c.yandex.net;
 dkim=pass header.i=@yandex-team.ru
Message-ID: <c8b9b914-4aaf-2ac9-6be6-dba611768695@yandex-team.ru>
Date: Mon, 11 Jul 2022 16:15:04 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.1
Subject: Re: [PATCH v9 10/21] block/mirror.c: use of job helpers in drivers to
 avoid TOC/TOU
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
 <20220706201533.289775-11-eesposit@redhat.com>
From: Vladimir Sementsov-Ogievskiy <vsementsov@yandex-team.ru>
In-Reply-To: <20220706201533.289775-11-eesposit@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=95.108.205.193;
 envelope-from=vsementsov@yandex-team.ru; helo=forwardcorp1o.mail.yandex.net
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

On 7/6/22 23:15, Emanuele Giuseppe Esposito wrote:
> Once job lock is used and aiocontext is removed, mirror has
> to perform job operations under the same critical section,
> using the helpers prepared in previous commit.
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

