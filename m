Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E42203735D1
	for <lists+qemu-devel@lfdr.de>; Wed,  5 May 2021 09:47:57 +0200 (CEST)
Received: from localhost ([::1]:34760 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1leCGD-0003g1-1B
	for lists+qemu-devel@lfdr.de; Wed, 05 May 2021 03:47:57 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54640)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lvivier@redhat.com>)
 id 1leCEk-0003Eg-Vb
 for qemu-devel@nongnu.org; Wed, 05 May 2021 03:46:26 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:60483)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lvivier@redhat.com>)
 id 1leCEj-0008Pg-Bv
 for qemu-devel@nongnu.org; Wed, 05 May 2021 03:46:26 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1620200783;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=wRAM1+4f8/igxXYGfSWEUvb7q0pFRAed5CFKrYYecB8=;
 b=ZaNRBpmoHMk2SMiGVSjkW2slyFitu3eaNxpKV2kpzQbixGLKTxGGDD4A6Vj4FQxVNbikga
 H5dfpFc+nzdO7qmOMWFa0wJR7156+pAVs4qBoQbklXgC+gE68aLsJdlKgf6yeNFK9gVOfM
 07dOp5KM2TtyiElMiGo1duRsz7BUKwE=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-595-1-RlL0p4NDON10xbXQcYpg-1; Wed, 05 May 2021 03:46:22 -0400
X-MC-Unique: 1-RlL0p4NDON10xbXQcYpg-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 75251654
 for <qemu-devel@nongnu.org>; Wed,  5 May 2021 07:46:21 +0000 (UTC)
Received: from [10.36.114.90] (ovpn-114-90.ams2.redhat.com [10.36.114.90])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 00D4D5D9D5;
 Wed,  5 May 2021 07:46:15 +0000 (UTC)
Subject: Re: [PATCH] virtio-net: failover: add missing
 remove_migration_state_change_notifier()
To: Jason Wang <jasowang@redhat.com>, "Michael S. Tsirkin" <mst@redhat.com>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>
References: <20210427135147.111218-1-lvivier@redhat.com>
 <YIgZetbn+10YDdeu@work-vm> <20210428061348-mutt-send-email-mst@kernel.org>
 <2387a23c-667c-d905-0058-51e48f9be2f4@redhat.com>
From: Laurent Vivier <lvivier@redhat.com>
Message-ID: <73e2fa26-b7d8-ad29-b9e9-4885a526882e@redhat.com>
Date: Wed, 5 May 2021 09:46:14 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <2387a23c-667c-d905-0058-51e48f9be2f4@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=lvivier@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=lvivier@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.697,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001,
 RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Igor Mammedov <imammedo@redhat.com>, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 29/04/2021 09:26, Jason Wang wrote:
> 
> 在 2021/4/28 下午6:14, Michael S. Tsirkin 写道:
>> On Tue, Apr 27, 2021 at 03:02:34PM +0100, Dr. David Alan Gilbert wrote:
>>> * Laurent Vivier (lvivier@redhat.com) wrote:
>>>> In the failover case configuration, virtio_net_device_realize() uses an
>>>> add_migration_state_change_notifier() to add a state notifier, but this
>>>> notifier is not removed by the unrealize function when the virtio-net
>>>> card is unplugged.
>>>>
>>>> If the card is unplugged and a migration is started, the notifier is
>>>> called and as it is not valid anymore QEMU crashes.
>>>>
>>>> This patch fixes the problem by adding the
>>>> remove_migration_state_change_notifier() in virtio_net_device_unrealize().
>>>>
>>>> The problem can be reproduced with:
>>>>
>>>>    $ qemu-system-x86_64 -enable-kvm -m 1g -M q35 \
>>>>      -device pcie-root-port,slot=4,id=root1 \
>>>>      -device pcie-root-port,slot=5,id=root2 \
>>>>      -device virtio-net-pci,id=net1,mac=52:54:00:6f:55:cc,failover=on,bus=root1 \
>>>>      -monitor stdio disk.qcow2
>>>>    (qemu) device_del net1
>>>>    (qemu) migrate "exec:gzip -c > STATEFILE.gz"
>>>>
>>>>    Thread 1 "qemu-system-x86" received signal SIGSEGV, Segmentation fault.
>>>>    0x0000000000000000 in ?? ()
>>>>    (gdb) bt
>>>>    #0  0x0000000000000000 in  ()
>>>>    #1  0x0000555555d726d7 in notifier_list_notify (...)
>>>>        at .../util/notify.c:39
>>>>    #2  0x0000555555842c1a in migrate_fd_connect (...)
>>>>        at .../migration/migration.c:3975
>>>>    #3  0x0000555555950f7d in migration_channel_connect (...)
>>>>        error@entry=0x0) at .../migration/channel.c:107
>>>>    #4  0x0000555555910922 in exec_start_outgoing_migration (...)
>>>>        at .../migration/exec.c:42
>>>>
>>>> Reported-by: Igor Mammedov <imammedo@redhat.com>
>>>> Signed-off-by: Laurent Vivier <lvivier@redhat.com>
>>> Yep, I think that's OK.
>>>
>>>
>>> Reviewed-by: Dr. David Alan Gilbert <dgilbert@redhat.com>
>> Reviewed-by: Michael S. Tsirkin <mst@redhat.com>
>>
>> net stuff so I expect Jason will merge this ...
> 
> 
> Ok, I've queued this.

Thank you.

Any idea when the PR will be sent?

Thanks,
Laurent


