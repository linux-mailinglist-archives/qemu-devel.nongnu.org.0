Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C44D24B9C43
	for <lists+qemu-devel@lfdr.de>; Thu, 17 Feb 2022 10:42:28 +0100 (CET)
Received: from localhost ([::1]:59878 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nKdIx-0004Lm-Fl
	for lists+qemu-devel@lfdr.de; Thu, 17 Feb 2022 04:42:27 -0500
Received: from eggs.gnu.org ([209.51.188.92]:57916)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imammedo@redhat.com>)
 id 1nKco9-0003Yl-Db
 for qemu-devel@nongnu.org; Thu, 17 Feb 2022 04:10:37 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:53095)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imammedo@redhat.com>)
 id 1nKco5-0007xz-3p
 for qemu-devel@nongnu.org; Thu, 17 Feb 2022 04:10:36 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1645089029;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=tsSfdSw2Ks433q23+5Q3VH5jFp5AOH0XIWxAdpoZX0Q=;
 b=SM/nQpqbCOdWIIoLhMpzwsO63m2exxyEMOtUuNvRty8L7lsy9mv5mEZfIWVNxi2N7v25WD
 i3PoLGhZ5r3ksOmfHqKtWPZN1+C5bz/T0iNv/eaXyJAtOOMGdch+inTmQb1tAE42qIu3Qe
 aogr9Q/RcftTiM4EycOhutZUhMh08vA=
Received: from mail-ej1-f72.google.com (mail-ej1-f72.google.com
 [209.85.218.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-644-uIYQHZEfOQ60DAs1heGnew-1; Thu, 17 Feb 2022 04:10:27 -0500
X-MC-Unique: uIYQHZEfOQ60DAs1heGnew-1
Received: by mail-ej1-f72.google.com with SMTP id
 m12-20020a1709062acc00b006cfc98179e2so1220300eje.6
 for <qemu-devel@nongnu.org>; Thu, 17 Feb 2022 01:10:27 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=tsSfdSw2Ks433q23+5Q3VH5jFp5AOH0XIWxAdpoZX0Q=;
 b=PjIWFWo1x5Ynyw25Rt3yNc0LaDnHh4Ynaci9osCf/MTkU7Sb3sYbETJsVHR/cp8d8R
 3rt+/jLxEq1MIpcaUHN+d4Apu1eFMtpiuNP0BauhGgkwJQzlfgiBSWH3dufjwnogtP+f
 MEGrKhZeFc1nbKhwcXUF6vFcNeIVM0fuXQ5TOVRkHhmDFIFLNMlo9jYbn6lt2YaalMF3
 QIp7SA30wys7Lxr83imLAR8NormvmlE/gLkxn0tuPtpHZN+vikf7Dd/hvoNVCHJs3RAG
 BQoPjfFAwojuoXq2M7BblvHV+zwGmW5B0uxao/JDUQJz36fxvOtI8UWnv3Ll9agv0Lrl
 l+xQ==
X-Gm-Message-State: AOAM530V5FxHDTZu8EmH1vdsARyDXOqbwRoOsbQ2xEGcFOeAXQGNIi48
 fvSTMwL3r7n5xRJzCac9nLn3MEuJIzpWF72cRo2uqyH3lzMT4DEV5yVxw4vmOe9j94EESy1RXdh
 xwzkzRimJgP63qvI=
X-Received: by 2002:a17:906:2991:b0:6cc:fc18:f10c with SMTP id
 x17-20020a170906299100b006ccfc18f10cmr1557639eje.744.1645089026485; 
 Thu, 17 Feb 2022 01:10:26 -0800 (PST)
X-Google-Smtp-Source: ABdhPJwcyvrwXroplsrAJzvlrpunxjQwONMo6M//PTcy1aeh9/94a7FyZxWbM10rcjbFk4sdIFyTAg==
X-Received: by 2002:a17:906:2991:b0:6cc:fc18:f10c with SMTP id
 x17-20020a170906299100b006ccfc18f10cmr1557617eje.744.1645089026190; 
 Thu, 17 Feb 2022 01:10:26 -0800 (PST)
Received: from localhost (nat-pool-brq-t.redhat.com. [213.175.37.10])
 by smtp.gmail.com with ESMTPSA id j21sm947735ejj.193.2022.02.17.01.10.25
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 17 Feb 2022 01:10:25 -0800 (PST)
Date: Thu, 17 Feb 2022 10:10:24 +0100
From: Igor Mammedov <imammedo@redhat.com>
To: Li Zhang <lizhang@suse.de>
Subject: Re: [PATCH 1/1] numa: check mem or memdev in numa configuration
Message-ID: <20220217101024.7c723f10@redhat.com>
In-Reply-To: <20220216163613.22570-1-lizhang@suse.de>
References: <20220216163613.22570-1-lizhang@suse.de>
X-Mailer: Claws Mail 4.0.0 (GTK+ 3.24.31; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=imammedo@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=imammedo@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.083,
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
Cc: eduardo@habkost.net, wangyanan55@huawei.com, f4bug@amsat.org,
 qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Wed, 16 Feb 2022 17:36:13 +0100
Li Zhang <lizhang@suse.de> wrote:

> If there is no mem or memdev in numa configuration, it always
> reports the error as the following:
> 
> total memory for NUMA nodes (0x0) should equal RAM size (0x100000000)
> 
> This error is confusing and the reason is that total memory of numa nodes
> is always 0 if there is no mem or memdev in numa configuration.
> So it's better to check mem or memdev in numa configuration.
> 
> Signed-off-by: Li Zhang <lizhang@suse.de>
> ---
>  hw/core/numa.c | 5 +++++
>  1 file changed, 5 insertions(+)
> 
> diff --git a/hw/core/numa.c b/hw/core/numa.c
> index 1aa05dcf42..11cbec51eb 100644
> --- a/hw/core/numa.c
> +++ b/hw/core/numa.c
> @@ -132,6 +132,11 @@ static void parse_numa_node(MachineState *ms, NumaNodeOptions *node,
>  
>      have_memdevs = have_memdevs ? : node->has_memdev;
>      have_mem = have_mem ? : node->has_mem;
> +    if (!node->has_memdev && !node->has_mem) {
> +        error_setg(errp, "numa configuration should use mem= or memdev= ");
> +        return;
> +    }

Wouldn't this breaks memory less numa nodes?

I'd rather add/rephrase to original error message that memory
should be specified explicitly for desired numa nodes.
And I'd not mention 'mem=' since
  docs/about/removed-features.rst:``-numa node,mem=...`` (removed in 5.1)

> +
>      if ((node->has_mem && have_memdevs) || (node->has_memdev && have_mem)) {
>          error_setg(errp, "numa configuration should use either mem= or memdev=,"
>                     "mixing both is not allowed");


