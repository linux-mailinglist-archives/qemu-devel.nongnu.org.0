Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1DA40420774
	for <lists+qemu-devel@lfdr.de>; Mon,  4 Oct 2021 10:40:11 +0200 (CEST)
Received: from localhost ([::1]:58896 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mXJW5-0002ZT-VD
	for lists+qemu-devel@lfdr.de; Mon, 04 Oct 2021 04:40:10 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51150)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1mXJG0-0005G5-R5
 for qemu-devel@nongnu.org; Mon, 04 Oct 2021 04:23:34 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:35313)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1mXJFy-0002w9-Pu
 for qemu-devel@nongnu.org; Mon, 04 Oct 2021 04:23:32 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1633335810;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=PNL0p/IcbfpfIHVZTeeyrwcQJfydGzS91iuchDZcq4c=;
 b=ePKes/e7AoT9GZduBrcjh2dpkCkm0HUnEgTwbF2xWVBSoXZl1xLb282S69/dw2HW4oSCML
 zdeQBrojqd2Cn26WRkIUm7+Eb5AWIJz9Njk1o05mDF+f7m59G+GYV88WhNQgd8Mric8NY7
 vmKwjZ/QMZq9n8GmTOt90sif6/LdJx8=
Received: from mail-ed1-f69.google.com (mail-ed1-f69.google.com
 [209.85.208.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-491-RV4vfDkAMQeVDg9RCtkoRw-1; Mon, 04 Oct 2021 04:23:29 -0400
X-MC-Unique: RV4vfDkAMQeVDg9RCtkoRw-1
Received: by mail-ed1-f69.google.com with SMTP id
 ec14-20020a0564020d4e00b003cf5630c190so16503818edb.3
 for <qemu-devel@nongnu.org>; Mon, 04 Oct 2021 01:23:29 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=PNL0p/IcbfpfIHVZTeeyrwcQJfydGzS91iuchDZcq4c=;
 b=u5jJibA/ocDkyeijNGMRC5okm/VMfkePZE/OwZLCkTaVBghfs7LlEaWPtWNqkkbFE7
 PDMMeFaqpqCkZSNn8O5hjMl5BlSYa47sWT8D1SEvka5ObVJCJkRYoHjmp1/2Oq7LlgbO
 aK1guvp5eLMLib2FPOhCy1G86b5oMLYAdYzN/o5Jp51oyQj9NsiYM4SiMfFW/5DtQuBI
 3NyyMPtfAztesdJI8o0wu7ZufcaHERWxQnh06pbHvR4KdybQSIFG96y1RzpXKRw9jL5j
 78yg89TQIyJvsxTdiGyMacSUX4AhkReYhOsAfGXqvW4VemtFwcrsKGKf9j79e1sQqprV
 y5Ng==
X-Gm-Message-State: AOAM533gf6j/6XNEo3UZAfmuTUB4lXd/N/0aRHspYAxNPnKXqE5Weu2S
 cLx5EjfyQqet5yHVJyIkdx+nfkidWm0bavWBgR9rZN+6XvtPw7D8fhScOwStuMZPY7wnLkKWe7p
 uEgEb/wRiv7Ri6xk=
X-Received: by 2002:a17:906:a08d:: with SMTP id
 q13mr15246981ejy.465.1633335808096; 
 Mon, 04 Oct 2021 01:23:28 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwZ0fYN3lmONz80EpgX+hD8OiLLPKVt+i7MlsXtnV8WtzTOcG0sbh83Y+6YYJTHqdfvWQEf8Q==
X-Received: by 2002:a17:906:a08d:: with SMTP id
 q13mr15246953ejy.465.1633335807847; 
 Mon, 04 Oct 2021 01:23:27 -0700 (PDT)
Received: from ?IPV6:2001:b07:6468:f312:c8dd:75d4:99ab:290a?
 ([2001:b07:6468:f312:c8dd:75d4:99ab:290a])
 by smtp.gmail.com with ESMTPSA id di4sm6842337edb.34.2021.10.04.01.23.26
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 04 Oct 2021 01:23:27 -0700 (PDT)
Message-ID: <86b19b44-a8e2-af97-2b96-8cc21ed1be34@redhat.com>
Date: Mon, 4 Oct 2021 10:23:26 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.1.0
Subject: Re: [PATCH v3 14/22] target/i386/sev: Move
 qmp_query_sev_attestation_report() to sev.c
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>,
 qemu-devel@nongnu.org
References: <20211002125317.3418648-1-philmd@redhat.com>
 <20211002125317.3418648-15-philmd@redhat.com>
From: Paolo Bonzini <pbonzini@redhat.com>
In-Reply-To: <20211002125317.3418648-15-philmd@redhat.com>
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
> Move qmp_query_sev_attestation_report() from monitor.c to sev.c
> and make sev_get_attestation_report() static. We don't need the
> stub anymore, remove it.
> 
> Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>

This was done on purpose, but I have no objection to changing it this 
way.  We might in fact remove the indirection for SGX as well, and/or 
even move the implementation of the monitor commands from target/i386 to 
hw/i386 (the monitor is sysemu-specific).

Reviewed-by: Paolo Bonzini <pbonzini@redhat.com>

Thanks,

Paolo

>   target/i386/sev_i386.h        |  2 --
>   target/i386/monitor.c         |  6 ------
>   target/i386/sev-sysemu-stub.c |  7 ++++---
>   target/i386/sev.c             | 12 ++++++++++--
>   4 files changed, 14 insertions(+), 13 deletions(-)
> 
> diff --git a/target/i386/sev_i386.h b/target/i386/sev_i386.h
> index 2d9a1a0112e..5f367f78eb7 100644
> --- a/target/i386/sev_i386.h
> +++ b/target/i386/sev_i386.h
> @@ -27,8 +27,6 @@
>   extern SevInfo *sev_get_info(void);
>   extern char *sev_get_launch_measurement(void);
>   extern SevCapability *sev_get_capabilities(Error **errp);
> -extern SevAttestationReport *
> -sev_get_attestation_report(const char *mnonce, Error **errp);
>   
>   int sev_encrypt_flash(uint8_t *ptr, uint64_t len, Error **errp);
>   int sev_inject_launch_secret(const char *hdr, const char *secret,
> diff --git a/target/i386/monitor.c b/target/i386/monitor.c
> index a9f85acd473..c05d70252a2 100644
> --- a/target/i386/monitor.c
> +++ b/target/i386/monitor.c
> @@ -764,12 +764,6 @@ void qmp_sev_inject_launch_secret(const char *packet_hdr,
>       sev_inject_launch_secret(packet_hdr, secret, gpa, errp);
>   }
>   
> -SevAttestationReport *
> -qmp_query_sev_attestation_report(const char *mnonce, Error **errp)
> -{
> -    return sev_get_attestation_report(mnonce, errp);
> -}
> -
>   SGXInfo *qmp_query_sgx(Error **errp)
>   {
>       return sgx_get_info(errp);
> diff --git a/target/i386/sev-sysemu-stub.c b/target/i386/sev-sysemu-stub.c
> index d556b4f091f..813b9a6a03b 100644
> --- a/target/i386/sev-sysemu-stub.c
> +++ b/target/i386/sev-sysemu-stub.c
> @@ -13,6 +13,7 @@
>   
>   #include "qemu/osdep.h"
>   #include "qapi/qapi-commands-misc-target.h"
> +#include "qapi/qmp/qerror.h"
>   #include "qapi/error.h"
>   #include "sev_i386.h"
>   
> @@ -52,9 +53,9 @@ int sev_es_save_reset_vector(void *flash_ptr, uint64_t flash_size)
>       g_assert_not_reached();
>   }
>   
> -SevAttestationReport *sev_get_attestation_report(const char *mnonce,
> -                                                 Error **errp)
> +SevAttestationReport *qmp_query_sev_attestation_report(const char *mnonce,
> +                                                       Error **errp)
>   {
> -    error_setg(errp, "SEV is not available in this QEMU");
> +    error_setg(errp, QERR_UNSUPPORTED);
>       return NULL;
>   }
> diff --git a/target/i386/sev.c b/target/i386/sev.c
> index aefbef4bb63..91a217bbb85 100644
> --- a/target/i386/sev.c
> +++ b/target/i386/sev.c
> @@ -31,6 +31,8 @@
>   #include "migration/blocker.h"
>   #include "qom/object.h"
>   #include "monitor/monitor.h"
> +#include "qapi/qapi-commands-misc-target.h"
> +#include "qapi/qmp/qerror.h"
>   #include "exec/confidential-guest-support.h"
>   #include "hw/i386/pc.h"
>   
> @@ -487,8 +489,8 @@ out:
>       return cap;
>   }
>   
> -SevAttestationReport *
> -sev_get_attestation_report(const char *mnonce, Error **errp)
> +static SevAttestationReport *sev_get_attestation_report(const char *mnonce,
> +                                                        Error **errp)
>   {
>       struct kvm_sev_attestation_report input = {};
>       SevAttestationReport *report = NULL;
> @@ -549,6 +551,12 @@ sev_get_attestation_report(const char *mnonce, Error **errp)
>       return report;
>   }
>   
> +SevAttestationReport *qmp_query_sev_attestation_report(const char *mnonce,
> +                                                       Error **errp)
> +{
> +    return sev_get_attestation_report(mnonce, errp);
> +}
> +
>   static int
>   sev_read_file_base64(const char *filename, guchar **data, gsize *len)
>   {
> 


