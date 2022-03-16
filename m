Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4F6C24DACFF
	for <lists+qemu-devel@lfdr.de>; Wed, 16 Mar 2022 09:57:01 +0100 (CET)
Received: from localhost ([::1]:51916 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nUPSl-0002Ua-Fv
	for lists+qemu-devel@lfdr.de; Wed, 16 Mar 2022 04:56:59 -0400
Received: from eggs.gnu.org ([209.51.188.92]:60762)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1nUPRE-0001Ky-W4
 for qemu-devel@nongnu.org; Wed, 16 Mar 2022 04:55:27 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:30546)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1nUPRC-0007JO-94
 for qemu-devel@nongnu.org; Wed, 16 Mar 2022 04:55:23 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1647420920;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=nmDxAMB1a5pksi7mOsO0cYJKloGQpQjA732Lz70PxAs=;
 b=Ocsm9CT8JdfCImpFMepJfkd6qM2vUwVi5zZE+HGer+w8RfHknoQ3bhYdzYBO1QRt7gQs4Q
 wTPUZdGiusqpUqJrTyJnYpe74UQecL2xq0gfgx9/eAn4ifxOuf82eQrTgyg/hwb5iPP5eY
 anNwjJiBMHJPBUDSjmWMhvztXNjQ34M=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-379-DYWql9fUNjeeDOpxpVSRBA-1; Wed, 16 Mar 2022 04:55:17 -0400
X-MC-Unique: DYWql9fUNjeeDOpxpVSRBA-1
Received: by mail-wm1-f69.google.com with SMTP id
 l1-20020a1c2501000000b00389c7b9254cso1830946wml.1
 for <qemu-devel@nongnu.org>; Wed, 16 Mar 2022 01:55:17 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=nmDxAMB1a5pksi7mOsO0cYJKloGQpQjA732Lz70PxAs=;
 b=CS/tY6GOBjwo3MzlHldwSIiFIaJz8flvNflKTTDuwT9AVNuUYSQTLXzT7oo3+505hM
 SEKm3Cr0a26IrfV0+6I1Z6c1bo2essEWfYzHw7sf3TYUomHqmwtA4L5c6PF0Y+WiiNK8
 MT8L2abiwLMs1S5kwvpG+fjIECguJGLw5Q1No8IFaYmMXnV7BFMZXgwTanP64dUpT8tc
 qNz/qH/CqV0H9H25MWC+0+Avs6wWJDLtLGOcPDpxY/KcySZEQH0lkW+s5vUJiChZpKB9
 CzXak0h41IcWKESEm6GWkXcVD7qkW9XNDmHAQusI/IQ7wz/8MvGrmrN7ju2svX9hH9En
 M8PQ==
X-Gm-Message-State: AOAM531nNDKHNBEOmGzwCICkHBgN6VIUdDwue8XR2R0DWqImH1ivJCAG
 ZQw+bDIlCT9O9Hi5Fju8/AOqYv14bt7sJ0510+kaww8HbBmSn02gZ9AG1NQLOCuP5NZ2bJ8LyCt
 1PR50O2MnrUt+vXw=
X-Received: by 2002:a1c:e90a:0:b0:381:504e:b57d with SMTP id
 q10-20020a1ce90a000000b00381504eb57dmr6427024wmc.177.1647420916594; 
 Wed, 16 Mar 2022 01:55:16 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJw6AKr7RRbUBY7+GkpnUVHujycz5Sn/adEJ4l8YydmKC+roqDLZUDTrp5PFqgZqBrv5oqA1HA==
X-Received: by 2002:a1c:e90a:0:b0:381:504e:b57d with SMTP id
 q10-20020a1ce90a000000b00381504eb57dmr6427002wmc.177.1647420916360; 
 Wed, 16 Mar 2022 01:55:16 -0700 (PDT)
Received: from redhat.com ([2.53.2.35]) by smtp.gmail.com with ESMTPSA id
 c4-20020adffb04000000b001f0494de239sm1115323wrr.21.2022.03.16.01.55.13
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 16 Mar 2022 01:55:15 -0700 (PDT)
Date: Wed, 16 Mar 2022 04:55:11 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Andrew Deason <adeason@sinenomine.net>
Subject: Re: [PATCH v3 2/3] hw/i386/acpi-build: Avoid 'sun' identifier
Message-ID: <20220316045448-mutt-send-email-mst@kernel.org>
References: <20220316035227.3702-1-adeason@sinenomine.net>
 <20220316035227.3702-3-adeason@sinenomine.net>
MIME-Version: 1.0
In-Reply-To: <20220316035227.3702-3-adeason@sinenomine.net>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=mst@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=170.10.129.124; envelope-from=mst@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
Cc: Eduardo Habkost <eduardo@habkost.net>,
 Peter Maydell <peter.maydell@linaro.org>,
 Daniel P =?iso-8859-1?Q?=2E_Berrang=E9?= <berrange@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org,
 Paolo Bonzini <pbonzini@redhat.com>, Ani Sinha <ani@anisinha.ca>,
 Igor Mammedov <imammedo@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Tue, Mar 15, 2022 at 10:52:26PM -0500, Andrew Deason wrote:
> On Solaris, 'sun' is #define'd to 1, which causes errors if a variable
> is named 'sun'. Slightly change the name of the var for the Slot User
> Number so we can build on Solaris.
> 
> Reviewed-by: Ani Sinha <ani@anisinha.ca>
> Signed-off-by: Andrew Deason <adeason@sinenomine.net>


Reviewed-by: Michael S. Tsirkin <mst@redhat.com>


> ---
>  hw/i386/acpi-build.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/hw/i386/acpi-build.c b/hw/i386/acpi-build.c
> index 4ad4d7286c..dcf6ece3d0 100644
> --- a/hw/i386/acpi-build.c
> +++ b/hw/i386/acpi-build.c
> @@ -576,32 +576,32 @@ static void build_append_pci_bus_devices(Aml *parent_scope, PCIBus *bus,
>  }
>  
>  Aml *aml_pci_device_dsm(void)
>  {
>      Aml *method, *UUID, *ifctx, *ifctx1, *ifctx2, *ifctx3, *elsectx;
>      Aml *acpi_index = aml_local(0);
>      Aml *zero = aml_int(0);
>      Aml *bnum = aml_arg(4);
>      Aml *func = aml_arg(2);
>      Aml *rev = aml_arg(1);
> -    Aml *sun = aml_arg(5);
> +    Aml *sunum = aml_arg(5);
>  
>      method = aml_method("PDSM", 6, AML_SERIALIZED);
>  
>      /*
>       * PCI Firmware Specification 3.1
>       * 4.6.  _DSM Definitions for PCI
>       */
>      UUID = aml_touuid("E5C937D0-3553-4D7A-9117-EA4D19C3434D");
>      ifctx = aml_if(aml_equal(aml_arg(0), UUID));
>      {
> -        aml_append(ifctx, aml_store(aml_call2("AIDX", bnum, sun), acpi_index));
> +        aml_append(ifctx, aml_store(aml_call2("AIDX", bnum, sunum), acpi_index));
>          ifctx1 = aml_if(aml_equal(func, zero));
>          {
>              uint8_t byte_list[1];
>  
>              ifctx2 = aml_if(aml_equal(rev, aml_int(2)));
>              {
>                  /*
>                   * advertise function 7 if device has acpi-index
>                   * acpi_index values:
>                   *            0: not present (default value)
> -- 
> 2.11.0


