Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2303B2FB47A
	for <lists+qemu-devel@lfdr.de>; Tue, 19 Jan 2021 09:46:58 +0100 (CET)
Received: from localhost ([::1]:53602 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l1mfB-00035I-75
	for lists+qemu-devel@lfdr.de; Tue, 19 Jan 2021 03:46:57 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:35918)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <sgarzare@redhat.com>)
 id 1l1mdp-00025l-Dd
 for qemu-devel@nongnu.org; Tue, 19 Jan 2021 03:45:33 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:57649)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <sgarzare@redhat.com>)
 id 1l1mdk-0007PU-2z
 for qemu-devel@nongnu.org; Tue, 19 Jan 2021 03:45:33 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1611045927;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=W0ePGtB2W2ZpQfB/spt5xBW7vu4BXtFnMIhTwhN+GmU=;
 b=X0YYTUFypZY5Nl0IUYOOVaxIRl2pPD6/243zV2i4BExCk42JPED2L9dESHcYKDVPD+82Cf
 5SvyYTT5GZSWSiU55JVxUSVy6+HVQE39QTpS7kyIDr8tH/5AR0iZDv9frY6cfpamZGPixH
 BFy1mZpAbmvCobOmYLUyNfBUCf3riZs=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-141-e7iIIcBfMWCbNvG12iiHKw-1; Tue, 19 Jan 2021 03:45:25 -0500
X-MC-Unique: e7iIIcBfMWCbNvG12iiHKw-1
Received: by mail-wm1-f69.google.com with SMTP id z12so5585632wmf.9
 for <qemu-devel@nongnu.org>; Tue, 19 Jan 2021 00:45:25 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=W0ePGtB2W2ZpQfB/spt5xBW7vu4BXtFnMIhTwhN+GmU=;
 b=nGCJy8RkjyXJh1zVXIwBij3/j9d2OsWgBuJi7g1PvvpLXZ9w24VsEqY2wgoG4Ab3Em
 CeIrz8sckXyEYerpgVfxokJwPkdSvUHu/Wj/FMDsdzOZg2ZkXmr0JXrwf8z3l3Z453TR
 nvEJ0w+XBUlCIqS84gZOAk9az4hPtSoVKROSj/2jCmLyKXeywLQov8kPy6RRcW2p+7SF
 BUUxd42shMoaeTNovrMUlMP7OckW9rh92e1nUtnZHR81EH5Xia3C1ZXlQloY7TGH4uhk
 VvaRoeQr2b85bXEMcnmFl4ON/BntaPCXl0ogJA8E9HRhm8abeyE9zRpqpg+thmUTcdI3
 tjkA==
X-Gm-Message-State: AOAM531X3J+YMXdoHhWRKZjNgkbHJT7Yl4S50YeAIOWGvJBziz1l7c8x
 T1JlTPQrTQZiV9Satx44fLrfAL5OpSW6GOIN6OV4Dk+mLsLn9j535PiGH7u6F2xFDFrnxpo3mFO
 Qfb1QNQNFvVvVXQQ=
X-Received: by 2002:adf:82c5:: with SMTP id 63mr3281535wrc.38.1611045924096;
 Tue, 19 Jan 2021 00:45:24 -0800 (PST)
X-Google-Smtp-Source: ABdhPJx1mSW69NsRevdA4J1lL8JO3W2J5ksXGvwA9MgQpYYB9NwwB0EEg13DUnbyPekS2EnXPgwYWg==
X-Received: by 2002:adf:82c5:: with SMTP id 63mr3281449wrc.38.1611045922910;
 Tue, 19 Jan 2021 00:45:22 -0800 (PST)
Received: from steredhat (host-79-34-249-199.business.telecomitalia.it.
 [79.34.249.199])
 by smtp.gmail.com with ESMTPSA id f68sm3749448wmf.6.2021.01.19.00.45.21
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 19 Jan 2021 00:45:22 -0800 (PST)
Date: Tue, 19 Jan 2021 09:45:19 +0100
From: Stefano Garzarella <sgarzare@redhat.com>
To: "Dr. David Alan Gilbert" <dgilbert@redhat.com>
Subject: Re: [PATCH] virtio: move 'use-disabled-flag' property to hw_compat_4_2
Message-ID: <20210119084519.a7lkqmmudu4n4em5@steredhat>
References: <20210108171252.209502-1-sgarzare@redhat.com>
 <20210118160312.GB9899@work-vm>
MIME-Version: 1.0
In-Reply-To: <20210118160312.GB9899@work-vm>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=sgarzare@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Disposition: inline
Received-SPF: pass client-ip=216.205.24.124; envelope-from=sgarzare@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.175,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: Eduardo Habkost <ehabkost@redhat.com>, Juan Quintela <quintela@redhat.com>,
 qemu-stable@nongnu.org, "Michael S. Tsirkin" <mst@redhat.com>,
 mdroth@linux.vnet.ibm.com, qemu-devel@nongnu.org,
 Jing Zhao <jinzhao@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Mon, Jan 18, 2021 at 04:03:12PM +0000, Dr. David Alan Gilbert wrote:
>* Stefano Garzarella (sgarzare@redhat.com) wrote:
>> Commit 9d7bd0826f introduced a new 'use-disabled-flag' property
>> set to true by default.
>> To allow the migration, we set this property to false in the hw_compat,
>> but in the wrong place (hw_compat_4_1).
>>
>> Since commit 9d7bd0826f was released with QEMU 5.0, we move
>> 'use-disabled-flag' property to hw_compat_4_2, so 4.2 machine types
>> will have the pre-patch behavior and the migration can work.
>
>Be a little careful that fixing this probably causes a migration from
>5.2->6.0 to fail with this machine type;  so when we do these
>type of fixes we often fix an old machine type between some pair of qemu
>versions and then break it between a different set.

Good point!

I did some tests using the example below always using pc-q35-4.2 and it 
seems that works well:

- 5.2 -> 6.0    pass
- 5.2 -> 4.2            FAIL
- 6.0 -> 5.2    pass
- 6.0 -> 4.2    pass
- 4.2 -> 5.2    pass
- 4.2 -> 6.0    pass

Should I run some more tests?

Thanks,
Stefano

>
>Dave
>
>> The issue was discovered with vhost-vsock device and 4.2 machine
>> type without running any kernel in the VM:
>>     $ qemu-4.2 -M pc-q35-4.2,accel=kvm \
>>         -device vhost-vsock-pci,guest-cid=4 \
>>         -monitor stdio -incoming tcp:0:3333
>>
>>     $ qemu-5.2 -M pc-q35-4.2,accel=kvm \
>>         -device vhost-vsock-pci,guest-cid=3 \
>>         -monitor stdio
>>     (qemu) migrate -d tcp:0:3333
>>
>>     # qemu-4.2 output
>>     qemu-system-x86_64: Failed to load virtio-vhost_vsock:virtio
>>     qemu-system-x86_64: error while loading state for instance 0x0 of device '0000:00:03.0/virtio-vhost_vsock'
>>     qemu-system-x86_64: load of migration failed: No such file or directory
>>
>> Reported-by: Jing Zhao <jinzhao@redhat.com>
>> Buglink: https://bugzilla.redhat.com/show_bug.cgi?id=1907255
>> Fixes: 9d7bd0826f ("virtio-pci: disable vring processing when bus-mastering is disabled")
>> Cc: mdroth@linux.vnet.ibm.com
>> CC: qemu-stable@nongnu.org
>> Signed-off-by: Stefano Garzarella <sgarzare@redhat.com>
>> ---
>>  hw/core/machine.c | 2 +-
>>  1 file changed, 1 insertion(+), 1 deletion(-)
>>
>> diff --git a/hw/core/machine.c b/hw/core/machine.c
>> index de3b8f1b31..5d6163ab70 100644
>> --- a/hw/core/machine.c
>> +++ b/hw/core/machine.c
>> @@ -70,12 +70,12 @@ GlobalProperty hw_compat_4_2[] = {
>>      { "qxl", "revision", "4" },
>>      { "qxl-vga", "revision", "4" },
>>      { "fw_cfg", "acpi-mr-restore", "false" },
>> +    { "virtio-device", "use-disabled-flag", "false" },
>>  };
>>  const size_t hw_compat_4_2_len = G_N_ELEMENTS(hw_compat_4_2);
>>
>>  GlobalProperty hw_compat_4_1[] = {
>>      { "virtio-pci", "x-pcie-flr-init", "off" },
>> -    { "virtio-device", "use-disabled-flag", "false" },
>>  };
>>  const size_t hw_compat_4_1_len = G_N_ELEMENTS(hw_compat_4_1);
>>
>> --
>> 2.26.2
>>
>-- 
>Dr. David Alan Gilbert / dgilbert@redhat.com / Manchester, UK
>


