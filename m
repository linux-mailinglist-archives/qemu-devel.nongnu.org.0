Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6278E411A0B
	for <lists+qemu-devel@lfdr.de>; Mon, 20 Sep 2021 18:44:46 +0200 (CEST)
Received: from localhost ([::1]:40206 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mSMPN-0006Mb-EU
	for lists+qemu-devel@lfdr.de; Mon, 20 Sep 2021 12:44:45 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38502)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eauger@redhat.com>) id 1mSM6u-0001C8-V9
 for qemu-devel@nongnu.org; Mon, 20 Sep 2021 12:25:42 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:32122)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eauger@redhat.com>) id 1mSM6n-0005vV-4C
 for qemu-devel@nongnu.org; Mon, 20 Sep 2021 12:25:39 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1632155130;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=nkUoFyEIPqBbuIPaXDuxjUbT3dPARzG1aiWyyg6YNtE=;
 b=TNPmX/+mZoTPt8RnlgF8DZ/yehdne4hggrxnGtaUMCSrPfIsthmLcLeiXwlPLzzU0WbLBn
 jO75iGWo8pwJHMLbbOw/gWSc5M0jZEs4z+WPx4cJVbQ8CQV1aFsn5gy7mBYzrC/TXkWebm
 u5Go5VvasBBhnn11jSXcMuZplNzMRaI=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-320-DDKZ6I88N1m3nLUScRK30w-1; Mon, 20 Sep 2021 12:25:29 -0400
X-MC-Unique: DDKZ6I88N1m3nLUScRK30w-1
Received: by mail-wr1-f72.google.com with SMTP id
 c15-20020a5d4ccf000000b0015dff622f39so6553425wrt.21
 for <qemu-devel@nongnu.org>; Mon, 20 Sep 2021 09:25:28 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=nkUoFyEIPqBbuIPaXDuxjUbT3dPARzG1aiWyyg6YNtE=;
 b=mGr9ChMQKbwuaknc1BYyCNg4bSTsqZT25i5rrv9vsoPwjLsCUTBhHEL0QTAMLcz+GJ
 vacFXxe9ZS/E7K8djrnxUW2t9rUGkA/S51sUNguOrwbXf5dSnIRl0tPnaR07KghgDTGN
 je+t+iMo5YoUxkLOOrs4m09RS9d6rEQUOmNsRRPAoHfIcWBJdewRlWZ4a1iq1/WKjmV+
 sdbStE4s8Wflf9iRRUpvjThmTKpIsgYxIDF6fpGMUvdEwFq5XKNbmN9nlbieef0YIJyH
 aE2fh89PuVHxuEL/Ulhi9nIUyTe/aene+KJtdKN2UJYwSHYXzi1XTsHLNl8NRGz+WSQx
 Rg5g==
X-Gm-Message-State: AOAM533ZNtHTtLy2lsnNptAtKFwkeFqFxAaXejGLmtsmlMNM/+qAfiGF
 ondQcypWfdWuWvYtvopT6VwsyuJa3Q1qrJbEo3FQSQuaPGpHt/Gz/9xboMU6QbuID+pdIylRppv
 JkbbKsfmAFLzDBdY=
X-Received: by 2002:a7b:cc0d:: with SMTP id f13mr25036624wmh.85.1632155127918; 
 Mon, 20 Sep 2021 09:25:27 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxngzH0apdATkF94wF0xEVwvu1qireFN28Yl7fKnuUG4VeZ+Im5J35zLWOItbcd8V0GfdEA9Q==
X-Received: by 2002:a7b:cc0d:: with SMTP id f13mr25036607wmh.85.1632155127743; 
 Mon, 20 Sep 2021 09:25:27 -0700 (PDT)
Received: from ?IPv6:2a01:e0a:59e:9d80:527b:9dff:feef:3874?
 ([2a01:e0a:59e:9d80:527b:9dff:feef:3874])
 by smtp.gmail.com with ESMTPSA id c30sm16680241wrb.74.2021.09.20.09.25.26
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 20 Sep 2021 09:25:27 -0700 (PDT)
Subject: Re: [PATCH v3 05/35] acpi: build_fadt: use
 acpi_table_begin()/acpi_table_end() instead of build_header()
To: Igor Mammedov <imammedo@redhat.com>, qemu-devel@nongnu.org
References: <20210907144814.741785-1-imammedo@redhat.com>
 <20210907144814.741785-6-imammedo@redhat.com>
From: Eric Auger <eauger@redhat.com>
Message-ID: <b2f75a22-199c-e553-ba3b-1009f2110639@redhat.com>
Date: Mon, 20 Sep 2021 18:25:26 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.1
MIME-Version: 1.0
In-Reply-To: <20210907144814.741785-6-imammedo@redhat.com>
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
Reviewed-by: Eric Auger <eric.auger@redhat.com>

Eric
> ---
> v3:
>   * s/acpi_init_table|acpi_table_composed/acpi_table_begin|acpi_table_end/
> ---
>  hw/acpi/aml-build.c | 14 +++++++-------
>  1 file changed, 7 insertions(+), 7 deletions(-)
> 
> diff --git a/hw/acpi/aml-build.c b/hw/acpi/aml-build.c
> index e54face23d..dbf3ffe889 100644
> --- a/hw/acpi/aml-build.c
> +++ b/hw/acpi/aml-build.c
> @@ -1978,9 +1978,10 @@ void build_fadt(GArray *tbl, BIOSLinker *linker, const AcpiFadtData *f,
>                  const char *oem_id, const char *oem_table_id)
>  {
>      int off;
> -    int fadt_start = tbl->len;
> +    AcpiTable table = { .sig = "FACP", .rev = f->rev,
> +                        .oem_id = oem_id, .oem_table_id = oem_table_id };
>  
> -    acpi_data_push(tbl, sizeof(AcpiTableHeader));
> +    acpi_table_begin(&table, tbl);
>  
>      /* FACS address to be filled by Guest linker at runtime */
>      off = tbl->len;
> @@ -2044,7 +2045,7 @@ void build_fadt(GArray *tbl, BIOSLinker *linker, const AcpiFadtData *f,
>      build_append_int_noprefix(tbl, f->flags, 4); /* Flags */
>  
>      if (f->rev == 1) {
> -        goto build_hdr;
> +        goto done;
>      }
>  
>      build_append_gas_from_struct(tbl, &f->reset_reg); /* RESET_REG */
> @@ -2081,7 +2082,7 @@ void build_fadt(GArray *tbl, BIOSLinker *linker, const AcpiFadtData *f,
>      build_append_gas(tbl, AML_AS_SYSTEM_MEMORY, 0 , 0, 0, 0); /* X_GPE1_BLK */
>  
>      if (f->rev <= 4) {
> -        goto build_hdr;
> +        goto done;
>      }
>  
>      /* SLEEP_CONTROL_REG */
> @@ -2092,9 +2093,8 @@ void build_fadt(GArray *tbl, BIOSLinker *linker, const AcpiFadtData *f,
>      /* TODO: extra fields need to be added to support revisions above rev5 */
>      assert(f->rev == 5);
>  
> -build_hdr:
> -    build_header(linker, tbl, (void *)(tbl->data + fadt_start),
> -                 "FACP", tbl->len - fadt_start, f->rev, oem_id, oem_table_id);
> +done:
> +    acpi_table_end(linker, &table);
>  }
>  
>  #ifdef CONFIG_TPM
> 


