Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 37BA837564A
	for <lists+qemu-devel@lfdr.de>; Thu,  6 May 2021 17:12:34 +0200 (CEST)
Received: from localhost ([::1]:51800 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lefg0-0001Th-2x
	for lists+qemu-devel@lfdr.de; Thu, 06 May 2021 11:12:33 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35322)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dinechin@redhat.com>)
 id 1lefcY-0007o3-4j
 for qemu-devel@nongnu.org; Thu, 06 May 2021 11:08:58 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:49151)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dinechin@redhat.com>)
 id 1lefcP-00034u-Bu
 for qemu-devel@nongnu.org; Thu, 06 May 2021 11:08:57 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1620313727;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=m9ewp5iHxi2zbqQP2rkue2ZUEh3U6+WHn2wG8f4/C6w=;
 b=ORa6GITT1Yq6uYYDw07jeqatPq9gWVJu0p9OS2xuktVLV7toUP+lX2XoR8wjobJZ5/Tvpk
 vs1jCK/lW0vnKSG+NLnfQjO40lxBEGlc8LUYRTCGLRvKlZmW9GB1iARHGrA0EiQoiVZjEk
 AZ616suVORP7eGxiNLTar32iginPabk=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-7-5HaQkt4_MJyW9Z20B_Obnw-1; Thu, 06 May 2021 11:08:45 -0400
X-MC-Unique: 5HaQkt4_MJyW9Z20B_Obnw-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 47AE76D5C8;
 Thu,  6 May 2021 15:08:44 +0000 (UTC)
Received: from titinator (ovpn-112-210.ams2.redhat.com [10.36.112.210])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id B67AC16909;
 Thu,  6 May 2021 15:08:38 +0000 (UTC)
References: <20210506133758.1749233-1-philmd@redhat.com>
 <20210506133758.1749233-3-philmd@redhat.com>
User-agent: mu4e 1.5.7; emacs 27.1
From: Christophe de Dinechin <dinechin@redhat.com>
To: Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <philmd@redhat.com>
Subject: Re: [PATCH v2 2/9] backends/tpm: Replace qemu_mutex_lock calls with
 QEMU_LOCK_GUARD
Date: Thu, 06 May 2021 17:07:11 +0200
In-reply-to: <20210506133758.1749233-3-philmd@redhat.com>
Message-ID: <lyr1ij6gsr.fsf@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
Received-SPF: pass client-ip=216.205.24.124; envelope-from=dinechin@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.69,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: kvm@vger.kernel.org, Stefan Berger <stefanb@linux.vnet.ibm.com>,
 qemu-devel@nongnu.org, qemu-arm@nongnu.org, qemu-ppc@nongnu.org,
 Gerd Hoffmann <kraxel@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


On 2021-05-06 at 15:37 CEST, Philippe Mathieu-Daud=C3=A9 wrote...
> Simplify the tpm_emulator_ctrlcmd() handler by replacing a pair of
> qemu_mutex_lock/qemu_mutex_unlock calls by the WITH_QEMU_LOCK_GUARD
> macro.
>
> Signed-off-by: Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com>
> ---
>  backends/tpm/tpm_emulator.c | 34 +++++++++++++++-------------------
>  1 file changed, 15 insertions(+), 19 deletions(-)
>
> diff --git a/backends/tpm/tpm_emulator.c b/backends/tpm/tpm_emulator.c
> index a012adc1934..e5f1063ab6c 100644
> --- a/backends/tpm/tpm_emulator.c
> +++ b/backends/tpm/tpm_emulator.c
> @@ -30,6 +30,7 @@
>  #include "qemu/error-report.h"
>  #include "qemu/module.h"
>  #include "qemu/sockets.h"
> +#include "qemu/lockable.h"
>  #include "io/channel-socket.h"
>  #include "sysemu/tpm_backend.h"
>  #include "sysemu/tpm_util.h"
> @@ -124,31 +125,26 @@ static int tpm_emulator_ctrlcmd(TPMEmulator *tpm, u=
nsigned long cmd, void *msg,
>      uint32_t cmd_no =3D cpu_to_be32(cmd);
>      ssize_t n =3D sizeof(uint32_t) + msg_len_in;
>      uint8_t *buf =3D NULL;
> -    int ret =3D -1;
>
> -    qemu_mutex_lock(&tpm->mutex);
> +    WITH_QEMU_LOCK_GUARD(&tpm->mutex) {
> +        buf =3D g_alloca(n);
> +        memcpy(buf, &cmd_no, sizeof(cmd_no));
> +        memcpy(buf + sizeof(cmd_no), msg, msg_len_in);
>
> -    buf =3D g_alloca(n);
> -    memcpy(buf, &cmd_no, sizeof(cmd_no));
> -    memcpy(buf + sizeof(cmd_no), msg, msg_len_in);
> -
> -    n =3D qemu_chr_fe_write_all(dev, buf, n);
> -    if (n <=3D 0) {
> -        goto end;
> -    }
> -
> -    if (msg_len_out !=3D 0) {
> -        n =3D qemu_chr_fe_read_all(dev, msg, msg_len_out);
> +        n =3D qemu_chr_fe_write_all(dev, buf, n);
>          if (n <=3D 0) {
> -            goto end;
> +            return -1;
> +        }
> +
> +        if (msg_len_out !=3D 0) {
> +            n =3D qemu_chr_fe_read_all(dev, msg, msg_len_out);
> +            if (n <=3D 0) {
> +                return -1;
> +            }
>          }
>      }
>
> -    ret =3D 0;
> -
> -end:
> -    qemu_mutex_unlock(&tpm->mutex);
> -    return ret;
> +    return 0;
>  }
>
>  static int tpm_emulator_unix_tx_bufs(TPMEmulator *tpm_emu,

I really like the improvement, but it looks like it does not belong to the
top-level series (i.e. not related to replacing alloca() by g_malloc()).

Reviewed-by: Christophe de Dinechin <dinechin@redhat.com>

--
Cheers,
Christophe de Dinechin (IRC c3d)


