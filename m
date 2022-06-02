Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7BF1453B76B
	for <lists+qemu-devel@lfdr.de>; Thu,  2 Jun 2022 12:38:31 +0200 (CEST)
Received: from localhost ([::1]:55910 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nwiDm-0007Us-Dq
	for lists+qemu-devel@lfdr.de; Thu, 02 Jun 2022 06:38:30 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60298)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@yandex-team.ru>)
 id 1nwi7q-0004JV-01; Thu, 02 Jun 2022 06:32:22 -0400
Received: from forwardcorp1j.mail.yandex.net ([2a02:6b8:0:1619::183]:37908)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@yandex-team.ru>)
 id 1nwi7m-0003DX-K2; Thu, 02 Jun 2022 06:32:20 -0400
Received: from vla3-850de775f4df.qloud-c.yandex.net
 (vla3-850de775f4df.qloud-c.yandex.net
 [IPv6:2a02:6b8:c15:341d:0:640:850d:e775])
 by forwardcorp1j.mail.yandex.net (Yandex) with ESMTP id 9C2DB2E0465;
 Thu,  2 Jun 2022 13:32:06 +0300 (MSK)
Received: from vla1-81430ab5870b.qloud-c.yandex.net
 (vla1-81430ab5870b.qloud-c.yandex.net [2a02:6b8:c0d:35a1:0:640:8143:ab5])
 by vla3-850de775f4df.qloud-c.yandex.net (mxbackcorp/Yandex) with ESMTP id
 CzqYThRmlI-W6KmHDBm; Thu, 02 Jun 2022 13:32:06 +0300
X-Yandex-Fwd: 2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yandex-team.ru;
 s=default; 
 t=1654165926; bh=hxq9CsPyQ3VBHwQjgWPncsJZVnzxjRbK/a3HzVCCky8=;
 h=In-Reply-To:From:Cc:To:Subject:Message-ID:References:Date;
 b=jNpEesw/J+xkFwgfJPJoqOs1jrSI+0Md+PoNuMCI+y+XHdJSr8CAxc2GJMoFKS3uq
 0Vul0tMMptaYxikn735nTYYUgtWER5cF5zLDSk+8y3RG4cvVrM64RNySE642yoevIn
 085/AFhiuk+gGYDA+IQYykAmqOPCNcapFHQ+sF9Q=
Authentication-Results: vla3-850de775f4df.qloud-c.yandex.net;
 dkim=pass header.i=@yandex-team.ru
Received: from [IPV6:2a02:6b8:b081:b6ba::1:27] (unknown
 [2a02:6b8:b081:b6ba::1:27])
 by vla1-81430ab5870b.qloud-c.yandex.net (smtpcorp/Yandex) with ESMTPSA id
 aFc0RawNTt-W5MOBFoI; Thu, 02 Jun 2022 13:32:06 +0300
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
 (Client certificate not present)
Message-ID: <b889ec7e-5764-e538-c237-0eb8ccabf2ce@yandex-team.ru>
Date: Thu, 2 Jun 2022 13:32:05 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.1
Subject: Re: [PATCH v2 1/1] nbd: trace long NBD operations
Content-Language: en-US
To: "Denis V. Lunev" <den@openvz.org>, qemu-block@nongnu.org,
 qemu-devel@nongnu.org
Cc: Eric Blake <eblake@redhat.com>, Kevin Wolf <kwolf@redhat.com>,
 Hanna Reitz <hreitz@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>
References: <20220530103929.629328-1-den@openvz.org>
From: Vladimir Sementsov-Ogievskiy <vsementsov@yandex-team.ru>
In-Reply-To: <20220530103929.629328-1-den@openvz.org>
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

On 5/30/22 13:39, Denis V. Lunev wrote:
> At the moment there are 2 sources of lengthy operations if configured:
> * open connection, which could retry inside and
> * reconnect of already opened connection
> These operations could be quite lengthy and cumbersome to catch thus
> it would be quite natural to add trace points for them.
> 
> This patch is based on the original downstream work made by Vladimir.
> 
> Signed-off-by: Denis V. Lunev<den@openvz.org>
> CC: Eric Blake<eblake@redhat.com>
> CC: Vladimir Sementsov-Ogievskiy<vsementsov@yandex-team.ru>
> CC: Kevin Wolf<kwolf@redhat.com>
> CC: Hanna Reitz<hreitz@redhat.com>
> CC: Paolo Bonzini<pbonzini@redhat.com>

Reviewed-by: Vladimir Sementsov-Ogievskiy <vsementsov@yandex-team.ru>

-- 
Best regards,
Vladimir

