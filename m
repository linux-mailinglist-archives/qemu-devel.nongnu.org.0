Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9A1B330ACAF
	for <lists+qemu-devel@lfdr.de>; Mon,  1 Feb 2021 17:33:16 +0100 (CET)
Received: from localhost ([::1]:51638 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l6c8Z-0000Tr-KI
	for lists+qemu-devel@lfdr.de; Mon, 01 Feb 2021 11:33:15 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:52122)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <balaton@eik.bme.hu>)
 id 1l6c6p-0007gd-G4
 for qemu-devel@nongnu.org; Mon, 01 Feb 2021 11:31:27 -0500
Received: from zero.eik.bme.hu ([152.66.115.2]:26511)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <balaton@eik.bme.hu>)
 id 1l6c6l-000295-OV
 for qemu-devel@nongnu.org; Mon, 01 Feb 2021 11:31:26 -0500
Received: from zero.eik.bme.hu (blah.eik.bme.hu [152.66.115.182])
 by localhost (Postfix) with SMTP id DF78D7462BD;
 Mon,  1 Feb 2021 17:31:21 +0100 (CET)
Received: by zero.eik.bme.hu (Postfix, from userid 432)
 id AAC3B7456B7; Mon,  1 Feb 2021 17:31:21 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
 by zero.eik.bme.hu (Postfix) with ESMTP id A91227456B4;
 Mon,  1 Feb 2021 17:31:21 +0100 (CET)
Date: Mon, 1 Feb 2021 17:31:21 +0100 (CET)
From: BALATON Zoltan <balaton@eik.bme.hu>
To: Helge Deller <deller@gmx.de>
Subject: Re: [PATCH] linux-user: fix O_NONBLOCK usage for hppa target
In-Reply-To: <20210201162652.GA25611@ls3530.fritz.box>
Message-ID: <c8ed5552-c460-7dbd-5743-5c7bc8f69c6a@eik.bme.hu>
References: <20210201162652.GA25611@ls3530.fritz.box>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII; format=flowed
X-Spam-Probability: 8%
Received-SPF: pass client-ip=152.66.115.2; envelope-from=balaton@eik.bme.hu;
 helo=zero.eik.bme.hu
X-Spam_score_int: -41
X-Spam_score: -4.2
X-Spam_bar: ----
X-Spam_report: (-4.2 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_MED=-2.3,
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
Cc: John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>,
 =?ISO-8859-15?Q?Philippe_Mathieu-Daud=E9?= <f4bug@amsat.org>,
 Richard Henderson <richard.henderson@linaro.org>,
 Laurent Vivier <laurent@vivier.eu>, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Mon, 1 Feb 2021, Helge Deller wrote:
> Historically the the parisc linux port tried to be compatible with

Double "the the" ^

> HP-UX userspace and as such defined the O_NONBLOCK constant to 0200004
> to emulate separate NDELAY & NONBLOCK values.
>
> Since parisc was the only Linux platform which had two bits set, this
> produced various userspace issues. Finally it was decided to drop the
> (never completed) HP-UX compatibilty, which is why O_NONBLOCK was
> changed upstream to only have one bit set in future with this commit:
> https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit/?id=75ae04206a4d0e4f541c1d692b7febd1c0fdb814
>
> This patch simply adjusts the value for qemu-user too.
>
> Signed-off-by: Helge Deller <deller@gmx.de>
>
> ---
>
> diff --git a/linux-user/hppa/target_fcntl.h b/linux-user/hppa/target_fcntl.h
> index bd966a59b8..08e3a4fcb0 100644
> --- a/linux-user/hppa/target_fcntl.h
> +++ b/linux-user/hppa/target_fcntl.h
> @@ -8,7 +8,7 @@
> #ifndef HPPA_TARGET_FCNTL_H
> #define HPPA_TARGET_FCNTL_H
>
> -#define TARGET_O_NONBLOCK    000200004 /* HPUX has separate NDELAY & NONBLOCK */
> +#define TARGET_O_NONBLOCK    000200000
> #define TARGET_O_APPEND      000000010
> #define TARGET_O_CREAT       000000400 /* not fcntl */
> #define TARGET_O_EXCL        000002000 /* not fcntl */
>
>

