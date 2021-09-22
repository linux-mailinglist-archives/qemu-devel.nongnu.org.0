Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1157C41429D
	for <lists+qemu-devel@lfdr.de>; Wed, 22 Sep 2021 09:25:13 +0200 (CEST)
Received: from localhost ([::1]:35480 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mSwcx-0003RG-Ji
	for lists+qemu-devel@lfdr.de; Wed, 22 Sep 2021 03:25:11 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38210)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eauger@redhat.com>) id 1mSwbF-0002D7-FH
 for qemu-devel@nongnu.org; Wed, 22 Sep 2021 03:23:25 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:33603)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eauger@redhat.com>) id 1mSwbC-0000E4-Dx
 for qemu-devel@nongnu.org; Wed, 22 Sep 2021 03:23:23 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1632295401;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=h4rcCxjBdWR9Bf2gZhPB6ECMSfGAjn1QAQAEiiGeZfo=;
 b=TVi2Uh5rPOWsWOsljKtIpaimvVvEX4OGPBvrr9WUuyrRclrEF8jdhLUOp5Pz8W/7GQOgcJ
 KfNqzm+2yMqkHxPtZbq2LJSxDzCmZPXbLzNrAVAgbUf6z6OZC+1u++Qd1tKYWg7EzLZ/Bo
 YWZoSZmJjTcK6mVNQAmXAWlB8klQkig=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-312-TDhOTcCYO2yPHCLasmvrpw-1; Wed, 22 Sep 2021 03:23:19 -0400
X-MC-Unique: TDhOTcCYO2yPHCLasmvrpw-1
Received: by mail-wr1-f69.google.com with SMTP id
 e1-20020adfa741000000b0015e424fdd01so1256359wrd.11
 for <qemu-devel@nongnu.org>; Wed, 22 Sep 2021 00:23:19 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=h4rcCxjBdWR9Bf2gZhPB6ECMSfGAjn1QAQAEiiGeZfo=;
 b=P/mk9jEQk2Yb0F9EAgnfS3kQSGEM/Q6XxDYkxUlip2QV/VU6/FfkTV9uRJUvBxjCRX
 WUr4Ahp3tre9WOcCSPNxQNRFeebSXpoLKTN0F6RSvjRV4a/vAbb+UD78/I9BEA0nSGxn
 tFSaQnrt2WZfLWB+FEOtR5PV3QNAFyyQUUMV9f0QIp/HWpP4vWKdbNUmkp447jmELSZ9
 UfpbGk++oont+nRiRiKoFX0z16EVqMeVrwHgk7tNVrJMr/5hxnYjAjEYu09kiuNN1Ngj
 15OvOJnW/nLYPpKihNbY1UoEUPVRBZqlILxdVaoWTa0HUKsZqsJbBUIntNmIUHxfKY9B
 V2TA==
X-Gm-Message-State: AOAM530h7Fl+E4xsHLZo+sxzE9q6e+Ro+IWHOjKgr7g19CjEDt2XIJmu
 TPb8/7s/akZNwZsqpZzBd1IkpsKRwoSY/QX6/uVxVzJpmFeSH/feQheFubzdiG8oONLhUq+oY9S
 lHF2Eh2XoZmKFcoo=
X-Received: by 2002:a5d:5246:: with SMTP id k6mr39109254wrc.431.1632295398545; 
 Wed, 22 Sep 2021 00:23:18 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxrYViXRkfi4GomVDPVf0J6SarPvfBdgrxHuXBMEQBgTYUROKAN56IuDzI/qR+krbzrBSeiCg==
X-Received: by 2002:a5d:5246:: with SMTP id k6mr39109235wrc.431.1632295398256; 
 Wed, 22 Sep 2021 00:23:18 -0700 (PDT)
Received: from ?IPv6:2a01:e0a:59e:9d80:527b:9dff:feef:3874?
 ([2a01:e0a:59e:9d80:527b:9dff:feef:3874])
 by smtp.gmail.com with ESMTPSA id y64sm1113185wmc.38.2021.09.22.00.23.17
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 22 Sep 2021 00:23:17 -0700 (PDT)
Subject: Re: [PATCH v3 12/35] acpi: vmgenid_build_acpi: use
 acpi_table_begin()/acpi_table_end() instead of build_header()
To: Igor Mammedov <imammedo@redhat.com>, qemu-devel@nongnu.org
References: <20210907144814.741785-1-imammedo@redhat.com>
 <20210907144814.741785-13-imammedo@redhat.com>
From: Eric Auger <eauger@redhat.com>
Message-ID: <5938a956-e67f-be8d-2a31-e9e068597afb@redhat.com>
Date: Wed, 22 Sep 2021 09:23:16 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.1
MIME-Version: 1.0
In-Reply-To: <20210907144814.741785-13-imammedo@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=eauger@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=eauger@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -42
X-Spam_score: -4.3
X-Spam_bar: ----
X-Spam_report: (-4.3 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1.475,
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



On 9/7/21 4:47 PM, Igor Mammedov wrote:
> it replaces error-prone pointer arithmetic for build_header() API,
> with 2 calls to start and finish table creation,
> which hides offsets magic from API user.
> 
> Signed-off-by: Igor Mammedov <imammedo@redhat.com>
> ---
> v3:
>   * s/acpi_init_table|acpi_table_composed/acpi_table_begin|acpi_table_end/
> ---
>  hw/acpi/vmgenid.c | 16 +++++++---------
>  1 file changed, 7 insertions(+), 9 deletions(-)
> 
> diff --git a/hw/acpi/vmgenid.c b/hw/acpi/vmgenid.c
> index 4f41a13ea0..95f94a2510 100644
> --- a/hw/acpi/vmgenid.c
> +++ b/hw/acpi/vmgenid.c
> @@ -29,6 +29,8 @@ void vmgenid_build_acpi(VmGenIdState *vms, GArray *table_data, GArray *guid,
>      Aml *ssdt, *dev, *scope, *method, *addr, *if_ctx;
>      uint32_t vgia_offset;
>      QemuUUID guid_le;
> +    AcpiTable table = { .sig = "SSDT", .rev = 1,
> +                        .oem_id = oem_id, .oem_table_id = "VMGENID" };
>  
>      /* Fill in the GUID values.  These need to be converted to little-endian
>       * first, since that's what the guest expects
> @@ -42,15 +44,12 @@ void vmgenid_build_acpi(VmGenIdState *vms, GArray *table_data, GArray *guid,
>      g_array_insert_vals(guid, VMGENID_GUID_OFFSET, guid_le.data,
>                          ARRAY_SIZE(guid_le.data));
>  
> -    /* Put this in a separate SSDT table */
> +    /* Put VMGNEID into a separate SSDT table */
> +    acpi_table_begin(&table, table_data);
>      ssdt = init_aml_allocator();
>  
> -    /* Reserve space for header */
> -    acpi_data_push(ssdt->buf, sizeof(AcpiTableHeader));
> -
>      /* Storage for the GUID address */
> -    vgia_offset = table_data->len +
> -        build_append_named_dword(ssdt->buf, "VGIA");
> +    vgia_offset = table_data->len + build_append_named_dword(ssdt->buf, "VGIA");
not mandated but well

>      scope = aml_scope("\\_SB");
>      dev = aml_device("VGEN");
>      aml_append(dev, aml_name_decl("_HID", aml_string("QEMUVGID")));
> @@ -116,9 +115,8 @@ void vmgenid_build_acpi(VmGenIdState *vms, GArray *table_data, GArray *guid,
>          ACPI_BUILD_TABLE_FILE, vgia_offset, sizeof(uint32_t),
>          VMGENID_GUID_FW_CFG_FILE, 0);
>  
> -    build_header(linker, table_data,
> -        (void *)(table_data->data + table_data->len - ssdt->buf->len),
> -        "SSDT", ssdt->buf->len, 1, oem_id, "VMGENID");
> +    /* must be called after above command to ensure correct table checksum */
ditto
> +    acpi_table_end(linker, &table);
>      free_aml_allocator();
>  }
>  
> 
Reviewed-by: Eric Auger <eric.auger@redhat.com>

Eric


