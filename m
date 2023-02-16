Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 10B196992E5
	for <lists+qemu-devel@lfdr.de>; Thu, 16 Feb 2023 12:14:42 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pScDb-00057P-C8; Thu, 16 Feb 2023 06:14:27 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1pScDZ-00057G-Ts
 for qemu-devel@nongnu.org; Thu, 16 Feb 2023 06:14:25 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1pScDY-00054D-Cl
 for qemu-devel@nongnu.org; Thu, 16 Feb 2023 06:14:25 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1676546063;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=1UMq2loQQItk0lCl5kRHC9SPvB7wjbaP0SHuowtMrFw=;
 b=NUH1doNB+dbvQeplVSS3CSe3YKBkATy05jNc/cT3ssF9kMnJii/imJgWrfPXQw/mkIB6RI
 djtFbn2clxrX42yVbOFIrg4qHvQ8qxsvRczGxl33poRqX/lGmPcyJU6jBxGnikvwJC490v
 5y1q9wlcI/UcNO/StC6kV/G35zZHgf4=
Received: from mail-qv1-f72.google.com (mail-qv1-f72.google.com
 [209.85.219.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-645-HJCzeydhMOSZuE6_H5pASQ-1; Thu, 16 Feb 2023 06:14:22 -0500
X-MC-Unique: HJCzeydhMOSZuE6_H5pASQ-1
Received: by mail-qv1-f72.google.com with SMTP id
 e5-20020a056214110500b0053547681552so875410qvs.8
 for <qemu-devel@nongnu.org>; Thu, 16 Feb 2023 03:14:22 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=1UMq2loQQItk0lCl5kRHC9SPvB7wjbaP0SHuowtMrFw=;
 b=eSWptbACKPsT7WDxw3Z8Rt85YMDYFrdQE7OrSjoRCM/3CXZuBhrW2v69vEXR8cfprS
 8qpvcEM3j785AZtUqvPpoi2AypkdmxtEj2h8GYvuCHPJ4/8Cu8Tg3YONYTihHf6VTgLC
 tSFrfR/q60ztzpI3w71eZWH6OVE1kWcxYBLl3dYOb5p/QID3mb4KioKvzEMQGiZhIcs8
 bME1lx3nFQzwKP1KdKvbHkTsd9UShDCk1k1Z//602WwLWa64EuUrZw+J/u/CMqr9SrvJ
 hZ6vvlAANPCN/0lyqoaR3psyerMVz3EUER7Mybk3el70XfP49m1z7Ku5ciNsTKUBQUxb
 Gjyw==
X-Gm-Message-State: AO0yUKWJ46DcrzUjSO5HlQocqLr+9mv5oZpVzGd6jSiFlEHg12xnv2ZJ
 FirIeGdBdZPbBE7zBjvohEYNGmSeTzh5ZkuWBKD6t58uD76FENued0ESYDdRX7LkYcK/707fjti
 QM5r/sVNyxk2PCxc=
X-Received: by 2002:ac8:7d88:0:b0:3b6:334b:2cbc with SMTP id
 c8-20020ac87d88000000b003b6334b2cbcmr9624898qtd.65.1676546062195; 
 Thu, 16 Feb 2023 03:14:22 -0800 (PST)
X-Google-Smtp-Source: AK7set+iCkSbTGFt17ktoLmNhh5yIdq2cicbbf6VCyvBJrc0t60iBU/MpJ2euOVmQeJ5B/+Smc3N8g==
X-Received: by 2002:ac8:7d88:0:b0:3b6:334b:2cbc with SMTP id
 c8-20020ac87d88000000b003b6334b2cbcmr9624869qtd.65.1676546061945; 
 Thu, 16 Feb 2023 03:14:21 -0800 (PST)
Received: from [192.168.0.2] (ip-109-43-176-144.web.vodafone.de.
 [109.43.176.144]) by smtp.gmail.com with ESMTPSA id
 fd10-20020a05622a4d0a00b003b9f1b7895asm1051796qtb.10.2023.02.16.03.14.18
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 16 Feb 2023 03:14:21 -0800 (PST)
Message-ID: <d2df9600-0fcb-d457-727a-90cb18d4df48@redhat.com>
Date: Thu, 16 Feb 2023 12:14:17 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.13.0
Subject: Re: [PATCH v6 0/4] memory: prevent dma-reentracy issues
Content-Language: en-US
To: Alexander Bulekov <alxndr@bu.edu>, qemu-devel@nongnu.org,
 Paolo Bonzini <pbonzini@redhat.com>, David Hildenbrand <david@redhat.com>,
 Peter Xu <peterx@redhat.com>
Cc: Stefan Hajnoczi <stefanha@redhat.com>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>,
 Mauro Matteo Cascella <mcascell@redhat.com>, Jason Wang
 <jasowang@redhat.com>, Gerd Hoffmann <kraxel@redhat.com>,
 Laurent Vivier <lvivier@redhat.com>, Bandan Das <bsd@redhat.com>,
 "Edgar E . Iglesias" <edgar.iglesias@gmail.com>,
 Darren Kenny <darren.kenny@oracle.com>, Bin Meng <bin.meng@windriver.com>,
 "Michael S . Tsirkin" <mst@redhat.com>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 =?UTF-8?Q?Daniel_P=2e_Berrang=c3=a9?= <berrange@redhat.com>,
 Eduardo Habkost <eduardo@habkost.net>, Jon Maloy <jmaloy@redhat.com>,
 Siqi Chen <coc.cyqh@gmail.com>
References: <20230205040737.3567731-1-alxndr@bu.edu>
 <20230213021141.mmzdpzj6ekmml3bx@mozz.bu.edu>
From: Thomas Huth <thuth@redhat.com>
In-Reply-To: <20230213021141.mmzdpzj6ekmml3bx@mozz.bu.edu>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -23
X-Spam_score: -2.4
X-Spam_bar: --
X-Spam_report: (-2.4 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.257, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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

On 13/02/2023 03.11, Alexander Bulekov wrote:
> ping

I think it would be really good to finally get these dma-reentrancy issues 
fixed! Who's supposed to pick up these patches? Paolo? David? Peter?

  Thomas


> On 230204 2307, Alexander Bulekov wrote:
>> These patches aim to solve two types of DMA-reentrancy issues:
>>    
>> 1.) mmio -> dma -> mmio case
>> To solve this, we track whether the device is engaged in io by
>> checking/setting a reentrancy-guard within APIs used for MMIO access.
>>    
>> 2.) bh -> dma write -> mmio case
>> This case is trickier, since we dont have a generic way to associate a
>> bh with the underlying Device/DeviceState. Thus, this version allows a
>> device to associate a reentrancy-guard with a bh, when creating it.
>> (Instead of calling qemu_bh_new, you call qemu_bh_new_guarded)
>>    
>> I replaced most of the qemu_bh_new invocations with the guarded analog,
>> except for the ones where the DeviceState was not trivially accessible.
>>
>> v5 -> v6:
>>      - Only apply checkpatch checks to code in paths containing "/hw/"
>>        (/hw/ and include/hw/)
>>      - Fix a bug in a _guarded call added to hw/block/virtio-blk.c
>> v4-> v5:
>>      - Add corresponding checkpatch checks
>>      - Save/restore reentrancy-flag when entering/exiting BHs
>>      - Improve documentation
>>      - Check object_dynamic_cast return value
>>    
>> v3 -> v4: Instead of changing all of the DMA APIs, instead add an
>>      optional reentrancy guard to the BH API.
>>
>> v2 -> v3: Bite the bullet and modify the DMA APIs, rather than
>>      attempting to guess DeviceStates in BHs.
>>
>> Alexander Bulekov (4):
>>    memory: prevent dma-reentracy issues
>>    async: Add an optional reentrancy guard to the BH API
>>    checkpatch: add qemu_bh_new/aio_bh_new checks
>>    hw: replace most qemu_bh_new calls with qemu_bh_new_guarded
>>
>>   docs/devel/multiple-iothreads.txt |  7 +++++++
>>   hw/9pfs/xen-9p-backend.c          |  4 +++-
>>   hw/block/dataplane/virtio-blk.c   |  3 ++-
>>   hw/block/dataplane/xen-block.c    |  5 +++--
>>   hw/char/virtio-serial-bus.c       |  3 ++-
>>   hw/display/qxl.c                  |  9 ++++++---
>>   hw/display/virtio-gpu.c           |  6 ++++--
>>   hw/ide/ahci.c                     |  3 ++-
>>   hw/ide/core.c                     |  3 ++-
>>   hw/misc/imx_rngc.c                |  6 ++++--
>>   hw/misc/macio/mac_dbdma.c         |  2 +-
>>   hw/net/virtio-net.c               |  3 ++-
>>   hw/nvme/ctrl.c                    |  6 ++++--
>>   hw/scsi/mptsas.c                  |  3 ++-
>>   hw/scsi/scsi-bus.c                |  3 ++-
>>   hw/scsi/vmw_pvscsi.c              |  3 ++-
>>   hw/usb/dev-uas.c                  |  3 ++-
>>   hw/usb/hcd-dwc2.c                 |  3 ++-
>>   hw/usb/hcd-ehci.c                 |  3 ++-
>>   hw/usb/hcd-uhci.c                 |  2 +-
>>   hw/usb/host-libusb.c              |  6 ++++--
>>   hw/usb/redirect.c                 |  6 ++++--
>>   hw/usb/xen-usb.c                  |  3 ++-
>>   hw/virtio/virtio-balloon.c        |  5 +++--
>>   hw/virtio/virtio-crypto.c         |  3 ++-
>>   include/block/aio.h               | 18 ++++++++++++++++--
>>   include/hw/qdev-core.h            |  7 +++++++
>>   include/qemu/main-loop.h          |  7 +++++--
>>   scripts/checkpatch.pl             |  8 ++++++++
>>   softmmu/memory.c                  | 17 +++++++++++++++++
>>   softmmu/trace-events              |  1 +
>>   tests/unit/ptimer-test-stubs.c    |  3 ++-
>>   util/async.c                      | 18 +++++++++++++++++-
>>   util/main-loop.c                  |  5 +++--
>>   util/trace-events                 |  1 +
>>   35 files changed, 147 insertions(+), 41 deletions(-)
>>
>> -- 
>> 2.39.0
>>
> 


