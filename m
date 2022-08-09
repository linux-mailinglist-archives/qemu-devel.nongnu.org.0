Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 982E558D659
	for <lists+qemu-devel@lfdr.de>; Tue,  9 Aug 2022 11:21:44 +0200 (CEST)
Received: from localhost ([::1]:33574 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oLLQi-0001Nn-Pz
	for lists+qemu-devel@lfdr.de; Tue, 09 Aug 2022 05:21:40 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36976)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1oLLMe-0007gx-Jc
 for qemu-devel@nongnu.org; Tue, 09 Aug 2022 05:17:40 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:53251)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1oLLMa-00070E-KA
 for qemu-devel@nongnu.org; Tue, 09 Aug 2022 05:17:25 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1660036643;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=6trcYL8EDncHyJaXFbNVW+zGgRHix/ZIxOm69DyZV9Y=;
 b=LXhDtnkVp6jhSKhcaPMGJFP8DfhGIgxDCA/F/gsssMA4t3WWkFlq0gxEgGDetXfygFs7hD
 8E9ufl9Zz2CCFsKBC73dxHJOfQqk7L/YeUGTAQS5nYOURvLCFBhxAdVRFHv4zXv9sZyXG9
 vxAx16WGfOhHCSMIzrl2T3tKTASP/WE=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-159-6_73J3dsOcuY86wcfm-cDw-1; Tue, 09 Aug 2022 05:17:21 -0400
X-MC-Unique: 6_73J3dsOcuY86wcfm-cDw-1
Received: by mail-wm1-f69.google.com with SMTP id
 9-20020a1c0209000000b003a53ae8015bso2587106wmc.1
 for <qemu-devel@nongnu.org>; Tue, 09 Aug 2022 02:17:21 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc;
 bh=6trcYL8EDncHyJaXFbNVW+zGgRHix/ZIxOm69DyZV9Y=;
 b=mplLghlI3EzLwu9LxYs84k8B0/zrp3vJvM0Pt+57qY/bpAree7U6yoMlmUfA2O/Nxb
 nfjVsPXwbm3H6FuWhWnBOGXe8k/Fw1bpd13Xw2kX81Tn4+x5SPB7vXkR2xYWY8TLQQBM
 +ZyBglQViSbfMj1IRcTKBjyba6Jo3nh0DlkTu41JE0uGa+EmIdVBbbtmooQWZs8IU+hl
 OulRC0CyzshDt0quDw2PwbK+k1p9Vk7PPYQ22TSHEpPjnwqkqUyHy52BKQodSTp7erFk
 36hGYF+N7i2ZnuiVfotbwbK3v9pK807Ofm4RwNy82zMWy21qjwZit9vlgVk0EHKgU3qY
 4/uQ==
X-Gm-Message-State: ACgBeo3kRq2++zHPNRVYlrIqnVHTZ6T8/1Rlk0mI692H7gU0flyezY75
 GFgTC2f1S2K2a9GJ6fxWrqudLNq3ii9MlcJ0dBnApjdc99OsbEm/LejnaF4B4gXY2i7oZRQtzNE
 Il4VE7f260wXRVZQ=
X-Received: by 2002:a05:6000:18a2:b0:221:7db8:de02 with SMTP id
 b2-20020a05600018a200b002217db8de02mr9529244wri.132.1660036640723; 
 Tue, 09 Aug 2022 02:17:20 -0700 (PDT)
X-Google-Smtp-Source: AA6agR4/PUVjWa52Slm5RRM+bXysuWYsRrGroBh+2BcqIRjSw3TmcBqi5ODfU0VvyzUu+oXHXJnbaw==
X-Received: by 2002:a05:6000:18a2:b0:221:7db8:de02 with SMTP id
 b2-20020a05600018a200b002217db8de02mr9529225wri.132.1660036640513; 
 Tue, 09 Aug 2022 02:17:20 -0700 (PDT)
Received: from redhat.com ([2.52.152.113]) by smtp.gmail.com with ESMTPSA id
 p1-20020a5d48c1000000b0021e6277bc50sm15609071wrs.36.2022.08.09.02.17.18
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 09 Aug 2022 02:17:19 -0700 (PDT)
Date: Tue, 9 Aug 2022 05:17:16 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Paolo Bonzini <pbonzini@redhat.com>
Cc: Ard Biesheuvel <ardb@kernel.org>,
 "Jason A. Donenfeld" <Jason@zx2c4.com>, qemu-devel@nongnu.org,
 Xiaoyao Li <xiaoyao.li@intel.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Peter Maydell <peter.maydell@linaro.org>,
 Daniel P =?iso-8859-1?Q?=2E_Berrang=E9?= <berrange@redhat.com>,
 Gerd Hoffmann <kraxel@redhat.com>, Laszlo Ersek <lersek@redhat.com>,
 linux-efi@vger.kernel.org
Subject: Re: [PATCH v3] hw/i386: place setup_data at fixed place in memory
Message-ID: <20220809051644-mutt-send-email-mst@kernel.org>
References: <YuxOgtykRQb1HU3e@zx2c4.com>
 <20220804230411.17720-1-Jason@zx2c4.com>
 <40fdfb11-1e40-a36a-d3a4-fcbef546a78a@redhat.com>
 <CAMj1kXFDs8HCCCcVAVwjLcATh6MYcUSAha5yvi0ftMw+Ddy_Xg@mail.gmail.com>
 <0bd57fab-836b-9898-9e3f-84dc66eca175@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <0bd57fab-836b-9898-9e3f-84dc66eca175@redhat.com>
Received-SPF: pass client-ip=170.10.129.124; envelope-from=mst@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Fri, Aug 05, 2022 at 07:29:29PM +0200, Paolo Bonzini wrote:
> On 8/5/22 13:08, Ard Biesheuvel wrote:
> > > 
> > > Does it work to place setup_data at the end of the cmdline file instead
> > > of having it at the end of the kernel file?  This way the first item
> > > will be at 0x20000 + cmdline_size.
> > > 
> > Does QEMU always allocate the command line statically like that?
> > AFAIK, OVMF never accesses that memory to read the command line, it
> > uses fw_cfg to copy it into a buffer it allocates itself. And I guess
> > that implies that this region could be clobbered by OVMF unless it is
> > told to preserve it.
> 
> No it's not. :(  It also goes to gBS->AllocatePages in the end.
> 
> At this point it seems to me that without extra changes the whole setup_data
> concept is dead on arrival for OVMF.  In principle there's no reason why the
> individual setup_data items couldn't include interior pointers, meaning that
> the setup_data _has_ to be at the address provided in fw_cfg by QEMU.
> 
> One way to "fix" it would be for OVMF to overwrite the pointer to the head
> of the list, so that the kernel ignores the setup data provided by QEMU.
> Another way would be to put it in the command line fw_cfg blob and teach
> OVMF to use a fixed address for the command line.  Both are ugly, and both
> are also broken for new QEMU / old OVMF.
> 
> In any case, I don't think this should be fixed so close to the release.  We
> have two possibilities:
> 
> 1) if we believe "build setup_data in QEMU" is a feasible design that only
> needs more yak shaving, we can keep the code in, but disabled by default,
> and sort it out in 7.2.
> 
> 2) if we go for an alternative design, it needs to be reverted.  For example
> the randomness could be in _another_ fw_cfg file, and the linuxboot DMA can
> patch it in the setup_data.
> 
> 
> With (2) the OVMF breakage would be limited to -dtb, which more or less
> nobody cares about, and we can just look the other way.
> 
> Paolo


So IIUC you retract your pc: add property for Linux setup_data random
number seed then? It's neither of the two options above.

-- 
MST


