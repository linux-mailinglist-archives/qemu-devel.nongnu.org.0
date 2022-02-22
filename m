Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 606FF4BF4F1
	for <lists+qemu-devel@lfdr.de>; Tue, 22 Feb 2022 10:46:45 +0100 (CET)
Received: from localhost ([::1]:38098 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nMRkq-0000om-3P
	for lists+qemu-devel@lfdr.de; Tue, 22 Feb 2022 04:46:44 -0500
Received: from eggs.gnu.org ([209.51.188.92]:46182)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgilbert@redhat.com>)
 id 1nMRhu-0008E7-H8
 for qemu-devel@nongnu.org; Tue, 22 Feb 2022 04:43:42 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:32670)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgilbert@redhat.com>)
 id 1nMRhq-0007Yu-K6
 for qemu-devel@nongnu.org; Tue, 22 Feb 2022 04:43:40 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1645523016;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=fFzOD2aY1W50GZYLtPF5NzZwXL5V14ps+qkKaFGWlXo=;
 b=Tm3TzyxcaDfMKjlSd8BX0kOMwO1nVOBhxJ34oy/slbjy+CjKIkaBSeDMtKekXKqtAkPwaq
 P88O1TT3Oj10dEUAFGAVPZEoPimJvCWMIehSKmKCk0KdUhxXitHP6B1ezIHvEBZISmVuUl
 B9C1uzn2JwT8vY12twOUNGMq35jVitM=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-284-pUMVppE3Ny6lig4OFN7hAw-1; Tue, 22 Feb 2022 04:43:35 -0500
X-MC-Unique: pUMVppE3Ny6lig4OFN7hAw-1
Received: by mail-wm1-f70.google.com with SMTP id
 i20-20020a05600c051400b00380d5eb51a7so311137wmc.3
 for <qemu-devel@nongnu.org>; Tue, 22 Feb 2022 01:43:35 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=fFzOD2aY1W50GZYLtPF5NzZwXL5V14ps+qkKaFGWlXo=;
 b=3+z9h6rRmKLRhOl+yUhfdfk2EnMXkQiTE68IqS6HyYqw+PYs28R35oxPCa7xP12m8i
 RRlVp4277y55M2qBT7LNthg60Yqm4wFXzgYH4q6DlybjaegAcIp+20qwyIJBmj+hH+E8
 ud27o+P2JFy5qQqjYRTWLiYhg/8TwZd4Z9igByaTkqCoYqisWb377Ckn2BIdcl+j1GkM
 7vyhQ74f8L49/z+ElgsyULx1/wHmUiEZxV/5qN9X7IREaBuvnIVt1tLP4apmn2rJ+w29
 Uoz/SqprbpwQwB0mEghzmtOTGuGlBs6/x0ZtIcwE/A72qo1odK2FSpS58SsZVpzX0n3I
 bZpQ==
X-Gm-Message-State: AOAM530l74rQqVxP4XGQzxKzURubz8TZHuWqmwv/CLt5oNqKklR6RBeN
 2doVatAxqXyimski1kVO2x5m3bLejCbe3fR3YLm3rW2TJRx1wF5C8J+yetqjHB3p1GrsApI1dND
 RMf02yLwszyVLZCc=
X-Received: by 2002:a05:600c:3d06:b0:37b:a5ea:a61b with SMTP id
 bh6-20020a05600c3d0600b0037ba5eaa61bmr2618655wmb.32.1645523014194; 
 Tue, 22 Feb 2022 01:43:34 -0800 (PST)
X-Google-Smtp-Source: ABdhPJzCWTvyF6qHWWkpe1SkFkkd/S7EuJnSaPbrwhmyn3nzLhTpI766mkyZXyIO8G0V4XEfKY1lfA==
X-Received: by 2002:a05:600c:3d06:b0:37b:a5ea:a61b with SMTP id
 bh6-20020a05600c3d0600b0037ba5eaa61bmr2618624wmb.32.1645523013992; 
 Tue, 22 Feb 2022 01:43:33 -0800 (PST)
Received: from work-vm (cpc109025-salf6-2-0-cust480.10-2.cable.virginm.net.
 [82.30.61.225]) by smtp.gmail.com with ESMTPSA id
 i22-20020a05600c355600b0037bee3a4e00sm2045402wmq.47.2022.02.22.01.43.32
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 22 Feb 2022 01:43:33 -0800 (PST)
Date: Tue, 22 Feb 2022 09:43:31 +0000
From: "Dr. David Alan Gilbert" <dgilbert@redhat.com>
To: Dov Murik <dovmurik@linux.ibm.com>
Subject: Re: [PATCH v3 1/2] hw/i386: Improve bounds checking in OVMF table
 parsing
Message-ID: <YhSwQ36N9nq+9n9f@work-vm>
References: <20220222071906.2632426-1-dovmurik@linux.ibm.com>
 <20220222071906.2632426-2-dovmurik@linux.ibm.com>
MIME-Version: 1.0
In-Reply-To: <20220222071906.2632426-2-dovmurik@linux.ibm.com>
User-Agent: Mutt/2.1.5 (2021-12-30)
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=dgilbert@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=170.10.133.124; envelope-from=dgilbert@redhat.com;
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
Cc: Eduardo Habkost <eduardo@habkost.net>,
 Daniel =?iso-8859-1?Q?P=2E_Berrang=E9?= <berrange@redhat.com>,
 "Michael S. Tsirkin" <mst@redhat.com>, James Bottomley <jejb@linux.ibm.com>,
 Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org,
 Philippe =?iso-8859-1?Q?Mathieu-Daud=E9?= <f4bug@amsat.org>,
 Tobin Feldman-Fitzthum <tobin@linux.ibm.com>,
 Gerd Hoffmann <kraxel@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

* Dov Murik (dovmurik@linux.ibm.com) wrote:
> When pc_system_parse_ovmf_flash() parses the optional GUIDed table in
> the end of the OVMF flash memory area, the table length field is checked
> for sizes that are too small, but doesn't error on sizes that are too
> big (bigger than the flash content itself).
> 
> Add a check for maximal size of the OVMF table, and add an error report
> in case the size is invalid.  In such a case, an error like this will be
> displayed during launch:
> 
>     qemu-system-x86_64: OVMF table has invalid size 4047
> 
> and the table parsing is skipped.
> 
> Signed-off-by: Dov Murik <dovmurik@linux.ibm.com>

Thanks,


Reviewed-by: Dr. David Alan Gilbert <dgilbert@redhat.com>

> ---
>  hw/i386/pc_sysfw_ovmf.c | 9 ++++++++-
>  1 file changed, 8 insertions(+), 1 deletion(-)
> 
> diff --git a/hw/i386/pc_sysfw_ovmf.c b/hw/i386/pc_sysfw_ovmf.c
> index f4dd92c588..df15c9737b 100644
> --- a/hw/i386/pc_sysfw_ovmf.c
> +++ b/hw/i386/pc_sysfw_ovmf.c
> @@ -24,6 +24,7 @@
>   */
>  
>  #include "qemu/osdep.h"
> +#include "qemu/error-report.h"
>  #include "hw/i386/pc.h"
>  #include "cpu.h"
>  
> @@ -66,7 +67,13 @@ void pc_system_parse_ovmf_flash(uint8_t *flash_ptr, size_t flash_size)
>      ptr -= sizeof(uint16_t);
>      tot_len = le16_to_cpu(*(uint16_t *)ptr) - sizeof(guid) - sizeof(uint16_t);
>  
> -    if (tot_len <= 0) {
> +    if (tot_len < 0 || tot_len > (ptr - flash_ptr)) {
> +        error_report("OVMF table has invalid size %d", tot_len);
> +        return;
> +    }
> +
> +    if (tot_len == 0) {
> +        /* no entries in the OVMF table */
>          return;
>      }
>  
> -- 
> 2.25.1
> 
-- 
Dr. David Alan Gilbert / dgilbert@redhat.com / Manchester, UK


