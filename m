Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A32E057823B
	for <lists+qemu-devel@lfdr.de>; Mon, 18 Jul 2022 14:24:51 +0200 (CEST)
Received: from localhost ([::1]:52362 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oDPnt-0002qW-Tr
	for lists+qemu-devel@lfdr.de; Mon, 18 Jul 2022 08:24:49 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49222)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@yandex-team.ru>)
 id 1oDPZ9-0005Wv-Kk; Mon, 18 Jul 2022 08:09:36 -0400
Received: from forwardcorp1o.mail.yandex.net ([95.108.205.193]:37196)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@yandex-team.ru>)
 id 1oDPZ5-0008OB-9Y; Mon, 18 Jul 2022 08:09:33 -0400
Received: from vla1-81430ab5870b.qloud-c.yandex.net
 (vla1-81430ab5870b.qloud-c.yandex.net
 [IPv6:2a02:6b8:c0d:35a1:0:640:8143:ab5])
 by forwardcorp1o.mail.yandex.net (Yandex) with ESMTP id 408632E0AC4;
 Mon, 18 Jul 2022 15:09:21 +0300 (MSK)
Received: from [IPV6:2a02:6b8:b081:b713::1:a] (unknown
 [2a02:6b8:b081:b713::1:a])
 by vla1-81430ab5870b.qloud-c.yandex.net (smtpcorp/Yandex) with ESMTPSA id
 X6Fne0vH3x-9KOGUQsA; Mon, 18 Jul 2022 12:09:20 +0000
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
 (Client certificate not present)
X-Yandex-Fwd: 1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yandex-team.ru;
 s=default; 
 t=1658146160; bh=YNVPLp/Jb+4MnwfM6+4HleuSKKlPjjU1EExj9EgCaU0=;
 h=From:In-Reply-To:Cc:Date:References:To:Subject:Message-ID;
 b=PxLSSSxedOAF5eHic5IH3VxQ19RlP+Fz9UJ8lAnd15I/6Bs5TLMjMM1ExcpQ0LLY1
 VU8DM4NDoudvJ46/qvbxOFCEu3cwjE+iMe8yRfeyZ5SEompee//koyFviLqeKDoECs
 4YNandWjJ9gWHdXCn0jxiEVhuqT2mWy5ohd0f2Zk=
Authentication-Results: vla1-81430ab5870b.qloud-c.yandex.net;
 dkim=pass header.i=@yandex-team.ru
Message-ID: <8091174a-acde-3b93-6b1c-e6950583fa40@yandex-team.ru>
Date: Mon, 18 Jul 2022 15:09:20 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.1
Subject: Re: [PATCH 1/2] block/parallels: Fix buffer-based write call
Content-Language: en-US
To: Hanna Reitz <hreitz@redhat.com>, qemu-block@nongnu.org
Cc: qemu-devel@nongnu.org, Stefan Hajnoczi <stefanha@redhat.com>,
 "Denis V . Lunev" <den@openvz.org>, Kevin Wolf <kwolf@redhat.com>
References: <20220714132801.72464-1-hreitz@redhat.com>
 <20220714132801.72464-2-hreitz@redhat.com>
From: Vladimir Sementsov-Ogievskiy <vsementsov@yandex-team.ru>
In-Reply-To: <20220714132801.72464-2-hreitz@redhat.com>
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

On 7/14/22 16:28, Hanna Reitz wrote:
> Commit a4072543ccdddbd241d5962d9237b8b41fd006bf has changed the I/O here
> from working on a local one-element I/O vector to just using the buffer
> directly (using the bdrv_co_pread()/bdrv_co_pwrite() helper functions
> introduced shortly before).
> 
> However, it only changed the bdrv_co_preadv() call to bdrv_co_pread() -
> the subsequent bdrv_co_pwritev() call stayed this way, and so still
> expects a QEMUIOVector pointer instead of a plain buffer.  We must
> change that to be a bdrv_co_pwrite() call.
> 
> Fixes: a4072543ccdddbd241d5962d ("block/parallels: use buffer-based io")
> Signed-off-by: Hanna Reitz<hreitz@redhat.com>

Reviewed-by: Vladimir Sementsov-Ogievskiy <vsementsov@yandex-team.ru>

-- 
Best regards,
Vladimir

