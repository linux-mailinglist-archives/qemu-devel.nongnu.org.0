Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A678D69F526
	for <lists+qemu-devel@lfdr.de>; Wed, 22 Feb 2023 14:12:55 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pUou7-0008S3-0e; Wed, 22 Feb 2023 08:11:27 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <sgarzare@redhat.com>)
 id 1pUou4-0008Rf-F5
 for qemu-devel@nongnu.org; Wed, 22 Feb 2023 08:11:24 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <sgarzare@redhat.com>)
 id 1pUou2-00042Y-JW
 for qemu-devel@nongnu.org; Wed, 22 Feb 2023 08:11:24 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1677071480;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=EOOlbdHu4LeOaOX0e7W43cpYQxBbNDDA2HwmMuDFoJk=;
 b=fXihwwmeAuAZuue1oznHYBODKCCjlRCuf9b9WoH6Zp4wAPTCToi7XLciKuaOreaJpKzTmO
 zMDuF1ZHWEpy3eBjkH/nUXp3i8vA7gwxTn75nnBIYwuwWDkw6We46yI8unvyMmtVjJJHuH
 haOIpjIyYOr2tZdHycaSF3K9uxQXXqc=
Received: from mail-yw1-f197.google.com (mail-yw1-f197.google.com
 [209.85.128.197]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-607-EGAdGxiWO-SACciXfVSE-Q-1; Wed, 22 Feb 2023 08:11:19 -0500
X-MC-Unique: EGAdGxiWO-SACciXfVSE-Q-1
Received: by mail-yw1-f197.google.com with SMTP id
 00721157ae682-536b7eb9117so71317147b3.14
 for <qemu-devel@nongnu.org>; Wed, 22 Feb 2023 05:11:19 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=EOOlbdHu4LeOaOX0e7W43cpYQxBbNDDA2HwmMuDFoJk=;
 b=MnDF8pm3+ooU8Hb4Iv+CII4/LKcjm9JHVcUohwS9p0rCf73tM6F23+McZDFSnk+MaA
 ICGn80my3E620SxJ2e7wHIL2H9wI6tHP7RfaOtDVnY2HxlznBCRiZfZ9t9AMq8ycFkKQ
 n7bQ+A+0saYV9MSvGa9yk9vPGBtcpueVqPLjucAuR2r1BXQPtMcmpsZm+y3RTTDhIu7y
 gAOOjVfOG2RwxLPtqe6N40i5BvcdkdQknZiwMvGnwPbhYGc747bTpGOez3lBBpsZusMt
 UcjfBOM8l4NfBKILZDwPCz+hwsG/+y+n6TBYzghgrzurVCdG+I1Arqhgh96w15XqqaNa
 21Kw==
X-Gm-Message-State: AO0yUKXl6CBxvDI24lbGNjDg5/S5Shit2DzqxLbbsLxo1s2d4mjzkfPA
 R2uSkEJfSVFi8BEJu3eQSHtUT+gqn8hb6+U6XNbCl9QcTCIEHb2oODaELnycTvA/BcZHh7qCHFm
 /tvh13wmLMApAajvuY4BB2cKJZ34Z9LU=
X-Received: by 2002:a25:f903:0:b0:8bb:dfe8:a33b with SMTP id
 q3-20020a25f903000000b008bbdfe8a33bmr674554ybe.9.1677071478798; 
 Wed, 22 Feb 2023 05:11:18 -0800 (PST)
X-Google-Smtp-Source: AK7set+dQcnXH7PhYqPEJz1sAZJeaxhFPo6ueug3iRJv8dnNW5Pd4/yZ71aZbazmgre9oqJYHboMI/FxIl36osyU82g=
X-Received: by 2002:a25:f903:0:b0:8bb:dfe8:a33b with SMTP id
 q3-20020a25f903000000b008bbdfe8a33bmr674548ybe.9.1677071478551; Wed, 22 Feb
 2023 05:11:18 -0800 (PST)
MIME-Version: 1.0
References: <20210429120445.694420-1-chouhan.shreyansh2702@gmail.com>
 <20220211221319.193404-1-chouhan.shreyansh2702@gmail.com>
In-Reply-To: <20220211221319.193404-1-chouhan.shreyansh2702@gmail.com>
From: Stefano Garzarella <sgarzare@redhat.com>
Date: Wed, 22 Feb 2023 14:11:06 +0100
Message-ID: <CAGxU2F5HumanqyEbQUdH1y4FeyQuT4jNj1WhXkn_wGPOJsOu5g@mail.gmail.com>
Subject: Re: [RFC PATCH v2 00/25] Virtio Sound card Implementation
To: Shreyansh Chouhan <chouhan.shreyansh2702@gmail.com>
Cc: kraxel@redhat.com, mst@redhat.com, laurent@vivier.eu, 
 qemu-devel@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=170.10.129.124; envelope-from=sgarzare@redhat.com;
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

Hi Shreyansh,

On Fri, Feb 11, 2022 at 11:18 PM Shreyansh Chouhan
<chouhan.shreyansh2702@gmail.com> wrote:
>
> The second RFC for implementing the VirtIO Sound card as described in
> the virtio specs. Sorry for the absence of activity on this.

Thanks for starting working on virtio-sound device for QEMU!
I'm interested in completing this work, but first I wanted to know if
you are still working on it or have any new updates.

Thanks,
Stefano

>
> The output from the sound card works.
>
> What remains to be done:
> - Features defined in PCM features. (Eg message polling)
> - Channel maps
> - Jack remaps
> - Input
>
> I will work on the input after I have implemented the output
> along with all the features since at that point it should just be a
> matter of reversing a few things in the code that writes the audio.
>
> I can work on this patchset mostly on weekends now but I will try to be
> more regular with this.
>
> Reviews are welcome :)
>
> Shreyansh Chouhan (25):
>   virtio-snd: Add virtio sound header file
>   virtio-snd: Add jack control structures
>   virtio-snd: Add PCM control structures
>   virtio-snd: Add chmap control structures
>   virtio-snd: Add device implementation structures
>   virtio-snd: Add PCI wrapper code for VirtIOSound
>   virtio-snd: Add properties for class init
>   virtio-snd: Add code for get config function
>   virtio-snd: Add code for the realize function
>   virtio-snd: Add macros for logging
>   virtio-snd: Add control virtqueue handler
>   virtio-snd: Add VIRTIO_SND_R_JACK_INFO handler
>   virtio-snd: Add stub for VIRTIO_SND_R_JACK_REMAP handler
>   virtio-snd: Add VIRTIO_SND_R_PCM_INFO handler
>   virtio-snd: Add VIRITO_SND_R_PCM_SET_PARAMS handle
>   virtio-snd: Add VIRTIO_SND_R_PCM_PREPARE handler
>   virtio-snd: Add default configs to realize fn
>   virtio-snd: Add callback for SWVoiceOut
>   virtio-snd: Add start/stop handler
>   virtio-snd: Add VIRTIO_SND_R_PCM_RELEASE handler
>   virtio-snd: Replaced goto with if else
>   virtio-snd: Add code to device unrealize function
>   virtio-snd: Add xfer handler
>   virtio-snd: Add event vq and a handler stub
>   virtio-snd: Replaced AUD_log with tracepoints
>
>  hw/audio/Kconfig               |    5 +
>  hw/audio/meson.build           |    1 +
>  hw/audio/trace-events          |   14 +
>  hw/audio/virtio-snd.c          | 1241 ++++++++++++++++++++++++++++++++
>  hw/virtio/meson.build          |    1 +
>  hw/virtio/virtio-snd-pci.c     |   72 ++
>  include/hw/virtio/virtio-snd.h |  383 ++++++++++
>  7 files changed, 1717 insertions(+)
>  create mode 100644 hw/audio/virtio-snd.c
>  create mode 100644 hw/virtio/virtio-snd-pci.c
>  create mode 100644 include/hw/virtio/virtio-snd.h
>
> --
> 2.31.1
>
>


