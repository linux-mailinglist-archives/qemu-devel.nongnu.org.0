Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 77F1A6FEFDC
	for <lists+qemu-devel@lfdr.de>; Thu, 11 May 2023 12:24:58 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1px3SM-0004Jl-Je; Thu, 11 May 2023 06:23:30 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@yandex-team.ru>)
 id 1px3SH-0004Io-EE
 for qemu-devel@nongnu.org; Thu, 11 May 2023 06:23:25 -0400
Received: from forwardcorp1b.mail.yandex.net
 ([2a02:6b8:c02:900:1:45:d181:df01])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@yandex-team.ru>)
 id 1px3SD-0004b2-P9
 for qemu-devel@nongnu.org; Thu, 11 May 2023 06:23:24 -0400
Received: from mail-nwsmtp-smtp-corp-main-44.iva.yp-c.yandex.net
 (mail-nwsmtp-smtp-corp-main-44.iva.yp-c.yandex.net
 [IPv6:2a02:6b8:c0c:a884:0:640:947b:0])
 by forwardcorp1b.mail.yandex.net (Yandex) with ESMTP id 4C74760D1D;
 Thu, 11 May 2023 13:23:14 +0300 (MSK)
Received: from [IPV6:2a02:6b8:b081:203::1:7] (unknown [2a02:6b8:b081:203::1:7])
 by mail-nwsmtp-smtp-corp-main-44.iva.yp-c.yandex.net (smtpcorp/Yandex) with
 ESMTPSA id CNT7Xa0OnCg0-W6xmdG5G; Thu, 11 May 2023 13:23:13 +0300
X-Yandex-Fwd: 1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yandex-team.ru;
 s=default; 
 t=1683800593; bh=FJ1JNSGhM2Q74WSGP25dgO8NVRM+W1qCuyxvrPFNtk0=;
 h=From:In-Reply-To:Cc:Date:References:To:Subject:Message-ID;
 b=wxhCqTXw6aK0rWooO4xC09L2mG0/4Iuq/mtJTRhKg3g8WOCmD/9qh4Esv/TXTwwov
 vEy4NdCkOP5S1rmJehGkVAD88O2s5IKlSarco3gTd8t9DUSsVVXrj/4iagVakfoB1p
 kCyliCzKCobsKN2cXvPpG7KVsSNW8dgDgAhJfhjg=
Authentication-Results: mail-nwsmtp-smtp-corp-main-44.iva.yp-c.yandex.net;
 dkim=pass header.i=@yandex-team.ru
Message-ID: <2912b2c8-41c2-4a9d-64ac-b3a05e66028f@yandex-team.ru>
Date: Thu, 11 May 2023 13:23:12 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.0
Subject: Re: [PATCH v2] migration: Add documentation for backwards compatiblity
Content-Language: en-US
To: Juan Quintela <quintela@redhat.com>, qemu-devel@nongnu.org
Cc: Leonardo Bras <leobras@redhat.com>, Peter Xu <peterx@redhat.com>,
 Avihai Horon <avihaih@nvidia.com>, Thomas Huth <thuth@redhat.com>,
 Lukas Straub <lukasstraub2@web.de>, =?UTF-8?Q?Alex_Benn=c3=a9e?=
 <alex.bennee@linaro.org>, =?UTF-8?Q?Daniel_P_=2e_Berrang=c3=a9?=
 <berrange@redhat.com>, Markus Armbruster <armbru@redhat.com>
References: <20230511082701.12828-1-quintela@redhat.com>
From: Vladimir Sementsov-Ogievskiy <vsementsov@yandex-team.ru>
In-Reply-To: <20230511082701.12828-1-quintela@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2a02:6b8:c02:900:1:45:d181:df01;
 envelope-from=vsementsov@yandex-team.ru; helo=forwardcorp1b.mail.yandex.net
X-Spam_score_int: -53
X-Spam_score: -5.4
X-Spam_bar: -----
X-Spam_report: (-5.4 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-3.251,
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

On 11.05.23 11:27, Juan Quintela wrote:
> State what are the requeriments to get migration working between qemu
> versions.  And once there explain how one is supposed to implement a
> new feature/default value and not break migration.
> 
> Signed-off-by: Juan Quintela <quintela@redhat.com>

In general looks good to me:

Reviewed-by: Vladimir Sementsov-Ogievskiy <vsementsov@yandex-team.ru>

Some small remarks below.


> 
> ---
> 
> [v2]
> - Add all danp fixes
> 
> [v1]
> 
> I will really appreciate reviews:
> 
> - I don't speak natively .rst format, so let me what I have done
>    wrong.
> 
> - English is not my native language either (no points if had guessed
>    that).

Same for me. Sometimes your wording seems awkward to me, but I don't risk to propose my awkward replacement)

> 
> - This is stuff is obvious to me, so let me when I have assumed
>    things, things that need to be claried, explained better, etc.
> 
> Thanks, Juan.
> ---
>   docs/devel/migration.rst | 214 +++++++++++++++++++++++++++++++++++++++
>   1 file changed, 214 insertions(+)
> 
> diff --git a/docs/devel/migration.rst b/docs/devel/migration.rst
> index 6f65c23b47..1c4da92358 100644
> --- a/docs/devel/migration.rst
> +++ b/docs/devel/migration.rst
> @@ -142,6 +142,220 @@ General advice for device developers
>     may be different on the destination.  This can result in the
>     device state being loaded into the wrong device.
>   
> +How backwards compatibility works
> +---------------------------------
> +
> +When we do migration, we have to qemu process: the source and the

two qemu processes

(also probably we should say QEMU everywhere)

> +target.  There are two cases, they are the same version or they are a
> +different version.  The easy case is when they are the same version.
> +The difficult one is when they are different versions.
> +
> +There are two things that are different, but they have very similar
> +names and sometimes get confused:
> +- qemu version
> +- machine version
> +
> +Let's start with a practical example, we start with:
> +
> +- qemu-system-x86_64 (v5.2), from now on qemu-5.2.
> +- qemu-system-x86_64 (v5.1), from now on qemu-5.1.
> +
> +Related to this are the "latest" machine types defined on each of
> +them:
> +
> +- pc-q35-5.2 (newer one in qemu-5.2) from now on pc-5.2
> +- pc-q35-5.1 (newer one qemu-5.1) from now on pc-5.1

one in qemu-5.1

> +
> +First of all, migration is only supposed to work if you use the same
> +machine type in both source and destination. The qemu hardware
> +configuration needs to be the same also on source and destination.
> +Most aspects of the backend configuration can be changed at will,
> +except for a few cases where the backend features influence frontend
> +device feature exposure.  But that is not relevant for this section.
> +
> +I am going to list the number of combinations that we can have.  Let's
> +start with the trivial ones, qemu is the same on source and
> +destination:
> +
> +1 - qemu-5.2 -M pc-5.2  -> migrates to -> qemu-5.2 -M pc-5.2
> +
> +  This is the latest qemu with the latest machine type.
> +  This have to work, and if it don't work it is a bug.

doesn't

> +
> +2 - qemu-5.1 -M pc-5.1  -> migrates to -> qemu-5.1 -M pc-5.1
> +
> +  Exactly the same case than the previous one, but for 5.1.
> +  Nothing to see here either.
> +
> +This are the easiest ones, we will not talk more about them in this
> +section.
> +
> +Now we start with the more interesting cases.  Let start with the
> +same qemu but not the same machine type.

sounds like "different machine type on source and target" for me..

Maybe, "not latest machine type" ?

> +
> +3 - qemu-5.2 -M pc-5.1  -> migrates to -> qemu-5.2 -M pc-5.1
> +
> +  It needs to use the definition of pc-5.1 and the devices as they
> +  were configured on 5.1, but this should be easy in the sense that
> +  both sides are the same qemu and both sides have exactly the same
> +  idea of what the pc-5.1 machine is.
> +
> +4 - qemu-5.1 -M pc-5.2  -> migrates to -> qemu-5.1 -M pc-5.2
> +
> +  This combination is not possible as the qemu-5.1 don't understand
> +  pc-5.2 machine type.  So nothing to worry here.
> +
> +Now it comes the interesting ones, when both qemus are different.
> +Notice also that the machine type needs to be pc-5.1, because we have
> +the limitation than qemu-5.1 don't know pc-5.2.  So the possible cases
> +are:
> +
> +5 - qemu-5.2 -M pc-5.1  -> migrates to -> qemu-5.1 -M pc-5.1
> +
> +  This migration is known as newer to older.  We need to make sure
> +  when we are developing 5.2 we need to take care about not to break
> +  migration to qemu-5.1.  Notice that we can't make updates to
> +  qemu-5.1 to understand whatever qemu-5.2 decides to change, so it is
> +  in qemu-5.2 side to make the relevant changes.
> +
> +6 - qemu-5.1 -M pc-5.1  -> migrates to -> qemu-5.2 -M pc-5.1
> +
> +  This migration is known as older to newer.  We need to make sure
> +  than we are able to receive migrations from qemu-5.1. The problem is
> +  similar to the previous one.
> +
> +If qemu-5.1 and qemu-5.2 were the same, there will not be any
> +compatibility problems.  But the reason that we create qemu-5.2 is to
> +get new features, devices, defaults, etc.
> +
> +If we get a device that has a new feature, or change a default value,
> +we have a problem when we try to migrate between different qemu
> +versions.
> +
> +So we need a way to tell qemu-5.2 that when we are using machine type
> +pc-5.1, it needs to **not** use the feature, to be able to migrate to
> +real qemu-5.1.
> +
> +And the equivalent part when migrating from qemu-5.1 to qemu-5.2.
> +qemu-5.2 has to expect that it is not going to get data for the new
> +feature, because qemu-5.1 don't know about it.
> +
> +How do we tell qemu about these device feature changes?  In
> +hw/core/machine.c:hw_compat_X_Y arrays.
> +
> +If we change a default value, we need to put back the old value on
> +that array.  And the device, during initialization needs to look at
> +that array to see what value it needs to get for that feature.  And
> +what are we going to put in that array, the value of a property.
> +
> +To create a property for a device, we need to use one of the
> +DEFINE_PROP_*() macros. See include/hw/qdev-properties.h to find the
> +macros that exist.  With it, we set the default value for that
> +property, and that is what it is going to get in the latest released
> +version.  But if we want a different value for a previous version, we
> +can change that in the hw_compat_X_Y arrays.
> +
> +hw_compat_X_Y is an array of registers that have the format:
> +
> +- name_device
> +- name_property
> +- value
> +
> +Let's see a practical example.
> +
> +In qemu-5.2 virtio-blk-device got multi queue support.  This is a
> +change that is not backward compatible.  In qemu-5.1 it has one
> +queue. In qemu-5.2 it has the same number of queues as the number of
> +cpus in the system.
> +
> +When we are doing migration, if we migrate from a device that has 4
> +queues to a device that have only one queue, we don't know where to
> +put the extra information for the other 3 queues, and we fail
> +migration.
> +
> +Similar problem when we migrate from qemu-5.1 that has only one queue
> +to qemu-5.2, we only sent information for one queue, but destination
> +has 4, and we have 3 queues that are not properly initialized and
> +anything can happen.
> +
> +So, how can we address this problem.  Easy, just convince qemu-5.2
> +that when it is running pc-5.1, it needs to set the number of queues
> +for virtio-blk-devices to 1.
> +
> +That way we fix the cases 5 and 6.
> +
> +5 - qemu-5.2 -M pc-5.1  -> migrates to -> qemu-5.1 -M pc-5.1
> +
> +    qemu-5.2 -M pc-5.1 sets number of queues to be 1.
> +    qemu-5.1 -M pc-5.1 expects number of queues to be 1.
> +
> +    correct.  migration works.
> +
> +6 - qemu-5.1 -M pc-5.1  -> migrates to -> qemu-5.2 -M pc-5.1
> +
> +    qemu-5.1 -M pc-5.1 sets number of queues to be 1.
> +    qemu-5.2 -M pc-5.1 expects number of queues to be 1.
> +
> +    correct.  migration works.
> +
> +And now the other interesting case, case 3.  In this case we have:
> +
> +3 - qemu-5.2 -M pc-5.1  -> migrates to -> qemu-5.2 -M pc-5.1
> +
> +    Here we have the same qemu in both sides.  So it doesn't matter a
> +    lot if we have set the number of queues to 1 or not, because
> +    they are the same.
> +
> +    WRONG!
> +
> +    Think what happens if we do one of this double migrations:
> +
> +    A -> migrates -> B -> migrates -> C
> +
> +    where:
> +
> +    A: qemu-5.1 -M pc-5.1
> +    B: qemu-5.2 -M pc-5.1
> +    C: qemu-5.2 -M pc-5.1
> +
> +    migration A -> B is case 6, so number of queues needs to be 1.
> +
> +    migration B -> C is case 3, so we don't care.  But actually we
> +    care because we haven't started the guest in qemu-5.2, it came
> +    migrated from qemu-5.1.  So to be in the safe place, we need to
> +    always use number of queues 1 when we are using pc-5.1.
> +
> +Now, how was this done in reality?  The following commit shows how it
> +was done.
> +
> +commit 9445e1e15e66c19e42bea942ba810db28052cd05
> +Author: Stefan Hajnoczi <stefanha@redhat.com>
> +Date:   Tue Aug 18 15:33:47 2020 +0100
> +
> +    virtio-blk-pci: default num_queues to -smp N
> +
> +The relevant parts for migration are:
> +
> +@@ -1281,7 +1284,8 @@ static Property virtio_blk_properties[] = {
> + #endif
> +     DEFINE_PROP_BIT("request-merging", VirtIOBlock, conf.request_merging, 0,
> +                     true),
> +-    DEFINE_PROP_UINT16("num-queues", VirtIOBlock, conf.num_queues, 1),
> ++    DEFINE_PROP_UINT16("num-queues", VirtIOBlock, conf.num_queues,
> ++                       VIRTIO_BLK_AUTO_NUM_QUEUES),
> +     DEFINE_PROP_UINT16("queue-size", VirtIOBlock, conf.queue_size, 256),
> +
> +It changes the default value of num_queues.  But it fishes it for old
> +machine types to have the right value:
> +
> +@@ -31,6 +31,7 @@
> + GlobalProperty hw_compat_5_1[] = {
> +     ...
> ++    { "virtio-blk-device", "num-queues", "1"},
> +     ...
> + };
> +
> +
>   VMState
>   -------
>   

-- 
Best regards,
Vladimir


