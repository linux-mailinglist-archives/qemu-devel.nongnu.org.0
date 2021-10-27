Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C608C43C997
	for <lists+qemu-devel@lfdr.de>; Wed, 27 Oct 2021 14:26:22 +0200 (CEST)
Received: from localhost ([::1]:47102 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mfi0b-0005oD-V8
	for lists+qemu-devel@lfdr.de; Wed, 27 Oct 2021 08:26:21 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47084)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lvivier@redhat.com>)
 id 1mfht2-0001Rw-2l
 for qemu-devel@nongnu.org; Wed, 27 Oct 2021 08:18:33 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:49233)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lvivier@redhat.com>)
 id 1mfhsz-0003jA-IE
 for qemu-devel@nongnu.org; Wed, 27 Oct 2021 08:18:31 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1635337107;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=tFIgiVnifMgRwNQPMXhHYWMf/GeHjsWBjZYs+jO0Y7k=;
 b=XHsaYoWpBOapKKKt6/+m4M3SA4G2OEF2E3pszVh0ZwFFOolEcA60n0MHo+8/cXA7+3DDwi
 pmryib71mEupTkGp1TJnH36wR+gCwXiddjmXG1W6sDhuKyhw8C2PtfArMM4q8ZuxefB7Is
 rHDTz5ZUhlNlf9GYE9LQNAC9LayrHvA=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-596-BrsAAxYoP7Ka6Rg__An3LA-1; Wed, 27 Oct 2021 08:18:26 -0400
X-MC-Unique: BrsAAxYoP7Ka6Rg__An3LA-1
Received: by mail-wm1-f72.google.com with SMTP id
 i187-20020a1c3bc4000000b0032ccd252cf3so1176145wma.7
 for <qemu-devel@nongnu.org>; Wed, 27 Oct 2021 05:18:26 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=tFIgiVnifMgRwNQPMXhHYWMf/GeHjsWBjZYs+jO0Y7k=;
 b=VqOH9SiCdVAxMHHW2JLx8Kql08FA+nqOvOc+uL70T6vxtdosUBWY1ngz/fudjxa+F4
 Akv6lJxPxZlCyYPluWF4Vkl66yaMNBXjoO44NN0EhU1yl99xJ8Atedk6tBwtDyS4A3bE
 bBb4GFwsS3EbrKDX+QzphEG+/xiDcvkjK8jxapKvPhMEWHZtfCWDdqF0ynErVegEk7/A
 mNpgsjXSmNs0/CBB8hzD93ND3GSHu2KbgMNrxr8lEeYX1SxuePcGQ7OpXMFPG6n/rW7v
 ICxyX5hfdfWExTZVFmoMd20K1qRGMReTPSjqsdZT56D1vCfp9exR7mnGeIp8ahu7g8Nq
 zFAQ==
X-Gm-Message-State: AOAM531PIYStrbl5Ta6Bdu8rlIc5IE304fhIzfwsrzxQvLFAaro7Hdeo
 Od0KrIZ6nD6T7bqhYBfRMbz5oplaadCTtDQI43aSnctPp6sjX7WMcYHylHOGJzqsG6CyRK+ufDb
 OlFeuo1EnAHpRQe0=
X-Received: by 2002:a5d:624c:: with SMTP id m12mr1854122wrv.160.1635337105016; 
 Wed, 27 Oct 2021 05:18:25 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzPICPQzEw+seP3IEF7/7fCgOXobeCx+fagqodyzLzY3+4MzApMoOC1EdYYi/5a4DLQ1wPYrw==
X-Received: by 2002:a5d:624c:: with SMTP id m12mr1854087wrv.160.1635337104826; 
 Wed, 27 Oct 2021 05:18:24 -0700 (PDT)
Received: from [192.168.100.42] ([82.142.14.190])
 by smtp.gmail.com with ESMTPSA id q123sm3352933wma.20.2021.10.27.05.18.23
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 27 Oct 2021 05:18:24 -0700 (PDT)
Message-ID: <cabcfcef-7ba1-ea75-2cd8-cbe44ff02ab6@redhat.com>
Date: Wed, 27 Oct 2021 14:18:22 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.2.0
Subject: Re: [PATCH v8 5/8] qmp: decode feature & status bits in virtio-status
To: David Hildenbrand <david@redhat.com>,
 Jonah Palmer <jonah.palmer@oracle.com>, qemu-devel@nongnu.org
References: <1635334909-31614-1-git-send-email-jonah.palmer@oracle.com>
 <1635334909-31614-6-git-send-email-jonah.palmer@oracle.com>
 <00c6f307-4bcc-d9f7-3abb-bde6615eadcd@redhat.com>
From: Laurent Vivier <lvivier@redhat.com>
In-Reply-To: <00c6f307-4bcc-d9f7-3abb-bde6615eadcd@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=lvivier@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=lvivier@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -55
X-Spam_score: -5.6
X-Spam_bar: -----
X-Spam_report: (-5.6 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-2.847, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001,
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
Cc: kwolf@redhat.com, thuth@redhat.com, mathieu.poirier@linaro.org,
 qemu-block@nongnu.org, mst@redhat.com, armbru@redhat.com, pbonzini@redhat.com,
 qemu_oss@crudebyte.com, groug@kaod.org, dgilbert@redhat.com,
 eric.auger@redhat.com, arei.gonglei@huawei.com, kraxel@redhat.com,
 stefanha@redhat.com, michael.roth@amd.com, si-wei.liu@oracle.com,
 marcandre.lureau@redhat.com, boris.ostrovsky@oracle.com,
 raphael.norwitz@nutanix.com, eblake@redhat.com, joao.m.martins@oracle.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 27/10/2021 13:59, David Hildenbrand wrote:
> On 27.10.21 13:41, Jonah Palmer wrote:
>> From: Laurent Vivier <lvivier@redhat.com>
>>
>> Display feature names instead of bitmaps for host, guest, and
>> backend for VirtIODevice.
>>
>> Display status names instead of bitmaps for VirtIODevice.
>>
>> Display feature names instead of bitmaps for backend, protocol,
>> acked, and features (hdev->features) for vhost devices.
>>
>> Decode features according to device type. Decode status
>> according to configuration status bitmap (config_status_map).
>> Decode vhost user protocol features according to vhost user
>> protocol bitmap (vhost_user_protocol_map).
>>
>> Transport features are on the first line. Undecoded bits
>> (if any) are stored in a separate field. Vhost device field
>> wont show if there's no vhost active for a given VirtIODevice.
>>
>> Signed-off-by: Jonah Palmer <jonah.palmer@oracle.com>
>> ---
>>   hw/block/virtio-blk.c          |  28 ++
>>   hw/char/virtio-serial-bus.c    |  11 +
>>   hw/display/virtio-gpu-base.c   |  18 +-
>>   hw/input/virtio-input.c        |  11 +-
>>   hw/net/virtio-net.c            |  47 ++++
>>   hw/scsi/virtio-scsi.c          |  17 ++
>>   hw/virtio/vhost-user-fs.c      |  10 +
>>   hw/virtio/vhost-vsock-common.c |  10 +
>>   hw/virtio/virtio-balloon.c     |  14 +
>>   hw/virtio/virtio-crypto.c      |  10 +
>>   hw/virtio/virtio-iommu.c       |  14 +
>>   hw/virtio/virtio.c             | 273 ++++++++++++++++++-
>>   include/hw/virtio/vhost.h      |   3 +
>>   include/hw/virtio/virtio.h     |  17 ++
>>   qapi/virtio.json               | 577 ++++++++++++++++++++++++++++++++++++++---
> 
> Any particular reason we're not handling virtio-mem?
> 
> (there is only a single feature bit so far, a second one to be
> introduced soon)
> 

I think this is because the v1 of the series has been written in March 2020 and it has not 
been update when virtio-mem has been added (June 2020).

Thanks,
Laurent



