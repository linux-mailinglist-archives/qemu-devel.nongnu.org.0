Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 92F955B1A35
	for <lists+qemu-devel@lfdr.de>; Thu,  8 Sep 2022 12:40:46 +0200 (CEST)
Received: from localhost ([::1]:40862 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oWExf-0002Y9-RS
	for lists+qemu-devel@lfdr.de; Thu, 08 Sep 2022 06:40:43 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41754)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@yandex-team.ru>)
 id 1oWEuW-0006lK-HC
 for qemu-devel@nongnu.org; Thu, 08 Sep 2022 06:37:28 -0400
Received: from forwardcorp1p.mail.yandex.net ([77.88.29.217]:41622)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@yandex-team.ru>)
 id 1oWEuS-0004ST-Ty
 for qemu-devel@nongnu.org; Thu, 08 Sep 2022 06:37:26 -0400
Received: from myt6-81d8ab6a9f9d.qloud-c.yandex.net
 (myt6-81d8ab6a9f9d.qloud-c.yandex.net
 [IPv6:2a02:6b8:c12:520a:0:640:81d8:ab6a])
 by forwardcorp1p.mail.yandex.net (Yandex) with ESMTP id 0D1AF2E0DD3;
 Thu,  8 Sep 2022 13:37:02 +0300 (MSK)
Received: from [IPV6:2a02:6b8:0:419:6cf0:bcb:b857:b210] (unknown
 [2a02:6b8:0:419:6cf0:bcb:b857:b210])
 by myt6-81d8ab6a9f9d.qloud-c.yandex.net (smtpcorp/Yandex) with ESMTPSA id
 OLuXDY3Bk0-b1Pe6x7s; Thu, 08 Sep 2022 13:37:01 +0300
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
 (Client certificate not present)
Precedence: bulk
X-Yandex-Fwd: 1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yandex-team.ru;
 s=default; 
 t=1662633421; bh=lEy6DSLK9vQayCDQf+iKrXhOpAPM2hIDluFZcw3fzJI=;
 h=From:In-Reply-To:Cc:Date:References:To:Subject:Message-ID;
 b=Uu5hErq3OUDLDk4Wf0xWELTHC37Q6Q0i4rpHiMWLWWTPwmtNX28ZYK2dnSkHL3TE+
 PwwRa3J2db4JPMEigJXzVFcSWrkNlz/J/g2gY3I2jNi6BWWRs59lfkZT6aBCa43FgK
 mAaMd4Y3bEONu/w64MloYqyrG2BpQFwWnSA1uSoA=
Authentication-Results: myt6-81d8ab6a9f9d.qloud-c.yandex.net;
 dkim=pass header.i=@yandex-team.ru
Message-ID: <47dc1d07-5e86-f99d-3cdb-39c53c01870a@yandex-team.ru>
Date: Thu, 8 Sep 2022 13:37:00 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.1
Subject: Re: [PATCH] chardev: fix segfault in finalize
Content-Language: en-US
To: Maksim Davydov <davydov-max@yandex-team.ru>, qemu-devel@nongnu.org
Cc: pbonzini@redhat.com, marcandre.lureau@redhat.com, yc-core@yandex-team.ru
References: <20220825165247.33704-1-davydov-max@yandex-team.ru>
From: Vladimir Sementsov-Ogievskiy <vsementsov@yandex-team.ru>
In-Reply-To: <20220825165247.33704-1-davydov-max@yandex-team.ru>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=77.88.29.217;
 envelope-from=vsementsov@yandex-team.ru; helo=forwardcorp1p.mail.yandex.net
X-Spam_score_int: -69
X-Spam_score: -7.0
X-Spam_bar: -------
X-Spam_report: (-7.0 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-4.199,
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

On 8/25/22 19:52, Maksim Davydov wrote:
> If finalize chardev-msmouse or chardev-wctable is called immediately after
> init it cases QEMU to crash with segfault. This happens because of
> QTAILQ_REMOVE in qemu_input_handler_unregister tries to dereference
> NULL pointer.
> For instance, this error can be reproduced via `qom-list-properties`
> command.
> 
> Signed-off-by: Maksim Davydov<davydov-max@yandex-team.ru>


Reviewed-by: Vladimir Sementsov-Ogievskiy <vsementsov@yandex-team.ru>

-- 
Best regards,
Vladimir

