Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C52555331AF
	for <lists+qemu-devel@lfdr.de>; Tue, 24 May 2022 21:19:32 +0200 (CEST)
Received: from localhost ([::1]:44676 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nta43-0002L5-Tc
	for lists+qemu-devel@lfdr.de; Tue, 24 May 2022 15:19:31 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34246)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@yandex-team.ru>)
 id 1ntZpU-0002cS-Ef
 for qemu-devel@nongnu.org; Tue, 24 May 2022 15:04:28 -0400
Received: from forwardcorp1p.mail.yandex.net
 ([2a02:6b8:0:1472:2741:0:8b6:217]:33542)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@yandex-team.ru>)
 id 1ntZpI-0005tS-7l
 for qemu-devel@nongnu.org; Tue, 24 May 2022 15:04:26 -0400
Received: from myt6-79704c0e15e4.qloud-c.yandex.net
 (myt6-79704c0e15e4.qloud-c.yandex.net
 [IPv6:2a02:6b8:c12:239b:0:640:7970:4c0e])
 by forwardcorp1p.mail.yandex.net (Yandex) with ESMTP id B98082E12CD;
 Tue, 24 May 2022 22:04:08 +0300 (MSK)
Received: from myt6-81d8ab6a9f9d.qloud-c.yandex.net
 (myt6-81d8ab6a9f9d.qloud-c.yandex.net [2a02:6b8:c12:520a:0:640:81d8:ab6a])
 by myt6-79704c0e15e4.qloud-c.yandex.net (mxbackcorp/Yandex) with ESMTP id
 lbEX1LRyNJ-47J8LDm5; Tue, 24 May 2022 22:04:08 +0300
X-Yandex-Fwd: 2
Precedence: bulk
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yandex-team.ru;
 s=default; 
 t=1653419048; bh=vp5S5dxqYsJk0F2O/a0VA1enIbG1yVcbvNQHgyRuLRg=;
 h=In-Reply-To:From:Cc:To:Subject:Message-ID:References:Date;
 b=VvnMuwAh/e+lbF8Nj1bNHOWKWBkNwH5hXdc+sSKDUGHaXpZVVG3xaYUiRNK0lOiW5
 XuzMmTUQ30EOLQdwRszd3V5LUJz1FapiFroGV+R4q2BxZb0nPvQNX4++8dcfwNcdY7
 C2OELkbGJkc7fRwQN1qE+B2gZ4uRYx9vBR87ZDtg=
Authentication-Results: myt6-79704c0e15e4.qloud-c.yandex.net;
 dkim=pass header.i=@yandex-team.ru
Received: from [IPV6:2a02:6b8:b081:b6b7::1:23] (unknown
 [2a02:6b8:b081:b6b7::1:23])
 by myt6-81d8ab6a9f9d.qloud-c.yandex.net (smtpcorp/Yandex) with ESMTPSA id
 qdU0J8FyE6-47NSjKGe; Tue, 24 May 2022 22:04:07 +0300
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
 (Client certificate not present)
Message-ID: <f0f173e2-66b1-393f-447d-2d8f102241d8@yandex-team.ru>
Date: Tue, 24 May 2022 22:04:06 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.1
Subject: Re: [PATCH 1/4] qdev: add DEVICE_RUNTIME_ERROR event
Content-Language: en-US
To: Konstantin Khlebnikov <khlebnikov@yandex-team.ru>, qemu-devel@nongnu.org
Cc: yc-core@yandex-team.ru, eblake@redhat.com,
 Markus Armbruster <armbru@redhat.com>, mst@redhat.com,
 Denis Plotnikov <den-plotnikov@yandex-team.ru>
References: <165296995578.196133.16183155555450040914.stgit@buzz>
From: Vladimir Sementsov-Ogievskiy <vsementsov@yandex-team.ru>
In-Reply-To: <165296995578.196133.16183155555450040914.stgit@buzz>
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

First, cover letter is absent. Konstantin, could you please provide a description what the whole series does?

Second, add maintainers to CC:
+Micheal
+Eric
+Markus

On 5/19/22 17:19, Konstantin Khlebnikov wrote:
> This event represents device runtime errors to give time and
> reason why device is broken.
> 
> Signed-off-by: Konstantin Khlebnikov <khlebnikov@yandex-team.ru>
> ---

The patch itself seems good to me:
Reviewed-by: Vladimir Sementsov-Ogievskiy <vsementsov@yandex-team.ru>

-- 
Best regards,
Vladimir

