Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 300566460E4
	for <lists+qemu-devel@lfdr.de>; Wed,  7 Dec 2022 19:09:57 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p2yqa-0008PF-2L; Wed, 07 Dec 2022 13:08:44 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <farosas@suse.de>)
 id 1p2yqY-0008Oz-DY; Wed, 07 Dec 2022 13:08:42 -0500
Received: from smtp-out1.suse.de ([2001:67c:2178:6::1c])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <farosas@suse.de>)
 id 1p2yqW-0003C4-N5; Wed, 07 Dec 2022 13:08:42 -0500
Received: from imap1.suse-dmz.suse.de (imap1.suse-dmz.suse.de [192.168.254.73])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id A97002212D;
 Wed,  7 Dec 2022 18:08:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1670436517; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=UcAQvB1M7lXKd8EkvI1ZAghJIEZ8WQmQ8J6GNk97W3c=;
 b=UaGW0SE3RqkPt0iH2GwxqtfcOfluDEtOGm4GTGr9zSl1zgEl2HciKwMd+E5f6A9DJgwCzq
 R1JiiXUNGQdC8laXbu2Qy9kkEtKfTzEpx1BfSFoc+/wzIcSw1XgBrtdmORg52eHQNexy1j
 GUjZT1C6Z8IgND3TTbsZEgjvp7Xeb0k=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1670436517;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=UcAQvB1M7lXKd8EkvI1ZAghJIEZ8WQmQ8J6GNk97W3c=;
 b=ZXthyWNO3/wygnXXI6DaSlDCXYnibQ1RQnhl25DWg2jhulS1Y9zdAUvbnSFO2/G2+hE1dX
 45qNVdXT6FqOssCA==
Received: from imap1.suse-dmz.suse.de (imap1.suse-dmz.suse.de [192.168.254.73])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap1.suse-dmz.suse.de (Postfix) with ESMTPS id 21ADB136B4;
 Wed,  7 Dec 2022 18:08:36 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap1.suse-dmz.suse.de with ESMTPSA id cgiuNaTWkGNEBAAAGKfGzw
 (envelope-from <farosas@suse.de>); Wed, 07 Dec 2022 18:08:36 +0000
From: Fabiano Rosas <farosas@suse.de>
To: Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 qemu-devel@nongnu.org
Cc: Eduardo Habkost <eduardo@habkost.net>, Stafford Horne
 <shorne@gmail.com>, Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Yoshinori Sato
 <ysato@users.sourceforge.jp>, Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?=
 <philmd@linaro.org>,
 Marek Vasut <marex@denx.de>, Laurent Vivier <laurent@vivier.eu>,
 =?utf-8?Q?C=C3=A9dric?= Le
 Goater <clg@kaod.org>, Yanan Wang <wangyanan55@huawei.com>, Mark
 Cave-Ayland <mark.cave-ayland@ilande.co.uk>, Fabiano Rosas
 <farosas@linux.ibm.com>, Daniel Henrique Barboza <danielhb413@gmail.com>,
 Richard Henderson <richard.henderson@linaro.org>, Paolo Bonzini
 <pbonzini@redhat.com>, Marcel Apfelbaum <marcel.apfelbaum@gmail.com>, Max
 Filippov <jcmvbkbc@gmail.com>, Greg Kurz <groug@kaod.org>, Artyom
 Tarasenko <atar4qemu@gmail.com>, Anton Johansson <anjo@rev.ng>,
 qemu-ppc@nongnu.org, Chris Wulff <crwulff@gmail.com>, "Edgar E. Iglesias"
 <edgar.iglesias@gmail.com>, David Gibson <david@gibson.dropbear.id.au>
Subject: Re: [PATCH-for-8.0 2/4] gdbstub: Use vaddr type for generic
 insert/remove_breakpoint() API
In-Reply-To: <20221207174129.77593-3-philmd@linaro.org>
References: <20221207174129.77593-1-philmd@linaro.org>
 <20221207174129.77593-3-philmd@linaro.org>
Date: Wed, 07 Dec 2022 15:08:34 -0300
Message-ID: <87k03313z1.fsf@suse.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2001:67c:2178:6::1c; envelope-from=farosas@suse.de;
 helo=smtp-out1.suse.de
X-Spam_score_int: -43
X-Spam_score: -4.4
X-Spam_bar: ----
X-Spam_report: (-4.4 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_MED=-2.3, SPF_HELO_NONE=0.001,
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

Philippe Mathieu-Daud=C3=A9 <philmd@linaro.org> writes:

> Both insert/remove_breakpoint() handlers are used in system and
> user emulation. We can not use the 'hwaddr' type on user emulation,
> we have to use 'vaddr' which is defined as "wide enough to contain
> any #target_ulong virtual address".
>
> Signed-off-by: Philippe Mathieu-Daud=C3=A9 <philmd@linaro.org>
> ---
>  gdbstub/internals.h        | 6 ++++--
>  include/sysemu/accel-ops.h | 6 +++---
>  2 files changed, 7 insertions(+), 5 deletions(-)
>
> diff --git a/gdbstub/internals.h b/gdbstub/internals.h
> index eabb0341d1..b23999f951 100644
> --- a/gdbstub/internals.h
> +++ b/gdbstub/internals.h
> @@ -9,9 +9,11 @@
>  #ifndef _INTERNALS_H_
>  #define _INTERNALS_H_
>=20=20
> +#include "exec/cpu-common.h"
> +
>  bool gdb_supports_guest_debug(void);
> -int gdb_breakpoint_insert(CPUState *cs, int type, hwaddr addr, hwaddr le=
n);
> -int gdb_breakpoint_remove(CPUState *cs, int type, hwaddr addr, hwaddr le=
n);
> +int gdb_breakpoint_insert(CPUState *cs, int type, vaddr addr, vaddr len);
> +int gdb_breakpoint_remove(CPUState *cs, int type, vaddr addr, vaddr len);

Now we should be able to remove the "exec/hwaddr.h" include from
gdbstub.c

>  void gdb_breakpoint_remove_all(CPUState *cs);
>=20=20
>  #endif /* _INTERNALS_H_ */
> diff --git a/include/sysemu/accel-ops.h b/include/sysemu/accel-ops.h
> index 8cc7996def..30690c71bd 100644
> --- a/include/sysemu/accel-ops.h
> +++ b/include/sysemu/accel-ops.h
> @@ -10,7 +10,7 @@
>  #ifndef ACCEL_OPS_H
>  #define ACCEL_OPS_H
>=20=20
> -#include "exec/hwaddr.h"
> +#include "exec/cpu-common.h"
>  #include "qom/object.h"
>=20=20
>  #define ACCEL_OPS_SUFFIX "-ops"
> @@ -48,8 +48,8 @@ struct AccelOpsClass {
>=20=20
>      /* gdbstub hooks */
>      bool (*supports_guest_debug)(void);
> -    int (*insert_breakpoint)(CPUState *cpu, int type, hwaddr addr, hwadd=
r len);
> -    int (*remove_breakpoint)(CPUState *cpu, int type, hwaddr addr, hwadd=
r len);
> +    int (*insert_breakpoint)(CPUState *cpu, int type, vaddr addr, vaddr =
len);
> +    int (*remove_breakpoint)(CPUState *cpu, int type, vaddr addr, vaddr =
len);
>      void (*remove_all_breakpoints)(CPUState *cpu);
>  };

