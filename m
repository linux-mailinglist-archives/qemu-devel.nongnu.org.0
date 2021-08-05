Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3DB6C3E0F8B
	for <lists+qemu-devel@lfdr.de>; Thu,  5 Aug 2021 09:49:22 +0200 (CEST)
Received: from localhost ([::1]:44610 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mBY81-0003gd-3r
	for lists+qemu-devel@lfdr.de; Thu, 05 Aug 2021 03:49:21 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54094)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lvivier@redhat.com>)
 id 1mBY6t-0002nI-TI
 for qemu-devel@nongnu.org; Thu, 05 Aug 2021 03:48:11 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:33240)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lvivier@redhat.com>)
 id 1mBY6r-00021I-8A
 for qemu-devel@nongnu.org; Thu, 05 Aug 2021 03:48:11 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1628149688;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=lFht66WOFY/jY/62rFAqiGogWR38Kk/sII1jpsA7q9I=;
 b=PPw7+95qlFwfc/uq4O+NJsRTiUgFWA0ZXfaRiyYsaaHLVzyBjYfWKUNNyjykB8WOVP8/jC
 aKsVG5LSFZnZZmjz+AgMU/UXoP6eIR2tsG9WRvcZ7z3IurcZKKP+yLaxNMF8jgQBSZR3b7
 4xdUy7tHrg3WhpeRNPxxIxUukIx+/Lo=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-210-t2k7rFc3M_Gy_zI3Mw50BA-1; Thu, 05 Aug 2021 03:48:07 -0400
X-MC-Unique: t2k7rFc3M_Gy_zI3Mw50BA-1
Received: by mail-wm1-f69.google.com with SMTP id
 f20-20020a1c6a140000b029025b066428ebso1340365wmc.5
 for <qemu-devel@nongnu.org>; Thu, 05 Aug 2021 00:48:06 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=lFht66WOFY/jY/62rFAqiGogWR38Kk/sII1jpsA7q9I=;
 b=owyIH6S3gkYWtyPtGeEtjqw6WngocE4ZM4Tb7FUo+6/G1098jg00MM1laHvdJg0XWl
 SnYttzUpVIuVMC7hCa0/stqezlSTIDrGpzZC885DH0YDwsFW5QOs6wc28hKX9K66vvwx
 oz4pvqmLn+dfE49+/3A9pxjx8+TPY9BWC0KpIGLx9z4ACJfAJjLNMySG+K+dw3EwKtyI
 kbDtwEEQSrHTKs3gcnEUrFpxYK3oLDEw8Lh9jYJMmc4Ld011Y4vAJmBe000LCf4+R2dS
 28rtHsINsvluoKllOzUUeeOQE8pLVYQH2kln+RFuGP0gs4/h3wUUHZ6JbmHf0xvUJUtI
 hlIw==
X-Gm-Message-State: AOAM531ejwMb00NJxaqVmpL8bupACmIU0zIqloftoc6W9BnJRwwS+mzu
 pNKQBExTt5l6DgceWwSxmPPKFjFa3ONx7dmy+dro6NvDcRSA4Emq3pcw3870k+Gda/mUE/oKe0g
 BN7ApaSnKtLDECB4=
X-Received: by 2002:a1c:f30a:: with SMTP id q10mr3552440wmq.138.1628149685952; 
 Thu, 05 Aug 2021 00:48:05 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzGrmRuxpMEpvD5Vi/IE7+2Lj/gDb+S2364+/K0SOGTPXe9IQFdRCgcgFTnGrP+Vg2ZufcqWw==
X-Received: by 2002:a1c:f30a:: with SMTP id q10mr3552425wmq.138.1628149685774; 
 Thu, 05 Aug 2021 00:48:05 -0700 (PDT)
Received: from [192.168.100.42] ([82.142.21.182])
 by smtp.gmail.com with ESMTPSA id k6sm5031408wrm.10.2021.08.05.00.48.04
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 05 Aug 2021 00:48:05 -0700 (PDT)
Subject: Re: [RFC PATCH v0 2/2] ppc,spapr: Handle KVM_EXIT_ESN
To: Bharata B Rao <bharata@linux.ibm.com>, qemu-devel@nongnu.org
References: <20210805073228.502292-1-bharata@linux.ibm.com>
 <20210805073228.502292-3-bharata@linux.ibm.com>
From: Laurent Vivier <lvivier@redhat.com>
Message-ID: <a7703577-9c69-cab7-6919-93c95d474a0f@redhat.com>
Date: Thu, 5 Aug 2021 09:48:04 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20210805073228.502292-3-bharata@linux.ibm.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=lvivier@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=lvivier@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -35
X-Spam_score: -3.6
X-Spam_bar: ---
X-Spam_report: (-3.6 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.699,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.132, RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: aneesh.kumar@linux.ibm.com, qemu-ppc@nongnu.org,
 david@gibson.dropbear.id.au
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 05/08/2021 09:32, Bharata B Rao wrote:
> Handle KVM_EXIT_ESN exit by issuing subvention notification
> interrupt to the guest. Guests supporting async-pf feature
> will need this interrupt to wake up tasks that are waiting
> for the expropriated pages to be available.
> 
> Note: Updates to linux-headers/linux/kvm.h are temporary
> pending headers update.
> 
> Signed-off-by: Bharata B Rao <bharata@linux.ibm.com>
> ---
>  linux-headers/linux/kvm.h |  1 +
>  target/ppc/kvm.c          | 16 ++++++++++++++++
>  2 files changed, 17 insertions(+)
...
> diff --git a/target/ppc/kvm.c b/target/ppc/kvm.c
> index 330985c8a0..6bf3f06b88 100644
> --- a/target/ppc/kvm.c
> +++ b/target/ppc/kvm.c
...
> @@ -1657,6 +1658,16 @@ static int kvm_handle_debug(PowerPCCPU *cpu, struct kvm_run *run)
>      return DEBUG_RETURN_GUEST;
>  }
>  
> +#if defined(TARGET_PPC64)
> +static void kvmppc_handle_esn(PowerPCCPU *cpu)
> +{
> +    SpaprMachineState *spapr = SPAPR_MACHINE(qdev_get_machine());
> +
> +    fprintf(stderr, "%s: ESN exit\n", __func__);

Do you keep this fprintf() on purpose?
You should use trace framework to add debugging traces.

Thanks,
Laurent


