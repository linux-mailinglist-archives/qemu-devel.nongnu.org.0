Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id F24AF312601
	for <lists+qemu-devel@lfdr.de>; Sun,  7 Feb 2021 17:26:59 +0100 (CET)
Received: from localhost ([::1]:56426 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l8mtm-0002hi-Gz
	for lists+qemu-devel@lfdr.de; Sun, 07 Feb 2021 11:26:58 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:35082)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <sw@weilnetz.de>) id 1l8msc-0002HS-16
 for qemu-devel@nongnu.org; Sun, 07 Feb 2021 11:25:46 -0500
Received: from mail.weilnetz.de ([37.120.169.71]:59186
 helo=mail.v2201612906741603.powersrv.de)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <sw@weilnetz.de>) id 1l8msY-0003Gk-NC
 for qemu-devel@nongnu.org; Sun, 07 Feb 2021 11:25:45 -0500
Received: from edv-macbook-pro.fritz.box (p5b1511bf.dip0.t-ipconnect.de
 [91.21.17.191])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by mail.v2201612906741603.powersrv.de (Postfix) with ESMTPSA id B57DADA1697;
 Sun,  7 Feb 2021 17:25:39 +0100 (CET)
Subject: Re: [PATCH v2 63/93] tcg/tci: Use ffi for calls
To: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org
References: <20210204014509.882821-1-richard.henderson@linaro.org>
 <20210204014509.882821-64-richard.henderson@linaro.org>
From: Stefan Weil <sw@weilnetz.de>
Message-ID: <9d107cb2-ee8c-2a89-e004-9996a647a060@weilnetz.de>
Date: Sun, 7 Feb 2021 17:25:39 +0100
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.16; rv:78.0)
 Gecko/20100101 Thunderbird/78.7.0
MIME-Version: 1.0
In-Reply-To: <20210204014509.882821-64-richard.henderson@linaro.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Am 04.02.21 um 02:44 schrieb Richard Henderson:

> This requires adjusting where arguments are stored.
> Place them on the stack at left-aligned positions.
> Adjust the stack frame to be at entirely positive offsets.
>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
[...]
> diff --git a/tcg/tci.c b/tcg/tci.c
> index 6843e837ae..d27db9f720 100644
> --- a/tcg/tci.c
> +++ b/tcg/tci.c
> @@ -18,6 +18,13 @@
>    */
>   
>   #include "qemu/osdep.h"
> +#include "qemu-common.h"
> +#include "tcg/tcg.h"           /* MAX_OPC_PARAM_IARGS */
> +#include "exec/cpu_ldst.h"
> +#include "tcg/tcg-op.h"
> +#include "qemu/compiler.h"
> +#include <ffi.h>
> +


ffi.h is not found on macOS with Homebrew.

This can be fixed by using pkg-config to find the right compiler (and 
maybe also linker) flags:

% pkg-config --cflags libffi
-I/Library/Developer/CommandLineTools/SDKs/MacOSX.sdk/usr/include/ffi
% pkg-config --libs libffi
-lffi

Regards,

Stefan



