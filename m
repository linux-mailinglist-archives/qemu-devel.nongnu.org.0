Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 938FC597822
	for <lists+qemu-devel@lfdr.de>; Wed, 17 Aug 2022 22:44:03 +0200 (CEST)
Received: from localhost ([::1]:51272 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oOPtS-0008P1-6J
	for lists+qemu-devel@lfdr.de; Wed, 17 Aug 2022 16:44:02 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:55724)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@yandex-team.ru>)
 id 1oOPrZ-0006EF-RR; Wed, 17 Aug 2022 16:42:05 -0400
Received: from forwardcorp1o.mail.yandex.net ([95.108.205.193]:45110)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@yandex-team.ru>)
 id 1oOPrW-0004EQ-0c; Wed, 17 Aug 2022 16:42:04 -0400
Received: from vla1-81430ab5870b.qloud-c.yandex.net
 (vla1-81430ab5870b.qloud-c.yandex.net
 [IPv6:2a02:6b8:c0d:35a1:0:640:8143:ab5])
 by forwardcorp1o.mail.yandex.net (Yandex) with ESMTP id 2F4612E0F6E;
 Wed, 17 Aug 2022 23:41:51 +0300 (MSK)
Received: from [IPV6:2a02:6b8:b081:b4a5::1:13] (unknown
 [2a02:6b8:b081:b4a5::1:13])
 by vla1-81430ab5870b.qloud-c.yandex.net (smtpcorp/Yandex) with ESMTPSA id
 y3EiIRElmQ-foOKSD5P; Wed, 17 Aug 2022 23:41:50 +0300
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
 (Client certificate not present)
X-Yandex-Fwd: 1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yandex-team.ru;
 s=default; 
 t=1660768910; bh=31j7zW5xIV1H8oz0VqX9vStWhv5jbzRfjBW7YqZF65M=;
 h=From:In-Reply-To:Cc:Date:References:To:Subject:Message-ID;
 b=K4cbX0fCwlQelM5Cm+FvvAKpQAkX7uP8C1UQhMkrVSlf9GouJlDos3gTEL35lMNzU
 tDZGLMAp7shcdjlUxCy8eqkQF0CH/L0xiS1/FKsA//RBfJpXMPGLHXqJaK8TJ8YfSf
 2QWC4f10w5eZQm5/rQNxsoKjseyXHhCoQt3q7ttE=
Authentication-Results: vla1-81430ab5870b.qloud-c.yandex.net;
 dkim=pass header.i=@yandex-team.ru
Message-ID: <80c99cbb-9ad0-1878-ab92-94aefc666e5c@yandex-team.ru>
Date: Wed, 17 Aug 2022 23:41:50 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.1
Subject: Re: [PATCH v3 5/8] parallels: Move check of cluster outside image to
 a separate function
Content-Language: en-US
To: Alexander Ivanov <alexander.ivanov@virtuozzo.com>, qemu-devel@nongnu.org
Cc: qemu-block@nongnu.org, den@virtuozzo.com, stefanha@redhat.com,
 kwolf@redhat.com, hreitz@redhat.com
References: <20220815090216.1818622-1-alexander.ivanov@virtuozzo.com>
 <20220815090216.1818622-6-alexander.ivanov@virtuozzo.com>
From: Vladimir Sementsov-Ogievskiy <vsementsov@yandex-team.ru>
In-Reply-To: <20220815090216.1818622-6-alexander.ivanov@virtuozzo.com>
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

On 8/15/22 12:02, Alexander Ivanov wrote:
> We will add more and more checks so we need a better code structure
> in parallels_co_check. Let each check performs in a separate loop
> in a separate helper.
> 
> Signed-off-by: Alexander Ivanov<alexander.ivanov@virtuozzo.com>


Reviewed-by: Vladimir Sementsov-Ogievskiy <vsementsov@yandex-team.ru>

-- 
Best regards,
Vladimir

