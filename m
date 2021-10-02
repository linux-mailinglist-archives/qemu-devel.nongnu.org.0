Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C10BF41FAB7
	for <lists+qemu-devel@lfdr.de>; Sat,  2 Oct 2021 11:57:36 +0200 (CEST)
Received: from localhost ([::1]:57864 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mWblv-0000t8-8s
	for lists+qemu-devel@lfdr.de; Sat, 02 Oct 2021 05:57:35 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33898)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1mWbk0-00005a-NS
 for qemu-devel@nongnu.org; Sat, 02 Oct 2021 05:55:36 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:26499)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1mWbju-0002y9-AY
 for qemu-devel@nongnu.org; Sat, 02 Oct 2021 05:55:34 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1633168524;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=XW3vtIp0MC2VSpT2XN2O3jjXVJ90Z7SE3i24RosfquU=;
 b=h/ktgI2ngC65PvvCf+qTf4y6ipZ0/3K7gNpAYUA46BtA0yhMzOyh8neWYvBLDincrn5X7S
 k2b9H7UrU0QFaeils8IUOT7nh9BfF9bNTB9Vo9n5s34DxrA4gqwOwnr78i+l0uycWPGlgN
 m+cUepuZO8DqIipk4epagHzK+Sc2ems=
Received: from mail-ed1-f69.google.com (mail-ed1-f69.google.com
 [209.85.208.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-493-rlrSolyZMbC7pPlAmIEqxg-1; Sat, 02 Oct 2021 05:55:23 -0400
X-MC-Unique: rlrSolyZMbC7pPlAmIEqxg-1
Received: by mail-ed1-f69.google.com with SMTP id
 b7-20020a50e787000000b003d59cb1a923so12648755edn.5
 for <qemu-devel@nongnu.org>; Sat, 02 Oct 2021 02:55:23 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=XW3vtIp0MC2VSpT2XN2O3jjXVJ90Z7SE3i24RosfquU=;
 b=cdhryaNgqlo3/Acck+JJq9bdSjg9Uf+uBqytDRCx3DmBJkdheASCoyKv4egsertSEr
 zXutzzQRJZ2rjVSLDeuQ2wdN0V84+mQRoZLXzM7AJrga8RnC9SuXZ8mQ9iPvqiKLpdNI
 VNKMPKRttzdx64Mlbd27pvil1+CNUnr16KhJ7oVSMf0XXXjyItUQ4iA2LinZjLg9eeO4
 OZfWv439+QRFfliwWuFcGkEtJj/U8CSmBl4AHZ93mV5CDQwk2HygXl/kdI2KPHKq5tu2
 9rTZvs+bpVzUOcMQ985hrCKVWVjHzEf3ygh0Z+xNYN7VeqaF+SMOJOWSqIOt5IP2vN7U
 ll5A==
X-Gm-Message-State: AOAM530qcGgTSfADk8amlHJTO1EptFQqcZjw71KujQsBxkTFcwNwafur
 HNQ6tuiQRhXxvclmzakxpKwDKlgu28BUnKJbEFjOBm88x1YSPZofRCT1sWXfUbGVh657TkHM7Hw
 GB9YJaHSzwElbKTI=
X-Received: by 2002:a05:6402:5252:: with SMTP id
 t18mr2964184edd.13.1633168522633; 
 Sat, 02 Oct 2021 02:55:22 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzqcGZdb4m/xa/3X3ulNKx328HLC0Mj79nj6BW3QBx1dUCG93VqJkplAIOA11OWJbjoHHWTUQ==
X-Received: by 2002:a05:6402:5252:: with SMTP id
 t18mr2964154edd.13.1633168522328; 
 Sat, 02 Oct 2021 02:55:22 -0700 (PDT)
Received: from ?IPV6:2001:b07:6468:f312:63a7:c72e:ea0e:6045?
 ([2001:b07:6468:f312:63a7:c72e:ea0e:6045])
 by smtp.gmail.com with ESMTPSA id y11sm3999755ejb.8.2021.10.02.02.55.15
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 02 Oct 2021 02:55:21 -0700 (PDT)
Message-ID: <15636272-1702-93c7-2c7d-59d889168350@redhat.com>
Date: Sat, 2 Oct 2021 11:55:14 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.1.0
Subject: Re: [PATCH v4 0/4] softmmu/memory_mapping: optimize dump/tpm for
 virtio-mem
To: David Hildenbrand <david@redhat.com>, qemu-devel@nongnu.org
References: <20210727082545.17934-1-david@redhat.com>
From: Paolo Bonzini <pbonzini@redhat.com>
In-Reply-To: <20210727082545.17934-1-david@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=pbonzini@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=pbonzini@redhat.com;
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
Cc: Laurent Vivier <lvivier@redhat.com>, Thomas Huth <thuth@redhat.com>,
 Eduardo Habkost <ehabkost@redhat.com>, "Michael S. Tsirkin" <mst@redhat.com>,
 Stefan Berger <stefanb@linux.vnet.ibm.com>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>, Peter Xu <peterx@redhat.com>,
 Alex Williamson <alex.williamson@redhat.com>,
 Claudio Fontana <cfontana@suse.de>, Igor Mammedov <imammedo@redhat.com>,
 =?UTF-8?Q?Marc-Andr=c3=a9_Lureau?= <marcandre.lureau@redhat.com>,
 =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 Stefan Berger <stefanb@linux.ibm.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 27/07/21 10:25, David Hildenbrand wrote:
> Minor fixes and cleanups, followed by an optimization for virtio-mem
> regarding guest dumps and tpm.
> 
> virtio-mem logically plugs/unplugs memory within a sparse memory region
> and notifies via the RamDiscardMgr interface when parts become
> plugged (populated) or unplugged (discarded).
> 
> Currently, guest_phys_blocks_append() appends the whole (sparse)
> virtio-mem managed region and therefore tpm code might zero the hole
> region and dump code will dump the whole region. Let's only add logically
> plugged (populated) parts of that region, skipping over logically
> unplugged (discarded) parts by reusing the RamDiscardMgr infrastructure
> introduced to handle virtio-mem + VFIO properly.

Queued, thanks.

Paolo

> v3 -> v4:
> - "tpm: mark correct memory region range dirty when clearing RAM"
> -- Finally get it right :) I tried triggering that code without luck. So
>     I ended up forcing that call path, verifying that the offset into
>     memory regions is now correct.
> 
> v2 -> v3:
> - "tpm: mark correct memory region range dirty when clearing RAM"
> -- Fix calculation of offset into memory region (thanks Peter!)
> - "softmmu/memory_mapping: reuse qemu_get_guest_simple_memory_mapping()"
> -- Dropped
> 
> v1 -> v2:
> - "softmmu/memory_mapping: factor out adding physical memory ranges"
> -- Simplify based on RamDiscardManager changes: add using a
>     MemoryRegionSection
> - "softmmu/memory_mapping: optimize for RamDiscardManager sections"
> -- Simplify based on RamDiscardManager changes
> 
> David Hildenbrand (4):
>    tpm: mark correct memory region range dirty when clearing RAM
>    softmmu/memory_mapping: never merge ranges accross memory regions
>    softmmu/memory_mapping: factor out adding physical memory ranges
>    softmmu/memory_mapping: optimize for RamDiscardManager sections
> 
>   hw/tpm/tpm_ppi.c         |  5 +++-
>   softmmu/memory_mapping.c | 64 ++++++++++++++++++++++++++--------------
>   2 files changed, 46 insertions(+), 23 deletions(-)
> 


