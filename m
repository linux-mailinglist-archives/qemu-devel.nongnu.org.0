Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B189B6FEDA8
	for <lists+qemu-devel@lfdr.de>; Thu, 11 May 2023 10:14:47 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1px1No-0008PR-75; Thu, 11 May 2023 04:10:40 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1px1Nj-0008IZ-Ks
 for qemu-devel@nongnu.org; Thu, 11 May 2023 04:10:37 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1px1Ng-0002Pv-Ld
 for qemu-devel@nongnu.org; Thu, 11 May 2023 04:10:34 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1683792631;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:in-reply-to:in-reply-to:  references:references;
 bh=VB43H8Q4SkXxnJ8uYuZXGbCJvm7RhEguWebTsltRs7A=;
 b=JKT5XraIpgeNBYfiK2jmr5qWBul2FAieueOdhOj8PC2MjyCGK3hXJBCvESrfdsqowNKzqQ
 f+Ov8wmdHEeEnkFpbTv/bNadolm37HkxvFgDSUSpKMS7MHa1xqXMhcdfsBJT2lCaoNxWqw
 Sk6sC4mrwIqKtAy7pfES77MehBsx5As=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-222-g39MeMq_NtaLpzT4Er5uqg-1; Thu, 11 May 2023 04:10:27 -0400
X-MC-Unique: g39MeMq_NtaLpzT4Er5uqg-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.rdu2.redhat.com
 [10.11.54.4])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 728EB2808E67;
 Thu, 11 May 2023 08:10:27 +0000 (UTC)
Received: from redhat.com (unknown [10.42.28.109])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id A43092026D16;
 Thu, 11 May 2023 08:10:25 +0000 (UTC)
Date: Thu, 11 May 2023 09:10:23 +0100
From: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
To: Juan Quintela <quintela@redhat.com>
Cc: qemu-devel@nongnu.org, Lukas Straub <lukasstraub2@web.de>,
 Vladimir Sementsov-Ogievskiy <vsementsov@yandex-team.ru>,
 Avihai Horon <avihaih@nvidia.com>,
 Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Leonardo Bras <leobras@redhat.com>, Thomas Huth <thuth@redhat.com>,
 Peter Xu <peterx@redhat.com>, Markus Armbruster <armbru@redhat.com>
Subject: Re: [PATCH] migration: Add documentation for backwards compatiblity
Message-ID: <ZFyi73w855EsDmEy@redhat.com>
References: <20230510195341.7591-1-quintela@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20230510195341.7591-1-quintela@redhat.com>
User-Agent: Mutt/2.2.9 (2022-11-12)
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.4
Received-SPF: pass client-ip=170.10.133.124; envelope-from=berrange@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Reply-To: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

On Wed, May 10, 2023 at 09:53:41PM +0200, Juan Quintela wrote:
> State what are the requeriments to get migration working between qemu
> versions.  And once there explain how one is supposed to implement a
> new feature/default value and not break migration.
> 
> Signed-off-by: Juan Quintela <quintela@redhat.com>
> 
> ---
> 
> Hi
> 
> I will really appreciate reviews:
> 
> - I don't speak natively .rst format, so let me what I have done
>   wrong.
> 
> - English is not my native language either (no points if had guessed
>   that).
> 
> - This is stuff is obvious to me, so let me when I have assumed
>   things, things that need to be claried, explained better, etc.
> 
> Thanks, Juan.
> ---
>  docs/devel/migration.rst | 212 +++++++++++++++++++++++++++++++++++++++
>  1 file changed, 212 insertions(+)
> 
> diff --git a/docs/devel/migration.rst b/docs/devel/migration.rst
> index 6f65c23b47..daa510da42 100644
> --- a/docs/devel/migration.rst
> +++ b/docs/devel/migration.rst
> @@ -142,6 +142,218 @@ General advice for device developers
>    may be different on the destination.  This can result in the
>    device state being loaded into the wrong device.
>  
> +How backwards compatibility work

s/work/works/

> +--------------------------------
> +
> +When we do migration, we have to qemus: source and target qemu.  There

'have two qemu process, the source and the target'

> +are two cases, they are the same version or they are a different
> +version.  The easy case is when they are the same version.  The
> +difficult one is when they are different versions.
> +
> +There are two things that are different, but they have very similar
> +names and sometimes get confused:
> +- qemu version
> +- machine version
> +
> +Let's start with a practical example, we start with:
> +
> +- qemu-system-x86_64 (v5.2), from now one qemu-5.2.
> +- qemu-system-x86_64 (v5.1), from now one qemu-5.1.

s/one/on/

> +Related to this are the "latest" machine types defined on each of
> +them:
> +
> +- pc-q35-5.2 (newer one in qemu-5.2) from now on pc-5.2
> +- pc-q35-5.1 (newer one qemu-5.1) from now on pc-5.1
> +
> +First of all, migration is only supposed to work if you use the same
> +machine type in both source and destination. The qemu configuration

s/configuration/hardware configuration/ - most aspects of the backend
configuration can be changed at will, except for a few cases where
the backend features influence frontend device feature exposure.

> +needs to be the same also on source and destination.  But that is not
> +relevant for this section.
> +
> +I am going to list the number of combinations that we can have.  Let's
> +start with the trivial ones, qemu is the same on source and
> +destination:
> +
> +1 - qemu-5.2 -M pc-5.2  -> migrates to -> qemu-5.2 -M pc-5.2
> +
> +  This is the latest qemu with the latest machine type.
> +  This have to work, and if it don't work it is a bug.
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
> +If we get a device that get a new feature, or change a default value,

s/get a new/has a new/

> +we have a problem when we try to migrate between different qemu
> +versions.
> +
> +So we need a way to tell qemu-5.2 than when we are using machine type

s/than when/that when/

> +pc-5.1, it needs to **not** use the feature, to be able to migrate to
> +read qemu-5.1.

s/read/real/

> +
> +And the equivalent part when migrating from qemu-5.1 to qemu-5.2.
> +qemu-5.2 have to expect that it is not going to get data for the new

s/have/has/

> +feature, because qemu-5.1 don't know about it.
> +
> +How do we tell qemu about this device feature changes?  In

s/this/these/

> +hw/core/machine.c:hw_compat_X_Y arrays.
> +
> +If we change a default value, we need to put back the old value on

s/on that array/in that array/

> +that array.  And the device, during initialization needs to look at
> +that array to see what value it needs to get for that feature.  And
> +what are we going to put on that array, the value of a property.
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
> +queue. In qemu-5.2 it has the same number of queues than the number of

s/than the number/as the number/

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
> +    Here we have the same qemu in both sides.  So it don't matter a

s/don't/doesn't/

> +    lot if we have setup the number of queues to 1 or not, because

s/setup/set/

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
>  VMState
>  -------
>  
> -- 
> 2.40.1
> 

With regards,
Daniel
-- 
|: https://berrange.com      -o-    https://www.flickr.com/photos/dberrange :|
|: https://libvirt.org         -o-            https://fstop138.berrange.com :|
|: https://entangle-photo.org    -o-    https://www.instagram.com/dberrange :|


