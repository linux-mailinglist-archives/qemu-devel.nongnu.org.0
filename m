Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 69EA74119EE
	for <lists+qemu-devel@lfdr.de>; Mon, 20 Sep 2021 18:38:51 +0200 (CEST)
Received: from localhost ([::1]:54622 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mSMJe-0005XV-Fa
	for lists+qemu-devel@lfdr.de; Mon, 20 Sep 2021 12:38:50 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38306)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eauger@redhat.com>) id 1mSM5Q-0006sf-GD
 for qemu-devel@nongnu.org; Mon, 20 Sep 2021 12:24:08 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:58132)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eauger@redhat.com>) id 1mSM5N-0004rB-OP
 for qemu-devel@nongnu.org; Mon, 20 Sep 2021 12:24:08 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1632155045;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=UDHrlIZcmBi0b8+q9ClZv+EeQdyhln3Enh9m4/SWZc8=;
 b=Iq3lTXuo5v4HxicJ0Aqxt/BGO96b1fMPhcXfMQ5aJ2fPuWh7CQxmIOM3+TA5lstR4cIks9
 AN5gSug/CMbBoH/jpgUKGNny60CSzLegjMpPYnAHkVxLlsaDh9xTEy6eDbEAdvSkX1eIa2
 15Tv3TIE/+uE8XWVYypejkSDBevD7TE=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-453-ueg1ljIxMFalrc7pGgYqcA-1; Mon, 20 Sep 2021 12:24:04 -0400
X-MC-Unique: ueg1ljIxMFalrc7pGgYqcA-1
Received: by mail-wr1-f72.google.com with SMTP id
 j16-20020adfa550000000b0016012acc443so1187636wrb.14
 for <qemu-devel@nongnu.org>; Mon, 20 Sep 2021 09:24:03 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=UDHrlIZcmBi0b8+q9ClZv+EeQdyhln3Enh9m4/SWZc8=;
 b=wJWvN79UFV0YykcviZIdd+5dttz97SOSkoUVmwhUiHQta4jmjpoc8mB3G8bYF3AVwo
 4opY16FEnqdwLQmECYaUYXWxsLJH4qJqLAsf9rOsF6xRbYOd64xFdwKarmeWU3CYtXs3
 dwx1Gk4ar4OFzmIqJLzlwxA3Yhz3LhGuQyoMz4yGYZenGZi6jGGCbuIO6u6yM/YvnEe9
 Y8NB60RXNFcpUMZd5QSZuimeDS/NANI+AcUC3j2Fvxf0eZD20Wj4FnQVWZzsH32q5q3c
 pxcZhpt4YUM96jtNDeaYftFRMSSU1qxV9NjCIQfiMEwhOd7eZp0WwFhCU5zjk+u86F3d
 mbag==
X-Gm-Message-State: AOAM530z731VvL2BYoR5nkUtuHwUIEtday1H06ElhocrDi1dk5rcloFF
 Js4zGUgPUL1c9QIWGt8fEKvHjp/IqL/uUHrjr7hgCrx0fwq8qBMtbV/3l4/9z1R7gJoZ6MqU6fY
 jgdPOIal5pMWuTIo=
X-Received: by 2002:a05:600c:21d9:: with SMTP id
 x25mr29465056wmj.7.1632155043024; 
 Mon, 20 Sep 2021 09:24:03 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxiRDpi40CKx3+s1gYQOxfltbvnJfuw8fgx012vfMFMp6tL35l/bYbmSX2zRN7ZdvO/nAld5A==
X-Received: by 2002:a05:600c:21d9:: with SMTP id
 x25mr29465041wmj.7.1632155042784; 
 Mon, 20 Sep 2021 09:24:02 -0700 (PDT)
Received: from ?IPv6:2a01:e0a:59e:9d80:527b:9dff:feef:3874?
 ([2a01:e0a:59e:9d80:527b:9dff:feef:3874])
 by smtp.gmail.com with ESMTPSA id q7sm16564132wru.56.2021.09.20.09.24.02
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 20 Sep 2021 09:24:02 -0700 (PDT)
Subject: Re: [PATCH v3 04/35] acpi: build_slit: use
 acpi_table_begin()/acpi_table_end() instead of build_header()
To: Igor Mammedov <imammedo@redhat.com>, qemu-devel@nongnu.org
References: <20210907144814.741785-1-imammedo@redhat.com>
 <20210907144814.741785-5-imammedo@redhat.com>
From: Eric Auger <eauger@redhat.com>
Message-ID: <59507c79-fe54-2cef-c0dd-f256d81f5ad3@redhat.com>
Date: Mon, 20 Sep 2021 18:24:01 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.1
MIME-Version: 1.0
In-Reply-To: <20210907144814.741785-5-imammedo@redhat.com>
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
X-Spam_report: (-2.4 / 5.0 requ) DKIMWL_WL_HIGH=-1.475, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
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
>  hw/acpi/aml-build.c | 13 +++++--------
>  1 file changed, 5 insertions(+), 8 deletions(-)
> 
> diff --git a/hw/acpi/aml-build.c b/hw/acpi/aml-build.c
> index daefc132f3..e54face23d 100644
> --- a/hw/acpi/aml-build.c
> +++ b/hw/acpi/aml-build.c
> @@ -1954,11 +1954,12 @@ void build_srat_memory(AcpiSratMemoryAffinity *numamem, uint64_t base,
>  void build_slit(GArray *table_data, BIOSLinker *linker, MachineState *ms,
>                  const char *oem_id, const char *oem_table_id)
>  {
> -    int slit_start, i, j;
> -    slit_start = table_data->len;
> +    int i, j;
>      int nb_numa_nodes = ms->numa_state->num_nodes;
> +    AcpiTable table = { .sig = "SLIT", .rev = 1,
> +                        .oem_id = oem_id, .oem_table_id = oem_table_id };
>  
> -    acpi_data_push(table_data, sizeof(AcpiTableHeader));
> +    acpi_table_begin(&table, table_data);
>  
>      build_append_int_noprefix(table_data, nb_numa_nodes, 8);
>      for (i = 0; i < nb_numa_nodes; i++) {
> @@ -1969,11 +1970,7 @@ void build_slit(GArray *table_data, BIOSLinker *linker, MachineState *ms,
>                                        1);
>          }
>      }
> -
> -    build_header(linker, table_data,
> -                 (void *)(table_data->data + slit_start),
> -                 "SLIT",
> -                 table_data->len - slit_start, 1, oem_id, oem_table_id);
> +    acpi_table_end(linker, &table);
>  }
>  
>  /* build rev1/rev3/rev5.1 FADT */
> 


