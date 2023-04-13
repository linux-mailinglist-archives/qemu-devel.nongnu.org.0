Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id ED5326E0623
	for <lists+qemu-devel@lfdr.de>; Thu, 13 Apr 2023 06:51:04 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pmou8-0000hf-G4; Thu, 13 Apr 2023 00:49:52 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <akihiko.odaki@daynix.com>)
 id 1pmou7-0000hX-8i
 for qemu-devel@nongnu.org; Thu, 13 Apr 2023 00:49:51 -0400
Received: from mail-pg1-x52c.google.com ([2607:f8b0:4864:20::52c])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <akihiko.odaki@daynix.com>)
 id 1pmou5-0002hC-2I
 for qemu-devel@nongnu.org; Thu, 13 Apr 2023 00:49:50 -0400
Received: by mail-pg1-x52c.google.com with SMTP id
 41be03b00d2f7-51b456b8a56so94926a12.0
 for <qemu-devel@nongnu.org>; Wed, 12 Apr 2023 21:49:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=daynix-com.20221208.gappssmtp.com; s=20221208; t=1681361387; x=1683953387;
 h=content-transfer-encoding:content-language:cc:to:subject:from
 :user-agent:mime-version:date:message-id:from:to:cc:subject:date
 :message-id:reply-to;
 bh=HGyiOScylqXAdZpSr8RgAbr7p829gfYVCOhKVD812r4=;
 b=sPkX6Ou6OJI2CBFPo9AWJLlkPzrm+7ioKjVMZ+4ui3MBsAkNyvHMEzzLQTiXGDp4WW
 yql3CbfDWYtvYIGYe3kB9hR+SmY9cEXKJP0xZfA3wvvjE0Pvf9ITg0SKSxq9Xfg5yTGe
 9SQxe6zVbULOQGxq+3dZsnqqotEt6L0cNT8KsWHkcMk7rvmn1gu7eCQDNW8jbiM9w/0G
 FOoqIEe5lZlaS98umeqOlkdzeId9pjz3LaH5/VDtPM9EVZwdj7I7L9YToWp0v2cNfweV
 xC0i6E8XgK/WRiEtuuppdCB+b/3Z0mnl+WItMqnu5VBHrvoM9JPrB5K8B/lxVFLZsalR
 NgrQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1681361387; x=1683953387;
 h=content-transfer-encoding:content-language:cc:to:subject:from
 :user-agent:mime-version:date:message-id:x-gm-message-state:from:to
 :cc:subject:date:message-id:reply-to;
 bh=HGyiOScylqXAdZpSr8RgAbr7p829gfYVCOhKVD812r4=;
 b=HGf4chmm/8Vs/aOocgwmfkJImVxtpRshgCA/Wn7s29FVSz1+z1vQ4scYyBdrv/QYn4
 QsQVnm2N0UxPrYX3JI3xkYsn7koNsVfnTyFDyhapRyI948LBk/aNFP4JJ2NZABmez9C2
 YFoUdZBTh9zteO/MnOAslA8vcwJCRyzLwFEpcu2zAjRL3y5D88jb4cj7m+QeQvij1kvR
 EG006gFr/TYxarZJVpb5ZT4e6wrqr8LlcB7UQ1cOEEyv4jfVLw3VhYW57LDTe4Cpt00s
 e05s37qJS3bc4V+5AII71BKZbIinxYuEtMHQgXTWIvb6y3BIhbJGuaQrVCKH/1IwluIQ
 rOCw==
X-Gm-Message-State: AAQBX9c+WTzKdduNgwq8VoI7cc1qX9pZe6YK7IMkkwzvTgI3a8cnjiQ/
 N0ZTepBoy1lxej5KmoL1JxRu5w==
X-Google-Smtp-Source: AKy350bhe7B+4dvtK2pD4mPR5OiusqFeoFo+uINW+/npzRsV+nnljFUiGebPyjpV5+e1C81/HztRBA==
X-Received: by 2002:a05:6a00:248d:b0:63b:165c:fb6b with SMTP id
 c13-20020a056a00248d00b0063b165cfb6bmr1743546pfv.18.1681361386685; 
 Wed, 12 Apr 2023 21:49:46 -0700 (PDT)
Received: from ?IPV6:2400:4050:a840:1e00:4457:c267:5e09:481b?
 ([2400:4050:a840:1e00:4457:c267:5e09:481b])
 by smtp.gmail.com with ESMTPSA id
 i16-20020aa78d90000000b005ae02dc5b94sm297857pfr.219.2023.04.12.21.49.44
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 12 Apr 2023 21:49:46 -0700 (PDT)
Message-ID: <15bf1b00-3aa0-973a-3a86-3fa5c4d41d2c@daynix.com>
Date: Thu, 13 Apr 2023 13:49:43 +0900
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux aarch64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.0
From: Akihiko Odaki <akihiko.odaki@daynix.com>
Subject: virtio-iommu hotplug issue
To: Jean-Philippe Brucker <jean-philippe@linaro.org>,
 Eric Auger <eric.auger@redhat.com>
Cc: virtio-dev@lists.oasis-open.org,
 virtualization@lists.linux-foundation.org, linux-kernel@vger.kernel.org,
 qemu-devel@nongnu.org
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: none client-ip=2607:f8b0:4864:20::52c;
 envelope-from=akihiko.odaki@daynix.com; helo=mail-pg1-x52c.google.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_NONE=0.001 autolearn=ham autolearn_force=no
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

Hi,

Recently I encountered a problem with the combination of Linux's 
virtio-iommu driver and QEMU when a SR-IOV virtual function gets 
disabled. I'd like to ask you what kind of solution is appropriate here 
and implement the solution if possible.

A PCIe device implementing the SR-IOV specification exports a virtual 
function, and the guest can enable or disable it at runtime by writing 
to a configuration register. This effectively looks like a PCI device is 
hotplugged for the guest. In such a case, the kernel assumes the 
endpoint is detached from the virtio-iommu domain, but QEMU actually 
does not detach it.

This inconsistent view of the removed device sometimes prevents the VM 
from correctly performing the following procedure, for example:
1. Enable a VF.
2. Disable the VF.
3. Open a vfio container.
4. Open the group which the PF belongs to.
5. Add the group to the vfio container.
6. Map some memory region.
7. Close the group.
8. Close the vfio container.
9. Repeat 3-8

When the VF gets disabled, the kernel assumes the endpoint is detached 
from the IOMMU domain, but QEMU actually doesn't detach it. Later, the 
domain will be reused in step 3-8.

In step 7, the PF will be detached, and the kernel thinks there is no 
endpoint attached and the mapping the domain holds is cleared, but the 
VF endpoint is still attached and the mapping is kept intact.

In step 9, the same domain will be reused again, and the kernel requests 
to create a new mapping, but it will conflict with the existing mapping 
and result in -EINVAL.

This problem can be fixed by either of:
- requesting the detachment of the endpoint from the guest when the PCI 
device is unplugged (the VF is disabled)
- detecting that the PCI device is gone and automatically detach it on 
QEMU-side.

It is not completely clear for me which solution is more appropriate as 
the virtio-iommu specification is written in a way independent of the 
endpoint mechanism and does not say what should be done when a PCI 
device is unplugged.

Regards,
Akihiko Odaki

