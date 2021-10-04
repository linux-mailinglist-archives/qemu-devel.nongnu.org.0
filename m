Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6E8CD42078A
	for <lists+qemu-devel@lfdr.de>; Mon,  4 Oct 2021 10:46:57 +0200 (CEST)
Received: from localhost ([::1]:48038 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mXJce-0005zR-Da
	for lists+qemu-devel@lfdr.de; Mon, 04 Oct 2021 04:46:56 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51390)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1mXJHb-00081c-2W
 for qemu-devel@nongnu.org; Mon, 04 Oct 2021 04:25:15 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:30148)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1mXJHV-00047y-I2
 for qemu-devel@nongnu.org; Mon, 04 Oct 2021 04:25:09 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1633335904;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=5p0WShUJO7CqPDKHOUTKSobWwa9C6tme/99NhNxiCzc=;
 b=aIxW4VMZy50O17NbZijmkFr8b5te0L2zZxko7xkQIvUaoocv4Hw9VJrcNpyatkCtqgTQhC
 86uVpnGjOHqRaKE3kGiw3Q1BQUSwPbTGSHZjYCidgk6H/yCm135318ISiAGqz27vEexdQR
 937AJ3fCwgBnauRSYfHWzq3Ue84/AVA=
Received: from mail-ed1-f70.google.com (mail-ed1-f70.google.com
 [209.85.208.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-353-NdkAoA2hNyGFX8mNozvrag-1; Mon, 04 Oct 2021 04:25:03 -0400
X-MC-Unique: NdkAoA2hNyGFX8mNozvrag-1
Received: by mail-ed1-f70.google.com with SMTP id
 z6-20020a50cd06000000b003d2c2e38f1fso16416025edi.1
 for <qemu-devel@nongnu.org>; Mon, 04 Oct 2021 01:25:02 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=5p0WShUJO7CqPDKHOUTKSobWwa9C6tme/99NhNxiCzc=;
 b=kqma9tO0lSEPLPIOMuNXuGKnUXwuqBFx1WLdy6zTd9kZU+BEtM7tOL0cGffCbxbIvb
 DieAgu3OY523IFbh9pkFQcDRuNOWNUnkVkf1X6Izbl4VbRVDKRuRz7X8YNG8scXbBNEJ
 zLEPxzwW7nteIazCtdYNL45gDTgCPhulEE3WF83vdtHRxTpFIxsUDx4ZpeP8SR/zoCOk
 0Z2VsH/mNxdOv5Odn3W57j/Yem6JzMzsmU5tzOAIycfTfkJUxR0l48e0DwLtovE14418
 q4oLj3g1qaJlnQFGE/fD0u1zny1xfL6VbA84Biw/NmXaLDYpd2IM6GqkJxFv6grTFoqK
 ZDWw==
X-Gm-Message-State: AOAM532sTiEKCRiWGOYl8MyctbiuP0uU4JKfujrkRNswdknTeDCUqzn9
 8skIo3MzNUlf6lAwfSSQqjIYo/JeQO05akllW92QJiZUPjWisNE5f7YAUblA7NjKMU8Bm4lJDjj
 ZAYTNaAZYRlOoIZE=
X-Received: by 2002:a17:906:4346:: with SMTP id
 z6mr16073292ejm.403.1633335901903; 
 Mon, 04 Oct 2021 01:25:01 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxmvtTKKQjQI/M/2BONIWDf/ukyBxYzgH+RMfeVzgyCawpny7gazi+i24s0XQViwue6mXE8NA==
X-Received: by 2002:a17:906:4346:: with SMTP id
 z6mr16073261ejm.403.1633335901655; 
 Mon, 04 Oct 2021 01:25:01 -0700 (PDT)
Received: from ?IPV6:2001:b07:6468:f312:c8dd:75d4:99ab:290a?
 ([2001:b07:6468:f312:c8dd:75d4:99ab:290a])
 by smtp.gmail.com with ESMTPSA id l16sm6870373eds.46.2021.10.04.01.24.59
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 04 Oct 2021 01:25:00 -0700 (PDT)
Message-ID: <a8bcc533-8432-c5a0-a00a-77f78fe23768@redhat.com>
Date: Mon, 4 Oct 2021 10:24:56 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.1.0
Subject: Re: [PATCH v3 18/22] target/i386/sev: Move qmp_query_sev() &
 hmp_info_sev() to sev.c
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>,
 qemu-devel@nongnu.org
References: <20211002125317.3418648-1-philmd@redhat.com>
 <20211002125317.3418648-19-philmd@redhat.com>
From: Paolo Bonzini <pbonzini@redhat.com>
In-Reply-To: <20211002125317.3418648-19-philmd@redhat.com>
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
> Move qmp_query_sev() & hmp_info_sev()() from monitor.c to sev.c
> and make sev_get_info() static. We don't need the stub anymore,
> remove it. Add a stub for hmp_info_sev().
> 
> Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
> ---
>   target/i386/sev_i386.h        |  3 ---
>   target/i386/monitor.c         | 38 +---------------------------------
>   target/i386/sev-sysemu-stub.c | 10 ++++++++-
>   target/i386/sev.c             | 39 +++++++++++++++++++++++++++++++++--
>   4 files changed, 47 insertions(+), 43 deletions(-)
> 
> diff --git a/target/i386/sev_i386.h b/target/i386/sev_i386.h
> index 1699376ad87..15a959d6174 100644
> --- a/target/i386/sev_i386.h
> +++ b/target/i386/sev_i386.h
> @@ -15,7 +15,6 @@
>   #define QEMU_SEV_I386_H
>   
>   #include "sysemu/sev.h"
> -#include "qapi/qapi-types-misc-target.h"
>   
>   #define SEV_POLICY_NODBG        0x1
>   #define SEV_POLICY_NOKS         0x2
> @@ -24,8 +23,6 @@
>   #define SEV_POLICY_DOMAIN       0x10
>   #define SEV_POLICY_SEV          0x20
>   
> -extern SevInfo *sev_get_info(void);
> -
>   int sev_encrypt_flash(uint8_t *ptr, uint64_t len, Error **errp);
>   int sev_inject_launch_secret(const char *hdr, const char *secret,
>                                uint64_t gpa, Error **errp);
> diff --git a/target/i386/monitor.c b/target/i386/monitor.c
> index 0b38e970c73..890870b252d 100644
> --- a/target/i386/monitor.c
> +++ b/target/i386/monitor.c
> @@ -28,11 +28,9 @@
>   #include "monitor/hmp-target.h"
>   #include "monitor/hmp.h"
>   #include "qapi/qmp/qdict.h"
> -#include "qapi/qmp/qerror.h"
> +//#include "qapi/qmp/qerror.h"
>   #include "sysemu/kvm.h"
> -#include "sysemu/sev.h"
>   #include "qapi/error.h"
> -#include "sev_i386.h"
>   #include "qapi/qapi-commands-misc-target.h"
>   #include "qapi/qapi-commands-misc.h"
>   #include "hw/i386/pc.h"
> @@ -677,40 +675,6 @@ void hmp_info_io_apic(Monitor *mon, const QDict *qdict)
>                      "removed soon. Please use 'info pic' instead.\n");
>   }
>   
> -SevInfo *qmp_query_sev(Error **errp)
> -{
> -    SevInfo *info;
> -
> -    info = sev_get_info();
> -    if (!info) {
> -        error_setg(errp, "SEV feature is not available");
> -        return NULL;
> -    }
> -
> -    return info;
> -}
> -
> -void hmp_info_sev(Monitor *mon, const QDict *qdict)
> -{
> -    SevInfo *info = sev_get_info();
> -
> -    if (info && info->enabled) {
> -        monitor_printf(mon, "handle: %d\n", info->handle);
> -        monitor_printf(mon, "state: %s\n", SevState_str(info->state));
> -        monitor_printf(mon, "build: %d\n", info->build_id);
> -        monitor_printf(mon, "api version: %d.%d\n",
> -                       info->api_major, info->api_minor);
> -        monitor_printf(mon, "debug: %s\n",
> -                       info->policy & SEV_POLICY_NODBG ? "off" : "on");
> -        monitor_printf(mon, "key-sharing: %s\n",
> -                       info->policy & SEV_POLICY_NOKS ? "off" : "on");
> -    } else {
> -        monitor_printf(mon, "SEV is not enabled\n");
> -    }
> -
> -    qapi_free_SevInfo(info);
> -}
> -
>   SGXInfo *qmp_query_sgx(Error **errp)
>   {
>       return sgx_get_info(errp);
> diff --git a/target/i386/sev-sysemu-stub.c b/target/i386/sev-sysemu-stub.c
> index 355391c16c4..1836b32e4fc 100644
> --- a/target/i386/sev-sysemu-stub.c
> +++ b/target/i386/sev-sysemu-stub.c
> @@ -12,13 +12,16 @@
>    */
>   
>   #include "qemu/osdep.h"
> +#include "monitor/monitor.h"
> +#include "monitor/hmp.h"
>   #include "qapi/qapi-commands-misc-target.h"
>   #include "qapi/qmp/qerror.h"
>   #include "qapi/error.h"
>   #include "sev_i386.h"
>   
> -SevInfo *sev_get_info(void)
> +SevInfo *qmp_query_sev(Error **errp)
>   {
> +    error_setg(errp, QERR_UNSUPPORTED);
>       return NULL;
>   }
>   
> @@ -60,3 +63,8 @@ SevAttestationReport *qmp_query_sev_attestation_report(const char *mnonce,
>       error_setg(errp, QERR_UNSUPPORTED);
>       return NULL;
>   }
> +
> +void hmp_info_sev(Monitor *mon, const QDict *qdict)
> +{
> +    monitor_printf(mon, "SEV is not available in this QEMU\n");
> +}
> diff --git a/target/i386/sev.c b/target/i386/sev.c
> index 8e9cce62196..7caaa117ff7 100644
> --- a/target/i386/sev.c
> +++ b/target/i386/sev.c
> @@ -27,10 +27,12 @@
>   #include "sev_i386.h"
>   #include "sysemu/sysemu.h"
>   #include "sysemu/runstate.h"
> +#include "sysemu/sev.h"
>   #include "trace.h"
>   #include "migration/blocker.h"
>   #include "qom/object.h"
>   #include "monitor/monitor.h"
> +#include "monitor/hmp.h"
>   #include "qapi/qapi-commands-misc-target.h"
>   #include "qapi/qmp/qerror.h"
>   #include "exec/confidential-guest-support.h"
> @@ -375,8 +377,7 @@ sev_get_reduced_phys_bits(void)
>       return sev_guest ? sev_guest->reduced_phys_bits : 0;
>   }
>   
> -SevInfo *
> -sev_get_info(void)
> +static SevInfo *sev_get_info(void)
>   {
>       SevInfo *info;
>   
> @@ -395,6 +396,40 @@ sev_get_info(void)
>       return info;
>   }
>   
> +SevInfo *qmp_query_sev(Error **errp)
> +{
> +    SevInfo *info;
> +
> +    info = sev_get_info();
> +    if (!info) {
> +        error_setg(errp, "SEV feature is not available");
> +        return NULL;
> +    }
> +
> +    return info;
> +}
> +
> +void hmp_info_sev(Monitor *mon, const QDict *qdict)
> +{
> +    SevInfo *info = sev_get_info();
> +
> +    if (info && info->enabled) {
> +        monitor_printf(mon, "handle: %d\n", info->handle);
> +        monitor_printf(mon, "state: %s\n", SevState_str(info->state));
> +        monitor_printf(mon, "build: %d\n", info->build_id);
> +        monitor_printf(mon, "api version: %d.%d\n",
> +                       info->api_major, info->api_minor);
> +        monitor_printf(mon, "debug: %s\n",
> +                       info->policy & SEV_POLICY_NODBG ? "off" : "on");
> +        monitor_printf(mon, "key-sharing: %s\n",
> +                       info->policy & SEV_POLICY_NOKS ? "off" : "on");
> +    } else {
> +        monitor_printf(mon, "SEV is not enabled\n");
> +    }
> +
> +    qapi_free_SevInfo(info);
> +}
> +
>   static int
>   sev_get_pdh_info(int fd, guchar **pdh, size_t *pdh_len, guchar **cert_chain,
>                    size_t *cert_chain_len, Error **errp)
> 

Reviewed-by: Paolo Bonzini <pbonzini@redhat.com>


