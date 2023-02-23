Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id EF63A6A03E5
	for <lists+qemu-devel@lfdr.de>; Thu, 23 Feb 2023 09:33:19 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pV71f-00024s-23; Thu, 23 Feb 2023 03:32:27 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imammedo@redhat.com>)
 id 1pV71c-00024Y-0J
 for qemu-devel@nongnu.org; Thu, 23 Feb 2023 03:32:24 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imammedo@redhat.com>)
 id 1pV71a-0006NA-6z
 for qemu-devel@nongnu.org; Thu, 23 Feb 2023 03:32:23 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1677141140;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=UnvQSAaMZA7DFun3pbrQfm8gmn7wuhBHB+yplO8AlGs=;
 b=J624mKqKjihar/8FwovY+xc1Je5vss1/gcz1znsBci0UX8hjy3ZRHmaQf5gHx5wyscSGXP
 8ZAm3YZV/95irqxuXWHXiWf2j1HrcBtdL6SLlxLtQbKbpOxdlgdBLPSUlSZRnkcq5j0F5m
 aAse3PFwuoitjz2eTSjTz3rfJ4WQlDw=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-176-XY5QbjYPP-Ch6ysaOJ5vbQ-1; Thu, 23 Feb 2023 03:32:19 -0500
X-MC-Unique: XY5QbjYPP-Ch6ysaOJ5vbQ-1
Received: by mail-wm1-f71.google.com with SMTP id
 m31-20020a05600c3b1f00b003e9de8c95easo1209662wms.2
 for <qemu-devel@nongnu.org>; Thu, 23 Feb 2023 00:32:18 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:subject:cc:to:from:date:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=UnvQSAaMZA7DFun3pbrQfm8gmn7wuhBHB+yplO8AlGs=;
 b=bQAiK/WVORe/sTtekv0gINloxd2E62nl3Bsu/jp7vG2XXARQvyWM6sm9uEqxqSo/mH
 G2nYw5r+VmL7ZyZmOtS0P7MVw6EfftS2gA/IR1fb23831NJy06rzCL6OXbQQBxTqkEfQ
 1QwmcSFDV9OzxDkCJ0U5M+Fa8oq0cqzP8gspiQAn0c2mp/afw815ep0vJfYcQRlpa3Er
 xFcf3s9ueW1kVG9hVuMgC0k+qjwcU3ONOSoramIhwJQt2RjXSRE1ve97+80Y/xhVi05R
 wGEEsIuFXjoynE+eQrmlZvyDfShdRDIMJGMhlqOKfL0m/sd4vvRirG7qHJ4szA2Ra33d
 M8ow==
X-Gm-Message-State: AO0yUKVFPjdFYNtP2Higy/pRDSx1vQXahr3pTk2ve3kKP7ImYEQLEvfq
 4EL7RwL0oCKWTFZh80rUlaFsH6LyaHOPbhUSt51tBhVpoA9fd1Xu9+68G58QCD52Q8dNU9876VL
 r16r0Q+qtfQd8jJ8=
X-Received: by 2002:a05:600c:4fc5:b0:3dd:1982:4d14 with SMTP id
 o5-20020a05600c4fc500b003dd19824d14mr8841400wmq.1.1677141137928; 
 Thu, 23 Feb 2023 00:32:17 -0800 (PST)
X-Google-Smtp-Source: AK7set8U7VnjtsyNd+DsRIvQ6k/F7yMn1w3NfQk1nUEkfJp0hBycrGU0SLThuPC7CxxIT84UyJKhEQ==
X-Received: by 2002:a05:600c:4fc5:b0:3dd:1982:4d14 with SMTP id
 o5-20020a05600c4fc500b003dd19824d14mr8841389wmq.1.1677141137673; 
 Thu, 23 Feb 2023 00:32:17 -0800 (PST)
Received: from imammedo.users.ipa.redhat.com ([185.140.112.229])
 by smtp.gmail.com with ESMTPSA id
 m26-20020a7bca5a000000b003e20a6fd604sm9748449wml.4.2023.02.23.00.32.16
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 23 Feb 2023 00:32:17 -0800 (PST)
Date: Thu, 23 Feb 2023 09:32:16 +0100
From: Igor Mammedov <imammedo@redhat.com>
To: Julia Suvorova <jusual@redhat.com>
Cc: qemu-devel@nongnu.org, "Michael S. Tsirkin" <mst@redhat.com>, Ani Sinha
 <ani@anisinha.ca>
Subject: Re: [PATCH] hw/smbios: fix field corruption in type 4 table
Message-ID: <20230223093216.2fa6a6ab@imammedo.users.ipa.redhat.com>
In-Reply-To: <20230222210049.238599-1-jusual@redhat.com>
References: <20230222210049.238599-1-jusual@redhat.com>
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.36; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=imammedo@redhat.com;
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

On Wed, 22 Feb 2023 22:00:49 +0100
Julia Suvorova <jusual@redhat.com> wrote:

> Since table type 4 of SMBIOS version 2.6 is shorter than 3.0, the
> strings which follow immediately after the struct fields have been
> overwritten by unconditional filling of later fields such as core_count2.
> Make these fields dependent on the SMBIOS version.
> 
> Fixes: https://bugzilla.redhat.com/show_bug.cgi?id=2169904
> 
> Signed-off-by: Julia Suvorova <jusual@redhat.com>
> ---
>  hw/smbios/smbios.c | 8 +++++---
>  1 file changed, 5 insertions(+), 3 deletions(-)
> 
> diff --git a/hw/smbios/smbios.c b/hw/smbios/smbios.c
> index b4243de735..903fd22350 100644
> --- a/hw/smbios/smbios.c
> +++ b/hw/smbios/smbios.c
> @@ -749,14 +749,16 @@ static void smbios_build_type_4_table(MachineState *ms, unsigned instance)
>      t->core_count = (ms->smp.cores > 255) ? 0xFF : ms->smp.cores;
>      t->core_enabled = t->core_count;
>  
> -    t->core_count2 = t->core_enabled2 = cpu_to_le16(ms->smp.cores);
> -
>      t->thread_count = (ms->smp.threads > 255) ? 0xFF : ms->smp.threads;
> -    t->thread_count2 = cpu_to_le16(ms->smp.threads);
>  
>      t->processor_characteristics = cpu_to_le16(0x02); /* Unknown */
>      t->processor_family2 = cpu_to_le16(0x01); /* Other */
>  
> +    if (smbios_ep_type == SMBIOS_ENTRY_POINT_TYPE_64) {
it would be better to use table length as the condition here.

> +        t->core_count2 = t->core_enabled2 = cpu_to_le16(ms->smp.cores);
> +        t->thread_count2 = cpu_to_le16(ms->smp.threads);
> +    }
> +
>      SMBIOS_BUILD_TABLE_POST;
>      smbios_type4_count++;
>  }


