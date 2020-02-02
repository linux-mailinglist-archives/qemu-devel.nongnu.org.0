Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1C34B14FE93
	for <lists+qemu-devel@lfdr.de>; Sun,  2 Feb 2020 18:18:41 +0100 (CET)
Received: from localhost ([::1]:58154 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1iyItL-0000Fe-QA
	for lists+qemu-devel@lfdr.de; Sun, 02 Feb 2020 12:18:39 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:35594)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <balaton@eik.bme.hu>) id 1iyIsU-0008IG-2y
 for qemu-devel@nongnu.org; Sun, 02 Feb 2020 12:17:47 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <balaton@eik.bme.hu>) id 1iyIsS-00027S-9K
 for qemu-devel@nongnu.org; Sun, 02 Feb 2020 12:17:45 -0500
Received: from zero.eik.bme.hu ([152.66.115.2]:11765)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <balaton@eik.bme.hu>)
 id 1iyIsR-0001xr-K6; Sun, 02 Feb 2020 12:17:44 -0500
Received: from zero.eik.bme.hu (blah.eik.bme.hu [152.66.115.182])
 by localhost (Postfix) with SMTP id 5DC3974637D;
 Sun,  2 Feb 2020 18:17:33 +0100 (CET)
Received: by zero.eik.bme.hu (Postfix, from userid 432)
 id 33AEF745953; Sun,  2 Feb 2020 18:17:33 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
 by zero.eik.bme.hu (Postfix) with ESMTP id 2FAA974569F;
 Sun,  2 Feb 2020 18:17:33 +0100 (CET)
Date: Sun, 2 Feb 2020 18:17:33 +0100 (CET)
From: BALATON Zoltan <balaton@eik.bme.hu>
To: Greg Kurz <groug@kaod.org>
Subject: Re: [PATCH] tests: Silent various warnings with pseries
In-Reply-To: <158059697130.1820292.7823434132030453110.stgit@bahia.lan>
Message-ID: <alpine.BSF.2.22.395.2002021815430.56200@zero.eik.bme.hu>
References: <158059697130.1820292.7823434132030453110.stgit@bahia.lan>
User-Agent: Alpine 2.22 (BSF 395 2020-01-19)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII; format=flowed
X-detected-operating-system: by eggs.gnu.org: FreeBSD 9.x [fuzzy]
X-Received-From: 152.66.115.2
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
Cc: Laurent Vivier <lvivier@redhat.com>,
 Peter Maydell <peter.maydell@linaro.org>, Thomas Huth <thuth@redhat.com>,
 qemu-devel@nongnu.org, qemu-ppc@nongnu.org,
 David Gibson <david@gibson.dropbear.id.au>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Sat, 1 Feb 2020, Greg Kurz wrote:
> Some default features of the pseries machine are only available with
> KVM. Warnings are printed when the pseries machine is used with another
> accelerator:
>
> qemu-system-ppc64: warning: TCG doesn't support requested feature,
> cap-ccf-assist=on
> qemu-system-ppc64: warning: Firmware Assisted Non-Maskable
> Interrupts(FWNMI) not supported in TCG
> qemu-system-ppc64: warning: TCG doesn't support requested feature,
> cap-ccf-assist=on
> qemu-system-ppc64: warning: Firmware Assisted Non-Maskable
> Interrupts(FWNMI) not supported in TCG
> qemu-system-ppc64: warning: TCG doesn't support requested feature,
> cap-ccf-assist=on
> qemu-system-ppc64: warning: Firmware Assisted Non-Maskable
> Interrupts(FWNMI) not supported in TCG
>
> This is annoying for CI since it usually runs without KVM. We already
> disable features that emit similar warnings thanks to properties of the
> pseries machine, but this is open-coded in various places. Consolidate
> the set of properties in a single place. Extend it to silent the above
> warnings. And use it in the various tests that start pseries machines.
>
> Signed-off-by: Greg Kurz <groug@kaod.org>
> ---
>
> This patch fixes the warnings observed with David's latest pull request.
>
> tests/qtest/boot-serial-test.c    |    3 ++-
> tests/qtest/libqos/libqos-spapr.h |    8 ++++++++
> tests/qtest/prom-env-test.c       |    3 ++-
> tests/qtest/pxe-test.c            |    7 ++++---
> 4 files changed, 16 insertions(+), 5 deletions(-)
>
> diff --git a/tests/qtest/boot-serial-test.c b/tests/qtest/boot-serial-test.c
> index 8e8c5b0a0f0c..85a361428697 100644
> --- a/tests/qtest/boot-serial-test.c
> +++ b/tests/qtest/boot-serial-test.c
> @@ -15,6 +15,7 @@
>
> #include "qemu/osdep.h"
> #include "libqtest.h"
> +#include "libqos/libqos-spapr.h"
>
> static const uint8_t kernel_mcf5208[] = {
>     0x41, 0xf9, 0xfc, 0x06, 0x00, 0x00,     /* lea 0xfc060000,%a0 */
> @@ -112,7 +113,7 @@ static testdef_t tests[] = {
>     { "ppc64", "40p", "-m 192", "Memory: 192M" },
>     { "ppc64", "mac99", "", "PowerPC,970FX" },
>     { "ppc64", "pseries",
> -      "-machine cap-cfpc=broken,cap-sbbc=broken,cap-ibs=broken",
> +      "-machine " PSERIES_DEFAULT_CAPABILITIES,
>       "Open Firmware" },
>     { "ppc64", "powernv8", "", "OPAL" },
>     { "ppc64", "powernv9", "", "OPAL" },
> diff --git a/tests/qtest/libqos/libqos-spapr.h b/tests/qtest/libqos/libqos-spapr.h
> index dcb5c43ad37d..e4460d08ae6e 100644
> --- a/tests/qtest/libqos/libqos-spapr.h
> +++ b/tests/qtest/libqos/libqos-spapr.h
> @@ -7,4 +7,12 @@ QOSState *qtest_spapr_vboot(const char *cmdline_fmt, va_list ap);
> QOSState *qtest_spapr_boot(const char *cmdline_fmt, ...);
> void qtest_spapr_shutdown(QOSState *qs);
>
> +/* List of capabilities needed to silent warnings with TCG */

Typo: I think it should be "to silence warnings" both here and in commit 
message.

Regards,
BALATON Zoltan

