Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C5E6B6ED143
	for <lists+qemu-devel@lfdr.de>; Mon, 24 Apr 2023 17:26:49 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pqy54-0005zO-HW; Mon, 24 Apr 2023 11:26:18 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pqy52-0005zC-IK
 for qemu-devel@nongnu.org; Mon, 24 Apr 2023 11:26:16 -0400
Received: from mail-wm1-x335.google.com ([2a00:1450:4864:20::335])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pqy50-0006iX-I3
 for qemu-devel@nongnu.org; Mon, 24 Apr 2023 11:26:15 -0400
Received: by mail-wm1-x335.google.com with SMTP id
 5b1f17b1804b1-3f18335a870so29445095e9.0
 for <qemu-devel@nongnu.org>; Mon, 24 Apr 2023 08:26:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1682349972; x=1684941972;
 h=content-transfer-encoding:in-reply-to:from:references:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=n9xu/v3ZOYKMpm4hpom/7dHOOaf5BR7bPw+xqZHWKNA=;
 b=dqlAJQkW6bbVwO8x0VF0J/NLQ+oFN4PvC3DLCFioZnI3cpraZiEXlOB0K7NBQcxVjt
 TrpifO8tPou/69nSZNRdPPQXsNEI82nWgye6zyapHUB3NOVBBs+Q0o6HGQlfCbf9E9Ji
 VvmeRDCAtC1kmCj+FrssDW+zzID1DvfAsTYVTsNtDile9jd7Fz1eQ6tUfMVf6/2Ywn17
 6OJ8TnzuD8Qw0HptTFqTOPZOjgjqurseMd471rhKn7LrwWVovX2I9ehO+gk9GiT20NAD
 0hK46R79gpLSSlXEKYbladN3NkezvgsbbGQV+G1xjYvWc1b7TSMDCkpoEQxdV1V2n0hh
 avXg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1682349972; x=1684941972;
 h=content-transfer-encoding:in-reply-to:from:references:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=n9xu/v3ZOYKMpm4hpom/7dHOOaf5BR7bPw+xqZHWKNA=;
 b=eW7mVY4eC6QFe7kPM8jzo/rZ4hdSmL5KOtJKrW/K8Jfn4c7HW34ysAJAYZfiNp9q0c
 Nq1rGovPnFd0W2sQodu/9WiMzYMvNwWaleenlcI4KRomG0OCHaJ7WZ3YJkXViB7ACaWs
 O8G7HeXu/c79FtZw5zOQPezLm8HKW5J7RHSmjvgr45Sv5Lp7tH7omrPg7e01G3JTc+tn
 t97huKguYaEdV/2CgMm8G0KXTyvbV/dGPs7Uk+dvAXWJhHHiiY2bDXDgceTG5fKBEn2/
 ocxcEz2U31kv/KW9iC0GMOyhLUN9GLeQiQLDAlD51vcXw3ataOJMXQk79EUjU1SNflu7
 P2xA==
X-Gm-Message-State: AAQBX9ezuxbq37Snmkp9v7qqaPrPs2E+F4y46+JiO671eb7MgL00fLwJ
 B9+oJC230fZq+sp697t/hbSSEw==
X-Google-Smtp-Source: AKy350YG+9a58GJW2uSWzPfzIvQrWk/4gUkb7DgMXaf11kWJKQpXC0cnL29lZy7oo+20tA+3skJ4Yw==
X-Received: by 2002:a7b:ca47:0:b0:3f1:9acf:8670 with SMTP id
 m7-20020a7bca47000000b003f19acf8670mr5340994wml.22.1682349972582; 
 Mon, 24 Apr 2023 08:26:12 -0700 (PDT)
Received: from [10.43.0.114] (cust-west-loneq8-46-193-226-34.wb.wifirst.net.
 [46.193.226.34]) by smtp.gmail.com with ESMTPSA id
 k18-20020a05600c0b5200b003edf2dc7ca3sm12368415wmr.34.2023.04.24.08.26.12
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 24 Apr 2023 08:26:12 -0700 (PDT)
Message-ID: <d4aa737d-a148-4fa2-6d0f-bae98dcce371@linaro.org>
Date: Mon, 24 Apr 2023 16:26:10 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.0
Subject: Re: [RFC PATCH v3 26/44] target/loongarch: Implement vsrlrn vsrarn
Content-Language: en-US
To: Song Gao <gaosong@loongson.cn>, qemu-devel@nongnu.org
References: <20230420080709.3352575-1-gaosong@loongson.cn>
 <20230420080709.3352575-27-gaosong@loongson.cn>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20230420080709.3352575-27-gaosong@loongson.cn>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2a00:1450:4864:20::335;
 envelope-from=richard.henderson@linaro.org; helo=mail-wm1-x335.google.com
X-Spam_score_int: -32
X-Spam_score: -3.3
X-Spam_bar: ---
X-Spam_report: (-3.3 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-1.194,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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

On 4/20/23 09:06, Song Gao wrote:
> This patch includes:
> - VSRLRN.{B.H/H.W/W.D};
> - VSRARN.{B.H/H.W/W.D};
> - VSRLRNI.{B.H/H.W/W.D/D.Q};
> - VSRARNI.{B.H/H.W/W.D/D.Q}.
> 
> Signed-off-by: Song Gao<gaosong@loongson.cn>
> ---
>   target/loongarch/disas.c                    |  16 +++
>   target/loongarch/helper.h                   |  16 +++
>   target/loongarch/insn_trans/trans_lsx.c.inc |  16 +++
>   target/loongarch/insns.decode               |  16 +++
>   target/loongarch/lsx_helper.c               | 126 ++++++++++++++++++++
>   5 files changed, 190 insertions(+)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~

