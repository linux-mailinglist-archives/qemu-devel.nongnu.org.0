Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B5E6627CE60
	for <lists+qemu-devel@lfdr.de>; Tue, 29 Sep 2020 15:05:39 +0200 (CEST)
Received: from localhost ([::1]:38300 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kNFK6-0007WX-Oq
	for lists+qemu-devel@lfdr.de; Tue, 29 Sep 2020 09:05:38 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58766)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imammedo@redhat.com>)
 id 1kNFGu-0005kj-CP
 for qemu-devel@nongnu.org; Tue, 29 Sep 2020 09:02:26 -0400
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:46905)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <imammedo@redhat.com>)
 id 1kNFGm-0003yx-GU
 for qemu-devel@nongnu.org; Tue, 29 Sep 2020 09:02:19 -0400
Dkim-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1601384531;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=NFUhA4Gxrf5AsuWLlSoxPu9KVF+1ejMgbOpHg4R3gEw=;
 b=Un4H4GaCnqEVpJT0UWElfp9kxeF4XSHBUDNHvVcg/2Fiu/KUA9rCIsPt19MHDuxyB9mB1T
 XWZd6UPZrn0bEbRGVqd1Q8UNkHFCG7a15c7XVUdb/F1qGxCaDlrr6YJiShKaH8dmslYER2
 XfIFRJ6tsYZzC3mnJgWIdQnIK4rFuUo=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-580-FTts41wVMPiK2tIQ_VM36A-1; Tue, 29 Sep 2020 09:02:07 -0400
X-MC-Unique: FTts41wVMPiK2tIQ_VM36A-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 17E701084D64;
 Tue, 29 Sep 2020 13:02:03 +0000 (UTC)
Received: from localhost (unknown [10.43.2.114])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 37E1A26185;
 Tue, 29 Sep 2020 13:01:56 +0000 (UTC)
Date: Tue, 29 Sep 2020 15:01:54 +0200
From: Igor Mammedov <imammedo@redhat.com>
To: Philippe =?UTF-8?B?TWF0aGlldS1EYXVkw6k=?= <f4bug@amsat.org>
Subject: Re: [PATCH 15/16] target/mips/cpu: Do not allow system-mode use
 without input clock
Message-ID: <20200929150154.04f77949@redhat.com>
In-Reply-To: <20200928171539.788309-16-f4bug@amsat.org>
References: <20200928171539.788309-1-f4bug@amsat.org>
 <20200928171539.788309-16-f4bug@amsat.org>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=imammedo@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=63.128.21.124; envelope-from=imammedo@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/09/28 22:47:55
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.687,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H5=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
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
Cc: Damien Hedde <damien.hedde@greensocs.com>,
 Huacai Chen <zltjiangshi@gmail.com>,
 Aleksandar Rikalo <aleksandar.rikalo@syrmia.com>,
 Eduardo Habkost <ehabkost@redhat.com>, Paul Burton <paulburton@kernel.org>,
 "Edgar E . Iglesias" <edgar.iglesias@gmail.com>, qemu-devel@nongnu.org,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Aleksandar Markovic <aleksandar.qemu.devel@gmail.com>,
 =?UTF-8?B?SGVydsOp?= Poussineau <hpoussin@reactos.org>,
 Cleber Rosa <crosa@redhat.com>, Huacai Chen <chenhc@lemote.com>,
 Philippe =?UTF-8?B?TWF0aGlldS1EYXVkw6k=?= <philmd@redhat.com>,
 Aurelien Jarno <aurelien@aurel32.net>, Richard Henderson <rth@twiddle.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Mon, 28 Sep 2020 19:15:38 +0200
Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org> wrote:

> Now than all QOM users provides the input clock, do not allow
> using a CPU core without its input clock connected on system-mode
> emulation. For user-mode, keep providing a fixed 200 MHz clock,
> as it used by the RDHWR instruction (see commit cdfcad788394).
>=20
> Signed-off-by: Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org>
> ---
> Cc: Igor Mammedov <imammedo@redhat.com>
>=20
> We need the qtest check for tests/qtest/machine-none-test.c
> which instanciate a CPU with the none machine. Igor, is it
> better to remove the MIPS targets from the test cpus_map[]?

I don't get idea, could you rephrase/elaborate?

> ---
>  target/mips/cpu.c | 8 ++++++++
>  1 file changed, 8 insertions(+)
>=20
> diff --git a/target/mips/cpu.c b/target/mips/cpu.c
> index 2f75216c324..cc4ee75af30 100644
> --- a/target/mips/cpu.c
> +++ b/target/mips/cpu.c
> @@ -25,6 +25,7 @@
>  #include "kvm_mips.h"
>  #include "qemu/module.h"
>  #include "sysemu/kvm.h"
> +#include "sysemu/qtest.h"
>  #include "exec/exec-all.h"
>  #include "hw/qdev-clock.h"
>  #include "hw/qdev-properties.h"
> @@ -159,11 +160,18 @@ static void mips_cpu_realizefn(DeviceState *dev, Er=
ror **errp)
>      Error *local_err =3D NULL;
> =20
>      if (!clock_get(cs->clock)) {
> +#ifdef CONFIG_USER_ONLY
>          /*
>           * Initialize the frequency to 200MHz in case
>           * the clock remains unconnected.
>           */
>          clock_set_hz(cs->clock, 200000000);
> +#else
> +        if (!qtest_enabled()) {
> +            error_setg(errp, "CPU clock must be connected to a clock sou=
rce");
> +            return;
> +        }
> +#endif
>      }
>      mips_cpu_clk_update(cs);
> =20


