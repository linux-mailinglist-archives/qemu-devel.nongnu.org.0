Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1A19A1206BA
	for <lists+qemu-devel@lfdr.de>; Mon, 16 Dec 2019 14:12:45 +0100 (CET)
Received: from localhost ([::1]:53520 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1igqB2-0002WW-3i
	for lists+qemu-devel@lfdr.de; Mon, 16 Dec 2019 08:12:44 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:40787)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <pbonzini@redhat.com>) id 1igq9s-0001YU-Fk
 for qemu-devel@nongnu.org; Mon, 16 Dec 2019 08:11:33 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <pbonzini@redhat.com>) id 1igq9r-0006W1-5X
 for qemu-devel@nongnu.org; Mon, 16 Dec 2019 08:11:32 -0500
Received: from us-smtp-2.mimecast.com ([207.211.31.81]:45544
 helo=us-smtp-delivery-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <pbonzini@redhat.com>) id 1igq9r-0006Vd-1l
 for qemu-devel@nongnu.org; Mon, 16 Dec 2019 08:11:31 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1576501890;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=9gLg1Jp9E8WO+3bPfrTlu11fIfKsZ0njITxJ48uZHgg=;
 b=CffbdJ+q2QzXDVJWtjV0OOXWdiieEPAQ1AbVQmUxL+xWFNW0894JcdR6CsSVOSmCyxPazP
 PEjGMO67N0wtKN3hs3bdG3ixU3iEzv1T5CqSO775e+rmWgj461GGed4MqLki3tH5OwPVDL
 UjA6yHN9zmVrFFaZS5UR7khzuNXsBQA=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-249-09_eomgmPmyjU5CEnRJ2nA-1; Mon, 16 Dec 2019 08:11:29 -0500
Received: by mail-wr1-f69.google.com with SMTP id h30so3697067wrh.5
 for <qemu-devel@nongnu.org>; Mon, 16 Dec 2019 05:11:28 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=FXYYP7m5x86Bk37M1YJB4xh6R0fOUNpBlIMCqcUij+E=;
 b=fk5qNV5pP+UsBJ8cSyJrfrgqKfsQFrhSONP5sXBDw/KPBsPfV8i/5r5ca54XHOWvDp
 wIahSDdcRGAjoAfPxXrhOyiaF0c6/5HDEVZ/28v7jLrQvBqxyr6fmIpeQEXJl11Q5RDm
 tuQU36nMQ3WdSBb/jDS57wxYfdfzeisywtwweUWorZQ1uSVBCHuklf4ZAjbRnhuf/snk
 2LMa6CGu6Mub9Hj3IiP7BCOGdOEcMUodUSYju/VLQzer1uH14esLjEGkj1BfU7e8bXpJ
 w1h6dU/o42JBBSsd0RDiFs6GVns5lgpTl1oHJdEMCr8CBY1psYUpwXmeCsQW272njo8N
 yeUw==
X-Gm-Message-State: APjAAAXYoZEYd/6Kt/2Dq/6CX6GduBnlcooqYl0Y7CMopX2885fwWq5N
 +IhI60zV7d4mYWZztQ5v/klsPrnkUZhgIdmWoM0lRmZJ/QvBL6lI8jV4z6LtieGEBht7Ed7/ZKj
 JmLfi/VfsKfpi3C4=
X-Received: by 2002:a1c:8086:: with SMTP id b128mr30614678wmd.80.1576501887766; 
 Mon, 16 Dec 2019 05:11:27 -0800 (PST)
X-Google-Smtp-Source: APXvYqxdE9VroDhn6zSvqLM+CRCLzGyJou2Umxg4Ryp4vAVu7qRvR4LrFZvhR++1aIuoI0i+slJgYw==
X-Received: by 2002:a1c:8086:: with SMTP id b128mr30614636wmd.80.1576501887535; 
 Mon, 16 Dec 2019 05:11:27 -0800 (PST)
Received: from ?IPv6:2001:b07:6468:f312:cde8:2463:95a9:1d81?
 ([2001:b07:6468:f312:cde8:2463:95a9:1d81])
 by smtp.gmail.com with ESMTPSA id d16sm23348661wrg.27.2019.12.16.05.11.26
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 16 Dec 2019 05:11:27 -0800 (PST)
Subject: Re: [PATCH 05/12] hw/i386/ich9: Remove unused include
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>,
 qemu-devel@nongnu.org
References: <20191213161753.8051-1-philmd@redhat.com>
 <20191213161753.8051-6-philmd@redhat.com>
From: Paolo Bonzini <pbonzini@redhat.com>
Message-ID: <4f195401-f896-75cd-f590-0c1f4bd6c46f@redhat.com>
Date: Mon, 16 Dec 2019 14:11:25 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.1.1
MIME-Version: 1.0
In-Reply-To: <20191213161753.8051-6-philmd@redhat.com>
Content-Language: en-US
X-MC-Unique: 09_eomgmPmyjU5CEnRJ2nA-1
X-Mimecast-Spam-Score: 0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
 [fuzzy]
X-Received-From: 207.211.31.81
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
> The "pcie_host.h" header is used by devices providing a PCI-e bus,
> usually North Bridges. The ICH9 is a South Bridge.
> Since we don't need this header, do not include it.
>=20
> Signed-off-by: Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com>
> ---
>  include/hw/i386/ich9.h | 1 -
>  1 file changed, 1 deletion(-)
>=20
> diff --git a/include/hw/i386/ich9.h b/include/hw/i386/ich9.h
> index 72e803f6e2..eeb79ac1fe 100644
> --- a/include/hw/i386/ich9.h
> +++ b/include/hw/i386/ich9.h
> @@ -7,7 +7,6 @@
>  #include "hw/isa/apm.h"
>  #include "hw/i386/ioapic.h"
>  #include "hw/pci/pci.h"
> -#include "hw/pci/pcie_host.h"
>  #include "hw/pci/pci_bridge.h"
>  #include "hw/acpi/acpi.h"
>  #include "hw/acpi/ich9.h"
>=20

Queued, thanks.

Paolo


