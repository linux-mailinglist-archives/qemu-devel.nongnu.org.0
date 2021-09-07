Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9D003402A60
	for <lists+qemu-devel@lfdr.de>; Tue,  7 Sep 2021 16:04:26 +0200 (CEST)
Received: from localhost ([::1]:46480 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mNbi5-0007N3-N5
	for lists+qemu-devel@lfdr.de; Tue, 07 Sep 2021 10:04:25 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49728)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <sgarzare@redhat.com>)
 id 1mNbSH-0006Pt-V2
 for qemu-devel@nongnu.org; Tue, 07 Sep 2021 09:48:05 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:25867)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <sgarzare@redhat.com>)
 id 1mNbSE-0006QF-Qi
 for qemu-devel@nongnu.org; Tue, 07 Sep 2021 09:48:05 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1631022481;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=rSPU7XUTVh/6x7qjKJetcxEbnpwK7BlfDov2PXoi55E=;
 b=DI3eSURL72LLoOZgPTLmTGZRfdKcMh8kgHMpz/rWemM9FBWF+AJ8yuKX2sUKV8gpPDAw+/
 S8Q/NLhHycYd+aXN5Ohoax105jQPw143DvqKo73tODRXYvnug+Ss69jSMFiyC0K0CmPexU
 F6/Ki4Zfq7YRjOIgUtYmKV8U9JEO6fk=
Received: from mail-ej1-f71.google.com (mail-ej1-f71.google.com
 [209.85.218.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-566-bGNR1IjgOFCb0He2PpEZvg-1; Tue, 07 Sep 2021 09:48:00 -0400
X-MC-Unique: bGNR1IjgOFCb0He2PpEZvg-1
Received: by mail-ej1-f71.google.com with SMTP id
 bx10-20020a170906a1ca00b005c341820edeso3700825ejb.10
 for <qemu-devel@nongnu.org>; Tue, 07 Sep 2021 06:47:59 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to;
 bh=rSPU7XUTVh/6x7qjKJetcxEbnpwK7BlfDov2PXoi55E=;
 b=DCl49EFrheS79YcoXt4Fwk//CtFDYiV6d03CLXKcFLoVq/UzheuPRQLm33oIBEW0Kb
 er0GrSo2uxNEyw/AjI5uSPnmU6u76K6+tV3+6bhPJJFmyyu76mg7zXtk5bbeKHNeRTBS
 gu5kLPthzezROncs2D9ihMqKDL60KrxoDi6A4tZJcIn2THqqetzgM1kcNeMIZrmEIK9K
 U5rdz1tkFadIRbSqKgoYQqyCi8saSTUMkz+gX6Ll1aPXU3KmzREPpc7M9YuOx19O+ZW/
 nHLb4ejs3cywDxuT7TaOQp2NVmpYQPgCSCHCFUyr/1Xf/TAi/M8HzQz45Bb+ta4U5AQ+
 sFYw==
X-Gm-Message-State: AOAM532vqzkCJjI2SnA62pQX9xW3QU6LpQdbVTXZkR1gYt3sgJLFn5pZ
 8f7dDSAOr0mEV/OVmvJ5PJh5+rN//pCwJlllJ5j2Dxhz28ZqDZlXkmduXWv9iCQRCdYcXLeoPo+
 vamS+sLyiAW9kBj0=
X-Received: by 2002:a05:6402:5188:: with SMTP id
 q8mr18154418edd.138.1631022478970; 
 Tue, 07 Sep 2021 06:47:58 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzO0x3ihiHdRW10ndhYajyN8Pg5A5zHng1p3ZE290GfGY4dDn2iTO1mIQRaQUGKfj3MtuCVYg==
X-Received: by 2002:a05:6402:5188:: with SMTP id
 q8mr18154391edd.138.1631022478688; 
 Tue, 07 Sep 2021 06:47:58 -0700 (PDT)
Received: from steredhat (host-79-51-2-59.retail.telecomitalia.it.
 [79.51.2.59])
 by smtp.gmail.com with ESMTPSA id x11sm6544111edq.58.2021.09.07.06.47.57
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 07 Sep 2021 06:47:58 -0700 (PDT)
Date: Tue, 7 Sep 2021 15:47:56 +0200
From: Stefano Garzarella <sgarzare@redhat.com>
To: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>,
 "Michael S. Tsirkin" <mst@redhat.com>
Subject: Re: [PATCH] vhost-vsock: fix migration issue when seqpacket is
 supported
Message-ID: <20210907134756.apnxzgbvw2ztetag@steredhat>
References: <20210907124935.147164-1-sgarzare@redhat.com>
 <YTdnkPR+LjNFXaeQ@redhat.com>
MIME-Version: 1.0
In-Reply-To: <YTdnkPR+LjNFXaeQ@redhat.com>
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
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.391,
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
Cc: Eduardo Habkost <ehabkost@redhat.com>,
 Jiang Wang <jiang.wang@bytedance.com>, qemu-stable@nongnu.org,
 qemu-devel@nongnu.org, Stefan Hajnoczi <stefanha@redhat.com>,
 Arseny Krasnov <arseny.krasnov@kaspersky.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Tue, Sep 07, 2021 at 02:22:24PM +0100, Daniel P. Berrangé wrote:
>On Tue, Sep 07, 2021 at 02:49:35PM +0200, Stefano Garzarella wrote:
>> Commit 1e08fd0a46 ("vhost-vsock: SOCK_SEQPACKET feature bit support")
>> enabled the SEQPACKET feature bit.
>> This commit is released with QEMU 6.1, so if we try to migrate a VM where
>> the host kernel supports SEQPACKET but machine type version is less than
>> 6.1, we get the following errors:
>>
>>     Features 0x130000002 unsupported. Allowed features: 0x179000000
>>     Failed to load virtio-vhost_vsock:virtio
>>     error while loading state for instance 0x0 of device '0000:00:05.0/virtio-vhost_vsock'
>>     load of migration failed: Operation not permitted
>>
>> Let's disable the feature bit for machine types < 6.1, adding a
>> `features` field to VHostVSock to simplify the handling of upcoming
>> features we will support.
>
>IIUC, this will still leave migration broken for anyone migrating
>a >= 6.1 machine type between a kernel that supports SEQPACKET and
>a kernel lacking that, or vica-verca.

This should be true for migrating from kernel that supports SEQPACKET to 
a kernel lacking that.

For vice-versa I'm not sure, since vhost_get_features() will disable 
that feature if the host kernel doesn't support it, and the guest will 
not have acked it.

>
>If a feature is dependant on a host kernel feature we can't turn
>that on automatically as part of the machine type, as we need
>ABI stability across migration indepdant of kernel version.
>

How do we typically handle this?

I wrongly thought it was an expected behavior that migrating a guest 
using a vhost device from a new kernel to an old one can fail if not all 
features are supported.

I need to take a look at the other vhost devices.

Thanks,
Stefano


