Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5D3476A0A89
	for <lists+qemu-devel@lfdr.de>; Thu, 23 Feb 2023 14:32:19 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pVBgU-0005Js-VU; Thu, 23 Feb 2023 08:30:55 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1pVBgN-0005Iq-56
 for qemu-devel@nongnu.org; Thu, 23 Feb 2023 08:30:51 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1pVBgK-000414-Qo
 for qemu-devel@nongnu.org; Thu, 23 Feb 2023 08:30:46 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1677159043;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=xDZjjn5RmTUwK0Z5V9GwPISKFG/ulCR4w2ujGzMQ8xs=;
 b=fAgmF5kLEN8GtLpNWZD3cChmm0NWhbGmIG0Gie3aRWKYdeYghmM3FX3lCvWfKDfKrK/orA
 aHOqsto6LSq/tTHwM5Kv4uTXxHsjpU2SY5UF4mliGCmvupiMFCSWDbcYvmRkmRyvbRfEdN
 +sWQXLhYnahqmiNrV5TB07YUAB8Bs70=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-326-r5KT8P7RNqCayLDdl8w9Cg-1; Thu, 23 Feb 2023 08:30:42 -0500
X-MC-Unique: r5KT8P7RNqCayLDdl8w9Cg-1
Received: by mail-wr1-f72.google.com with SMTP id
 1-20020a056000154100b002c54d9b8312so2435910wry.5
 for <qemu-devel@nongnu.org>; Thu, 23 Feb 2023 05:30:41 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:subject:from:references:cc:to
 :content-language:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=xDZjjn5RmTUwK0Z5V9GwPISKFG/ulCR4w2ujGzMQ8xs=;
 b=NIHHeZ4nDyJVtZ/vP34W6NHkf8vtVMXFJW8RlSgW+P0RLbWD0PBde+aCDVwNsOQQb+
 BHM7qbS++Dl2jXP0ZtRsI4b4Wy5YCoLlfB527eyFfF02paJHHoTJtkqxweVA8e1QpWse
 HOh8y8/H6ml8kTfYQhbDWMMvyiFNtXEKKlbfrLiWm2D1s+UDJBTOiz6rX4KMwrM3xEWt
 jKJ/y5ylkdiMhD/DP3yyJEeY96h2azLGAPeF3oOWmbumhruLSVGrIVl6/RnRmyBhuXXm
 2etW8dEjASkaXmLHkrt0Qo3Q/OBPJnEdBUaKFOihoNdlBdII1KZy/h8QhSfhS9V+vi8V
 kDdQ==
X-Gm-Message-State: AO0yUKUerF0jhJQ117zBFFElE4rrSbs36Nl62n9/AqPzJoLqB3jKkOqQ
 F5W4rp+dBSXcTzAX9A8sya1FYw/EvnuXRKcUK1rV26rxuPbofDGUwRZyzN+PpO1d2NWCf+O8wUG
 JRQ3yso7QWA7NxJs=
X-Received: by 2002:a05:600c:747:b0:3db:262a:8ef with SMTP id
 j7-20020a05600c074700b003db262a08efmr3129451wmn.38.1677159040879; 
 Thu, 23 Feb 2023 05:30:40 -0800 (PST)
X-Google-Smtp-Source: AK7set+vs2EMUMC2hNEDAwemSeRcndJMLxlIfrGTmmFUqLnvwkn1/5jjhheBJB9YtQHEw/bX6YJfYQ==
X-Received: by 2002:a05:600c:747:b0:3db:262a:8ef with SMTP id
 j7-20020a05600c074700b003db262a08efmr3129421wmn.38.1677159040576; 
 Thu, 23 Feb 2023 05:30:40 -0800 (PST)
Received: from [192.168.8.104] (tmo-100-40.customers.d1-online.com.
 [80.187.100.40]) by smtp.gmail.com with ESMTPSA id
 u10-20020a5d514a000000b002c55ed9e314sm8763681wrt.64.2023.02.23.05.30.38
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 23 Feb 2023 05:30:39 -0800 (PST)
Message-ID: <74aa9221-debc-84a6-d5bf-0a549018c7c9@redhat.com>
Date: Thu, 23 Feb 2023 14:30:37 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.13.0
Content-Language: en-US
To: Pierre Morel <pmorel@linux.ibm.com>, qemu-s390x@nongnu.org
Cc: qemu-devel@nongnu.org, borntraeger@de.ibm.com, pasic@linux.ibm.com,
 richard.henderson@linaro.org, david@redhat.com, cohuck@redhat.com,
 mst@redhat.com, pbonzini@redhat.com, kvm@vger.kernel.org,
 ehabkost@redhat.com, marcel.apfelbaum@gmail.com, eblake@redhat.com,
 armbru@redhat.com, seiden@linux.ibm.com, nrb@linux.ibm.com,
 nsg@linux.ibm.com, frankja@linux.ibm.com, berrange@redhat.com, clg@kaod.org
References: <20230222142105.84700-1-pmorel@linux.ibm.com>
 <20230222142105.84700-4-pmorel@linux.ibm.com>
From: Thomas Huth <thuth@redhat.com>
Subject: Re: [PATCH v16 03/11] target/s390x/cpu topology: handle STSI(15) and
 build the SYSIB
In-Reply-To: <20230222142105.84700-4-pmorel@linux.ibm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.09, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001,
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

On 22/02/2023 15.20, Pierre Morel wrote:
> On interception of STSI(15.1.x) the System Information Block
> (SYSIB) is built from the list of pre-ordered topology entries.
> 
> Signed-off-by: Pierre Morel <pmorel@linux.ibm.com>
> ---
...
> diff --git a/target/s390x/cpu.h b/target/s390x/cpu.h
> index d654267a71..c899f4e04b 100644
> --- a/target/s390x/cpu.h
> +++ b/target/s390x/cpu.h
> @@ -560,6 +560,25 @@ typedef struct SysIB_322 {
>   } SysIB_322;
>   QEMU_BUILD_BUG_ON(sizeof(SysIB_322) != 4096);
>   
> +#define S390_TOPOLOGY_MAG  6
> +#define S390_TOPOLOGY_MAG6 0
> +#define S390_TOPOLOGY_MAG5 1
> +#define S390_TOPOLOGY_MAG4 2
> +#define S390_TOPOLOGY_MAG3 3
> +#define S390_TOPOLOGY_MAG2 4
> +#define S390_TOPOLOGY_MAG1 5
> +/* Configuration topology */
> +typedef struct SysIB_151x {
> +    uint8_t  reserved0[2];
> +    uint16_t length;
> +    uint8_t  mag[S390_TOPOLOGY_MAG];
> +    uint8_t  reserved1;
> +    uint8_t  mnest;
> +    uint32_t reserved2;
> +    char tle[];
> +} QEMU_PACKED QEMU_ALIGNED(8) SysIB_151x;
> +QEMU_BUILD_BUG_ON(sizeof(SysIB_151x) != 16);

I think one of the two is enough, either QEMU_PACKED or QEMU_BUILD_BUG_ON. 
Since QEMU_PACKED caused us some troubles in the past already, I'd prefer 
QEMU_BUILD_BUG_ON only here.

Also, do we really need the QEMU_ALIGNED() here? ... I don't think so, and 
we also hardly use that anywhere else in the s390x code, so please drop 
that, too (unless there is a real reason for this?).

> @@ -567,9 +586,62 @@ typedef union SysIB {
>       SysIB_221 sysib_221;
>       SysIB_222 sysib_222;
>       SysIB_322 sysib_322;
> +    SysIB_151x sysib_151x;
>   } SysIB;
>   QEMU_BUILD_BUG_ON(sizeof(SysIB) != 4096);
>   
> +/*
> + * CPU Topology List provided by STSI with fc=15 provides a list
> + * of two different Topology List Entries (TLE) types to specify
> + * the topology hierarchy.
> + *
> + * - Container Topology List Entry
> + *   Defines a container to contain other Topology List Entries
> + *   of any type, nested containers or CPU.
> + * - CPU Topology List Entry
> + *   Specifies the CPUs position, type, entitlement and polarization
> + *   of the CPUs contained in the last Container TLE.
> + *
> + * There can be theoretically up to five levels of containers, QEMU
> + * uses only three levels, the drawer's, book's and socket's level.
> + *
> + * A container of with a nesting level (NL) greater than 1 can only
> + * contain another container of nesting level NL-1.
> + *
> + * A container of nesting level 1 (socket), contains as many CPU TLE
> + * as needed to describe the position and qualities of all CPUs inside
> + * the container.
> + * The qualities of a CPU are polarization, entitlement and type.
> + *
> + * The CPU TLE defines the position of the CPUs of identical qualities
> + * using a 64bits mask which first bit has its offset defined by
> + * the CPU address orgin field of the CPU TLE like in:
> + * CPU address = origin * 64 + bit position within the mask
> + *
> + */
> +/* Container type Topology List Entry */
> +typedef struct SysIBTl_container {
> +        uint8_t nl;
> +        uint8_t reserved[6];
> +        uint8_t id;
> +} QEMU_PACKED QEMU_ALIGNED(8) SysIBTl_container;

dito, please drop QEMU_PACKED and QEMU_ALIGNED() if possible.

> +QEMU_BUILD_BUG_ON(sizeof(SysIBTl_container) != 8);
> +
> +/* CPU type Topology List Entry */
> +typedef struct SysIBTl_cpu {
> +        uint8_t nl;
> +        uint8_t reserved0[3];
> +#define SYSIB_TLE_POLARITY_MASK 0x03
> +#define SYSIB_TLE_DEDICATED     0x04
> +        uint8_t flags;
> +        uint8_t type;
> +        uint16_t origin;
> +        uint64_t mask;
> +} QEMU_PACKED QEMU_ALIGNED(8) SysIBTl_cpu;

dito

  Thomas


