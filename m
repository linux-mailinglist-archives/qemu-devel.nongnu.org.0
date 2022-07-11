Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 574595701A7
	for <lists+qemu-devel@lfdr.de>; Mon, 11 Jul 2022 14:07:50 +0200 (CEST)
Received: from localhost ([::1]:38260 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oAsCb-000652-8M
	for lists+qemu-devel@lfdr.de; Mon, 11 Jul 2022 08:07:49 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41770)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@yandex-team.ru>)
 id 1oAs9l-0001mi-Ro; Mon, 11 Jul 2022 08:04:53 -0400
Received: from forwardcorp1p.mail.yandex.net ([77.88.29.217]:37616)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@yandex-team.ru>)
 id 1oAs9h-0005r1-Pd; Mon, 11 Jul 2022 08:04:52 -0400
Received: from myt5-70c90f7d6d7d.qloud-c.yandex.net
 (myt5-70c90f7d6d7d.qloud-c.yandex.net
 [IPv6:2a02:6b8:c12:3e2c:0:640:70c9:f7d])
 by forwardcorp1p.mail.yandex.net (Yandex) with ESMTP id 329B12E124B;
 Mon, 11 Jul 2022 15:04:38 +0300 (MSK)
Received: from [10.211.6.101] (10.211.6.101-vpn.dhcp.yndx.net [10.211.6.101])
 by myt5-70c90f7d6d7d.qloud-c.yandex.net (smtpcorp/Yandex) with
 ESMTPSA id ZVBnXlIGAO-4aOK92lC; Mon, 11 Jul 2022 15:04:37 +0300
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
 (Client certificate not present)
X-Yandex-Fwd: 1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yandex-team.ru;
 s=default; 
 t=1657541077; bh=bHat12AXgF7rk64AwfmqKb1m5P5eg4r5nDm0kPIjuxY=;
 h=From:In-Reply-To:Cc:Date:References:To:Subject:Message-ID;
 b=Yf2TGWmd5s3BH9P5LP4DmVbUL1cSd2YLiIvYFNIXaUHQpGDPLwzy9E6rTBv5w1NqW
 hCY/qEYfWFM3jhDR0WhC7nIKBJDBHhd23h6+qnt2VKT18U6pXtaeTnnK4pBj3gZs1P
 J7hB5SzZPfG1T7kWHypWUxtl3pDzcSkutlfai5sI=
Authentication-Results: myt5-70c90f7d6d7d.qloud-c.yandex.net;
 dkim=pass header.i=@yandex-team.ru
Message-ID: <636b3296-72c8-a359-2dd3-973822640848@yandex-team.ru>
Date: Mon, 11 Jul 2022 15:04:36 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.1
Subject: Re: [PATCH v9 07/21] blockjob: introduce block_job _locked() APIs
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
 <20220706201533.289775-8-eesposit@redhat.com>
From: Vladimir Sementsov-Ogievskiy <vsementsov@yandex-team.ru>
In-Reply-To: <20220706201533.289775-8-eesposit@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=77.88.29.217;
 envelope-from=vsementsov@yandex-team.ru; helo=forwardcorp1p.mail.yandex.net
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
> Just as done with job.h, create _locked() functions in blockjob.h
> 
> These functions will be later useful when caller has already taken
> the lock. All blockjob _locked functions call job _locked functions.
> 
> Note: at this stage, job_{lock/unlock} and job lock guard macros
> are *nop*.
> 
> Signed-off-by: Emanuele Giuseppe Esposito <eesposit@redhat.com>

We not only create _locked() interfaces, but also make some functions correct relatively to job_mutex that was not correct pre-patch, for example:

block_job_iostatus_reset(): the function doesn't call any job_* APIs, but it access Job fields. After patch fields are accessed under mutex which is correct, and that's the significant change worth mentioning in commit message.

So, more correct is to say, that we make some functions of blockjob API correct relatively to job_mutex and Job fields.

With at least this clarified, I'm OK with the patch as is:
Reviewed-by: Vladimir Sementsov-Ogievskiy <vsementsov@yandex-team.ru>


What kept in mind after the patch:

1. Some functions still need an update, for example block_job_error_action, that access Job.user_pause without locking the job_mutex. Or, block_job_event_completed that accesses Job.ret..

2. What about BlockJob.nodes field? Shouldn't we protect it by the mutex?


-- 
Best regards,
Vladimir

