Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E06484CD265
	for <lists+qemu-devel@lfdr.de>; Fri,  4 Mar 2022 11:29:33 +0100 (CET)
Received: from localhost ([::1]:44978 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nQ5Bk-0005lh-Vg
	for lists+qemu-devel@lfdr.de; Fri, 04 Mar 2022 05:29:33 -0500
Received: from eggs.gnu.org ([209.51.188.92]:41722)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1nQ591-0003YW-VZ
 for qemu-devel@nongnu.org; Fri, 04 Mar 2022 05:26:43 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:22175)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1nQ590-0007qA-4k
 for qemu-devel@nongnu.org; Fri, 04 Mar 2022 05:26:43 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1646389601;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=OOpJTizAUdq0EHiuLMBkJYB2iBFmp3Eo4R2DLtf78mo=;
 b=VQ/MN2mhd0ZOj2rqcpKbYD10m3+bbDwCtsF0XBrdRZXeaRN8FzX17WX6vauWOO5tNCatdm
 OysL5aq9N+9CFtDp2+K9A0EkvoAtVcRcNuU4RRqIhgOWH3fONfAPqjooFDpbMyZtfvA1OV
 TaI1k5U8/bxtojJBJ2/J3rdjQ7l/fc8=
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-207-Yu_jiTP5MHKg6BWa-ttH8w-1; Fri, 04 Mar 2022 05:26:40 -0500
X-MC-Unique: Yu_jiTP5MHKg6BWa-ttH8w-1
Received: by mail-wr1-f70.google.com with SMTP id
 o1-20020adfe801000000b001f023455317so3211398wrm.3
 for <qemu-devel@nongnu.org>; Fri, 04 Mar 2022 02:26:40 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=OOpJTizAUdq0EHiuLMBkJYB2iBFmp3Eo4R2DLtf78mo=;
 b=MLbu4/VamKK8SqKXBvTyg/hM/Jm7Z8uQrhp7f24qeCD6AmqvsZbyLcjRHs1AEFwvvM
 bDVE3v7lgKoYwhGwSsP39Nj1Zr2l1dz9K4xVC01rFPoKu9LW8RYm8XA9YcPDuUDHLKcK
 JHATarr0bBos5HNHuXKlq4B18TxBsXXJS7RjHZBqzI0LKw+ewRbGa29M5KIX5wXuv9R8
 5maz+GbSC6jWRcqmmAw978i/wdiX8fmvaCI8KNzcAazq0e1zbzQLKR+juccwtcC8oKs3
 TjRITc6EXaM8edqpuhcXbfYZwqJnLw7+LNKqXqshdOWzeNxkcfhAOL6ZfO/73ZGailP/
 vVeQ==
X-Gm-Message-State: AOAM530lLxVN9X9xKmcFL7KtqAdjbS0Mm+FXFxyshE9eqVQCBUkCchGx
 yFQH2ukGIyVGWCWcvXhp2lbhh+lfPfq2S8pQXrG2g4sQoE9KMLcCyjhXOX2X+tEDGV67aWTaNnY
 K5B0vK2tdncsRsE8=
X-Received: by 2002:a1c:a4c6:0:b0:389:7269:5044 with SMTP id
 n189-20020a1ca4c6000000b0038972695044mr3938322wme.129.1646389598893; 
 Fri, 04 Mar 2022 02:26:38 -0800 (PST)
X-Google-Smtp-Source: ABdhPJwZlN65MsEiJ2GxqcOUEd1q6jBVwSCmSeiTs1IqpjHy0gQUexAJeKiZNgDDHsWYo9Azx9X8gA==
X-Received: by 2002:a1c:a4c6:0:b0:389:7269:5044 with SMTP id
 n189-20020a1ca4c6000000b0038972695044mr3938304wme.129.1646389598667; 
 Fri, 04 Mar 2022 02:26:38 -0800 (PST)
Received: from redhat.com ([2.52.16.157]) by smtp.gmail.com with ESMTPSA id
 n5-20020a05600c3b8500b00380fc02ff76sm5101823wms.15.2022.03.04.02.26.37
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 04 Mar 2022 02:26:38 -0800 (PST)
Date: Fri, 4 Mar 2022 05:26:34 -0500
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Liav Albani <liavalb@gmail.com>
Subject: Re: [PATCH v4 0/3] hw/acpi: add indication for i8042 in IA-PC boot
 flags of the FADT table
Message-ID: <20220304052617-mutt-send-email-mst@kernel.org>
References: <20220228201733.714580-1-liavalb@gmail.com>
MIME-Version: 1.0
In-Reply-To: <20220228201733.714580-1-liavalb@gmail.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=mst@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=170.10.129.124; envelope-from=mst@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H5=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: ani@anisinha.ca, imammedo@redhat.com, shentey@gmail.com,
 qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Mon, Feb 28, 2022 at 10:17:30PM +0200, Liav Albani wrote:
> This can allow the guest OS to determine more easily if i8042 controller
> is present in the system or not, so it doesn't need to do probing of the
> controller, but just initialize it immediately, before enumerating the
> ACPI AML namespace.
> 
> To allow "flexible" indication, I don't hardcode the bit at location 1
> as on in the IA-PC boot flags, but try to search for i8042 on the ISA
> bus to verify it exists in the system.
> 
> Why this is useful you might ask - this patch allows the guest OS to
> probe and use the i8042 controller without decoding the ACPI AML blob
> at all. For example, as a developer of the SerenityOS kernel, I might
> want to allow people to not try to decode the ACPI AML namespace (for
> now, we still don't support ACPI AML as it's a work in progress), but
> still to not probe for the i8042 but just use it after looking in the
> IA-PC boot flags in the ACPI FADT table.

OK still waiting for v5.

> Liav Albani (3):
>   tests/acpi: i386: allow FACP acpi table changes
>   hw/acpi: add indication for i8042 in IA-PC boot flags of the FADT
>     table
>   tests/acpi: i386: update FACP table differences
> 
>  hw/acpi/aml-build.c            |  11 ++++++++++-
>  hw/i386/acpi-build.c           |   9 +++++++++
>  hw/i386/acpi-microvm.c         |   9 +++++++++
>  include/hw/acpi/acpi-defs.h    |   1 +
>  tests/data/acpi/q35/FACP       | Bin 244 -> 244 bytes
>  tests/data/acpi/q35/FACP.nosmm | Bin 244 -> 244 bytes
>  tests/data/acpi/q35/FACP.slic  | Bin 244 -> 244 bytes
>  tests/data/acpi/q35/FACP.xapic | Bin 244 -> 244 bytes
>  8 files changed, 29 insertions(+), 1 deletion(-)
> 
> -- 
> 2.35.1


