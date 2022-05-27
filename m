Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 287E453661F
	for <lists+qemu-devel@lfdr.de>; Fri, 27 May 2022 18:48:40 +0200 (CEST)
Received: from localhost ([::1]:38962 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nud8f-0000wq-4G
	for lists+qemu-devel@lfdr.de; Fri, 27 May 2022 12:48:38 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:52302)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@yandex-team.ru>)
 id 1nud5l-0007mr-2Z; Fri, 27 May 2022 12:45:37 -0400
Received: from forwardcorp1j.mail.yandex.net ([2a02:6b8:0:1619::183]:56584)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@yandex-team.ru>)
 id 1nud5h-00050G-BN; Fri, 27 May 2022 12:45:35 -0400
Received: from sas2-6a1db1376cb6.qloud-c.yandex.net
 (sas2-6a1db1376cb6.qloud-c.yandex.net
 [IPv6:2a02:6b8:c08:bb0f:0:640:6a1d:b137])
 by forwardcorp1j.mail.yandex.net (Yandex) with ESMTP id 655F82E19EA;
 Fri, 27 May 2022 19:45:13 +0300 (MSK)
Received: from sas1-c73b4b4f4b95.qloud-c.yandex.net
 (sas1-c73b4b4f4b95.qloud-c.yandex.net [2a02:6b8:c08:12a9:0:640:c73b:4b4f])
 by sas2-6a1db1376cb6.qloud-c.yandex.net (mxbackcorp/Yandex) with ESMTP id
 VTZEjkZ5Kz-jBKe4KmG; Fri, 27 May 2022 19:45:13 +0300
X-Yandex-Fwd: 2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yandex-team.ru;
 s=default; 
 t=1653669913; bh=nzNrqQUXyGiRavPwNJhCjL/I7PrhkYZRaLNYmp6MxjE=;
 h=In-Reply-To:From:Cc:To:Subject:Message-ID:References:Date;
 b=jwJxL9EX+CvoyE+rgRxFAuspd7whc/tiuBbHI3vm6VkUl80t6zhjoE9RogGJnE66c
 /pegO7IV96qPkxGTI5pML19TMac/4nClwlyfo1NElKARvT34YM7kJxD4TniMTx7KRP
 o8/s7vWgiuDuFV0WrfCBgHLA6zZUTtjvgm1nEK5I=
Authentication-Results: sas2-6a1db1376cb6.qloud-c.yandex.net;
 dkim=pass header.i=@yandex-team.ru
Received: from [IPV6:2a02:6b8:b081:b6b0::1:22] (unknown
 [2a02:6b8:b081:b6b0::1:22])
 by sas1-c73b4b4f4b95.qloud-c.yandex.net (smtpcorp/Yandex) with ESMTPSA id
 M1lMCFEiNG-jBJG9hsb; Fri, 27 May 2022 19:45:11 +0300
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
 (Client certificate not present)
Message-ID: <90d5d37e-7ab0-edfb-60a0-2d81bd5fc86a@yandex-team.ru>
Date: Fri, 27 May 2022 19:45:11 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.1
Subject: Re: [PATCH v3] block/gluster: correctly set max_pdiscard
Content-Language: en-US
To: Fabian Ebner <f.ebner@proxmox.com>, qemu-devel@nongnu.org
Cc: kwolf@redhat.com, hreitz@redhat.com, qemu-block@nongnu.org,
 integration@gluster.org, qemu-stable@nongnu.org, eblake@redhat.com,
 vsementsov@virtuozzo.com, sgarzare@redhat.com
References: <20220520075922.43972-1-f.ebner@proxmox.com>
From: Vladimir Sementsov-Ogievskiy <vsementsov@yandex-team.ru>
In-Reply-To: <20220520075922.43972-1-f.ebner@proxmox.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2a02:6b8:0:1619::183;
 envelope-from=vsementsov@yandex-team.ru; helo=forwardcorp1j.mail.yandex.net
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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

On 5/20/22 10:59, Fabian Ebner wrote:
> On 64-bit platforms, assigning SIZE_MAX to the int64_t max_pdiscard
> results in a negative value, and the following assertion would trigger

Oops. Good catch!

> down the line (it's not the same max_pdiscard, but computed from the
> other one):
> qemu-system-x86_64: ../block/io.c:3166: bdrv_co_pdiscard: Assertion
> `max_pdiscard >= bs->bl.request_alignment' failed.
> 
> On 32-bit platforms, it's fine to keep using SIZE_MAX.
> 
> The assertion in qemu_gluster_co_pdiscard() is checking that the value
> of 'bytes' can safely be passed to glfs_discard_async(), which takes a
> size_t for the argument in question, so it is kept as is. And since
> max_pdiscard is still <= SIZE_MAX, relying on max_pdiscard is still
> fine.
> 
> Fixes: 0c8022876f ("block: use int64_t instead of int in driver discard handlers")
> Cc: qemu-stable@nongnu.org
> Signed-off-by: Fabian Ebner <f.ebner@proxmox.com>


Reviewed-by: Vladimir Sementsov-Ogievskiy <vsementsov@yandex-team.ru>


-- 
Best regards,
Vladimir

