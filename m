Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7AE016D3562
	for <lists+qemu-devel@lfdr.de>; Sun,  2 Apr 2023 05:28:38 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pioMu-00071d-Dl; Sat, 01 Apr 2023 23:27:00 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pioMt-00071T-1C
 for qemu-devel@nongnu.org; Sat, 01 Apr 2023 23:26:59 -0400
Received: from mail-pg1-x535.google.com ([2607:f8b0:4864:20::535])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pioMr-0008V9-GH
 for qemu-devel@nongnu.org; Sat, 01 Apr 2023 23:26:58 -0400
Received: by mail-pg1-x535.google.com with SMTP id 185so4456944pgc.10
 for <qemu-devel@nongnu.org>; Sat, 01 Apr 2023 20:26:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1680406015;
 h=content-transfer-encoding:in-reply-to:from:references:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=qNId+FiKaO/jbBPzsQ+OLbf5z7uo/oLKM08ZSXfuccs=;
 b=qtpj1Eji1G4ry2H6hER93p8/jriIuA2wKcGbiDdhr/H+MViRhWtX/ep4/KsqA0eC3n
 8914bOXXHmG1x9ZYvjQOD0y2HDXvgYsCfb3nWeYV1ssxJ3DplQbxMhqEG82Fc/CnCzd4
 PAf8FhUMZYPJxD+yO4H3rEBeVXC0cqbivWYOIJr7Np9ED2arptGEMCdczv4024wai9Hv
 Q2ePF6aZ0JJajmvoZk3W3EFOH88eRIJ02HQO5kvbpuzqWoQTYn579e+Vmqkncq8kfSiV
 uWMwlLG7Xo/EtQ0+MGdAKhtD0zgqTkGYEh+KUKgkp5AFtYk8UdvDe0mBcVg3oQnC90Jj
 p04w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1680406015;
 h=content-transfer-encoding:in-reply-to:from:references:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=qNId+FiKaO/jbBPzsQ+OLbf5z7uo/oLKM08ZSXfuccs=;
 b=nTdHXJioecGrWRB65If2VQdLM+Sew+xiZRr8Vfg5ji8MJsCMSh1zcVSjHvGUIm8IKU
 7F9Y14VqUb6twM8PgK6M+ZMWnP1YiBJw+CqmdYbZqjcmFbAmfp1oQJ1+iQnaadeOdOW3
 ZYpN2rv9s0GX7FWPy2Hn/Lpby+iqckBot/awq/hGjoF4RYbB+pVB4It7LqaH6TsI0X7t
 6wou5RQsBrb9ug2Wig66EezB89GJfQUE5XougSBy07OiYIuDplpfygNwQk/9MlFtp3Jo
 sBIOQWOgiG+cBOeKFy8fBnSS21ATfVn9anSy5v6v+h1zHiTYbYL1gUy6Y77FGOOoLguX
 f4Vw==
X-Gm-Message-State: AAQBX9ddHUz0GHBmiXyBw1EPHi7sbrF7AejrLFExMq6ng3GVLHAUa5Br
 4oPStpJAamXC6o3ahALTF9TMjifUFUjE5v7V5sQ=
X-Google-Smtp-Source: AKy350bppDR+NnO2DOgI3GzQtK6Ds41XdK0Tm/F/WZ4TtTy/3jxpLwYuOKxo/2lLYgcyKb9EsyyYqg==
X-Received: by 2002:aa7:9aef:0:b0:627:f0e1:4fbf with SMTP id
 y15-20020aa79aef000000b00627f0e14fbfmr30987292pfp.33.1680406015305; 
 Sat, 01 Apr 2023 20:26:55 -0700 (PDT)
Received: from ?IPV6:2602:ae:1541:f901:f30a:3ab0:889f:f03d?
 ([2602:ae:1541:f901:f30a:3ab0:889f:f03d])
 by smtp.gmail.com with ESMTPSA id
 r12-20020a63ce4c000000b005134511807dsm3811243pgi.82.2023.04.01.20.26.54
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 01 Apr 2023 20:26:54 -0700 (PDT)
Message-ID: <4ba6767c-5c9e-aa16-c0e5-01311bbcae16@linaro.org>
Date: Sat, 1 Apr 2023 20:26:52 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.0
Subject: Re: [RFC PATCH v2 28/44] target/loongarch: Implement vssrln vssran
Content-Language: en-US
To: Song Gao <gaosong@loongson.cn>, qemu-devel@nongnu.org
References: <20230328030631.3117129-1-gaosong@loongson.cn>
 <20230328030631.3117129-29-gaosong@loongson.cn>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20230328030631.3117129-29-gaosong@loongson.cn>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::535;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x535.google.com
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

On 3/27/23 20:06, Song Gao wrote:
> This patch includes:
> - VSSRLN.{B.H/H.W/W.D};
> - VSSRAN.{B.H/H.W/W.D};
> - VSSRLN.{BU.H/HU.W/WU.D};
> - VSSRAN.{BU.H/HU.W/WU.D};
> - VSSRLNI.{B.H/H.W/W.D/D.Q};
> - VSSRANI.{B.H/H.W/W.D/D.Q};
> - VSSRLNI.{BU.H/HU.W/WU.D/DU.Q};
> - VSSRANI.{BU.H/HU.W/WU.D/DU.Q}.
> 
> Signed-off-by: Song Gao<gaosong@loongson.cn>
> ---
>   target/loongarch/disas.c                    |  30 ++
>   target/loongarch/helper.h                   |  30 ++
>   target/loongarch/insn_trans/trans_lsx.c.inc |  30 ++
>   target/loongarch/insns.decode               |  30 ++
>   target/loongarch/lsx_helper.c               | 383 ++++++++++++++++++++
>   5 files changed, 503 insertions(+)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~

