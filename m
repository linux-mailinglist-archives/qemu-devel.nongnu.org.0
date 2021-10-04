Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5E643420770
	for <lists+qemu-devel@lfdr.de>; Mon,  4 Oct 2021 10:39:43 +0200 (CEST)
Received: from localhost ([::1]:57926 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mXJVd-0001ty-0K
	for lists+qemu-devel@lfdr.de; Mon, 04 Oct 2021 04:39:41 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50510)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1mXJCT-0000jT-PB
 for qemu-devel@nongnu.org; Mon, 04 Oct 2021 04:19:53 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:60459)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1mXJCO-0006PC-Ll
 for qemu-devel@nongnu.org; Mon, 04 Oct 2021 04:19:53 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1633335569;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=bN5QvHIJyGEQLQUq3qeSzwte5zqrib25h9U6MkoN11c=;
 b=CYVL9cLFo1yupQgBnAyhnuKzfF3v7qYSKANTvcW+CuiHe/qFsArCWoo70dziqFvDuqVOnB
 1lkkCPAGs0d58C8IyWkwf2Q4UD9qhx7AEDAchOoG/ejsa/D5Py1dGJlH7D86gfgKBrs6LD
 SmeQYfLXIM6IRCm8OTT99IamoSqskrQ=
Received: from mail-ed1-f69.google.com (mail-ed1-f69.google.com
 [209.85.208.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-215-WzcRKNUJOOO78I-d0DD_SA-1; Mon, 04 Oct 2021 04:19:25 -0400
X-MC-Unique: WzcRKNUJOOO78I-d0DD_SA-1
Received: by mail-ed1-f69.google.com with SMTP id
 d11-20020a50cd4b000000b003da63711a8aso16336397edj.20
 for <qemu-devel@nongnu.org>; Mon, 04 Oct 2021 01:19:25 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=bN5QvHIJyGEQLQUq3qeSzwte5zqrib25h9U6MkoN11c=;
 b=5q0bHY4AQ9ca5MPXpnMCGCSFQ4JDnsE5x124wtLSvTRkm9hLdGCXlEBDSOKwErs6FT
 wt6fi5xN1XiEJW51j0U0SU+M8LGz1TdU9GXRHWNzfwkMQysLg21461wmaWe8E1q3ExE/
 Kv9UFlqL/XL/z0+zFvySKDP+muba0nqdU6ztTpdTAOiHF2Q+6zQMQ35z933K6rbdxce3
 ggNfSBJDasZ3EU11Ui8B4HBCDJCKk9IIc8VRAXZwTg/g487CNcXIuVCt8ULt12q6Ehac
 1bVHbpaifNeLKw1iWKbS/MWrUyFz3O56wLTkz3xn94x6VIaKgOgDaC6Umzkwl+iHCRn9
 kWYg==
X-Gm-Message-State: AOAM531AkZErghY9x5nHUMYlxBz+6Xnj5vlzogDFoUzFewDTDuJWyBI7
 OFZV+rIN/SEOwoTyY587ApF4QEAQTDRW+qeTtq7uMUsTutIgtxbu0/zPVffUpSUQe+L6TySejj7
 HBJqRS2Ms0MfRfHk=
X-Received: by 2002:a05:6402:3133:: with SMTP id
 dd19mr16994646edb.172.1633335564509; 
 Mon, 04 Oct 2021 01:19:24 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzBhF4FwsUP4iOjbFWBnvAEoKJKpZZrsb6YyGy3NvjZ0mIJUpS1ews6+9+BjKYDpFDl1JzbGQ==
X-Received: by 2002:a05:6402:3133:: with SMTP id
 dd19mr16994619edb.172.1633335564242; 
 Mon, 04 Oct 2021 01:19:24 -0700 (PDT)
Received: from ?IPV6:2001:b07:6468:f312:c8dd:75d4:99ab:290a?
 ([2001:b07:6468:f312:c8dd:75d4:99ab:290a])
 by smtp.gmail.com with ESMTPSA id d22sm6204775ejk.5.2021.10.04.01.19.17
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 04 Oct 2021 01:19:23 -0700 (PDT)
Message-ID: <84e1213b-c6c0-85a4-0d3e-854cd3dc0fa0@redhat.com>
Date: Mon, 4 Oct 2021 10:19:12 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.1.0
Subject: Re: [PATCH v3 13/22] target/i386/sev: Remove stubs by using code
 elision
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>,
 qemu-devel@nongnu.org
References: <20211002125317.3418648-1-philmd@redhat.com>
 <20211002125317.3418648-14-philmd@redhat.com>
From: Paolo Bonzini <pbonzini@redhat.com>
In-Reply-To: <20211002125317.3418648-14-philmd@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=pbonzini@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.055,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Brijesh Singh <brijesh.singh@amd.com>, kvm@vger.kernel.org,
 Sergio Lopez <slp@redhat.com>, James Bottomley <jejb@linux.ibm.com>,
 "Dr . David Alan Gilbert" <dgilbert@redhat.com>,
 Dov Murik <dovmurik@linux.ibm.com>,
 "Daniel P . Berrange" <berrange@redhat.com>,
 Eduardo Habkost <ehabkost@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 02/10/21 14:53, Philippe Mathieu-Daudé wrote:
> Only declare sev_enabled() and sev_es_enabled() when CONFIG_SEV is
> set, to allow the compiler to elide unused code. Remove unnecessary
> stubs.
> 
> Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
> ---
>   include/sysemu/sev.h    | 14 +++++++++++++-
>   target/i386/sev_i386.h  |  3 ---
>   target/i386/cpu.c       | 16 +++++++++-------
>   target/i386/sev-stub.c  | 36 ------------------------------------
>   target/i386/meson.build |  2 +-
>   5 files changed, 23 insertions(+), 48 deletions(-)
>   delete mode 100644 target/i386/sev-stub.c
> 
> diff --git a/include/sysemu/sev.h b/include/sysemu/sev.h
> index a329ed75c1c..f5c625bb3b3 100644
> --- a/include/sysemu/sev.h
> +++ b/include/sysemu/sev.h
> @@ -14,9 +14,21 @@
>   #ifndef QEMU_SEV_H
>   #define QEMU_SEV_H
>   
> -#include "sysemu/kvm.h"
> +#ifndef CONFIG_USER_ONLY
> +#include CONFIG_DEVICES /* CONFIG_SEV */
> +#endif
>   
> +#ifdef CONFIG_SEV
>   bool sev_enabled(void);
> +bool sev_es_enabled(void);
> +#else
> +#define sev_enabled() 0
> +#define sev_es_enabled() 0
> +#endif

This means that sev.h can only be included from target-specific files.

An alternative could be:

#ifdef NEED_CPU_H
# include CONFIG_DEVICES
#endif

#if defined NEED_CPU_H && !defined CONFIG_SEV
# define sev_enabled() 0
# define sev_es_enabled() 0
#else
bool sev_enabled(void);
bool sev_es_enabled(void);
#endif

... but in fact sysemu/sev.h _is_ only used from x86-specific files. So 
should it be moved to include/hw/i386, and even merged with 
target/i386/sev_i386.h?  Do we need two files?

Thanks,

Paolo

> +uint32_t sev_get_cbit_position(void);
> +uint32_t sev_get_reduced_phys_bits(void);
> +
>   int sev_kvm_init(ConfidentialGuestSupport *cgs, Error **errp);
>   
>   #endif
> diff --git a/target/i386/sev_i386.h b/target/i386/sev_i386.h
> index 0798ab3519a..2d9a1a0112e 100644
> --- a/target/i386/sev_i386.h
> +++ b/target/i386/sev_i386.h
> @@ -24,10 +24,7 @@
>   #define SEV_POLICY_DOMAIN       0x10
>   #define SEV_POLICY_SEV          0x20
>   
> -extern bool sev_es_enabled(void);
>   extern SevInfo *sev_get_info(void);
> -extern uint32_t sev_get_cbit_position(void);
> -extern uint32_t sev_get_reduced_phys_bits(void);
>   extern char *sev_get_launch_measurement(void);
>   extern SevCapability *sev_get_capabilities(Error **errp);
>   extern SevAttestationReport *
> diff --git a/target/i386/cpu.c b/target/i386/cpu.c
> index e169a01713d..27992bdc9f8 100644
> --- a/target/i386/cpu.c
> +++ b/target/i386/cpu.c
> @@ -25,8 +25,8 @@
>   #include "tcg/helper-tcg.h"
>   #include "sysemu/reset.h"
>   #include "sysemu/hvf.h"
> +#include "sysemu/sev.h"
>   #include "kvm/kvm_i386.h"
> -#include "sev_i386.h"
>   #include "qapi/error.h"
>   #include "qapi/qapi-visit-machine.h"
>   #include "qapi/qmp/qerror.h"
> @@ -38,6 +38,7 @@
>   #include "exec/address-spaces.h"
>   #include "hw/boards.h"
>   #include "hw/i386/sgx-epc.h"
> +#include "sev_i386.h"
>   #endif
>   
>   #include "disas/capstone.h"
> @@ -5764,12 +5765,13 @@ void cpu_x86_cpuid(CPUX86State *env, uint32_t index, uint32_t count,
>           *edx = 0;
>           break;
>       case 0x8000001F:
> -        *eax = sev_enabled() ? 0x2 : 0;
> -        *eax |= sev_es_enabled() ? 0x8 : 0;
> -        *ebx = sev_get_cbit_position();
> -        *ebx |= sev_get_reduced_phys_bits() << 6;
> -        *ecx = 0;
> -        *edx = 0;
> +        *eax = *ebx = *ecx = *edx = 0;
> +        if (sev_enabled()) {
> +            *eax = 0x2;
> +            *eax |= sev_es_enabled() ? 0x8 : 0;
> +            *ebx = sev_get_cbit_position();
> +            *ebx |= sev_get_reduced_phys_bits() << 6;
> +        }
>           break;
>       default:
>           /* reserved values: zero */
> diff --git a/target/i386/sev-stub.c b/target/i386/sev-stub.c
> deleted file mode 100644
> index 8eae5d2fa8d..00000000000
> --- a/target/i386/sev-stub.c
> +++ /dev/null
> @@ -1,36 +0,0 @@
> -/*
> - * QEMU SEV stub
> - *
> - * Copyright Advanced Micro Devices 2018
> - *
> - * Authors:
> - *      Brijesh Singh <brijesh.singh@amd.com>
> - *
> - * This work is licensed under the terms of the GNU GPL, version 2 or later.
> - * See the COPYING file in the top-level directory.
> - *
> - */
> -
> -#include "qemu/osdep.h"
> -#include "qapi/error.h"
> -#include "sev_i386.h"
> -
> -bool sev_enabled(void)
> -{
> -    return false;
> -}
> -
> -uint32_t sev_get_cbit_position(void)
> -{
> -    return 0;
> -}
> -
> -uint32_t sev_get_reduced_phys_bits(void)
> -{
> -    return 0;
> -}
> -
> -bool sev_es_enabled(void)
> -{
> -    return false;
> -}
> diff --git a/target/i386/meson.build b/target/i386/meson.build
> index a4f45c3ec1d..ae38dc95635 100644
> --- a/target/i386/meson.build
> +++ b/target/i386/meson.build
> @@ -6,7 +6,7 @@
>     'xsave_helper.c',
>     'cpu-dump.c',
>   ))
> -i386_ss.add(when: 'CONFIG_SEV', if_true: files('host-cpu.c'), if_false: files('sev-stub.c'))
> +i386_ss.add(when: 'CONFIG_SEV', if_true: files('host-cpu.c'))
>   
>   # x86 cpu type
>   i386_ss.add(when: 'CONFIG_KVM', if_true: files('host-cpu.c'))
> 


