Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1B8EF337942
	for <lists+qemu-devel@lfdr.de>; Thu, 11 Mar 2021 17:25:19 +0100 (CET)
Received: from localhost ([::1]:53398 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lKO7i-0004GH-4l
	for lists+qemu-devel@lfdr.de; Thu, 11 Mar 2021 11:25:18 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:36590)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <sw@weilnetz.de>) id 1lKNoy-0005Pk-7z
 for qemu-devel@nongnu.org; Thu, 11 Mar 2021 11:05:57 -0500
Received: from mail.weilnetz.de ([37.120.169.71]:40612
 helo=mail.v2201612906741603.powersrv.de)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <sw@weilnetz.de>) id 1lKNos-0006IC-Un
 for qemu-devel@nongnu.org; Thu, 11 Mar 2021 11:05:55 -0500
Received: from edv-macbook-pro.fritz.box (p5b1511bf.dip0.t-ipconnect.de
 [91.21.17.191])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by mail.v2201612906741603.powersrv.de (Postfix) with ESMTPSA id 6F90FDA129E;
 Thu, 11 Mar 2021 17:05:46 +0100 (CET)
To: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org
References: <20210311143958.562625-1-richard.henderson@linaro.org>
 <20210311143958.562625-2-richard.henderson@linaro.org>
From: Stefan Weil <sw@weilnetz.de>
Subject: Re: [PATCH v5 01/57] tcg/tci: Remove ifdefs for
 TCG_TARGET_HAS_ext32[us]_i64
Message-ID: <0c44bb82-c3e1-4a6c-813a-e02d756971f1@weilnetz.de>
Date: Thu, 11 Mar 2021 17:05:54 +0100
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.16; rv:78.0)
 Gecko/20100101 Thunderbird/78.7.1
MIME-Version: 1.0
In-Reply-To: <20210311143958.562625-2-richard.henderson@linaro.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=37.120.169.71; envelope-from=sw@weilnetz.de;
 helo=mail.v2201612906741603.powersrv.de
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-0.001,
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
Cc: alex.bennee@linaro.org, f4bug@amsat.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Am 11.03.21 um 15:39 schrieb Richard Henderson:

> These operations are always available under different names:
> INDEX_op_ext_i32_i64 and INDEX_op_extu_i32_i64, so we remove
> no code with the ifdef.


Is that really so? Depending on how the compiler implements the case=20
statements, it either needs additional conditional statements (which=20
require both code space and execution time) or larger jump tables=20
(unless the table is filled anyway). Even if the compiler uses a binary=20
search the time for searching will increase. Adding two more cases only=20
has no effect on speed and memory if the compiler uses jump tables=20
without holes.

Anyway, it would be good to get all these patches into master even if I=20
have a different opinion on some details. Therefore

Reviewed-by: Stefan Weil <sw@weilnetz.de>


> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>   tcg/tci.c | 4 ----
>   1 file changed, 4 deletions(-)
>
> diff --git a/tcg/tci.c b/tcg/tci.c
> index 3ccd30c39c..6a0bdf028b 100644
> --- a/tcg/tci.c
> +++ b/tcg/tci.c
> @@ -774,17 +774,13 @@ uintptr_t QEMU_DISABLE_CFI tcg_qemu_tb_exec(CPUAr=
chState *env,
>                   continue;
>               }
>               break;
> -#if TCG_TARGET_HAS_ext32s_i64
>           case INDEX_op_ext32s_i64:
> -#endif
>           case INDEX_op_ext_i32_i64:
>               t0 =3D *tb_ptr++;
>               t1 =3D tci_read_r(regs, &tb_ptr);
>               tci_write_reg(regs, t0, (int32_t)t1);
>               break;
> -#if TCG_TARGET_HAS_ext32u_i64
>           case INDEX_op_ext32u_i64:
> -#endif
>           case INDEX_op_extu_i32_i64:
>               t0 =3D *tb_ptr++;
>               t1 =3D tci_read_r(regs, &tb_ptr);


