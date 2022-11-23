Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 97D8263511E
	for <lists+qemu-devel@lfdr.de>; Wed, 23 Nov 2022 08:34:12 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1oxkFT-0002xG-GN; Wed, 23 Nov 2022 02:32:47 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eperezma@redhat.com>)
 id 1oxkFM-0002wV-Jo
 for qemu-devel@nongnu.org; Wed, 23 Nov 2022 02:32:42 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eperezma@redhat.com>)
 id 1oxkFE-0000Ly-Jq
 for qemu-devel@nongnu.org; Wed, 23 Nov 2022 02:32:40 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1669188751;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=1E0R9W5ohIeC4y8wsc0aWbWknLJFQO+9f/LvE2mBGF4=;
 b=K4itzp86konrPNUsB4cfb37BowrItsfdfN8YJ9OtY0KVLAVECFEpD8V0lUYpF8VOA1+nrj
 OjCDhGrw+8Mvb7Eb1Z/JfxcugJH31wh+v7UmKPAoyRAgvIc6xsdYvhyrzQaPWp6d8JAG3c
 Z1jwIHcob01d8ioVgdl8oRH3BRQMl0o=
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com
 [209.85.222.200]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-49-rLMOxaESNvq8lqkDoGUq_A-1; Wed, 23 Nov 2022 02:32:29 -0500
X-MC-Unique: rLMOxaESNvq8lqkDoGUq_A-1
Received: by mail-qk1-f200.google.com with SMTP id
 w4-20020a05620a444400b006fa24b2f394so21503643qkp.15
 for <qemu-devel@nongnu.org>; Tue, 22 Nov 2022 23:32:29 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=1E0R9W5ohIeC4y8wsc0aWbWknLJFQO+9f/LvE2mBGF4=;
 b=Q8U9ouuFBGaRmmS75rfbOg5MjguPO9r9krM3QC6kxcE7KWjvR1tsz+E4RVcB7m9n4h
 0H5pHFP+zO8pZ3OE+ee0XlnuvRzU0+nh2V18Ew7DJmF2gLExI0Y5GtDCYAGHOKJFN++p
 jpQq49JMKPxxS/YUdv1z5MWKM7Xxb1WR6DvdcZurTCzc54rHlkARoYtngbmz3lRCaBxb
 8cZJjhj4x59laOuogo2RahWJjOwX8Y1nggPXBVDkXkWoG05l5ZdffD9OXTUoAO98w5A4
 c9fZh6YC6wkBi3GUuEs5CL32ODKdiokiBxFmNYv0zxh9Y1VO0lBqYh+FGNzYR9Xc38dt
 DSOw==
X-Gm-Message-State: ANoB5pnBiHfXGqa0fgpf117P9790n/AMrgiAKRdkydBp976XYN1uwVZs
 5cP2EOe7ud8Dbpk15ycbRR/S0+pedtshrwuAw+y9eq6VTfZNiV3xkokwO9HPJUJU5/OjvGDy/7o
 sQHj5d+D5LNOqMCCkg07WszdRXR83esE=
X-Received: by 2002:ae9:f70a:0:b0:6fb:c48c:1bbd with SMTP id
 s10-20020ae9f70a000000b006fbc48c1bbdmr6636826qkg.337.1669188749240; 
 Tue, 22 Nov 2022 23:32:29 -0800 (PST)
X-Google-Smtp-Source: AA0mqf61QXNC5WmDgtlCcY/XEYThgQ1XMDjH9cKX8otSCSNWwYwMTqBQhH+K02FaNa9Vnh+d2JHem8wxDOB4T90crKw=
X-Received: by 2002:ae9:f70a:0:b0:6fb:c48c:1bbd with SMTP id
 s10-20020ae9f70a000000b006fbc48c1bbdmr6636816qkg.337.1669188748981; Tue, 22
 Nov 2022 23:32:28 -0800 (PST)
MIME-Version: 1.0
References: <20221122145349.86072-1-marcandre.lureau@redhat.com>
 <20221122152944-mutt-send-email-mst@kernel.org>
 <CAMxuvaySOMOs=0hwOeP4O6b2nO+ANiEsoDaAzduRRpDcUd=OFw@mail.gmail.com>
In-Reply-To: <CAMxuvaySOMOs=0hwOeP4O6b2nO+ANiEsoDaAzduRRpDcUd=OFw@mail.gmail.com>
From: Eugenio Perez Martin <eperezma@redhat.com>
Date: Wed, 23 Nov 2022 08:31:52 +0100
Message-ID: <CAJaqyWdmGPeGxTyYgzYK-G+7Bqk2Mr0BrVtvdX4tjnTv=qUnQQ@mail.gmail.com>
Subject: Re: [PATCH] vhost-vdpa: skip TPM CRB memory section
To: =?UTF-8?B?TWFyYy1BbmRyw6kgTHVyZWF1?= <marcandre.lureau@redhat.com>
Cc: "Michael S. Tsirkin" <mst@redhat.com>, qemu-devel@nongnu.org,
 eric.auger@redhat.com, Peter Maydell <peter.maydell@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=170.10.129.124; envelope-from=eperezma@redhat.com;
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

On Wed, Nov 23, 2022 at 8:20 AM Marc-Andr=C3=A9 Lureau
<marcandre.lureau@redhat.com> wrote:
>
> Hi
>
> On Wed, Nov 23, 2022 at 12:32 AM Michael S. Tsirkin <mst@redhat.com> wrot=
e:
>>
>> On Tue, Nov 22, 2022 at 06:53:49PM +0400, marcandre.lureau@redhat.com wr=
ote:
>> > From: Marc-Andr=C3=A9 Lureau <marcandre.lureau@redhat.com>
>> >
>> > 851d6d1a0f ("vfio/common: remove spurious tpm-crb-cmd misalignment
>> > warning") removed the warning on vfio_listener_region_add() path.
>> >
>> > An error is reported for vhost-vdpa case:
>> > qemu-kvm: vhost_vdpa_listener_region_add received unaligned region
>> >
>> > Skip the CRB device.
>> >
>> > Fixes:
>> > https://bugzilla.redhat.com/show_bug.cgi?id=3D2141965
>> >
>> > Signed-off-by: Marc-Andr=C3=A9 Lureau <marcandre.lureau@redhat.com>
>> > ---
>> >  hw/virtio/vhost-vdpa.c | 6 ++++++
>> >  1 file changed, 6 insertions(+)
>> >
>> > diff --git a/hw/virtio/vhost-vdpa.c b/hw/virtio/vhost-vdpa.c
>> > index 7468e44b87..9d7206e4b8 100644
>> > --- a/hw/virtio/vhost-vdpa.c
>> > +++ b/hw/virtio/vhost-vdpa.c
>> > @@ -19,6 +19,7 @@
>> >  #include "hw/virtio/virtio-net.h"
>> >  #include "hw/virtio/vhost-shadow-virtqueue.h"
>> >  #include "hw/virtio/vhost-vdpa.h"
>> > +#include "sysemu/tpm.h"
>> >  #include "exec/address-spaces.h"
>> >  #include "migration/blocker.h"
>> >  #include "qemu/cutils.h"
>> > @@ -46,6 +47,11 @@ static bool vhost_vdpa_listener_skipped_section(Mem=
oryRegionSection *section,
>> >  {
>> >      Int128 llend;
>> >
>> > +    if (TPM_IS_CRB(section->mr->owner)) {
>> > +        /* The CRB command buffer has its base address unaligned. */
>> > +        return true;
>> > +    }
>> > +
>>
>> Quite a hack. We can't really keep adding dependency on random devices
>
>
> Agree it's not great. but it's not strictly a dependency. At least you ca=
n still build with !CONFIG_TPM.
>
>> to vhost. And would you add hacks like this to listeners?
>> Pls figure out what's special about this buffer.
>> Also if this section is unaligned then doesn't it break up
>> other aligned sections?
>
>
> See the original discussion:
> https://patchew.org/QEMU/20220208133842.112017-1-eric.auger@redhat.com/20=
220208133842.112017-2-eric.auger@redhat.com/
>

Based on that, I'd tune the comment to something like:
QEMU represents the CRB cmd/response buffer as a standard RAM region
to the listeners, but real HW would not be able to access them.
Besides, these regions may not be properly page aligned.

Is that more accurate?

Thanks!

> It is not clear whether aligning the tpm-crb-cmd region would work (overl=
apping tpm-crb-mmio).
>
> Peter Maydell said: "There's nothing that guarantees alignment for memory=
 regions at all, whether they're RAM, IO or anything else.".
>
> Maybe vfio/vhost should simply skip those odd regions silently.
>
>
>>
>>
>> >      if ((!memory_region_is_ram(section->mr) &&
>> >           !memory_region_is_iommu(section->mr)) ||
>> >          memory_region_is_protected(section->mr) ||
>> > --
>> > 2.38.1
>>


