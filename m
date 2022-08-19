Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E2FCA599ED9
	for <lists+qemu-devel@lfdr.de>; Fri, 19 Aug 2022 17:58:11 +0200 (CEST)
Received: from localhost ([::1]:46502 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oP4Nu-0000Pf-PS
	for lists+qemu-devel@lfdr.de; Fri, 19 Aug 2022 11:58:10 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:52880)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@yandex-team.ru>)
 id 1oP4Kz-0005XU-0D; Fri, 19 Aug 2022 11:55:09 -0400
Received: from forwardcorp1p.mail.yandex.net
 ([2a02:6b8:0:1472:2741:0:8b6:217]:58900)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@yandex-team.ru>)
 id 1oP4Kv-0008MA-NW; Fri, 19 Aug 2022 11:55:08 -0400
Received: from vla5-d6d5ce7a4718.qloud-c.yandex.net
 (vla5-d6d5ce7a4718.qloud-c.yandex.net
 [IPv6:2a02:6b8:c18:341e:0:640:d6d5:ce7a])
 by forwardcorp1p.mail.yandex.net (Yandex) with ESMTP id 525822E08AD;
 Fri, 19 Aug 2022 18:54:55 +0300 (MSK)
Received: from [IPV6:2a02:6b8:b081:b4ab::1:3b] (unknown
 [2a02:6b8:b081:b4ab::1:3b])
 by vla5-d6d5ce7a4718.qloud-c.yandex.net (smtpcorp/Yandex) with ESMTPSA id
 lqZIHuDBvh-ssOKKaPk; Fri, 19 Aug 2022 18:54:54 +0300
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
 (Client certificate not present)
X-Yandex-Fwd: 1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yandex-team.ru;
 s=default; 
 t=1660924494; bh=q78eTMIYco4PF7nG95btwaNWD5yRRCY/Tdy0BFil7xE=;
 h=From:In-Reply-To:Cc:Date:References:To:Subject:Message-ID;
 b=iPhU85JH61rLU74dg8+7AeMauZ0+BxMF7xvnYl8OWEvZWHKWl0XD7qwPV7BZBPUsG
 U6mdV6VtsMaBCmm8N3BL4fxquFz6aZ7q0upJJSMsrLR3vFSKC94Iy/RwhqbTNx1nQ2
 YPmss9N5x1tfNtMPKEDDf8GQe7vcwsUh6j6kzQ/A=
Authentication-Results: vla5-d6d5ce7a4718.qloud-c.yandex.net;
 dkim=pass header.i=@yandex-team.ru
Message-ID: <284d41ac-e51f-b311-c611-dd7657bcceea@yandex-team.ru>
Date: Fri, 19 Aug 2022 18:54:54 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.1
Subject: Re: [PATCH 2/2] block: make serializing requests functions 'void'
Content-Language: en-US
To: "Denis V. Lunev" <den@openvz.org>, qemu-block@nongnu.org,
 qemu-devel@nongnu.org
Cc: Kevin Wolf <kwolf@redhat.com>, Hanna Reitz <hreitz@redhat.com>,
 Stefan Hajnoczi <stefanha@redhat.com>, Fam Zheng <fam@euphon.net>,
 Ronnie Sahlberg <ronniesahlberg@gmail.com>,
 Paolo Bonzini <pbonzini@redhat.com>, Peter Lieven <pl@kamp.de>
References: <20220817083736.40981-1-den@openvz.org>
 <20220817083736.40981-3-den@openvz.org>
From: Vladimir Sementsov-Ogievskiy <vsementsov@yandex-team.ru>
In-Reply-To: <20220817083736.40981-3-den@openvz.org>
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

On 8/17/22 11:37, Denis V. Lunev wrote:
> Return codes of the following functions are never used in the code:
> * bdrv_wait_serialising_requests_locked
> * bdrv_wait_serialising_requests
> * bdrv_make_request_serialising
> 
> Signed-off-by: Denis V. Lunev<den@openvz.org>
> CC: Kevin Wolf<kwolf@redhat.com>
> CC: Hanna Reitz<hreitz@redhat.com>
> CC: Stefan Hajnoczi<stefanha@redhat.com>
> CC: Fam Zheng<fam@euphon.net>
> CC: Ronnie Sahlberg<ronniesahlberg@gmail.com>
> CC: Paolo Bonzini<pbonzini@redhat.com>
> CC: Peter Lieven<pl@kamp.de>
> CC: Vladimir Sementsov-Ogievskiy<vsementsov@yandex-team.ru>

Oh, good cleanup!


Reviewed-by: Vladimir Sementsov-Ogievskiy <vsementsov@yandex-team.ru>

-- 
Best regards,
Vladimir

