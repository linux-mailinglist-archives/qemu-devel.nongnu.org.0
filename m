Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 581992CBA9A
	for <lists+qemu-devel@lfdr.de>; Wed,  2 Dec 2020 11:34:23 +0100 (CET)
Received: from localhost ([::1]:42450 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kkPSn-0007nQ-P7
	for lists+qemu-devel@lfdr.de; Wed, 02 Dec 2020 05:34:21 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:48758)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <quintela@redhat.com>)
 id 1kkPBG-0005x9-BC
 for qemu-devel@nongnu.org; Wed, 02 Dec 2020 05:16:14 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:57396)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <quintela@redhat.com>)
 id 1kkPBC-0002y9-QN
 for qemu-devel@nongnu.org; Wed, 02 Dec 2020 05:16:13 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1606904169;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:in-reply-to:in-reply-to:  references:references;
 bh=CDocI0NCgvfDMuz+T5TDWXOHIrX9059eU4iTtGGyhIA=;
 b=MkF2M5f4A6oBy3j8sGWB6X/qiFbcEguiJn6mD7rpMXb6e9wVnXpx4W8rsh2ysjpjyXOl9K
 tIZBOSW5mfhX+/ORF4eEflHUM3Uz8WIQg5wxN01hhMfEK6BHq6e05RbMUyMGl7vkjtps7R
 aDglO5KCjvrCCXlyQRNmXI2/izhO8hc=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-454-LnlWDbIfOoe19Is5dXfbiw-1; Wed, 02 Dec 2020 05:16:08 -0500
X-MC-Unique: LnlWDbIfOoe19Is5dXfbiw-1
Received: by mail-wm1-f70.google.com with SMTP id f12so2719552wmf.6
 for <qemu-devel@nongnu.org>; Wed, 02 Dec 2020 02:16:07 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:in-reply-to:references
 :user-agent:reply-to:date:message-id:mime-version;
 bh=CDocI0NCgvfDMuz+T5TDWXOHIrX9059eU4iTtGGyhIA=;
 b=cHNpcbD/wIe/M019ENnn4uuoFNg/610ajOP6yd8lRYQGbVo2v5SpQiO0ShiX4V107q
 J6W7BHumR8L9PnUPQfpkhA8mZbE6OlVBSmZycx4MW4KHfeHnGL9x+Iq1k1mP9psRTGc4
 DY3zF6v9rzdRT4JLkE16o4nBNHp+ZDjwhX5U2ZVw2pFLUb+jXLBOM74JUOFenOFf2cuR
 IiunPoEdsEdMVV4he8AkQvq4+mlOdysUI6Qfrga4051EGK+eSJxe4seh5aQJOgZo8zUe
 q9f18C3mqjjwCo+7djcLuW5D5a74M29qmUEe0qykxpaZ+hbvb9lEkypAPjQ+hIBU5uD8
 z1YQ==
X-Gm-Message-State: AOAM530/T/eeVOvF6c9UIiHvyXW0cbpK74lz6V10KhYJrUwft3Qo0hUm
 AkZowmiY8d1yAc6FynbR5cB/ViAsWYwPz2E2IIm9yjcyXpB1PM7eYQ+MAlyujbhS3C4O2z9rdSi
 fDgYVoDjzMZE3dFY=
X-Received: by 2002:a1c:e901:: with SMTP id q1mr2343945wmc.148.1606904166076; 
 Wed, 02 Dec 2020 02:16:06 -0800 (PST)
X-Google-Smtp-Source: ABdhPJzvxN8PnXjP9cV4UNTa0LR9OmmV+7xyd8/vHbvGRJSgHiZAUM9QqOwpFBLLxfdeWFjvNVLj0w==
X-Received: by 2002:a1c:e901:: with SMTP id q1mr2343932wmc.148.1606904165906; 
 Wed, 02 Dec 2020 02:16:05 -0800 (PST)
Received: from localhost (trasno.trasno.org. [83.165.45.250])
 by smtp.gmail.com with ESMTPSA id i5sm1526516wrw.45.2020.12.02.02.16.05
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 02 Dec 2020 02:16:05 -0800 (PST)
From: Juan Quintela <quintela@redhat.com>
To: "Michael S. Tsirkin" <mst@redhat.com>
Subject: Re: [PATCH v2 00/27] Virtio net failover fixes
In-Reply-To: <20201118035209-mutt-send-email-mst@kernel.org> (Michael
 S. Tsirkin's message of "Wed, 18 Nov 2020 03:53:39 -0500")
References: <20201118083748.1328-1-quintela@redhat.com>
 <20201118035209-mutt-send-email-mst@kernel.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.1 (gnu/linux)
Date: Wed, 02 Dec 2020 11:16:04 +0100
Message-ID: <87r1o8ldi3.fsf@secure.mitica>
MIME-Version: 1.0
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=quintela@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain
Received-SPF: pass client-ip=63.128.21.124; envelope-from=quintela@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -35
X-Spam_score: -3.6
X-Spam_bar: ---
X-Spam_report: (-3.6 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1.497,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Reply-To: quintela@redhat.com
Cc: "Daniel P. =?utf-8?Q?Berrang=C3=A9?=" <berrange@redhat.com>,
 Eduardo Habkost <ehabkost@redhat.com>, Jason Wang <jasowang@redhat.com>,
 qemu-devel@nongnu.org, "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

"Michael S. Tsirkin" <mst@redhat.com> wrote:
> On Wed, Nov 18, 2020 at 09:37:21AM +0100, Juan Quintela wrote:
>> Hi
>> 
>> This is a big rework of the network failover setup.  General idea is:
>> * We don't cache the name of the primary/standby devices
>>   We have several problems there with stale pointers
>> * After this:
>> - We can always remove either the primary/standby devices without trouble
>> - Pluggin/unplugging works
>> - We go to device opts to see what the failover device are.
>>   Notice that we are plugging/unplugging the device, so it is not critical.
>> - Once there, I "fixed" managedsave for libvirt (now gives an error instead o=
>> f just hanging)
>> * Fields not cached anymore:
>> - primary_device_dict
>> - primary_device_opts
>> - standby_id
>> - primary_device_id
>> - primary_dev
>> * I renamed the should_be_hidden() callback to hide device, but if
>>   people preffer the old name I can leave it.
>> * Add (some) doc to some functions
>> * Remove almost 100 lines of code while fixing things.
>> 
>> Please review.
>
> OK that's great, any of this appropriate for 5.2?
> The memory leak fix maybe?

1st one is also a fix, current code just hangs the guest.
Rest of things .... current code fails a lot, but we are too late on the
cycle.

Later, Juan.


>> Later, Juan.
>> 
>> Juan Quintela (27):
>>   migration: Network Failover can't work with a paused guest
>>   failover: fix indentantion
>>   failover: Use always atomics for primary_should_be_hidden
>>   failover: primary bus is only used once, and where it is set
>>   failover: Remove unused parameter
>>   failover: Remove external partially_hotplugged property
>>   failover: qdev_device_add() returns err or dev set
>>   failover: Rename bool to failover_primary_hidden
>>   failover: g_strcmp0() knows how to handle NULL
>>   failover: Remove primary_device_opts
>>   failover: remove standby_id variable
>>   failover: Remove primary_device_dict
>>   failover: Remove memory leak
>>   failover: simplify virtio_net_find_primary()
>>   failover: should_be_hidden() should take a bool
>>   failover: Rename function to hide_device()
>>   failover: virtio_net_connect_failover_devices() does nothing
>>   failover: Rename to failover_find_primary_device()
>>   failover: simplify qdev_device_add() failover case
>>   failover: simplify qdev_device_add()
>>   failover: make sure that id always exist
>>   failover: remove failover_find_primary_device() error parameter
>>   failover: split failover_find_primary_device_id()
>>   failover: We don't need to cache primary_device_id anymore
>>   failover: Caller of this two functions already have primary_dev
>>   failover: simplify failover_unplug_primary
>>   failover: Remove primary_dev member
>> 
>>  include/hw/qdev-core.h         |  28 ++--
>>  include/hw/virtio/virtio-net.h |   9 +-
>>  hw/core/qdev.c                 |  19 +--
>>  hw/net/virtio-net.c            | 298 +++++++++++++--------------------
>>  migration/migration.c          |  13 ++
>>  softmmu/qdev-monitor.c         |  43 ++---
>>  6 files changed, 167 insertions(+), 243 deletions(-)
>> 
>> --=20
>> 2.26.2
>> 


