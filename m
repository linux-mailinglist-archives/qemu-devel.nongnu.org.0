Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8FBD44668F8
	for <lists+qemu-devel@lfdr.de>; Thu,  2 Dec 2021 18:17:21 +0100 (CET)
Received: from localhost ([::1]:51608 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1msphw-0005HV-EH
	for lists+qemu-devel@lfdr.de; Thu, 02 Dec 2021 12:17:20 -0500
Received: from eggs.gnu.org ([209.51.188.92]:37186)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <cohuck@redhat.com>) id 1mspf4-0002aR-2A
 for qemu-devel@nongnu.org; Thu, 02 Dec 2021 12:14:22 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:56279)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <cohuck@redhat.com>) id 1mspf1-0002x0-8R
 for qemu-devel@nongnu.org; Thu, 02 Dec 2021 12:14:21 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1638465257;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=buT7rBmWYCFL2a97/qh9sRi8T7kl2AQQ0wZBAme5r9Y=;
 b=XE6xseZNnCLw17KT7F+UyxmnCRf7INyaY9q/Rttoy4GfDTlMLfyCRGptPLsIPM7UwEAIJH
 /tWaEk9RZCplvRcDvQ+c5nWTEdDsljYxRP0tNuglHyxrkI+JteQECq1pRqlIjp7JgoTu+l
 NcP8OJnDaqx/yTp6xzgo+q5Gexefx3s=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-334-LGZ6iIYxP5WPSNMsiHNL6g-1; Thu, 02 Dec 2021 12:14:14 -0500
X-MC-Unique: LGZ6iIYxP5WPSNMsiHNL6g-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 9C71B835B47;
 Thu,  2 Dec 2021 17:14:13 +0000 (UTC)
Received: from localhost (unknown [10.39.192.13])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 4141519C46;
 Thu,  2 Dec 2021 17:14:13 +0000 (UTC)
From: Cornelia Huck <cohuck@redhat.com>
To: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>,
 qemu-devel@nongnu.org
Subject: Re: [PATCH for 6.2?] Revert "vga: don't abort when adding a
 duplicate isa-vga device"
In-Reply-To: <20211202164929.1119036-1-alex.bennee@linaro.org>
Organization: Red Hat GmbH
References: <20211202164929.1119036-1-alex.bennee@linaro.org>
User-Agent: Notmuch/0.33.1 (https://notmuchmail.org)
Date: Thu, 02 Dec 2021 18:14:11 +0100
Message-ID: <87r1avgc9o.fsf@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=cohuck@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=170.10.133.124; envelope-from=cohuck@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.719,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
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
Cc: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Gerd Hoffmann <kraxel@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Thu, Dec 02 2021, Alex Benn=C3=A9e <alex.bennee@linaro.org> wrote:

> This reverts commit 7852a77f598635a67a222b6c1463c8b46098aed2.
>
> The check is bogus as it ends up finding itself and falling over.
>
> Signed-off-by: Alex Benn=C3=A9e <alex.bennee@linaro.org>
> Resolves: https://gitlab.com/qemu-project/qemu.git/-/issues/733
> ---
>  hw/display/vga-isa.c | 10 ----------
>  1 file changed, 10 deletions(-)
>
> diff --git a/hw/display/vga-isa.c b/hw/display/vga-isa.c
> index 8cea84f2be..90851e730b 100644
> --- a/hw/display/vga-isa.c
> +++ b/hw/display/vga-isa.c
> @@ -33,7 +33,6 @@
>  #include "hw/loader.h"
>  #include "hw/qdev-properties.h"
>  #include "qom/object.h"
> -#include "qapi/error.h"
> =20
>  #define TYPE_ISA_VGA "isa-vga"
>  OBJECT_DECLARE_SIMPLE_TYPE(ISAVGAState, ISA_VGA)
> @@ -62,15 +61,6 @@ static void vga_isa_realizefn(DeviceState *dev, Error =
**errp)
>      MemoryRegion *vga_io_memory;
>      const MemoryRegionPortio *vga_ports, *vbe_ports;
> =20
> -    /*
> -     * make sure this device is not being added twice, if so
> -     * exit without crashing qemu
> -     */
> -    if (object_resolve_path_type("", TYPE_ISA_VGA, NULL)) {

Don't you simply need to invert the check? You should get NULL back if
there is another device already...

> -        error_setg(errp, "at most one %s device is permitted", TYPE_ISA_=
VGA);
> -        return;
> -    }
> -
>      s->global_vmstate =3D true;
>      vga_common_init(s, OBJECT(dev));
>      s->legacy_address_space =3D isa_address_space(isadev);


