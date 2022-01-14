Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B79A848EFA7
	for <lists+qemu-devel@lfdr.de>; Fri, 14 Jan 2022 19:09:46 +0100 (CET)
Received: from localhost ([::1]:35030 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n8R1F-0007H2-8Y
	for lists+qemu-devel@lfdr.de; Fri, 14 Jan 2022 13:09:45 -0500
Received: from eggs.gnu.org ([209.51.188.92]:49882)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1n8Qyz-0005IW-EG
 for qemu-devel@nongnu.org; Fri, 14 Jan 2022 13:07:25 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:57797)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1n8Qyw-0000MA-Qh
 for qemu-devel@nongnu.org; Fri, 14 Jan 2022 13:07:24 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1642183641;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=0T48o+QFAiH25oezDOwj0bzYcroyEePThN8//vpz7u4=;
 b=hbuNlpkbuOLLdWQkuIJvT3v9zssICjRBWoZcWFOZ/sg974SKFdII8P2kpNWiRJNA9nhjIZ
 PYZfKUZffarGxo19J5KvHBSTH2mzPcdhgz8J71iL2cwTUyUrcz8PPENYZiy6pKpAB0+xFJ
 LZgHYreUPEEi+vxc51RsUobwXw/uyEw=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-404-2pEM9zsxNCqNVu5cWeFS8w-1; Fri, 14 Jan 2022 13:07:15 -0500
X-MC-Unique: 2pEM9zsxNCqNVu5cWeFS8w-1
Received: by mail-wm1-f72.google.com with SMTP id
 n14-20020a7bcbce000000b003488820f0d9so5994522wmi.8
 for <qemu-devel@nongnu.org>; Fri, 14 Jan 2022 10:07:14 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to;
 bh=0T48o+QFAiH25oezDOwj0bzYcroyEePThN8//vpz7u4=;
 b=5cgHADy7fhkNknAfk+4+sPuluZvUPLPneyGYqYED4sGViR9qCg21LfwUdiYX45h+rn
 YEgpyfhpCD7nHad6dsYaLfHy3cFOjcMgI2iEdmh7xO+xH26M044+9lOZpSLCWC9aFZmG
 3WlOJpCfxBNHFccxcPSHvMcLM6KsKEUSU56jY4/G0ePYWO2jBhS+p8uYt/HDXcEZNwP8
 x2E+JFn6DPu/bMxjxV3V/3XnZlCBxbzK52EzknoTG52pZMHSwWQ4DlsgqGPxHtx6HONm
 ehFM7zbduWTluyQxQ34RZujplR0Xvd4AQ1DokoyTSHZYr0LfMR0ZOIIUw/gPWNzUxEMZ
 3xvg==
X-Gm-Message-State: AOAM531+j+z7ozoccuA8RtWMh5c0kAPLxzz32tLbzfhAO3erhs5i44YG
 BI6UAN8aSllWoYoPfkdzJx1jg3FOxlwRVSZJJoqLOd2z8aRhZj+VUpUihPx1xXy64GFzN1z2rH3
 vdzW8fxwC0CEtjoo=
X-Received: by 2002:a5d:6d8e:: with SMTP id l14mr9323540wrs.507.1642183633916; 
 Fri, 14 Jan 2022 10:07:13 -0800 (PST)
X-Google-Smtp-Source: ABdhPJwqQPYB0mKgz7abSXO2w40RICzp6N+tv7SbWyHhwIBPSMJw+yk11xUV5AYEevBwVdvHp6B/Fg==
X-Received: by 2002:a5d:6d8e:: with SMTP id l14mr9323519wrs.507.1642183633687; 
 Fri, 14 Jan 2022 10:07:13 -0800 (PST)
Received: from redhat.com ([2.55.154.210])
 by smtp.gmail.com with ESMTPSA id g2sm5813165wro.41.2022.01.14.10.07.11
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 14 Jan 2022 10:07:13 -0800 (PST)
Date: Fri, 14 Jan 2022 13:07:08 -0500
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Daniel =?iso-8859-1?Q?P=2E_Berrang=E9?= <berrange@redhat.com>
Subject: Re: [PATCH 2/2] hw/i386: support loading OVMF using -bios too
Message-ID: <20220114125946-mutt-send-email-mst@kernel.org>
References: <20220113165511.46098-1-berrange@redhat.com>
 <20220113165511.46098-3-berrange@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20220113165511.46098-3-berrange@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=mst@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=mst@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -33
X-Spam_score: -3.4
X-Spam_bar: ---
X-Spam_report: (-3.4 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.595,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Eduardo Habkost <eduardo@habkost.net>,
 Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org,
 Philippe =?iso-8859-1?Q?Mathieu-Daud=E9?= <f4bug@amsat.org>,
 Dov Murik <dovmurik@linux.ibm.com>, Gerd Hoffmann <kraxel@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>,
 "Dr . David Alan Gilbert" <dgilbert@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Thu, Jan 13, 2022 at 04:55:11PM +0000, Daniel P. Berrangé wrote:
> Traditionally the OVMF firmware has been loaded using the pflash
> mechanism. This is because it is usually provided as a pair of
> files, one read-only containing the code and one writable to
> provided persistence of non-volatile firmware variables.
> 
> The AMD SEV build of EDK2, however, is provided as a single
> file that contains only the code. This is intended to be used
> read-only and explicitly does not provide any ability for
> persistance of non-volatile firmware variables. While it is
> possible to configure this with the pflash mechanism, by only
> providing one of the 2 pflash blobs, conceptually it is a
> little strange to use pflash if there won't be any persistent
> data.
> 
> A stateless OVMF build can be loaded with -bios, however, QEMU
> does not currently initialize SEV in that scenario. This patch
> introduces the call needed for SEV initialization of the
> firmware.
> 
> Signed-off-by: Daniel P. Berrangé <berrange@redhat.com>
> ---
>  hw/i386/x86.c | 5 +++++
>  1 file changed, 5 insertions(+)
> 
> diff --git a/hw/i386/x86.c b/hw/i386/x86.c
> index b84840a1bb..c79d84936f 100644
> --- a/hw/i386/x86.c
> +++ b/hw/i386/x86.c
> @@ -45,6 +45,7 @@
>  #include "target/i386/cpu.h"
>  #include "hw/i386/topology.h"
>  #include "hw/i386/fw_cfg.h"
> +#include "hw/i386/pc.h"
>  #include "hw/intc/i8259.h"
>  #include "hw/rtc/mc146818rtc.h"
>  #include "target/i386/sev.h"

This builds fine because there's a stub in pc_sysfw_ovmf-stubs.c

The unfortunate thing about this however is that it's too easy to pull
in a PC dependency, and people building with CONFIG_PC will not notice
until it breaks for others.

Is it time we split pc.h further and had pc_sysfw_ovmf.h ?

> @@ -1157,6 +1158,10 @@ void x86_bios_rom_init(MachineState *ms, const char *default_firmware,
>      memory_region_add_subregion(rom_memory,
>                                  (uint32_t)(-bios_size),
>                                  bios);
> +
> +    pc_system_ovmf_initialize_sev(
> +        rom_ptr((uint32_t)-bios_size, bios_size),
> +        bios_size);

Just curious about the formatting here:

    pc_system_ovmf_initialize_sev(rom_ptr((uint32_t)-bios_size, bios_size),
				  bios_size);

would be prettier ...

>  }
>  
>  bool x86_machine_is_smm_enabled(const X86MachineState *x86ms)
> -- 
> 2.33.1


