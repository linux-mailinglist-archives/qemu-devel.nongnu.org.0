Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 96EA555E5AD
	for <lists+qemu-devel@lfdr.de>; Tue, 28 Jun 2022 17:27:53 +0200 (CEST)
Received: from localhost ([::1]:38422 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o6D84-0002a7-N6
	for lists+qemu-devel@lfdr.de; Tue, 28 Jun 2022 11:27:52 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54118)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@yandex-team.ru>)
 id 1o6D6z-0001kp-CO; Tue, 28 Jun 2022 11:26:45 -0400
Received: from forwardcorp1o.mail.yandex.net ([2a02:6b8:0:1a2d::193]:43758)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@yandex-team.ru>)
 id 1o6D6x-0006aU-HM; Tue, 28 Jun 2022 11:26:45 -0400
Received: from vla3-850de775f4df.qloud-c.yandex.net
 (vla3-850de775f4df.qloud-c.yandex.net
 [IPv6:2a02:6b8:c15:341d:0:640:850d:e775])
 by forwardcorp1o.mail.yandex.net (Yandex) with ESMTP id 191032E0B0B;
 Tue, 28 Jun 2022 18:26:34 +0300 (MSK)
Received: from vla5-d6d5ce7a4718.qloud-c.yandex.net
 (vla5-d6d5ce7a4718.qloud-c.yandex.net [2a02:6b8:c18:341e:0:640:d6d5:ce7a])
 by vla3-850de775f4df.qloud-c.yandex.net (mxbackcorp/Yandex) with ESMTP id
 68lkrjjwjN-QXKKt7QP; Tue, 28 Jun 2022 18:26:34 +0300
X-Yandex-Fwd: 2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yandex-team.ru;
 s=default; 
 t=1656429994; bh=OrDQnJmHQZwSnolwxrGshQe6LDoGp64himGp9qzgXgo=;
 h=In-Reply-To:To:From:Subject:Cc:Message-ID:References:Date;
 b=yjQW+7uOiw/5x3Mn/HSZg0afjCZEu4bkGSCH5R0SEfQ+S5Qx1JCyjrVGLCk0aWeCK
 5c94pODDBj5ZTVfetEeHV++z7ePOotLOt+DQN9CLyObNA4edOzvp1o1zY6sP0m0N/I
 TuRNrg2I9R1L5xdT9skeGEumtuE0/w5zWzfEXsO0=
Authentication-Results: vla3-850de775f4df.qloud-c.yandex.net;
 dkim=pass header.i=@yandex-team.ru
Received: from [IPV6:2a02:6b8:b081:b686::1:1f] (unknown
 [2a02:6b8:b081:b686::1:1f])
 by vla5-d6d5ce7a4718.qloud-c.yandex.net (smtpcorp/Yandex) with ESMTPSA id
 f4O399mkZH-QWM4SxxP; Tue, 28 Jun 2022 18:26:33 +0300
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
 (Client certificate not present)
Message-ID: <97ebf37c-1e86-7627-18de-d5d740dd0a6f@yandex-team.ru>
Date: Tue, 28 Jun 2022 18:26:32 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.1
Subject: Re: [PATCH v7 10/18] jobs: rename static functions called with
 job_mutex held
Content-Language: en-US
From: Vladimir Sementsov-Ogievskiy <vsementsov@yandex-team.ru>
To: Emanuele Giuseppe Esposito <eesposit@redhat.com>, qemu-block@nongnu.org,
 Kevin Wolf <kwolf@redhat.com>
Cc: Hanna Reitz <hreitz@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 John Snow <jsnow@redhat.com>,
 Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>,
 Wen Congyang <wencongyang2@huawei.com>,
 Xie Changlong <xiechanglong.d@gmail.com>,
 Markus Armbruster <armbru@redhat.com>, Stefan Hajnoczi
 <stefanha@redhat.com>, Fam Zheng <fam@euphon.net>, qemu-devel@nongnu.org
References: <20220616131835.2004262-1-eesposit@redhat.com>
 <20220616131835.2004262-11-eesposit@redhat.com>
 <c0401616-f246-ce1d-2a0f-b7e23dd55ab8@yandex-team.ru>
 <0aaa344b-aecb-13de-f82f-cad27a768ba9@redhat.com>
 <c234668d-0156-548b-e1e8-d1fda1b85ad7@yandex-team.ru>
 <8248df6b-3b48-6e09-5a5e-021cf65041dd@redhat.com>
 <98558a3e-3bd6-40b0-07da-1d022dfb0c0c@yandex-team.ru>
 <458dfa2c-4161-394c-95a0-d9e06757add5@redhat.com>
 <bdfafb6d-baaf-55ac-c323-dd2cbfb02d11@yandex-team.ru>
In-Reply-To: <bdfafb6d-baaf-55ac-c323-dd2cbfb02d11@yandex-team.ru>
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

On 6/28/22 18:22, Vladimir Sementsov-Ogievskiy wrote:
> On 6/28/22 16:04, Emanuele Giuseppe Esposito wrote:
>>>> Ok so far I did the following:
>>>>
>>>> - duplicated each public function as static {function}_locked()
>>> They shouldn't be duplicates: function without _locked suffix should
>>> take the mutex.
>> By "duplicate" I mean same function name, with just _locked suffix.
>> Maybe a better definition?
>>
>> Almost done preparing the patches!
> 
> Why not just add _locked version and rework the version without suffix to call _locked under mutex one in one patch, to just keep it all meaningful?
> 

I mean, instead of:

patch 1: add a _locked() duplicate

   At this point we have a duplicated function that's just bad practice.

patch 2: remake version without prefix to call _locked() under mutex
  
   Now everything is correct. But we have to track the moment when something strange becomes something correct.


do just

patch 1: rename function to _locked() and add a wrapper without suffix, that calls _locked() under mutex



-- 
Best regards,
Vladimir

