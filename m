Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id EBBAA667139
	for <lists+qemu-devel@lfdr.de>; Thu, 12 Jan 2023 12:49:28 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pFw4W-0007ty-Jx; Thu, 12 Jan 2023 06:48:40 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1pFw4U-0007tU-UV
 for qemu-devel@nongnu.org; Thu, 12 Jan 2023 06:48:38 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1pFw4T-00007G-8m
 for qemu-devel@nongnu.org; Thu, 12 Jan 2023 06:48:38 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1673524116;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=95wirmsHPNLLbdZPpOsP86iH4u3HKnqBlT4iNwBlJFg=;
 b=JrySaZOoQ0p8Hp8YQqyVDhM3xJzQoP3U4SqBUJi+X5OqNl6LLZIYihe7Lcuvwey2KTe1aa
 mK53It9XkykME5F29dg15L/w6cXh58EUMA0NW9uSdhznmhJay61eAjzVkDJ4BXDAaf43eX
 ANElwNtbwVPsyJWZan2sWKtSyMeeAjw=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-596-l5C06L2cNpGSChkHbYXsOg-1; Thu, 12 Jan 2023 06:48:34 -0500
X-MC-Unique: l5C06L2cNpGSChkHbYXsOg-1
Received: by mail-wr1-f69.google.com with SMTP id
 n13-20020adfc60d000000b0029bdfcf52eeso3388355wrg.8
 for <qemu-devel@nongnu.org>; Thu, 12 Jan 2023 03:48:34 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=95wirmsHPNLLbdZPpOsP86iH4u3HKnqBlT4iNwBlJFg=;
 b=r9tFQCLtciW0/lJSemjQMNIc92ORacE8AGGF6GiK7CeGbmJBMvXBRUIz13JiuGuf7Z
 1dxrjNfkh+D+YRYA2cxC3dEAszZsSw+u/p1gE3H2Pg4cufPfKzWZwfEtGU5yN/WRFapl
 JOdV3LTJKqQMr6AFIRmJRkD4HKMw2E20e6C2NcE/W57y79F42hVkQouPZ8oUTrWX642V
 iDIU2mTa4JKmnFYBjmBE9Jc3FFQdsfeT2e7BqbBudAi6xhPsAax3ntgNTgv4npm8H7V7
 LXpuT2r8JshLzB+e3gD5YmFwj6Fm7scT5nVc4rzHgGnJMD6QzV3ZZTG6itfy7+r1PoNv
 lEpA==
X-Gm-Message-State: AFqh2kqsl2FvYZR5heDcFLZcNsET1PazTZqwT7ipsrBgcd/lxIl3UO4P
 hMNKgq/F2i3gMs4y7KThgy5TLTstn8ulYQ4C8AUjcrWACOa7I4UlxNbUlDppOzlbD/fiT3KSRW0
 qXEToVQmhF9S00R4=
X-Received: by 2002:adf:f54d:0:b0:2bd:d85f:55cc with SMTP id
 j13-20020adff54d000000b002bdd85f55ccmr701174wrp.21.1673524113799; 
 Thu, 12 Jan 2023 03:48:33 -0800 (PST)
X-Google-Smtp-Source: AMrXdXvhTydT0YQCeqNRn5lCauk6pIfwvuPGowd6nXpLB1XwLEKM3f34e1P9ULgoySauUSE9CxhU7w==
X-Received: by 2002:adf:f54d:0:b0:2bd:d85f:55cc with SMTP id
 j13-20020adff54d000000b002bdd85f55ccmr701143wrp.21.1673524113406; 
 Thu, 12 Jan 2023 03:48:33 -0800 (PST)
Received: from [192.168.0.2] (ip-109-43-177-128.web.vodafone.de.
 [109.43.177.128]) by smtp.gmail.com with ESMTPSA id
 y7-20020a7bcd87000000b003d997e5e679sm24380280wmj.14.2023.01.12.03.48.31
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 12 Jan 2023 03:48:32 -0800 (PST)
Message-ID: <114b34b1-303b-154b-6ac1-91e1718de49b@redhat.com>
Date: Thu, 12 Jan 2023 12:48:30 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.13.0
Subject: Re: [PATCH v14 09/11] qapi/s390/cpu topology: monitor query topology
 information
Content-Language: en-US
To: Pierre Morel <pmorel@linux.ibm.com>, qemu-s390x@nongnu.org
Cc: qemu-devel@nongnu.org, borntraeger@de.ibm.com, pasic@linux.ibm.com,
 richard.henderson@linaro.org, david@redhat.com, cohuck@redhat.com,
 mst@redhat.com, pbonzini@redhat.com, kvm@vger.kernel.org,
 ehabkost@redhat.com, marcel.apfelbaum@gmail.com, eblake@redhat.com,
 armbru@redhat.com, seiden@linux.ibm.com, nrb@linux.ibm.com,
 scgl@linux.ibm.com, frankja@linux.ibm.com, berrange@redhat.com, clg@kaod.org
References: <20230105145313.168489-1-pmorel@linux.ibm.com>
 <20230105145313.168489-10-pmorel@linux.ibm.com>
From: Thomas Huth <thuth@redhat.com>
In-Reply-To: <20230105145313.168489-10-pmorel@linux.ibm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

On 05/01/2023 15.53, Pierre Morel wrote:
> Reporting the current topology informations to the admin through
> the QEMU monitor.
> 
> Signed-off-by: Pierre Morel <pmorel@linux.ibm.com>
> ---
...
> diff --git a/hmp-commands-info.hx b/hmp-commands-info.hx
> index 754b1e8408..5730a47f71 100644
> --- a/hmp-commands-info.hx
> +++ b/hmp-commands-info.hx
> @@ -993,3 +993,19 @@ SRST
>     ``info virtio-queue-element`` *path* *queue* [*index*]
>       Display element of a given virtio queue
>   ERST
> +
> +#if defined(TARGET_S390X) && defined(CONFIG_KVM)
> +    {
> +        .name       = "query-topology",
> +        .args_type  = "",
> +        .params     = "",
> +        .help       = "Show information about CPU topology",
> +        .cmd        = hmp_query_topology,
> +        .flags      = "p",
> +    },
> +
> +SRST
> +  ``info query-topology``

"info query-topology" sounds weird ... I'd maybe rather call it only "info 
topology" or "info cpu-topology" here.

  Thomas


> +    Show information about CPU topology
> +ERST
> +#endif


