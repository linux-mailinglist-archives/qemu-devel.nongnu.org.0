Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7EF082F9BC8
	for <lists+qemu-devel@lfdr.de>; Mon, 18 Jan 2021 10:17:03 +0100 (CET)
Received: from localhost ([::1]:55552 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l1Qek-0005jo-JO
	for lists+qemu-devel@lfdr.de; Mon, 18 Jan 2021 04:17:02 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:42736)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <cfontana@suse.de>) id 1l1QcT-0004Yv-Rg
 for qemu-devel@nongnu.org; Mon, 18 Jan 2021 04:14:41 -0500
Received: from mx2.suse.de ([195.135.220.15]:51442)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <cfontana@suse.de>) id 1l1QcS-0001nv-8c
 for qemu-devel@nongnu.org; Mon, 18 Jan 2021 04:14:41 -0500
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 07039ACF5;
 Mon, 18 Jan 2021 09:14:39 +0000 (UTC)
Subject: Re: [PATCH 1/6] accel/tcg: Make cpu_gen_init() static
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>,
 qemu-devel@nongnu.org
References: <20210117164813.4101761-1-f4bug@amsat.org>
 <20210117164813.4101761-2-f4bug@amsat.org>
From: Claudio Fontana <cfontana@suse.de>
Message-ID: <940ada03-a0ed-8577-44fd-926996c8389b@suse.de>
Date: Mon, 18 Jan 2021 10:14:38 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.12.0
MIME-Version: 1.0
In-Reply-To: <20210117164813.4101761-2-f4bug@amsat.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=195.135.220.15; envelope-from=cfontana@suse.de;
 helo=mx2.suse.de
X-Spam_score_int: -44
X-Spam_score: -4.5
X-Spam_bar: ----
X-Spam_report: (-4.5 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-0.252,
 RCVD_IN_DNSWL_MED=-2.3, RCVD_IN_MSPIKE_H3=-0.01, RCVD_IN_MSPIKE_WL=-0.01,
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
Cc: Peter Maydell <peter.maydell@linaro.org>, Riku Voipio <riku.voipio@iki.fi>,
 Eduardo Habkost <ehabkost@redhat.com>, Huacai Chen <chenhuacai@kernel.org>,
 Richard Henderson <richard.henderson@linaro.org>,
 Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 1/17/21 5:48 PM, Philippe Mathieu-Daudé wrote:
> cpu_gen_init() is TCG specific, only used in tcg/translate-all.c.
> No need to export it to other accelerators, declare it statically.
> 
> Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
> ---
> We could also inline the 1-line call..
> ---
>  include/exec/exec-all.h   | 2 --
>  accel/tcg/translate-all.c | 2 +-
>  2 files changed, 1 insertion(+), 3 deletions(-)
> 
> diff --git a/include/exec/exec-all.h b/include/exec/exec-all.h
> index 2e5b4bba48f..516013e735a 100644
> --- a/include/exec/exec-all.h
> +++ b/include/exec/exec-all.h
> @@ -47,8 +47,6 @@ void gen_intermediate_code(CPUState *cpu, TranslationBlock *tb, int max_insns);
>  void restore_state_to_opc(CPUArchState *env, TranslationBlock *tb,
>                            target_ulong *data);
>  
> -void cpu_gen_init(void);
> -
>  /**
>   * cpu_restore_state:
>   * @cpu: the vCPU state is to be restore to
> diff --git a/accel/tcg/translate-all.c b/accel/tcg/translate-all.c
> index e9de6ff9dd7..ca7ef6aa177 100644
> --- a/accel/tcg/translate-all.c
> +++ b/accel/tcg/translate-all.c
> @@ -243,7 +243,7 @@ static void page_table_config_init(void)
>      assert(v_l2_levels >= 0);
>  }
>  
> -void cpu_gen_init(void)
> +static void cpu_gen_init(void)
>  {
>      tcg_context_init(&tcg_init_ctx);
>  }
> 


Reviewed-by: Claudio Fontana <cfontana@suse.de>

