Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6C1914C0EDA
	for <lists+qemu-devel@lfdr.de>; Wed, 23 Feb 2022 10:09:12 +0100 (CET)
Received: from localhost ([::1]:55282 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nMne3-0001ka-32
	for lists+qemu-devel@lfdr.de; Wed, 23 Feb 2022 04:09:11 -0500
Received: from eggs.gnu.org ([209.51.188.92]:47484)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imammedo@redhat.com>)
 id 1nMnZL-0000T6-Pu
 for qemu-devel@nongnu.org; Wed, 23 Feb 2022 04:04:22 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:46297)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imammedo@redhat.com>)
 id 1nMnZI-0001Rw-6w
 for qemu-devel@nongnu.org; Wed, 23 Feb 2022 04:04:18 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1645607054;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=R1nPOxFN5FGxPc1eLIAJZkrmxPD5vvoDgyWptgSsFw8=;
 b=YAvi5Sae09371mYR6W2Z3WSSBJMzg08N/AeelEnIikH/+5bjYYwEEbsTHrrsB/NUpFjHHS
 XX9PJ9KsZpVysQqAo/eAD0BD0eflR7CUTpehAbB1AdELblH+z06cOw+h/GzW/ozrDEVlos
 5W9HtVbrI9f2CF8veEJqEmfP5q+xr1o=
Received: from mail-ed1-f70.google.com (mail-ed1-f70.google.com
 [209.85.208.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-646-uEvzQ_alO4KySS0h67d2sA-1; Wed, 23 Feb 2022 04:04:13 -0500
X-MC-Unique: uEvzQ_alO4KySS0h67d2sA-1
Received: by mail-ed1-f70.google.com with SMTP id
 f9-20020a0564021e8900b00412d0a6ef0dso8300486edf.11
 for <qemu-devel@nongnu.org>; Wed, 23 Feb 2022 01:04:13 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=R1nPOxFN5FGxPc1eLIAJZkrmxPD5vvoDgyWptgSsFw8=;
 b=EKKcvrn6gLzacraGC9LnsNtRTYiV1NXrZ9H0lhDlgqJr5+vw5X0TeLUbCKXJHat2Iz
 FMv0w4t457w9Cu0drxqOlEp/X4uHqwX9WlyOBTfs0+19fvgd51JBn0uiN1e2i+LPN37h
 3en+mcehUN8VAb1bRAdHHM0UJcdmY8Wy4fufoablfNtxZfHjDlBQuY36pFOf7U6NlSLg
 gnMkP7JUAKCNyAhi5NFChzHTFrncBVA3UD6fKJfNPFzZg8gxxbAQWKr7SnkXYCPs85JG
 BiHNYO+25nDjOo7mFYW4SfOdeZohzI6NYMyDiR4LzepaSg70F5pzNEEJS/upvlLHafRq
 NTyg==
X-Gm-Message-State: AOAM5303F4oIy+fD5mPcRNIH3rOmZ7f1a8SwzYcJHAUuOVLvGJvoXKyN
 WvRxxDfMorGMO/IJIV2eLFfXE+4o+WZUBGi1VMQqqQQvm0tjBQBZkIwndZyOTccNcLd7KwqMAvJ
 zzNFRjdJwvR+5/bk=
X-Received: by 2002:a17:907:2358:b0:6ce:98a4:5ee5 with SMTP id
 we24-20020a170907235800b006ce98a45ee5mr22649491ejb.464.1645607052441; 
 Wed, 23 Feb 2022 01:04:12 -0800 (PST)
X-Google-Smtp-Source: ABdhPJxekAJQQvZr4/6/yi1M8gK9Wo2TL9uJFEKt6qKa4gdW5uCD/Fjc+V2QxfN3Sn3ncDuopYUSVQ==
X-Received: by 2002:a17:907:2358:b0:6ce:98a4:5ee5 with SMTP id
 we24-20020a170907235800b006ce98a45ee5mr22649464ejb.464.1645607052222; 
 Wed, 23 Feb 2022 01:04:12 -0800 (PST)
Received: from localhost (nat-pool-brq-t.redhat.com. [213.175.37.10])
 by smtp.gmail.com with ESMTPSA id s15sm636122ejm.70.2022.02.23.01.04.10
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 23 Feb 2022 01:04:11 -0800 (PST)
Date: Wed, 23 Feb 2022 10:04:10 +0100
From: Igor Mammedov <imammedo@redhat.com>
To: Ani Sinha <ani@anisinha.ca>
Subject: Re: [PATCH] hw/i386/pc: when adding reserved E820 entries do not
 allocate dynamic entries
Message-ID: <20220223100410.756ffe35@redhat.com>
In-Reply-To: <20220210132822.2969324-1-ani@anisinha.ca>
References: <20220210132822.2969324-1-ani@anisinha.ca>
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
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H5=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: Eduardo Habkost <eduardo@habkost.net>,
 "Michael S. Tsirkin" <mst@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org,
 kraxel@redhat.com, Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Thu, 10 Feb 2022 18:58:21 +0530
Ani Sinha <ani@anisinha.ca> wrote:

> When adding E820_RESERVED entries we also accidentally allocate dynamic
> entries. This is incorrect. We should simply return early with the count of
> the number of reserved entries added.

can you expand commit message to explain what's wrong and
how problem manifests ... etc.

> 
> fixes: 7d67110f2d9a6("pc: add etc/e820 fw_cfg file")
> cc: kraxel@redhat.com
> Signed-off-by: Ani Sinha <ani@anisinha.ca>
> ---
>  hw/i386/e820_memory_layout.c | 2 ++
>  1 file changed, 2 insertions(+)
> 
> diff --git a/hw/i386/e820_memory_layout.c b/hw/i386/e820_memory_layout.c
> index bcf9eaf837..afb08253a4 100644
> --- a/hw/i386/e820_memory_layout.c
> +++ b/hw/i386/e820_memory_layout.c
> @@ -31,6 +31,8 @@ int e820_add_entry(uint64_t address, uint64_t length, uint32_t type)
>          entry->type = cpu_to_le32(type);
>  
>          e820_reserve.count = cpu_to_le32(index);
> +
> +        return index;
>      }

this changes e820_table size/content, which is added by fw_cfg_add_file() to fwcfg,
as result it breaks ABI in case of migration.
>  
>      /* new "etc/e820" file -- include ram too */


