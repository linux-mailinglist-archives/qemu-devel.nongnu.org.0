Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4919A5F0E77
	for <lists+qemu-devel@lfdr.de>; Fri, 30 Sep 2022 17:10:59 +0200 (CEST)
Received: from localhost ([::1]:59880 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oeHfE-0004zU-V6
	for lists+qemu-devel@lfdr.de; Fri, 30 Sep 2022 11:10:56 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42164)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1oeHZs-0001IX-Ob
 for qemu-devel@nongnu.org; Fri, 30 Sep 2022 11:05:24 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:49996)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1oeHZo-0005Eg-Hy
 for qemu-devel@nongnu.org; Fri, 30 Sep 2022 11:05:22 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1664550315;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:in-reply-to:in-reply-to:  references:references;
 bh=slo+eMUZtKq1RID7CDn8DE2h5hJ2Jw9pXsl0GddModw=;
 b=jCn+5TFvVGgzrQw1ujFfaN9WEmHCjcQKmRxLTUxBZeReARIxhLR6HgQpXW3ON1QbVsgS3A
 M9Pq/+A0DSqgi7EwlgmymmOAAyvSLeusr8VdJ242n6FCvF44QFI2nsAaDgvZX2fDMDOHpR
 FvWj55rYySeIDAxo2rzJ/k76ngueS1Q=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-520-_rrRESY1PrylNvG2JslnFQ-1; Fri, 30 Sep 2022 11:05:13 -0400
X-MC-Unique: _rrRESY1PrylNvG2JslnFQ-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.rdu2.redhat.com
 [10.11.54.3])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 209BD1C05AF5;
 Fri, 30 Sep 2022 15:05:13 +0000 (UTC)
Received: from redhat.com (unknown [10.33.36.77])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id E7977111E3FB;
 Fri, 30 Sep 2022 15:05:11 +0000 (UTC)
Date: Fri, 30 Sep 2022 16:05:09 +0100
From: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
To: "Jason A. Donenfeld" <Jason@zx2c4.com>
Cc: f4bug@amsat.org, aurelien@aurel32.net, qemu-devel@nongnu.org,
 tsbogend@alpha.franken.de
Subject: Re: [PATCH qemu] mips/malta: pass RNG seed to to kernel via env var
Message-ID: <YzcFpYL9W1O6olJ3@redhat.com>
References: <20220930140520.576374-1-Jason@zx2c4.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20220930140520.576374-1-Jason@zx2c4.com>
User-Agent: Mutt/2.2.7 (2022-08-07)
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.3
Received-SPF: pass client-ip=170.10.133.124; envelope-from=berrange@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
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
Reply-To: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Fri, Sep 30, 2022 at 04:05:20PM +0200, Jason A. Donenfeld wrote:
> With the kernel patch linked below, Linux ingests a RNG seed
> passed from the hypervisor. So, pass this for the Malta platform, and
> reinitialize it on reboot too, so that it's always fresh.
> 
> Link: https://lore.kernel.org/linux-mips/20220930140138.575751-1-Jason@zx2c4.com/
> Signed-off-by: Jason A. Donenfeld <Jason@zx2c4.com>
> ---
>  hw/mips/malta.c | 25 +++++++++++++++++++++++++
>  1 file changed, 25 insertions(+)
> 
> diff --git a/hw/mips/malta.c b/hw/mips/malta.c
> index 0e932988e0..9d793b3c17 100644
> --- a/hw/mips/malta.c
> +++ b/hw/mips/malta.c
> @@ -26,6 +26,7 @@
>  #include "qemu/units.h"
>  #include "qemu/bitops.h"
>  #include "qemu/datadir.h"
> +#include "qemu/guest-random.h"
>  #include "hw/clock.h"
>  #include "hw/southbridge/piix.h"
>  #include "hw/isa/superio.h"
> @@ -1017,6 +1018,17 @@ static void G_GNUC_PRINTF(3, 4) prom_set(uint32_t *prom_buf, int index,
>      va_end(ap);
>  }
>  
> +static void reinitialize_rng_seed(void *opaque)
> +{
> +    char *rng_seed_hex = opaque;
> +    uint8_t rng_seed[32];
> +
> +    qemu_guest_getrandom_nofail(rng_seed, sizeof(rng_seed));
> +    for (size_t i = 0; i < sizeof(rng_seed); ++i) {
> +        sprintf(rng_seed_hex + i * 2, "%02x", rng_seed[i]);
> +    }
> +}
> +
>  /* Kernel */
>  static uint64_t load_kernel(void)
>  {
> @@ -1028,6 +1040,8 @@ static uint64_t load_kernel(void)
>      long prom_size;
>      int prom_index = 0;
>      uint64_t (*xlate_to_kseg0) (void *opaque, uint64_t addr);
> +    uint8_t rng_seed[32];
> +    char rng_seed_hex[sizeof(rng_seed) * 2 + 1];

The +1 suggests you're intending to NUL terminate, but nothing
in this patch ever initializes this last byte.

>  
>  #if TARGET_BIG_ENDIAN
>      big_endian = 1;
> @@ -1115,9 +1129,20 @@ static uint64_t load_kernel(void)
>  
>      prom_set(prom_buf, prom_index++, "modetty0");
>      prom_set(prom_buf, prom_index++, "38400n8r");
> +
> +    qemu_guest_getrandom_nofail(rng_seed, sizeof(rng_seed));
> +    for (size_t i = 0; i < sizeof(rng_seed); ++i) {
> +        sprintf(rng_seed_hex + i * 2, "%02x", rng_seed[i]);
> +    }
> +    prom_set(prom_buf, prom_index++, "rngseed");
> +    prom_set(prom_buf, prom_index++, "%s", rng_seed_hex);
> +
>      prom_set(prom_buf, prom_index++, NULL);
>  
>      rom_add_blob_fixed("prom", prom_buf, prom_size, ENVP_PADDR);
> +    qemu_register_reset(reinitialize_rng_seed,
> +                        memmem(rom_ptr(ENVP_PADDR, prom_size), prom_size,
> +                               rng_seed_hex, sizeof(rng_seed_hex)));
>  
>      g_free(prom_buf);
>      return kernel_entry;
> -- 
> 2.37.3
> 
> 

With regards,
Daniel
-- 
|: https://berrange.com      -o-    https://www.flickr.com/photos/dberrange :|
|: https://libvirt.org         -o-            https://fstop138.berrange.com :|
|: https://entangle-photo.org    -o-    https://www.instagram.com/dberrange :|


