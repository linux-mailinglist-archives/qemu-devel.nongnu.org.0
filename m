Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BC93D69F79C
	for <lists+qemu-devel@lfdr.de>; Wed, 22 Feb 2023 16:21:43 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pUqvc-0000Zb-2z; Wed, 22 Feb 2023 10:21:08 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@yandex-team.ru>)
 id 1pUqvZ-0000Z9-Tv
 for qemu-devel@nongnu.org; Wed, 22 Feb 2023 10:21:05 -0500
Received: from forwardcorp1b.mail.yandex.net ([178.154.239.136])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@yandex-team.ru>)
 id 1pUqvX-0001o4-8J
 for qemu-devel@nongnu.org; Wed, 22 Feb 2023 10:21:05 -0500
Received: from mail-nwsmtp-smtp-corp-main-26.myt.yp-c.yandex.net
 (mail-nwsmtp-smtp-corp-main-26.myt.yp-c.yandex.net
 [IPv6:2a02:6b8:c12:1fac:0:640:45b5:0])
 by forwardcorp1b.mail.yandex.net (Yandex) with ESMTP id D1176628B4;
 Wed, 22 Feb 2023 18:20:55 +0300 (MSK)
Received: from [IPV6:2a02:6b8:b081:a532::1:1e] (unknown
 [2a02:6b8:b081:a532::1:1e])
 by mail-nwsmtp-smtp-corp-main-26.myt.yp-c.yandex.net (smtpcorp/Yandex) with
 ESMTPSA id rKQUDD0KnKo0-UMQ1DEw5; Wed, 22 Feb 2023 18:20:54 +0300
Precedence: bulk
X-Yandex-Fwd: 1
Authentication-Results: mail-nwsmtp-smtp-corp-main-26.myt.yp-c.yandex.net;
 dkim=pass
Message-ID: <d0f97606-2026-e6b2-2004-d2c84d1340ab@yandex-team.ru>
Date: Wed, 22 Feb 2023 18:20:53 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.2
Subject: Re: [PATCH v3 1/1] vhost-user-fs: add migration type property
Content-Language: en-US
To: Anton Kuchin <antonkuchin@yandex-team.ru>, qemu-devel@nongnu.org
Cc: yc-core@yandex-team.ru, "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 Markus Armbruster <armbru@redhat.com>, Eduardo Habkost
 <eduardo@habkost.net>, Juan Quintela <quintela@redhat.com>,
 =?UTF-8?Q?Daniel_P=2e_Berrang=c3=a9?= <berrange@redhat.com>,
 Stefan Hajnoczi <stefanha@redhat.com>, "Michael S. Tsirkin"
 <mst@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>, virtio-fs@redhat.com,
 Eric Blake <eblake@redhat.com>
References: <20230217170038.1273710-1-antonkuchin@yandex-team.ru>
 <20230217170038.1273710-2-antonkuchin@yandex-team.ru>
From: Vladimir Sementsov-Ogievskiy <vsementsov@yandex-team.ru>
In-Reply-To: <20230217170038.1273710-2-antonkuchin@yandex-team.ru>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=178.154.239.136;
 envelope-from=vsementsov@yandex-team.ru; helo=forwardcorp1b.mail.yandex.net
X-Spam_score_int: -19
X-Spam_score: -2.0
X-Spam_bar: --
X-Spam_report: (-2.0 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-0.102,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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

On 17.02.23 20:00, Anton Kuchin wrote:
> Migration of vhost-user-fs device requires transfer of FUSE internal state
> from backend. There is no standard way to do it now so by default migration
> must be blocked. But if this state can be externally transferred by
> orchestrator give it an option to explicitly allow migration.
> 
> Signed-off-by: Anton Kuchin<antonkuchin@yandex-team.ru>

Reviewed-by: Vladimir Sementsov-Ogievskiy <vsementsov@yandex-team.ru>

-- 
Best regards,
Vladimir


