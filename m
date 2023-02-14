Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id EF3AB696C22
	for <lists+qemu-devel@lfdr.de>; Tue, 14 Feb 2023 18:59:37 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pRzZi-0001ix-Ox; Tue, 14 Feb 2023 12:58:42 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@yandex-team.ru>)
 id 1pRzZd-0001hg-22; Tue, 14 Feb 2023 12:58:37 -0500
Received: from forwardcorp1b.mail.yandex.net ([178.154.239.136])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@yandex-team.ru>)
 id 1pRzZY-0006Bw-Gu; Tue, 14 Feb 2023 12:58:34 -0500
Received: from myt5-8800bd68420f.qloud-c.yandex.net
 (myt5-8800bd68420f.qloud-c.yandex.net
 [IPv6:2a02:6b8:c12:4615:0:640:8800:bd68])
 by forwardcorp1b.mail.yandex.net (Yandex) with ESMTP id 41B2562842;
 Tue, 14 Feb 2023 20:58:20 +0300 (MSK)
Received: from [IPV6:2a02:6b8:b081:b433::1:3c] (unknown
 [2a02:6b8:b081:b433::1:3c])
 by myt5-8800bd68420f.qloud-c.yandex.net (smtpcorp/Yandex) with ESMTPSA id
 JwnI220RiOs1-O7iDSUQ9; Tue, 14 Feb 2023 20:58:19 +0300
X-Yandex-Fwd: 1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yandex-team.ru;
 s=default; 
 t=1676397499; bh=wN0YetVcq0Hq3DApDcY3dGm16aa+q/0ZFAiioBVXftU=;
 h=From:In-Reply-To:Cc:Date:References:To:Subject:Message-ID;
 b=l29WdmNbrrQrSyAqutJ/1kE4qjstJoiYruU9CH8Bt9ELzRQkP7QcjPgowciufOtdP
 WjAqt+d0Cdh/iliXohI7A4TLq6MfQ/BWtJVhWczkKAkRkFXSlo8mETJPs5afCX4gU9
 gOumHASbDSnGc3xhTZ16BWnpp4zzGmy/WtKjauBY=
Authentication-Results: myt5-8800bd68420f.qloud-c.yandex.net;
 dkim=pass header.i=@yandex-team.ru
Message-ID: <b4af77a5-6390-5718-723d-8dcde089fb7d@yandex-team.ru>
Date: Tue, 14 Feb 2023 20:58:19 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.2
Subject: Re: [PATCH v10 02/12] parallels: Fix high_off calculation in
 parallels_co_check()
Content-Language: en-US
To: Alexander Ivanov <alexander.ivanov@virtuozzo.com>, qemu-devel@nongnu.org
Cc: qemu-block@nongnu.org, den@virtuozzo.com, stefanha@redhat.com,
 kwolf@redhat.com, hreitz@redhat.com
References: <20230203091854.2221397-1-alexander.ivanov@virtuozzo.com>
 <20230203091854.2221397-3-alexander.ivanov@virtuozzo.com>
From: Vladimir Sementsov-Ogievskiy <vsementsov@yandex-team.ru>
In-Reply-To: <20230203091854.2221397-3-alexander.ivanov@virtuozzo.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=178.154.239.136;
 envelope-from=vsementsov@yandex-team.ru; helo=forwardcorp1b.mail.yandex.net
X-Spam_score_int: -24
X-Spam_score: -2.5
X-Spam_bar: --
X-Spam_report: (-2.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.35,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

On 03.02.23 12:18, Alexander Ivanov wrote:
> Don't let high_off be more than the file size even if we don't fix the
> image.
> 
> Signed-off-by: Alexander Ivanov<alexander.ivanov@virtuozzo.com>
> Reviewed-by: Denis V. Lunev<den@openvz.org>

Reviewed-by: Vladimir Sementsov-Ogievskiy <vsementsov@yandex-team.ru>

-- 
Best regards,
Vladimir


