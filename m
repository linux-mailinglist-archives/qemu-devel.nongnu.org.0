Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 073EF434CDB
	for <lists+qemu-devel@lfdr.de>; Wed, 20 Oct 2021 15:57:52 +0200 (CEST)
Received: from localhost ([::1]:39484 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mdC6J-0001J3-2z
	for lists+qemu-devel@lfdr.de; Wed, 20 Oct 2021 09:57:51 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38114)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <david@redhat.com>) id 1mdBtD-0007sf-TG
 for qemu-devel@nongnu.org; Wed, 20 Oct 2021 09:44:19 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:35910)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <david@redhat.com>) id 1mdBt7-00041L-QA
 for qemu-devel@nongnu.org; Wed, 20 Oct 2021 09:44:18 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1634737452;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=8O9hV1FDsgjyXLd1b/e4m4+D2fU2CXo2T1QmbdF0yjk=;
 b=O9nwmJEFSQL0gPWa1FM9Lx31OHUYgNVURL+SBifAm5MqIs2uZrnlEVEaoACaUqpgbgD6H+
 Cv3ejy2M/zihcYeYrDSFfzCF9vmxvj5g8hnSfz7KA1peb8fqbO2oWxvXsY2NK/YIZnY/I+
 FH1TdxsYpcubK3m088VZNiG1ISoxH7g=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-201-X_xayvX9M6278qo8EmD_tw-1; Wed, 20 Oct 2021 09:44:11 -0400
X-MC-Unique: X_xayvX9M6278qo8EmD_tw-1
Received: by mail-wm1-f71.google.com with SMTP id
 f185-20020a1c1fc2000000b0032311c7fc54so426312wmf.1
 for <qemu-devel@nongnu.org>; Wed, 20 Oct 2021 06:44:11 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=8O9hV1FDsgjyXLd1b/e4m4+D2fU2CXo2T1QmbdF0yjk=;
 b=5/PaCyQmJRz0llvYge05s67FptHEviDruHwCMX69TNRfx4Ruy+6UVRvVdCjfGQIZyj
 0mWPPbD4ozmA8HI1YPUojXSVOL3TSB5bW8qRT92ZZ0XncuygXTXEcZ7U69JtIDkcKocR
 RdsVaU/ZXHuLHDtB+gW7lo3r7WmF22kjS3FiwhOUYZ+4dsO+nzLWJU9qkl6dv1qCvOwg
 BtrEZJOWw2Fzu2B8kYaan7o//H/FoLfUUBPFFRlpDJBS20IQOED9hiyIMVYQ3q2hSv+t
 fA05tgeQJC1s24xoe1FCeNJQNd/waaRo11PkVAs7ALMlHI+MVYYjOnHTNCxXDCrn2Kyn
 wGdg==
X-Gm-Message-State: AOAM53366KyOeNl6caQP5b+dPbA6eZeyoA+7/1rNE2Em32Ixin2tPSv4
 noL8nKYCdrvoSdYPk1Ls7DuoMO9CaRGN5peQA/sSCUBrUPhVrbmMjhjHExHK10m43ijxLtQLhnI
 a1TURCBskm3Wl1lE=
X-Received: by 2002:a1c:7ed7:: with SMTP id z206mr13437916wmc.69.1634737450465; 
 Wed, 20 Oct 2021 06:44:10 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwcRkxeOectspy/NQVCKlldf44KUqtbLm8FNrsU7BMuJR7oavOXg7zxOTAv9ZpuWDIshEJB7Q==
X-Received: by 2002:a1c:7ed7:: with SMTP id z206mr13437893wmc.69.1634737450192; 
 Wed, 20 Oct 2021 06:44:10 -0700 (PDT)
Received: from [192.168.3.132] (p5b0c63d4.dip0.t-ipconnect.de. [91.12.99.212])
 by smtp.gmail.com with ESMTPSA id
 f20sm2371650wmq.38.2021.10.20.06.44.08
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 20 Oct 2021 06:44:09 -0700 (PDT)
Message-ID: <2817620d-facb-eeee-b854-64193fa4da33@redhat.com>
Date: Wed, 20 Oct 2021 15:44:08 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.1.0
Subject: Re: [PATCH 0/4] vl: Prioritize device realizations
To: Peter Xu <peterx@redhat.com>, qemu-devel@nongnu.org
References: <20210818194217.110451-1-peterx@redhat.com>
From: David Hildenbrand <david@redhat.com>
Organization: Red Hat
In-Reply-To: <20210818194217.110451-1-peterx@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=david@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=david@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -50
X-Spam_score: -5.1
X-Spam_bar: -----
X-Spam_report: (-5.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-2.267, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001,
 SPF_PASS=-0.001, T_SPF_HELO_TEMPERROR=0.01 autolearn=ham autolearn_force=no
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
Cc: =?UTF-8?Q?Daniel_P_=2e_Berrang=c3=a9?= <berrange@redhat.com>,
 Eduardo Habkost <ehabkost@redhat.com>, "Michael S . Tsirkin" <mst@redhat.com>,
 Jason Wang <jasowang@redhat.com>, Markus Armbruster <armbru@redhat.com>,
 "Dr . David Alan Gilbert" <dgilbert@redhat.com>,
 Eric Auger <eric.auger@redhat.com>,
 Alex Williamson <alex.williamson@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 18.08.21 21:42, Peter Xu wrote:
> This is a long pending issue that we haven't fixed.  The issue is in QEMU we
> have implicit device ordering requirement when realizing, otherwise some of the
> device may not work properly.
> 
> The initial requirement comes from when vfio-pci starts to work with vIOMMUs.
> To make sure vfio-pci will get the correct DMA address space, the vIOMMU device
> needs to be created before vfio-pci otherwise vfio-pci will stop working when
> the guest enables the vIOMMU and the device at the same time.
> 
> AFAIU Libvirt should have code that guarantees that.  For QEMU cmdline users,
> they need to pay attention or things will stop working at some point.
> 
> Recently there's a growing and similar requirement on vDPA.  It's not a hard
> requirement so far but vDPA has patches that try to workaround this issue.
> 
> This patchset allows us to realize the devices in the order that e.g. platform
> devices will be created first (bus device, IOMMU, etc.), then the rest of
> normal devices.  It's done simply by ordering the QemuOptsList of "device"
> entries before realization.  The priority so far comes from migration
> priorities which could be a little bit odd, but that's really about the same
> problem and we can clean that part up in the future.
> 
> Libvirt can still keep its ordering for sure so old QEMU will still work,
> however that won't be needed for new qemus after this patchset, so with the new
> binary we should be able to specify qemu cmdline as wish on '-device'.
> 
> Logically this should also work for vDPA and the workaround code can be done
> with more straightforward approaches.
> 
> Please review, thanks.

Hi Peter, looks like I have another use case:

vhost devices can heavily restrict the number of available memslots:
e.g., upstream KVM ~64k, vhost-user usually 32 (!). With virtio-mem
intending to make use of multiple memslots [1] and auto-detecting how
many to use based on currently avilable memslots when plugging and
realizing the virtio-mem device, this implies that realizing vhost
devices (especially vhost-user device) after virtio-mem devices can
similarly result in issues: when trying realization of the vhost device
with restricted memslots, QEMU will bail out.

So similarly, we'd want to realize any vhost-* before any virtio-mem device.

Do you have any updated version of this patchset? Thanks!

[1] https://lkml.kernel.org/r/20211013103330.26869-1-david@redhat.com


-- 
Thanks,

David / dhildenb


