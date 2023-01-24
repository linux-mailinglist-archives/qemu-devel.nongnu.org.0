Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2C758679F48
	for <lists+qemu-devel@lfdr.de>; Tue, 24 Jan 2023 17:56:44 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pKMaI-0003tG-6S; Tue, 24 Jan 2023 11:55:46 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imammedo@redhat.com>)
 id 1pKMaG-0003t7-5p
 for qemu-devel@nongnu.org; Tue, 24 Jan 2023 11:55:44 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imammedo@redhat.com>)
 id 1pKMaE-00029T-O8
 for qemu-devel@nongnu.org; Tue, 24 Jan 2023 11:55:43 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1674579342;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=L0iox1l7sYtCSF18ty33gCbidmNX4LDWLCyWx7AQr68=;
 b=F85FkxospJ7ePVE1LOeM9EY5y4c2PuOkSsX7jhVtyyXVzqR4jV5k1cqPTy7lc94YiIXlh1
 OmTHamxv4R/zqzzwES2gO/CFswROS9abG+/kBIA6nvQctpglmqSjjiKg5MsQwnW+s627x5
 fLVc3NZAeFfKK9aIQxzlTYF5V8cVs2Y=
Received: from mail-ej1-f70.google.com (mail-ej1-f70.google.com
 [209.85.218.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-496-xdMjhcRWMIKnIDzCHk6qSQ-1; Tue, 24 Jan 2023 11:55:39 -0500
X-MC-Unique: xdMjhcRWMIKnIDzCHk6qSQ-1
Received: by mail-ej1-f70.google.com with SMTP id
 xj11-20020a170906db0b00b0077b6ecb23fcso10251159ejb.5
 for <qemu-devel@nongnu.org>; Tue, 24 Jan 2023 08:55:39 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:subject:cc:to:from:date:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=L0iox1l7sYtCSF18ty33gCbidmNX4LDWLCyWx7AQr68=;
 b=wM4jhGQkNiO/AVO6Y1L6gL5ZYZkgo2mJ4GE8d1C4f2y2QpRPdauSODFIyWsD4BjRKY
 9O/hnSlmW2J3Ui73N8rOGppjhsRk20Mt4Qzg99UW50uxiCRl9UED1ug0tzl/kPuf9xGC
 mnXzZ0YRDMtVapMkBVg0v8+OjH1Jk6IoqT5PR2j3Xf04MiFRb15tPrMBdBSFxpByhxie
 xj+9R7AMapYKx8PcQsEj8KgVldQmliYwzQmR4mk3vicMSHXGpj7j5V4lzqh6AGRjIi3H
 ooBHFnADjSxdR0JUvRuzlrm7j9h2wS01pdkJ3FeRUWs8R9m8KC8505bCQxiqAfIjbkXQ
 IuTQ==
X-Gm-Message-State: AFqh2koKFmQZe860kVKvDOpBKoMlu128pdcvKRjNzOHMZUS0HVjpv1sj
 EupofXv3h0lObMGyXR5tWMz8bOy1j7Rfl60sYRENEn63JLqZXf4LwGEiCwvh/8x0hcvUU4y+twV
 fNQciGZEoOgA0z7A=
X-Received: by 2002:a17:906:8d86:b0:870:dceb:696d with SMTP id
 ry6-20020a1709068d8600b00870dceb696dmr36505619ejc.43.1674579338393; 
 Tue, 24 Jan 2023 08:55:38 -0800 (PST)
X-Google-Smtp-Source: AMrXdXtUBJ5U3KSbxPj5dNQAboHHi0jin+E+vu6pb62IibxPTOnk/ESw2HLRBEtdf+epGNYdWxlBvQ==
X-Received: by 2002:a17:906:8d86:b0:870:dceb:696d with SMTP id
 ry6-20020a1709068d8600b00870dceb696dmr36505603ejc.43.1674579338195; 
 Tue, 24 Jan 2023 08:55:38 -0800 (PST)
Received: from imammedo.users.ipa.redhat.com (nat-pool-brq-t.redhat.com.
 [213.175.37.10]) by smtp.gmail.com with ESMTPSA id
 m26-20020a1709066d1a00b008779b5c7db6sm1148098ejr.107.2023.01.24.08.55.37
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 24 Jan 2023 08:55:37 -0800 (PST)
Date: Tue, 24 Jan 2023 17:55:37 +0100
From: Igor Mammedov <imammedo@redhat.com>
To: Bernhard Beschow <shentey@gmail.com>
Cc: qemu-devel@nongnu.org, Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Philippe =?UTF-8?B?TWF0aGlldS1EYXVkw6k=?= <philmd@linaro.org>, Ani Sinha
 <ani@anisinha.ca>, "Michael S. Tsirkin" <mst@redhat.com>, Aurelien Jarno
 <aurelien@aurel32.net>
Subject: Re: [PATCH 2/7] hw/acpi/ich9: Remove unneeded assignments
Message-ID: <20230124175537.5cb5da48@imammedo.users.ipa.redhat.com>
In-Reply-To: <20230122170724.21868-3-shentey@gmail.com>
References: <20230122170724.21868-1-shentey@gmail.com>
 <20230122170724.21868-3-shentey@gmail.com>
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

On Sun, 22 Jan 2023 18:07:19 +0100
Bernhard Beschow <shentey@gmail.com> wrote:

> The first thing ich9_pm_iospace_update() does is to set pm->pm_io_base to
> the pm_io_base parameter.
try to explain why 'pm->pm_io_base = 0' was there , what's changed 
and then why it's no longer needed.

> The pm_io_base parameter's value is the old
> one of pm->pm_io_base.
I can't parse this sentence.


fixes: cacaab8bdd7460

> 
> Signed-off-by: Bernhard Beschow <shentey@gmail.com>
> ---
>  hw/acpi/ich9.c | 4 +---
>  1 file changed, 1 insertion(+), 3 deletions(-)
> 
> diff --git a/hw/acpi/ich9.c b/hw/acpi/ich9.c
> index 2050af67b9..0313e71e74 100644
> --- a/hw/acpi/ich9.c
> +++ b/hw/acpi/ich9.c
> @@ -136,9 +136,7 @@ void ich9_pm_iospace_update(ICH9LPCPMRegs *pm, uint32_t pm_io_base)
>  static int ich9_pm_post_load(void *opaque, int version_id)
>  {
>      ICH9LPCPMRegs *pm = opaque;
> -    uint32_t pm_io_base = pm->pm_io_base;
> -    pm->pm_io_base = 0;
> -    ich9_pm_iospace_update(pm, pm_io_base);
> +    ich9_pm_iospace_update(pm, pm->pm_io_base);
>      return 0;
>  }
>  


