Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0CA2548E53E
	for <lists+qemu-devel@lfdr.de>; Fri, 14 Jan 2022 09:12:47 +0100 (CET)
Received: from localhost ([::1]:38092 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n8HhU-0006VG-Q8
	for lists+qemu-devel@lfdr.de; Fri, 14 Jan 2022 03:12:44 -0500
Received: from eggs.gnu.org ([209.51.188.92]:51420)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1n8GZD-0005RD-R7
 for qemu-devel@nongnu.org; Fri, 14 Jan 2022 02:00:07 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:48203)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1n8GZ9-0008Cq-QJ
 for qemu-devel@nongnu.org; Fri, 14 Jan 2022 02:00:05 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1642143603;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=yOK5xYSh1FtuE1McPhlJvPKMXYPSmh6qcCuMZNqtwrk=;
 b=Fptl2zX3WJNitdb4GJmuB24/ZFBAfLidewC/s2MQqn8xUYpFjbJfFHOuY1wpFNx2XI937O
 U6W9Pp25+YzxjjzcX0huEEBIgkLvwIUA4081en/lOtUNUo/njgFmMrc1DzhJYZsvAgdimh
 WbuFXNhoOk2HhlT1gBjeeqcVUlDjzpQ=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-638-D93fN1xCMPO_NV3_QrjwzA-1; Fri, 14 Jan 2022 02:00:00 -0500
X-MC-Unique: D93fN1xCMPO_NV3_QrjwzA-1
Received: by mail-wr1-f69.google.com with SMTP id
 d14-20020adfa34e000000b001a631cb3ab5so1517748wrb.12
 for <qemu-devel@nongnu.org>; Thu, 13 Jan 2022 22:59:59 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=yOK5xYSh1FtuE1McPhlJvPKMXYPSmh6qcCuMZNqtwrk=;
 b=SFN8mob1Iw1WJFFXgO826mXw47cHBAH/Jh7tctYd5Ne1eQScxkIjPvINIKyT5JJwKo
 iiFWhROcR9uz9ztArSZ0ntBpxbIs8I3ZnQD6qDXMSBhhqylDp8Iq+54gD3ni6uUfRQrs
 3gb+Z4R+5x7JYuyr9yHnpdl/CqYhsZ77de2bkAQ4UieIoMcU/KT8FBjOOsA/LZL55ETh
 H6G1ZYSiSC24Ti7QXXqXuQy5YRzqC7VC+ZF73J5Wn2Btg4oWggg7mYGLxmP0hDiJPYgg
 9f2iwJ8BozK1lw5hVnRigZFiC1PEl3TqVRqd2sA+xUCPe6iJAFvrOVtX9/tlY6eaN84V
 NeUA==
X-Gm-Message-State: AOAM532M1VnnI74VzWCH3t4sM7Lh0GWn70g4C/cbM0iKRvjfcgwI+WBf
 36RsOjGeBKNLUbRWoV1/easXTaCKjDN35oq6+CAIHfOeft8K7gBZJOnbNWm+8fHrNhojBOkoMab
 nvYecOs3RkCScSLk=
X-Received: by 2002:a05:6000:c8:: with SMTP id
 q8mr7029356wrx.611.1642143598834; 
 Thu, 13 Jan 2022 22:59:58 -0800 (PST)
X-Google-Smtp-Source: ABdhPJxV+HTwRahAA4geCnQVubX4Pfhl/gGbyIcVC++ab3IoF7RdaU/+bXelqehPlU9L6QozMsxw6g==
X-Received: by 2002:a05:6000:c8:: with SMTP id
 q8mr7029313wrx.611.1642143598578; 
 Thu, 13 Jan 2022 22:59:58 -0800 (PST)
Received: from [192.168.42.76] (tmo-098-185.customers.d1-online.com.
 [80.187.98.185])
 by smtp.gmail.com with ESMTPSA id r205sm3437942wma.26.2022.01.13.22.59.55
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 13 Jan 2022 22:59:57 -0800 (PST)
Message-ID: <a75789e0-0ace-c898-ea61-9b55624c772a@redhat.com>
Date: Fri, 14 Jan 2022 07:59:54 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.4.0
Subject: Re: [PATCH] Mark remaining global TypeInfo instances as const
To: Bernhard Beschow <shentey@gmail.com>, qemu-devel@nongnu.org
References: <20220113171038.18128-1-shentey@gmail.com>
From: Thomas Huth <thuth@redhat.com>
In-Reply-To: <20220113171038.18128-1-shentey@gmail.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=thuth@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -33
X-Spam_score: -3.4
X-Spam_bar: ---
X-Spam_report: (-3.4 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.595,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001,
 RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: Fam Zheng <fam@euphon.net>, Peter Maydell <peter.maydell@linaro.org>,
 Matthew Rosato <mjrosato@linux.ibm.com>, "Michael S. Tsirkin" <mst@redhat.com>,
 Jason Wang <jasowang@redhat.com>, David Hildenbrand <david@redhat.com>,
 Laurent Vivier <laurent@vivier.eu>, Gerd Hoffmann <kraxel@redhat.com>,
 Ani Sinha <ani@anisinha.ca>, "Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
 qemu-trivial@nongnu.org, Daniel Henrique Barboza <danielhb413@gmail.com>,
 Havard Skinnemoen <hskinnemoen@google.com>, Halil Pasic <pasic@linux.ibm.com>,
 =?UTF-8?Q?Herv=c3=a9_Poussineau?= <hpoussin@reactos.org>,
 Joel Stanley <joel@jms.id.au>,
 Christian Borntraeger <borntraeger@linux.ibm.com>,
 Eric Farman <farman@linux.ibm.com>, Corey Minyard <minyard@acm.org>,
 "open list:S390 PCI" <qemu-s390x@nongnu.org>,
 Alistair Francis <alistair@alistair23.me>,
 Richard Henderson <richard.henderson@linaro.org>, Greg Kurz <groug@kaod.org>,
 Beniamino Galvani <b.galvani@gmail.com>,
 Alex Williamson <alex.williamson@redhat.com>,
 "open list:Raspberry Pi" <qemu-arm@nongnu.org>,
 =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>,
 Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 David Gibson <david@gibson.dropbear.id.au>,
 Eduardo Habkost <eduardo@habkost.net>,
 =?UTF-8?Q?Daniel_P=2e_Berrang=c3=a9?= <berrange@redhat.com>,
 Xiao Guangrong <xiaoguangrong.eric@gmail.com>,
 Andrew Jeffery <andrew@aj.id.au>, Cornelia Huck <cohuck@redhat.com>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>,
 Andrew Baumann <Andrew.Baumann@microsoft.com>,
 Tyrone Ting <kfting@nuvoton.com>, "open list:e500" <qemu-ppc@nongnu.org>,
 Igor Mammedov <imammedo@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 13/01/2022 18.10, Bernhard Beschow wrote:
> More than 1k of TypeInfo instances are already marked as const. Mark the
> remaining ones, too.
> 
> Signed-off-by: Bernhard Beschow <shentey@gmail.com>
> ---
>   hw/core/generic-loader.c   | 2 +-
>   hw/core/guest-loader.c     | 2 +-
>   hw/display/bcm2835_fb.c    | 2 +-
>   hw/display/i2c-ddc.c       | 2 +-
>   hw/display/macfb.c         | 4 ++--
>   hw/display/virtio-vga.c    | 2 +-
>   hw/dma/bcm2835_dma.c       | 2 +-
>   hw/i386/pc_piix.c          | 2 +-
>   hw/i386/sgx-epc.c          | 2 +-
>   hw/intc/bcm2835_ic.c       | 2 +-
>   hw/intc/bcm2836_control.c  | 2 +-
>   hw/ipmi/ipmi.c             | 4 ++--
>   hw/mem/nvdimm.c            | 2 +-
>   hw/mem/pc-dimm.c           | 2 +-
>   hw/misc/bcm2835_mbox.c     | 2 +-
>   hw/misc/bcm2835_powermgt.c | 2 +-
>   hw/misc/bcm2835_property.c | 2 +-
>   hw/misc/bcm2835_rng.c      | 2 +-
>   hw/misc/pvpanic-isa.c      | 2 +-
>   hw/misc/pvpanic-pci.c      | 2 +-
>   hw/net/fsl_etsec/etsec.c   | 2 +-
>   hw/ppc/prep_systemio.c     | 2 +-
>   hw/ppc/spapr_iommu.c       | 2 +-
>   hw/s390x/s390-pci-bus.c    | 2 +-
>   hw/s390x/sclp.c            | 2 +-
>   hw/s390x/tod-kvm.c         | 2 +-
>   hw/s390x/tod-tcg.c         | 2 +-
>   hw/s390x/tod.c             | 2 +-
>   hw/scsi/lsi53c895a.c       | 2 +-
>   hw/sd/allwinner-sdhost.c   | 2 +-
>   hw/sd/aspeed_sdhci.c       | 2 +-
>   hw/sd/bcm2835_sdhost.c     | 2 +-
>   hw/sd/cadence_sdhci.c      | 2 +-
>   hw/sd/npcm7xx_sdhci.c      | 2 +-
>   hw/usb/dev-mtp.c           | 2 +-
>   hw/usb/host-libusb.c       | 2 +-
>   hw/vfio/igd.c              | 2 +-
>   hw/virtio/virtio-pmem.c    | 2 +-
>   qom/object.c               | 4 ++--
>   39 files changed, 42 insertions(+), 42 deletions(-)

Reviewed-by: Thomas Huth <thuth@redhat.com>




