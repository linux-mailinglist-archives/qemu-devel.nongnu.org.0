Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B424C47680
	for <lists+qemu-devel@lfdr.de>; Sun, 16 Jun 2019 20:54:24 +0200 (CEST)
Received: from localhost ([::1]:42164 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.86_2)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1hcaIJ-00031L-UO
	for lists+qemu-devel@lfdr.de; Sun, 16 Jun 2019 14:54:23 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60152)
 by lists.gnu.org with esmtp (Exim 4.86_2)
 (envelope-from <imammedo@redhat.com>) id 1hcaDx-0001VA-G5
 for qemu-devel@nongnu.org; Sun, 16 Jun 2019 14:49:55 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <imammedo@redhat.com>) id 1hcaDw-0008S4-Ei
 for qemu-devel@nongnu.org; Sun, 16 Jun 2019 14:49:53 -0400
Received: from mx1.redhat.com ([209.132.183.28]:46124)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <imammedo@redhat.com>) id 1hcaDw-0008Q2-6C
 for qemu-devel@nongnu.org; Sun, 16 Jun 2019 14:49:52 -0400
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id 94976C057F88;
 Sun, 16 Jun 2019 18:49:50 +0000 (UTC)
Received: from localhost (unknown [10.43.2.182])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 6AA3490C50;
 Sun, 16 Jun 2019 18:49:47 +0000 (UTC)
Date: Sun, 16 Jun 2019 20:49:42 +0200
From: Igor Mammedov <imammedo@redhat.com>
To: Yoshinori Sato <ysato@users.sourceforge.jp>
Message-ID: <20190616204942.4131a648@redhat.com>
In-Reply-To: <20190616142836.10614-18-ysato@users.sourceforge.jp>
References: <20190616142836.10614-1-ysato@users.sourceforge.jp>
 <20190616142836.10614-18-ysato@users.sourceforge.jp>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
 (mx1.redhat.com [10.5.110.32]); Sun, 16 Jun 2019 18:49:50 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: Re: [Qemu-devel] [PATCH v20 17/24] target/rx: Move rx_load_image to
 rx-virt.
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
Cc: peter.maydell@linaro.org, richard.henderson@linaro.org,
 qemu-devel@nongnu.org, philmd@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Sun, 16 Jun 2019 23:28:29 +0900
Yoshinori Sato <ysato@users.sourceforge.jp> wrote:

> Signed-off-by: Yoshinori Sato <ysato@users.sourceforge.jp>
> ---
>  hw/rx/rx-virt.c | 22 ++++++++++++++++++++++
>  target/rx/cpu.c | 22 ----------------------
>  2 files changed, 22 insertions(+), 22 deletions(-)
> 
> diff --git a/hw/rx/rx-virt.c b/hw/rx/rx-virt.c
> index ed0a3a1da0..4cfe2e3123 100644
> --- a/hw/rx/rx-virt.c
> +++ b/hw/rx/rx-virt.c
> @@ -32,6 +32,28 @@
>  /* Same address of GDB integrated simulator */
>  #define SDRAM_BASE 0x01000000
>  
> +static void rx_load_image(RXCPU *cpu, const char *filename,
> +                          uint32_t start, uint32_t size)

function shouldn't be added to target/rx/cpu.c at all,
it should be introduced in 16/24 instead and this patch
shouldn't exist.

> +{
> +    static uint32_t extable[32];
> +    long kernel_size;
> +    int i;
> +
> +    kernel_size = load_image_targphys(filename, start, size);
> +    if (kernel_size < 0) {
> +        fprintf(stderr, "qemu: could not load kernel '%s'\n", filename);
> +        exit(1);
> +    }
> +    cpu->env.pc = start;
> +
> +    /* setup exception trap trampoline */
> +    /* linux kernel only works little-endian mode */
> +    for (i = 0; i < ARRAY_SIZE(extable); i++) {
> +        extable[i] = cpu_to_le32(0x10 + i * 4);
> +    }
> +    rom_add_blob_fixed("extable", extable, sizeof(extable), 0xffffff80);
> +}
> +
>  static void rxvirt_init(MachineState *machine)
>  {
>      RX62NState *s = g_new(RX62NState, 1);
> diff --git a/target/rx/cpu.c b/target/rx/cpu.c
> index e3d76af55d..ea38639f47 100644
> --- a/target/rx/cpu.c
> +++ b/target/rx/cpu.c
> @@ -215,25 +215,3 @@ static void rx_cpu_register_types(void)
>  }
>  
>  type_init(rx_cpu_register_types)
> -
> -void rx_load_image(RXCPU *cpu, const char *filename,
> -                   uint32_t start, uint32_t size)
> -{
> -    static uint32_t extable[32];
> -    long kernel_size;
> -    int i;
> -
> -    kernel_size = load_image_targphys(filename, start, size);
> -    if (kernel_size < 0) {
> -        fprintf(stderr, "qemu: could not load kernel '%s'\n", filename);
> -        exit(1);
> -    }
> -    cpu->env.pc = start;
> -
> -    /* setup exception trap trampoline */
> -    /* linux kernel only works little-endian mode */
> -    for (i = 0; i < ARRAY_SIZE(extable); i++) {
> -        extable[i] = cpu_to_le32(0x10 + i * 4);
> -    }
> -    rom_add_blob_fixed("extable", extable, sizeof(extable), 0xffffff80);
> -}


