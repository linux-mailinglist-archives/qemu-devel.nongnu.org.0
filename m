Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BB0026A0B8C
	for <lists+qemu-devel@lfdr.de>; Thu, 23 Feb 2023 15:09:08 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pVCH5-00014B-6V; Thu, 23 Feb 2023 09:08:43 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imammedo@redhat.com>)
 id 1pVCH1-00010W-De
 for qemu-devel@nongnu.org; Thu, 23 Feb 2023 09:08:39 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imammedo@redhat.com>)
 id 1pVCGz-00079T-Qh
 for qemu-devel@nongnu.org; Thu, 23 Feb 2023 09:08:39 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1677161316;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=+qGPuFi69msBQ8sB3Ep2aqTzNmCa34dN778e5MupFN0=;
 b=CB0BPf0ekUvphviszOBQsnEAlTXZkppqzxkYAcuiaMOkEgYIofxZfAt12oa8lvOdqLSiyk
 LGKlqT1qY0JMp9BAE8nJPt0+glmtHJddVwnoRRly9eHiScrcOSQUF1KU5dCf1vOdqhxeFi
 8SHfozyqxJX+3g1qxoZTRV2Es8paAe0=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-8-MpzVhrPbMGq_T31j14XvAg-1; Thu, 23 Feb 2023 09:08:35 -0500
X-MC-Unique: MpzVhrPbMGq_T31j14XvAg-1
Received: by mail-wm1-f70.google.com with SMTP id
 m22-20020a05600c4f5600b003dffc7343c3so4992250wmq.0
 for <qemu-devel@nongnu.org>; Thu, 23 Feb 2023 06:08:33 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:subject:cc:to:from:date:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=+qGPuFi69msBQ8sB3Ep2aqTzNmCa34dN778e5MupFN0=;
 b=JANLU9iY3pKw+aWjCbHfVnDEL3nsQm4K7pSAi5JviBeVQB71yBCYKjxKQj0GDqJ13J
 l96iL+I0oI+KY30FWruvXWu4hgaOAiZLutExl9WYu2tPSkW8c/w6eInqJbh3mlXQib/I
 VgJhSFWYszZ4ZLFH6gSzqVkmBeDOX8R0mW+qyiEC7H4kwb4/XfUUvXeSzYNo3niYyoA8
 Em2gb6RQd/BASR1uQV9nH6CznXTOf0aDqPn4fiy4i+ryjzphZnFJmMYofvS+DS/+6dHa
 4+Zx6Zuo1UhsAbB06uy5u7TgM6RBcWVaOKna3jqtodyygHAfYI/Qwm6s153KPlUjWewf
 0CnA==
X-Gm-Message-State: AO0yUKU9j0uaqeO/k4wZ6mZ3a+a6KDrsm4kPzHV9T4eyb+YRAQ0k4ImD
 wLjVAVvpvcyxr1zu0BRmnFfGvnuP5vQF4ylzkxchJIX0pnKqGN9bgruX4Ov3IzM6mFfdHv3iWpg
 Vkzoy3ogmB/HdGC0=
X-Received: by 2002:a5d:6781:0:b0:2c3:f880:bb1f with SMTP id
 v1-20020a5d6781000000b002c3f880bb1fmr9292743wru.14.1677161312990; 
 Thu, 23 Feb 2023 06:08:32 -0800 (PST)
X-Google-Smtp-Source: AK7set+uTZsxOaD3hkhSmeIcTMhLk0uVOnJk9SPpBx+7whuZ2F7/a8AVZ3i/pgnVegrrNXJdTQJRJQ==
X-Received: by 2002:a5d:6781:0:b0:2c3:f880:bb1f with SMTP id
 v1-20020a5d6781000000b002c3f880bb1fmr9292725wru.14.1677161312727; 
 Thu, 23 Feb 2023 06:08:32 -0800 (PST)
Received: from imammedo.users.ipa.redhat.com ([185.140.112.229])
 by smtp.gmail.com with ESMTPSA id
 i16-20020adfefd0000000b002c552c6c8c2sm8017206wrp.87.2023.02.23.06.08.31
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 23 Feb 2023 06:08:31 -0800 (PST)
Date: Thu, 23 Feb 2023 15:08:31 +0100
From: Igor Mammedov <imammedo@redhat.com>
To: Julia Suvorova <jusual@redhat.com>
Cc: qemu-devel@nongnu.org, "Michael S. Tsirkin" <mst@redhat.com>, Ani Sinha
 <ani@anisinha.ca>
Subject: Re: [PATCH v2] hw/smbios: fix field corruption in type 4 table
Message-ID: <20230223150831.15f6d1d0@imammedo.users.ipa.redhat.com>
In-Reply-To: <20230223125747.254914-1-jusual@redhat.com>
References: <20230223125747.254914-1-jusual@redhat.com>
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

On Thu, 23 Feb 2023 13:57:47 +0100
Julia Suvorova <jusual@redhat.com> wrote:

> Since table type 4 of SMBIOS version 2.6 is shorter than 3.0, the
> strings which follow immediately after the struct fields have been
> overwritten by unconditional filling of later fields such as core_count2.
> Make these fields dependent on the SMBIOS version.
> 
> Fixes: 05e27d74c7 ("hw/smbios: add core_count2 to smbios table type 4")
> Resolves: https://bugzilla.redhat.com/show_bug.cgi?id=2169904
> 
> Signed-off-by: Julia Suvorova <jusual@redhat.com>

Reviewed-by: Igor Mammedov <imammedo@redhat.com>

> ---
> v2:
>     * add fixes tag
>     * check tbl_len instead of ep_type
> 
>  hw/smbios/smbios.c | 8 +++++---
>  1 file changed, 5 insertions(+), 3 deletions(-)
> 
> diff --git a/hw/smbios/smbios.c b/hw/smbios/smbios.c
> index 4869566cf5..d2007e70fb 100644
> --- a/hw/smbios/smbios.c
> +++ b/hw/smbios/smbios.c
> @@ -750,14 +750,16 @@ static void smbios_build_type_4_table(MachineState *ms, unsigned instance)
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
> +    if (tbl_len == SMBIOS_TYPE_4_LEN_V30) {
> +        t->core_count2 = t->core_enabled2 = cpu_to_le16(ms->smp.cores);
> +        t->thread_count2 = cpu_to_le16(ms->smp.threads);
> +    }
> +
>      SMBIOS_BUILD_TABLE_POST;
>      smbios_type4_count++;
>  }


