Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 962854145B8
	for <lists+qemu-devel@lfdr.de>; Wed, 22 Sep 2021 12:04:02 +0200 (CEST)
Received: from localhost ([::1]:34200 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mSz6f-0002Sx-LI
	for lists+qemu-devel@lfdr.de; Wed, 22 Sep 2021 06:04:01 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41350)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eauger@redhat.com>) id 1mSz4Y-0001cc-16
 for qemu-devel@nongnu.org; Wed, 22 Sep 2021 06:01:53 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:22858)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eauger@redhat.com>) id 1mSz4K-00036B-MZ
 for qemu-devel@nongnu.org; Wed, 22 Sep 2021 06:01:43 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1632304893;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=RTRuldrya7LExhkbbi3PW8c+WO+Y3wSG3DR5T2tOs9w=;
 b=hdcKPNCC+Q/PujDu4/fguYEj4MyQeCt/qzt77U/MlTcWtR/53NQfb4etgKq+D6Fbkl7+SV
 lY3QJ/b/5GQJG4U/4xSmlCV/JOQSHegDznFPMgQsCqNgblPSjl/UIFhzluD2dsYxF+cuc8
 4ixaYePyINw71Iws8Y4STX5EpPuD/0I=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-463-tHg6S3J0PIGmnqWZ5eaf_A-1; Wed, 22 Sep 2021 06:01:32 -0400
X-MC-Unique: tHg6S3J0PIGmnqWZ5eaf_A-1
Received: by mail-wr1-f69.google.com with SMTP id
 f11-20020adfc98b000000b0015fedc2a8d4so1717028wrh.0
 for <qemu-devel@nongnu.org>; Wed, 22 Sep 2021 03:01:32 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=RTRuldrya7LExhkbbi3PW8c+WO+Y3wSG3DR5T2tOs9w=;
 b=BLiLeDP84e3OgQhBh8Ojmt7BMJNjTYA2BZ3wqf0I71IGcdDLhBRhBSPpCMSBnYc0mg
 9uWB1gfTynYcte+2kS62FmAykH5LsORWLVupfGW04pZGRdkOq/BSemM5Lkq4bpFSSrck
 s2YjxkSdQicn0eXUqnr8B5hSoTVkbl5R9OM5pN4X3X5jUngQfLB9p+X6mvpn250oWdg9
 WTpc/Kf8lO5hAcHkr59dd20Fx5tBIcvN70IK1FQPrZ3/mBaIalzw//LCSl/8Xu53ZizA
 eU11luY5zlKzjmBMJo6Ewqffhc4YRVzy2dfvIqOzcxCwpu/ZheMl8WzQoSpASSSgL6iR
 tnnw==
X-Gm-Message-State: AOAM530yscSC7/UBxuuKR5eD7nSXnHwVpNLuCUbCkN1ppoDdVSTP3/Gc
 K2NokrvDAMqNBclaJ5qesTxoZkU8tbpnuBfY8T67N75lms0l1DYlcvyZvCu3GtwMpzPrqh43nHN
 ENsWMXYS7HImcQB8=
X-Received: by 2002:adf:fac7:: with SMTP id a7mr40190177wrs.341.1632304890645; 
 Wed, 22 Sep 2021 03:01:30 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJw2PqpimOxGRWezUENo4r1a4qujFSYoKBK/QYz+DVEaWXcmKDYi9THvxCrO1720zRP1dp6BDw==
X-Received: by 2002:adf:fac7:: with SMTP id a7mr40190160wrs.341.1632304890474; 
 Wed, 22 Sep 2021 03:01:30 -0700 (PDT)
Received: from ?IPv6:2a01:e0a:59e:9d80:527b:9dff:feef:3874?
 ([2a01:e0a:59e:9d80:527b:9dff:feef:3874])
 by smtp.gmail.com with ESMTPSA id z19sm6770232wma.0.2021.09.22.03.01.29
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 22 Sep 2021 03:01:29 -0700 (PDT)
Subject: Re: [PATCH v3 26/35] acpi: build_dsdt_microvm: use
 acpi_table_begin()/acpi_table_end() instead of build_header()
To: Igor Mammedov <imammedo@redhat.com>, qemu-devel@nongnu.org
References: <20210907144814.741785-1-imammedo@redhat.com>
 <20210907144814.741785-27-imammedo@redhat.com>
From: Eric Auger <eauger@redhat.com>
Message-ID: <a7e76d75-2fd3-9e64-7811-767139026d5a@redhat.com>
Date: Wed, 22 Sep 2021 12:01:28 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.1
MIME-Version: 1.0
In-Reply-To: <20210907144814.741785-27-imammedo@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=eauger@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=eauger@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -23
X-Spam_score: -2.4
X-Spam_bar: --
X-Spam_report: (-2.4 / 5.0 requ) BAYES_00=-1.9, DKIM_INVALID=0.1,
 DKIM_SIGNED=0.1, NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_LOW=-0.7,
 RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
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
Cc: kraxel@redhat.com, mst@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>



On 9/7/21 4:48 PM, Igor Mammedov wrote:
> it replaces error-prone pointer arithmetic for build_header() API,
> with 2 calls to start and finish table creation,
> which hides offsets magic from API user.
> 
> Signed-off-by: Igor Mammedov <imammedo@redhat.com>
Reviewed-by: Eric Auger <eric.auger@redhat.com>

Eric
> ---
> v3:
>   * s/acpi_init_table|acpi_table_composed/acpi_table_begin|acpi_table_end/
> 
> CC: marcel.apfelbaum@gmail.com
> CC: kraxel@redhat.com
> ---
>  hw/i386/acpi-microvm.c | 13 ++++++-------
>  1 file changed, 6 insertions(+), 7 deletions(-)
> 
> diff --git a/hw/i386/acpi-microvm.c b/hw/i386/acpi-microvm.c
> index 1a0f77b911..196d318499 100644
> --- a/hw/i386/acpi-microvm.c
> +++ b/hw/i386/acpi-microvm.c
> @@ -113,16 +113,16 @@ build_dsdt_microvm(GArray *table_data, BIOSLinker *linker,
>      Aml *dsdt, *sb_scope, *scope, *pkg;
>      bool ambiguous;
>      Object *isabus;
> +    AcpiTable table = { .sig = "DSDT", .rev = 2, .oem_id = x86ms->oem_id,
> +                        .oem_table_id = x86ms->oem_table_id };
>  
>      isabus = object_resolve_path_type("", TYPE_ISA_BUS, &ambiguous);
>      assert(isabus);
>      assert(!ambiguous);
>  
> +    acpi_table_begin(&table, table_data);
>      dsdt = init_aml_allocator();
>  
> -    /* Reserve space for header */
> -    acpi_data_push(dsdt->buf, sizeof(AcpiTableHeader));
> -
>      sb_scope = aml_scope("_SB");
>      fw_cfg_add_acpi_dsdt(sb_scope, x86ms->fw_cfg);
>      isa_build_aml(ISA_BUS(isabus), sb_scope);
> @@ -144,11 +144,10 @@ build_dsdt_microvm(GArray *table_data, BIOSLinker *linker,
>      aml_append(scope, aml_name_decl("_S5", pkg));
>      aml_append(dsdt, scope);
>  
> -    /* copy AML table into ACPI tables blob and patch header there */
> +    /* copy AML bytecode into ACPI tables blob */
>      g_array_append_vals(table_data, dsdt->buf->data, dsdt->buf->len);
> -    build_header(linker, table_data,
> -        (void *)(table_data->data + table_data->len - dsdt->buf->len),
> -                 "DSDT", dsdt->buf->len, 2, x86ms->oem_id, x86ms->oem_table_id);
> +
> +    acpi_table_end(linker, &table);
>      free_aml_allocator();
>  }
>  
> 


