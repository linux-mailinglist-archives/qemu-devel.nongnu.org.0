Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 885F5526278
	for <lists+qemu-devel@lfdr.de>; Fri, 13 May 2022 14:59:47 +0200 (CEST)
Received: from localhost ([::1]:39550 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1npUtW-0004ef-Ld
	for lists+qemu-devel@lfdr.de; Fri, 13 May 2022 08:59:46 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58330)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1npUZz-0007Yf-9C
 for qemu-devel@nongnu.org; Fri, 13 May 2022 08:39:35 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:55914)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1npUZu-0000XM-Qd
 for qemu-devel@nongnu.org; Fri, 13 May 2022 08:39:32 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1652445570;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=urE8tZ6iaG1r4Fs/lwH2212u0XhKGb6OtoHOOD5KxQY=;
 b=D5uCwXoHhcP03JjMYSi8WkZ/KeVb7OPD9a7Pb9AI7RaU6JjhjkEL4inFTRCJPQ8oWRCLjx
 fGgJ+/V2DaQ49Znh4mAUSGajH4VJtSHR6XQQ4YMFvyfDdiq680COi+pTPLLEbrgD3vIJtS
 VaRJsDZb0xgT2iHCRn1eVnxa5YL2Sek=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-496-epZcGFgkN1WANFHcyLK7hQ-1; Fri, 13 May 2022 08:39:28 -0400
X-MC-Unique: epZcGFgkN1WANFHcyLK7hQ-1
Received: by mail-wm1-f69.google.com with SMTP id
 u3-20020a05600c210300b0039430c7665eso2983460wml.2
 for <qemu-devel@nongnu.org>; Fri, 13 May 2022 05:39:28 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=urE8tZ6iaG1r4Fs/lwH2212u0XhKGb6OtoHOOD5KxQY=;
 b=3S84jdIU5tTgPkuCLxNSSlKzKXLtrROj4Sbvt6+x1yhh3l3xDgUUXu06dgByP6otv0
 2cJUUqeUn5QmSCrvva50YJSDwyE3DtMNobjPEAmKF7zNJ6/WzMVVhXEvMkJ3HAtbyY4Q
 zGRlG4XBDj73MoD4vQT3/y0+8FSs72PWdJpq9yh3a8aZCiy6rInikl67MZbW4YEvDnva
 swwZcrP/DfKpKUxvXDdMTmtJEk/JGFkkfluBruCWGvzLzURnb9mF3bDdOupuYJSoGA0w
 8EESXBzVPPD3dVM8mxnodlIm9vylUbPy8z4IxQNteNbdzrGmPnzQ+iGJ57L3xZ3zgFhP
 cvUQ==
X-Gm-Message-State: AOAM531v1YbiiZFFBqFCzy1MVyCLlhPd0x8eeiYn7CFwZyprOwInOYAE
 xfKG67OblDUiGETvFH0YE15RHUxyICrnLUVjhDn3ADZ4T2zDfhRQm+N5u2JYLKcDiWhYbvHCqZV
 4QA+oi879+oqlqQA=
X-Received: by 2002:a5d:4e42:0:b0:20a:d87f:84ee with SMTP id
 r2-20020a5d4e42000000b0020ad87f84eemr3893361wrt.593.1652445567383; 
 Fri, 13 May 2022 05:39:27 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxwc0Vc7tc+SpL34sPZwIQkOHxTcR6AP6cfj7dc5+RPt2ahL9BFoQ2F5dZLR5FNLNIgfUb4Cw==
X-Received: by 2002:a5d:4e42:0:b0:20a:d87f:84ee with SMTP id
 r2-20020a5d4e42000000b0020ad87f84eemr3893351wrt.593.1652445567190; 
 Fri, 13 May 2022 05:39:27 -0700 (PDT)
Received: from redhat.com ([2.53.15.195]) by smtp.gmail.com with ESMTPSA id
 x13-20020a7bc20d000000b0039429bfebebsm5597566wmi.3.2022.05.13.05.39.24
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 13 May 2022 05:39:26 -0700 (PDT)
Date: Fri, 13 May 2022 08:39:22 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Robert Hoo <robert.hu@linux.intel.com>
Cc: xiaoguangrong.eric@gmail.com, imammedo@redhat.com, ani@anisinha.ca,
 qemu-devel@nongnu.org, dan.j.williams@intel.com,
 jingqi.liu@intel.com, robert.hu@intel.com
Subject: Re: [PATCH 2/2] acpi/nvdimm: Fix aml_or() and aml_and() in if clause
Message-ID: <20220513083832-mutt-send-email-mst@kernel.org>
References: <20220412065753.3216538-1-robert.hu@linux.intel.com>
 <20220412065753.3216538-3-robert.hu@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220412065753.3216538-3-robert.hu@linux.intel.com>
Received-SPF: pass client-ip=170.10.133.124; envelope-from=mst@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
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

On Tue, Apr 12, 2022 at 02:57:53PM +0800, Robert Hoo wrote:
> It should be some typo originally, where in If condition, using bitwise
> and/or, rather than logical and/or.
> 
> The resulting change in AML code:
> 
> If (((Local6 == Zero) | (Arg0 != Local0)))
> ==>
> If (((Local6 == Zero) || (Arg0 != Local0)))
> 
> If (((ObjectType (Arg3) == 0x04) & (SizeOf (Arg3) == One)))
> ==>
> If (((ObjectType (Arg3) == 0x04) && (SizeOf (Arg3) == One)))
> 
> Fixes: 90623ebf603 ("nvdimm acpi: check UUID")
> Fixes: 4568c948066 ("nvdimm acpi: save arg3 of _DSM method")
> Signed-off-by: Robert Hoo <robert.hu@linux.intel.com>
> Reviewed-by: Jingqi Liu <jingqi.liu@intel.com>

This changes existing AML, you need to do the dance
with updating bios test tables, see header of ./tests/qtest/bios-tables-test.c

> ---
>  hw/acpi/nvdimm.c | 7 +++----
>  1 file changed, 3 insertions(+), 4 deletions(-)
> 
> diff --git a/hw/acpi/nvdimm.c b/hw/acpi/nvdimm.c
> index 7cc419401b..2cd26bb9e9 100644
> --- a/hw/acpi/nvdimm.c
> +++ b/hw/acpi/nvdimm.c
> @@ -1040,7 +1040,7 @@ static void nvdimm_build_common_dsm(Aml *dev,
>  
>      uuid_invalid = aml_lnot(aml_equal(uuid, expected_uuid));
>  
> -    unsupport = aml_if(aml_or(unpatched, uuid_invalid, NULL));
> +    unsupport = aml_if(aml_lor(unpatched, uuid_invalid));
>  
>      /*
>       * function 0 is called to inquire what functions are supported by
> @@ -1072,10 +1072,9 @@ static void nvdimm_build_common_dsm(Aml *dev,
>       * in the DSM Spec.
>       */
>      pckg = aml_arg(3);
> -    ifctx = aml_if(aml_and(aml_equal(aml_object_type(pckg),
> +    ifctx = aml_if(aml_land(aml_equal(aml_object_type(pckg),
>                     aml_int(4 /* Package */)) /* It is a Package? */,
> -                   aml_equal(aml_sizeof(pckg), aml_int(1)) /* 1 element? */,
> -                   NULL));
> +                   aml_equal(aml_sizeof(pckg), aml_int(1)) /* 1 element? */));
>  
>      pckg_index = aml_local(2);
>      pckg_buf = aml_local(3);
> -- 
> 2.31.1


