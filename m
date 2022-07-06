Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BE13E568512
	for <lists+qemu-devel@lfdr.de>; Wed,  6 Jul 2022 12:18:38 +0200 (CEST)
Received: from localhost ([::1]:59766 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o927B-0005ZR-SX
	for lists+qemu-devel@lfdr.de; Wed, 06 Jul 2022 06:18:37 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42704)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@yandex-team.ru>)
 id 1o91gk-0001EV-Iy; Wed, 06 Jul 2022 05:51:20 -0400
Received: from forwardcorp1o.mail.yandex.net ([95.108.205.193]:48250)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@yandex-team.ru>)
 id 1o91ge-0003Sg-F6; Wed, 06 Jul 2022 05:51:13 -0400
Received: from myt5-70c90f7d6d7d.qloud-c.yandex.net
 (myt5-70c90f7d6d7d.qloud-c.yandex.net
 [IPv6:2a02:6b8:c12:3e2c:0:640:70c9:f7d])
 by forwardcorp1o.mail.yandex.net (Yandex) with ESMTP id 0A54F2E12A7;
 Wed,  6 Jul 2022 12:51:04 +0300 (MSK)
Received: from [IPV6:2a02:6b8:b081:6422::1:33] (unknown
 [2a02:6b8:b081:6422::1:33])
 by myt5-70c90f7d6d7d.qloud-c.yandex.net (smtpcorp/Yandex) with ESMTPSA id
 pVbOO3MMs8-p2OeOt1e; Wed, 06 Jul 2022 12:51:03 +0300
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
 (Client certificate not present)
X-Yandex-Fwd: 1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yandex-team.ru;
 s=default; 
 t=1657101063; bh=4oblJjlSgxcGSYihqplPg5F/kGLMxClCf4LZADdyTNw=;
 h=From:In-Reply-To:Cc:Date:References:To:Subject:Message-ID;
 b=YU2s/sPajRbv+22IuRWQ0cDlerwVXaVla0S02rztRzSEmVJVQ3bl7zZ99fb00mS/E
 ObTsMgVYhvwt30obgH+h3JdnWiPsetsdODnj3Tl8kAXFbeeDqPamygM4tV5M/45x+5
 3KlRWolh7nhQfw7XJucaF0lQaN1r7KorlyMJBBss=
Authentication-Results: myt5-70c90f7d6d7d.qloud-c.yandex.net;
 dkim=pass header.i=@yandex-team.ru
Message-ID: <d1787261-c23c-a6b2-23cb-2406f19ddbd7@yandex-team.ru>
Date: Wed, 6 Jul 2022 12:51:01 +0300
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
 <7e988c67-a15f-cc2a-0370-c665971f19a3@yandex-team.ru>
 <bc1e575d-08ae-6ea3-e51f-e075812d00f0@redhat.com>
From: Vladimir Sementsov-Ogievskiy <vsementsov@yandex-team.ru>
In-Reply-To: <bc1e575d-08ae-6ea3-e51f-e075812d00f0@redhat.com>
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

On 7/6/22 11:23, Emanuele Giuseppe Esposito wrote:
> 
> 
> Am 05/07/2022 um 12:54 schrieb Vladimir Sementsov-Ogievskiy:
>> To subject: hmm, the commit don't define any function..
>>
> mark functions called without job lock held?
> 

Yes, that's better)

-- 
Best regards,
Vladimir

