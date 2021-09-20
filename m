Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4C8AF411C2D
	for <lists+qemu-devel@lfdr.de>; Mon, 20 Sep 2021 19:05:23 +0200 (CEST)
Received: from localhost ([::1]:46168 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mSMjJ-0004Zf-ID
	for lists+qemu-devel@lfdr.de; Mon, 20 Sep 2021 13:05:21 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41526)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eauger@redhat.com>) id 1mSMMO-0003no-Nd
 for qemu-devel@nongnu.org; Mon, 20 Sep 2021 12:41:41 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:29899)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eauger@redhat.com>) id 1mSMMK-0001z0-Lg
 for qemu-devel@nongnu.org; Mon, 20 Sep 2021 12:41:40 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1632156094;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=RUJrzROAgzLGgiLuY/+e4snhlKfrgXTvy17RB6hAX3U=;
 b=ekU3oFsS37at0jKB0nKrW+ZI6ACZSgX1kdJbaXsSuGiEG4g5oIQp3JWpA2CzoBqhsqNtUL
 IEB7w5u9M7WdHmzvxungoq0KM+LEbsVXacR8ck4w8JhNfmG1Ohz/GInPQgimIQBMr+ShbC
 CxaRImyeAMgxWqyhl57TYalz4C/wQSs=
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-148-f3VRgGx_MLuJv6QuGl2MXA-1; Mon, 20 Sep 2021 12:41:33 -0400
X-MC-Unique: f3VRgGx_MLuJv6QuGl2MXA-1
Received: by mail-wr1-f70.google.com with SMTP id
 r9-20020a5d4989000000b0015d0fbb8823so6585205wrq.18
 for <qemu-devel@nongnu.org>; Mon, 20 Sep 2021 09:41:33 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=RUJrzROAgzLGgiLuY/+e4snhlKfrgXTvy17RB6hAX3U=;
 b=IXAZcxYhF8Btquf+A63Dmm40NbwJqi8IZeSVNxvDRcoz9DjP4ODs8MXC3GynXgcjE6
 NL6OGr6/Kt64HvdRLA7f28AcX+lacpVxfJdnpKwMP2y7dp6pATkFnlgFnaDfAWXo+GQq
 dGDe9ENhQSbvnvl1MJ+C3ajLMP0S3/AbBj27+sIpXwPIovxjl6jsQEzUzAx8+FSf3igb
 j2rYGhsuB4XeGjpZ/XbyZj7Q6O4juQ0fXA0tt/p0C1K6YMaodgWFsMR2JNERiFybcfPc
 62O/iV+lU50ILbmrRvYcXpxaobI2EUfJ4bRQBFLx3WqGjkKW4QMUfz5KOxeJYioKoCaf
 pLLQ==
X-Gm-Message-State: AOAM532ctAWkMpTzGdqdHRkvieq6TUNbOTXQ0mfqa1uA79305R2NjfmG
 /d1uw7Is8I6N8hlGBMQTaQYv/wxf2vUB8cWkZ6Kin2YD/BYiKiltjw2tRWKWOUgiRbU3O1xOArp
 ///ASruJO6GLt/e0=
X-Received: by 2002:a05:600c:4145:: with SMTP id
 h5mr15500198wmm.49.1632156091984; 
 Mon, 20 Sep 2021 09:41:31 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwokm+YAPXKpmZ+Ry/uqYSz3h8LNkymhQeb7pfL/n+nXeaY3bClA054s0RuaCBx47438PDJSQ==
X-Received: by 2002:a05:600c:4145:: with SMTP id
 h5mr15500171wmm.49.1632156091792; 
 Mon, 20 Sep 2021 09:41:31 -0700 (PDT)
Received: from ?IPv6:2a01:e0a:59e:9d80:527b:9dff:feef:3874?
 ([2a01:e0a:59e:9d80:527b:9dff:feef:3874])
 by smtp.gmail.com with ESMTPSA id k17sm674443wmj.0.2021.09.20.09.41.30
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 20 Sep 2021 09:41:31 -0700 (PDT)
Subject: Re: [PATCH v3 11/35] acpi: nvdimm_build_ssdt: use
 acpi_table_begin()/acpi_table_end() instead of build_header()
To: Igor Mammedov <imammedo@redhat.com>, qemu-devel@nongnu.org
References: <20210907144814.741785-1-imammedo@redhat.com>
 <20210907144814.741785-12-imammedo@redhat.com>
From: Eric Auger <eauger@redhat.com>
Message-ID: <9ae86080-3833-9620-5132-ad04b77ef14f@redhat.com>
Date: Mon, 20 Sep 2021 18:41:30 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.1
MIME-Version: 1.0
In-Reply-To: <20210907144814.741785-12-imammedo@redhat.com>
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
Cc: xiaoguangrong.eric@gmail.com, mst@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Hi Igor,

On 9/7/21 4:47 PM, Igor Mammedov wrote:
> it replaces error-prone pointer arithmetic for build_header() API,
> with 2 calls to start and finish table creation,
> which hides offsets magic from API user.
> 
> Signed-off-by: Igor Mammedov <imammedo@redhat.com>
> ---
> v3:
>   * s/acpi_init_table|acpi_table_composed/acpi_table_begin|acpi_table_end/
> 
> CC: xiaoguangrong.eric@gmail.com
> ---
>  hw/acpi/nvdimm.c | 18 ++++++++++--------
>  1 file changed, 10 insertions(+), 8 deletions(-)
> 
> diff --git a/hw/acpi/nvdimm.c b/hw/acpi/nvdimm.c
> index 15f6ca82ca..e050b47c2b 100644
> --- a/hw/acpi/nvdimm.c
> +++ b/hw/acpi/nvdimm.c
> @@ -1274,14 +1274,15 @@ static void nvdimm_build_ssdt(GArray *table_offsets, GArray *table_data,
>                                NVDIMMState *nvdimm_state,
>                                uint32_t ram_slots, const char *oem_id)
>  {
> +    int mem_addr_offset;
>      Aml *ssdt, *sb_scope, *dev;
> -    int mem_addr_offset, nvdimm_ssdt;
> +    AcpiTable table = { .sig = "SSDT", .rev = 1,
> +                        .oem_id = oem_id, .oem_table_id = "NVDIMM" };
>  
>      acpi_add_table(table_offsets, table_data);
>  
> +    acpi_table_begin(&table, table_data);
>      ssdt = init_aml_allocator();
> -    acpi_data_push(ssdt->buf, sizeof(AcpiTableHeader));
> -
>      sb_scope = aml_scope("\\_SB");
>  
>      dev = aml_device("NVDR");
> @@ -1310,8 +1311,6 @@ static void nvdimm_build_ssdt(GArray *table_offsets, GArray *table_data,
>      aml_append(sb_scope, dev);
>      aml_append(ssdt, sb_scope);
>  
> -    nvdimm_ssdt = table_data->len;
> -
>      /* copy AML table into ACPI tables blob and patch header there */
>      g_array_append_vals(table_data, ssdt->buf->data, ssdt->buf->len);
>      mem_addr_offset = build_append_named_dword(table_data,
> @@ -1323,10 +1322,13 @@ static void nvdimm_build_ssdt(GArray *table_offsets, GArray *table_data,
>      bios_linker_loader_add_pointer(linker,
>          ACPI_BUILD_TABLE_FILE, mem_addr_offset, sizeof(uint32_t),
>          NVDIMM_DSM_MEM_FILE, 0);
> -    build_header(linker, table_data,
> -        (void *)(table_data->data + nvdimm_ssdt),
> -                 "SSDT", table_data->len - nvdimm_ssdt, 1, oem_id, "NVDIMM");
>      free_aml_allocator();
> +    /*
> +     * must be executed as the last so that pointer patching command above
> +     * would be executed by guest before it recalculates checksum which were
> +     * scheduled by acpi_table_composed()
s/acpi_table_composed/acpi_table_end.

also the sentence may need some rewording.

Wonder if that kind of comment still is useful. Maybe this should be put
once in the doc comment of acpi_table_end() in [PATCH v3 01/35] acpi:
add helper routines to initialize ACPI tables, for future users to pay
attention that it shall be called at the very end.

Besides

Reviewed-by: Eric Auger <eric.auger@redhat.com>

Eric


> +     */
> +    acpi_table_end(linker, &table);
>  }
>  
>  void nvdimm_build_srat(GArray *table_data)
> 


