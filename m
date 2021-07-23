Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A2BB73D310E
	for <lists+qemu-devel@lfdr.de>; Fri, 23 Jul 2021 02:52:47 +0200 (CEST)
Received: from localhost ([::1]:33178 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m6jQk-0004i8-Nl
	for lists+qemu-devel@lfdr.de; Thu, 22 Jul 2021 20:52:46 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:32964)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1m6jPp-00042x-DM
 for qemu-devel@nongnu.org; Thu, 22 Jul 2021 20:51:49 -0400
Received: from mail-pl1-x632.google.com ([2607:f8b0:4864:20::632]:42940)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1m6jPn-0004H2-W5
 for qemu-devel@nongnu.org; Thu, 22 Jul 2021 20:51:49 -0400
Received: by mail-pl1-x632.google.com with SMTP id i1so1274265plr.9
 for <qemu-devel@nongnu.org>; Thu, 22 Jul 2021 17:51:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=WE5ha7FcWH9gXAHPbaB4p/EbWtu/suSYTi0uB6u7cf4=;
 b=nl1chZXT3D/wJAB/MXpppE2MtFMvnXuBWRq/dsKklBAmSXIO2HWaHfsapsahZEdZ69
 OAjmhF0gieNraqeH5K5WZ0+/50OWLnQxBcI4s9Z8j9VGaBeWfxvw91CVLEMZcYCYlwRP
 Ww92DkFXHY6nVaD4rgCc/GYZExjQXzdgeVgsRia/K5/2R4HCQ8KTJdHFM0LKPTM1VqbL
 TzBWhdEq+IDZkuRudJElkCPHGMAKsUk8y2inqpB0abg1VZeEhRa5WrORhAt2uk4+sVbB
 cnkG+el7Cufz6GdClfB2tg8jqQPceFT/n8kbTa2JMEEqk3473N2kZ7E+9J09H8ET/e4g
 AEcA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=WE5ha7FcWH9gXAHPbaB4p/EbWtu/suSYTi0uB6u7cf4=;
 b=GRgrnudaT1p4BmZRZvIe+eRZgs1/KIVawm2qxKyqHtGJC9IuBK0/E870joFMnyRvP7
 SwQcHlRSCZXda7/DWhyGlC9c0Vd0W2oinVaQI5+S/pv3JCWxpFBAmBLpgfs8Iq3d5Gsn
 tDPvm4X60fQvHeL/1tq0am6VJWIFK260GBU5HhBIILb1pfM6v2ClE+IIVDrLo/iP3teH
 u4tov73QBveVNIPFHetoIgx9yBr12FDlDqbLSyHSjyYR8Fv68qascShrOdqGzpuEdXNR
 Lldv5fSEePRUvUUemTMt7O8D54qD7qKsyNLWkA6gCJMB7LYUyqqcecLphR8GvEW3S/Pb
 cgMw==
X-Gm-Message-State: AOAM530LSRdKr162KHxkxeRIR2vUFzbh9sMl1xoAKS9RhWGE/2bzckM8
 EL1fAr5gJto1S4torkqHG8Bq5g==
X-Google-Smtp-Source: ABdhPJxvBWoldkP69KUh33sM9CS+nmiosMFZ0q8r7UM473OYEj9khBClr5YmGWeJB87wdLnsT4d+uw==
X-Received: by 2002:a17:902:a513:b029:11a:9be6:f1b9 with SMTP id
 s19-20020a170902a513b029011a9be6f1b9mr1815071plq.55.1627001506264; 
 Thu, 22 Jul 2021 17:51:46 -0700 (PDT)
Received: from [192.168.3.43] (204-210-126-223.res.spectrum.com.
 [204.210.126.223])
 by smtp.gmail.com with ESMTPSA id q14sm30764366pff.209.2021.07.22.17.51.44
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 22 Jul 2021 17:51:45 -0700 (PDT)
Subject: Re: [PATCH v2 08/22] target/loongarch: Add fixed point shift
 instruction translation
To: Song Gao <gaosong@loongson.cn>, qemu-devel@nongnu.org
References: <1626861198-6133-1-git-send-email-gaosong@loongson.cn>
 <1626861198-6133-9-git-send-email-gaosong@loongson.cn>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <1a19e8ba-e408-7952-9bea-2022a78f67f2@linaro.org>
Date: Thu, 22 Jul 2021 14:51:42 -1000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <1626861198-6133-9-git-send-email-gaosong@loongson.cn>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::632;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x632.google.com
X-Spam_score_int: -22
X-Spam_score: -2.3
X-Spam_bar: --
X-Spam_report: (-2.3 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.203,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: peter.maydell@linaro.org, thuth@redhat.com, chenhuacai@gmail.com,
 philmd@redhat.com, yangxiaojuan@loongson.cn, laurent@vivier.eu,
 maobibo@loongson.cn, alistair.francis@wdc.com, pbonzini@redhat.com,
 alex.bennee@linaro.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 7/20/21 11:53 PM, Song Gao wrote:
> +/* Fixed point shift operation instruction translation */
> +static bool trans_sll_w(DisasContext *ctx, arg_sll_w *a)
> +{
> +    TCGv t0, t1;
> +    TCGv Rd = cpu_gpr[a->rd];
> +
> +    if (a->rd == 0) {
> +        /* Nop */
> +        return true;
> +    }
> +
> +    t0 = tcg_temp_new();
> +    t1 = get_gpr(a->rj);
> +
> +    gen_load_gpr(t0, a->rk);
> +
> +    tcg_gen_andi_tl(t0, t0, 0x1f);
> +    tcg_gen_shl_tl(t0, t1, t0);
> +    tcg_gen_ext32s_tl(Rd, t0);
> +
> +    tcg_temp_free(t0);
> +
> +    return true;
> +}

Again, you should be using common helper functions for this instead of replicating the 
same pattern 16 times.

r~

