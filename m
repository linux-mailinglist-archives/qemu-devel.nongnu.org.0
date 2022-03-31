Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2D7284EDA48
	for <lists+qemu-devel@lfdr.de>; Thu, 31 Mar 2022 15:13:54 +0200 (CEST)
Received: from localhost ([::1]:35946 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nZucb-0003Hk-9E
	for lists+qemu-devel@lfdr.de; Thu, 31 Mar 2022 09:13:53 -0400
Received: from eggs.gnu.org ([209.51.188.92]:39768)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1nZuZ5-0000Fo-B1
 for qemu-devel@nongnu.org; Thu, 31 Mar 2022 09:10:15 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:27400)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1nZuZ2-0003KI-96
 for qemu-devel@nongnu.org; Thu, 31 Mar 2022 09:10:13 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1648732211;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=ZPJ2nuF1LaS6tesGnL3fP7t2sLUmw3CegMlbe+o8ZjU=;
 b=CHG6QNXOVH49HOdRotvLnjLSHicY1ve3EOaR5jGbeOwELiCr8bp1IwDTGn1xalrxsSNWwl
 FrbozgHXUaZ289UjhzP/KqF14kS2cE5E6uGXHsMlysaPphvhwb6ZZMoHXqobesEbnUujep
 yCn4UFMw2Hwqm5PzQyqEJ6sg71t+b1w=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-591-QSdGY_-HPMy9IkScetsJdA-1; Thu, 31 Mar 2022 09:10:10 -0400
X-MC-Unique: QSdGY_-HPMy9IkScetsJdA-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.rdu2.redhat.com
 [10.11.54.7])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 4C026805F46;
 Thu, 31 Mar 2022 13:10:09 +0000 (UTC)
Received: from redhat.com (unknown [10.39.194.58])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 5E954140262B;
 Thu, 31 Mar 2022 13:10:06 +0000 (UTC)
Date: Thu, 31 Mar 2022 14:10:04 +0100
From: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
To: Gerd Hoffmann <kraxel@redhat.com>
Subject: Re: [PATCH 3/3] i386: firmware parsing and sev setup for -bios
 loaded firmware
Message-ID: <YkWoLLt4pE0X/BnP@redhat.com>
References: <20220331083549.749566-1-kraxel@redhat.com>
 <20220331083549.749566-4-kraxel@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20220331083549.749566-4-kraxel@redhat.com>
User-Agent: Mutt/2.1.5 (2021-12-30)
X-Scanned-By: MIMEDefang 2.85 on 10.11.54.7
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=berrange@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=berrange@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
Cc: Eduardo Habkost <eduardo@habkost.net>,
 "Michael S. Tsirkin" <mst@redhat.com>, Xiaoyao Li <xiaoyao.li@intel.com>,
 Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org,
 Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Thu, Mar 31, 2022 at 10:35:49AM +0200, Gerd Hoffmann wrote:
> Don't register firmware as rom, not needed (see comment).
> Add x86_firmware_configure() call for proper sev initialization.
> 
> Signed-off-by: Gerd Hoffmann <kraxel@redhat.com>
> Tested-by: Xiaoyao Li <xiaoyao.li@intel.com>
> ---
>  hw/i386/x86.c | 25 +++++++++++++++++++------
>  1 file changed, 19 insertions(+), 6 deletions(-)

Reviewed-by: Daniel P. Berrangé <berrange@redhat.com>

I validated that I could validate the measurement of a SEV
guest with -bios, and see the firmware start at least.

Tested-by: Daniel P. Berrangé <berrange@redhat.com>

> 
> diff --git a/hw/i386/x86.c b/hw/i386/x86.c
> index b2e801a8720e..f98483c7fe83 100644
> --- a/hw/i386/x86.c
> +++ b/hw/i386/x86.c
> @@ -1116,12 +1116,25 @@ void x86_bios_rom_init(MachineState *ms, const char *default_firmware,
>      }
>      bios = g_malloc(sizeof(*bios));
>      memory_region_init_ram(bios, NULL, "pc.bios", bios_size, &error_fatal);
> -    if (!isapc_ram_fw) {
> -        memory_region_set_readonly(bios, true);
> -    }
> -    ret = rom_add_file_fixed(bios_name, (uint32_t)(-bios_size), -1);
> -    if (ret != 0) {
> -        goto bios_error;
> +    if (sev_enabled()) {
> +        /*
> +         * The concept of a "reset" simply doesn't exist for
> +         * confidential computing guests, we have to destroy and
> +         * re-launch them instead.  So there is no need to register
> +         * the firmware as rom to properly re-initialize on reset.
> +         * Just go for a straight file load instead.
> +         */
> +        void *ptr = memory_region_get_ram_ptr(bios);
> +        load_image_size(filename, ptr, bios_size);
> +        x86_firmware_configure(ptr, bios_size);
> +    } else {
> +        if (!isapc_ram_fw) {
> +            memory_region_set_readonly(bios, true);
> +        }
> +        ret = rom_add_file_fixed(bios_name, (uint32_t)(-bios_size), -1);
> +        if (ret != 0) {
> +            goto bios_error;
> +        }
>      }
>      g_free(filename);
>  
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


