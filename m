Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 844D21AFD7C
	for <lists+qemu-devel@lfdr.de>; Sun, 19 Apr 2020 21:30:05 +0200 (CEST)
Received: from localhost ([::1]:46886 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jQFdk-0002mA-Fb
	for lists+qemu-devel@lfdr.de; Sun, 19 Apr 2020 15:30:04 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51470 helo=eggs1p.gnu.org)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <luc.michel@greensocs.com>) id 1jQFa7-0001n2-Ou
 for qemu-devel@nongnu.org; Sun, 19 Apr 2020 15:26:20 -0400
Received: from Debian-exim by eggs1p.gnu.org with spam-scanned (Exim 4.90_1)
 (envelope-from <luc.michel@greensocs.com>) id 1jQFa7-0000Fy-3g
 for qemu-devel@nongnu.org; Sun, 19 Apr 2020 15:26:19 -0400
Received: from beetle.greensocs.com ([5.135.226.135]:40490)
 by eggs1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <luc.michel@greensocs.com>)
 id 1jQFa6-00008n-Hh
 for qemu-devel@nongnu.org; Sun, 19 Apr 2020 15:26:18 -0400
Received: from [172.17.10.10] (unknown [172.17.10.10])
 by beetle.greensocs.com (Postfix) with ESMTPSA id 45B0696EF0;
 Sun, 19 Apr 2020 19:26:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=greensocs.com;
 s=mail; t=1587324376;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=AvJmfSv0IKwnAqkmKqi3Qi5O3EJChF9fCKGkDoDxihI=;
 b=i+AFtOXe2lRCFYBGlJKoWrvg5mNeS/xVz2nDQQpHIPh1qKTCpJGZIeQSwjYOul8L96QBoE
 iOk5CFch5uKiNgzhHjsznlKdGQMcVVTq/ybk49+UjrOJq53cDYZtriDtzT7eaU6F4aTfgr
 oYrNpYZTQtv1I/vyQriMmksYiRcglF0=
Subject: Re: [PATCH v1 4/6] target/microblaze: Add the unaligned-exceptions
 property
To: "Edgar E. Iglesias" <edgar.iglesias@gmail.com>, qemu-devel@nongnu.org
References: <20200417191022.5247-1-edgar.iglesias@gmail.com>
 <20200417191022.5247-5-edgar.iglesias@gmail.com>
From: Luc Michel <luc.michel@greensocs.com>
Message-ID: <7a0640cc-e30a-577f-57f0-30ab978e4fd3@greensocs.com>
Date: Sun, 19 Apr 2020 21:26:16 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.6.0
MIME-Version: 1.0
In-Reply-To: <20200417191022.5247-5-edgar.iglesias@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US-large
Content-Transfer-Encoding: 7bit
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=greensocs.com; 
 s=mail; t=1587324376;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=AvJmfSv0IKwnAqkmKqi3Qi5O3EJChF9fCKGkDoDxihI=;
 b=uFTB96Nq7nR959R8jusl6kYbM3HxA2I8eskjsEn60+DMuSShZmwaWs2mDTGC7dXEM0YurA
 Wjb4sCGznA7hwMGsBxffl7uqx0MlA+UYiWrbCq97+dnZJZ+CEKjtT3r31M1+UQRBg3d8Bk
 BfBBohbl581PaaBePF8Gfeq4ywrIffc=
ARC-Seal: i=1; s=mail; d=greensocs.com; t=1587324376; a=rsa-sha256; cv=none;
 b=q+xcTgu70aKGJOMF8SXuB7/NK2N/2Vm0sEqubKB8Xcb0Ux+zgoBIVee54aJIWazNrIO0E2
 VK3ZmPAlplMsCSV0lTsj7OneLJ+t/mdpkYGltYZRLz8446vAktCF3ii5tly4rgVANfK/7D
 MhIe+dE15uMah5A+2wtetlNejVZNSC0=
ARC-Authentication-Results: i=1; ORIGINATING;
 auth=pass smtp.auth=luc smtp.mailfrom=luc.michel@greensocs.com
Received-SPF: pass client-ip=5.135.226.135;
 envelope-from=luc.michel@greensocs.com; helo=beetle.greensocs.com
X-detected-operating-system: by eggs1p.gnu.org: Linux 3.11 and newer
X-Received-From: 5.135.226.135
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
Cc: figlesia@xilinx.com, peter.maydell@linaro.org, sstabellini@kernel.org,
 edgar.iglesias@xilinx.com, sai.pavan.boddu@xilinx.com,
 frasse.iglesias@gmail.com, alistair@alistair23.me,
 richard.henderson@linaro.org, frederic.konrad@adacore.com, philmd@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 4/17/20 9:10 PM, Edgar E. Iglesias wrote:
> From: "Edgar E. Iglesias" <edgar.iglesias@xilinx.com>
> 
> Add the unaligned-exceptions property to control if the core
> traps unaligned memory accesses.
> 
> Signed-off-by: Edgar E. Iglesias <edgar.iglesias@xilinx.com>

Reviewed-by: Luc Michel <luc.michel@greensocs.com>

> ---
>  target/microblaze/cpu.c       | 4 ++++
>  target/microblaze/cpu.h       | 1 +
>  target/microblaze/translate.c | 4 ++--
>  3 files changed, 7 insertions(+), 2 deletions(-)
> 
> diff --git a/target/microblaze/cpu.c b/target/microblaze/cpu.c
> index 7a40e2fbad..a850c7b23c 100644
> --- a/target/microblaze/cpu.c
> +++ b/target/microblaze/cpu.c
> @@ -209,6 +209,8 @@ static void mb_cpu_realizefn(DeviceState *dev, Error **errp)
>                                                   PVR2_IOPB_BUS_EXC_MASK : 0) |
>                          (cpu->cfg.illegal_opcode_exception ?
>                                                  PVR2_ILL_OPCODE_EXC_MASK : 0) |
> +                        (cpu->cfg.unaligned_exceptions ?
> +                                                PVR2_UNALIGNED_EXC_MASK : 0) |
>                          (cpu->cfg.opcode_0_illegal ?
>                                                   PVR2_OPCODE_0x0_ILL_MASK : 0);
>  
> @@ -282,6 +284,8 @@ static Property mb_properties[] = {
>                       cfg.illegal_opcode_exception, false),
>      DEFINE_PROP_BOOL("div-zero-exception", MicroBlazeCPU,
>                       cfg.div_zero_exception, false),
> +    DEFINE_PROP_BOOL("unaligned-exceptions", MicroBlazeCPU,
> +                     cfg.unaligned_exceptions, false),
>      DEFINE_PROP_BOOL("opcode-0x0-illegal", MicroBlazeCPU,
>                       cfg.opcode_0_illegal, false),
>      DEFINE_PROP_STRING("version", MicroBlazeCPU, cfg.version),
> diff --git a/target/microblaze/cpu.h b/target/microblaze/cpu.h
> index 3c07f9b3f7..ef9081db40 100644
> --- a/target/microblaze/cpu.h
> +++ b/target/microblaze/cpu.h
> @@ -306,6 +306,7 @@ struct MicroBlazeCPU {
>          bool illegal_opcode_exception;
>          bool opcode_0_illegal;
>          bool div_zero_exception;
> +        bool unaligned_exceptions;
>          char *version;
>          uint8_t pvr;
>      } cfg;
> diff --git a/target/microblaze/translate.c b/target/microblaze/translate.c
> index b4a78551ef..20b7427811 100644
> --- a/target/microblaze/translate.c
> +++ b/target/microblaze/translate.c
> @@ -995,7 +995,7 @@ static void dec_load(DisasContext *dc)
>      v = tcg_temp_new_i32();
>      tcg_gen_qemu_ld_i32(v, addr, mem_index, mop);
>  
> -    if ((dc->cpu->env.pvr.regs[2] & PVR2_UNALIGNED_EXC_MASK) && size > 1) {
> +    if (dc->cpu->cfg.unaligned_exceptions && size > 1) {
>          TCGv_i32 t0 = tcg_const_i32(0);
>          TCGv_i32 treg = tcg_const_i32(dc->rd);
>          TCGv_i32 tsize = tcg_const_i32(size - 1);
> @@ -1110,7 +1110,7 @@ static void dec_store(DisasContext *dc)
>      tcg_gen_qemu_st_i32(cpu_R[dc->rd], addr, mem_index, mop);
>  
>      /* Verify alignment if needed.  */
> -    if ((dc->cpu->env.pvr.regs[2] & PVR2_UNALIGNED_EXC_MASK) && size > 1) {
> +    if (dc->cpu->cfg.unaligned_exceptions && size > 1) {
>          TCGv_i32 t1 = tcg_const_i32(1);
>          TCGv_i32 treg = tcg_const_i32(dc->rd);
>          TCGv_i32 tsize = tcg_const_i32(size - 1);
> 

