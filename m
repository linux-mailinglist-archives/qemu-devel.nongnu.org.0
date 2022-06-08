Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 502C3543EAE
	for <lists+qemu-devel@lfdr.de>; Wed,  8 Jun 2022 23:36:00 +0200 (CEST)
Received: from localhost ([::1]:60760 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nz3LK-0000cL-TR
	for lists+qemu-devel@lfdr.de; Wed, 08 Jun 2022 17:35:58 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60526)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1nz3KA-0008Dk-29
 for qemu-devel@nongnu.org; Wed, 08 Jun 2022 17:34:46 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:33582)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1nz3K7-0000Tx-9w
 for qemu-devel@nongnu.org; Wed, 08 Jun 2022 17:34:44 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1654724082;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=Lrpy3uwrKmdVKG1FPLQQxh5DukJ7oKmBjXQMGynV2Yc=;
 b=QSx1QL2HaSDbv3X3rKqbMykiz7MYREGQDqEGGeejF3HaTjaVlIZGVIM0aGF2Lkj05YpOfF
 +CsXbU+Z9uqD4yPZ4RQ2M136fyaqBKsACMYVEc3yuybC97eCn2VpYiJ28ISr6K6Khe4k0G
 I1uteyV7eWGVZN6kHH7S8UiGzJbKd68=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-56-1VV83DXFMEaX7LiTdzfcWw-1; Wed, 08 Jun 2022 17:34:41 -0400
X-MC-Unique: 1VV83DXFMEaX7LiTdzfcWw-1
Received: by mail-wm1-f72.google.com with SMTP id
 ay28-20020a05600c1e1c00b0039c5cbe76c1so2575781wmb.1
 for <qemu-devel@nongnu.org>; Wed, 08 Jun 2022 14:34:41 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=Lrpy3uwrKmdVKG1FPLQQxh5DukJ7oKmBjXQMGynV2Yc=;
 b=2mvsJJHxOQ10+4DjHUPLyDzb5I87nn6M0XOfRbnHJ/4m/vtXeISjqqsFaSGqyme1NF
 xxi9XnrHbVSzZsMk+Eu+MI7py3LRCCv1Uez9jD9iBC4O+9rxBYsYnzoPtFX9w1ZnhynJ
 nJyepd1E3GV22qXWS86Qj8Lml/tYeiFNBuYHt2x0/WTGlI+whTwpAxRLyeWdUL3kgk21
 fP38hoJTs56iR2wrsPUEQtnMCOCMjMLQD2/Fac9AfREgrsgbaKaBOPFSF5NLjjzOHDfE
 LjFWT/6+gAQVIfIB87KzbVg7Tx5xvBoKxwSsL/drFTuLc4h86i2ITktksi6uenD3/XZJ
 0h6A==
X-Gm-Message-State: AOAM531Ucq2S73/6nURJifFmRX3aryNa1y3t60qO07zA2m8Txbi8DmS1
 il+4k3pre/VUEpVlxqRc8nHmCma6OR1hLJ1kjJowa2vr7PwFpTMhLtHVVwrXurXE7FOENeifdQ+
 /1Woi8dvNzT0Z8EQ=
X-Received: by 2002:a7b:c04b:0:b0:39c:511e:2dd4 with SMTP id
 u11-20020a7bc04b000000b0039c511e2dd4mr22931wmc.58.1654724080112; 
 Wed, 08 Jun 2022 14:34:40 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxoA28BQLhlGeMksRF0ROz8ewBrFfTsv1kLiUngAn/FADC6EOWj8zAffKwcP1BBumPH2EbEOA==
X-Received: by 2002:a7b:c04b:0:b0:39c:511e:2dd4 with SMTP id
 u11-20020a7bc04b000000b0039c511e2dd4mr22913wmc.58.1654724079821; 
 Wed, 08 Jun 2022 14:34:39 -0700 (PDT)
Received: from redhat.com ([2.53.13.104]) by smtp.gmail.com with ESMTPSA id
 f18-20020a5d4dd2000000b0020fd392df33sm22517538wru.29.2022.06.08.14.34.38
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 08 Jun 2022 14:34:39 -0700 (PDT)
Date: Wed, 8 Jun 2022 17:34:36 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Daniel Henrique Barboza <danielhb413@gmail.com>
Cc: qemu-devel@nongnu.org, BALATON Zoltan <balaton@eik.bme.hu>,
 qemu-ppc@nongnu.org
Subject: Re: [PATCH] ppc: fix boot with sam460ex
Message-ID: <20220608173428-mutt-send-email-mst@kernel.org>
References: <20220526224229.95183-1-mst@redhat.com>
 <331f671a-a75d-741a-a42b-9571d7dc70cc@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <331f671a-a75d-741a-a42b-9571d7dc70cc@gmail.com>
Received-SPF: pass client-ip=170.10.133.124; envelope-from=mst@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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

On Mon, Jun 06, 2022 at 10:51:23AM -0300, Daniel Henrique Barboza wrote:
> Michael,
> 
> 
> I'll queue this patch with the commit msg proposed by Zoltan as follows:
> 
> 
> Author: Michael S. Tsirkin <mst@redhat.com>
> Date:   Thu May 26 18:43:43 2022 -0400
> 
>     ppc: fix boot with sam460ex
>     Recent changes to pcie_host corrected size of its internal region to
>     match what it expects: only the low 28 bits are ever decoded. Previous
>     code just ignored bit 29 (if size was 1 << 29) in the address which does
>     not make much sense.  We are now asserting on size > 1 << 28 instead,
>     but PPC 4xx actually allows guest to configure different sizes, and some
>     firmwares seem to set it to 1 << 29.
>     This caused e.g. qemu-system-ppc -M sam460ex to exit with an assert when
>     the guest writes a value to CFGMSK register when trying to map config
>     space. This is done in the board firmware in ppc4xx_init_pcie_port() in
>     roms/u-boot-sam460ex/arch/powerpc/cpu/ppc4xx/4xx_pcie.c
>     It's not clear what the proper fix should be but for now let's force the
>     size to 256MB, so anything outside the expected address range is
>     ignored.
> 
> 
> Is that ok with you?
> 
> 
> Thanks,
> 
> 
> Daniel


ACK

> 
> On 5/26/22 19:43, Michael S. Tsirkin wrote:
> > Recent changes to pcie_host corrected size of its internal region to
> > match what it expects - only the low 28 bits are ever decoded. Previous
> > code just ignored bit 29 (if size was 1 << 29) in the address which does
> > not make much sense.  We are now asserting on size > 1 << 28 instead,
> > but it so happened that ppc actually allows guest to configure as large
> > a size as it wants to, and current firmware set it to 1 << 29.
> > 
> > With just qemu-system-ppc -M sam460ex this triggers an assert which
> > seems to happen when the guest (board firmware?) writes a value to
> > CFGMSK reg:
> > 
> > (gdb) bt
> > 
> > This is done in the board firmware here:
> > 
> > https://git.qemu.org/?p=u-boot-sam460ex.git;a=blob;f=arch/powerpc/cpu/ppc4xx/4xx_pcie.c;h=13348be93dccc74c13ea043d6635a7f8ece4b5f0;hb=HEAD
> > 
> > when trying to map config space.
> > 
> > Note that what firmware does matches
> > https://www.hardware.com.br/comunidade/switch-cisco/1128380/
> > 
> > So it's not clear what the proper fix should be.
> > 
> > However, allowing guest to trigger an assert in qemu is not good practice anyway.
> > 
> > For now let's just force the mask to 256MB on guest write, this way
> > anything outside the expected address range is ignored.
> > 
> > Fixes: commit 1f1a7b2269 ("include/hw/pci/pcie_host: Correct PCIE_MMCFG_SIZE_MAX")
> > Reviewed-by: BALATON Zoltan <balaton@eik.bme.hu>
> > Tested-by: BALATON Zoltan <balaton@eik.bme.hu>
> > Signed-off-by: Michael S. Tsirkin <mst@redhat.com>
> > ---
> > 
> > Affected system is orphan so I guess I will merge the patch unless
> > someone objects.
> > 
> >   hw/ppc/ppc440_uc.c | 8 ++++++++
> >   1 file changed, 8 insertions(+)
> > 
> > diff --git a/hw/ppc/ppc440_uc.c b/hw/ppc/ppc440_uc.c
> > index 993e3ba955..a1ecf6dd1c 100644
> > --- a/hw/ppc/ppc440_uc.c
> > +++ b/hw/ppc/ppc440_uc.c
> > @@ -1180,6 +1180,14 @@ static void dcr_write_pcie(void *opaque, int dcrn, uint32_t val)
> >       case PEGPL_CFGMSK:
> >           s->cfg_mask = val;
> >           size = ~(val & 0xfffffffe) + 1;
> > +        /*
> > +         * Firmware sets this register to E0000001. Why we are not sure,
> > +         * but the current guess is anything above PCIE_MMCFG_SIZE_MAX is
> > +         * ignored.
> > +         */
> > +        if (size > PCIE_MMCFG_SIZE_MAX) {
> > +            size = PCIE_MMCFG_SIZE_MAX;
> > +        }
> >           pcie_host_mmcfg_update(PCIE_HOST_BRIDGE(s), val & 1, s->cfg_base, size);
> >           break;
> >       case PEGPL_MSGBAH:


