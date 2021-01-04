Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5E0662E9620
	for <lists+qemu-devel@lfdr.de>; Mon,  4 Jan 2021 14:37:03 +0100 (CET)
Received: from localhost ([::1]:36680 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kwQ2g-00074m-Fb
	for lists+qemu-devel@lfdr.de; Mon, 04 Jan 2021 08:37:02 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:32846)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1kwQ1b-0006Y9-Dx; Mon, 04 Jan 2021 08:35:55 -0500
Received: from mail-qk1-x730.google.com ([2607:f8b0:4864:20::730]:36242)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1kwQ1Z-0006uC-CW; Mon, 04 Jan 2021 08:35:55 -0500
Received: by mail-qk1-x730.google.com with SMTP id 186so23335664qkj.3;
 Mon, 04 Jan 2021 05:35:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=to:from:subject:message-id:date:user-agent:mime-version
 :content-language:content-transfer-encoding;
 bh=X6AzKiJ+qgNfRAmX68nI6n5kFLC+eQ6kRyAd8XkgsrE=;
 b=j4Y52u1NKfNM0qSt7jcSq7x+gsNhfuddf3bDvcoglHTH1dT59/xp0abIWxTZ3YFsjs
 2HJEngMe5RcbGubFV7LCHr2Yq9us/0m2pbRneWSth5B5eUfLChNihT/m7JWtLSIReocq
 Iua8bkKkyHUaswlmpeAwJsQUjppjP6HaDnwbr88tO9rXFio0Gm980J6sAX+4mazQbMmb
 zU1+eqDmaY/o4mKVsXQ7S1dZgZUg0qrVhATowAzCNjMImJrdmJRtwRsgBGz/Via7N5SP
 jPsQcbKxtyaRh8MkOgzOqZOg8EwwtQPs7RXKOughwaue+PhPbqADSF6pSV5eVIVYqG+J
 LNHw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:to:from:subject:message-id:date:user-agent
 :mime-version:content-language:content-transfer-encoding;
 bh=X6AzKiJ+qgNfRAmX68nI6n5kFLC+eQ6kRyAd8XkgsrE=;
 b=Tyd9MLlODlToqB+E5GSx2EEnC+0wHSsKb/bwStPhvbA/qkri9rq0Zma526pVwK8ZPX
 ha66rvMS4bcTzkELTiHKaJt7LstordIlNr6cDDERtf2in2aYWva8sBvDymZTtyqvufMV
 DA6q8JuOGwksZi1+BP+bwyRJiO0nu6Jz7Atp0Yj3MNIvXbBaMjdsoBKZiwGSsaG8wOkh
 z66/EwhLKcR5Q2oYAazdaGzu4Gj+IukSXbpB24Hg/5hdy4IXxKBR0t4kcr8F4As0c83w
 gG43Psngcf5SBArSsZOR/0NBdveGtHBPhwmRJcU2I/71/vDb3ldiR7aL4ZtP3ECfJi1P
 zoFw==
X-Gm-Message-State: AOAM532mg4DhbUO80HeT29/uxc7opiJlSmVGIKNKKAlwNz09xHdz+d6I
 MQTYD72uXPOtUAw9gQwCmd2j/yoaDMdOzQ==
X-Google-Smtp-Source: ABdhPJw2ltiJB4r8yCHpU4c4dmxkXJoc1LGRBDqcUtarNA9P7UNblCT90lEVlcjGUW+wpzn1U3cvIw==
X-Received: by 2002:a37:9505:: with SMTP id x5mr67063367qkd.295.1609767351346; 
 Mon, 04 Jan 2021 05:35:51 -0800 (PST)
Received: from ?IPv6:2804:431:c7c6:ca55:7a5d:da5b:906f:bedd?
 ([2804:431:c7c6:ca55:7a5d:da5b:906f:bedd])
 by smtp.gmail.com with ESMTPSA id p75sm38150071qka.72.2021.01.04.05.35.49
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 04 Jan 2021 05:35:50 -0800 (PST)
To: "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>,
 "qemu-ppc@nongnu.org" <qemu-ppc@nongnu.org>
From: Daniel Henrique Barboza <danielhb413@gmail.com>
Subject: [Question] SR-IOV VF 'surprise removal' and vfio_reset behavior in
 pSeries
Message-ID: <6fd0ed1a-0ac8-af97-88ad-ffaba34e92e6@gmail.com>
Date: Mon, 4 Jan 2021 10:35:45 -0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.0
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::730;
 envelope-from=danielhb413@gmail.com; helo=mail-qk1-x730.google.com
X-Spam_score_int: -17
X-Spam_score: -1.8
X-Spam_bar: -
X-Spam_report: (-1.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 FREEMAIL_ENVFROM_END_DIGIT=0.25, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Hi,

This question came up while I was investigating a Libvirt bug [1], where an user is removing
VFs from the host while Libvirt domains was using them, causing Libvirt to remain in
an inconsistent state. I'm trying to alleviate the effects of this in Libvirt (see [2] if curious),
but QEMU is throwing some messages in the terminal that, although it appears to be benign,
I'm not sure if it's a symptom of something that should be fixed.

In a Power 9 server running a Mellanox MT28800 SR-IOV netcard I have the following IOMMU
settings, where the physical card is at Group 0 and all the VFs are allocated from Group 12 and
onwards:

IOMMU Group 0 0000:01:00.0 Infiniband controller [0207]: Mellanox Technologies MT28800 Family [ConnectX-5 Ex] [15b3:1019]
(...)
IOMMU Group 12 0000:01:00.2 Infiniband controller [0207]: Mellanox Technologies MT27800 Family [ConnectX-5 Virtual Function] [15b3:1018]
IOMMU Group 13 0000:01:00.3 Infiniband controller [0207]: Mellanox Technologies MT27800 Family [ConnectX-5 Virtual Function] [15b3:1018]
(...)


Creating a guest with the Group 12 VF and trying to remove the VF from the host via

echo 0 > /sys/bus/pci/devices/0000\:01\:00.0/sriov_numvfs


Makes the guest remove the VF card, but throwing a warning/error message in QEMU log:

"qemu-system-ppc64: vfio: Cannot reset device 0000:01:00.2, depends on group 0 which is not owned."


I found this message confusing because the VF was occupying IOMMU group 12, but the message is
claiming that the reset wasn't possible because Group 0 wasn't owned by the process.

Digging it a bit, the hotunplug is fired up via the poweroff state of the card triggering pSeries internals,
and then reaching spapr_pci_unplug() in hw/ppc/spapr_pci.c. The body of the function reads:

-------
     /* some version guests do not wait for completion of a device
      * cleanup (generally done asynchronously by the kernel) before
      * signaling to QEMU that the device is safe, but instead sleep
      * for some 'safe' period of time. unfortunately on a busy host
      * this sleep isn't guaranteed to be long enough, resulting in
      * bad things like IRQ lines being left asserted during final
      * device removal. to deal with this we call reset just prior
      * to finalizing the device, which will put the device back into
      * an 'idle' state, as the device cleanup code expects.
      */
     pci_device_reset(PCI_DEVICE(plugged_dev));
-------

My first question is right at this point: do we need PCI reset for a VF removal?  I am not sure about
handling IRQ lines asserted for a device that the kernel is going to remove.

Going on further to the origin on the warning message we get to hw/vfio/pci.c, vfio_pci_hot_reset().
The VFIO_DEVICE_GET_PCI_HOT_RESET_INFO ioctl() is returning all VFs of the card, including
the physical function, in the vfio_pci_hot_reset_info struct. Then, down where it verifies if all
IOMMU groups required for reset belongs to the process, it fails to reset the VF because QEMU
does not have Group 0 ownership:

-------
     ret = ioctl(vdev->vbasedev.fd, VFIO_DEVICE_GET_PCI_HOT_RESET_INFO, info);
     if (ret) {
         ret = -errno;
         error_report("vfio: hot reset info failed: %m");
         goto out_single;
     }

(...)

         QLIST_FOREACH(group, &vfio_group_list, next) {
             if (group->groupid == devices[i].group_id) {
                 break;
             }
         }

         if (!group) {
             if (!vdev->has_pm_reset) {
                 error_report("vfio: Cannot reset device %s, "
                              "depends on group %d which is not owned.",
                              vdev->vbasedev.name, devices[i].group_id);
             }
             ret = -EPERM;
             goto out;
         }
-------

This message is not clear to me because I'm aware that the VF was in Group 12, but apparently the
code is demanding ownership of all IOMMU Groups related to the card to allow the reset.

The second question: is this intended?  If not, then someone is behaving badly (perhaps the card driver,
mlx5_core) and reporting wrong info to that VFIO ioctl(). If this reset behavior is intended, then I
might insert a code in spapr_pci_unplug() to skip resetting the VF in this particular case to avoid the
error message (assuming that we really can live without a reset in this case).


Thanks,


DHB


[1] https://gitlab.com/libvirt/libvirt/-/issues/72
[2] https://www.redhat.com/archives/libvir-list/2021-January/msg00028.html

