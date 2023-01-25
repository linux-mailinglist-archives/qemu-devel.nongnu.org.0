Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8972C67B762
	for <lists+qemu-devel@lfdr.de>; Wed, 25 Jan 2023 17:53:41 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pKj1V-0001hp-4L; Wed, 25 Jan 2023 11:53:21 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imammedo@redhat.com>)
 id 1pKj1S-0001gp-Pk
 for qemu-devel@nongnu.org; Wed, 25 Jan 2023 11:53:18 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imammedo@redhat.com>)
 id 1pKj1R-00087P-B2
 for qemu-devel@nongnu.org; Wed, 25 Jan 2023 11:53:18 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1674665596;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=klg7LOllfPUUEbbOuwLfbcdLuVLjd9yg4x31NJqfWC4=;
 b=FiC3YqwKH7VFOz4BvPag/n+1fxQkhoschxCFDO1kNLTC81p3NXfkUKVgoxli9UMxb4I/Lz
 x/lG6i6GBfLkev9R4QXlHj9MAbMCQ5/h1rDbRdOuN0AThm5Wu9GErGsABlUMaAacaK6oqs
 hbNfGjpgWba4bG9PSZjxWm0es6Mbmgo=
Received: from mail-ed1-f69.google.com (mail-ed1-f69.google.com
 [209.85.208.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-327-oHcaJBNkPnOXcrgA2bzjhQ-1; Wed, 25 Jan 2023 11:53:15 -0500
X-MC-Unique: oHcaJBNkPnOXcrgA2bzjhQ-1
Received: by mail-ed1-f69.google.com with SMTP id
 s14-20020a056402520e00b0049e0bea1c3fso13256465edd.3
 for <qemu-devel@nongnu.org>; Wed, 25 Jan 2023 08:53:14 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:subject:cc:to:from:date:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=klg7LOllfPUUEbbOuwLfbcdLuVLjd9yg4x31NJqfWC4=;
 b=OVffqoPF2SkA9y606NV9CQdR93VL+6Osf+YyiDjUwnosgOwO6NtNEj/b10Gfzm4mrY
 HPMKL0r+60xiovReBQBJvBnHB4M1YvyCUWaD7Gwj9HPOqWez77ukbgT6qvZcCsjPuvmA
 yUUQq4yAK57T9HCzASmwqySnf4LYj5NVDfCmyRoA6k4j7dN97YTyppEnR9REbB7oVzM+
 WDynZ5KuK26hxGjv99ctPtwrdtEiu+iYmswvPS9RG8HsTtYKWxrRLkqq/kVGanbCDyNJ
 GZ5oTS3q4VBkJZLjKxbcD+1O5wTa3OxLqjsYAoT/iik+OksuelSgjWQNo8I58ZjMmlMH
 vmPw==
X-Gm-Message-State: AFqh2krlj+rDz7CU5GXrCadehMU9CA/kO+FqQwtuS8TTJ+nuejcIKuwm
 ZfJYC9iyGpSaMIpkpnzRzFPhJI0PtKPGsSBzKVtzZb+t12JHFvwEBX4hexCRj3tcNUvnaCp2qft
 gLo156rbrLFnVY6w=
X-Received: by 2002:a05:6402:449a:b0:499:d1ca:6d83 with SMTP id
 er26-20020a056402449a00b00499d1ca6d83mr34933697edb.2.1674665593950; 
 Wed, 25 Jan 2023 08:53:13 -0800 (PST)
X-Google-Smtp-Source: AMrXdXs8CMHR1bo2LsKglE1fEgfPncPb8rdikZ/53IXIDIAxR0NEBBJ33svMyAJ4mjvCV6NGi2MRBQ==
X-Received: by 2002:a05:6402:449a:b0:499:d1ca:6d83 with SMTP id
 er26-20020a056402449a00b00499d1ca6d83mr34933691edb.2.1674665593810; 
 Wed, 25 Jan 2023 08:53:13 -0800 (PST)
Received: from imammedo.users.ipa.redhat.com (nat-pool-brq-t.redhat.com.
 [213.175.37.10]) by smtp.gmail.com with ESMTPSA id
 b8-20020aa7c908000000b00482e0c55e2bsm2172720edt.93.2023.01.25.08.53.11
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 25 Jan 2023 08:53:11 -0800 (PST)
Date: Wed, 25 Jan 2023 17:53:10 +0100
From: Igor Mammedov <imammedo@redhat.com>
To: Bernhard Beschow <shentey@gmail.com>
Cc: qemu-devel@nongnu.org, Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Philippe =?UTF-8?B?TWF0aGlldS1EYXVkw6k=?= <philmd@linaro.org>, Ani Sinha
 <ani@anisinha.ca>, "Michael S. Tsirkin" <mst@redhat.com>, Aurelien Jarno
 <aurelien@aurel32.net>
Subject: Re: [PATCH 0/7] ACPI controller cleanup
Message-ID: <20230125175310.6c96b5de@imammedo.users.ipa.redhat.com>
In-Reply-To: <20230122170724.21868-1-shentey@gmail.com>
References: <20230122170724.21868-1-shentey@gmail.com>
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.36; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=imammedo@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

On Sun, 22 Jan 2023 18:07:17 +0100
Bernhard Beschow <shentey@gmail.com> wrote:

> This series brings the PIIX4 PM device closer to reality and resolves some
> redundant code along the way.

I'm done with this series review

> 
> Testing done:
> - `make check`
> - Starting a live CD under pc and q35 machines and check that the GPE accesses
>   are traced
> 
> Bernhard Beschow (7):
>   hw/acpi/{ich9,piix4}: Reuse existing attributes for QOM properties
>   hw/acpi/ich9: Remove unneeded assignments
>   hw/acpi/{ich9,piix4}: Resolve redundant io_base address attributes
>   hw/acpi/ich9: Use ICH9_PMIO_GPE0_STS just once
>   hw/acpi/piix4: Fix offset of GPE0 registers
>   hw/acpi: Trace GPE access in all device models, not just PIIX4
>   hw/acpi/core: Trace enable and status registers of GPE separately
> 
>  include/hw/acpi/ich9.h  |  1 -
>  include/hw/acpi/piix4.h |  3 +--
>  hw/acpi/core.c          |  9 +++++++++
>  hw/acpi/ich9.c          | 26 ++++++++++++--------------
>  hw/acpi/piix4.c         | 31 ++++++++++++++++---------------
>  hw/acpi/trace-events    | 10 ++++++----
>  6 files changed, 44 insertions(+), 36 deletions(-)
> 


