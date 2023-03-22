Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D93E06C4FAE
	for <lists+qemu-devel@lfdr.de>; Wed, 22 Mar 2023 16:48:14 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pf0fr-0003ai-6F; Wed, 22 Mar 2023 11:46:51 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eperezma@redhat.com>)
 id 1pf0fl-0003YG-I9
 for qemu-devel@nongnu.org; Wed, 22 Mar 2023 11:46:45 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eperezma@redhat.com>)
 id 1pf0fj-0004zK-HF
 for qemu-devel@nongnu.org; Wed, 22 Mar 2023 11:46:44 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1679500001;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=/W42FwC4mgrX2w2zy4EaN000rpZycWJSjEe0gWE8wRg=;
 b=dgD/5KdJmMi1nTQdAeAh9CbusvycsIqx7G9a7u/HWgJuYO79dw2+TkvIvp1+vceqPIgCpC
 RPHs/IVMX8yi115DPGSPErVVVhpN2UdRXAIVZDV5/8BMEBSS+wWB9wCMNE6pWXjqSRWycA
 WmPuop3KwkNbN4EJhusee4sk2LjBNg8=
Received: from mail-yw1-f199.google.com (mail-yw1-f199.google.com
 [209.85.128.199]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-668-WI8DS42XOp60qSlcGZeFMg-1; Wed, 22 Mar 2023 11:46:40 -0400
X-MC-Unique: WI8DS42XOp60qSlcGZeFMg-1
Received: by mail-yw1-f199.google.com with SMTP id
 00721157ae682-5417f156cb9so192135407b3.8
 for <qemu-devel@nongnu.org>; Wed, 22 Mar 2023 08:46:38 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1679499997;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=/W42FwC4mgrX2w2zy4EaN000rpZycWJSjEe0gWE8wRg=;
 b=tndio214z1znAmbnpjhMuDpCaWlvzeySyVTSQ5ZpjKnZJkHsE1pkHE4Gmjph2A6Lcx
 +ewga86LMR0XoDFTDRpQp0v4yPFEJImjqMz3LmFUB0C9saqckA+w1IycU8k/mYhCMBbl
 63eLscyRQbBveRN+IZvArz8cjkPwj1Agrci9YuN/BAXgkMs+AOPrT+y+r96LCsZJ/5sv
 JEPlYlpinKaRkxxdBFAoISNutS5NNHVGhRVS7S0nh1Z5G4kDBZrHZfWPDqe1aG2XA6mD
 LI0vVZGegtGPxrS1Kp0OkepK2sgNDIN+ThGF1lH3AJkyz2jmjHKyebuR4Ah2NqGEO3JF
 gAmw==
X-Gm-Message-State: AAQBX9clW8cZxNUA9/i7PlvyzEdWJEPc7GR0ZsWqe8Hbt7417xWrYj4p
 Oc4+6mHuueRXpJpfLxpA8FlP6HnMYuNduzZQ8+qVFNKnIOHEMfTOmqZ5X4wj/1iFWtL6KMUU9c5
 HEdOlSsn8AqPklJFcjYNZAwPGVBHqriM=
X-Received: by 2002:a05:690c:298d:b0:542:927b:1c79 with SMTP id
 eh13-20020a05690c298d00b00542927b1c79mr68437ywb.3.1679499996724; 
 Wed, 22 Mar 2023 08:46:36 -0700 (PDT)
X-Google-Smtp-Source: AKy350aEsEBRLIY92+IHo9WnbVfZoLVivCC8mXjgrjta8UTsRngnifcw+vlQKkWCocEsc6SPiwKoh6HoyKSUj3XXRvs=
X-Received: by 2002:a05:690c:298d:b0:542:927b:1c79 with SMTP id
 eh13-20020a05690c298d00b00542927b1c79mr68420ywb.3.1679499996492; Wed, 22 Mar
 2023 08:46:36 -0700 (PDT)
MIME-Version: 1.0
References: <20230317145542.347368-1-eperezma@redhat.com>
 <20230317145542.347368-2-eperezma@redhat.com>
 <20230322142214.ib7vxerutdn4jqdp@sgarzare-redhat>
In-Reply-To: <20230322142214.ib7vxerutdn4jqdp@sgarzare-redhat>
From: Eugenio Perez Martin <eperezma@redhat.com>
Date: Wed, 22 Mar 2023 16:46:00 +0100
Message-ID: <CAJaqyWdckDEw3DzZ95zjT-xJbb+j3cPV9qADb+9hzdONCzS+yw@mail.gmail.com>
Subject: Re: [RFC PATCH for 8.1 1/6] vdpa: Remove status in reset tracing
To: Stefano Garzarella <sgarzare@redhat.com>
Cc: qemu-devel@nongnu.org, alvaro.karsz@solid-run.com, 
 Laurent Vivier <lvivier@redhat.com>, Gautam Dawar <gdawar@xilinx.com>,
 Jason Wang <jasowang@redhat.com>, 
 Harpreet Singh Anand <hanand@xilinx.com>, Zhu Lingshan <lingshan.zhu@intel.com>,
 "Gonglei (Arei)" <arei.gonglei@huawei.com>,
 "Michael S. Tsirkin" <mst@redhat.com>, Eli Cohen <eli@mellanox.com>, 
 si-wei.liu@oracle.com, longpeng2@huawei.com, Cindy Lu <lulu@redhat.com>, 
 Parav Pandit <parav@mellanox.com>, Liuxiangdong <liuxiangdong5@huawei.com>, 
 Shannon Nelson <snelson@pensando.io>, Lei Yang <leiyang@redhat.com>
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

On Wed, Mar 22, 2023 at 3:22=E2=80=AFPM Stefano Garzarella <sgarzare@redhat=
.com> wrote:
>
> On Fri, Mar 17, 2023 at 03:55:37PM +0100, Eugenio P=C3=A9rez wrote:
> >It is always 0 and it is not useful to route call through file
> >descriptor.
>
> I didn't get the second part of the sentence (after "and"),

Right, it is totally not explained.

Next patches need to call VHOST_VDPA_SET_STATUS(0) using vdpa file
descriptor, not struct vhost_dev. This patch prepares the way to
transform this function that way.

I'll add in the log for the next version, thanks!

> anyway the
> patch LGTM:
>
> Reviewed-by: Stefano Garzarella <sgarzare@redhat.com>
>
> >
> >Signed-off-by: Eugenio P=C3=A9rez <eperezma@redhat.com>
> >---
> > hw/virtio/vhost-vdpa.c | 2 +-
> > hw/virtio/trace-events | 2 +-
> > 2 files changed, 2 insertions(+), 2 deletions(-)
> >
> >diff --git a/hw/virtio/vhost-vdpa.c b/hw/virtio/vhost-vdpa.c
> >index bc6bad23d5..bbabea18f3 100644
> >--- a/hw/virtio/vhost-vdpa.c
> >+++ b/hw/virtio/vhost-vdpa.c
> >@@ -716,7 +716,7 @@ static int vhost_vdpa_reset_device(struct vhost_dev =
*dev)
> >     uint8_t status =3D 0;
> >
> >     ret =3D vhost_vdpa_call(dev, VHOST_VDPA_SET_STATUS, &status);
> >-    trace_vhost_vdpa_reset_device(dev, status);
> >+    trace_vhost_vdpa_reset_device(dev);
> >     v->suspended =3D false;
> >     return ret;
> > }
> >diff --git a/hw/virtio/trace-events b/hw/virtio/trace-events
> >index 8f8d05cf9b..6265231683 100644
> >--- a/hw/virtio/trace-events
> >+++ b/hw/virtio/trace-events
> >@@ -44,7 +44,7 @@ vhost_vdpa_set_mem_table(void *dev, uint32_t nregions,=
 uint32_t padding) "dev: %
> > vhost_vdpa_dump_regions(void *dev, int i, uint64_t guest_phys_addr, uin=
t64_t memory_size, uint64_t userspace_addr, uint64_t flags_padding) "dev: %=
p %d: guest_phys_addr: 0x%"PRIx64" memory_size: 0x%"PRIx64" userspace_addr:=
 0x%"PRIx64" flags_padding: 0x%"PRIx64
> > vhost_vdpa_set_features(void *dev, uint64_t features) "dev: %p features=
: 0x%"PRIx64
> > vhost_vdpa_get_device_id(void *dev, uint32_t device_id) "dev: %p device=
_id %"PRIu32
> >-vhost_vdpa_reset_device(void *dev, uint8_t status) "dev: %p status: 0x%=
"PRIx8
> >+vhost_vdpa_reset_device(void *dev) "dev: %p"
> > vhost_vdpa_get_vq_index(void *dev, int idx, int vq_idx) "dev: %p idx: %=
d vq idx: %d"
> > vhost_vdpa_set_vring_ready(void *dev) "dev: %p"
> > vhost_vdpa_dump_config(void *dev, const char *line) "dev: %p %s"
> >--
> >2.31.1
> >
>


