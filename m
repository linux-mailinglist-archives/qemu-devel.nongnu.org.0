Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 42A72403A88
	for <lists+qemu-devel@lfdr.de>; Wed,  8 Sep 2021 15:23:56 +0200 (CEST)
Received: from localhost ([::1]:54328 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mNxYR-000578-3v
	for lists+qemu-devel@lfdr.de; Wed, 08 Sep 2021 09:23:55 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:56076)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <sgarzare@redhat.com>)
 id 1mNxWo-0002zx-LM
 for qemu-devel@nongnu.org; Wed, 08 Sep 2021 09:22:14 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:50741)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <sgarzare@redhat.com>)
 id 1mNxWk-0007g4-01
 for qemu-devel@nongnu.org; Wed, 08 Sep 2021 09:22:13 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1631107328;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=iU9Pwq7Q9/ecDJoyENEIEgmtbFe7iLc+nc5H/ZFLRZE=;
 b=choGeuTA58Esvs19mUZDxXENyx9DXyv52ZxBWupuOpa9pEN+/m6uF8pWyf7qPd+Zcpix+R
 Grw5WMrx/idAz/JnwStA6dcr4zdcSYmq2gXlNEYMtpQFytwd9R5rwNftvC3Wm+B6j6gAGn
 tra6NtUs6BCEkSGErn6rAwb1UEKj+7g=
Received: from mail-ed1-f72.google.com (mail-ed1-f72.google.com
 [209.85.208.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-10-Acl1JH9-OgudqD8iQyldxA-1; Wed, 08 Sep 2021 09:22:07 -0400
X-MC-Unique: Acl1JH9-OgudqD8iQyldxA-1
Received: by mail-ed1-f72.google.com with SMTP id
 y21-20020a056402359500b003cd0257fc7fso1073582edc.10
 for <qemu-devel@nongnu.org>; Wed, 08 Sep 2021 06:22:07 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to;
 bh=iU9Pwq7Q9/ecDJoyENEIEgmtbFe7iLc+nc5H/ZFLRZE=;
 b=ujovX8iWbdStG0kbgcnaI2e57aIldFMaDyKmYWs7/lj8sHFdxYQWJzKEsNwl+D0JWg
 aWqj/l98DMWw90uj7ZJV8g+uQPsQCBtBtQCCkVx8M/d8t0OfKjKM9IvCGzM2Z63BZhSX
 AhM4rj4JPFPjCtYGbAy3+zfa/vv68Tukl0XB7FUTy8mDjeWzg+Cw/y78bxp2Fkn4Yqon
 UQGciKu5z3EtbgDbIZTuPDTyqK8gZCW40D+10zTePyjjc2IxnSeKI0Wml9FZpUuBZu4J
 MF4YP2UGATrdIal7kUORRmF40zdYhdD8VhmLT26YY1XMbRYdLZZ5zCNaWGrEdTQtUrb9
 X5NA==
X-Gm-Message-State: AOAM532QguZZ1VmbitIpFmLvHlGRWFXbyi2puVmdfC6WywkGkRhHLoCZ
 eeoQ6Gh59y/RPKpA4zbQXqon3I9SkuKogf/Uzwj24H1iW8qGAyyOeUe1F8kyEMW50KLbIDFkFv5
 x1fMgmSKPzCM3j2A=
X-Received: by 2002:aa7:cd13:: with SMTP id b19mr3915363edw.210.1631107326347; 
 Wed, 08 Sep 2021 06:22:06 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwA6oqbMzNuKRev+5rvxNjy2XmukO3cwKTF87w4kJaI780VTKv+vCLNZlWN8iqIUwNjp3IJKg==
X-Received: by 2002:aa7:cd13:: with SMTP id b19mr3915329edw.210.1631107326095; 
 Wed, 08 Sep 2021 06:22:06 -0700 (PDT)
Received: from steredhat (host-79-51-2-59.retail.telecomitalia.it.
 [79.51.2.59])
 by smtp.gmail.com with ESMTPSA id w9sm704693edr.20.2021.09.08.06.22.04
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 08 Sep 2021 06:22:05 -0700 (PDT)
Date: Wed, 8 Sep 2021 15:22:03 +0200
From: Stefano Garzarella <sgarzare@redhat.com>
To: Denis Plotnikov <den-plotnikov@yandex-team.ru>
Subject: Re: [PATCH v1 2/4] virtio: increase virtuqueue size for virtio-scsi
 and virtio-blk
Message-ID: <20210908132203.vajs22vocelhlwwt@steredhat>
References: <20200129140702.5411-1-dplotnikov@virtuozzo.com>
 <20200129140702.5411-3-dplotnikov@virtuozzo.com>
 <20200130145840.GH180311@stefanha-x1.localdomain>
 <92f392e9-eb05-5c85-4d50-208110720a22@virtuozzo.com>
 <20200205111905.GE58062@stefanha-x1.localdomain>
 <683b80a8-0d40-7f14-e3f4-628d2b38037f@virtuozzo.com>
 <20210908131716.e6de722iibgn3y7y@steredhat>
MIME-Version: 1.0
In-Reply-To: <20210908131716.e6de722iibgn3y7y@steredhat>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=sgarzare@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=iso-8859-1; format=flowed
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=sgarzare@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.393,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
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
Cc: fam@euphon.net, kwolf@redhat.com, vsementsov@virtuozzo.com,
 ehabkost@redhat.com, qemu-block@nongnu.org, mst@redhat.com,
 Stefan Hajnoczi <stefanha@gmail.com>, qemu-devel@nongnu.org, mreitz@redhat.com,
 Stefan Hajnoczi <stefanha@redhat.com>, pbonzini@redhat.com, den@virtuozzo.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Message bounced, I use new Denis's email address.

On Wed, Sep 08, 2021 at 03:17:16PM +0200, Stefano Garzarella wrote:
>Hi Denis,
>I just found this discussion since we still have the following line in 
>hw/core/machine.c:
>    { "vhost-blk-device", "seg_max_adjust", "off"}
>
>IIUC it was a typo, and I think we should fix it since in the future 
>we can have `vhost-blk-device`.
>
>So, I think we have 2 options:
>1. remove that line since for now is useless
>2. replace with "vhost-scsi"
>
>I'm not sure which is the best, what do you suggest?
>
>Thanks,
>Stefano
>
>On Fri, Feb 07, 2020 at 11:48:05AM +0300, Denis Plotnikov wrote:
>>On 05.02.2020 14:19, Stefan Hajnoczi wrote:
>>>On Tue, Feb 04, 2020 at 12:59:04PM +0300, Denis Plotnikov wrote:
>>>>On 30.01.2020 17:58, Stefan Hajnoczi wrote:
>>>>>On Wed, Jan 29, 2020 at 05:07:00PM +0300, Denis Plotnikov wrote:
>>>>>>The goal is to reduce the amount of requests issued by a guest on
>>>>>>1M reads/writes. This rises the performance up to 4% on that kind of
>>>>>>disk access pattern.
>>>>>>
>>>>>>The maximum chunk size to be used for the guest disk accessing is
>>>>>>limited with seg_max parameter, which represents the max amount of
>>>>>>pices in the scatter-geather list in one guest disk request.
>>>>>>
>>>>>>Since seg_max is virqueue_size dependent, increasing the virtqueue
>>>>>>size increases seg_max, which, in turn, increases the maximum size
>>>>>>of data to be read/write from guest disk.
>>>>>>
>>>>>>More details in the original problem statment:
>>>>>>https://lists.gnu.org/archive/html/qemu-devel/2017-12/msg03721.html
>>>>>>
>>>>>>Suggested-by: Denis V. Lunev <den@openvz.org>
>>>>>>Signed-off-by: Denis Plotnikov <dplotnikov@virtuozzo.com>
>>>>>>---
>>>>>>  hw/core/machine.c          | 3 +++
>>>>>>  include/hw/virtio/virtio.h | 2 +-
>>>>>>  2 files changed, 4 insertions(+), 1 deletion(-)
>>>>>>
>>>>>>diff --git a/hw/core/machine.c b/hw/core/machine.c
>>>>>>index 3e288bfceb..8bc401d8b7 100644
>>>>>>--- a/hw/core/machine.c
>>>>>>+++ b/hw/core/machine.c
>>>>>>@@ -28,6 +28,9 @@
>>>>>>  #include "hw/mem/nvdimm.h"
>>>>>>  GlobalProperty hw_compat_4_2[] = {
>>>>>>+    { "virtio-blk-device", "queue-size", "128"},
>>>>>>+    { "virtio-scsi-device", "virtqueue_size", "128"},
>>>>>>+    { "vhost-blk-device", "virtqueue_size", "128"},
>>>>>vhost-blk-device?!  Who has this?  It's not in qemu.git so please omit
>>>>>this line. ;-)
>>>>So in this case the line:
>>>>
>>>>{ "vhost-blk-device", "seg_max_adjust", "off"},
>>>>
>>>>introduced by my patch:
>>>>
>>>>commit 1bf8a989a566b2ba41c197004ec2a02562a766a4
>>>>Author: Denis Plotnikov <dplotnikov@virtuozzo.com>
>>>>Date:   Fri Dec 20 17:09:04 2019 +0300
>>>>
>>>>    virtio: make seg_max virtqueue size dependent
>>>>
>>>>is also wrong. It should be:
>>>>
>>>>{ "vhost-scsi-device", "seg_max_adjust", "off"},
>>>>
>>>>Am I right?
>>>It's just called "vhost-scsi":
>>>
>>>include/hw/virtio/vhost-scsi.h:#define TYPE_VHOST_SCSI "vhost-scsi"
>>>
>>>>>On the other hand, do you want to do this for the vhost-user-blk,
>>>>>vhost-user-scsi, and vhost-scsi devices that exist in qemu.git?  Those
>>>>>devices would benefit from better performance too.
>>After thinking about that for a while, I think we shouldn't extend 
>>queue sizes for vhost-user-blk, vhost-user-scsi and vhost-scsi.
>>This is because increasing the queue sizes seems to be just useless 
>>for them: the all thing is about increasing the queue sizes for 
>>increasing seg_max (it limits the max block query size from the 
>>guest). For virtio-blk-device and virtio-scsi-device it makes sense, 
>>since they have seg-max-adjust property which, if true, sets seg_max 
>>to virtqueue_size-2. vhost-scsi also have this property but it seems 
>>the property just doesn't affect anything (remove it?).
>>Also vhost-user-blk, vhost-user-scsi and vhost-scsi don't do any 
>>seg_max settings. If I understand correctly, their backends are ment 
>>to be responsible for doing that.
>>So, what about changing the queue sizes just for virtio-blk-device 
>>and virtio-scsi-device?
>>
>>Denis
>>
>>>>It seems to be so. We also have the test checking those settings:
>>>>tests/acceptance/virtio_seg_max_adjust.py
>>>>For now it checks virtio-scsi-pci and virtio-blk-pci.
>>>>I'm going to extend it for the virtqueue size checking.
>>>>If I change vhost-user-blk, vhost-user-scsi and vhost-scsi it's worth
>>>>to check those devices too. But I don't know how to form a command line
>>>>for that 3 devices since they should involve some third party components as
>>>>backends (kernel modules, DPDK, etc.) and they seems to be not available in
>>>>the
>>>>qemu git.
>>>>Is there any way to do it with some qit.qemu available stubs or something
>>>>else?
>>>>If so, could you please point out the proper way to do it?
>>>qemu.git has contrib/vhost-user-blk/ and contrib/vhost-user-scsi/ if
>>>you need to test those vhost-user devices without external dependencies.
>>>
>>>Stefan
>>
>>


