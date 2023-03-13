Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id ABC8C6B713F
	for <lists+qemu-devel@lfdr.de>; Mon, 13 Mar 2023 09:38:05 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pbdfX-0007eP-OY; Mon, 13 Mar 2023 04:36:35 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1pbdfS-0007cq-AQ
 for qemu-devel@nongnu.org; Mon, 13 Mar 2023 04:36:30 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1pbdfN-0002Ut-Mb
 for qemu-devel@nongnu.org; Mon, 13 Mar 2023 04:36:30 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1678696584;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=OWt5vj9MMwXb4l9+uwottEsS1Nl//OGUSfQKqU3untY=;
 b=X47CRGb3XaA3Y2sMQ1kWSGAXypOVI0TlgZ58jKdkALmWS35gVuImYuIwjxDw8i2U4uujmK
 qLCMJkxu4/K8OgX8cZ1n48mOqZKFzOTTHHV9Vz28UxXJhvGXsHlqx7KSWoqYASML+yiJhV
 qXMM/96fxz6rR7gjcz2lF+Xa60fpXoA=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-652-6fSsu8ZXO8y6RdmtjTnJkw-1; Mon, 13 Mar 2023 04:36:23 -0400
X-MC-Unique: 6fSsu8ZXO8y6RdmtjTnJkw-1
Received: by mail-wm1-f69.google.com with SMTP id
 ay12-20020a05600c1e0c00b003ed201dcf71so1058068wmb.4
 for <qemu-devel@nongnu.org>; Mon, 13 Mar 2023 01:36:23 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1678696582;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=OWt5vj9MMwXb4l9+uwottEsS1Nl//OGUSfQKqU3untY=;
 b=AH9a+dvNQcRPLWkrQ7OuXNUZEu4QMPh+LhPHPhuGcAw3mvt7d9CJZoC+e5ElS+BdhV
 d7MxNOUJYjBHOdI157bCHGsT3KVv++dR3aGojqy8fpOu+/N4m8dzb9DqYNYXl1/Nw2mZ
 F3eV4hElitg8W/Hsoo4KDrcnI87O2kp/SMT+spA6CIKY6C/P28QMUDfmvdbEHEMkIebi
 0F/MOvW4/KIWdlFDLZ3gR+KKFTIHxKGeXVTbg58iuJE9CIHqFVN7SaI7wohzUydDgtSk
 4pHBZDKZSa0m1hiZhGBpc7GMpVnOQW71MB64Pln05Of1C6i9YiAR3qKN3NoBw6pfUu8C
 rJEA==
X-Gm-Message-State: AO0yUKUpPkkJWItFCRVcA/ad5c+r36CU6Oi6RgWtMmxXgrHvE5oyOUbT
 UDYZNzoXX8nvb8cL9yaHLby6bokAty5Zyd2zcNJ47uelQ+u+B1CFAwsrCW4rZ55deObwlDLTlIH
 Lqc2VbQrzODSXnMk=
X-Received: by 2002:a5d:6504:0:b0:2ce:39d3:c9a5 with SMTP id
 x4-20020a5d6504000000b002ce39d3c9a5mr21946650wru.22.1678696582374; 
 Mon, 13 Mar 2023 01:36:22 -0700 (PDT)
X-Google-Smtp-Source: AK7set+MQhE6wSCnJV1f3TtYtFcxGiN5fNsHY1JDaSaepfTCQcDtrqqNRgmQVYfYKIYqqxPt0EH8gA==
X-Received: by 2002:a5d:6504:0:b0:2ce:39d3:c9a5 with SMTP id
 x4-20020a5d6504000000b002ce39d3c9a5mr21946635wru.22.1678696582103; 
 Mon, 13 Mar 2023 01:36:22 -0700 (PDT)
Received: from [192.168.0.2] (ip-109-43-179-26.web.vodafone.de.
 [109.43.179.26]) by smtp.gmail.com with ESMTPSA id
 q12-20020adfcd8c000000b002ceaeb4b608sm3160170wrj.34.2023.03.13.01.36.19
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 13 Mar 2023 01:36:21 -0700 (PDT)
Message-ID: <18ea04ff-4ebf-b163-0dcf-f0b8e966bda4@redhat.com>
Date: Mon, 13 Mar 2023 09:36:18 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.13.0
Subject: Re: [PATCH v7 4/6] hw: replace most qemu_bh_new calls with
 qemu_bh_new_guarded
Content-Language: en-US
To: Alexander Bulekov <alxndr@bu.edu>, qemu-devel@nongnu.org
Cc: Stefan Hajnoczi <stefanha@redhat.com>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>,
 Mauro Matteo Cascella <mcascell@redhat.com>, Peter Xu <peterx@redhat.com>,
 Jason Wang <jasowang@redhat.com>, David Hildenbrand <david@redhat.com>,
 Gerd Hoffmann <kraxel@redhat.com>, Laurent Vivier <lvivier@redhat.com>,
 Bandan Das <bsd@redhat.com>, "Edgar E . Iglesias"
 <edgar.iglesias@gmail.com>, Darren Kenny <darren.kenny@oracle.com>,
 Bin Meng <bin.meng@windriver.com>, Paolo Bonzini <pbonzini@redhat.com>,
 "Michael S . Tsirkin" <mst@redhat.com>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 =?UTF-8?Q?Daniel_P_=2e_Berrang=c3=a9?= <berrange@redhat.com>,
 Eduardo Habkost <eduardo@habkost.net>, Jon Maloy <jmaloy@redhat.com>,
 Siqi Chen <coc.cyqh@gmail.com>, Paul Durrant <paul@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Anthony Perard <anthony.perard@citrix.com>, Kevin Wolf <kwolf@redhat.com>,
 Hanna Reitz <hreitz@redhat.com>, Amit Shah <amit@kernel.org>,
 =?UTF-8?Q?Marc-Andr=c3=a9_Lureau?= <marcandre.lureau@redhat.com>,
 John Snow <jsnow@redhat.com>, Peter Maydell <peter.maydell@linaro.org>,
 Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
 Keith Busch <kbusch@kernel.org>, Klaus Jensen <its@irrelevant.dk>,
 Fam Zheng <fam@euphon.net>, Dmitry Fleytman <dmitry.fleytman@gmail.com>,
 "Gonglei (Arei)" <arei.gonglei@huawei.com>,
 "open list:X86 Xen CPUs" <xen-devel@lists.xenproject.org>,
 "open list:virtio-blk" <qemu-block@nongnu.org>,
 "open list:i.MX31 (kzm)" <qemu-arm@nongnu.org>,
 "open list:New World (mac99)" <qemu-ppc@nongnu.org>
References: <20230313082417.827484-1-alxndr@bu.edu>
 <20230313082417.827484-5-alxndr@bu.edu>
From: Thomas Huth <thuth@redhat.com>
In-Reply-To: <20230313082417.827484-5-alxndr@bu.edu>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001,
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

On 13/03/2023 09.24, Alexander Bulekov wrote:
> This protects devices from bh->mmio reentrancy issues.
> 
> Thanks: Thomas Huth <thuth@redhat.com> for diagnosing OS X test failure.
> Reviewed-by: Darren Kenny <darren.kenny@oracle.com>
> Reviewed-by: Stefan Hajnoczi <stefanha@redhat.com>
> Reviewed-by: Michael S. Tsirkin <mst@redhat.com>
> Reviewed-by: Paul Durrant <paul@xen.org>
> Signed-off-by: Alexander Bulekov <alxndr@bu.edu>
> ---
>   hw/9pfs/xen-9p-backend.c        | 5 ++++-
>   hw/block/dataplane/virtio-blk.c | 3 ++-
>   hw/block/dataplane/xen-block.c  | 5 +++--
>   hw/char/virtio-serial-bus.c     | 3 ++-
>   hw/display/qxl.c                | 9 ++++++---
>   hw/display/virtio-gpu.c         | 6 ++++--
>   hw/ide/ahci.c                   | 3 ++-
>   hw/ide/ahci_internal.h          | 1 +
>   hw/ide/core.c                   | 4 +++-
>   hw/misc/imx_rngc.c              | 6 ++++--
>   hw/misc/macio/mac_dbdma.c       | 2 +-
>   hw/net/virtio-net.c             | 3 ++-
>   hw/nvme/ctrl.c                  | 6 ++++--
>   hw/scsi/mptsas.c                | 3 ++-
>   hw/scsi/scsi-bus.c              | 3 ++-
>   hw/scsi/vmw_pvscsi.c            | 3 ++-
>   hw/usb/dev-uas.c                | 3 ++-
>   hw/usb/hcd-dwc2.c               | 3 ++-
>   hw/usb/hcd-ehci.c               | 3 ++-
>   hw/usb/hcd-uhci.c               | 2 +-
>   hw/usb/host-libusb.c            | 6 ++++--
>   hw/usb/redirect.c               | 6 ++++--
>   hw/usb/xen-usb.c                | 3 ++-
>   hw/virtio/virtio-balloon.c      | 5 +++--
>   hw/virtio/virtio-crypto.c       | 3 ++-
>   25 files changed, 66 insertions(+), 33 deletions(-)

Reviewed-by: Thomas Huth <thuth@redhat.com>


