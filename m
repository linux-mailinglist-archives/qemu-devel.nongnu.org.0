Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 14BA160C79B
	for <lists+qemu-devel@lfdr.de>; Tue, 25 Oct 2022 11:09:48 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1onFnh-0000lk-LR; Tue, 25 Oct 2022 05:00:47 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <cfontana@suse.de>) id 1onFjP-000304-ML
 for qemu-devel@nongnu.org; Tue, 25 Oct 2022 04:56:24 -0400
Received: from smtp-out1.suse.de ([2001:67c:2178:6::1c])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <cfontana@suse.de>) id 1onFjI-0000Ir-BT
 for qemu-devel@nongnu.org; Tue, 25 Oct 2022 04:56:19 -0400
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id B910D220B2;
 Tue, 25 Oct 2022 08:56:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1666688168; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=RmcwIbUR+XDSzWRpC24CoDB1NdaZRGjbeTHeW/P0rN0=;
 b=PX2qwnamIJyeii6gGWnU2oQOSIdBFH0xuxeA6Jxe6bM8vloe3TvPnz4/W37qCL8hNLzqAE
 7No3NE45M4GBYCX7ZYgXyO7bSBQhQhtyMhVaJs7l2d7Aqj5zb1WlHZ392m1Q7L+sM0qBQ4
 yT9fWxAKbk3g0n9YCgxkfIKKZhXHjcU=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1666688168;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=RmcwIbUR+XDSzWRpC24CoDB1NdaZRGjbeTHeW/P0rN0=;
 b=risVX8G+kmpJLi0aglLFU/exjxsMRfwjJZGBBGmFZgL9/1eEOeCyPZp3fJrRzeOSCMivQW
 zrQRLPf3UA3gC1BQ==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 9C4A5134CA;
 Tue, 25 Oct 2022 08:56:08 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id R5RpJKikV2P4LgAAMHmgww
 (envelope-from <cfontana@suse.de>); Tue, 25 Oct 2022 08:56:08 +0000
Message-ID: <ce27989e-2a24-f25a-3e30-e415dfd3c971@suse.de>
Date: Tue, 25 Oct 2022 10:56:07 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.4.0
Subject: Re: [PATCH 23/29] accel/tcg: Remove restore_state_to_opc function
Content-Language: en-US
To: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org
References: <20221024132459.3229709-1-richard.henderson@linaro.org>
 <20221024132459.3229709-25-richard.henderson@linaro.org>
From: Claudio Fontana <cfontana@suse.de>
In-Reply-To: <20221024132459.3229709-25-richard.henderson@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2001:67c:2178:6::1c;
 envelope-from=cfontana@suse.de; helo=smtp-out1.suse.de
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
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
Sender: "Qemu-devel" <qemu-devel-bounces@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

Reviewed-by: Claudio Fontana <cfontana@suse.de>

On 10/24/22 15:24, Richard Henderson wrote:
> All targets have been updated.  Use the tcg_ops target hook
> exclusively, which allows the compat code to be removed.
> 
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>  include/exec/exec-all.h   |  3 ---
>  accel/tcg/translate-all.c | 16 ++--------------
>  2 files changed, 2 insertions(+), 17 deletions(-)
> 
> diff --git a/include/exec/exec-all.h b/include/exec/exec-all.h
> index a772e8cbdc..300832bd0b 100644
> --- a/include/exec/exec-all.h
> +++ b/include/exec/exec-all.h
> @@ -39,9 +39,6 @@ typedef ram_addr_t tb_page_addr_t;
>  #define TB_PAGE_ADDR_FMT RAM_ADDR_FMT
>  #endif
>  
> -void restore_state_to_opc(CPUArchState *env, TranslationBlock *tb,
> -                          target_ulong *data) __attribute__((weak));
> -
>  /**
>   * cpu_restore_state:
>   * @cpu: the vCPU state is to be restore to
> diff --git a/accel/tcg/translate-all.c b/accel/tcg/translate-all.c
> index 19cd23e9a0..e4386b3198 100644
> --- a/accel/tcg/translate-all.c
> +++ b/accel/tcg/translate-all.c
> @@ -327,7 +327,7 @@ static int encode_search(TranslationBlock *tb, uint8_t *block)
>  static int cpu_restore_state_from_tb(CPUState *cpu, TranslationBlock *tb,
>                                       uintptr_t searched_pc, bool reset_icount)
>  {
> -    target_ulong data[TARGET_INSN_START_WORDS];
> +    uint64_t data[TARGET_INSN_START_WORDS];
>      uintptr_t host_pc = (uintptr_t)tb->tc.ptr;
>      const uint8_t *p = tb->tc.ptr + tb->tc.size;
>      int i, j, num_insns = tb->icount;
> @@ -368,19 +368,7 @@ static int cpu_restore_state_from_tb(CPUState *cpu, TranslationBlock *tb,
>          cpu_neg(cpu)->icount_decr.u16.low += num_insns - i;
>      }
>  
> -    {
> -        const struct TCGCPUOps *ops = cpu->cc->tcg_ops;
> -        __typeof(ops->restore_state_to_opc) restore = ops->restore_state_to_opc;
> -        if (restore) {
> -            uint64_t d64[TARGET_INSN_START_WORDS];
> -            for (i = 0; i < TARGET_INSN_START_WORDS; ++i) {
> -                d64[i] = data[i];
> -            }
> -            restore(cpu, tb, d64);
> -        } else {
> -            restore_state_to_opc(cpu->env_ptr, tb, data);
> -        }
> -    }
> +    cpu->cc->tcg_ops->restore_state_to_opc(cpu, tb, data);
>  
>  #ifdef CONFIG_PROFILER
>      qatomic_set(&prof->restore_time,


