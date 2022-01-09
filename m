Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id EB928488A77
	for <lists+qemu-devel@lfdr.de>; Sun,  9 Jan 2022 17:13:11 +0100 (CET)
Received: from localhost ([::1]:46926 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n6aog-00016J-IC
	for lists+qemu-devel@lfdr.de; Sun, 09 Jan 2022 11:13:10 -0500
Received: from eggs.gnu.org ([209.51.188.92]:48864)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1n6anE-00087o-Kt
 for qemu-devel@nongnu.org; Sun, 09 Jan 2022 11:11:40 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:52202)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1n6anC-00063Y-Ke
 for qemu-devel@nongnu.org; Sun, 09 Jan 2022 11:11:39 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1641744698;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=U7MwRJAB8b5FmOMG02JU/xm2mzUgpk80QSMvpQK/TBI=;
 b=ThcbbqYz6NpCtAiZ0MpBrLliGIC4Q4zD/cYELz/4ImycqPZnIaxRsP14ADOitxxnBlT3G+
 xxuuRN80YCefFYx+emZQJT8F7kwRNOW2QuUVAEW0hD35PwqIjVexOJvxvYHLze8HnMAVJF
 Rt16AIFb5YrUhEmmMWmgAgbj7YPYKi0=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-122-Z5DTTdBrPci6k1ksNzLqrA-1; Sun, 09 Jan 2022 11:11:36 -0500
X-MC-Unique: Z5DTTdBrPci6k1ksNzLqrA-1
Received: by mail-wm1-f71.google.com with SMTP id
 e19-20020a05600c4e5300b003458be97976so3992205wmq.7
 for <qemu-devel@nongnu.org>; Sun, 09 Jan 2022 08:11:36 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to;
 bh=U7MwRJAB8b5FmOMG02JU/xm2mzUgpk80QSMvpQK/TBI=;
 b=trIOQczahmTqOlwGboSqSOL75onq5O08GL/iq2cdz/P+6fVD+MfU6j/JxEb8qkUS/+
 bzs4Exu1PkFtXjjfPB8IbqXMTiVdl0p6KTwdle+Pn6SjMLCyxBi7nKtsy0dS6JAvkLZJ
 wpAHEQsT+Hg4BHYYub2qORYpuAty3rRAE8V3wrAKrlhWKbiBpeDa5d7YrKXHqX9V83Ze
 H+0iJTwkON5uW04yghL8+9PYnxbh9fYGix9ocaMOKA1uBX0RRwbpXWIxemcHoC3Va+3e
 7DszhrTw7Huz1AQeaueiOmw2VMc9xv3DDL7D5tyaHs02DyKAOhQnTsQEPOIF7F2d58HS
 ExiA==
X-Gm-Message-State: AOAM5329ez3gQrWkltljlfVWN8PzvJJUPVVSAiICl4ztIbQlqS962lIA
 7pkdhf4gcX+W52D39xXvqDCE2AyYBtmvJllJm/J3t4ayXawOqnyvPlTmM8sJLv1zZoCo6DtP/su
 tag1/zodG181vpPI=
X-Received: by 2002:a05:600c:206:: with SMTP id
 6mr3013220wmi.181.1641744695676; 
 Sun, 09 Jan 2022 08:11:35 -0800 (PST)
X-Google-Smtp-Source: ABdhPJz1w8j7UWU5DR18Ne+ojzS6Uluda0DCLbJ9RVAEJzgX0tHPCjg89qK6lBG8iXUwUqpWdXo6rQ==
X-Received: by 2002:a05:600c:206:: with SMTP id
 6mr3013209wmi.181.1641744695446; 
 Sun, 09 Jan 2022 08:11:35 -0800 (PST)
Received: from redhat.com ([2a03:c5c0:107e:c07a:cd29:1c16:894b:6b07])
 by smtp.gmail.com with ESMTPSA id k33sm4494079wms.21.2022.01.09.08.11.33
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 09 Jan 2022 08:11:34 -0800 (PST)
Date: Sun, 9 Jan 2022 11:11:31 -0500
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Volker =?iso-8859-1?Q?R=FCmelin?= <vr_qemu@t-online.de>
Subject: Re: [PULL v3 12/55] virtio-pci: add support for configure interrupt
Message-ID: <20220109110613-mutt-send-email-mst@kernel.org>
References: <20220108003423.15830-1-mst@redhat.com>
 <20220108003423.15830-13-mst@redhat.com>
 <2ebfb2e7-bd51-d5ee-7e17-7cec59a0f0d5@t-online.de>
MIME-Version: 1.0
In-Reply-To: <2ebfb2e7-bd51-d5ee-7e17-7cec59a0f0d5@t-online.de>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=mst@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=mst@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -33
X-Spam_score: -3.4
X-Spam_bar: ---
X-Spam_report: (-3.4 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.595,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=-0.01, RCVD_IN_MSPIKE_WL=-0.01,
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
Cc: Peter Maydell <peter.maydell@linaro.org>, qemu-devel@nongnu.org,
 Cindy Lu <lulu@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Sun, Jan 09, 2022 at 07:17:30AM +0100, Volker Rümelin wrote:
> Hi,
> 
> > From: Cindy Lu <lulu@redhat.com>
> > 
> > Add support for configure interrupt, The process is used kvm_irqfd_assign
> > to set the gsi to kernel. When the configure notifier was signal by
> > host, qemu will inject a msix interrupt to guest
> > 
> > Signed-off-by: Cindy Lu <lulu@redhat.com>
> > Message-Id: <20211104164827.21911-11-lulu@redhat.com>
> > Reviewed-by: Michael S. Tsirkin <mst@redhat.com>
> > Signed-off-by: Michael S. Tsirkin <mst@redhat.com>
> > ---
> >   hw/virtio/virtio-pci.h |  4 +-
> >   hw/virtio/virtio-pci.c | 92 ++++++++++++++++++++++++++++++++++++------
> >   2 files changed, 83 insertions(+), 13 deletions(-)
> > 
> 
> Since this commit I see the following warnings.
> 
> With -drive
> if=virtio,id=disk1,file=/srv/cdimg/Linux/images/opensuse.qcow2,discard=unmap
> 
> qemu-system-x86_64: virtio-blk failed to set guest notifier (-16), ensure
> -accel kvm is set.
> qemu-system-x86_64: virtio_bus_start_ioeventfd: failed. Fallback to
> userspace (slower).
> 
> With libvirt
>     <controller type='pci' index='1' model='pcie-root-port'>
>       <address type='pci' domain='0x0000' bus='0x00' slot='0x1c'
> function='0'
>        multifunction='on'/>
>     </controller>
>     <controller type='pci' index='2' model='pcie-root-port'>
>       <address type='pci' domain='0x0000' bus='0x00' slot='0x1c'
> function='1'/>
>     </controller>
>     <controller type='scsi' index='0' model='virtio-scsi'>
>       <driver queues='4'/>
>       <address type='pci' domain='0x0000' bus='0x01' slot='0x00'
> function='0'/>
>     </controller>
>     <disk type='block' device='disk'>
>       <driver name='qemu' type='raw' cache='none' discard='unmap'
> io='io_uring'/>
>       <source dev='/dev/vgtmp/lnxpowerm1'/>
>       <target dev='sda' bus='scsi'/>
>       <address type='drive' controller='0' bus='0' unit='0'/>
>       <boot order='1'/>
>     </disk>
> 
> 2022-01-08T17:45:26.911491Z qemu-system-x86_64: virtio-scsi: Failed to set
> guest notifiers (-16), ensure -accel kvm is set.
> 2022-01-08T17:45:26.911505Z qemu-system-x86_64: virtio_bus_start_ioeventfd:
> failed. Fallback to userspace (slower).
> 
> The messages appear around the time the Linux guest initializes the drivers.
> 
> With best regards,
> Volker

I guess it's a host that has an oldish kernel?
Does the following help?


diff --git a/hw/virtio/virtio-pci.c b/hw/virtio/virtio-pci.c
index 98fb5493ae..b77cd69f97 100644
--- a/hw/virtio/virtio-pci.c
+++ b/hw/virtio/virtio-pci.c
@@ -1130,15 +1130,15 @@ static int virtio_pci_set_guest_notifiers(DeviceState *d, int nvqs, bool assign)
             proxy->vector_irqfd =
                 g_malloc0(sizeof(*proxy->vector_irqfd) *
                           msix_nr_vectors_allocated(&proxy->pci_dev));
+            r = kvm_virtio_pci_vector_config_use(proxy);
+            if (r < 0) {
+                goto config_error;
+            }
             r = kvm_virtio_pci_vector_use(proxy, nvqs);
             if (r < 0) {
                 goto config_assign_error;
             }
         }
-        r = kvm_virtio_pci_vector_config_use(proxy);
-        if (r < 0) {
-            goto config_error;
-        }
         r = msix_set_vector_notifiers(&proxy->pci_dev, virtio_pci_vector_unmask,
                                       virtio_pci_vector_mask,
                                       virtio_pci_vector_poll);
@@ -1155,7 +1155,9 @@ notifiers_error:
         kvm_virtio_pci_vector_release(proxy, nvqs);
     }
 config_error:
-    kvm_virtio_pci_vector_config_release(proxy);
+    if (with_irqfd) {
+        kvm_virtio_pci_vector_config_release(proxy);
+    }
 config_assign_error:
     virtio_pci_set_guest_notifier(d, VIRTIO_CONFIG_IRQ_IDX, !assign,
                                   with_irqfd);
-- 
MST


