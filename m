Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 880D757B700
	for <lists+qemu-devel@lfdr.de>; Wed, 20 Jul 2022 15:08:17 +0200 (CEST)
Received: from localhost ([::1]:52298 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oE9R1-0000Jr-U6
	for lists+qemu-devel@lfdr.de; Wed, 20 Jul 2022 09:08:15 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59378)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@yandex-team.ru>)
 id 1oE9Pj-0006BX-5I; Wed, 20 Jul 2022 09:06:55 -0400
Received: from forwardcorp1p.mail.yandex.net
 ([2a02:6b8:0:1472:2741:0:8b6:217]:46548)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@yandex-team.ru>)
 id 1oE9Pf-0005yI-Aa; Wed, 20 Jul 2022 09:06:53 -0400
Received: from sas1-c73b4b4f4b95.qloud-c.yandex.net
 (sas1-c73b4b4f4b95.qloud-c.yandex.net
 [IPv6:2a02:6b8:c08:12a9:0:640:c73b:4b4f])
 by forwardcorp1p.mail.yandex.net (Yandex) with ESMTP id 8A9FC2E13D8;
 Wed, 20 Jul 2022 16:06:40 +0300 (MSK)
Received: from [IPV6:2a02:6b8:b081:b715::1:28] (unknown
 [2a02:6b8:b081:b715::1:28])
 by sas1-c73b4b4f4b95.qloud-c.yandex.net (smtpcorp/Yandex) with ESMTPSA id
 DWUSPGdYdH-6aOGu8Jn; Wed, 20 Jul 2022 13:06:39 +0000
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
 (Client certificate not present)
X-Yandex-Fwd: 1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yandex-team.ru;
 s=default; 
 t=1658322399; bh=L0/wLHX8TVuN/N4WgiC7eigo1Bq8XBOctvR18pgkSII=;
 h=From:In-Reply-To:Cc:Date:References:To:Subject:Message-ID;
 b=w+4kak3RUjEF3ekaDYejjL6dfwd98X+CUhx3FmBg9+dmySLLd5eO8inUdvbXE4x/0
 QVf3hN08++kzIauwpFx1T2/N2c35D/FCDINFfCGNSVBiy7wupmozyosu63tjO8JCJl
 RBHSt1MqnP8cVAq8PR8KSLjPBjl9CR3DVfPAALqA=
Authentication-Results: sas1-c73b4b4f4b95.qloud-c.yandex.net;
 dkim=pass header.i=@yandex-team.ru
Message-ID: <1a2e7a92-9943-01a0-168c-73928d7833e8@yandex-team.ru>
Date: Wed, 20 Jul 2022 16:06:36 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.1
Subject: Re: [PATCH v9 09/21] jobs: use job locks also in the unit tests
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
 <20220706201533.289775-10-eesposit@redhat.com>
 <b86ef36a-a82c-591e-54fe-481690a5987f@yandex-team.ru>
 <8726804c-5dbc-bc27-3922-a00ae676941d@redhat.com>
From: Vladimir Sementsov-Ogievskiy <vsementsov@yandex-team.ru>
In-Reply-To: <8726804c-5dbc-bc27-3922-a00ae676941d@redhat.com>
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

On 7/19/22 15:00, Emanuele Giuseppe Esposito wrote:
> 
> 
> Am 11/07/2022 um 15:08 schrieb Vladimir Sementsov-Ogievskiy:
>>
>> That made me ask:
>>
>> 1. Are all tests always run in main loop? If yes, why to protect status
>> reading in test_complete_in_standby() ?
>>
>> 2. Maybe, we don't need to protect anything here? Why to protect other
>> things if we run everything in main loop?
> 
> I think it's still good example and practice to protect a function if it
> needs to be protected and its name ends with _locked. It would just
> confuse the reader if we don't protect it.
> 

Agree. But still, I think we should be consistent in such decisions. If you don't want to protect job->status in tests, then you shouldn't protect it in test_complete_in_standby() as well, just to not confuse someone who read the code.


-- 
Best regards,
Vladimir

