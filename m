Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D06596E3088
	for <lists+qemu-devel@lfdr.de>; Sat, 15 Apr 2023 12:26:26 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pnd5X-0000UQ-EU; Sat, 15 Apr 2023 06:24:59 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@yandex-team.ru>)
 id 1pnd5V-0000U0-9n; Sat, 15 Apr 2023 06:24:57 -0400
Received: from forwardcorp1c.mail.yandex.net ([178.154.239.200])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@yandex-team.ru>)
 id 1pnd5T-0006xR-8X; Sat, 15 Apr 2023 06:24:57 -0400
Received: from mail-nwsmtp-smtp-corp-main-62.myt.yp-c.yandex.net
 (mail-nwsmtp-smtp-corp-main-62.myt.yp-c.yandex.net
 [IPv6:2a02:6b8:c00:2582:0:640:9a17:0])
 by forwardcorp1c.mail.yandex.net (Yandex) with ESMTP id B31AB5F28C;
 Sat, 15 Apr 2023 13:24:43 +0300 (MSK)
Received: from [IPV6:2a02:6b8:b081:7219::1:1b] (unknown
 [2a02:6b8:b081:7219::1:1b])
 by mail-nwsmtp-smtp-corp-main-62.myt.yp-c.yandex.net (smtpcorp/Yandex) with
 ESMTPSA id fOWEXK0OnSw0-yCgaoD5l; Sat, 15 Apr 2023 13:24:42 +0300
Precedence: bulk
X-Yandex-Fwd: 1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yandex-team.ru;
 s=default; 
 t=1681554282; bh=r3r6qGV/1htEILk6cEjO4Chh4Y87ItMyYGjn1D3m26E=;
 h=From:In-Reply-To:Cc:Date:References:To:Subject:Message-ID;
 b=M5sxwar6OPWgkBJRMIHrm8TV6bH6cs6U78QO3y1FKJVkH5Qg59N0tp52/0l0SpUrk
 p2fScqdRjC8+cMCrrhse5II0RJRRQPfNRQTtiBzqmVO5hVhUPxbexdqzH3mUY02/+B
 cdUPsnBK6aNkJrvv68sElSFWeNAygla0eeM/QeXY=
Authentication-Results: mail-nwsmtp-smtp-corp-main-62.myt.yp-c.yandex.net;
 dkim=pass header.i=@yandex-team.ru
Message-ID: <d96081ad-5677-78fb-af42-25e596576f7f@yandex-team.ru>
Date: Sat, 15 Apr 2023 13:24:41 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.0
Subject: Re: [PATCH] vhost-user-blk-server: notify client about disk resize
Content-Language: en-US
To: qemu-block@nongnu.org
Cc: qemu-devel@nongnu.org, mst@redhat.com, hreitz@redhat.com,
 kwolf@redhat.com, Coiby.Xu@gmail.com, yc-core@yandex-team.ru
References: <20230321201323.3695923-1-vsementsov@yandex-team.ru>
From: Vladimir Sementsov-Ogievskiy <vsementsov@yandex-team.ru>
In-Reply-To: <20230321201323.3695923-1-vsementsov@yandex-team.ru>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=178.154.239.200;
 envelope-from=vsementsov@yandex-team.ru; helo=forwardcorp1c.mail.yandex.net
X-Spam_score_int: -43
X-Spam_score: -4.4
X-Spam_bar: ----
X-Spam_report: (-4.4 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-2.282,
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

On 21.03.23 23:13, Vladimir Sementsov-Ogievskiy wrote:
> Currently block_resize qmp command is simply ignored by vhost-user-blk
> export. So, the block-node is successfully resized, but virtio config
> is unchanged and guest doesn't see that disk is resized.
> 
> Let's handle the resize by modifying the config and notifying the guest
> appropriately.
> 
> After this comment, lsblk in linux guest with attached
> vhost-user-blk-pci device shows new size immediately after block_resize
> QMP command on vhost-user exported block node.
> 
> Signed-off-by: Vladimir Sementsov-Ogievskiy<vsementsov@yandex-team.ru>

Ping:) Any interest in that? Or, is there some another way to live-resize vhost-user disks?

-- 
Best regards,
Vladimir


