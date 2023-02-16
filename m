Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0953769998B
	for <lists+qemu-devel@lfdr.de>; Thu, 16 Feb 2023 17:12:22 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pSgr6-0000Im-S2; Thu, 16 Feb 2023 11:11:32 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <palmer@dabbelt.com>)
 id 1pSgr4-0000Fi-0h
 for qemu-devel@nongnu.org; Thu, 16 Feb 2023 11:11:30 -0500
Received: from mail-pj1-x102e.google.com ([2607:f8b0:4864:20::102e])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <palmer@dabbelt.com>)
 id 1pSgr0-0003iI-Nn
 for qemu-devel@nongnu.org; Thu, 16 Feb 2023 11:11:29 -0500
Received: by mail-pj1-x102e.google.com with SMTP id
 pg6-20020a17090b1e0600b002349579949aso2192542pjb.5
 for <qemu-devel@nongnu.org>; Thu, 16 Feb 2023 08:11:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=dabbelt-com.20210112.gappssmtp.com; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:to:from:cc
 :in-reply-to:subject:date:from:to:cc:subject:date:message-id
 :reply-to; bh=k79Gko0Q1kMwiwws/VU8+e329nHhshqEAiEA3h5Z1TU=;
 b=pexGYqTnwRoZVHW0uUmZ/ZkGpfYo44MG8JUw8B+2/Wj6fHOGjDa2zYnEoiJzCygT7m
 bcDqBVNR5Dm9aORNtETt4sKItxwD9b2gbJuGxNkuKxjllm5oa2S7m3puhqwr3d61I2z7
 GHD5HHGdZ19HSVLKoH7K7ktNdYw4rw5i/YAbTUyT3qEXMrx1gDl9ZsjgdGZt0RK6wYce
 ziszc+sFt98Eb8xm1LHYp4JbHHhG6x2GDOmuJbXEDyIv1KeqLNWrtiYMPQ8ps7WI3p7N
 KkR/GsgdHkq62GHsThoO78IiXZAE1cbAlXh7FD4MfEhN0r8uN+57KaOLYlA23plTPc8G
 21hw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:to:from:cc
 :in-reply-to:subject:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=k79Gko0Q1kMwiwws/VU8+e329nHhshqEAiEA3h5Z1TU=;
 b=0y7ep1/jFk21kymfQXg56p4y/Kn4SrPXd24jNqktgh+BtBt8qjtYpWB/eh1dRbhchF
 6eA5w5yB1PlK5Uckl3uEoldBtcGCbfBacYi+Hk2yqjB/uH0+KqJQDWdzbq0gCTuDCjs7
 ssLpdIgm46HaH2LgO1ZSfY2km660oSHRcALC+jnQoFvGYjE5U7Med3AKNc6uE7f/RXhD
 hJbTLTmMXpDREGOxuNNhBTt2Az+Jrgo9tpBBOZF8EdiSbCQ92kIm8b89qzjW2pVKT9lq
 Jw5Qhr1Z9YaS5048VsZWZQ5C78N7jcmhy9LnUzQKEjz3Rrosi4vQx3DsFKKZUpLNBkr0
 QsWA==
X-Gm-Message-State: AO0yUKXJilhA+Dambyv1TTTYGS1FV5ipiDnbnOT4gXG9uKwbapd099dH
 h1Rt33FRJnLvOzpiTNaINnfoKe9WqVMtJomm
X-Google-Smtp-Source: AK7set+yFjK2/rm3bIxZU3JIzSMnm/mB7Jf21hha7HqgBy1Ka3/w9bRx//+im4WPGTE14Oj2UOfkWQ==
X-Received: by 2002:a17:903:2c5:b0:19a:ebdf:1994 with SMTP id
 s5-20020a17090302c500b0019aebdf1994mr2919483plk.52.1676563884341; 
 Thu, 16 Feb 2023 08:11:24 -0800 (PST)
Received: from localhost ([50.221.140.188]) by smtp.gmail.com with ESMTPSA id
 a14-20020a170902ecce00b0019a6f32e6c1sm1523255plh.148.2023.02.16.08.11.23
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 16 Feb 2023 08:11:23 -0800 (PST)
Date: Thu, 16 Feb 2023 08:11:23 -0800 (PST)
X-Google-Original-Date: Thu, 16 Feb 2023 08:08:27 PST (-0800)
Subject: Re: [PATCH] target/riscv: avoid env_archcpu() in
 cpu_get_tb_cpu_state()
In-Reply-To: <20230210123836.506286-1-dbarboza@ventanamicro.com>
CC: qemu-devel@nongnu.org, qemu-riscv@nongnu.org,
 Alistair Francis <Alistair.Francis@wdc.com>, dbarboza@ventanamicro.com
From: Palmer Dabbelt <palmer@dabbelt.com>
To: dbarboza@ventanamicro.com
Message-ID: <mhng-31cc5368-ff22-4644-b6c0-7aecd425b60f@palmer-ri-x1c9a>
Mime-Version: 1.0 (MHng)
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::102e;
 envelope-from=palmer@dabbelt.com; helo=mail-pj1-x102e.google.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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

On Fri, 10 Feb 2023 04:38:36 PST (-0800), dbarboza@ventanamicro.com wrote:
> We have a RISCVCPU *cpu pointer available at the start of the function.
>
> Signed-off-by: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
> ---
>  target/riscv/cpu_helper.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/target/riscv/cpu_helper.c b/target/riscv/cpu_helper.c
> index ad8d82662c..3a9472a2ff 100644
> --- a/target/riscv/cpu_helper.c
> +++ b/target/riscv/cpu_helper.c
> @@ -60,7 +60,7 @@ void cpu_get_tb_cpu_state(CPURISCVState *env, target_ulong *pc,
>           * which is not supported by GVEC. So we set vl_eq_vlmax flag to true
>           * only when maxsz >= 8 bytes.
>           */
> -        uint32_t vlmax = vext_get_vlmax(env_archcpu(env), env->vtype);
> +        uint32_t vlmax = vext_get_vlmax(cpu, env->vtype);
>          uint32_t sew = FIELD_EX64(env->vtype, VTYPE, VSEW);
>          uint32_t maxsz = vlmax << sew;
>          bool vl_eq_vlmax = (env->vstart == 0) && (vlmax == env->vl) &&

Thanks, applied to riscv-to-apply.next

