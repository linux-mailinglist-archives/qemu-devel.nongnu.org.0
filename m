Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 40CB567706A
	for <lists+qemu-devel@lfdr.de>; Sun, 22 Jan 2023 17:10:41 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pJcuq-0006QU-Vz; Sun, 22 Jan 2023 11:09:57 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <antonkuchin@yandex-team.ru>)
 id 1pJcuo-0006QM-Ri
 for qemu-devel@nongnu.org; Sun, 22 Jan 2023 11:09:54 -0500
Received: from forwardcorp1a.mail.yandex.net ([178.154.239.72])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <antonkuchin@yandex-team.ru>)
 id 1pJcul-0005XF-QF
 for qemu-devel@nongnu.org; Sun, 22 Jan 2023 11:09:54 -0500
Received: from vla1-81430ab5870b.qloud-c.yandex.net
 (vla1-81430ab5870b.qloud-c.yandex.net
 [IPv6:2a02:6b8:c0d:35a1:0:640:8143:ab5])
 by forwardcorp1a.mail.yandex.net (Yandex) with ESMTP id 59A235FD03;
 Sun, 22 Jan 2023 19:09:44 +0300 (MSK)
Received: from [IPV6:2a02:6b8:b081:b736::1:15] (unknown
 [2a02:6b8:b081:b736::1:15])
 by vla1-81430ab5870b.qloud-c.yandex.net (smtpcorp/Yandex) with ESMTPSA id
 e9sx1v0XO4Y1-rO0JgPzU; Sun, 22 Jan 2023 19:09:43 +0300
Precedence: bulk
X-Yandex-Fwd: 1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yandex-team.ru;
 s=default; 
 t=1674403783; bh=2GcRyJKAh8efdRAa1AltGBih44U57zh2nNUPECb4oMg=;
 h=From:In-Reply-To:Cc:Date:References:To:Subject:Message-ID;
 b=sDCxgUJcTbB0q6SWvnsvUD2LVkNS1T9z8h/TonirYQrfVuMCTbCLW3/R2M1TAVJOU
 DMgy3vOEn8vGBJ185ot9FpA5Hrjrjx0GHM4XRQfie9tZUBmkLYRM8Zax5fTEtsxKDa
 hcrNvVy5F86wFnoS2PSmdfZ3pSPmm0kFGzH8G+3w=
Authentication-Results: vla1-81430ab5870b.qloud-c.yandex.net;
 dkim=pass header.i=@yandex-team.ru
Message-ID: <70c0f00a-7828-3ccf-c2ea-49aeef8693e9@yandex-team.ru>
Date: Sun, 22 Jan 2023 18:09:40 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.2
Subject: Re: [PATCH] vhost-user-fs: add capability to allow migration
Content-Language: en-US, ru-RU
To: "Michael S. Tsirkin" <mst@redhat.com>
Cc: qemu-devel@nongnu.org, virtio-fs@redhat.com,
 Markus Armbruster <armbru@redhat.com>, Eric Blake <eblake@redhat.com>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 Stefan Hajnoczi <stefanha@redhat.com>, Juan Quintela <quintela@redhat.com>,
 yc-core@yandex-team.ru
References: <20230115170903.3416105-1-antonkuchin@yandex-team.ru>
 <20230119074602-mutt-send-email-mst@kernel.org>
 <f9993404-f8b8-7a23-37f8-530313783466@yandex-team.ru>
 <20230120085534-mutt-send-email-mst@kernel.org>
 <703d527f-de92-090c-6ce1-af0dec7de033@yandex-team.ru>
 <20230122030455-mutt-send-email-mst@kernel.org>
 <b7de3adc-cba7-09eb-ea93-f4bfb91bea9e@yandex-team.ru>
 <20230122093903-mutt-send-email-mst@kernel.org>
From: Anton Kuchin <antonkuchin@yandex-team.ru>
In-Reply-To: <20230122093903-mutt-send-email-mst@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=178.154.239.72;
 envelope-from=antonkuchin@yandex-team.ru; helo=forwardcorp1a.mail.yandex.net
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-1.149,
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


On 22/01/2023 16:46, Michael S. Tsirkin wrote:
> On Sun, Jan 22, 2023 at 02:36:04PM +0200, Anton Kuchin wrote:
>>>> This flag should be set when qemu don't need to worry about any
>>>> external state stored in vhost-user daemons during migration:
>>>> don't fail migration, just pack generic virtio device states to
>>>> migration stream and orchestrator guarantees that the rest of the
>>>> state will be present at the destination to restore full context and
>>>> continue running.
>>> Sorry  I still do not get it.  So fundamentally, why do we need this property?
>>> vhost-user-fs is not created by default that we'd then need opt-in to
>>> the special "migrateable" case.
>>> That's why I said it might make some sense as a device property as qemu
>>> tracks whether device is unplugged for us.
>>>
>>> But as written, if you are going to teach the orchestrator about
>>> vhost-user-fs and its special needs, just teach it when to migrate and
>>> where not to migrate.
>>>
>>> Either we describe the special situation to qemu and let qemu
>>> make an intelligent decision whether to allow migration,
>>> or we trust the orchestrator. And if it's the latter, then 'migrate'
>>> already says orchestrator decided to migrate.
>> The problem I'm trying to solve is that most of vhost-user devices
>> now block migration in qemu. And this makes sense since qemu can't
>> extract and transfer backend daemon state. But this prevents us from
>> updating qemu executable via local migration. So this flag is
>> intended more as a safety check that says "I know what I'm doing".
>>
>> I agree that it is not really necessary if we trust the orchestrator
>> to request migration only when the migration can be performed in a
>> safe way. But changing the current behavior of vhost-user-fs from
>> "always blocks migration" to "migrates partial state whenever
>> orchestrator requests it" seems a little  dangerous and can be
>> misinterpreted as full support for migration in all cases.
> It's not really different from block is it? orchestrator has to arrange
> for backend migration. I think we just assumed there's no use-case where
> this is practical for vhost-user-fs so we blocked it.
> But in any case it's orchestrator's responsibility.

Yes, you are right. So do you think we should just drop the blocker
without adding a new flag?


