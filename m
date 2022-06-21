Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 65776553505
	for <lists+qemu-devel@lfdr.de>; Tue, 21 Jun 2022 16:54:48 +0200 (CEST)
Received: from localhost ([::1]:40256 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o3fHB-0005qM-LR
	for lists+qemu-devel@lfdr.de; Tue, 21 Jun 2022 10:54:47 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50472)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@yandex-team.ru>)
 id 1o3f4N-0003D3-0N; Tue, 21 Jun 2022 10:41:31 -0400
Received: from forwardcorp1p.mail.yandex.net ([77.88.29.217]:56218)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@yandex-team.ru>)
 id 1o3f42-0006QJ-N1; Tue, 21 Jun 2022 10:41:26 -0400
Received: from sas2-6a1db1376cb6.qloud-c.yandex.net
 (sas2-6a1db1376cb6.qloud-c.yandex.net
 [IPv6:2a02:6b8:c08:bb0f:0:640:6a1d:b137])
 by forwardcorp1p.mail.yandex.net (Yandex) with ESMTP id 9BA282E1386;
 Tue, 21 Jun 2022 17:40:52 +0300 (MSK)
Received: from sas1-c73b4b4f4b95.qloud-c.yandex.net
 (sas1-c73b4b4f4b95.qloud-c.yandex.net [2a02:6b8:c08:12a9:0:640:c73b:4b4f])
 by sas2-6a1db1376cb6.qloud-c.yandex.net (mxbackcorp/Yandex) with ESMTP id
 dSAOF6AADp-elJemmDs; Tue, 21 Jun 2022 17:40:52 +0300
X-Yandex-Fwd: 2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yandex-team.ru;
 s=default; 
 t=1655822452; bh=u3oJxhZsEUUguTOlOgJA4tMkJCLl2Q4ixmsNRsk/ssA=;
 h=In-Reply-To:From:Cc:To:Subject:Message-ID:References:Date;
 b=LqfQ55EJgv3YL47oUlcYdQoek+mYl9zUFIFl3Sh3qGyWgGGxlFwbjSfi6qrfegVdT
 CGZEjxXkKsHIs0rG/LuPpOQrS3pK8cwmjBtoz7oYjsUVOcTmiEtmDblDftvojDjBf1
 SjiJf0+NugqUPfGEXOx42CKbDVqJttU//EcWUHSk=
Authentication-Results: sas2-6a1db1376cb6.qloud-c.yandex.net;
 dkim=pass header.i=@yandex-team.ru
Received: from [IPV6:2a02:6b8:b081:23::1:8] (unknown [2a02:6b8:b081:23::1:8])
 by sas1-c73b4b4f4b95.qloud-c.yandex.net (smtpcorp/Yandex) with
 ESMTPSA id oY9TONWULA-elNK1bW5; Tue, 21 Jun 2022 17:40:47 +0300
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
 (Client certificate not present)
Message-ID: <eb88b86e-f455-5f28-11f5-6eecdda4c784@yandex-team.ru>
Date: Tue, 21 Jun 2022 17:40:46 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.1
Subject: Re: [PATCH v7 04/18] aio-wait.h: introduce AIO_WAIT_WHILE_UNLOCKED
Content-Language: en-US
To: Emanuele Giuseppe Esposito <eesposit@redhat.com>, qemu-block@nongnu.org
Cc: Kevin Wolf <kwolf@redhat.com>, Hanna Reitz <hreitz@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>, John Snow <jsnow@redhat.com>,
 Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>,
 Wen Congyang <wencongyang2@huawei.com>,
 Xie Changlong <xiechanglong.d@gmail.com>,
 Markus Armbruster <armbru@redhat.com>, Stefan Hajnoczi
 <stefanha@redhat.com>, Fam Zheng <fam@euphon.net>, qemu-devel@nongnu.org
References: <20220616131835.2004262-1-eesposit@redhat.com>
 <20220616131835.2004262-5-eesposit@redhat.com>
From: Vladimir Sementsov-Ogievskiy <vsementsov@yandex-team.ru>
In-Reply-To: <20220616131835.2004262-5-eesposit@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=77.88.29.217;
 envelope-from=vsementsov@yandex-team.ru; helo=forwardcorp1p.mail.yandex.net
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01,
 T_SPF_HELO_TEMPERROR=0.01 autolearn=ham autolearn_force=no
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

On 6/16/22 16:18, Emanuele Giuseppe Esposito wrote:
> Same as AIO_WAIT_WHILE macro, but if we are in the Main loop
> do not release and then acquire ctx_ 's aiocontext.
> 
> Once all Aiocontext locks go away, this macro will replace
> AIO_WAIT_WHILE.
> 
> Reviewed-by: Stefan Hajnoczi<stefanha@redhat.com>
> Signed-off-by: Emanuele Giuseppe Esposito<eesposit@redhat.com>

A bit strange that you put r-b marks above your s-o-b.

Usually, marks goes in historical order:
1. your s-o-b
2. reviewers r-b marks
3. maintainer's s-o-b mark


Reviewed-by: Vladimir Sementsov-Ogievskiy <vsementsov@yandex-team.ru>

-- 
Best regards,
Vladimir

