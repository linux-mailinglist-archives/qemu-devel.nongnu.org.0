Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1455A5A0A76
	for <lists+qemu-devel@lfdr.de>; Thu, 25 Aug 2022 09:40:54 +0200 (CEST)
Received: from localhost ([::1]:34740 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oR7Tv-0003XO-PX
	for lists+qemu-devel@lfdr.de; Thu, 25 Aug 2022 03:40:52 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43554)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imammedo@redhat.com>)
 id 1oR7QZ-00013A-Cm
 for qemu-devel@nongnu.org; Thu, 25 Aug 2022 03:37:24 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:50785)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imammedo@redhat.com>)
 id 1oR7QV-0008Bk-BL
 for qemu-devel@nongnu.org; Thu, 25 Aug 2022 03:37:21 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1661413038;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=eiEZEZtxkd+Q8GJ376KUS7jVNSg7X118l+Kr+3TCuew=;
 b=N9/KhUSncyMeN94K1hNVll84HiPX7CAQ/T6JVT6otC6GcDPI/QLkrnn9rsFCO28TnQ+9qj
 dpDyOxWeuzrweW3stodoYqRXjhyVzjrNuP7Rfm+coYAL5RVjtJSqYHD6NA+NXkgz3rqlbX
 R+tEn6qAfZKjYXbXBYOtTx97JJRx3To=
Received: from mail-ej1-f71.google.com (mail-ej1-f71.google.com
 [209.85.218.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-586-QuDPSNgmMeGnuJvcBMxm7w-1; Thu, 25 Aug 2022 03:37:14 -0400
X-MC-Unique: QuDPSNgmMeGnuJvcBMxm7w-1
Received: by mail-ej1-f71.google.com with SMTP id
 he38-20020a1709073da600b0073d98728570so2962510ejc.11
 for <qemu-devel@nongnu.org>; Thu, 25 Aug 2022 00:37:14 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:subject:cc:to:from:date:x-gm-message-state:from:to:cc;
 bh=eiEZEZtxkd+Q8GJ376KUS7jVNSg7X118l+Kr+3TCuew=;
 b=DRQR5RQwZ0b3Qkp/rI29IvxKnGzqmyWuZNOGT6WQamqy7o63siPy9J69X0S0rhYjd7
 xqmNAaDSy+oSLyRiEyXwo6obQa4ZIC3C5x5orzzvJOzEIoOC0fZnULe3jzPA/ShA/X+l
 625ryXcfrWyG22mEs6RobSMOuUtLk3DRPIKn8AMm8ojIgSWgjjp8XFsfQySjXK514r5D
 Q1xMwwduPXmGUVLepdC5Mre2aFw6KxKZOQ1XPXugHo3EgJGGMs1VcJmjXCdBQHHQQ4KY
 Fw6QAogh7ehuIyuxGa3vkqyCAata1UnwFy8fUnFd2BixAuR/51h08Ua4VqTWfVA5bhlv
 hqEw==
X-Gm-Message-State: ACgBeo2cSjvmK+w1PgZfpx25pQxMHIeE8abVAA/Rr4uS0svtxYK2NYfI
 qX/Yti6uIAfoaPkY5MtX0IrdVObu/lq0GCxHN0dmxr2MJ+GIoKeLmvbuOblLb1xREJ9TpnsgHh5
 I7FJDmuFnozqH704=
X-Received: by 2002:a05:6402:40cb:b0:446:fd02:f03b with SMTP id
 z11-20020a05640240cb00b00446fd02f03bmr2009758edb.405.1661413033734; 
 Thu, 25 Aug 2022 00:37:13 -0700 (PDT)
X-Google-Smtp-Source: AA6agR5vjVAP2vk/bfRLN7v6HL46heR1r+w9rUvbZgMWtjUvY7HSd4r6227fO89/Ib9w90sturwp3g==
X-Received: by 2002:a05:6402:40cb:b0:446:fd02:f03b with SMTP id
 z11-20020a05640240cb00b00446fd02f03bmr2009746edb.405.1661413033436; 
 Thu, 25 Aug 2022 00:37:13 -0700 (PDT)
Received: from localhost (nat-pool-brq-t.redhat.com. [213.175.37.10])
 by smtp.gmail.com with ESMTPSA id
 g18-20020a17090604d200b0073d9a0d0cbcsm2075380eja.72.2022.08.25.00.37.12
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 25 Aug 2022 00:37:12 -0700 (PDT)
Date: Thu, 25 Aug 2022 09:37:11 +0200
From: Igor Mammedov <imammedo@redhat.com>
To: Julia Suvorova <jusual@redhat.com>
Cc: qemu-devel@nongnu.org, "Michael S. Tsirkin" <mst@redhat.com>, Ani Sinha
 <ani@anisinha.ca>
Subject: Re: [PATCH v2 2/5] bios-tables-test: teach test to use smbios 3.0
 tables
Message-ID: <20220825093711.31cfe891@redhat.com>
In-Reply-To: <20220731162141.178443-3-jusual@redhat.com>
References: <20220731162141.178443-1-jusual@redhat.com>
 <20220731162141.178443-3-jusual@redhat.com>
X-Mailer: Claws Mail 4.1.0 (GTK 3.24.34; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=imammedo@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Sun, 31 Jul 2022 18:21:38 +0200
Julia Suvorova <jusual@redhat.com> wrote:

> Introduce the 64-bit entry point. Since we no longer have a total
> number of structures, stop checking for the new ones at the EOF
> structure (type 127).

needs fixing checkpatch warnings

other than that

Reviewed-by: Igor Mammedov <imammedo@redhat.com>

> Signed-off-by: Julia Suvorova <jusual@redhat.com>
> ---
>  tests/qtest/bios-tables-test.c | 95 +++++++++++++++++++++++++---------
>  1 file changed, 71 insertions(+), 24 deletions(-)
> 
> diff --git a/tests/qtest/bios-tables-test.c b/tests/qtest/bios-tables-test.c
> index 359916c228..e352d5249f 100644
> --- a/tests/qtest/bios-tables-test.c
> +++ b/tests/qtest/bios-tables-test.c
> @@ -88,8 +88,8 @@ typedef struct {
>      uint64_t rsdp_addr;
>      uint8_t rsdp_table[36 /* ACPI 2.0+ RSDP size */];
>      GArray *tables;
> -    uint32_t smbios_ep_addr;
> -    struct smbios_21_entry_point smbios_ep_table;
> +    uint64_t smbios_ep_addr[SMBIOS_ENTRY_POINT_TYPE__MAX];
> +    SmbiosEntryPoint smbios_ep_table;
>      uint16_t smbios_cpu_max_speed;
>      uint16_t smbios_cpu_curr_speed;
>      uint8_t *required_struct_types;
> @@ -533,10 +533,9 @@ static void test_acpi_asl(test_data *data)
>      free_test_data(&exp_data);
>  }
>  
> -static bool smbios_ep_table_ok(test_data *data)
> +static bool smbios_ep2_table_ok(test_data *data, uint32_t addr)
>  {
> -    struct smbios_21_entry_point *ep_table = &data->smbios_ep_table;
> -    uint32_t addr = data->smbios_ep_addr;
> +    struct smbios_21_entry_point *ep_table = &data->smbios_ep_table.ep21;
>  
>      qtest_memread(data->qts, addr, ep_table, sizeof(*ep_table));
>      if (memcmp(ep_table->anchor_string, "_SM_", 4)) {
> @@ -559,13 +558,29 @@ static bool smbios_ep_table_ok(test_data *data)
>      return true;
>  }
>  
> -static void test_smbios_entry_point(test_data *data)
> +static bool smbios_ep3_table_ok(test_data *data, uint64_t addr)
> +{
> +    struct smbios_30_entry_point *ep_table = &data->smbios_ep_table.ep30;
> +
> +    qtest_memread(data->qts, addr, ep_table, sizeof(*ep_table));
> +    if (memcmp(ep_table->anchor_string, "_SM3_", 5)) {
> +        return false;
> +    }
> +
> +    if (acpi_calc_checksum((uint8_t *)ep_table, sizeof *ep_table)) {
> +        return false;
> +    }
> +
> +    return true;
> +}
> +
> +static SmbiosEntryPointType test_smbios_entry_point(test_data *data)
>  {
>      uint32_t off;
>  
>      /* find smbios entry point structure */
>      for (off = 0xf0000; off < 0x100000; off += 0x10) {
> -        uint8_t sig[] = "_SM_";
> +        uint8_t sig[] = "_SM_", sig3[] = "_SM3_";
>          int i;
>  
>          for (i = 0; i < sizeof sig - 1; ++i) {
> @@ -574,14 +589,30 @@ static void test_smbios_entry_point(test_data *data)
>  
>          if (!memcmp(sig, "_SM_", sizeof sig)) {
>              /* signature match, but is this a valid entry point? */
> -            data->smbios_ep_addr = off;
> -            if (smbios_ep_table_ok(data)) {
> +            if (smbios_ep2_table_ok(data, off)) {
> +                data->smbios_ep_addr[SMBIOS_ENTRY_POINT_TYPE_32] = off;
> +            }
> +        }
> +
> +        for (i = 0; i < sizeof sig3 - 1; ++i) {
> +            sig3[i] = qtest_readb(data->qts, off + i);
> +        }
> +
> +        if (!memcmp(sig3, "_SM3_", sizeof sig3)) {
> +            if (smbios_ep3_table_ok(data, off)) {
> +                data->smbios_ep_addr[SMBIOS_ENTRY_POINT_TYPE_64] = off;
> +                /* found 64-bit entry point, no need to look for 32-bit one */
>                  break;
>              }
>          }
>      }
>  
> -    g_assert_cmphex(off, <, 0x100000);
> +    /* found at least one entry point */
> +    g_assert_true(data->smbios_ep_addr[SMBIOS_ENTRY_POINT_TYPE_32] ||
> +                  data->smbios_ep_addr[SMBIOS_ENTRY_POINT_TYPE_64]);
> +
> +    return data->smbios_ep_addr[SMBIOS_ENTRY_POINT_TYPE_64] ?
> +           SMBIOS_ENTRY_POINT_TYPE_64 : SMBIOS_ENTRY_POINT_TYPE_32;
>  }
>  
>  static inline bool smbios_single_instance(uint8_t type)
> @@ -625,16 +656,23 @@ static bool smbios_cpu_test(test_data *data, uint32_t addr)
>      return true;
>  }
>  
> -static void test_smbios_structs(test_data *data)
> +static void test_smbios_structs(test_data *data, SmbiosEntryPointType ep_type)
>  {
>      DECLARE_BITMAP(struct_bitmap, SMBIOS_MAX_TYPE+1) = { 0 };
> -    struct smbios_21_entry_point *ep_table = &data->smbios_ep_table;
> -    uint32_t addr = le32_to_cpu(ep_table->structure_table_address);
> -    int i, len, max_len = 0;
> +
> +    SmbiosEntryPoint *ep_table = &data->smbios_ep_table;
> +    int i = 0, len, max_len = 0;
>      uint8_t type, prv, crt;
> +    uint64_t addr;
> +
> +    if (ep_type == SMBIOS_ENTRY_POINT_TYPE_32) {
> +        addr = le32_to_cpu(ep_table->ep21.structure_table_address);
> +    } else {
> +        addr = le64_to_cpu(ep_table->ep30.structure_table_address);
> +    }
>  
>      /* walk the smbios tables */
> -    for (i = 0; i < le16_to_cpu(ep_table->number_of_structures); i++) {
> +    do {
>  
>          /* grab type and formatted area length from struct header */
>          type = qtest_readb(data->qts, addr);
> @@ -660,19 +698,28 @@ static void test_smbios_structs(test_data *data)
>          }
>  
>          /* keep track of max. struct size */
> -        if (max_len < len) {
> +        if (ep_type == SMBIOS_ENTRY_POINT_TYPE_32 && max_len < len) {
>              max_len = len;
> -            g_assert_cmpuint(max_len, <=, ep_table->max_structure_size);
> +            g_assert_cmpuint(max_len, <=, ep_table->ep21.max_structure_size);
>          }
>  
>          /* start of next structure */
>          addr += len;
> -    }
>  
> -    /* total table length and max struct size must match entry point values */
> -    g_assert_cmpuint(le16_to_cpu(ep_table->structure_table_length), ==,
> -                     addr - le32_to_cpu(ep_table->structure_table_address));
> -    g_assert_cmpuint(le16_to_cpu(ep_table->max_structure_size), ==, max_len);
> +    /*
> +     * Until all structures have been scanned (ep21)
> +     * or an EOF structure is found (ep30)
> +     */
> +    } while (ep_type == SMBIOS_ENTRY_POINT_TYPE_32 ?
> +                ++i < le16_to_cpu(ep_table->ep21.number_of_structures) :
> +                type != 127);
> +
> +    if (ep_type == SMBIOS_ENTRY_POINT_TYPE_32) {
> +        /* total table length and max struct size must match entry point values */
> +        g_assert_cmpuint(le16_to_cpu(ep_table->ep21.structure_table_length), ==,
> +                         addr - le32_to_cpu(ep_table->ep21.structure_table_address));
> +        g_assert_cmpuint(le16_to_cpu(ep_table->ep21.max_structure_size), ==, max_len);
> +    }
>  
>      /* required struct types must all be present */
>      for (i = 0; i < data->required_struct_types_len; i++) {
> @@ -756,8 +803,8 @@ static void test_acpi_one(const char *params, test_data *data)
>       * https://bugs.launchpad.net/qemu/+bug/1821884
>       */
>      if (!use_uefi) {
> -        test_smbios_entry_point(data);
> -        test_smbios_structs(data);
> +        SmbiosEntryPointType ep_type = test_smbios_entry_point(data);
> +        test_smbios_structs(data, ep_type);
>      }
>  
>      qtest_quit(data->qts);


