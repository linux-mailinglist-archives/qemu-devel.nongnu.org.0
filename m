Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 857956341E4
	for <lists+qemu-devel@lfdr.de>; Tue, 22 Nov 2022 17:52:18 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1oxWTt-00062y-6r; Tue, 22 Nov 2022 11:50:45 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eperezma@redhat.com>)
 id 1oxWTn-000628-UG
 for qemu-devel@nongnu.org; Tue, 22 Nov 2022 11:50:40 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eperezma@redhat.com>)
 id 1oxWTO-0000Ok-St
 for qemu-devel@nongnu.org; Tue, 22 Nov 2022 11:50:17 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1669135808;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=OEPDhaVg+ANTFEs+9xLktg3IaxXQdG5kDbrfathH06A=;
 b=c7l3VD6FLHppXzsot/kFGo09TyHAt4OqYI1jiFMYPYoE94epD+F7uzinKJ6yZlyGU8pPdw
 0A77ndecpBBPFV86ASL42Z8XbDpRuJHp6xqQyBFwWXDwP6eD8C77gR6OueP0wkq/gawrrI
 aEy5mkfa8u+chYB3VxJMj6koIuPsfYw=
Received: from mail-qv1-f71.google.com (mail-qv1-f71.google.com
 [209.85.219.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-532-JOQq-GctMAueq0QHf2oxhg-1; Tue, 22 Nov 2022 11:50:06 -0500
X-MC-Unique: JOQq-GctMAueq0QHf2oxhg-1
Received: by mail-qv1-f71.google.com with SMTP id
 p17-20020a05621415d100b004c6a488c925so7620803qvz.2
 for <qemu-devel@nongnu.org>; Tue, 22 Nov 2022 08:50:06 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=OEPDhaVg+ANTFEs+9xLktg3IaxXQdG5kDbrfathH06A=;
 b=qU5gdz1U6WDp+ODLSJ/0G3OEIjNIPMBl9h3o58kXy4dUYlnKCLyFnZo4GpugA723T3
 3OdmkA3eQ8aygUg4XHGvrFaI68NmJx4rA0UMWV5NB3bVCbO/oPO0vTLOEhpyVUoELRvE
 VaLgyoIethh8bLi+weznko71STLi4UkfekZ92w501GpG068vr6NKxy0WThNxCo9LfGGD
 OMV21/E1tS9CfHzY1RpOKEm5aEzC0d6ikANmHDiboe8jvZj0x8vPOYXReoJZv32EAu11
 AwsNKh5KmwngfO02SCtPfEkz+n2I/tgd1tw8J4ACnIb02BXfcHJaIfhGfqW4m4OZlqRM
 dHSA==
X-Gm-Message-State: ANoB5pkaSCmSsdrHn0H8OMYw+tHUXdNIdBAkWmjaQeWDbq7+gOL6MzHG
 ujVLHIrtlrqvfHJPkWkFzlBrR2NKQF6nhIXBjENBfbNd7VXSnpGBNqnmQW0OPUM8Io+NuLnuQLM
 v/ArJhCKKrHim7y6i6aRQ5qM+nUddtvw=
X-Received: by 2002:ad4:4d53:0:b0:4bb:63ed:152e with SMTP id
 m19-20020ad44d53000000b004bb63ed152emr6784194qvm.131.1669135806404; 
 Tue, 22 Nov 2022 08:50:06 -0800 (PST)
X-Google-Smtp-Source: AA0mqf6GjTwJRanjzppcS5EtUUOc4P5Pw+iUV4ruZlPNksgKSn5jgti3n0WtOaHVbWBlBlwB9IWyZC/ucGvUtYfNWDA=
X-Received: by 2002:ad4:4d53:0:b0:4bb:63ed:152e with SMTP id
 m19-20020ad44d53000000b004bb63ed152emr6784177qvm.131.1669135806160; Tue, 22
 Nov 2022 08:50:06 -0800 (PST)
MIME-Version: 1.0
References: <20221122145349.86072-1-marcandre.lureau@redhat.com>
In-Reply-To: <20221122145349.86072-1-marcandre.lureau@redhat.com>
From: Eugenio Perez Martin <eperezma@redhat.com>
Date: Tue, 22 Nov 2022 17:49:29 +0100
Message-ID: <CAJaqyWde_4XBu_etY9xYN7ZJwS5KR7hzwEewJyYptNSO=ckUPw@mail.gmail.com>
Subject: Re: [PATCH] vhost-vdpa: skip TPM CRB memory section
To: marcandre.lureau@redhat.com
Cc: qemu-devel@nongnu.org, eric.auger@redhat.com, 
 "Michael S. Tsirkin" <mst@redhat.com>, Jason Wang <jasowang@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=170.10.133.124; envelope-from=eperezma@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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

On Tue, Nov 22, 2022 at 3:53 PM <marcandre.lureau@redhat.com> wrote:
>
> From: Marc-Andr=C3=A9 Lureau <marcandre.lureau@redhat.com>
>
> 851d6d1a0f ("vfio/common: remove spurious tpm-crb-cmd misalignment
> warning") removed the warning on vfio_listener_region_add() path.
>
> An error is reported for vhost-vdpa case:
> qemu-kvm: vhost_vdpa_listener_region_add received unaligned region
>
> Skip the CRB device.
>
> Fixes:
> https://bugzilla.redhat.com/show_bug.cgi?id=3D2141965
>
> Signed-off-by: Marc-Andr=C3=A9 Lureau <marcandre.lureau@redhat.com>

Acked-by: Eugenio P=C3=A9rez <eperezma@redhat.com>

And CCing Jason too.

> ---
>  hw/virtio/vhost-vdpa.c | 6 ++++++
>  1 file changed, 6 insertions(+)
>
> diff --git a/hw/virtio/vhost-vdpa.c b/hw/virtio/vhost-vdpa.c
> index 7468e44b87..9d7206e4b8 100644
> --- a/hw/virtio/vhost-vdpa.c
> +++ b/hw/virtio/vhost-vdpa.c
> @@ -19,6 +19,7 @@
>  #include "hw/virtio/virtio-net.h"
>  #include "hw/virtio/vhost-shadow-virtqueue.h"
>  #include "hw/virtio/vhost-vdpa.h"
> +#include "sysemu/tpm.h"
>  #include "exec/address-spaces.h"
>  #include "migration/blocker.h"
>  #include "qemu/cutils.h"
> @@ -46,6 +47,11 @@ static bool vhost_vdpa_listener_skipped_section(Memory=
RegionSection *section,
>  {
>      Int128 llend;
>
> +    if (TPM_IS_CRB(section->mr->owner)) {
> +        /* The CRB command buffer has its base address unaligned. */
> +        return true;
> +    }
> +
>      if ((!memory_region_is_ram(section->mr) &&
>           !memory_region_is_iommu(section->mr)) ||
>          memory_region_is_protected(section->mr) ||
> --
> 2.38.1
>


