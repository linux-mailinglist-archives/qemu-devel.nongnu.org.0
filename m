Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D5A165ACDED
	for <lists+qemu-devel@lfdr.de>; Mon,  5 Sep 2022 10:44:02 +0200 (CEST)
Received: from localhost ([::1]:42992 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oV7i5-0005yZ-2S
	for lists+qemu-devel@lfdr.de; Mon, 05 Sep 2022 04:44:01 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50300)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1oV7fB-0004Sp-Mo
 for qemu-devel@nongnu.org; Mon, 05 Sep 2022 04:41:01 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:52294)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1oV7f8-0006k8-SU
 for qemu-devel@nongnu.org; Mon, 05 Sep 2022 04:41:00 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1662367257;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=XrY/c3rU6OfmqJoXTTYImb5fYgBggttP5+lOwWqok6M=;
 b=bb7CNcYmThm7QiiwQeh5S5lbhP2zuU9Es4Bgik4QAx/NUKDL2T0ABn91CJa+ntRXcucEID
 bPDq00yeyqakWCmmoPo8zAyWTkTdLTwtqy/R/iiCweMrvnT81ryCygPK+HNIvL8nNv2FIZ
 flQgubt9z1uiLAjVNxS0vf4Z73qxBAs=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-563-SC0mAiunNmGWs1TdHV6QUg-1; Mon, 05 Sep 2022 04:40:54 -0400
X-MC-Unique: SC0mAiunNmGWs1TdHV6QUg-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.rdu2.redhat.com
 [10.11.54.7])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 2788285828F;
 Mon,  5 Sep 2022 08:40:54 +0000 (UTC)
Received: from sirius.home.kraxel.org (unknown [10.39.195.70])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 301B81415138;
 Mon,  5 Sep 2022 08:40:53 +0000 (UTC)
Received: by sirius.home.kraxel.org (Postfix, from userid 1000)
 id E3F8818007A4; Mon,  5 Sep 2022 10:40:51 +0200 (CEST)
Date: Mon, 5 Sep 2022 10:40:51 +0200
From: Gerd Hoffmann <kraxel@redhat.com>
To: "Jason A. Donenfeld" <Jason@zx2c4.com>
Cc: qemu-devel@nongnu.org, Laurent Vivier <laurent@vivier.eu>,
 "Michael S . Tsirkin" <mst@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>,
 Peter Maydell <peter.maydell@linaro.org>,
 Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Richard Henderson <richard.henderson@linaro.org>,
 Ard Biesheuvel <ardb@kernel.org>
Subject: Re: [PATCH] x86: only modify setup_data if the boot protocol
 indicates safety
Message-ID: <20220905084051.cbwjktoumwhfy5tr@sirius.home.kraxel.org>
References: <20220904165058.1140503-1-Jason@zx2c4.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220904165058.1140503-1-Jason@zx2c4.com>
X-Scanned-By: MIMEDefang 2.85 on 10.11.54.7
Received-SPF: pass client-ip=170.10.129.124; envelope-from=kraxel@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Sun, Sep 04, 2022 at 06:50:58PM +0200, Jason A. Donenfeld wrote:
> This reverts 3824e25db1 ("x86: disable rng seeding via setup_data"), and
> then makes the use of setup_data safe. It does so by checking the boot
> protocol version. If it's sufficient, then it means EFI boots won't
> crash. While we're at it, gate this on SEV too.

> @@ -463,6 +462,7 @@ static void pc_i440fx_7_0_machine_options(MachineClass *m)

> +    pcmc->legacy_no_rng_seed = true;

This needs go into the pc_i440fx_7_1_machine_options function, otherwise
legacy_no_rng_seed gets flipped from false to true for 7.1 machine types
which breaks compatibility.

> @@ -398,6 +397,7 @@ static void pc_q35_7_0_machine_options(MachineClass *m)

> +    pcmc->legacy_no_rng_seed = true;

Same here.

> --- a/hw/i386/x86.c
> +++ b/hw/i386/x86.c
> @@ -1088,8 +1088,15 @@ void x86_load_linux(X86MachineState *x86ms,
>          qemu_guest_getrandom_nofail(setup_data->data, RNG_SEED_LENGTH);
>      }
>  
> -    /* Offset 0x250 is a pointer to the first setup_data link. */
> -    stq_p(header + 0x250, first_setup_data);
> +    /*
> +     * Only modify the header if doing so won't crash EFI boot, which is the
> +     * case only for newer boot protocols, and don't do so either if SEV is
> +     * enabled.
> +     */
> +    if (protocol >= 0x210 && !sev_enabled()) {
> +        /* Offset 0x250 is a pointer to the first setup_data link. */
> +        stq_p(header + 0x250, first_setup_data);
> +    }

This should better go into a separate patch.

take care,
  Gerd


