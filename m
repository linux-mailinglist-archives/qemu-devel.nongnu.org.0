Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9D7D464877E
	for <lists+qemu-devel@lfdr.de>; Fri,  9 Dec 2022 18:15:12 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p3gx7-0008En-Ke; Fri, 09 Dec 2022 12:14:25 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1p3gx5-0008EY-B6
 for qemu-devel@nongnu.org; Fri, 09 Dec 2022 12:14:23 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1p3gx3-0002hN-Ke
 for qemu-devel@nongnu.org; Fri, 09 Dec 2022 12:14:23 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1670606060;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=v9QGmmNcNt41ydqw72zNA9fV2hjBx+F4l0STuoyXRr8=;
 b=X5YOMu5gV+d4mP9GGgHIEvPPRbusOD8xKgssRtkqOWzPu9b6j6k695jE+T8FFllEPF+924
 e5HqkU4O3TMTtdy21n7tw2vsOBBdajtWWbPox6I6UWakXNMmDYhRe82asgqnRAfocFEguJ
 8M/XXqpNo02/3YiTDnrzAfQ0r3tIrVE=
Received: from mail-ed1-f72.google.com (mail-ed1-f72.google.com
 [209.85.208.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-53-rI0usKBbMdaWi2sjxwFpVQ-1; Fri, 09 Dec 2022 12:14:18 -0500
X-MC-Unique: rI0usKBbMdaWi2sjxwFpVQ-1
Received: by mail-ed1-f72.google.com with SMTP id
 q13-20020a056402518d00b00462b0599644so1758831edd.20
 for <qemu-devel@nongnu.org>; Fri, 09 Dec 2022 09:14:18 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=v9QGmmNcNt41ydqw72zNA9fV2hjBx+F4l0STuoyXRr8=;
 b=uuO4kbl9Fd8bKrFJrMslkE26SeYxRNDa3+cXQN+5Q7zIxo9xGC1a1wK/fbWhP0apHG
 YXWphMWS/gSLVrsLgc9eZhfGwLIgpHHBO1R0J0JnP8niqzJppfYMPGOq+U9smzGJwo6V
 NKwa27feWNp5lgI22SsbQY9ErBZjHxdkJCWLCsKmfPk5joybodkJOmN+UF1qvFpSFx5R
 zRvU8H4f+P7Wv8xCZonk42FoyKrQ4j8Leov/Wm3f4timpCLFrFdpMQHMRcw62KJNudPh
 q8bFo9gbPs3oXDJKs/nGXmfBUyfH1XiRfk32qY6tYg6Xnvw3CkbluHV2DCiUgjVbZFkW
 BeVw==
X-Gm-Message-State: ANoB5pliZ3VVCRLQizYZXcsUB9Ij3ZgjL5uhAxD0BreG0zjX0XMf5p2p
 kQ7f44ZFisoIRv/9SOavgNlUvhBO57zptyK+8hN+tFwKxy3YJ7lej5ob9G7+FB01+Un95RZKvwD
 qSNjRh752vB42BBY=
X-Received: by 2002:a17:907:629c:b0:7c0:bf26:2cf with SMTP id
 nd28-20020a170907629c00b007c0bf2602cfmr8423822ejc.49.1670606057168; 
 Fri, 09 Dec 2022 09:14:17 -0800 (PST)
X-Google-Smtp-Source: AA0mqf4nOJutlh9wRUlqqVCto6gKREalxp4i7h9DFXlddXkzd5kkpyAzLRZ4c5SgTSzJLzTmkA+ExA==
X-Received: by 2002:a17:907:629c:b0:7c0:bf26:2cf with SMTP id
 nd28-20020a170907629c00b007c0bf2602cfmr8423806ejc.49.1670606056955; 
 Fri, 09 Dec 2022 09:14:16 -0800 (PST)
Received: from [192.168.8.102] (tmo-086-144.customers.d1-online.com.
 [80.187.86.144]) by smtp.gmail.com with ESMTPSA id
 e13-20020a1709062c0d00b007c0d0dad9c6sm131814ejh.108.2022.12.09.09.14.15
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 09 Dec 2022 09:14:16 -0800 (PST)
Message-ID: <9ce14b12-b993-58bc-bc63-d189b83692f0@redhat.com>
Date: Fri, 9 Dec 2022 18:14:14 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.13.0
Subject: Re: [PATCH-for-8.0 3/3] hw/tpm: Move tpm_ppc.c out of target-specific
 source set
Content-Language: en-US
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>,
 qemu-devel@nongnu.org
Cc: Stefan Berger <stefanb@linux.vnet.ibm.com>
References: <20221209170042.71169-1-philmd@linaro.org>
 <20221209170042.71169-4-philmd@linaro.org>
From: Thomas Huth <thuth@redhat.com>
In-Reply-To: <20221209170042.71169-4-philmd@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -23
X-Spam_score: -2.4
X-Spam_bar: --
X-Spam_report: (-2.4 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.288, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001,
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

On 09/12/2022 18.00, Philippe Mathieu-Daudé wrote:
> The TPM Physical Presence Interface is not target specific.
> Build this file once for all targets.
> 
> Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
> ---
>   hw/tpm/meson.build | 4 ++--
>   1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/hw/tpm/meson.build b/hw/tpm/meson.build
> index 1c68d81d6a..3eacbe8c5d 100644
> --- a/hw/tpm/meson.build
> +++ b/hw/tpm/meson.build
> @@ -3,6 +3,6 @@ softmmu_ss.add(when: 'CONFIG_TPM_TIS_ISA', if_true: files('tpm_tis_isa.c'))
>   softmmu_ss.add(when: 'CONFIG_TPM_TIS_SYSBUS', if_true: files('tpm_tis_sysbus.c'))
>   softmmu_ss.add(when: 'CONFIG_TPM_CRB', if_true: files('tpm_crb.c'))
>   
> -specific_ss.add(when: ['CONFIG_SOFTMMU', 'CONFIG_TPM_TIS'], if_true: files('tpm_ppi.c'))
> -specific_ss.add(when: ['CONFIG_SOFTMMU', 'CONFIG_TPM_CRB'], if_true: files('tpm_ppi.c'))
> +softmmu_ss.add(when: ['CONFIG_SOFTMMU', 'CONFIG_TPM_TIS'], if_true: files('tpm_ppi.c'))
> +softmmu_ss.add(when: ['CONFIG_SOFTMMU', 'CONFIG_TPM_CRB'], if_true: files('tpm_ppi.c'))
>   specific_ss.add(when: 'CONFIG_TPM_SPAPR', if_true: files('tpm_spapr.c'))

Typo in the subject: ppc ==> ppi

Then, while you're at it: Why is it checking the CONFIG_SOFTMMU switch here, 
too? I fail to see why this is necessary here, we never check this for other 
files that we put into specific_ss or softmmu_ss.

  Thomas


