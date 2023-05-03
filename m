Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 519A96F5EE4
	for <lists+qemu-devel@lfdr.de>; Wed,  3 May 2023 21:07:33 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1puHo9-0007hO-R7; Wed, 03 May 2023 15:06:33 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@yandex-team.ru>)
 id 1puHo7-0007gJ-Di; Wed, 03 May 2023 15:06:31 -0400
Received: from forwardcorp1b.mail.yandex.net
 ([2a02:6b8:c02:900:1:45:d181:df01])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@yandex-team.ru>)
 id 1puHo5-00060Z-Mo; Wed, 03 May 2023 15:06:31 -0400
Received: from mail-nwsmtp-smtp-corp-main-62.myt.yp-c.yandex.net
 (mail-nwsmtp-smtp-corp-main-62.myt.yp-c.yandex.net
 [IPv6:2a02:6b8:c00:2582:0:640:9a17:0])
 by forwardcorp1b.mail.yandex.net (Yandex) with ESMTP id BDCA060C5C;
 Wed,  3 May 2023 22:06:17 +0300 (MSK)
Received: from [IPV6:2a02:6b8:b081:b43b::1:1a] (unknown
 [2a02:6b8:b081:b43b::1:1a])
 by mail-nwsmtp-smtp-corp-main-62.myt.yp-c.yandex.net (smtpcorp/Yandex) with
 ESMTPSA id G6UXDc0MlW20-WMdQ4I1Z; Wed, 03 May 2023 22:06:17 +0300
X-Yandex-Fwd: 1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yandex-team.ru;
 s=default; 
 t=1683140777; bh=D1MzpJqW6dv+RQIjgODtNeJgh82OFtOD3a7rjfC0xxc=;
 h=From:In-Reply-To:Cc:Date:References:To:Subject:Message-ID;
 b=YWNTAbr/nxXLm9pE3Ar5K76az1yBWsQxxuTFCEd2upDBjPFMqFe7DKLrU6mdNRHRX
 FsyfjlRiYvGJy+uKNhv1/ObP+H13UTL4jCxXqaNLgcSZbEuhypYM2JHy/06jcdLfbP
 RLRbcHwfCS1LIgEd5p/zY7MZNs/JzOslx8Ovd78o=
Authentication-Results: mail-nwsmtp-smtp-corp-main-62.myt.yp-c.yandex.net;
 dkim=pass header.i=@yandex-team.ru
Message-ID: <1a177c21-23d1-1ade-f8cc-fc8208216e04@yandex-team.ru>
Date: Wed, 3 May 2023 22:06:16 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.0
Subject: Re: [PATCH] iotests/nbd-reconnect-on-open: Fix NBD socket path
Content-Language: en-US
To: Kevin Wolf <kwolf@redhat.com>, qemu-block@nongnu.org
Cc: hreitz@redhat.com, vsementsov@virtuozzo.com,
 nikita.lapshin@virtuozzo.com, qemu-devel@nongnu.org
References: <20230503165019.8867-1-kwolf@redhat.com>
From: Vladimir Sementsov-Ogievskiy <vsementsov@yandex-team.ru>
In-Reply-To: <20230503165019.8867-1-kwolf@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2a02:6b8:c02:900:1:45:d181:df01;
 envelope-from=vsementsov@yandex-team.ru; helo=forwardcorp1b.mail.yandex.net
X-Spam_score_int: -63
X-Spam_score: -6.4
X-Spam_bar: ------
X-Spam_report: (-6.4 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-4.28,
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

On 03.05.23 19:50, Kevin Wolf wrote:
> Socket paths need to be short to avoid failures. This is why there is a
> iotests.sock_dir (defaulting to /tmp) separate from the disk image base
> directory.
> 
> Make use of it to fix failures in too deeply nested test directories.
> 
> Fixes: ab7f7e67a7e7b49964109501dfcde4ec29bae60e
> Signed-off-by: Kevin Wolf<kwolf@redhat.com>


Reviewed-by: Vladimir Sementsov-Ogievskiy <vsementsov@yandex-team.ru>

-- 
Best regards,
Vladimir


