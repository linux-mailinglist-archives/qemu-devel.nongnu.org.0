Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CB85458153B
	for <lists+qemu-devel@lfdr.de>; Tue, 26 Jul 2022 16:28:47 +0200 (CEST)
Received: from localhost ([::1]:58224 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oGLYE-0004yy-F5
	for lists+qemu-devel@lfdr.de; Tue, 26 Jul 2022 10:28:46 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33816)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@yandex-team.ru>)
 id 1oGLUl-0001nj-FD; Tue, 26 Jul 2022 10:25:18 -0400
Received: from forwardcorp1o.mail.yandex.net ([2a02:6b8:0:1a2d::193]:41324)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@yandex-team.ru>)
 id 1oGLUg-0004Ob-RU; Tue, 26 Jul 2022 10:25:10 -0400
Received: from myt6-81d8ab6a9f9d.qloud-c.yandex.net
 (myt6-81d8ab6a9f9d.qloud-c.yandex.net
 [IPv6:2a02:6b8:c12:520a:0:640:81d8:ab6a])
 by forwardcorp1o.mail.yandex.net (Yandex) with ESMTP id 670C92E1420;
 Tue, 26 Jul 2022 17:24:52 +0300 (MSK)
Received: from [IPV6:2a02:6b8:b081:b72d::1:2a] (unknown
 [2a02:6b8:b081:b72d::1:2a])
 by myt6-81d8ab6a9f9d.qloud-c.yandex.net (smtpcorp/Yandex) with ESMTPSA id
 LTR7se4DBg-OoPCcBh7; Tue, 26 Jul 2022 17:24:51 +0300
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
 (Client certificate not present)
X-Yandex-Fwd: 1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yandex-team.ru;
 s=default; 
 t=1658845491; bh=vj+Srj9XUsAwpRLYLsilAU5qBc+YgwdO4sYjPfI7BPk=;
 h=From:In-Reply-To:Cc:Date:References:To:Subject:Message-ID;
 b=wZlPJ9bw/BTLL05KDKwgSTO/jiDo1jTjw3Ob1FqCeUFG2JUkjULQcM96X85Y0KI1I
 RzEcT/t7J7cX6TawuqXpC9ktJvCXreT2xscGz3etJfbmKOnqv1WtJc7kZA4aF9jOYv
 8NJKcRaTZZC3iU9nDqoLKG63jhpOY/ofRXjoUG1Y=
Authentication-Results: myt6-81d8ab6a9f9d.qloud-c.yandex.net;
 dkim=pass header.i=@yandex-team.ru
Message-ID: <7fd09a11-b47b-cd47-aa44-a7ec2ed6dc8b@yandex-team.ru>
Date: Tue, 26 Jul 2022 17:24:50 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.1
Subject: Re: [PATCH v2 00/11] Refactor bdrv_try_set_aio_context using
 transactions
Content-Language: en-US
To: Emanuele Giuseppe Esposito <eesposit@redhat.com>, qemu-block@nongnu.org
Cc: Kevin Wolf <kwolf@redhat.com>, Hanna Reitz <hreitz@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>, John Snow <jsnow@redhat.com>,
 Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>,
 Markus Armbruster <armbru@redhat.com>, Stefan Hajnoczi
 <stefanha@redhat.com>, qemu-devel@nongnu.org
References: <20220725122120.309236-1-eesposit@redhat.com>
From: Vladimir Sementsov-Ogievskiy <vsementsov@yandex-team.ru>
In-Reply-To: <20220725122120.309236-1-eesposit@redhat.com>
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

On 7/25/22 15:21, Emanuele Giuseppe Esposito wrote:
> The aim of this series is to reorganize bdrv_try_set_aio_context
> and drop BDS ->set_aio_context and ->can_set_aio_ctx callbacks in
> favour of a new one, ->change_aio_ctx.
> 
> More informations in patch 3 (which is also RFC, due to the doubts

patch 2 now.

> I have with AioContext locks).
> 

Can't apply to master (neither patchew can: https://patchew.org/QEMU/20220725122120.309236-1-eesposit@redhat.com/ )
Do you have a published branch somewhere to look at?

-- 
Best regards,
Vladimir

