Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6521758ACE4
	for <lists+qemu-devel@lfdr.de>; Fri,  5 Aug 2022 17:02:36 +0200 (CEST)
Received: from localhost ([::1]:58884 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oJyqR-0003QC-B0
	for lists+qemu-devel@lfdr.de; Fri, 05 Aug 2022 11:02:35 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53034)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1oJyln-0007P4-L0
 for qemu-devel@nongnu.org; Fri, 05 Aug 2022 10:57:47 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:41585)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1oJylm-0003p0-0x
 for qemu-devel@nongnu.org; Fri, 05 Aug 2022 10:57:47 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1659711465;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=zG9XHezuh5qJ9I2MGQdSbAraxqR2na0biWasDmYcpcQ=;
 b=RRo3xdd4Q5SjI/HfPuNxnFzVH7X3poiR7J08GoFAORf/aYWK4nUghRdaSfz3BD/b/R+5oZ
 GPRWn1P33Bo/eGlYnoW8YPeMfg+4uV290GZRVUDf7T0lSFK40KPAO25/i6i9IIeF7Uctfg
 dOg56jkJ/w4Y6oxb0AqwAM4u8CFLZPg=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-225-Y4VXlXU3NVqM8xfuULadvw-1; Fri, 05 Aug 2022 10:57:44 -0400
X-MC-Unique: Y4VXlXU3NVqM8xfuULadvw-1
Received: by mail-wm1-f69.google.com with SMTP id
 n1-20020a7bcbc1000000b003a4e8c818f5so546672wmi.6
 for <qemu-devel@nongnu.org>; Fri, 05 Aug 2022 07:57:44 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc;
 bh=zG9XHezuh5qJ9I2MGQdSbAraxqR2na0biWasDmYcpcQ=;
 b=HHVXfnsRopjL8p8XM1Y/iPvTu5j75xidVMT9bBrUGDUlkuDA5MxyX9Fhz4hmss7X+P
 izdtSzRU5RLmgXcUeFF+rXcBrmV4aoa0MkhA1/b7PDDMkTkgnIN/JU1sAOE4p33SqGYv
 dVtT/g6uxZUZ11kHiLXxjvUsE1D82e4ZReZ6uNs9pKsBbdac6f30YsF3ZxJDlp0ziI46
 HKgaMc0iBRdFVrwR9sC6Sl1hVhQwedhDQ4mXtIO7pNtqdmil/jTE3AF0qdGY9kioGejr
 SJinx5y4zgdBy7BZxdF3lrAc+II1IlTHYvu2UgJygSmq9RlYPYmrwikeYQ+K2ytIwP7W
 1SCA==
X-Gm-Message-State: ACgBeo02Ny1F9Hp7MQ7OSXR16QlPosZXtx2ZBotLkTl6u6UERLFGevYg
 o44WT5wfBraXIbjg7EzMC8yS9T2F1qRUaqOjXJRXLshrfIeQhPJWuG/LbccE88uKKuDLjqjXcu5
 J6HmyJW6RbacbF4E=
X-Received: by 2002:a5d:434e:0:b0:21e:9970:fab with SMTP id
 u14-20020a5d434e000000b0021e99700fabmr4317302wrr.127.1659711463141; 
 Fri, 05 Aug 2022 07:57:43 -0700 (PDT)
X-Google-Smtp-Source: AA6agR51V6fr2AccbydkIt/MtKzQFiJwaf8UTK44hTCPY7gr9hSAmS1K26fv72Q0TfOl77L16yKAXQ==
X-Received: by 2002:a5d:434e:0:b0:21e:9970:fab with SMTP id
 u14-20020a5d434e000000b0021e99700fabmr4317293wrr.127.1659711462882; 
 Fri, 05 Aug 2022 07:57:42 -0700 (PDT)
Received: from [192.168.0.5] (ip-109-42-113-85.web.vodafone.de.
 [109.42.113.85]) by smtp.gmail.com with ESMTPSA id
 t17-20020adff051000000b002217e3f41f1sm135682wro.106.2022.08.05.07.57.41
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 05 Aug 2022 07:57:42 -0700 (PDT)
Message-ID: <3ae22c8f-34d1-0b3c-c007-d3ce7f9ccb21@redhat.com>
Date: Fri, 5 Aug 2022 16:57:40 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.12.0
Subject: Re: [PATCH] vmxnet3: add stub for encapsulation offload
Content-Language: en-US
To: Alexander Bulekov <alxndr@bu.edu>, qemu-devel@nongnu.org,
 Jason Wang <jasowang@redhat.com>
Cc: Dmitry Fleytman <dmitry.fleytman@gmail.com>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
References: <20210806222300.417126-1-alxndr@bu.edu>
From: Thomas Huth <thuth@redhat.com>
In-Reply-To: <20210806222300.417126-1-alxndr@bu.edu>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 07/08/2021 00.23, Alexander Bulekov wrote:
> Encapsulation offload (offload mode 1) is a valid mode present in the
> kernel that isn't implemented in QEMU, yet.
> 
> https://lore.kernel.org/lkml/20200528015426.8285-4-doshir@vmware.com/
> 
> Add a stub for this mode, to avoid the guest-triggerable assertion.
> 
> Resolves: https://gitlab.com/qemu-project/qemu/-/issues/517
> Signed-off-by: Alexander Bulekov <alxndr@bu.edu>
> ---
>   hw/net/vmxnet3.c | 5 +++++
>   hw/net/vmxnet3.h | 1 +
>   2 files changed, 6 insertions(+)
> 
> diff --git a/hw/net/vmxnet3.c b/hw/net/vmxnet3.c
> index 41f796a247..62e11d0e3e 100644
> --- a/hw/net/vmxnet3.c
> +++ b/hw/net/vmxnet3.c
> @@ -443,6 +443,11 @@ vmxnet3_setup_tx_offloads(VMXNET3State *s)
>           net_tx_pkt_build_vheader(s->tx_pkt, false, false, 0);
>           break;
>   
> +    case VMXNET3_OM_ENCAP:
> +        VMW_PKPRN("Encapsulation offload requested, but not available\n");
> +        return false;
> +        break;

I think I'd also remove the break, anyway:

Reviewed-by: Thomas Huth <thuth@redhat.com>

Jason, could you maybe also pick this up for QEMU 7.1, so we can close issue 
517 ?

>       case VMXNET3_OM_CSUM:
>           net_tx_pkt_build_vheader(s->tx_pkt, false, true, 0);
>           VMW_PKPRN("L4 CSO requested\n");
> diff --git a/hw/net/vmxnet3.h b/hw/net/vmxnet3.h
> index 5b3b76ba7a..36a17b82aa 100644
> --- a/hw/net/vmxnet3.h
> +++ b/hw/net/vmxnet3.h
> @@ -273,6 +273,7 @@ struct Vmxnet3_TxDesc {
>   
>   /* TxDesc.OM values */
>   #define VMXNET3_OM_NONE        0
> +#define VMXNET3_OM_ENCAP       1
>   #define VMXNET3_OM_CSUM        2
>   #define VMXNET3_OM_TSO        3
>   


