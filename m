Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 628885668DB
	for <lists+qemu-devel@lfdr.de>; Tue,  5 Jul 2022 13:06:05 +0200 (CEST)
Received: from localhost ([::1]:42294 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o8gNY-0002Dd-79
	for lists+qemu-devel@lfdr.de; Tue, 05 Jul 2022 07:06:04 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39564)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@yandex-team.ru>)
 id 1o8gDF-0000GW-RZ; Tue, 05 Jul 2022 06:55:25 -0400
Received: from forwardcorp1o.mail.yandex.net ([2a02:6b8:0:1a2d::193]:59720)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@yandex-team.ru>)
 id 1o8gD1-0008Hb-5Q; Tue, 05 Jul 2022 06:55:25 -0400
Received: from iva5-51baefb7689f.qloud-c.yandex.net
 (iva5-51baefb7689f.qloud-c.yandex.net
 [IPv6:2a02:6b8:c0c:69d:0:640:51ba:efb7])
 by forwardcorp1o.mail.yandex.net (Yandex) with ESMTP id CA03C2E124D;
 Tue,  5 Jul 2022 13:55:00 +0300 (MSK)
Received: from iva8-3a65cceff156.qloud-c.yandex.net
 (iva8-3a65cceff156.qloud-c.yandex.net [2a02:6b8:c0c:2d80:0:640:3a65:ccef])
 by iva5-51baefb7689f.qloud-c.yandex.net (mxbackcorp/Yandex) with ESMTP id
 fL61Ozygat-sxJGJnr3; Tue, 05 Jul 2022 13:55:00 +0300
X-Yandex-Fwd: 2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yandex-team.ru;
 s=default; 
 t=1657018500; bh=UucEofq0UIUr4GybE3UdVroRbcZjjguUO1VY9KDFuQI=;
 h=In-Reply-To:From:Cc:To:Subject:Message-ID:References:Date;
 b=YjiErs2XtjyGOSZJn8Lyjr0rkKiBA/arZRhr6JIQnD0ffmSCJBbh5pGjlaKnY+zk8
 l3Y13BMQBQ5hoMhpvVXsvztZbb4P+MvyGW4GHqQGiIwkrTCQcq2KavHRypu++GAMMU
 9Llx7ZS9QZUC57lZVKhR1CDC6ys/1C6u0BzQsf9s=
Authentication-Results: iva5-51baefb7689f.qloud-c.yandex.net;
 dkim=pass header.i=@yandex-team.ru
Received: from [10.211.91.215] (10.211.91.215-vpn.dhcp.yndx.net
 [10.211.91.215])
 by iva8-3a65cceff156.qloud-c.yandex.net (smtpcorp/Yandex) with ESMTPSA id
 7J2HzPYhFf-sxPqlPiu; Tue, 05 Jul 2022 13:54:59 +0300
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
 (Client certificate not present)
Message-ID: <7e988c67-a15f-cc2a-0370-c665971f19a3@yandex-team.ru>
Date: Tue, 5 Jul 2022 13:54:58 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.1
Subject: Re: [PATCH v8 06/20] job.h: define functions called without job lock
 held
Content-Language: en-US
To: Emanuele Giuseppe Esposito <eesposit@redhat.com>, qemu-block@nongnu.org
Cc: Kevin Wolf <kwolf@redhat.com>, Hanna Reitz <hreitz@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>, John Snow <jsnow@redhat.com>,
 Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>,
 Wen Congyang <wencongyang2@huawei.com>,
 Xie Changlong <xiechanglong.d@gmail.com>,
 Markus Armbruster <armbru@redhat.com>, Stefan Hajnoczi
 <stefanha@redhat.com>, Fam Zheng <fam@euphon.net>, qemu-devel@nongnu.org
References: <20220629141538.3400679-1-eesposit@redhat.com>
 <20220629141538.3400679-7-eesposit@redhat.com>
From: Vladimir Sementsov-Ogievskiy <vsementsov@yandex-team.ru>
In-Reply-To: <20220629141538.3400679-7-eesposit@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2a02:6b8:0:1a2d::193;
 envelope-from=vsementsov@yandex-team.ru; helo=forwardcorp1o.mail.yandex.net
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

To subject: hmm, the commit don't define any function..

-- 
Best regards,
Vladimir

