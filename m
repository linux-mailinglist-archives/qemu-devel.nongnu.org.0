Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 94FE2634EEC
	for <lists+qemu-devel@lfdr.de>; Wed, 23 Nov 2022 05:27:05 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1oxhKI-0003xQ-3G; Tue, 22 Nov 2022 23:25:34 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jasowang@redhat.com>)
 id 1oxhKG-0003xH-H1
 for qemu-devel@nongnu.org; Tue, 22 Nov 2022 23:25:32 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jasowang@redhat.com>)
 id 1oxhKE-0006b6-Ez
 for qemu-devel@nongnu.org; Tue, 22 Nov 2022 23:25:32 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1669177528;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=q6SqUlMt4XxuN47lJcyo9XafzcmO9pUrWuf3dS6wFKs=;
 b=VjuS9bK3v24awC1J+E8laIue0h4H7xru7aoRIA1nEuWuagcQOrqWbSAiPnWrSUSjAInaJU
 nr4cbh9195nvDBrtmiLEDY93s90aPcZk7Gk4SDyYZIozAp2cehJ8FvUzPyYVaOJtxIb1mX
 QOFLNnrN69LDcqqKT0O4K5KRNCuflgw=
Received: from mail-oo1-f71.google.com (mail-oo1-f71.google.com
 [209.85.161.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-437-a6AXqVaPOQiEsC_AotifIQ-1; Tue, 22 Nov 2022 23:25:27 -0500
X-MC-Unique: a6AXqVaPOQiEsC_AotifIQ-1
Received: by mail-oo1-f71.google.com with SMTP id
 x6-20020a4a2a46000000b0049ca27b1507so7223094oox.5
 for <qemu-devel@nongnu.org>; Tue, 22 Nov 2022 20:25:27 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=q6SqUlMt4XxuN47lJcyo9XafzcmO9pUrWuf3dS6wFKs=;
 b=g55WuwVDYNRnyTL7lx9Q1h9WKf9lC3hhkaMpk2y+AfIPxMsySS5bkHcrwzxxd5xKC6
 1WbjxS4M7aFH2lCLNagrGK14uEyC5tlki/7jrF9/w//IkKLK97tFgWqiftFkk3Qt/nnE
 ZI56m3zNeQEDyBzx+IrWY6/o63VjMzF9alsHLoblO5LfbaR5ZNekF6BML1/SWurqCzvH
 QHslS4ddVFyGNrgtqWICg2PuSeDGxNkqzSRBSw4p7KIEGPWGqgWRzW1tpZ4cXFeO8kF/
 j38leh4l+IXjUJnkQHpFNetcBUONgh4v+CEdvc070tJ29/DyWgsnCx0tmOx+G/sc70Jo
 7jHQ==
X-Gm-Message-State: ANoB5pn3wmBvTa/qQyrjpekb7qm3oNTSaIBkCDamTLUMtDj0seELpot/
 jJ0kYUiAZCTnB9SOyBjuM1fhNtPAP+I5s851uXa/M4Pmz942PAIU763mb96CEAgTH1vvE6QK7hA
 bo1/B1Vvomqjh9RfKUIgQ9aX+5VU39Dg=
X-Received: by 2002:a9d:4f07:0:b0:66c:64d6:1bb4 with SMTP id
 d7-20020a9d4f07000000b0066c64d61bb4mr13602843otl.201.1669177526703; 
 Tue, 22 Nov 2022 20:25:26 -0800 (PST)
X-Google-Smtp-Source: AA0mqf6OtaHbNNA0OiV1OXpR51mE8nOFAiK//2lScY1eAZt7KtbVn77PHYNY7C4Sq40jn+SNfa965r/g+gRoWLXwH84=
X-Received: by 2002:a9d:4f07:0:b0:66c:64d6:1bb4 with SMTP id
 d7-20020a9d4f07000000b0066c64d61bb4mr13602836otl.201.1669177526451; Tue, 22
 Nov 2022 20:25:26 -0800 (PST)
MIME-Version: 1.0
References: <20221122145349.86072-1-marcandre.lureau@redhat.com>
 <CAJaqyWde_4XBu_etY9xYN7ZJwS5KR7hzwEewJyYptNSO=ckUPw@mail.gmail.com>
In-Reply-To: <CAJaqyWde_4XBu_etY9xYN7ZJwS5KR7hzwEewJyYptNSO=ckUPw@mail.gmail.com>
From: Jason Wang <jasowang@redhat.com>
Date: Wed, 23 Nov 2022 12:25:15 +0800
Message-ID: <CACGkMEuisLMk7gKGb7PqsDoVwaQP8h5+HnBc5k=VpuWJwtW3Gw@mail.gmail.com>
Subject: Re: [PATCH] vhost-vdpa: skip TPM CRB memory section
To: Eugenio Perez Martin <eperezma@redhat.com>
Cc: marcandre.lureau@redhat.com, qemu-devel@nongnu.org, eric.auger@redhat.com, 
 "Michael S. Tsirkin" <mst@redhat.com>, Cindy Lu <lulu@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=170.10.129.124; envelope-from=jasowang@redhat.com;
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

On Wed, Nov 23, 2022 at 12:50 AM Eugenio Perez Martin
<eperezma@redhat.com> wrote:
>
> On Tue, Nov 22, 2022 at 3:53 PM <marcandre.lureau@redhat.com> wrote:
> >
> > From: Marc-Andr=C3=A9 Lureau <marcandre.lureau@redhat.com>
> >
> > 851d6d1a0f ("vfio/common: remove spurious tpm-crb-cmd misalignment
> > warning") removed the warning on vfio_listener_region_add() path.
> >
> > An error is reported for vhost-vdpa case:
> > qemu-kvm: vhost_vdpa_listener_region_add received unaligned region
> >
> > Skip the CRB device.
> >
> > Fixes:
> > https://bugzilla.redhat.com/show_bug.cgi?id=3D2141965
> >
> > Signed-off-by: Marc-Andr=C3=A9 Lureau <marcandre.lureau@redhat.com>
>
> Acked-by: Eugenio P=C3=A9rez <eperezma@redhat.com>
>
> And CCing Jason too.

Adding Cindy.

Acked-by: Jason Wang <jasowang@redhat.com>

Thanks

>
> > ---
> >  hw/virtio/vhost-vdpa.c | 6 ++++++
> >  1 file changed, 6 insertions(+)
> >
> > diff --git a/hw/virtio/vhost-vdpa.c b/hw/virtio/vhost-vdpa.c
> > index 7468e44b87..9d7206e4b8 100644
> > --- a/hw/virtio/vhost-vdpa.c
> > +++ b/hw/virtio/vhost-vdpa.c
> > @@ -19,6 +19,7 @@
> >  #include "hw/virtio/virtio-net.h"
> >  #include "hw/virtio/vhost-shadow-virtqueue.h"
> >  #include "hw/virtio/vhost-vdpa.h"
> > +#include "sysemu/tpm.h"
> >  #include "exec/address-spaces.h"
> >  #include "migration/blocker.h"
> >  #include "qemu/cutils.h"
> > @@ -46,6 +47,11 @@ static bool vhost_vdpa_listener_skipped_section(Memo=
ryRegionSection *section,
> >  {
> >      Int128 llend;
> >
> > +    if (TPM_IS_CRB(section->mr->owner)) {
> > +        /* The CRB command buffer has its base address unaligned. */
> > +        return true;
> > +    }
> > +
> >      if ((!memory_region_is_ram(section->mr) &&
> >           !memory_region_is_iommu(section->mr)) ||
> >          memory_region_is_protected(section->mr) ||
> > --
> > 2.38.1
> >
>


