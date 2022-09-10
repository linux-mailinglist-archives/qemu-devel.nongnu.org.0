Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1D7C05B460E
	for <lists+qemu-devel@lfdr.de>; Sat, 10 Sep 2022 13:33:37 +0200 (CEST)
Received: from localhost ([::1]:57994 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oWyjw-00066P-8f
	for lists+qemu-devel@lfdr.de; Sat, 10 Sep 2022 07:33:36 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53294)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@yandex-team.ru>)
 id 1oWyfb-0003AU-Ri
 for qemu-devel@nongnu.org; Sat, 10 Sep 2022 07:29:07 -0400
Received: from forwardcorp1o.mail.yandex.net ([95.108.205.193]:33190)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@yandex-team.ru>)
 id 1oWyfa-0004pE-8g
 for qemu-devel@nongnu.org; Sat, 10 Sep 2022 07:29:07 -0400
Received: from vla1-81430ab5870b.qloud-c.yandex.net
 (vla1-81430ab5870b.qloud-c.yandex.net
 [IPv6:2a02:6b8:c0d:35a1:0:640:8143:ab5])
 by forwardcorp1o.mail.yandex.net (Yandex) with ESMTP id B65B72E0A2D;
 Sat, 10 Sep 2022 14:29:01 +0300 (MSK)
Received: from [IPV6:2a02:6b8:b081:1329::1:2d] (unknown
 [2a02:6b8:b081:1329::1:2d])
 by vla1-81430ab5870b.qloud-c.yandex.net (smtpcorp/Yandex) with ESMTPSA id
 WkMKyKzi6x-T0PaPL5I; Sat, 10 Sep 2022 14:29:01 +0300
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
 (Client certificate not present)
Precedence: bulk
X-Yandex-Fwd: 1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yandex-team.ru;
 s=default; 
 t=1662809341; bh=+IrADOAaP6OkASDSmMq4LD3PcuT5HNxAfLtAcf6JVKY=;
 h=From:In-Reply-To:Cc:Date:References:To:Subject:Message-ID;
 b=v0L56oQsnoXNcNfxBoYBTM3KTSQ9W8tIWno4r/Q0KOTkFhOxsWwyiWjO6kORhfPz3
 r92HG3WrGGfLvUXI448IrLO11bKUi80t9KCbMfro35puvx6p3g15dwHtFRbc6MqK3o
 dBuV4KPHBb5g6PxM0oEMU06VZza5KXq7P5PuDdMU=
Authentication-Results: vla1-81430ab5870b.qloud-c.yandex.net;
 dkim=pass header.i=@yandex-team.ru
Message-ID: <b9a7b9fb-9c30-4738-e4a0-cf2c5f0179ba@yandex-team.ru>
Date: Sat, 10 Sep 2022 14:29:00 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.1
Subject: Re: [PATCH 3/4] python/qmp: increase read buffer size
Content-Language: en-US
To: Maksim Davydov <davydov-max@yandex-team.ru>, qemu-devel@nongnu.org
Cc: yc-core@yandex-team.ru, pbonzini@redhat.com, berrange@redhat.com,
 eduardo@habkost.net, marcel.apfelbaum@gmail.com, f4bug@amsat.org,
 wangyanan55@huawei.com, armbru@redhat.com, alxndr@bu.edu, bsd@redhat.com,
 stefanha@redhat.com, thuth@redhat.com, darren.kenny@oracle.com,
 Qiuhao.Li@outlook.com, lvivier@redhat.com, jsnow@redhat.com,
 crosa@redhat.com, bleal@redhat.com
References: <20220908103650.9518-1-davydov-max@yandex-team.ru>
 <20220908103650.9518-4-davydov-max@yandex-team.ru>
From: Vladimir Sementsov-Ogievskiy <vsementsov@yandex-team.ru>
In-Reply-To: <20220908103650.9518-4-davydov-max@yandex-team.ru>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=95.108.205.193;
 envelope-from=vsementsov@yandex-team.ru; helo=forwardcorp1o.mail.yandex.net
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.214,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.29
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

On 9/8/22 13:36, Maksim Davydov wrote:
> After modification of "query-machines" command the buffer size should be
> more than 452kB to contain output with compat-props.
> 
> Signed-off-by: Maksim Davydov <davydov-max@yandex-team.ru>
> ---
>   python/qemu/qmp/qmp_client.py | 4 ++--
>   1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/python/qemu/qmp/qmp_client.py b/python/qemu/qmp/qmp_client.py
> index 5dcda04a75..659fe4d98c 100644
> --- a/python/qemu/qmp/qmp_client.py
> +++ b/python/qemu/qmp/qmp_client.py
> @@ -197,8 +197,8 @@ async def run(self, address='/tmp/qemu.socket'):
>       #: Logger object used for debugging messages.
>       logger = logging.getLogger(__name__)
>   
> -    # Read buffer limit; large enough to accept query-qmp-schema
> -    _limit = (256 * 1024)
> +    # Read buffer limit; large enough to accept query-machines
> +    _limit = (512 * 1024)
>   
>       # Type alias for pending execute() result items
>       _PendingT = Union[Message, ExecInterruptedError]


Reviewed-by: Vladimir Sementsov-Ogievskiy <vsementsov@yandex-team.ru>

This patch should better go before 02, to never break things in the history.

-- 
Best regards,
Vladimir

