Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4747C6CCB14
	for <lists+qemu-devel@lfdr.de>; Tue, 28 Mar 2023 21:58:51 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1phFSM-00066d-WF; Tue, 28 Mar 2023 15:58:11 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1phFSL-00066R-Hm
 for qemu-devel@nongnu.org; Tue, 28 Mar 2023 15:58:09 -0400
Received: from mail-pj1-x1035.google.com ([2607:f8b0:4864:20::1035])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1phFSK-0000l7-4j
 for qemu-devel@nongnu.org; Tue, 28 Mar 2023 15:58:09 -0400
Received: by mail-pj1-x1035.google.com with SMTP id
 r7-20020a17090b050700b002404be7920aso12259702pjz.5
 for <qemu-devel@nongnu.org>; Tue, 28 Mar 2023 12:58:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1680033486;
 h=content-transfer-encoding:in-reply-to:from:references:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=53yPvkwxp7qANJGjXO3KSBZQpiwSabimd+nK2HExL9E=;
 b=HJHlGhZXl0q1olcKKRH5bAZIhNh+EMK9ihJ/Oyr2DPnx1YvWjyq85eixNDCDNIphfo
 X37885eT+0yfS7W3+t/2e0EsNroEX9AQthHstLTblmdu/UpS+y5bE6URVk8J67ewM5oV
 +dMA5NJLlFWA9Ac1OhTuMDg/He3Dem/FImyykdaoMTR77a+gYmqMoAQ+Zw27cqEZQPZM
 w86T5qEPaz+zPloKQm8y9NNWAcHg0ehdwWGsGahbgRGCJ5uzq9YM28nDzmg/5xp7ETSy
 zgziyu4PLhbeP73pzIKqVHUrdV4RSj9C/qzd6JCDZMO7PF2TQn6+1TRRCYyYVsAZsVCx
 jp3g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1680033486;
 h=content-transfer-encoding:in-reply-to:from:references:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=53yPvkwxp7qANJGjXO3KSBZQpiwSabimd+nK2HExL9E=;
 b=kv7AhGjTBmgKAuz4nkvpRmKD8+aEUCQ8izFTTzytM1P1laslS5rmVql/oYTCG+2Svc
 VnfKDWCjl+qLKbritzlQsQGaBNwVcxVSf4d7UsXE+uH+Jth5obIm4UsRPg/Qfwh5N4w1
 b9t60Jxy5LtRTHxIKyvAWbUZVf/csJMwEyukGl6kK9KujHsrL8cizvKtNlclIehBhm0E
 yn9YQRJRqlTviQZsCHOcvPwj4XXu1CtF0VYI2k9DYp4YoZ+nz01wG/kyhWqaytIrBvvM
 UCxKoG6uXspI7KZHYlJS8gzY1Qjmbd5hrqobeWcJGiQSGF/X8aKJc2CY23iNsC5gN+eB
 Rb6A==
X-Gm-Message-State: AAQBX9fdCkSCHYZTdcUpaPYer0CPfW5u8/ciRRu2kvZn/o8LGFcNRg4P
 SyOg8JykHJxNCMrlLqMJGkHs1y5RbN77dif0NIM=
X-Google-Smtp-Source: AKy350YJJ8gOKIcYi9RUBS5ndRMCKsW4MUF1eGnU1ckVEpfWK0iYXF0NtzG80bHzYMq7J6KIXKJD8Q==
X-Received: by 2002:a17:903:110e:b0:1a1:f5dd:2dd5 with SMTP id
 n14-20020a170903110e00b001a1f5dd2dd5mr21814928plh.13.1680033486513; 
 Tue, 28 Mar 2023 12:58:06 -0700 (PDT)
Received: from ?IPV6:2602:ae:1541:f901:396:9f0d:afc2:978e?
 ([2602:ae:1541:f901:396:9f0d:afc2:978e])
 by smtp.gmail.com with ESMTPSA id
 h20-20020a170902f7d400b001a0763fa8d6sm21539344plw.98.2023.03.28.12.58.05
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 28 Mar 2023 12:58:06 -0700 (PDT)
Message-ID: <309521dd-205e-f4c6-ecc5-0c1c8eebefea@linaro.org>
Date: Tue, 28 Mar 2023 12:58:04 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Subject: Re: [RFC PATCH v2 06/44] target/loongarch: Implement vaddi/vsubi
Content-Language: en-US
To: Song Gao <gaosong@loongson.cn>, qemu-devel@nongnu.org
References: <20230328030631.3117129-1-gaosong@loongson.cn>
 <20230328030631.3117129-7-gaosong@loongson.cn>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20230328030631.3117129-7-gaosong@loongson.cn>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1035;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1035.google.com
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

On 3/27/23 20:05, Song Gao wrote:
> +    tcg_gen_gvec_addi(mop, vd_ofs, vj_ofs, -(a->imm), 16, 16);

No need for parenthesis around a->imm.

Otherwise,
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>


r~

