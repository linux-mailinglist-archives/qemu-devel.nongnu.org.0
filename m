Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1D90D671B7E
	for <lists+qemu-devel@lfdr.de>; Wed, 18 Jan 2023 13:08:48 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pI7F6-0000BE-29; Wed, 18 Jan 2023 07:08:36 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgilbert@redhat.com>)
 id 1pI7Eu-000093-Ro
 for qemu-devel@nongnu.org; Wed, 18 Jan 2023 07:08:33 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgilbert@redhat.com>)
 id 1pI7Et-0007kz-23
 for qemu-devel@nongnu.org; Wed, 18 Jan 2023 07:08:24 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1674043701;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=xrXlv2gDBZEKHfT6uHP8hH3VW49lnG9zYh5E25rAEbk=;
 b=c3ff1YFYDPZSVcrkeyXKVLn7U2sQN1YT7EsOMJbrcMHD3V7GuG1FQkAIznDkXSk77Yf6hK
 J7dBoW+8SsGAttwxp4yJAJDMd9cRXMDJX+NHMJGKPL1jlTe/l4PEZeXxxIXHJXNh+ht2IW
 wtbX8h3SevVysiJN2J/DklNex7Ia87c=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-45-w8uCbMNxPxiAVQYjGY-2XA-1; Wed, 18 Jan 2023 07:08:20 -0500
X-MC-Unique: w8uCbMNxPxiAVQYjGY-2XA-1
Received: by mail-wr1-f72.google.com with SMTP id
 g24-20020adfa498000000b002bbeb5fc4b7so6306863wrb.10
 for <qemu-devel@nongnu.org>; Wed, 18 Jan 2023 04:08:20 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=user-agent:in-reply-to:content-disposition:mime-version:references
 :message-id:subject:cc:to:from:date:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=xrXlv2gDBZEKHfT6uHP8hH3VW49lnG9zYh5E25rAEbk=;
 b=YaECZ3E6YPa6ozbL51dXzcykEKOawKoAStei5dvg8Z7UDPEBDWj2pMfJ7xSIGGpNK4
 1DDXCioNd7Ncliqi2KILIMr6xAqrRyZcTDBly8xogWju9CMQWpEyR9S1ENc/JNcxHTbU
 wkMRlX32nacuXFwCZXvxz3AENypA05r8kdDrHyyOc73KclvJ8Xe82pbNohgC4zL3U9jf
 /msi5LkeaqPlU9cx2Sda7pV94hU/Hl1meC/8bga5uLZ0HU3bbj33pYyYqSRd2cR8xErC
 2Pifqs0TduCZ/pKa/kTb6bScz42JAB1l9oVZ87c9cLlTgDTUVF84jdmv+4U/iEM7Qn3l
 syMg==
X-Gm-Message-State: AFqh2kqd6r6fyqSxWcDCsV+e7PLzSZLNse60t5+tDflrgkD1KbAZqvhl
 SLVpdkSQoYqTAbP08rU897ehl2cZLjKD4wuv3dnRb6G3VcuFOjKpmw/8SMu0kovTr/VlweHm6Le
 ePWmrqxgyJc0T3Io=
X-Received: by 2002:a05:600c:3d16:b0:3d0:6a57:66a5 with SMTP id
 bh22-20020a05600c3d1600b003d06a5766a5mr6479898wmb.0.1674043699476; 
 Wed, 18 Jan 2023 04:08:19 -0800 (PST)
X-Google-Smtp-Source: AMrXdXv1pyLcTEgVRMupRuZALBVl0z9my6qxx9l+xOEa4j/V1GIOzhoYlwQBBU+EZkFPO3/x2RPugQ==
X-Received: by 2002:a05:600c:3d16:b0:3d0:6a57:66a5 with SMTP id
 bh22-20020a05600c3d1600b003d06a5766a5mr6479880wmb.0.1674043699281; 
 Wed, 18 Jan 2023 04:08:19 -0800 (PST)
Received: from work-vm
 (ward-16-b2-v4wan-166627-cust863.vm18.cable.virginm.net. [81.97.203.96])
 by smtp.gmail.com with ESMTPSA id
 y26-20020a1c4b1a000000b003db07420d14sm1688482wma.39.2023.01.18.04.08.18
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 18 Jan 2023 04:08:18 -0800 (PST)
Date: Wed, 18 Jan 2023 12:08:16 +0000
From: "Dr. David Alan Gilbert" <dgilbert@redhat.com>
To: Peter Xu <peterx@redhat.com>
Cc: qemu-devel@nongnu.org, Leonardo Bras Soares Passos <lsoaresp@redhat.com>,
 James Houghton <jthoughton@google.com>, Juan Quintela <quintela@redhat.com>
Subject: Re: [PATCH RFC 04/21] madvise: Include linux/mman.h under
 linux-headers/
Message-ID: <Y8fhMMqHPudMx7rF@work-vm>
References: <20230117220914.2062125-1-peterx@redhat.com>
 <20230117220914.2062125-5-peterx@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230117220914.2062125-5-peterx@redhat.com>
User-Agent: Mutt/2.2.9 (2022-11-12)
Received-SPF: pass client-ip=170.10.129.124; envelope-from=dgilbert@redhat.com;
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

* Peter Xu (peterx@redhat.com) wrote:
> This will allow qemu/madvise.h to always include linux/mman.h under the
> linux-headers/.
> 
> Signed-off-by: Peter Xu <peterx@redhat.com>

Reviewed-by: Dr. David Alan Gilbert <dgilbert@redhat.com>

> ---
>  include/qemu/madvise.h | 4 ++++
>  1 file changed, 4 insertions(+)
> 
> diff --git a/include/qemu/madvise.h b/include/qemu/madvise.h
> index e155f59a0d..b6fa49553f 100644
> --- a/include/qemu/madvise.h
> +++ b/include/qemu/madvise.h
> @@ -8,6 +8,10 @@
>  #ifndef QEMU_MADVISE_H
>  #define QEMU_MADVISE_H
>  
> +#ifdef CONFIG_LINUX
> +#include "linux/mman.h"
> +#endif
> +
>  #define QEMU_MADV_INVALID -1
>  
>  #if defined(CONFIG_MADVISE)
> -- 
> 2.37.3
> 
-- 
Dr. David Alan Gilbert / dgilbert@redhat.com / Manchester, UK


