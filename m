Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E7225662758
	for <lists+qemu-devel@lfdr.de>; Mon,  9 Jan 2023 14:40:33 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pErSB-0000wW-W4; Mon, 09 Jan 2023 07:40:40 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <balaton@eik.bme.hu>)
 id 1pErS9-0000vQ-Ee; Mon, 09 Jan 2023 07:40:37 -0500
Received: from zero.eik.bme.hu ([152.66.115.2])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <balaton@eik.bme.hu>)
 id 1pErS7-0003gV-Iw; Mon, 09 Jan 2023 07:40:37 -0500
Received: from zero.eik.bme.hu (blah.eik.bme.hu [152.66.115.182])
 by localhost (Postfix) with SMTP id 8DF5A746324;
 Mon,  9 Jan 2023 13:38:11 +0100 (CET)
Received: by zero.eik.bme.hu (Postfix, from userid 432)
 id 5A4B57462DB; Mon,  9 Jan 2023 13:38:11 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
 by zero.eik.bme.hu (Postfix) with ESMTP id 57A337457E7;
 Mon,  9 Jan 2023 13:38:11 +0100 (CET)
Date: Mon, 9 Jan 2023 13:38:11 +0100 (CET)
From: BALATON Zoltan <balaton@eik.bme.hu>
To: =?ISO-8859-15?Q?Philippe_Mathieu-Daud=E9?= <philmd@linaro.org>
cc: qemu-devel@nongnu.org, qemu-ppc@nongnu.org
Subject: Re: [PATCH 1/5] hw/ppc/sam460ex: Remove unreachable code calling
 pflash_cfi01_register()
In-Reply-To: <20230109120154.2868-2-philmd@linaro.org>
Message-ID: <3185e163-c72d-a741-2b4c-d952932b5948@eik.bme.hu>
References: <20230109120154.2868-1-philmd@linaro.org>
 <20230109120154.2868-2-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="3866299591-646299802-1673267891=:7264"
X-Spam-Probability: 9%
Received-SPF: pass client-ip=152.66.115.2; envelope-from=balaton@eik.bme.hu;
 helo=zero.eik.bme.hu
X-Spam_score_int: -41
X-Spam_score: -4.2
X-Spam_bar: ----
X-Spam_report: (-4.2 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_MED=-2.3,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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

  This message is in MIME format.  The first part should be readable text,
  while the remaining parts are likely unreadable without MIME-aware tools.

--3866299591-646299802-1673267891=:7264
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8BIT

On Mon, 9 Jan 2023, Philippe Mathieu-Daudé wrote:
> Since its QOM'ification in commit 368a354f02 ("pflash_cfi0x:
> QOMified") the pflash_cfi01_register() function does not fail.
>
> This call was later converted with a script to use &error_fatal,
> still unable to fail. Remove the unreachable code.
>
> Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>

Reviewed-by: BALATON Zoltan <balaton@eik.bme.hu>

> ---
> hw/ppc/sam460ex.c | 12 ++++--------
> 1 file changed, 4 insertions(+), 8 deletions(-)
>
> diff --git a/hw/ppc/sam460ex.c b/hw/ppc/sam460ex.c
> index 4a22ce3761..cf7213f7c9 100644
> --- a/hw/ppc/sam460ex.c
> +++ b/hw/ppc/sam460ex.c
> @@ -103,14 +103,10 @@ static int sam460ex_load_uboot(void)
>     DriveInfo *dinfo;
>
>     dinfo = drive_get(IF_PFLASH, 0, 0);
> -    if (!pflash_cfi01_register(FLASH_BASE | ((hwaddr)FLASH_BASE_H << 32),
> -                               "sam460ex.flash", FLASH_SIZE,
> -                               dinfo ? blk_by_legacy_dinfo(dinfo) : NULL,
> -                               64 * KiB, 1, 0x89, 0x18, 0x0000, 0x0, 1)) {
> -        error_report("Error registering flash memory");
> -        /* XXX: return an error instead? */
> -        exit(1);
> -    }
> +    pflash_cfi01_register(FLASH_BASE | ((hwaddr)FLASH_BASE_H << 32),
> +                          "sam460ex.flash", FLASH_SIZE,
> +                          dinfo ? blk_by_legacy_dinfo(dinfo) : NULL,
> +                          64 * KiB, 1, 0x89, 0x18, 0x0000, 0x0, 1));
>
>     if (!dinfo) {
>         /*error_report("No flash image given with the 'pflash' parameter,"
>
--3866299591-646299802-1673267891=:7264--

