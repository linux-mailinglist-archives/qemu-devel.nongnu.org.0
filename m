Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E5A8E41E7C6
	for <lists+qemu-devel@lfdr.de>; Fri,  1 Oct 2021 08:50:47 +0200 (CEST)
Received: from localhost ([::1]:46944 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mWCNZ-0008MX-N5
	for lists+qemu-devel@lfdr.de; Fri, 01 Oct 2021 02:50:45 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59616)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lvivier@redhat.com>)
 id 1mWCLB-0007Z0-VE
 for qemu-devel@nongnu.org; Fri, 01 Oct 2021 02:48:19 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:43492)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lvivier@redhat.com>)
 id 1mWCL6-0001LM-FL
 for qemu-devel@nongnu.org; Fri, 01 Oct 2021 02:48:17 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1633070890;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=ff/2YViCFxJW2ajFTUw2nG/ZiWCfbIiCwhdQhQi8I9U=;
 b=NOrARB7ZgeCee37JFsJM7f9/kQtDkX8ErthNAQ4Yi9jKa3GOn0Qv1ZCCnp+5pDsytlFiP0
 J6tJvvLwTF4B8yOFPOJBBtGYImYPQLDiGrkCwu7ms2hGaTHm1KdxZGIj1mg4kMaTagACFW
 4FaN3Muh6CKLCxI0tycmNvhUM+tCBlY=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-547-mh6oI7clN16MP-mwPeb_mg-1; Fri, 01 Oct 2021 02:48:09 -0400
X-MC-Unique: mh6oI7clN16MP-mwPeb_mg-1
Received: by mail-wm1-f70.google.com with SMTP id
 d12-20020a1c730c000000b0030b4e0ecf5dso2782813wmb.9
 for <qemu-devel@nongnu.org>; Thu, 30 Sep 2021 23:48:09 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=ff/2YViCFxJW2ajFTUw2nG/ZiWCfbIiCwhdQhQi8I9U=;
 b=fNeJdHr17TOeeluIFd1HossqUpLqdqj4cnBl8IT7Tzq2McdTWTM+iQXPkgdw60DFaq
 SpHG9ZHZsyKwICPhhNA0Bqm5MBSzRKV3oMyCwRd4uiL2oS0Z6wujDsTBCzZHV320vJVW
 odjswZ48PQSkCouxpJY5FW7hhlI0S7qCqdSImbD4edQDIpoXaJkuLg/NJOFjo/MI7co4
 VCDpyDqr2FDGKaiMX80Nm2SsBPUbyNrbmJ0UApsEwfrra/Zx1mrU0rnoWiKPBIVHlyLF
 TNscdzANbjrOZI6KCvpj6+ZbHu/RiiBAChuADKgQr4zUUyD0ZuK8H1fY8mSLY9M018KO
 iTfQ==
X-Gm-Message-State: AOAM533fPIvymLSvaER8C7PXPnwwe2u7HIj9RZVJGGOCgHBhBtHroxlS
 /oMS2y7ADhtQtQDrbbR03Z9anWOqT4e9IvP+gyZzHY5tyYsYIjn3K4TW4tLHB4NwU8S6Sa2vfO6
 jynZz+Ep2lq45HFY=
X-Received: by 2002:adf:d1c5:: with SMTP id b5mr10568645wrd.252.1633070888238; 
 Thu, 30 Sep 2021 23:48:08 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzeMH+WlUcC2HfgSbtgHhU9U8Paodca7yv/+fBhBLjyp0HF+b0wGA9gcSgvZxHrzP9K6qKQjA==
X-Received: by 2002:adf:d1c5:: with SMTP id b5mr10568615wrd.252.1633070887986; 
 Thu, 30 Sep 2021 23:48:07 -0700 (PDT)
Received: from [192.168.100.42] ([82.142.21.142])
 by smtp.gmail.com with ESMTPSA id m5sm5851758wms.41.2021.09.30.23.48.06
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 30 Sep 2021 23:48:07 -0700 (PDT)
Message-ID: <d66ef0ad-5913-6514-59a9-5274ca1ae76e@redhat.com>
Date: Fri, 1 Oct 2021 08:48:06 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.1.0
Subject: Re: [PATCH] failover: allow to pause the VM during the migration
To: Laine Stump <laine@redhat.com>, qemu-devel@nongnu.org
References: <20210930170926.1298118-1-lvivier@redhat.com>
 <f1898bf0-dadb-4e2e-a45a-9087d2c63678@redhat.com>
From: Laurent Vivier <lvivier@redhat.com>
In-Reply-To: <f1898bf0-dadb-4e2e-a45a-9087d2c63678@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=lvivier@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=lvivier@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -38
X-Spam_score: -3.9
X-Spam_bar: ---
X-Spam_report: (-3.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-1.127, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001,
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
Cc: Peter Krempa <pkrempa@redhat.com>,
 "Daniel P. Berrange" <berrange@redhat.com>,
 Juan Quintela <quintela@redhat.com>, Libvirt <libvir-list@redhat.com>,
 Jason Wang <jasowang@redhat.com>, "Michael S. Tsirkin" <mst@redhat.com>,
 Markus Armbruster <armbru@redhat.com>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 Jiri Denemark <jdenemar@redhat.com>, Eric Blake <eblake@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 30/09/2021 22:17, Laine Stump wrote:
> On 9/30/21 1:09 PM, Laurent Vivier wrote:
>> If we want to save a snapshot of a VM to a file, we used to follow the
>> following steps:
>>
>> 1- stop the VM:
>>     (qemu) stop
>>
>> 2- migrate the VM to a file:
>>     (qemu) migrate "exec:cat > snapshot"
>>
>> 3- resume the VM:
>>     (qemu) cont
>>
>> After that we can restore the snapshot with:
>>    qemu-system-x86_64 ... -incoming "exec:cat snapshot"
>>    (qemu) cont
> 
> This is the basics of what libvirt does for a snapshot, and steps 1+2 are what it does for 
> a "managedsave" (where it saves the snapshot to disk and then terminates the qemu process, 
> for later re-animation).
> 
> In those cases, it seems like this new parameter could work for us - instead of explicitly 
> pausing the guest prior to migrating it to disk, we would set this new parameter to on, 
> then directly migrate-to-disk (relying on qemu to do the pause). Care will need to be 
> taken to assure that error recovery behaves the same though.

In case of error, the VM is restarted like it's done for a standard migration. I can 
change that if you need.

An other point is the VM state sent to the migration stream is "paused", it means that 
machine needs to be resumed after the stream is loaded (from the file or on destination in 
the case of a real migration), but it can be also changed to be "running" so the machine 
will be resumed automatically at the end of the file loading (or real migration)

> There are a couple of cases when libvirt apparently *doesn't* pause the guest during the 
> migrate-to-disk, both having to do with saving a coredump of the guest. Since I really 
> have no idea of how common/important that is (or even if my assessment of the code is 
> correct), I'm Cc'ing this patch to libvir-list to make sure it catches the attention of 
> someone who knows the answers and implications.

It's an interesting point I need to test and think about: in case of a coredump I guess 
the machine is crashed and doesn't answer to the unplug request and so the failover unplug 
cannot be done. For the moment the migration will hang until it is canceled. IT can be 
annoying if we want to debug the cause of the crash...

> 
>> But when failover is configured, it doesn't work anymore.
>>
>> As the failover needs to ask the guest OS to unplug the card
>> the machine cannot be paused.
>>
>> This patch introduces a new migration parameter, "pause-vm", that
>> asks the migration to pause the VM during the migration startup
>> phase after the the card is unplugged.
>>
>> Once the migration is done, we only need to resume the VM with
>> "cont" and the card is plugged back:
>>
>> 1- set the parameter:
>>     (qemu) migrate_set_parameter pause-vm on
>>
>> 2- migrate the VM to a file:
>>     (qemu) migrate "exec:cat > snapshot"
>>
>>     The primary failover card (VFIO) is unplugged and the VM is paused.
>>
>> 3- resume the VM:
>>     (qemu) cont
>>
>>     The VM restarts and the primary failover card is plugged back
>>
>> The VM state sent in the migration stream is "paused", it means
>> when the snapshot is loaded or if the stream is sent to a destination
>> QEMU, the VM needs to be resumed manually.
>>
>> Signed-off-by: Laurent Vivier <lvivier@redhat.com>
>> ---
>>   qapi/migration.json            | 20 +++++++++++++++---
>>   include/hw/virtio/virtio-net.h |  1 +
>>   hw/net/virtio-net.c            | 33 ++++++++++++++++++++++++++++++
>>   migration/migration.c          | 37 +++++++++++++++++++++++++++++++++-
>>   monitor/hmp-cmds.c             |  8 ++++++++
>>   5 files changed, 95 insertions(+), 4 deletions(-)
>>
...

Thanks,
Laurent


