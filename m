Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 685B93F5061
	for <lists+qemu-devel@lfdr.de>; Mon, 23 Aug 2021 20:31:05 +0200 (CEST)
Received: from localhost ([::1]:51210 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mIEiu-0007vo-Gx
	for lists+qemu-devel@lfdr.de; Mon, 23 Aug 2021 14:31:04 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41980)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mIEhl-0007GO-Qp
 for qemu-devel@nongnu.org; Mon, 23 Aug 2021 14:29:54 -0400
Received: from mail-pl1-x631.google.com ([2607:f8b0:4864:20::631]:39592)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mIEhk-0003q5-9m
 for qemu-devel@nongnu.org; Mon, 23 Aug 2021 14:29:53 -0400
Received: by mail-pl1-x631.google.com with SMTP id m17so3628518plc.6
 for <qemu-devel@nongnu.org>; Mon, 23 Aug 2021 11:29:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=d22e1bjhc4t4JfysSvBySPhkl0sAlx+esyQuZ3Rgvzw=;
 b=CpttS7su7WKF4+xfE6to4A3lx0YrBiD1TZf4ZORLY/YoXYSUrhXM96QleQvj4F85eK
 27P2/U3fVl7SEpWzXMKoqqQZkwmRS7VPtkFr9/0OGF4CChZ5qse7kBf/0PHvjIbzDOSk
 CLOiAy4KYWnhksp0M6g1Eftbwo/n4jQCuew8wGakdoYBHcew3ozXdxXxxr3ohooMq1ip
 UrS7PShn+XSYEGlFiCXYKGvhgmJ6eCOLzhy/tdPK43BaQt/bB9QioCsnLhSo7p7RXAYM
 tfUN+amxBdIqcszqljhRRQpkPa7V3s+iN83QXAs4L0XPlD1laCfbnd3Koyl1QLYJ+Xqj
 m9Hw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=d22e1bjhc4t4JfysSvBySPhkl0sAlx+esyQuZ3Rgvzw=;
 b=lwIkDGqzmzGK20fllZy6+AyIrMd/GGmZLdE+ui5BC2JCrv+bkMvfkmmjCT+nN0+BE4
 eiUS70KvSE7at/Em1zpye/XsemJ16GNe264sHN1mmdvpy1Qxdi8o0wluj2a6yzucsoVZ
 kSrChWx2Ur8+IMSR4eu1r1bwfDUR67giC0YWFjpfvEwFwkUTcyKbCGGeckdQgWoPQX0d
 B5bKrRXcRNY1FqFwRvKp138g9P3S5IYiqlmi0cMCYQLuYMfvXGDaqEeivug2Tks03QqP
 jot8//50wk2e4tc7MG9xRvftEuxJPB2vtmxZJ01IkWeIKikOzbmPZnb9PuwJhPQS6qJn
 9Eog==
X-Gm-Message-State: AOAM531/U/Tv5bQ9naUyxIGT3CNDIiUr+/FGXaNYp/MxqdNRNC2896ck
 LGc/r1J41YbFMvuUzCHJpXNqNw==
X-Google-Smtp-Source: ABdhPJxawARpSrpx4f4d0UiwlNyrFPMcIUOOSngTiBDZ1cPTDgJlc3NTT9UrXtR7HBuOlH3LRgALiw==
X-Received: by 2002:a17:902:a70e:b0:12d:9eff:23be with SMTP id
 w14-20020a170902a70e00b0012d9eff23bemr29408644plq.34.1629743390390; 
 Mon, 23 Aug 2021 11:29:50 -0700 (PDT)
Received: from [192.168.1.11] ([71.212.149.176])
 by smtp.gmail.com with ESMTPSA id j16sm12178018pfc.70.2021.08.23.11.29.49
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 23 Aug 2021 11:29:50 -0700 (PDT)
Subject: Re: [PATCH v4 07/14] target/riscv: Add instructions of the
 Zbc-extension
To: Philipp Tomsich <philipp.tomsich@vrull.eu>, qemu-devel@nongnu.org
References: <20210823181132.2205367-1-philipp.tomsich@vrull.eu>
 <20210823181132.2205367-8-philipp.tomsich@vrull.eu>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <0c31d427-77fc-d2a2-6571-4e083880fbfb@linaro.org>
Date: Mon, 23 Aug 2021 11:29:48 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20210823181132.2205367-8-philipp.tomsich@vrull.eu>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::631;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x631.google.com
X-Spam_score_int: -40
X-Spam_score: -4.1
X-Spam_bar: ----
X-Spam_report: (-4.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-2.023,
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
Cc: Kito Cheng <kito.cheng@sifive.com>,
 Alistair Francis <alistair.francis@wdc.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 8/23/21 11:11 AM, Philipp Tomsich wrote:
> +    /* ... then shift the result 1 bit to the right. */
> +    TCGv dst = tcg_temp_new();
> +    gen_get_gpr(dst, a->rd);
> +    tcg_gen_shri_tl(dst, dst, 1);
> +    gen_set_gpr(a->rd, dst);
> +    tcg_temp_free(dst);

Missed review changes from v3:

static void gen_clmulh(TCGv dst, TCGv src1, TCGv src2)
{
     gen_helper_clmulr(dst, src1, src2);
     tcg_gen_shri_tl(dst, dst, 1);
}


r~

