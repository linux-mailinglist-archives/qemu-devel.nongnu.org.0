Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E4DA25B00B1
	for <lists+qemu-devel@lfdr.de>; Wed,  7 Sep 2022 11:39:54 +0200 (CEST)
Received: from localhost ([::1]:47062 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oVrXF-0003An-Tn
	for lists+qemu-devel@lfdr.de; Wed, 07 Sep 2022 05:39:54 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:52340)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imammedo@redhat.com>)
 id 1oVr9u-0001GR-Ah
 for qemu-devel@nongnu.org; Wed, 07 Sep 2022 05:15:46 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:38649)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imammedo@redhat.com>)
 id 1oVr9r-0007HN-7I
 for qemu-devel@nongnu.org; Wed, 07 Sep 2022 05:15:44 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1662542142;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=yIsPSyw3xQlJtHMYcwr7lY+1aOhBIXeLZviJXJ70edQ=;
 b=CxYS2nc6nx1M750Rtm1Ag5FjZuGItRf882ri6FQEWrx2HYTI/z8dCogC7XA3WGjs8tUzjn
 0zKvMss/8k8mVJG3qdectadHD+duya/c/0wDoI5+qrdQ//oYCDvTG/Yljnf5o9BrRpdEZB
 VQFuKscd/ukwnlY3IotSDe46PvEZ4+s=
Received: from mail-ed1-f71.google.com (mail-ed1-f71.google.com
 [209.85.208.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-669-GYi5okZSPkSjO2DfsWBoIQ-1; Wed, 07 Sep 2022 05:15:41 -0400
X-MC-Unique: GYi5okZSPkSjO2DfsWBoIQ-1
Received: by mail-ed1-f71.google.com with SMTP id
 r11-20020a05640251cb00b004484ec7e3a4so9265242edd.8
 for <qemu-devel@nongnu.org>; Wed, 07 Sep 2022 02:15:40 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:subject:cc:to:from:date:x-gm-message-state:from:to:cc
 :subject:date;
 bh=yIsPSyw3xQlJtHMYcwr7lY+1aOhBIXeLZviJXJ70edQ=;
 b=31ZnArbgXD6EGSw/K/37/kF9s3l2Vh/du/SwbsRL16J3YdprfzXxJUWDBxIlX3EPLQ
 Ezlh3q0PO4yrzgNu2OKsc7isTARNEWkWow08PQDvHp5/QkHhVL9KgBmgt8LwZ/m9AcSr
 R7sfDX5pttzs/Flaj5z9j5DKpI4WJFLoWYvs1iN/9ROUvFdLfLj3CfWhNvn2fLvNAmP/
 qVC2tG01D2Ke8p7lYUCUAq7qTpcxlbDqggK5PHVdigJYO06UXB5kanoVpVgUiwHNHnbj
 bC0btylj9KxUkCXoI/wTeQMUI7wiUuahyOM77tWEyqTq638/XZwu8M6xj7M166aZbpvT
 VyPg==
X-Gm-Message-State: ACgBeo0dTaJhWHED3iMGdb92YmDTcNqTP2YbPdAq66gUvSplDZA+t9c7
 lIimFdu0+WOmyyd6Gr7iUP6O8KwddbsOWS7FKDKgRXhGgpsMj4Nabuz9yhPdtl5zW6nHdGzDV8Y
 i8ojksfIcDgKRDcY=
X-Received: by 2002:a17:907:60c7:b0:731:148b:c515 with SMTP id
 hv7-20020a17090760c700b00731148bc515mr1734626ejc.724.1662542139912; 
 Wed, 07 Sep 2022 02:15:39 -0700 (PDT)
X-Google-Smtp-Source: AA6agR5piCAgP6X6h1RONb5xFmjS7eEFdyHaM1xEbDvBt6H6dgUy59fUI+JB5b1UO59CqxLULvm8gg==
X-Received: by 2002:a17:907:60c7:b0:731:148b:c515 with SMTP id
 hv7-20020a17090760c700b00731148bc515mr1734604ejc.724.1662542139602; 
 Wed, 07 Sep 2022 02:15:39 -0700 (PDT)
Received: from localhost (nat-pool-brq-t.redhat.com. [213.175.37.10])
 by smtp.gmail.com with ESMTPSA id
 u24-20020a056402111800b0044ebe6f364csm3834492edv.45.2022.09.07.02.15.38
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 07 Sep 2022 02:15:39 -0700 (PDT)
Date: Wed, 7 Sep 2022 11:15:38 +0200
From: Igor Mammedov <imammedo@redhat.com>
To: Robert Hoo <robert.hu@linux.intel.com>
Cc: mst@redhat.com, xiaoguangrong.eric@gmail.com, ani@anisinha.ca,
 dan.j.williams@intel.com, jingqi.liu@intel.com, qemu-devel@nongnu.org,
 robert.hu@intel.com
Subject: Re: [PATCH v3 3/5] acpi/nvdimm: define macro for NVDIMM Device _DSM
Message-ID: <20220907111538.31fdd382@redhat.com>
In-Reply-To: <20220901032721.1392482-4-robert.hu@linux.intel.com>
References: <20220901032721.1392482-1-robert.hu@linux.intel.com>
 <20220901032721.1392482-4-robert.hu@linux.intel.com>
X-Mailer: Claws Mail 4.1.0 (GTK 3.24.34; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=imammedo@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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

On Thu,  1 Sep 2022 11:27:19 +0800
Robert Hoo <robert.hu@linux.intel.com> wrote:

> Since it will be heavily used in next patch, define macro
> NVDIMM_DEVICE_DSM_UUID for "4309AC30-0D11-11E4-9191-0800200C9A66", which is
> NVDIMM device specific method uuid defined in NVDIMM _DSM interface spec,
> Section 3. [1]
> 
> No functional changes in this patch.
> 
> [1] https://pmem.io/documents/IntelOptanePMem_DSM_Interface-V2.0.pdf
> 
> Signed-off-by: Robert Hoo <robert.hu@linux.intel.com>
> Reviewed-by: Jingqi Liu <jingqi.liu@intel.com>

Reviewed-by: Igor Mammedov <imammedo@redhat.com>

> ---
>  hw/acpi/nvdimm.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/hw/acpi/nvdimm.c b/hw/acpi/nvdimm.c
> index 201317c611..afff911c1e 100644
> --- a/hw/acpi/nvdimm.c
> +++ b/hw/acpi/nvdimm.c
> @@ -922,6 +922,7 @@ void nvdimm_init_acpi_state(NVDIMMState *state, MemoryRegion *io,
>  #define NVDIMM_DSM_RFIT_STATUS  "RSTA"
>  
>  #define NVDIMM_QEMU_RSVD_UUID   "648B9CF2-CDA1-4312-8AD9-49C4AF32BD62"
> +#define NVDIMM_DEVICE_DSM_UUID  "4309AC30-0D11-11E4-9191-0800200C9A66"
>  
>  static void nvdimm_build_common_dsm(Aml *dev,
>                                      NVDIMMState *nvdimm_state)
> @@ -1029,8 +1030,7 @@ static void nvdimm_build_common_dsm(Aml *dev,
>                 /* UUID for QEMU internal use */), expected_uuid));
>      aml_append(elsectx, ifctx);
>      elsectx2 = aml_else();
> -    aml_append(elsectx2, aml_store(
> -               aml_touuid("4309AC30-0D11-11E4-9191-0800200C9A66")
> +    aml_append(elsectx2, aml_store(aml_touuid(NVDIMM_DEVICE_DSM_UUID)
>                 /* UUID for NVDIMM Devices */, expected_uuid));
>      aml_append(elsectx, elsectx2);
>      aml_append(method, elsectx);


