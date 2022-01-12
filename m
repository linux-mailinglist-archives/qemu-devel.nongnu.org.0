Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 68B0148C6A0
	for <lists+qemu-devel@lfdr.de>; Wed, 12 Jan 2022 15:59:29 +0100 (CET)
Received: from localhost ([::1]:51608 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n7f60-0005vj-8F
	for lists+qemu-devel@lfdr.de; Wed, 12 Jan 2022 09:59:28 -0500
Received: from eggs.gnu.org ([209.51.188.92]:52212)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1n7drO-0000mX-S4
 for qemu-devel@nongnu.org; Wed, 12 Jan 2022 08:40:19 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:46666)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1n7dr6-0007XG-2X
 for qemu-devel@nongnu.org; Wed, 12 Jan 2022 08:40:01 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1641994798;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=IN5r9/MfKPp5O+JTuiejDGqevybKisedvkCOZxW9idk=;
 b=Wj9I28EtVV0ZNYptpJ4R/uDcQfR3MHDyb+33aTyGnmm/F2MpZ2SrIjpkDlQKbuSeh50GRz
 +wuLWyW3agnQl7WUSgBcIYwVfRmJ5q7VvIH5DYIx9slGjsmDH89+MoKy+K1Y54C/+/Dups
 CgdPxuTCfgxJO6zkQGnpeI5Mgiof5uI=
Received: from mail-ed1-f71.google.com (mail-ed1-f71.google.com
 [209.85.208.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-103-gozwe-YeMG2-8MMBQYlZFg-1; Wed, 12 Jan 2022 08:39:56 -0500
X-MC-Unique: gozwe-YeMG2-8MMBQYlZFg-1
Received: by mail-ed1-f71.google.com with SMTP id
 g2-20020a056402424200b003f8ee03207eso2299908edb.7
 for <qemu-devel@nongnu.org>; Wed, 12 Jan 2022 05:39:56 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=IN5r9/MfKPp5O+JTuiejDGqevybKisedvkCOZxW9idk=;
 b=GdCFi2o+CmPSTTnQ7yAA5NN9IkYYnj7r8ymHAAXtPLAQwOBiOGtDKFjeulyyNgFDYA
 7NNFTBEUplcopnLOkzmDLUxljHtcAiSChreiM+0RVfpJQ/h39xvbRRxVbSRLzca6s7uk
 YtEvT1fk3nByhiCdG65smYvWximscOnLWf6Jcq34z4rKIrkaol2n2xHea0frcqAMCFuU
 kMrMT7JndJPKpWvbTkW1DaVgNpY/TdnFHh3pJt838hFhSrjAKlypSyVKbFMCCy0l0xPy
 Y+zWr/fkSDA6pV9Fv7+0h7IV3k06098tXEipwlEMZQh5wEW1dF0nbk4JztGE8m3Pvk1M
 uXEw==
X-Gm-Message-State: AOAM530j2n+aIPMWhtj8T32AnrCRzPpdEpY14NBBiLXzXjhYZJ9vvdQK
 iQWCEdnWuZ7vYCVCot6BGHY63fSmBBsL2+nWvM4pImoJca25NrmaMTdOaUjHFc+h+SxAUfAxqwE
 sSxknQyDRQ20upuo=
X-Received: by 2002:a17:907:60c9:: with SMTP id
 hv9mr7432634ejc.681.1641994795681; 
 Wed, 12 Jan 2022 05:39:55 -0800 (PST)
X-Google-Smtp-Source: ABdhPJzYoONQLWJzcRynMmseit8VThYJNmRwvU2Tr1JHWdeCIBcWY/NRhy1kiuzOYX8UWth5UQaq+g==
X-Received: by 2002:a17:907:60c9:: with SMTP id
 hv9mr7432613ejc.681.1641994795465; 
 Wed, 12 Jan 2022 05:39:55 -0800 (PST)
Received: from redhat.com ([2.55.132.148])
 by smtp.gmail.com with ESMTPSA id c15sm341547edv.77.2022.01.12.05.39.53
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 12 Jan 2022 05:39:54 -0800 (PST)
Date: Wed, 12 Jan 2022 08:39:51 -0500
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Igor Mammedov <imammedo@redhat.com>
Subject: Re: [PATCH 3/4] acpi: fix OEM ID/OEM Table ID padding
Message-ID: <20220112083938-mutt-send-email-mst@kernel.org>
References: <20220112130332.1648664-1-imammedo@redhat.com>
 <20220112130332.1648664-4-imammedo@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20220112130332.1648664-4-imammedo@redhat.com>
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
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: Ani Sinha <ani@anisinha.ca>, qemu-stable@nongnu.org, qemu-devel@nongnu.org,
 "Dmitry V . Orekhov" <dima.orekhov@gmail.com>,
 Marian Postevca <posteuca@mutex.one>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Wed, Jan 12, 2022 at 08:03:31AM -0500, Igor Mammedov wrote:
> Commit [2] broke original '\0' padding of OEM ID and OEM Table ID
> fields in headers of ACPI tables. While it doesn't have impact on
> default values since QEMU uses 6 and 8 characters long values
> respectively, it broke usecase where IDs are provided on QEMU CLI.
> It shouldn't affect guest (but may cause licensing verification
> issues in guest OS).
> One of the broken usecases is user supplied SLIC table with IDs
> shorter than max possible length, where [2] mangles IDs with extra
> spaces in RSDT and FADT tables whereas guest OS expects those to
> mirror the respective values of the used SLIC table.
> 
> Fix it by replacing whitespace padding with '\0' padding in
> accordance with [1] and expectations of guest OS
> 
> 1) ACPI spec, v2.0b
>        17.2 AML Grammar Definition
>        ...
>        //OEM ID of up to 6 characters. If the OEM ID is
>        //shorter than 6 characters, it can be terminated
>        //with a NULL character.
> 
> 2)
> Fixes: 602b458201 ("acpi: Permit OEM ID and OEM table ID fields to be changed")


and add:

Fixes: https://gitlab.com/qemu-project/qemu/-/issues/707

?

> Resolves: https://gitlab.com/qemu-project/qemu/-/issues/707
> Reported-by: Dmitry V. Orekhov <dima.orekhov@gmail.com>
> Signed-off-by: Igor Mammedov <imammedo@redhat.com>
> Cc: qemu-stable@nongnu.org
> ---
>  hw/acpi/aml-build.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/hw/acpi/aml-build.c b/hw/acpi/aml-build.c
> index b3b3310df3..65148d5b9d 100644
> --- a/hw/acpi/aml-build.c
> +++ b/hw/acpi/aml-build.c
> @@ -1724,9 +1724,9 @@ void acpi_table_begin(AcpiTable *desc, GArray *array)
>      build_append_int_noprefix(array, 0, 4); /* Length */
>      build_append_int_noprefix(array, desc->rev, 1); /* Revision */
>      build_append_int_noprefix(array, 0, 1); /* Checksum */
> -    build_append_padded_str(array, desc->oem_id, 6, ' '); /* OEMID */
> +    build_append_padded_str(array, desc->oem_id, 6, '\0'); /* OEMID */
>      /* OEM Table ID */
> -    build_append_padded_str(array, desc->oem_table_id, 8, ' ');
> +    build_append_padded_str(array, desc->oem_table_id, 8, '\0');
>      build_append_int_noprefix(array, 1, 4); /* OEM Revision */
>      g_array_append_vals(array, ACPI_BUILD_APPNAME8, 4); /* Creator ID */
>      build_append_int_noprefix(array, 1, 4); /* Creator Revision */
> -- 
> 2.31.1


