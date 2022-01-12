Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2D0D448C624
	for <lists+qemu-devel@lfdr.de>; Wed, 12 Jan 2022 15:38:12 +0100 (CET)
Received: from localhost ([::1]:37010 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n7elP-00012b-5T
	for lists+qemu-devel@lfdr.de; Wed, 12 Jan 2022 09:38:11 -0500
Received: from eggs.gnu.org ([209.51.188.92]:53002)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1n7dvS-00085n-1t
 for qemu-devel@nongnu.org; Wed, 12 Jan 2022 08:44:30 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:27909)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1n7dvQ-0000Iy-AC
 for qemu-devel@nongnu.org; Wed, 12 Jan 2022 08:44:29 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1641995067;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=1yEaVMyNiPGt72fCXGxE1/3lGvuKBsxJH8g5dgBhmJo=;
 b=KfVttEL6XPFTtI8Miuzv4xTtq6MKdid/E6/GyqYKFGAU9kFNSbZWOvkmfYYFBtlta02HzS
 gllFI5jq7bH1qLWRuwp46CubVgbQ5ZHsuvolGXKTZWDAqMqYhz/QD7y3ainKiXHoSCjgsB
 wzTnp6Th9xQjWr0st5Igd+OJa2YU92k=
Received: from mail-ed1-f72.google.com (mail-ed1-f72.google.com
 [209.85.208.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-647-m_0LmHErNqKKnb_a2mn7xA-1; Wed, 12 Jan 2022 08:44:26 -0500
X-MC-Unique: m_0LmHErNqKKnb_a2mn7xA-1
Received: by mail-ed1-f72.google.com with SMTP id
 c8-20020a05640227c800b003fdc1684cdeso2293932ede.12
 for <qemu-devel@nongnu.org>; Wed, 12 Jan 2022 05:44:25 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=1yEaVMyNiPGt72fCXGxE1/3lGvuKBsxJH8g5dgBhmJo=;
 b=MTnX/eGzEvPuNqGBHmabQe3NoCNWzHWYEc2hM/Txf72/dpJGX4ulmvHy17lUwcBovM
 vI2DtsU6eylRzLXcvXfrZD8BnYYOSgrhw3xacMbWELhwI5RhW7GcmxVaaatCMtzxHBkS
 eVwu6i9pmsQX83IIRr5ulfDE/Is9qP3d9Dw30f9zaowKLm3CY0y64bxENqqbPtlgKrO/
 qgqMjAmuEWUtkSlbru/UtWqaZ4gxzgU5T2f0IJrj4rajltbmKY8mJ1jd3/voKcPE/Xq+
 2YY0AzdaptqpmggPmdkX+fg21MRKtFgUXgVTFfnhxY7wvAXJ5YHJ9T1AIfvfbAPmuIv1
 9pfQ==
X-Gm-Message-State: AOAM531d7WuxEalRmTRljKxpwL/bunDIVU5CDKtxVlC54kn59fRH1z7/
 suIw9Nna0nNp922A4LIMgiv9U51DybL4wOII6XPmmUwEpbK8WWndIQN6gmW1M4wbGaLftUccMdH
 3EsKR8dF+P5kVCb8=
X-Received: by 2002:a17:907:169f:: with SMTP id
 hc31mr7528720ejc.703.1641995064401; 
 Wed, 12 Jan 2022 05:44:24 -0800 (PST)
X-Google-Smtp-Source: ABdhPJxCPh4iPgFPb2pgNFylEV1fvLOyo2F/tmza7A4GngfcKX62IBW3zUnnOh880pxTP4xiwLftng==
X-Received: by 2002:a17:907:169f:: with SMTP id
 hc31mr7528709ejc.703.1641995064149; 
 Wed, 12 Jan 2022 05:44:24 -0800 (PST)
Received: from redhat.com ([2.55.132.148])
 by smtp.gmail.com with ESMTPSA id ec25sm6050556edb.51.2022.01.12.05.44.21
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 12 Jan 2022 05:44:23 -0800 (PST)
Date: Wed, 12 Jan 2022 08:44:19 -0500
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Igor Mammedov <imammedo@redhat.com>
Subject: Re: [PATCH 1/4] tests: acpi: manually pad OEM_ID/OEM_TABLE_ID for
 test_oem_fields() test
Message-ID: <20220112084124-mutt-send-email-mst@kernel.org>
References: <20220112130332.1648664-1-imammedo@redhat.com>
 <20220112130332.1648664-2-imammedo@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20220112130332.1648664-2-imammedo@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=mst@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=170.10.129.124; envelope-from=mst@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -33
X-Spam_score: -3.4
X-Spam_bar: ---
X-Spam_report: (-3.4 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.595,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: Ani Sinha <ani@anisinha.ca>, qemu-devel@nongnu.org,
 Marian Postevca <posteuca@mutex.one>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Wed, Jan 12, 2022 at 08:03:29AM -0500, Igor Mammedov wrote:
> The next commit will revert OEM fields padding with whitespace to
> padding with '\0' as it was before [1]. As result test_oem_fields() will
> fail due to unexpectedly smaller ID sizes read from QEMU ACPI tables.
> 
> Pad OEM_ID/OEM_TABLE_ID manually with spaces so that values the test
> puts on QEMU CLI and expected values match.
> 
> 1) 602b458201 ("acpi: Permit OEM ID and OEM table ID fields to be changed")
> Signed-off-by: Igor Mammedov <imammedo@redhat.com>

That's kind of ugly in that we do not test
shorter names then.  How about we pad with \0 instead?
And add a comment explaining why it's done.

> ---
>  tests/qtest/bios-tables-test.c | 15 ++++++---------
>  1 file changed, 6 insertions(+), 9 deletions(-)
> 
> diff --git a/tests/qtest/bios-tables-test.c b/tests/qtest/bios-tables-test.c
> index e6b72d9026..90c9f6a0a2 100644
> --- a/tests/qtest/bios-tables-test.c
> +++ b/tests/qtest/bios-tables-test.c
> @@ -71,9 +71,10 @@
>  
>  #define ACPI_REBUILD_EXPECTED_AML "TEST_ACPI_REBUILD_AML"
>  
> -#define OEM_ID             "TEST"
> -#define OEM_TABLE_ID       "OEM"
> -#define OEM_TEST_ARGS      "-machine x-oem-id="OEM_ID",x-oem-table-id="OEM_TABLE_ID
> +#define OEM_ID             "TEST  "
> +#define OEM_TABLE_ID       "OEM     "
> +#define OEM_TEST_ARGS      "-machine x-oem-id='" OEM_ID "',x-oem-table-id='" \
> +                           OEM_TABLE_ID "'"
>  
>  typedef struct {
>      bool tcg_only;
> @@ -1519,11 +1520,7 @@ static void test_acpi_q35_slic(void)
>  static void test_oem_fields(test_data *data)
>  {
>      int i;
> -    char oem_id[6];
> -    char oem_table_id[8];
>  
> -    strpadcpy(oem_id, sizeof oem_id, OEM_ID, ' ');
> -    strpadcpy(oem_table_id, sizeof oem_table_id, OEM_TABLE_ID, ' ');
>      for (i = 0; i < data->tables->len; ++i) {
>          AcpiSdtTable *sdt;
>  
> @@ -1533,8 +1530,8 @@ static void test_oem_fields(test_data *data)
>              continue;
>          }
>  
> -        g_assert(memcmp(sdt->aml + 10, oem_id, 6) == 0);
> -        g_assert(memcmp(sdt->aml + 16, oem_table_id, 8) == 0);
> +        g_assert(memcmp(sdt->aml + 10, OEM_ID, 6) == 0);
> +        g_assert(memcmp(sdt->aml + 16, OEM_TABLE_ID, 8) == 0);
>      }
>  }
>  
> -- 
> 2.31.1


