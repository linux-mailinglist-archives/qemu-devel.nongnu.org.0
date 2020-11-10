Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0C42F2AE014
	for <lists+qemu-devel@lfdr.de>; Tue, 10 Nov 2020 20:50:42 +0100 (CET)
Received: from localhost ([::1]:60536 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kcZf7-00054Y-2T
	for lists+qemu-devel@lfdr.de; Tue, 10 Nov 2020 14:50:41 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:52926)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pisa@cmp.felk.cvut.cz>)
 id 1kcZTm-0004so-U7
 for qemu-devel@nongnu.org; Tue, 10 Nov 2020 14:38:58 -0500
Received: from relay.felk.cvut.cz ([2001:718:2:1611:0:1:0:70]:25283)
 by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <pisa@cmp.felk.cvut.cz>) id 1kcZTl-0000so-5D
 for qemu-devel@nongnu.org; Tue, 10 Nov 2020 14:38:58 -0500
Received: from cmp.felk.cvut.cz (haar.felk.cvut.cz [147.32.84.19])
 by relay.felk.cvut.cz (8.15.2/8.15.2) with ESMTP id 0AAJbtSA090702;
 Tue, 10 Nov 2020 20:37:55 +0100 (CET)
 (envelope-from pisa@cmp.felk.cvut.cz)
Received: from haar.felk.cvut.cz (localhost [127.0.0.1])
 by cmp.felk.cvut.cz (8.14.0/8.12.3/SuSE Linux 0.6) with ESMTP id
 0AAJbtZP013475; Tue, 10 Nov 2020 20:37:55 +0100
Received: (from pisa@localhost)
 by haar.felk.cvut.cz (8.14.0/8.13.7/Submit) id 0AAJbtx6013474;
 Tue, 10 Nov 2020 20:37:55 +0100
X-Authentication-Warning: haar.felk.cvut.cz: pisa set sender to
 pisa@cmp.felk.cvut.cz using -f
From: Pavel Pisa <pisa@cmp.felk.cvut.cz>
To: Peter Maydell <peter.maydell@linaro.org>
Subject: Re: [PATCH for-5.2 v2 3/4] hw/net/can/ctucan_core: Handle big-endian
 hosts
Date: Tue, 10 Nov 2020 20:37:54 +0100
User-Agent: KMail/1.9.10
References: <20201110170604.5897-1-peter.maydell@linaro.org>
 <20201110170604.5897-4-peter.maydell@linaro.org>
In-Reply-To: <20201110170604.5897-4-peter.maydell@linaro.org>
X-KMail-QuotePrefix: > 
MIME-Version: 1.0
Content-Type: Text/Plain;
  charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline
Message-Id: <202011102037.54901.pisa@cmp.felk.cvut.cz>
X-FELK-MailScanner-Information: 
X-MailScanner-ID: 0AAJbtSA090702
X-FELK-MailScanner: Found to be clean
X-FELK-MailScanner-SpamCheck: not spam, SpamAssassin (not cached,
 score=-0.099, required 6, BAYES_00 -0.50, KHOP_HELO_FCRDNS 0.40,
 NICE_REPLY_A -0.00, SPF_HELO_NONE 0.00, SPF_NONE 0.00)
X-FELK-MailScanner-From: pisa@cmp.felk.cvut.cz
X-FELK-MailScanner-Watermark: 1605641878.72377@rSEvjO3oKPyEAtkC3gUMbQ
Received-SPF: none client-ip=2001:718:2:1611:0:1:0:70;
 envelope-from=pisa@cmp.felk.cvut.cz; helo=relay.felk.cvut.cz
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/11/10 13:02:14
X-ACL-Warn: Detected OS   = ???
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-0.001,
 SPF_HELO_NONE=0.001, SPF_NONE=0.001 autolearn=ham autolearn_force=no
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
Cc: Jason Wang <jasowang@redhat.com>, Vikram Garhwal <fnu.vikram@xilinx.com>,
 qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Hello Peter,

On Tuesday 10 of November 2020 18:06:03 Peter Maydell wrote:
> The ctucan driver defines types for its registers which are a union
> of a uint32_t with a struct with bitfields for the individual
> fields within that register. This is a bad idea, because bitfields
> aren't portable. The ctu_can_fd_regs.h header works around the
> most glaring of the portability issues by defining the
> fields in two different orders depending on the setting of the
> __LITTLE_ENDIAN_BITFIELD define. However, in ctucan_core.h this
> is unconditionally set to 1, which is wrong for big-endian hosts.
>
> Set it only if HOST_WORDS_BIGENDIAN is not set. There is no need
> for a "have we defined it already" guard, because the only place
> that should set it is ctucan_core.h, which has the usual
> double-inclusion guard.
>
> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
> Reviewed-by: Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org>
> ---
>  hw/net/can/ctucan_core.h | 3 +--
>  1 file changed, 1 insertion(+), 2 deletions(-)
>
> diff --git a/hw/net/can/ctucan_core.h b/hw/net/can/ctucan_core.h
> index f21cb1c5ec3..bbc09ae0678 100644
> --- a/hw/net/can/ctucan_core.h
> +++ b/hw/net/can/ctucan_core.h
> @@ -31,8 +31,7 @@
>  #include "exec/hwaddr.h"
>  #include "net/can_emu.h"
>
> -
> -#ifndef __LITTLE_ENDIAN_BITFIELD
> +#ifndef HOST_WORDS_BIGENDIAN
>  #define __LITTLE_ENDIAN_BITFIELD 1
>  #endif

Acked-by: Pavel Pisa <pisa@cmp.felk.cvut.cz>

Thanks,

Pavel

