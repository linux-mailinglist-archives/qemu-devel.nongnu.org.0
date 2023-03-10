Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BE4466B4093
	for <lists+qemu-devel@lfdr.de>; Fri, 10 Mar 2023 14:38:58 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pacwd-0002o0-BW; Fri, 10 Mar 2023 08:38:03 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1pacwR-0002ni-30
 for qemu-devel@nongnu.org; Fri, 10 Mar 2023 08:37:51 -0500
Received: from mail-pl1-x62c.google.com ([2607:f8b0:4864:20::62c])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1pacwP-0003K7-3f
 for qemu-devel@nongnu.org; Fri, 10 Mar 2023 08:37:50 -0500
Received: by mail-pl1-x62c.google.com with SMTP id h8so5539176plf.10
 for <qemu-devel@nongnu.org>; Fri, 10 Mar 2023 05:37:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1678455467;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=YsQLuAvterM4uGq/4S6HIRNg5KOO0qiZfrL+M2J/iP8=;
 b=YBYMxRqq5gYletOC22kGvDUvna6B8ERqWqaM2NdAq6IdQa9D7YRXtfXISlnbCN6gai
 /094qzDmMlJWZgZCCuu9jR6SILwTaGl//6uOwbyPhm41wV+oJmQ5lfbbUFdgtwuy854G
 BpS2VHzCeZF2oQA8Zwy4Gsz71LqKTtKUwbJLBNds+sjxCTf1BKoQd92Mn0dAkcLSYQgs
 JHVatzGaxFogGG/Lw6HGxUoumbTxVcz2QyNwPR8dRQvdrmCM6/qs8nwe6UB1FL9kKXhj
 dCdLLQdlRXMu6e1w+f3BW1cObTj8o7Dbk4Bw4gpmsgWIyzquaZALwsVqaKmXNqtyzS1+
 865w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1678455467;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=YsQLuAvterM4uGq/4S6HIRNg5KOO0qiZfrL+M2J/iP8=;
 b=xQJ9rRgm723uirFEXetXwWjGk4KAZ5ZW4vSvc4z/l7t/esLCIVDUv+UJpCybZgJapl
 BxK+Kc6qShlBg4NohPTYVQxzmmeoBBJR2Jh6+Oufk/FBzZe7CVeWYZ+REcrPM1Ydn+Ty
 2ZENeOMTW+2VL2Rln4XUmLeDq7qUQ9cLMWc1OceCIrFq5hHM82FXDTWpduD4sooZymDy
 xljCMMEDy+RaKwSCJRFPFdTipFtf8/u7QOwRsix1kzXJUFvOWuWyy0O/L+UQDo/dxWvE
 G8tCglQw7wnxsfDDFawXkCb/Fg6W15cMrjdSpc2M209mz+OgyP1ubcXg8EE8zPrCmubw
 FKOQ==
X-Gm-Message-State: AO0yUKXhbnkz5xiYAaYo9h+UBPokCDg6KXPotBxsbNKAOHSayYcPSsph
 PtAc4IClD6GgMwPPlaX2604sJtVNy2N4zyXgYZM1+w==
X-Google-Smtp-Source: AK7set/7aWIE5JQTWFq3bw50s5CXB72pzgR5uETaE4xUYUo/BAOwoP9MCoGIMXCb4yAo15zRwq4ntxGzW2cJdprm6rY=
X-Received: by 2002:a17:90a:528d:b0:236:a1f9:9a9d with SMTP id
 w13-20020a17090a528d00b00236a1f99a9dmr883579pjh.2.1678455467506; Fri, 10 Mar
 2023 05:37:47 -0800 (PST)
MIME-Version: 1.0
References: <20230205040737.3567731-1-alxndr@bu.edu>
 <20230205040737.3567731-2-alxndr@bu.edu>
 <9cfa0cc8-01c7-cf79-72ef-3224d1276e16@proxmox.com>
 <20230310122347.hghmijad7wajiqne@mozz.bu.edu>
 <20230310123117.d2uxze7zqtigmg44@mozz.bu.edu>
 <CAFEAcA8YLrr0Ltt-CAdTDrh2zyzzyqWgfx39fy0zJwLFqdGQGg@mail.gmail.com>
 <20230310130245.oyjdeihisuvgl6rz@mozz.bu.edu>
 <20230310132858.dljb2wgx325shtgd@mozz.bu.edu>
In-Reply-To: <20230310132858.dljb2wgx325shtgd@mozz.bu.edu>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 10 Mar 2023 13:37:35 +0000
Message-ID: <CAFEAcA-Laf223PWqLT1jZ0eFfGFK-c9VhAf8X-i=NFF5xhJbLg@mail.gmail.com>
Subject: Re: [PATCH v6 1/4] memory: prevent dma-reentracy issues
To: Alexander Bulekov <alxndr@bu.edu>
Cc: Fiona Ebner <f.ebner@proxmox.com>, qemu-devel@nongnu.org, 
 Stefan Hajnoczi <stefanha@redhat.com>,
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@linaro.org>, 
 Mauro Matteo Cascella <mcascell@redhat.com>, Peter Xu <peterx@redhat.com>, 
 Jason Wang <jasowang@redhat.com>, David Hildenbrand <david@redhat.com>, 
 Gerd Hoffmann <kraxel@redhat.com>, Thomas Huth <thuth@redhat.com>, 
 Laurent Vivier <lvivier@redhat.com>, Bandan Das <bsd@redhat.com>, 
 "Edgar E . Iglesias" <edgar.iglesias@gmail.com>,
 Darren Kenny <darren.kenny@oracle.com>, 
 Bin Meng <bin.meng@windriver.com>, Paolo Bonzini <pbonzini@redhat.com>, 
 "Michael S . Tsirkin" <mst@redhat.com>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>, 
 =?UTF-8?Q?Daniel_P_=2E_Berrang=C3=A9?= <berrange@redhat.com>, 
 Eduardo Habkost <eduardo@habkost.net>, Jon Maloy <jmaloy@redhat.com>,
 Siqi Chen <coc.cyqh@gmail.com>, Fam Zheng <fam@euphon.net>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::62c;
 envelope-from=peter.maydell@linaro.org; helo=mail-pl1-x62c.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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

On Fri, 10 Mar 2023 at 13:29, Alexander Bulekov <alxndr@bu.edu> wrote:
>
> On 230310 0802, Alexander Bulekov wrote:
> > On 230310 1245, Peter Maydell wrote:
> > > On Fri, 10 Mar 2023 at 12:32, Alexander Bulekov <alxndr@bu.edu> wrote:
> > > > This MR seems to be "lsi-ram".
> > > >
> > > > From hw/scsi/lsi53c895a.c:
> > > >
> > > > memory_region_init_io(&s->ram_io, OBJECT(s), &lsi_ram_ops, s,
> > > >         "lsi-ram", 0x2000);
> > > >
> > > > So the LSI device is reading an LSI "Script" from its own IO region.. In
> > > > this particular case, I think there was no reason to use
> > > > memory_region_init_io rather than memory_region_init_ram, but this makes
> > > > me worried that there are other devices that use something like this.
> > >
> > > This particular device predates the entire MemoryRegion set of
> > > abstractions, so it might have seemed easier at the time.
> > > The endianness handling of the current code is also a bit
> > > confusing and might make it tricky to convert to a RAM MR.
> >
> > With my trivial mr_io - > mr_ram conversion, I no longer hit the
> > re-entrancy tracepoint, and my livecd boots, but it's probably not
> > exhaustively using the script functionality..
> >
> > Does the endianness actually cause a problem? As long as all accesses
> > (CPU -> LSI_RAM and LSI -> LSI_RAM) occur through the address_space API,
> > are we safe?

I'm not sure -- I looked at the code and I wasn't confident
on exactly what the combination of the DEVICE_LITTLE_ENDIAN
MemoryRegion and the use of stn_le_p/ldn_le_p would be.
I think it ought to be possible to use a RAM MR, but we'd
need to check the handling on both BE and LE hosts. Migration
compatibility is the other thing we would need to check, to
avoid accidentally switching from "script_ram[] contents are
in order X" to "they are in order Y"...

> Or maybe a rom_device with memory_region_rom_device_set_romd(romd_mode =
> false) is better here?

I don't think that helps -- if we can let the guest do direct
reads from the region then it's equally OK to let it do
direct writes, so we could just use a RAM MR.

-- PMM

