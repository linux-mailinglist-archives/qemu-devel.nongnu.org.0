Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BB4BF429C13
	for <lists+qemu-devel@lfdr.de>; Tue, 12 Oct 2021 05:48:44 +0200 (CEST)
Received: from localhost ([::1]:54536 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ma8mR-0000F5-AB
	for lists+qemu-devel@lfdr.de; Mon, 11 Oct 2021 23:48:43 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41172)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jasowang@redhat.com>)
 id 1ma8je-0007Rx-Ku
 for qemu-devel@nongnu.org; Mon, 11 Oct 2021 23:45:51 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:21446)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jasowang@redhat.com>)
 id 1ma8jb-0008S1-Si
 for qemu-devel@nongnu.org; Mon, 11 Oct 2021 23:45:49 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1634010346;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=zeexGU51e3vYmEUlaGSPpjbIySlFsVG+RPUlciCb13Y=;
 b=iuDl8hIakqHPpwhAenKUE0kv1o7ii5exU+oUP377UX9fBzNv5Ptdyi3HbFJFrQl/Z19Wj4
 a1KzSxI1jDMMDZ2HrVUXA5O3D7xmgppBa+kh3pQ5hwPimZ37OEaPDXboPMLq9I6a9N2GTg
 Qib9D2FtfMhDDWE6LTWjbn/mAFbg3mo=
Received: from mail-lf1-f70.google.com (mail-lf1-f70.google.com
 [209.85.167.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-393-4_B4VZZwMf6spRI4VTWwjg-1; Mon, 11 Oct 2021 23:45:44 -0400
X-MC-Unique: 4_B4VZZwMf6spRI4VTWwjg-1
Received: by mail-lf1-f70.google.com with SMTP id
 bi16-20020a0565120e9000b003fd56ef5a94so13057272lfb.3
 for <qemu-devel@nongnu.org>; Mon, 11 Oct 2021 20:45:44 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=zeexGU51e3vYmEUlaGSPpjbIySlFsVG+RPUlciCb13Y=;
 b=glydFJZX8g1VQFph2FxM4Tj5sLSAh0I+VyuEfwb7UcnXlC1hetBFXQgUPuISvmi3bc
 kTF+JmCL/r7/Jmxz/iOYk8lTfvNBZ4mpblTIdxwPUvD8Vy7ylPyY7N+62MpSJdXxSXLC
 frJ9ykXFyRdpxSDE3vm6Z0spB2gRfcSRzpHItggbuihtGSonZIsOpKfNFbHWHQUZKMiN
 Gij986waT6amOuGyq7MctMyTWB/yUoqLHK2jZ7LJR5yyVR/tZWwPN6+JffBMy7N+jBlQ
 +RPcsnIm7kATWvWDUbpTByMfgmCAKBTYfAwofuECXJ1tApTHAjZ+HGx+F9FmlSI+fHxv
 fdZw==
X-Gm-Message-State: AOAM532FLmJszCjH8ChKz7zbZaCsmxr7iFAHMsRNRm/Lw06roMZoG8p9
 FZBSiYzASsYljfbvZXVO5HcGlcJAJuV1e0sbUJVbE75/VzQDT7TjxSsQME3b90QkrNsWeqbHXF2
 nJNM1RjrfHoEYCfUAnjGwfHN76189NdA=
X-Received: by 2002:a05:6512:3b22:: with SMTP id
 f34mr29615054lfv.629.1634010343366; 
 Mon, 11 Oct 2021 20:45:43 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxBfhDcD8P9heIBeiFoVy3OsD6cBfwDChLGhGX26b6vPJdSsrG3Px6fUedr0m9nS4ZP8ZIOdqPkC0YqeD5xI04=
X-Received: by 2002:a05:6512:3b22:: with SMTP id
 f34mr29615031lfv.629.1634010343108; 
 Mon, 11 Oct 2021 20:45:43 -0700 (PDT)
MIME-Version: 1.0
References: <20211005134843.439050-1-eperezma@redhat.com>
 <20211005134843.439050-2-eperezma@redhat.com>
In-Reply-To: <20211005134843.439050-2-eperezma@redhat.com>
From: Jason Wang <jasowang@redhat.com>
Date: Tue, 12 Oct 2021 11:45:32 +0800
Message-ID: <CACGkMEtHdXSNT8v0UwWMd+eSVk6D0ztpOA9LpzF38b0eqiGcmg@mail.gmail.com>
Subject: Re: [PATCH v2 1/3] vdpa: Skip protected ram IOMMU mappings
To: =?UTF-8?Q?Eugenio_P=C3=A9rez?= <eperezma@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=jasowang@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=216.205.24.124; envelope-from=jasowang@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.049,
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
Cc: Parav Pandit <parav@mellanox.com>, "Michael S. Tsirkin" <mst@redhat.com>,
 qemu-devel <qemu-devel@nongnu.org>,
 virtualization <virtualization@lists.linux-foundation.org>,
 Stefan Hajnoczi <stefanha@redhat.com>, Eli Cohen <eli@mellanox.com>,
 Stefano Garzarella <sgarzare@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Tue, Oct 5, 2021 at 9:49 PM Eugenio P=C3=A9rez <eperezma@redhat.com> wro=
te:
>
> Following the logic of commit 56918a126ae ("memory: Add RAM_PROTECTED
> flag to skip IOMMU mappings") with VFIO, skip memory sections
> inaccessible via normal mechanisms, including DMA.
>
> Signed-off-by: Eugenio P=C3=A9rez <eperezma@redhat.com>

Acked-by: Jason Wang <jasowang@redhat.com>

> ---
>  hw/virtio/vhost-vdpa.c | 1 +
>  1 file changed, 1 insertion(+)
>
> diff --git a/hw/virtio/vhost-vdpa.c b/hw/virtio/vhost-vdpa.c
> index 47d7a5a23d..ea1aa71ad8 100644
> --- a/hw/virtio/vhost-vdpa.c
> +++ b/hw/virtio/vhost-vdpa.c
> @@ -28,6 +28,7 @@ static bool vhost_vdpa_listener_skipped_section(MemoryR=
egionSection *section)
>  {
>      return (!memory_region_is_ram(section->mr) &&
>              !memory_region_is_iommu(section->mr)) ||
> +            memory_region_is_protected(section->mr) ||
>             /* vhost-vDPA doesn't allow MMIO to be mapped  */
>              memory_region_is_ram_device(section->mr) ||
>             /*
> --
> 2.27.0
>


