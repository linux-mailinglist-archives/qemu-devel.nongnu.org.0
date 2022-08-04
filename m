Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id ED210589C5B
	for <lists+qemu-devel@lfdr.de>; Thu,  4 Aug 2022 15:12:48 +0200 (CEST)
Received: from localhost ([::1]:41436 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oJaed-0003Dx-4h
	for lists+qemu-devel@lfdr.de; Thu, 04 Aug 2022 09:12:47 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42782)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1oJaMh-00008Q-PQ
 for qemu-devel@nongnu.org; Thu, 04 Aug 2022 08:54:15 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:34497)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1oJaMe-0006TY-Pm
 for qemu-devel@nongnu.org; Thu, 04 Aug 2022 08:54:14 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1659617651;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=r8cUqWV2FlnkGBUrzcquRGXkxAAYXIIOSc8TFyfsxWg=;
 b=Xn9Y9XD01tBhNLJcQZa6kMZYkL5oisDBDb9o6mAjNiI9Yv+FdHGGqs/oyKdnqVnK35EPbl
 xqNiEZK0h5rUtcaWd+43Jf2qFtPZplPh9r6LtBnbp7CGXJs7veTJv02VqqpjK+0IVLHLyw
 GcFILcwE1n9JRJesWJL2VkaIaiwZ6kk=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-546-X4XHXgSVORaJy65x7AENfA-1; Thu, 04 Aug 2022 08:54:08 -0400
X-MC-Unique: X4XHXgSVORaJy65x7AENfA-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.rdu2.redhat.com
 [10.11.54.3])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 20FA3381A08B;
 Thu,  4 Aug 2022 12:54:08 +0000 (UTC)
Received: from redhat.com (unknown [10.33.36.223])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id E49AE1121314;
 Thu,  4 Aug 2022 12:54:05 +0000 (UTC)
Date: Thu, 4 Aug 2022 13:54:03 +0100
From: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
To: "Jason A. Donenfeld" <Jason@zx2c4.com>
Cc: qemu-devel@nongnu.org, Xiaoyao Li <xiaoyao.li@intel.com>,
 Paolo Bonzini <pbonzini@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Peter Maydell <peter.maydell@linaro.org>,
 "Michael S . Tsirkin" <mst@redhat.com>,
 Gerd Hoffmann <kraxel@redhat.com>, Ard Biesheuvel <ardb@kernel.org>,
 linux-efi@vger.kernel.org
Subject: Re: [PATCH v2] hw/i386: place setup_data at fixed place in memory
Message-ID: <YuvBaxwcWPGvW0gZ@redhat.com>
References: <YusVVLNbLgsk49PK@zx2c4.com>
 <20220804004411.1343158-1-Jason@zx2c4.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20220804004411.1343158-1-Jason@zx2c4.com>
User-Agent: Mutt/2.2.6 (2022-06-05)
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.3
Received-SPF: pass client-ip=170.10.133.124; envelope-from=berrange@redhat.com;
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
Reply-To: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Thu, Aug 04, 2022 at 02:44:11AM +0200, Jason A. Donenfeld wrote:
> The boot parameter header refers to setup_data at an absolute address,
> and each setup_data refers to the next setup_data at an absolute address
> too. Currently QEMU simply puts the setup_datas right after the kernel
> image, and since the kernel_image is loaded at prot_addr -- a fixed
> address knowable to QEMU apriori -- the setup_data absolute address
> winds up being just `prot_addr + a_fixed_offset_into_kernel_image`.
> 
> This mostly works fine, so long as the kernel image really is loaded at
> prot_addr. However, OVMF doesn't load the kernel at prot_addr, and
> generally EFI doesn't give a good way of predicting where it's going to
> load the kernel. So when it loads it at some address != prot_addr, the
> absolute addresses in setup_data now point somewhere bogus, causing
> crashes when EFI stub tries to follow the next link.
> 
> Fix this by placing setup_data at some fixed place in memory, relative
> to real_addr, not as part of the kernel image, and then pointing the
> setup_data absolute address to that fixed place in memory. This way,
> even if OVMF or other chains relocate the kernel image, the boot
> parameter still points to the correct absolute address.
> 
> Fixes: 3cbeb52467 ("hw/i386: add device tree support")
> Reported-by: Xiaoyao Li <xiaoyao.li@intel.com>
> Cc: Paolo Bonzini <pbonzini@redhat.com>
> Cc: Richard Henderson <richard.henderson@linaro.org>
> Cc: Peter Maydell <peter.maydell@linaro.org>
> Cc: Michael S. Tsirkin <mst@redhat.com>
> Cc: Daniel P. Berrangé <berrange@redhat.com>
> Cc: Gerd Hoffmann <kraxel@redhat.com>
> Cc: Ard Biesheuvel <ardb@kernel.org>
> Cc: linux-efi@vger.kernel.org
> Signed-off-by: Jason A. Donenfeld <Jason@zx2c4.com>
> ---
>  hw/i386/x86.c | 38 ++++++++++++++++++++------------------
>  1 file changed, 20 insertions(+), 18 deletions(-)
> 
> diff --git a/hw/i386/x86.c b/hw/i386/x86.c
> index 050eedc0c8..8b853abf38 100644
> --- a/hw/i386/x86.c
> +++ b/hw/i386/x86.c


>      if (!legacy_no_rng_seed) {
> -        setup_data_offset = QEMU_ALIGN_UP(kernel_size, 16);
> -        kernel_size = setup_data_offset + sizeof(struct setup_data) + RNG_SEED_LENGTH;
> -        kernel = g_realloc(kernel, kernel_size);
> -        setup_data = (struct setup_data *)(kernel + setup_data_offset);
> +        setup_data_item_len = sizeof(struct setup_data) + RNG_SEED_LENGTH;
> +        setup_datas = g_realloc(setup_datas, setup_data_total_len + setup_data_item_len);
> +        setup_data = (struct setup_data *)(setup_datas + setup_data_total_len);
>          setup_data->next = cpu_to_le64(first_setup_data);
> -        first_setup_data = prot_addr + setup_data_offset;
> +        first_setup_data = setup_data_base + setup_data_total_len;
> +        setup_data_total_len += setup_data_item_len;
>          setup_data->type = cpu_to_le32(SETUP_RNG_SEED);
>          setup_data->len = cpu_to_le32(RNG_SEED_LENGTH);
>          qemu_guest_getrandom_nofail(setup_data->data, RNG_SEED_LENGTH);
>      }
>  
> -    /* Offset 0x250 is a pointer to the first setup_data link. */
> -    stq_p(header + 0x250, first_setup_data);
> +    if (first_setup_data) {
> +            /* Offset 0x250 is a pointer to the first setup_data link. */
> +            stq_p(header + 0x250, first_setup_data);
> +            rom_add_blob("setup_data", setup_datas, setup_data_total_len, setup_data_total_len,
> +                         setup_data_base, NULL, NULL, NULL, NULL, false);
> +    }

The boot measurements with AMD SEV now succeed, but I'm a little
worried about the implications of adding this ROM, when a few lines
later here we're discarding the 'header' changes for AMD SEV. Is
this still going to operate correctly in the guest OS if we've
discarded the header changes below ?

>      /*
>       * If we're starting an encrypted VM, it will be OVMF based, which uses the
>       * efi stub for booting and doesn't require any values to be placed in the
>       * kernel header.  We therefore don't update the header so the hash of the
>       * kernel on the other side of the fw_cfg interface matches the hash of the
>       * file the user passed in.
>       */
>      if (!sev_enabled()) {
>          memcpy(setup, header, MIN(sizeof(header), setup_size));
>      }
>  
>      fw_cfg_add_i32(fw_cfg, FW_CFG_KERNEL_ADDR, prot_addr);
>      fw_cfg_add_i32(fw_cfg, FW_CFG_KERNEL_SIZE, kernel_size);
>      fw_cfg_add_bytes(fw_cfg, FW_CFG_KERNEL_DATA, kernel, kernel_size);
>      sev_load_ctx.kernel_data = (char *)kernel;
> -- 
> 2.35.1
> 
> 

With regards,
Daniel
-- 
|: https://berrange.com      -o-    https://www.flickr.com/photos/dberrange :|
|: https://libvirt.org         -o-            https://fstop138.berrange.com :|
|: https://entangle-photo.org    -o-    https://www.instagram.com/dberrange :|


