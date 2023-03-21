Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BB5D96C3655
	for <lists+qemu-devel@lfdr.de>; Tue, 21 Mar 2023 16:57:26 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1peeL9-0002Dh-90; Tue, 21 Mar 2023 11:55:59 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1peeL5-0002C2-Un
 for qemu-devel@nongnu.org; Tue, 21 Mar 2023 11:55:55 -0400
Received: from mail-pg1-x530.google.com ([2607:f8b0:4864:20::530])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1peeL1-00056Y-T0
 for qemu-devel@nongnu.org; Tue, 21 Mar 2023 11:55:53 -0400
Received: by mail-pg1-x530.google.com with SMTP id q189so8841388pga.9
 for <qemu-devel@nongnu.org>; Tue, 21 Mar 2023 08:55:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1679414150;
 h=content-transfer-encoding:in-reply-to:from:references:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=VFPZ62Pb0PZdWg9odVktIa4xyDCR7IN84qIuOn0Gp28=;
 b=r2MPPNOtZ70jjt6IYgK0dIFOK6EvYp8k1VEHimGckBuK6AYKP0oqz85ELu/9isa1q1
 ZLqa87iF9adu+1HOyvLW/dWzQbEjKQ3cOE07r1FGwYBIjnl1VHOK5JrngsTTpf9FuJen
 Mt0qmh6KNQaMKe+QyhLWZgvUScSrp20nCXJi/cmF45QQDOCkbVzrw+3r0IwCXo9V6eyu
 /5nY0iCIh+fIjfMl/OjbeGLZ0RwYi0x7rf0i771jHr6sKDPof0Ws7KYzTs4hgGWuYWcM
 mxwiHWAZdyloEbUYH+yqkrdTtkM0IPNqIhXrQ2gmvhXp+k1QQnpBxeBMNyni4nKwLGnl
 QNuw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1679414150;
 h=content-transfer-encoding:in-reply-to:from:references:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=VFPZ62Pb0PZdWg9odVktIa4xyDCR7IN84qIuOn0Gp28=;
 b=v0nGuaCFN2l9DFtDKE1wA4ilKd0OmRdIU+POmiEMtbH0o4eIv2tXMVQiagqLiEy4FE
 SbqsrEa164V7cOvRjoEa4qu/XX95ROheyfhR8pM/r9iNKkZMwJvwIkhL/vnNTmPMV1/c
 sJY/bboYecvT13o5I+CMkBJjiR7/e4jftv4bFWNps7vbjJaAjEeNHg2dPjd0huYdZf42
 mKi8zxvVk21DyfwArHkR9843oP/4tFaiWhNEp4iey4dlGgLX0igA7Pp3EtbiQb3m+z44
 YsutFArFNEZfK5//PMFnJJs8+kHIK0eXoxwsp3ZdeRAqYl/WkhkoknG64zK8/2GhVk5p
 yvoA==
X-Gm-Message-State: AO0yUKVb2ebUXweg6O43xXElpRA0L7FPJx2Dt0oo43Vcvd1FGRGnKELO
 ZGD4LFtBc0DmUKubnn680/Ci0g==
X-Google-Smtp-Source: AK7set+0w0sJV1jUkeP+mVyISrn5ALnqj58rwRLtxr4N93FG1RK61sYF/UH0YtzQsc9+vtUFrAE27w==
X-Received: by 2002:a62:30c3:0:b0:628:105:8ef9 with SMTP id
 w186-20020a6230c3000000b0062801058ef9mr239368pfw.20.1679414150208; 
 Tue, 21 Mar 2023 08:55:50 -0700 (PDT)
Received: from [192.168.149.130] (097-090-106-114.biz.spectrum.com.
 [97.90.106.114]) by smtp.gmail.com with ESMTPSA id
 11-20020aa7910b000000b00625e14d3a15sm8333103pfh.166.2023.03.21.08.55.49
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 21 Mar 2023 08:55:49 -0700 (PDT)
Message-ID: <5fa5ed5d-b263-ddeb-7f97-e25a56bd27cb@linaro.org>
Date: Tue, 21 Mar 2023 08:55:47 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Subject: Re: [RFC PATCH 40/43] target/loongarch: Implement vreplve vpack vpick
Content-Language: en-US
To: gaosong <gaosong@loongson.cn>, qemu-devel@nongnu.org
References: <20221224081633.4185445-1-gaosong@loongson.cn>
 <20221224081633.4185445-41-gaosong@loongson.cn>
 <f47ae8f2-9563-750a-d190-d6ad90600be6@linaro.org>
 <9191ffdb-9bd7-97f4-232b-fa8f5f4d240c@loongson.cn>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <9191ffdb-9bd7-97f4-232b-fa8f5f4d240c@loongson.cn>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::530;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x530.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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

On 3/21/23 04:31, gaosong wrote:
> but for this case.
> e.g
> vreplve_b  vd vj, rk
> index  = gpr[rk] % (128/8);
> Vd->B(i) = Vj->B(index);
> tcg_gen_gvec_dup_mem(MO_8, vreg_full_offset(a->vd), offsetof(CPULoongArchState, 
> fpr[a->vj].vreg.B(index))), 16, 16 );
> 
> How can we get the index with cpu_env? or  need env->gpr[rk]?
> The index type is not TCGv.

For this case you would load the value Vj->B(index) into a TCGv_i32,

	tcg_gen_andi_i64(t0, gpr_src(rk), 15);

	// Handle endian adjustment on t0, e.g. xor 15 for big-endian?

	tcg_gen_trunc_i64_ptr(t1, t0);
	tcg_gen_add_ptr(t1, t1, cpu_env);
	tcg_gen_ld8u_i32(t2, t1, vreg_full_offset(vj));

	// At this point t2 contains Vj->B(index)

	tcg_gen_gvec_dup_i32(MO_8, vreg_full_offset(vd), 16, 16, t2);



r~

