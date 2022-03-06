Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 96D654CEDF7
	for <lists+qemu-devel@lfdr.de>; Sun,  6 Mar 2022 22:37:34 +0100 (CET)
Received: from localhost ([::1]:36958 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nQyZJ-0002Cy-NM
	for lists+qemu-devel@lfdr.de; Sun, 06 Mar 2022 16:37:33 -0500
Received: from eggs.gnu.org ([209.51.188.92]:34318)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1nQyYV-0001V7-Gf
 for qemu-devel@nongnu.org; Sun, 06 Mar 2022 16:36:43 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:32800)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1nQyYT-0001Cd-R6
 for qemu-devel@nongnu.org; Sun, 06 Mar 2022 16:36:43 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1646602601;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=AoyA4dPJSXdZTo3sCUT/3zd6GwbHvbkIRh0kLJJAHWw=;
 b=U4XXG6Fy75qV+7dZTC5SgipXizhBYPxonBUsBEPIpQvfGd5oIc8aZAIkilOWu70WSg3ZhZ
 2ym1gJgJkFBVet6mqFRNdHkqoCvPcQZ1QPjHmwNwrmrJ/S6QElx9qJpOrF2w9X5kWQoOMN
 YhdnEHuQCVJCIUwgoGQ/RbW6+aawgZw=
Received: from mail-ed1-f69.google.com (mail-ed1-f69.google.com
 [209.85.208.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-370-yY02jxIANkSotzlPQzZTGA-1; Sun, 06 Mar 2022 16:36:40 -0500
X-MC-Unique: yY02jxIANkSotzlPQzZTGA-1
Received: by mail-ed1-f69.google.com with SMTP id
 n11-20020aa7c68b000000b0041641550e11so997380edq.8
 for <qemu-devel@nongnu.org>; Sun, 06 Mar 2022 13:36:39 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=AoyA4dPJSXdZTo3sCUT/3zd6GwbHvbkIRh0kLJJAHWw=;
 b=nwP7tQTlSz+46Diz/Sqe9BhkXBlBq04kIRqGjJIm3abmhJRQq09jLN5lknXiot2U0F
 s9fsvTGD7uyu1nKFXQ4r1iUqlhgHSzavichiBU1pbQx3vak9MNFupBRlyvcN0akgD6+e
 1w7v0lkNoF3JTLVpii1yhCgIkl4u4aE8xCf60JRpXrIZofOG8RpLEyqQVHZmQqu8Reb8
 TlzpfqCU2zrMa78k6MqewRWoz3dB7Um9RRQdaUFZmtPwYvdzoRT1pWTZB8oOaN5MAvge
 veNO+2pPf3u+nwhYVbBVNLDcV4BwXgY6WOtJcGHI+IAD6fdbAtIxnzCbsmSGMepbRGvc
 maxA==
X-Gm-Message-State: AOAM532JwOQR4iJ2AjEtvEkPu3n0yY5wRjbhGdRpUEgum0UK4oX6pdzC
 /dEOhrC38jWY09LR6C3qDDlwEgFrLTi6fJvn2Yo107yvIUWT8nVoC1hnyhaKYnJ4wsh04yiunQC
 FcK+OeNaacK9duLg=
X-Received: by 2002:a17:907:2daa:b0:6da:924e:955 with SMTP id
 gt42-20020a1709072daa00b006da924e0955mr7149587ejc.1.1646602598677; 
 Sun, 06 Mar 2022 13:36:38 -0800 (PST)
X-Google-Smtp-Source: ABdhPJybRCMQQqb2XxYpXBZrbCdfBpRahnI/WfxTSBVb/M22R6WIJOD/1SEUewGueFLj8I8lKH0usA==
X-Received: by 2002:a17:907:2daa:b0:6da:924e:955 with SMTP id
 gt42-20020a1709072daa00b006da924e0955mr7149576ejc.1.1646602598368; 
 Sun, 06 Mar 2022 13:36:38 -0800 (PST)
Received: from redhat.com ([2.55.138.228]) by smtp.gmail.com with ESMTPSA id
 ep16-20020a1709069b5000b006daa26de2fbsm3539718ejc.153.2022.03.06.13.36.36
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 06 Mar 2022 13:36:37 -0800 (PST)
Date: Sun, 6 Mar 2022 16:36:34 -0500
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Ani Sinha <ani@anisinha.ca>
Subject: Re: [PATCH v7 0/4] hw/acpi: add indication for i8042 in IA-PC boot
 flags of the FADT table
Message-ID: <20220306163605-mutt-send-email-mst@kernel.org>
References: <20220304154032.2071585-1-ani@anisinha.ca>
MIME-Version: 1.0
In-Reply-To: <20220304154032.2071585-1-ani@anisinha.ca>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=mst@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=170.10.133.124; envelope-from=mst@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H5=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: imammedo@redhat.com, qemu-devel@nongnu.org, liavalb@gmail.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Fri, Mar 04, 2022 at 09:10:28PM +0530, Ani Sinha wrote:
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

I wonder how will such a guest work on an existing qemu release then.

> Changelog:
> v7:
> fixed a compilation issue. the fix was not committed when running "make check"
> v6:
> addressed comments from v5. added microvm changes too as a part of this series.
> v5:
> Addressed review comments from v4. Also got rid of microvm changes. Will send
> them in a separate patch.
> 
> 
> 
> Ani Sinha (1):
>   hw/acpi/microvm: turn on 8042 bit in FADT boot architecture flags if
>     present
> 
> Liav Albani (3):
>   tests/acpi: i386: allow FACP acpi table changes
>   hw/acpi: add indication for i8042 in IA-PC boot flags of the FADT
>     table
>   tests/acpi: i386: update FACP table differences
> 
>  hw/acpi/aml-build.c            |   8 +++++++-
>  hw/i386/acpi-build.c           |   8 ++++++++
>  hw/i386/acpi-microvm.c         |   6 ++++++
>  include/hw/acpi/acpi-defs.h    |   1 +
>  include/hw/input/i8042.h       |  15 +++++++++++++++
>  tests/data/acpi/q35/FACP       | Bin 244 -> 244 bytes
>  tests/data/acpi/q35/FACP.nosmm | Bin 244 -> 244 bytes
>  tests/data/acpi/q35/FACP.slic  | Bin 244 -> 244 bytes
>  tests/data/acpi/q35/FACP.xapic | Bin 244 -> 244 bytes
>  9 files changed, 37 insertions(+), 1 deletion(-)
> 
> -- 
> 2.25.1


