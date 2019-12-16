Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A026A1206C4
	for <lists+qemu-devel@lfdr.de>; Mon, 16 Dec 2019 14:15:01 +0100 (CET)
Received: from localhost ([::1]:53544 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1igqDE-00050t-Mf
	for lists+qemu-devel@lfdr.de; Mon, 16 Dec 2019 08:15:00 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:40899)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <pbonzini@redhat.com>) id 1igqA8-0001nE-0D
 for qemu-devel@nongnu.org; Mon, 16 Dec 2019 08:11:48 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <pbonzini@redhat.com>) id 1igqA6-0006sm-SS
 for qemu-devel@nongnu.org; Mon, 16 Dec 2019 08:11:47 -0500
Received: from us-smtp-delivery-1.mimecast.com ([207.211.31.120]:52551
 helo=us-smtp-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <pbonzini@redhat.com>) id 1igqA6-0006rB-Ki
 for qemu-devel@nongnu.org; Mon, 16 Dec 2019 08:11:46 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1576501905;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=/5vHxeCZJ0xVZEMwUtEzCnwTU4HB2NgrECx9MicRG6o=;
 b=TytO/BjuGEyYrAjULA8RQUTsHR7szBrrTnnuidVaSD8uTu7TSFpM32GBXqpLx8xnIsLicM
 YeOtYKBnrY4oZFRX3lVT9UpGxfQ1sScqpqypzYSx3hF1zT1b7a9hTRgRxGnxDWAfwV0n+H
 ct6keeYHq5wnPKxGg81Idfwky1TW+5U=
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-91-ET0MaMKfOpu6Hz9V1w59kQ-1; Mon, 16 Dec 2019 08:11:34 -0500
Received: by mail-wr1-f70.google.com with SMTP id 90so3675892wrq.6
 for <qemu-devel@nongnu.org>; Mon, 16 Dec 2019 05:11:34 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=O9cATtB6pbYt1/J3PE5x5GGao7scjTW4c1UJnxl2UqM=;
 b=WT8WEdaqLE+9VoBznBoRBo6mZTuWp9TRJmmylSnRH0o9KZJL2b9dA5efX9I4GwrTHr
 251yMuKvXpOwqtI/GuFSuZMiR4kxwceqJndlCGbsx2LWrpN+541YmrJ1j4McuSAWspCB
 IBETIL8YJ5cXXA9xEMYD9V04CVqbyfTkEg1MCFjA7DIJyegPFAHaDP9RlSjx0y45Qav1
 GhnY5E5TplUjuSCVAZjBkxR0BBKYmmyApfiQuDRMRf7C7Ru23dAIO7pwEDItwZO4pTQc
 oKZ9Vyg387DHoXebWQCIhs98XBYWo5jyoGKf8qHpSq4r3jfvi7pQpnCIZ8PgJAAvKfOR
 enyQ==
X-Gm-Message-State: APjAAAVGqIwTsEnWOIwjUKU+gXcD5uWs7lZ0JyNv00YcG3ojC58yV4/v
 zjlTnMsqzvMjSaHFo/KFfhQot3s8e+eD5cDdTBj2qVEfWl4PY/pD4ueHL4DJZrUou9sCeDXwM2s
 XvctX8fDhtWNJtbA=
X-Received: by 2002:adf:df8e:: with SMTP id z14mr29964672wrl.190.1576501893618; 
 Mon, 16 Dec 2019 05:11:33 -0800 (PST)
X-Google-Smtp-Source: APXvYqzQRXuwtsErZVb6m+PpFDPU/O5P8Uccsrb7klFy/bxWKMqwMlqFrlhlnta+/vHq8ERR9JDVmQ==
X-Received: by 2002:adf:df8e:: with SMTP id z14mr29964634wrl.190.1576501893313; 
 Mon, 16 Dec 2019 05:11:33 -0800 (PST)
Received: from ?IPv6:2001:b07:6468:f312:cde8:2463:95a9:1d81?
 ([2001:b07:6468:f312:cde8:2463:95a9:1d81])
 by smtp.gmail.com with ESMTPSA id b16sm22033755wrj.23.2019.12.16.05.11.32
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 16 Dec 2019 05:11:32 -0800 (PST)
Subject: Re: [PATCH 06/12] hw/i386/ich9: Move unnecessary "pci_bridge.h"
 include
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>,
 qemu-devel@nongnu.org
References: <20191213161753.8051-1-philmd@redhat.com>
 <20191213161753.8051-7-philmd@redhat.com>
From: Paolo Bonzini <pbonzini@redhat.com>
Message-ID: <622546ed-9117-0be8-1631-dfba81a9353d@redhat.com>
Date: Mon, 16 Dec 2019 14:11:31 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.1.1
MIME-Version: 1.0
In-Reply-To: <20191213161753.8051-7-philmd@redhat.com>
Content-Language: en-US
X-MC-Unique: ET0MaMKfOpu6Hz9V1w59kQ-1
X-Mimecast-Spam-Score: 0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
 [fuzzy]
X-Received-From: 207.211.31.120
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: Stefano Stabellini <sstabellini@kernel.org>, Sergio Lopez <slp@redhat.com>,
 Eduardo Habkost <ehabkost@redhat.com>, kvm@vger.kernel.org,
 Paul Durrant <paul@xen.org>, "Michael S. Tsirkin" <mst@redhat.com>,
 xen-devel@lists.xenproject.org, Anthony Perard <anthony.perard@citrix.com>,
 Igor Mammedov <imammedo@redhat.com>, qemu-block@nongnu.org,
 John Snow <jsnow@redhat.com>, Richard Henderson <rth@twiddle.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 13/12/19 17:17, Philippe Mathieu-Daud=C3=A9 wrote:
> While the ICH9 chipset is a 'South Bridge', it is not a PCI bridge.
> Nothing in "hw/i386/ich9.h" requires definitions from "pci_bridge.h"
> so move its inclusion where it is required.
>=20
> Signed-off-by: Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com>
> ---
>  include/hw/i386/ich9.h    | 1 -
>  hw/i386/acpi-build.c      | 1 +
>  hw/pci-bridge/i82801b11.c | 1 +
>  3 files changed, 2 insertions(+), 1 deletion(-)
>=20
> diff --git a/include/hw/i386/ich9.h b/include/hw/i386/ich9.h
> index eeb79ac1fe..369bc64671 100644
> --- a/include/hw/i386/ich9.h
> +++ b/include/hw/i386/ich9.h
> @@ -7,7 +7,6 @@
>  #include "hw/isa/apm.h"
>  #include "hw/i386/ioapic.h"
>  #include "hw/pci/pci.h"
> -#include "hw/pci/pci_bridge.h"
>  #include "hw/acpi/acpi.h"
>  #include "hw/acpi/ich9.h"
>  #include "hw/pci/pci_bus.h"
> diff --git a/hw/i386/acpi-build.c b/hw/i386/acpi-build.c
> index 12ff55fcfb..291909fa05 100644
> --- a/hw/i386/acpi-build.c
> +++ b/hw/i386/acpi-build.c
> @@ -27,6 +27,7 @@
>  #include "qemu/bitmap.h"
>  #include "qemu/error-report.h"
>  #include "hw/pci/pci.h"
> +#include "hw/pci/pci_bridge.h"
>  #include "hw/core/cpu.h"
>  #include "target/i386/cpu.h"
>  #include "hw/misc/pvpanic.h"
> diff --git a/hw/pci-bridge/i82801b11.c b/hw/pci-bridge/i82801b11.c
> index 2b3907655b..033b3c43c4 100644
> --- a/hw/pci-bridge/i82801b11.c
> +++ b/hw/pci-bridge/i82801b11.c
> @@ -43,6 +43,7 @@
> =20
>  #include "qemu/osdep.h"
>  #include "hw/pci/pci.h"
> +#include "hw/pci/pci_bridge.h"
>  #include "migration/vmstate.h"
>  #include "qemu/module.h"
>  #include "hw/i386/ich9.h"
>=20

Queued, thanks.

Paolo


