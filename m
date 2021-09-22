Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 860D8414A9F
	for <lists+qemu-devel@lfdr.de>; Wed, 22 Sep 2021 15:35:10 +0200 (CEST)
Received: from localhost ([::1]:55362 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mT2Oz-0001Bi-GA
	for lists+qemu-devel@lfdr.de; Wed, 22 Sep 2021 09:35:09 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54274)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eauger@redhat.com>) id 1mT2NY-0000I9-1w
 for qemu-devel@nongnu.org; Wed, 22 Sep 2021 09:33:40 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:25743)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eauger@redhat.com>) id 1mT2NR-0001qk-0w
 for qemu-devel@nongnu.org; Wed, 22 Sep 2021 09:33:39 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1632317611;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=ni0aFeBLJpQkD9OXGpErIS1wrQvOU5iuUjYfyzBRmiw=;
 b=du2DLxh6HqG7QY5IHYS+0+h2p1pYzwpVau2zIeOyuzg3kVMRm/mIU6co0aqex8sLvf+KZ7
 eznNWnD+uXxjTEiEgxkrwDRvqdKAlEnLbTkO+t4iDj8z7SuhBy/pUOyjtFLnVaPEDevVNv
 CWGZ3gSYYqvA2U7H7ZzuRw3ST2M/oso=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-55-WhVMS5eCOHGukvQGYSojEA-1; Wed, 22 Sep 2021 09:33:30 -0400
X-MC-Unique: WhVMS5eCOHGukvQGYSojEA-1
Received: by mail-wr1-f69.google.com with SMTP id
 l9-20020adfc789000000b00160111fd4e8so2155306wrg.17
 for <qemu-devel@nongnu.org>; Wed, 22 Sep 2021 06:33:30 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=ni0aFeBLJpQkD9OXGpErIS1wrQvOU5iuUjYfyzBRmiw=;
 b=BWu8kHkylX2sGNYmc3+osEHqr6sCdGVHvUajJe38SBf7HM6D6hMgVkgiQy90bFQRj2
 z1Cu1ijysmoRU4xZQw0X+XTmUSAdoskaVCxstk4wHnKIvYUJYlIYslybyvaTMqcucS0N
 owVwUjgYcAy1/i7rDqUTrrANXM3mMSCFRJL7BN8/2DZpjBRQeAhJ6jq42eFKhVpr/1F9
 9V3cDUR8bN0jnKkgJFy+I1bwEj0klUah7Vt0KBaekQ7f8beFEL33PdE0MD/0JFzYAmEJ
 1ce3iSshcH3iPicaphtYyUKicSucOg4w59dvqhC84f87yh8KXylRc3mVfzDqjheaOcRd
 xZrQ==
X-Gm-Message-State: AOAM5329Wc9Cw1h1CMELzgidZrCLwxxUuEcY3gNFAyY35yYk7dEKFRg6
 Lb65vRUKa9ghGnh2fRbfyk25hzBUbih9rO6HgI5o6EZr7pgGLEX1oIimW4Ew8mJSch2rFFds/yE
 KimoTzrAsveDxbOw=
X-Received: by 2002:a5d:5281:: with SMTP id c1mr23509690wrv.92.1632317609458; 
 Wed, 22 Sep 2021 06:33:29 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyWuw29xe4GD6p903l6lf/JANTtthZeBbL0kFyjPhsV9XeJYfy3jZEg0czhcdXzmhzMCCnoqA==
X-Received: by 2002:a5d:5281:: with SMTP id c1mr23509664wrv.92.1632317609252; 
 Wed, 22 Sep 2021 06:33:29 -0700 (PDT)
Received: from ?IPv6:2a01:e0a:59e:9d80:527b:9dff:feef:3874?
 ([2a01:e0a:59e:9d80:527b:9dff:feef:3874])
 by smtp.gmail.com with ESMTPSA id c9sm8887wmb.41.2021.09.22.06.33.28
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 22 Sep 2021 06:33:28 -0700 (PDT)
Subject: Re: [PATCH v3 33/35] acpi: build_facs: use
 build_append_int_noprefix() API to compose table
To: Igor Mammedov <imammedo@redhat.com>, qemu-devel@nongnu.org
References: <20210907144814.741785-1-imammedo@redhat.com>
 <20210907144814.741785-34-imammedo@redhat.com>
From: Eric Auger <eauger@redhat.com>
Message-ID: <d41d58c8-7978-e9e9-88bb-28ebc46f4fdc@redhat.com>
Date: Wed, 22 Sep 2021 15:33:27 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.1
MIME-Version: 1.0
In-Reply-To: <20210907144814.741785-34-imammedo@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=eauger@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=eauger@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -42
X-Spam_score: -4.3
X-Spam_bar: ----
X-Spam_report: (-4.3 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1.472,
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
Cc: mst@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>



On 9/7/21 4:48 PM, Igor Mammedov wrote:
> Drop usage of packed structures and explicit endian
> conversions when building table and use endian agnostic
> build_append_int_noprefix() API to build it.
> 
> Signed-off-by: Igor Mammedov <imammedo@redhat.com>
> ---
> CC: marcel.apfelbaum@gmail.com
> ---
>  include/hw/acpi/acpi-defs.h | 14 --------------
>  include/hw/acpi/aml-build.h |  1 +
>  hw/acpi/aml-build.c         |  2 +-
>  hw/i386/acpi-build.c        | 18 ++++++++++++++----
>  4 files changed, 16 insertions(+), 19 deletions(-)
> 
> diff --git a/include/hw/acpi/acpi-defs.h b/include/hw/acpi/acpi-defs.h
> index 0b375e7589..1a0774edd6 100644
> --- a/include/hw/acpi/acpi-defs.h
> +++ b/include/hw/acpi/acpi-defs.h
> @@ -117,18 +117,4 @@ typedef struct AcpiFadtData {
>  #define ACPI_FADT_ARM_PSCI_COMPLIANT  (1 << 0)
>  #define ACPI_FADT_ARM_PSCI_USE_HVC    (1 << 1)
>  
> -/*
> - * ACPI 1.0 Firmware ACPI Control Structure (FACS)
> - */
> -struct AcpiFacsDescriptorRev1 {
> -    uint32_t signature;           /* ACPI Signature */
> -    uint32_t length;                 /* Length of structure, in bytes */
> -    uint32_t hardware_signature;     /* Hardware configuration signature */
> -    uint32_t firmware_waking_vector; /* ACPI OS waking vector */
> -    uint32_t global_lock;            /* Global Lock */
> -    uint32_t flags;
> -    uint8_t  resverved3 [40];        /* Reserved - must be zero */
> -} QEMU_PACKED;
> -typedef struct AcpiFacsDescriptorRev1 AcpiFacsDescriptorRev1;
> -
>  #endif
> diff --git a/include/hw/acpi/aml-build.h b/include/hw/acpi/aml-build.h
> index 6e1f42e119..6f3d1de1b1 100644
> --- a/include/hw/acpi/aml-build.h
> +++ b/include/hw/acpi/aml-build.h
> @@ -413,6 +413,7 @@ Aml *aml_concatenate(Aml *source1, Aml *source2, Aml *target);
>  Aml *aml_object_type(Aml *object);
>  
>  void build_append_int_noprefix(GArray *table, uint64_t value, int size);
> +void build_append_byte(GArray *array, uint8_t val);
what's the rationale behind changes related to build_append_byte?
>  
>  typedef struct AcpiTable {
>      const char *sig;
> diff --git a/hw/acpi/aml-build.c b/hw/acpi/aml-build.c
> index 050fdb3f37..4135b385e5 100644
> --- a/hw/acpi/aml-build.c
> +++ b/hw/acpi/aml-build.c
> @@ -47,7 +47,7 @@ static void build_prepend_byte(GArray *array, uint8_t val)
>      g_array_prepend_val(array, val);
>  }
>  
> -static void build_append_byte(GArray *array, uint8_t val)
> +void build_append_byte(GArray *array, uint8_t val)
>  {
>      g_array_append_val(array, val);
>  }
> diff --git a/hw/i386/acpi-build.c b/hw/i386/acpi-build.c
> index 9f888d5a2c..547cd4ed9d 100644
> --- a/hw/i386/acpi-build.c
> +++ b/hw/i386/acpi-build.c
> @@ -345,13 +345,23 @@ static void acpi_align_size(GArray *blob, unsigned align)
>      g_array_set_size(blob, ROUND_UP(acpi_data_len(blob), align));
>  }
>  
> -/* FACS */
> +/*
> + * ACPI spec 1.0b,
> + * 5.2.6 Firmware ACPI Control Structure
> + */
>  static void
>  build_facs(GArray *table_data)
>  {
> -    AcpiFacsDescriptorRev1 *facs = acpi_data_push(table_data, sizeof *facs);
> -    memcpy(&facs->signature, "FACS", 4);
> -    facs->length = cpu_to_le32(sizeof(*facs));
> +    const char *sig = "FACS";
> +    const uint8_t reserved[40] = {};
> +
> +    g_array_append_vals(table_data, sig, 4); /* Signature */
> +    build_append_int_noprefix(table_data, 64, 4); /* Length */
> +    build_append_int_noprefix(table_data, 0, 4); /* Hardware Signature */
> +    build_append_int_noprefix(table_data, 0, 4); /* Firmware Waking Vector */
> +    build_append_int_noprefix(table_data, 0, 4); /* Global Lock */
> +    build_append_int_noprefix(table_data, 0, 4); /* Flags */
> +    g_array_append_vals(table_data, reserved, 40); /* Reserved */
>  }
>  
>  static void build_append_pcihp_notify_entry(Aml *method, int slot)
> 
Without thoses changes

Reviewed-by: Eric Auger <eric.auger@redhat.com>


