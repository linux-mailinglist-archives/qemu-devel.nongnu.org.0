Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9053948615B
	for <lists+qemu-devel@lfdr.de>; Thu,  6 Jan 2022 09:22:01 +0100 (CET)
Received: from localhost ([::1]:60820 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n5O24-0002wT-K5
	for lists+qemu-devel@lfdr.de; Thu, 06 Jan 2022 03:22:00 -0500
Received: from eggs.gnu.org ([209.51.188.92]:57500)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imammedo@redhat.com>)
 id 1n5Nqr-0007AT-Vq
 for qemu-devel@nongnu.org; Thu, 06 Jan 2022 03:10:27 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:32361)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imammedo@redhat.com>)
 id 1n5Nqp-0004eD-7z
 for qemu-devel@nongnu.org; Thu, 06 Jan 2022 03:10:24 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1641456621;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=VQYWkDgVUZL4YkbSHHNimLszyM82MDxGbpDpB+wW8hU=;
 b=MROx2Q+YwbkWBpD3Yc2T+vj1R2AS+buEiRZDLBuYiLCqTB4iuSyMFQaKzdw/9iKSeXNYVF
 Iemex00OOI+PpsYaklzqZDboLA6Jt37HGGVVr4aFKEVtxkZ0FgPxNATxRWmS47rVtR3F/k
 mzfYZQgdFmXY27v11rDaL4kjHLxwNYk=
Received: from mail-ed1-f72.google.com (mail-ed1-f72.google.com
 [209.85.208.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-320-zpJvstv3N26_CRp4hXqUhw-1; Thu, 06 Jan 2022 03:10:20 -0500
X-MC-Unique: zpJvstv3N26_CRp4hXqUhw-1
Received: by mail-ed1-f72.google.com with SMTP id
 g2-20020a056402424200b003f8ee03207eso1377997edb.7
 for <qemu-devel@nongnu.org>; Thu, 06 Jan 2022 00:10:20 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=VQYWkDgVUZL4YkbSHHNimLszyM82MDxGbpDpB+wW8hU=;
 b=bz1KNSorUfdWVQ3JgjovvgELEluy+9HnWdjcgbGL+J2+R2uIf821tj3uzIe4hyHaya
 5UQpKSTbXQ5E65fbtBt2WVlinThdlpixQr13/Q1LBMDqI72kNZxf9gP+GcMBCAlBRlFb
 fFErKQdy+4vK9VxYy2cm4cWodbvUwkTjDRwEvwrn+lcZXF1RGL3d5prBdhltWDCjNOpT
 Jr4E5gNN37yc0GVl7e7/JvGzEUSTVuYs37RsjdDYxR0cryToIHYTiu31UMx2KQT9fXzu
 Z95oKaWDtrsuTgA83n5LtIfsVftQj8MV/dcBYTxQ7aUm0nH/k0gdDp85d3qA22EP6SbZ
 wIkw==
X-Gm-Message-State: AOAM5307/AlHf+bR+5S17ZUhXUMWQCJWw1oGOs0l4EEiNbnA/SFr+I9C
 txbCgxo/Fjwp2VDRl1X6jizDJejO2ibO7QNbYsKox4gbo2KqI0CYpMrt92/Qak3hPLsOznvK5QJ
 XrR3sejcHmeYhHxQ=
X-Received: by 2002:a05:6402:70e:: with SMTP id
 w14mr57538131edx.325.1641456619115; 
 Thu, 06 Jan 2022 00:10:19 -0800 (PST)
X-Google-Smtp-Source: ABdhPJxMIAcqbzaEw4MUXrpAJuHy5skHnvw/hiDh4lfloj6DManYRmk0azDbUEquvcXoBZR4LJP7vQ==
X-Received: by 2002:a05:6402:70e:: with SMTP id
 w14mr57538116edx.325.1641456618916; 
 Thu, 06 Jan 2022 00:10:18 -0800 (PST)
Received: from localhost (nat-pool-brq-t.redhat.com. [213.175.37.10])
 by smtp.gmail.com with ESMTPSA id gn11sm306797ejc.67.2022.01.06.00.10.18
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 06 Jan 2022 00:10:18 -0800 (PST)
Date: Thu, 6 Jan 2022 09:10:17 +0100
From: Igor Mammedov <imammedo@redhat.com>
To: Thomas Huth <thuth@redhat.com>
Subject: Re: [PATCH for-7.0] hw/i386/pc: Add missing property descriptions
Message-ID: <20220106091017.6e7ce1af@redhat.com>
In-Reply-To: <20211206134255.94784-1-thuth@redhat.com>
References: <20211206134255.94784-1-thuth@redhat.com>
X-Mailer: Claws Mail 4.0.0 (GTK+ 3.24.31; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=imammedo@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=imammedo@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.372,
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
Cc: Eduardo Habkost <eduardo@habkost.net>, Paolo Bonzini <pbonzini@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org,
 "Michael S. Tsirkin" <mst@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Mon,  6 Dec 2021 14:42:55 +0100
Thomas Huth <thuth@redhat.com> wrote:

> When running "qemu-system-x86_64 -M pc,help" I noticed that some
> properties were still missing their description. Add them now so
> that users get at least a slightly better idea what they are all
> about.
> 
> Signed-off-by: Thomas Huth <thuth@redhat.com>

Reviewed-by: Igor Mammedov <imammedo@redhat.com>

> ---
>  hw/i386/pc.c | 8 ++++++++
>  1 file changed, 8 insertions(+)
> 
> diff --git a/hw/i386/pc.c b/hw/i386/pc.c
> index a2ef40ecbc..837f2bff4e 100644
> --- a/hw/i386/pc.c
> +++ b/hw/i386/pc.c
> @@ -1734,15 +1734,23 @@ static void pc_machine_class_init(ObjectClass *oc, void *data)
>  
>      object_class_property_add_bool(oc, PC_MACHINE_SMBUS,
>          pc_machine_get_smbus, pc_machine_set_smbus);
> +    object_class_property_set_description(oc, PC_MACHINE_SMBUS,
> +        "Enable/disable system management bus");
>  
>      object_class_property_add_bool(oc, PC_MACHINE_SATA,
>          pc_machine_get_sata, pc_machine_set_sata);
> +    object_class_property_set_description(oc, PC_MACHINE_SATA,
> +        "Enable/disable Serial ATA bus");
>  
>      object_class_property_add_bool(oc, PC_MACHINE_PIT,
>          pc_machine_get_pit, pc_machine_set_pit);
> +    object_class_property_set_description(oc, PC_MACHINE_PIT,
> +        "Enable/disable Intel 8254 programmable interval timer emulation");
>  
>      object_class_property_add_bool(oc, "hpet",
>          pc_machine_get_hpet, pc_machine_set_hpet);
> +    object_class_property_set_description(oc, "hpet",
> +        "Enable/disable high precision event timer emulation");
>  
>      object_class_property_add_bool(oc, "default-bus-bypass-iommu",
>          pc_machine_get_default_bus_bypass_iommu,


