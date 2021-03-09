Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id AB8C2333160
	for <lists+qemu-devel@lfdr.de>; Tue,  9 Mar 2021 23:09:31 +0100 (CET)
Received: from localhost ([::1]:46402 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lJkXi-0007FS-53
	for lists+qemu-devel@lfdr.de; Tue, 09 Mar 2021 17:09:30 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:43480)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1lJkWj-0006RY-4N
 for qemu-devel@nongnu.org; Tue, 09 Mar 2021 17:08:29 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:60403)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1lJkWf-0004Iq-J2
 for qemu-devel@nongnu.org; Tue, 09 Mar 2021 17:08:28 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1615327703;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=TrRfkpaCyAif10vY2NLzElT8H9hcz96S44UT+WnEyM0=;
 b=FgUnxXZsgjBvrb3220+nGB0Q8THgSq7pMRjoJj9bSnNJqs/394SltmWFUD0Bcs4VUQ2gLl
 HMRt+fKVq1RKElSa4cpJ4VcSvlWtCTvsL+GkHqs8OJMh4v9W+xHztl/YBhC4SjKjRnu5SB
 BnvkgZ45FIzSZx3/cSCaaxFI6s28Ug4=
Received: from mail-ed1-f69.google.com (mail-ed1-f69.google.com
 [209.85.208.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-478-LEP0zsWcMCW1xoBj0AkcvA-1; Tue, 09 Mar 2021 17:08:22 -0500
X-MC-Unique: LEP0zsWcMCW1xoBj0AkcvA-1
Received: by mail-ed1-f69.google.com with SMTP id f9so3140979edd.13
 for <qemu-devel@nongnu.org>; Tue, 09 Mar 2021 14:08:21 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:from:to:cc:references:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=TrRfkpaCyAif10vY2NLzElT8H9hcz96S44UT+WnEyM0=;
 b=NPuXrk1dwH7JCpc2KY3Hdi8Nyg2LRi81GUaIVAN4ai5wz45Fxqkaf3SKACwy3gDoef
 B2bTnBUJU16jK7POZnd/A69EGMjE7237KarIlB5OUjyuacAAwJwLLOzEqvyOcDnB5yKP
 0wVpNA/mYM7SaADj3f0mViwtZOd+EjumN9mZ9TgIgYUL0j1yaTcFEbqB5vKDpHBiT7EF
 NcknwgZC0JKW5sq5ycRX3nxu8rHXQgEe+etGIUbzJlBdQ4fTnAzq9vZHa/5JbOAGUIDG
 sN62uHXk/otK9XJelhHmFMo9MPAkwCLn75Mdt0VJbCSLs2Zp1zmoXk7arrbG0vWFuRDE
 YjLg==
X-Gm-Message-State: AOAM533cWnp5eNpFzQnjslll/WstQ1r0/D3OPwDn7be1kwuJamx6IX+5
 ca/h53xSkqteDtz2BF1OkdauhuBaHdCu2b7Egv3D6zLy7uKgkakmGfDbKAi4VBGUpyswutd074E
 8t5oPZ+EOdVBv4N0=
X-Received: by 2002:a17:907:d15:: with SMTP id
 gn21mr181009ejc.337.1615327701108; 
 Tue, 09 Mar 2021 14:08:21 -0800 (PST)
X-Google-Smtp-Source: ABdhPJyoPZbz8BsbfZxNq4crDSMnBl/+S3hyEa4IsAMqqCextuO59Wc8A5fWQ9LtkxA8SuHE3e3dRQ==
X-Received: by 2002:a17:907:d15:: with SMTP id
 gn21mr180947ejc.337.1615327700754; 
 Tue, 09 Mar 2021 14:08:20 -0800 (PST)
Received: from [192.168.1.36] (68.red-83-57-175.dynamicip.rima-tde.net.
 [83.57.175.68])
 by smtp.gmail.com with ESMTPSA id u15sm10107092eds.6.2021.03.09.14.08.16
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 09 Mar 2021 14:08:20 -0800 (PST)
Subject: Re: [PATCH 0/2] sysemu: Let VMChangeStateHandler take boolean
 'running' argument
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
To: qemu-devel@nongnu.org, Paolo Bonzini <pbonzini@redhat.com>,
 QEMU Trivial <qemu-trivial@nongnu.org>
References: <20210111152020.1422021-1-philmd@redhat.com>
 <84048681-32d3-7217-e94c-461501cf550b@redhat.com>
Message-ID: <3112233d-e227-b0c5-4a97-3ad0127a4d12@redhat.com>
Date: Tue, 9 Mar 2021 23:08:16 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.0
MIME-Version: 1.0
In-Reply-To: <84048681-32d3-7217-e94c-461501cf550b@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=63.128.21.124; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.251,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001,
 RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: Fam Zheng <fam@euphon.net>, Peter Maydell <peter.maydell@linaro.org>,
 Dmitry Fleytman <dmitry.fleytman@gmail.com>, kvm@vger.kernel.org,
 Paul Durrant <paul@xen.org>, Jason Wang <jasowang@redhat.com>,
 David Hildenbrand <david@redhat.com>, Thomas Huth <thuth@redhat.com>,
 Laurent Vivier <laurent@vivier.eu>, Gerd Hoffmann <kraxel@redhat.com>,
 Stefano Stabellini <sstabellini@kernel.org>, qemu-block@nongnu.org,
 qemu-trivial@nongnu.org, =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 Huacai Chen <chenhuacai@kernel.org>, Halil Pasic <pasic@linux.ibm.com>,
 Christian Borntraeger <borntraeger@de.ibm.com>,
 Anthony Perard <anthony.perard@citrix.com>, qemu-ppc@nongnu.org,
 Aleksandar Rikalo <aleksandar.rikalo@syrmia.com>,
 Eduardo Habkost <ehabkost@redhat.com>, Amit Shah <amit@kernel.org>,
 Richard Henderson <richard.henderson@linaro.org>, Greg Kurz <groug@kaod.org>,
 Alex Williamson <alex.williamson@redhat.com>, qemu-arm@nongnu.org,
 =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>,
 Stefan Hajnoczi <stefanha@redhat.com>, xen-devel@lists.xenproject.org,
 Sunil Muthuswamy <sunilmut@microsoft.com>, John Snow <jsnow@redhat.com>,
 David Gibson <david@gibson.dropbear.id.au>, Kevin Wolf <kwolf@redhat.com>,
 Marcelo Tosatti <mtosatti@redhat.com>, qemu-s390x@nongnu.org,
 Max Reitz <mreitz@redhat.com>, "Michael S. Tsirkin" <mst@redhat.com>,
 Cornelia Huck <cohuck@redhat.com>, Aurelien Jarno <aurelien@aurel32.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

ping, qemu-trivial maybe?

On 2/22/21 3:34 PM, Philippe Mathieu-Daudé wrote:
> Paolo, this series is fully reviewed, can it go via your
> misc tree?
> 
> On 1/11/21 4:20 PM, Philippe Mathieu-Daudé wrote:
>> Trivial prototype change to clarify the use of the 'running'
>> argument of VMChangeStateHandler.
>>
>> Green CI:
>> https://gitlab.com/philmd/qemu/-/pipelines/239497352
>>
>> Philippe Mathieu-Daudé (2):
>>   sysemu/runstate: Let runstate_is_running() return bool
>>   sysemu: Let VMChangeStateHandler take boolean 'running' argument
>>
>>  include/sysemu/runstate.h   | 12 +++++++++---
>>  target/arm/kvm_arm.h        |  2 +-
>>  target/ppc/cpu-qom.h        |  2 +-
>>  accel/xen/xen-all.c         |  2 +-
>>  audio/audio.c               |  2 +-
>>  block/block-backend.c       |  2 +-
>>  gdbstub.c                   |  2 +-
>>  hw/block/pflash_cfi01.c     |  2 +-
>>  hw/block/virtio-blk.c       |  2 +-
>>  hw/display/qxl.c            |  2 +-
>>  hw/i386/kvm/clock.c         |  2 +-
>>  hw/i386/kvm/i8254.c         |  2 +-
>>  hw/i386/kvmvapic.c          |  2 +-
>>  hw/i386/xen/xen-hvm.c       |  2 +-
>>  hw/ide/core.c               |  2 +-
>>  hw/intc/arm_gicv3_its_kvm.c |  2 +-
>>  hw/intc/arm_gicv3_kvm.c     |  2 +-
>>  hw/intc/spapr_xive_kvm.c    |  2 +-
>>  hw/misc/mac_via.c           |  2 +-
>>  hw/net/e1000e_core.c        |  2 +-
>>  hw/nvram/spapr_nvram.c      |  2 +-
>>  hw/ppc/ppc.c                |  2 +-
>>  hw/ppc/ppc_booke.c          |  2 +-
>>  hw/s390x/tod-kvm.c          |  2 +-
>>  hw/scsi/scsi-bus.c          |  2 +-
>>  hw/usb/hcd-ehci.c           |  2 +-
>>  hw/usb/host-libusb.c        |  2 +-
>>  hw/usb/redirect.c           |  2 +-
>>  hw/vfio/migration.c         |  2 +-
>>  hw/virtio/virtio-rng.c      |  2 +-
>>  hw/virtio/virtio.c          |  2 +-
>>  net/net.c                   |  2 +-
>>  softmmu/memory.c            |  2 +-
>>  softmmu/runstate.c          |  4 ++--
>>  target/arm/kvm.c            |  2 +-
>>  target/i386/kvm/kvm.c       |  2 +-
>>  target/i386/sev.c           |  2 +-
>>  target/i386/whpx/whpx-all.c |  2 +-
>>  target/mips/kvm.c           |  4 ++--
>>  ui/gtk.c                    |  2 +-
>>  ui/spice-core.c             |  2 +-
>>  41 files changed, 51 insertions(+), 45 deletions(-)
>>
> 


