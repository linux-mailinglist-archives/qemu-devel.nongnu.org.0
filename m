Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E18CB412968
	for <lists+qemu-devel@lfdr.de>; Tue, 21 Sep 2021 01:27:37 +0200 (CEST)
Received: from localhost ([::1]:34406 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mSShF-0004VF-0f
	for lists+qemu-devel@lfdr.de; Mon, 20 Sep 2021 19:27:37 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51164)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mSSg3-0003eB-QY
 for qemu-devel@nongnu.org; Mon, 20 Sep 2021 19:26:23 -0400
Received: from mail-pj1-x102d.google.com ([2607:f8b0:4864:20::102d]:38504)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mSSg1-0003bT-NO
 for qemu-devel@nongnu.org; Mon, 20 Sep 2021 19:26:23 -0400
Received: by mail-pj1-x102d.google.com with SMTP id
 g13-20020a17090a3c8d00b00196286963b9so608500pjc.3
 for <qemu-devel@nongnu.org>; Mon, 20 Sep 2021 16:26:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=z3OcKXdWoHJVeJqkWrLALoe1fefO96CYI4s3esuqcN8=;
 b=WwU7cUOwDDU927982mivqJdrLqLpewzYIfwqvm3Whywz/VCF+jC4IRFenJgDVRTP16
 7FdetpPz89u22SgIl/i0ksOUzYmkMG5SmT0cJTDSZnBMv1WJ8QRRtHkgYIzjXVL9JFOe
 JghRytWm8BgzUcDp/rxYf6/z01oGVIKqBLwwE7rDix5SxWJFM42C2YnNwM24RbjjFtke
 4R0Br9IE0gQOnBH2jOvAHFxCYESMkqCQpOdFSZE4fiOy0IFFSr2KFEfoSdwnPodirbqp
 80WrrIqIOFWr9X99QDPwXG071bTxEYpwjQbjZ/YRVOcsLpj3Kb5o8s2yqqfbvA2h9WXh
 ougQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=z3OcKXdWoHJVeJqkWrLALoe1fefO96CYI4s3esuqcN8=;
 b=iwI0PKEn4nkgizv/6S2f5m+kh8d1IvA0rqa3B4mt0pzaNwu9Xmk6I7Z0PpV1LkspJg
 LSO42JQYVzPK1iGsIJVuuaixrjTZKoZWiNmqhTYLSATNTPsagUusHvHIbV0yCyhlHqJU
 WO6hnmZ3Eg98EOcySc94po8MmI+AmDMHsjhx7BaDTz0AJ3FmxkPO5dBaSANQyR6GR3PS
 2sjK6vjmifzXEw6W+AvGOux/T6II8eWlBDUk5ZdeW+p5ZMmtPN6OEuK7sGuaLXtYmupn
 5Fp+J6DiTEZu6bOnakbohsgK9yES5qhGcoYjFWARXXZep7z4VWS125MRCHYrQuaUz76g
 K+YA==
X-Gm-Message-State: AOAM533iTXi/5UssnkEcyNaJh+RaRy/x/MEOfH2AwaGN/Ql1OZixDy0v
 ryKTOrPTNeXeB0l/j8bnahf6xQ==
X-Google-Smtp-Source: ABdhPJzkbOdFMXNfSri14qG/QCWHfi6+VR/x1DXCV7yCyjzvb2g+woau+34fj3L+A0fFWG9/L1JtrQ==
X-Received: by 2002:a17:90a:9285:: with SMTP id
 n5mr1681712pjo.29.1632180380304; 
 Mon, 20 Sep 2021 16:26:20 -0700 (PDT)
Received: from [192.168.1.11] ([71.212.134.125])
 by smtp.gmail.com with ESMTPSA id e7sm5846500pfc.114.2021.09.20.16.26.19
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 20 Sep 2021 16:26:19 -0700 (PDT)
Subject: Re: [PATCH v3 22/30] Hexagon HVX (target/hexagon) helper overrides -
 vector loads
To: Taylor Simpson <tsimpson@quicinc.com>, qemu-devel@nongnu.org
References: <1632173065-18522-1-git-send-email-tsimpson@quicinc.com>
 <1632173065-18522-23-git-send-email-tsimpson@quicinc.com>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <de53da1e-79fe-5230-f407-8b3460ff43c0@linaro.org>
Date: Mon, 20 Sep 2021 16:26:18 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <1632173065-18522-23-git-send-email-tsimpson@quicinc.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::102d;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x102d.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
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
Cc: ale@rev.ng, bcain@quicinc.com, f4bug@amsat.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 9/20/21 2:24 PM, Taylor Simpson wrote:
> Signed-off-by: Taylor Simpson<tsimpson@quicinc.com>
> ---
>   target/hexagon/gen_tcg_hvx.h | 150 +++++++++++++++++++++++++++++++++++++++++++
>   1 file changed, 150 insertions(+)

Acked-by: Richard Henderson <richard.henderson@linaro.org>

r~

