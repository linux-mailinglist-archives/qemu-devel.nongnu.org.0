Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 474235288E1
	for <lists+qemu-devel@lfdr.de>; Mon, 16 May 2022 17:31:24 +0200 (CEST)
Received: from localhost ([::1]:39916 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nqcgt-00023R-AO
	for lists+qemu-devel@lfdr.de; Mon, 16 May 2022 11:31:23 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57116)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <sgarzare@redhat.com>)
 id 1nqcQ5-0006rW-Ej
 for qemu-devel@nongnu.org; Mon, 16 May 2022 11:14:01 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:33658)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <sgarzare@redhat.com>)
 id 1nqcQ2-0003q9-Rw
 for qemu-devel@nongnu.org; Mon, 16 May 2022 11:14:00 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1652714037;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=2Z7veMN+rwEq81zOlRRr93h3uM7FwElFPJnP45Jbsd8=;
 b=PeQSxWq8WzTg+5P8rOHZz9UdDWh0ckEGYrFnx8KZH/V6Q2e1TAXR3129dHL7NCRyltNYQz
 jFsFyItwVahYPaf4U2d06+/oOjJTC5w/FoUqV9Ste1jeMTRDza6TGsR7W5+/HSduNEgN24
 TOS0cauvMXkmakHRyMJon0+1GRUaQaM=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-639-rDscOYTCPNGHF_Q4MnHsLg-1; Mon, 16 May 2022 11:13:56 -0400
X-MC-Unique: rDscOYTCPNGHF_Q4MnHsLg-1
Received: by mail-wm1-f72.google.com with SMTP id
 bi5-20020a05600c3d8500b0039489e1d18dso10495971wmb.5
 for <qemu-devel@nongnu.org>; Mon, 16 May 2022 08:13:56 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=2Z7veMN+rwEq81zOlRRr93h3uM7FwElFPJnP45Jbsd8=;
 b=kujtJx7EQOe7a42OrF5lTAL3JUV1hwoKiUTK8pFbrRETaTk0zTTz+Zz7+8nKO2lBCO
 X1wQWz5TLy6qs1keRCLw57/cSrid3DPGxveqj9aGeDly1qiNPqLDS0G+6TlIkRVN1+nu
 RDOIbDMVI//T8PZi54SiyoaNGj97S2Bgz95HVkYSKmhLz7a0kJMURm5UGggq6h749EIm
 ZYuQbXSqo2mxVGSs352c6POqy7qSA4tZnElq8P3+2oeijXgpQF6Nsv6UITYScZKFpLea
 Sg9KDDxfspjnlpVKb1bJtzKdYgKeuaLJ36AVkzgdmS4szzxn5/THizhrHcvLAkKxcwFX
 qa8Q==
X-Gm-Message-State: AOAM533gJ/60mGQWphIBAmlzeE+tMObdivdxKQrAS/1V31XfmFN9Qzpz
 ZSRA10Eh3Sl3LoW3ly78YOocXCkPjkmVB8qwL1VvhlkuRTeLr5wWZMG/+axq7u8h0FJ4WpJutgy
 MGG5fA36XuS93eP8=
X-Received: by 2002:adf:a454:0:b0:20d:749:6d5c with SMTP id
 e20-20020adfa454000000b0020d07496d5cmr5590370wra.488.1652714035184; 
 Mon, 16 May 2022 08:13:55 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyCkuqRPGKiAjMIX97bYQKneF8BaJiawMFpMuI5UGI24cgweSqZe3xFDXR19uX+DhYEXoQDiA==
X-Received: by 2002:adf:a454:0:b0:20d:749:6d5c with SMTP id
 e20-20020adfa454000000b0020d07496d5cmr5590347wra.488.1652714034925; 
 Mon, 16 May 2022 08:13:54 -0700 (PDT)
Received: from sgarzare-redhat (host-87-11-6-106.retail.telecomitalia.it.
 [87.11.6.106]) by smtp.gmail.com with ESMTPSA id
 l16-20020a1ced10000000b00396f8c79d22sm6655728wmh.11.2022.05.16.08.13.53
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 16 May 2022 08:13:54 -0700 (PDT)
Date: Mon, 16 May 2022 17:13:51 +0200
From: Stefano Garzarella <sgarzare@redhat.com>
To: "Longpeng(Mike)" <longpeng2@huawei.com>
Cc: stefanha@redhat.com, mst@redhat.com, jasowang@redhat.com,
 cohuck@redhat.com, pbonzini@redhat.com, arei.gonglei@huawei.com,
 yechuan@huawei.com, huangzhichao@huawei.com, qemu-devel@nongnu.org
Subject: Re: [PATCH v6 resend 3/4] vdpa: add vdpa-dev support
Message-ID: <20220516151351.se7weg4reedsiglw@sgarzare-redhat>
References: <20220514041107.1980-1-longpeng2@huawei.com>
 <20220514041107.1980-4-longpeng2@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Disposition: inline
In-Reply-To: <20220514041107.1980-4-longpeng2@huawei.com>
Received-SPF: pass client-ip=170.10.129.124; envelope-from=sgarzare@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Sat, May 14, 2022 at 12:11:06PM +0800, Longpeng(Mike) wrote:
>From: Longpeng <longpeng2@huawei.com>
>
>Supports vdpa-dev, we can use the deivce directly:
>
>-M microvm -m 512m -smp 2 -kernel ... -initrd ... -device \
>vhost-vdpa-device,vhostdev=/dev/vhost-vdpa-x
>
>Signed-off-by: Longpeng <longpeng2@huawei.com>
>---
> hw/virtio/Kconfig            |   5 +
> hw/virtio/meson.build        |   1 +
> hw/virtio/vdpa-dev.c         | 377 +++++++++++++++++++++++++++++++++++
> include/hw/virtio/vdpa-dev.h |  43 ++++
> 4 files changed, 426 insertions(+)
> create mode 100644 hw/virtio/vdpa-dev.c
> create mode 100644 include/hw/virtio/vdpa-dev.h

Reviewed-by: Stefano Garzarella <sgarzare@redhat.com>


