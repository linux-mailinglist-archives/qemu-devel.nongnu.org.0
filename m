Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 683FF420746
	for <lists+qemu-devel@lfdr.de>; Mon,  4 Oct 2021 10:26:11 +0200 (CEST)
Received: from localhost ([::1]:58086 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mXJIY-0007aE-D3
	for lists+qemu-devel@lfdr.de; Mon, 04 Oct 2021 04:26:10 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49500)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1mXJ6z-0003HZ-OQ
 for qemu-devel@nongnu.org; Mon, 04 Oct 2021 04:14:13 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:52492)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1mXJ6x-00028p-PP
 for qemu-devel@nongnu.org; Mon, 04 Oct 2021 04:14:13 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1633335251;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Rt2taUi3UZfF6a3Ec9kR8v+p4tUBOzrc9UaCrS4J7ZQ=;
 b=IGFzdS7IkuVIMEZL28eZxgYTq72vJDsJ/Q1E8mOnrIjZxufKXfmh3aVS/Fq527XtX+HpzJ
 oulw4Sny78rgfdECFnOkMpCyXd2tyCJ3H7Idw8aOlc2wqAchhJwE0zUEu9bBWOm6Vrgvqp
 +Fohbs9ar2ICAULlIebodQ0kMNioZbo=
Received: from mail-ed1-f72.google.com (mail-ed1-f72.google.com
 [209.85.208.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-238-Waog_YKJOgCHY8JVBF4Adg-1; Mon, 04 Oct 2021 04:14:10 -0400
X-MC-Unique: Waog_YKJOgCHY8JVBF4Adg-1
Received: by mail-ed1-f72.google.com with SMTP id
 z6-20020a50cd06000000b003d2c2e38f1fso16387228edi.1
 for <qemu-devel@nongnu.org>; Mon, 04 Oct 2021 01:14:09 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=Rt2taUi3UZfF6a3Ec9kR8v+p4tUBOzrc9UaCrS4J7ZQ=;
 b=4vwPDhrI5VRPwbYsDchEPCEvUxwH0A5P2TEJka6IIogx3oFNo0l/uXlTc7sDN34S0Z
 EywDnJFRAxR6Lm/uIJM22AfqHHc+Lme5jf0UytYdbGcsCdqIvHeqy7plAuQyJ0I+F4E3
 qmLlzkXysCWInGE/b0pLfEZeuRuaGKtLPwKFSic54SZl7kae2rigPknLRY03kTBrz6gJ
 lxg/F1d7gNhHRn+0BnOzCoZS/sE7spJwP0OVoa83CGYH9YwBuTtQ1v1jE4mPbS6cJJuk
 8IaFhmCBMn+AdbgtafbN2xXadpfKX1DSP5C8XO0JlpyKW7P61nMm7d7zFDRp5iQJx4ja
 72Qw==
X-Gm-Message-State: AOAM532/QIf0sK4809udGLETqZJ4FYUxTb4fdtI4UGZxH501/0ioxQ5f
 J2F5PIAoRxjGoEhVliEToEEXsNhLgSabtqRziWEkQM3Q+RQsGEv9xruKB0cTq2CVQM5keNDqrU4
 FlpTB/gGLDyL8MJw=
X-Received: by 2002:a17:906:608e:: with SMTP id
 t14mr15425336ejj.441.1633335248826; 
 Mon, 04 Oct 2021 01:14:08 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxTRL4sn3Euzn1Zet9vyUC7zl8KlL6EeelDz+8ey4amnehlwoyWgkbJyaxQwbwQGTUGIns5Bw==
X-Received: by 2002:a17:906:608e:: with SMTP id
 t14mr15425309ejj.441.1633335248547; 
 Mon, 04 Oct 2021 01:14:08 -0700 (PDT)
Received: from ?IPV6:2001:b07:6468:f312:c8dd:75d4:99ab:290a?
 ([2001:b07:6468:f312:c8dd:75d4:99ab:290a])
 by smtp.gmail.com with ESMTPSA id gl2sm6125190ejb.110.2021.10.04.01.14.07
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 04 Oct 2021 01:14:08 -0700 (PDT)
Message-ID: <dfe5c054-b2dc-9bb5-5b15-fe6e51f2f98e@redhat.com>
Date: Mon, 4 Oct 2021 10:14:06 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.1.0
Subject: Re: [PATCH v3 11/22] target/i386/sev: Restrict SEV to system emulation
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>,
 qemu-devel@nongnu.org
References: <20211002125317.3418648-1-philmd@redhat.com>
 <20211002125317.3418648-12-philmd@redhat.com>
From: Paolo Bonzini <pbonzini@redhat.com>
In-Reply-To: <20211002125317.3418648-12-philmd@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=pbonzini@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=pbonzini@redhat.com;
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
> SEV is irrelevant on user emulation, so restrict it to sysemu.
> Some stubs are still required because used in cpu.c by
> x86_register_cpudef_types(), so move the sysemu specific stubs
> to sev-sysemu-stub.c instead. This will allow us to simplify
> monitor.c (which is not available in user emulation) in the
> next commit.
> 
> Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
> ---
>   target/i386/sev-stub.c        | 43 -------------------------
>   target/i386/sev-sysemu-stub.c | 60 +++++++++++++++++++++++++++++++++++
>   target/i386/meson.build       |  4 ++-
>   3 files changed, 63 insertions(+), 44 deletions(-)
>   create mode 100644 target/i386/sev-sysemu-stub.c
> 
> diff --git a/target/i386/sev-stub.c b/target/i386/sev-stub.c
> index 4668365fd3e..8eae5d2fa8d 100644
> --- a/target/i386/sev-stub.c
> +++ b/target/i386/sev-stub.c
> @@ -15,11 +15,6 @@
>   #include "qapi/error.h"
>   #include "sev_i386.h"
>   
> -SevInfo *sev_get_info(void)
> -{
> -    return NULL;
> -}
> -
>   bool sev_enabled(void)
>   {
>       return false;
> @@ -35,45 +30,7 @@ uint32_t sev_get_reduced_phys_bits(void)
>       return 0;
>   }
>   
> -char *sev_get_launch_measurement(void)
> -{
> -    return NULL;
> -}
> -
> -SevCapability *sev_get_capabilities(Error **errp)
> -{
> -    error_setg(errp, "SEV is not available in this QEMU");
> -    return NULL;
> -}
> -
> -int sev_inject_launch_secret(const char *hdr, const char *secret,
> -                             uint64_t gpa, Error **errp)
> -{
> -    return 1;
> -}
> -
> -int sev_encrypt_flash(uint8_t *ptr, uint64_t len, Error **errp)
> -{
> -    g_assert_not_reached();
> -}
> -
>   bool sev_es_enabled(void)
>   {
>       return false;
>   }
> -
> -void sev_es_set_reset_vector(CPUState *cpu)
> -{
> -}
> -
> -int sev_es_save_reset_vector(void *flash_ptr, uint64_t flash_size)
> -{
> -    g_assert_not_reached();
> -}
> -
> -SevAttestationReport *
> -sev_get_attestation_report(const char *mnonce, Error **errp)
> -{
> -    error_setg(errp, "SEV is not available in this QEMU");
> -    return NULL;
> -}
> diff --git a/target/i386/sev-sysemu-stub.c b/target/i386/sev-sysemu-stub.c
> new file mode 100644
> index 00000000000..d556b4f091f
> --- /dev/null
> +++ b/target/i386/sev-sysemu-stub.c
> @@ -0,0 +1,60 @@
> +/*
> + * QEMU SEV system stub
> + *
> + * Copyright Advanced Micro Devices 2018
> + *
> + * Authors:
> + *      Brijesh Singh <brijesh.singh@amd.com>
> + *
> + * This work is licensed under the terms of the GNU GPL, version 2 or later.
> + * See the COPYING file in the top-level directory.
> + *
> + */
> +
> +#include "qemu/osdep.h"
> +#include "qapi/qapi-commands-misc-target.h"
> +#include "qapi/error.h"
> +#include "sev_i386.h"
> +
> +SevInfo *sev_get_info(void)
> +{
> +    return NULL;
> +}
> +
> +char *sev_get_launch_measurement(void)
> +{
> +    return NULL;
> +}
> +
> +SevCapability *sev_get_capabilities(Error **errp)
> +{
> +    error_setg(errp, "SEV is not available in this QEMU");
> +    return NULL;
> +}
> +
> +int sev_inject_launch_secret(const char *hdr, const char *secret,
> +                             uint64_t gpa, Error **errp)
> +{
> +    return 1;
> +}
> +
> +int sev_encrypt_flash(uint8_t *ptr, uint64_t len, Error **errp)
> +{
> +    g_assert_not_reached();
> +}
> +
> +void sev_es_set_reset_vector(CPUState *cpu)
> +{
> +}
> +
> +int sev_es_save_reset_vector(void *flash_ptr, uint64_t flash_size)
> +{
> +    g_assert_not_reached();
> +}
> +
> +SevAttestationReport *sev_get_attestation_report(const char *mnonce,
> +                                                 Error **errp)
> +{
> +    error_setg(errp, "SEV is not available in this QEMU");
> +    return NULL;
> +}
> diff --git a/target/i386/meson.build b/target/i386/meson.build
> index dac19ec00d4..a4f45c3ec1d 100644
> --- a/target/i386/meson.build
> +++ b/target/i386/meson.build
> @@ -6,7 +6,7 @@
>     'xsave_helper.c',
>     'cpu-dump.c',
>   ))
> -i386_ss.add(when: 'CONFIG_SEV', if_true: files('host-cpu.c', 'sev.c'), if_false: files('sev-stub.c'))
> +i386_ss.add(when: 'CONFIG_SEV', if_true: files('host-cpu.c'), if_false: files('sev-stub.c'))
>   
>   # x86 cpu type
>   i386_ss.add(when: 'CONFIG_KVM', if_true: files('host-cpu.c'))
> @@ -20,6 +20,8 @@
>     'monitor.c',
>     'cpu-sysemu.c',
>   ))
> +i386_softmmu_ss.add(when: 'CONFIG_SEV', if_true: files('sev.c'), if_false: files('sev-sysemu-stub.c'))
> +
>   i386_user_ss = ss.source_set()
>   
>   subdir('kvm')
> 

Reviewed-by: Paolo Bonzini <pbonzini@redhat.com>


