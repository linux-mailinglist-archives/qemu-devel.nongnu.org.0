Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 13AE64B0765
	for <lists+qemu-devel@lfdr.de>; Thu, 10 Feb 2022 08:43:46 +0100 (CET)
Received: from localhost ([::1]:40042 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nI47E-0006QF-Sm
	for lists+qemu-devel@lfdr.de; Thu, 10 Feb 2022 02:43:44 -0500
Received: from eggs.gnu.org ([209.51.188.92]:32952)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1nI3jL-0000Zc-Rv
 for qemu-devel@nongnu.org; Thu, 10 Feb 2022 02:19:04 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:51794)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1nI3jI-00048N-JG
 for qemu-devel@nongnu.org; Thu, 10 Feb 2022 02:19:01 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1644477539;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=QFlskR4qnAJ3SrkoAHPxHGP3uT9MK3yYj1p912v7Ju0=;
 b=C1d/M1a2cVYkUKAzg/QCRMaVstwfuKFY3gPAqgQZ+UXOqk2US/Ljajl/zj8UIR9efCTNkP
 dPOBCGpkRFlzOBVQpIj50V1ylSXAK1MrQndBLAYbur0JxzX8c1RHiYmBskFB7LyAkxsyw3
 c96o1E7k5QS4x2ntqOgeovBT47F+Kb0=
Received: from mail-ej1-f70.google.com (mail-ej1-f70.google.com
 [209.85.218.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-261-aARYiCiXN12fFF2HnRP6Dg-1; Thu, 10 Feb 2022 02:18:58 -0500
X-MC-Unique: aARYiCiXN12fFF2HnRP6Dg-1
Received: by mail-ej1-f70.google.com with SMTP id
 m4-20020a170906160400b006be3f85906eso2261202ejd.23
 for <qemu-devel@nongnu.org>; Wed, 09 Feb 2022 23:18:58 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to;
 bh=QFlskR4qnAJ3SrkoAHPxHGP3uT9MK3yYj1p912v7Ju0=;
 b=tOl154PNNcuNctYWX3gHNV7ctL4/Rrc3So/mbeLz3m3n6kcC2aerYNy7RdFpPuRukl
 CeSDioAxksEsvn6mhTFRSpuvSaWhNhMVDm83CDPkLdPVqkdtsX90A7evmJsKOYRANsjv
 yW6Iw+vfV989ErkEhbtFYff+OIo8D7Me2P98XjjzJOn5+zdPEE0t6pOL6TbNSy/3GWoD
 wd7hILiK3jWtQtTxkuhzk3RcDUMI4TOlDqIqLdQNlMoEv7XiBCaeR5fVEDWxZ27FRzs3
 y3Eg0BqLA6b/c3Eukt0r5/qvBHmlk7EmrNIQmycEKL+ZhBxJNzjDLzPbxG9uEcMY5ex/
 tGSQ==
X-Gm-Message-State: AOAM531lK5O2l2cFsgJI5zektwAeUgTEKGod1aBBOn8s0ieFKw87HBz/
 HEYVt91gbUjlHhOMNl+ly3oujNFFXQtvlzKcxcc9O0vwbkr6PkZLWmy1Vu/p4avIPfnKo+iZ5Ie
 8NtYa3dJ67NJi9Mo=
X-Received: by 2002:a17:906:8696:: with SMTP id
 g22mr5127153ejx.436.1644477537106; 
 Wed, 09 Feb 2022 23:18:57 -0800 (PST)
X-Google-Smtp-Source: ABdhPJwi7ckAIlvxEedoC/WBVEgHuuqdhhY2g2E1jB4FW0tCgYhh3+AbUjXxCRHhHk709w2bdj57PA==
X-Received: by 2002:a17:906:8696:: with SMTP id
 g22mr5127139ejx.436.1644477536878; 
 Wed, 09 Feb 2022 23:18:56 -0800 (PST)
Received: from redhat.com ([2.55.139.162])
 by smtp.gmail.com with ESMTPSA id jx4sm4706925ejb.218.2022.02.09.23.18.51
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 09 Feb 2022 23:18:52 -0800 (PST)
Date: Thu, 10 Feb 2022 02:18:49 -0500
From: "Michael S. Tsirkin" <mst@redhat.com>
To: BB <shentey@gmail.com>
Subject: Re: [PATCH 3/3] isa/piix4: Resolve global variables
Message-ID: <20220210021821-mutt-send-email-mst@kernel.org>
References: <20220112213629.9126-1-shentey@gmail.com>
 <20220112213629.9126-4-shentey@gmail.com>
 <CAFEAcA_HE6UCaeyM7+5n0O+hFKLGk=Sc6Mpr_VBD_RJR=WJg=w@mail.gmail.com>
 <b21fefc6-a7f6-c101-5f1f-99cd3191933b@amsat.org>
 <3DD424F7-FC1C-471E-A5E5-1E06783D7254@gmail.com>
MIME-Version: 1.0
In-Reply-To: <3DD424F7-FC1C-471E-A5E5-1E06783D7254@gmail.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=mst@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=mst@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
 =?iso-8859-1?Q?Herv=E9?= Poussineau <hpoussin@reactos.org>,
 Philippe =?iso-8859-1?Q?Mathieu-Daud=E9?= <f4bug@amsat.org>,
 Aurelien Jarno <aurelien@aurel32.net>, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Thu, Feb 10, 2022 at 12:16:34AM +0100, BB wrote:
> Am 30. Januar 2022 23:53:42 MEZ schrieb "Philippe Mathieu-Daudé" <f4bug@amsat.org>:
> >On 14/1/22 14:36, Peter Maydell wrote:
> >> On Wed, 12 Jan 2022 at 22:02, Bernhard Beschow <shentey@gmail.com> wrote:
> >>>
> >>> Now that piix4_set_irq's opaque parameter references own PIIX4State,
> >>> piix4_dev becomes redundant and pci_irq_levels can be moved into PIIX4State.
> >>>
> >>> Signed-off-by: Bernhard Beschow <shentey@gmail.com>
> >>> ---
> >>>   hw/isa/piix4.c                | 22 +++++++++-------------
> >>>   include/hw/southbridge/piix.h |  2 --
> >>>   2 files changed, 9 insertions(+), 15 deletions(-)
> >>>
> >>> diff --git a/hw/isa/piix4.c b/hw/isa/piix4.c
> >>> index a31e9714cf..964e09cf7f 100644
> >>> --- a/hw/isa/piix4.c
> >>> +++ b/hw/isa/piix4.c
> >>> @@ -39,14 +39,14 @@
> >>>   #include "sysemu/runstate.h"
> >>>   #include "qom/object.h"
> >>>
> >>> -PCIDevice *piix4_dev;
> >>> -
> >>>   struct PIIX4State {
> >>>       PCIDevice dev;
> >>>       qemu_irq cpu_intr;
> >>>       qemu_irq *isa;
> >>>       qemu_irq i8259[ISA_NUM_IRQS];
> >>>
> >>> +    int pci_irq_levels[PIIX_NUM_PIRQS];
> >>> +
> >> 
> >> I wondered how we were migrating this state, and the answer
> >> seems to be that we aren't (and weren't before, when it was
> >> a global variable, so this is a pre-existing bug).
> >
> >Indeed the migrated VM starts with PCI IRQ levels zeroed.
> >
> >> Does the malta platform support migration save/load?
> >
> >Maybe a "best effort" support, but not versioned machines.
> >
> >> We should probably add this field to the vmstate struct
> >> (which will be a migration compatibility break, which is OK
> >> as the malta board isn't versioned.)
> >
> >Yeah good catch.
> >
> >Bernhard, do you mind adding it?
> 
> Sure, I'll give it a try. Shall I submit a v2 of this patch series then? If so, would it be ok to change the topic of the cover letter or would that be confusing?

It's ok to change the subject of the cover letter.

> Last but not least: How to treat the version_id and the version parameters of the new and existing fields?
> 
> Regards,
> 
> Bernhard.


