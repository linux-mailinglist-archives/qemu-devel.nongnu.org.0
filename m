Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6BE0D6EC640
	for <lists+qemu-devel@lfdr.de>; Mon, 24 Apr 2023 08:25:23 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pqpbz-0008Jq-EC; Mon, 24 Apr 2023 02:23:43 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pqpbs-0008Jd-8O
 for qemu-devel@nongnu.org; Mon, 24 Apr 2023 02:23:36 -0400
Received: from mail-wm1-x331.google.com ([2a00:1450:4864:20::331])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pqpbp-0005xO-Uc
 for qemu-devel@nongnu.org; Mon, 24 Apr 2023 02:23:35 -0400
Received: by mail-wm1-x331.google.com with SMTP id
 5b1f17b1804b1-3f199696149so10124415e9.0
 for <qemu-devel@nongnu.org>; Sun, 23 Apr 2023 23:23:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1682317412; x=1684909412;
 h=content-transfer-encoding:in-reply-to:from:references:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=aD3citYb3HM/tzR9vw5A5mwxfUowlg3d8mmEOKLYwDs=;
 b=g2rZD2JEsq8ZXeiLPZOVGKwqYLEFh3E/+mhDYQUl0Cpz4gH8cGMcmCFX+tYHQXE1ph
 ROcgD3uPU1275QUOVk4XM1QPafRUg7I7DW+N6nNkpZPPLVkZ4bnq4uBSFGQJeBX7wdXD
 3e2LZkDgretwidUvxWPsh4ygblg44e1biYhK9heT+Hnk9VBJK0pq34xDw/+ZRdlCyX5T
 RgW71a/1xpBdA3mZBA4lVg6z6VMFiJzf/fFHYjjg1PsnWlrDuSzmfF8eUamZbmnk30Go
 lCGbePEO/OEgn7eopckJ0zKvLQwD5RYaKC+jI02XGfVpuX2KU3BEdWf5yxifTmHIeQ3X
 VdAQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1682317412; x=1684909412;
 h=content-transfer-encoding:in-reply-to:from:references:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=aD3citYb3HM/tzR9vw5A5mwxfUowlg3d8mmEOKLYwDs=;
 b=cpSCKuVUzkNuxowmyHuox0oCFDEsOLL2CzE/lwTQHhAwrxe80+sJe9xA+vR2BhE+b+
 xWZn3SWlq+WRDE4AkvduKdGC/Ac4OSh4AAzaprPF8e5mfpL3bYj8NVqszxnrIdF3p0IX
 +m+y6aYHzcLpQ9sgPmAl+nCufa8bBPqYSpTcBDNPbsNrmFXjTPB1xzrp2NShR3UIgQNA
 OFhSqB5hiJO2UemE4htbBJp9QxC7D8jDmfucY46Nh+2e9x8CjSsJo1BON0BllDjfTHi3
 RF0P5Dup/jW8wOrKvAgwZiSH9Zrwdrc+FBB/1XuJPX6JXLPoiczbKUCIcvoBMuZ2rgBp
 ZEfg==
X-Gm-Message-State: AAQBX9dWad2FcmaqAywUuelPueWyop4YdvSkZ63TGVmeUCl/agqNoeiG
 HFk5UUaUIRd6zpNI82OubDp/lEPSYCXodIBbC+YEDw==
X-Google-Smtp-Source: AKy350YnAsRNopW4dXKU35Q8VahN0HwdzEzEWw+c/WAVtXhoMbi96MEKOXVO75gapMWM/I4VsmmiTA==
X-Received: by 2002:a7b:c8d9:0:b0:3ed:af6b:7fb3 with SMTP id
 f25-20020a7bc8d9000000b003edaf6b7fb3mr7083937wml.2.1682317411933; 
 Sun, 23 Apr 2023 23:23:31 -0700 (PDT)
Received: from [10.43.0.114] (cust-west-loneq8-46-193-226-34.wb.wifirst.net.
 [46.193.226.34]) by smtp.gmail.com with ESMTPSA id
 11-20020a05600c228b00b003f1736fdfedsm11328566wmf.10.2023.04.23.23.23.31
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 23 Apr 2023 23:23:31 -0700 (PDT)
Message-ID: <66517618-6903-a881-3788-031a329d24b8@linaro.org>
Date: Mon, 24 Apr 2023 07:23:30 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.0
Subject: Re: [RFC PATCH v3 09/44] target/loongarch: Implement vaddw/vsubw
Content-Language: en-US
To: Song Gao <gaosong@loongson.cn>, qemu-devel@nongnu.org
References: <20230420080709.3352575-1-gaosong@loongson.cn>
 <20230420080709.3352575-10-gaosong@loongson.cn>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20230420080709.3352575-10-gaosong@loongson.cn>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2a00:1450:4864:20::331;
 envelope-from=richard.henderson@linaro.org; helo=mail-wm1-x331.google.com
X-Spam_score_int: -42
X-Spam_score: -4.3
X-Spam_bar: ----
X-Spam_report: (-4.3 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-2.143,
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
> - VADDW{EV/OD}.{H.B/W.H/D.W/Q.D}[U];
> - VSUBW{EV/OD}.{H.B/W.H/D.W/Q.D}[U];
> - VADDW{EV/OD}.{H.BU.B/W.HU.H/D.WU.W/Q.DU.D}.
> 
> Signed-off-by: Song Gao<gaosong@loongson.cn>
> ---
>   target/loongarch/disas.c                    |  43 ++
>   target/loongarch/helper.h                   |  45 ++
>   target/loongarch/insn_trans/trans_lsx.c.inc | 795 ++++++++++++++++++++
>   target/loongarch/insns.decode               |  43 ++
>   target/loongarch/lsx_helper.c               | 190 +++++
>   5 files changed, 1116 insertions(+)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~

