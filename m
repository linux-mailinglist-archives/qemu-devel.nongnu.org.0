Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 378F72B5B26
	for <lists+qemu-devel@lfdr.de>; Tue, 17 Nov 2020 09:43:43 +0100 (CET)
Received: from localhost ([::1]:56074 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kewaU-0001Tk-AJ
	for lists+qemu-devel@lfdr.de; Tue, 17 Nov 2020 03:43:42 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:35798)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1kewZk-00012S-F3
 for qemu-devel@nongnu.org; Tue, 17 Nov 2020 03:42:56 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:35956)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1kewZg-0001qZ-Qe
 for qemu-devel@nongnu.org; Tue, 17 Nov 2020 03:42:55 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1605602571;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=iRHalrBNWjaDsDsaVbT27JYNrnYtzuxLL3sNAdGJHJY=;
 b=eIgURMoXtkUS3Srgs1MvCb6O7p6MVEMBanpHShKY/ul847ONIvbJk8SpYdasCHLjMM2ZdU
 KqCvLXQxgU7PMHNQ0nqSvCLt0gS/XU4ZvCzWx22t7imiq4/t3eX5kdJiRZsl0yjBUfQ4Oq
 Hr43yo2GIaXZJkJGjErQedM3G4160yQ=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-589-DT4FKjPuO4WWTk19Nj6XoA-1; Tue, 17 Nov 2020 03:42:48 -0500
X-MC-Unique: DT4FKjPuO4WWTk19Nj6XoA-1
Received: by mail-wr1-f72.google.com with SMTP id d8so12651146wrr.10
 for <qemu-devel@nongnu.org>; Tue, 17 Nov 2020 00:42:47 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=iRHalrBNWjaDsDsaVbT27JYNrnYtzuxLL3sNAdGJHJY=;
 b=T/FAEGxM/x/Ihx3iOv/Nrmsk7wtQ8ThaXZ8d4qAI4XzDOPFSmhdGO/KwiUtYS641M9
 Bvtznia+qpdlSPcr8NGqAmuiScAVrCzRMRty/Vb5V/YBvTFcWOLhvx+6jBypNGTj9KZc
 AaVGDhH54r1cdpgT0W46Vv/DUchXTt3ke2C5uTz3pu/rVifMWeFMFC8f+42k8Ax05hJn
 TaGUqcXQUri6b8uMQJuYMxzKMSzEpvEmw7m7hEuoGvi6JbzAsAWwCmmGqzooNKmree2X
 BND6rK2bNrErSG78vzOLoRX2ffGwJgQ8xcwejlT7s/6gbHoinGIP3SrYJivVHoyh5AF9
 0M1g==
X-Gm-Message-State: AOAM531vHtUdaqGpJ8QfLhnqILyTosIPueDabdUWK8O2NnWBGmFjZpxB
 7ZNysSNJmYEtLYBtWLSyy8AU3uRnESgO5Zb3mg+6i9VphFnvNXV3wn3MhLvqLYcgjd+cov/s0Jg
 iDVYy2dmFmpmu9ng=
X-Received: by 2002:a5d:550f:: with SMTP id b15mr22962082wrv.145.1605602566831; 
 Tue, 17 Nov 2020 00:42:46 -0800 (PST)
X-Google-Smtp-Source: ABdhPJyMsI1h6xpgoKy1GKzfqh3cSMo1OlOiUDdFy+5xUygo62iWUUHTNOjPHBvIyKJyRVyLnQ+ITw==
X-Received: by 2002:a5d:550f:: with SMTP id b15mr22962065wrv.145.1605602566662; 
 Tue, 17 Nov 2020 00:42:46 -0800 (PST)
Received: from ?IPv6:2001:b07:6468:f312:c8dd:75d4:99ab:290a?
 ([2001:b07:6468:f312:c8dd:75d4:99ab:290a])
 by smtp.gmail.com with ESMTPSA id q66sm2626375wme.6.2020.11.17.00.42.45
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 17 Nov 2020 00:42:45 -0800 (PST)
Subject: Re: [PATCH] hvf: Gate RDTSCP on CPU_BASED2_RDTSCP, not just
 CPU_BASED_TSC_OFFSET
To: Jessica Clarke <jrtc27@jrtc27.com>, qemu-devel@nongnu.org
References: <20201116200319.28138-1-jrtc27@jrtc27.com>
From: Paolo Bonzini <pbonzini@redhat.com>
Message-ID: <1fcd3300-b042-8f41-307b-ac5342ae9940@redhat.com>
Date: Tue, 17 Nov 2020 09:42:44 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.4.0
MIME-Version: 1.0
In-Reply-To: <20201116200319.28138-1-jrtc27@jrtc27.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=pbonzini@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/11/17 01:18:45
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H4=0.001,
 RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Roman Bolshakov <r.bolshakov@yadro.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Eduardo Habkost <ehabkost@redhat.com>, Cameron Esfahani <dirty@apple.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 16/11/20 21:03, Jessica Clarke wrote:
> Buglink: https://bugs.launchpad.net/qemu/+bug/1894836
> Signed-off-by: Jessica Clarke <jrtc27@jrtc27.com>
> ---
>   target/i386/hvf/x86_cpuid.c | 4 ++++
>   1 file changed, 4 insertions(+)
> 
> diff --git a/target/i386/hvf/x86_cpuid.c b/target/i386/hvf/x86_cpuid.c
> index 16762b6eb4..fc1f87ec57 100644
> --- a/target/i386/hvf/x86_cpuid.c
> +++ b/target/i386/hvf/x86_cpuid.c
> @@ -122,6 +122,10 @@ uint32_t hvf_get_supported_cpuid(uint32_t func, uint32_t idx,
>                   CPUID_PAT | CPUID_PSE36 | CPUID_EXT2_MMXEXT | CPUID_MMX |
>                   CPUID_FXSR | CPUID_EXT2_FXSR | CPUID_EXT2_PDPE1GB | CPUID_EXT2_3DNOWEXT |
>                   CPUID_EXT2_3DNOW | CPUID_EXT2_LM | CPUID_EXT2_RDTSCP | CPUID_EXT2_NX;
> +        hv_vmx_read_capability(HV_VMX_CAP_PROCBASED2, &cap);
> +        if (!(cap & CPU_BASED2_RDTSCP)) {
> +            edx &= ~CPUID_EXT2_RDTSCP;
> +        }
>           hv_vmx_read_capability(HV_VMX_CAP_PROCBASED, &cap);
>           if (!(cap & CPU_BASED_TSC_OFFSET)) {
>               edx &= ~CPUID_EXT2_RDTSCP;
> 

Queued, thanks.

Paolo


