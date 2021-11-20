Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 28058457D33
	for <lists+qemu-devel@lfdr.de>; Sat, 20 Nov 2021 11:54:32 +0100 (CET)
Received: from localhost ([::1]:56382 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1moO0s-0001ON-QD
	for lists+qemu-devel@lfdr.de; Sat, 20 Nov 2021 05:54:30 -0500
Received: from eggs.gnu.org ([209.51.188.92]:38442)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1moNzu-0000Dl-U7
 for qemu-devel@nongnu.org; Sat, 20 Nov 2021 05:53:30 -0500
Received: from [2a00:1450:4864:20::335] (port=45977
 helo=mail-wm1-x335.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1moNzt-0006gG-3X
 for qemu-devel@nongnu.org; Sat, 20 Nov 2021 05:53:30 -0500
Received: by mail-wm1-x335.google.com with SMTP id
 g191-20020a1c9dc8000000b0032fbf912885so9433279wme.4
 for <qemu-devel@nongnu.org>; Sat, 20 Nov 2021 02:53:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=GWfAx9h39pHV5cKb5Rg0NOAb+UbB2fm5V/UREadwRto=;
 b=b/0dQ4J6D+mPOpLG4KooswdeuGPrFs9+lIEOdMpJWma0bHC9mdz9+7IhF6DpLzQf/x
 Eb+sB/DqgcLPs6zoLsop6EGFsmXt3FKfucglbnG7+RCbOEfbqO6S3rHgQH8cdPiYx8pB
 ToAp2iLuy1J9h8+w9Dy5j3PQqbI3YQltfOheMRxyTYh5s39+0BXjBxQtX5uGvcPN/tsr
 yMlpdYMjg+dJo8MZeymBZ82uReqdNf9AJTqM9YnNUVNJkVhEqySwZNnJWbTz1f6MrSQF
 EEcMWAOz6ap3sAgvU7AZfuxpNA1Y5+/bpgsOyqh0rRUp3QfQUHOidkOgoQuCnWzlbdgf
 GfHA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=GWfAx9h39pHV5cKb5Rg0NOAb+UbB2fm5V/UREadwRto=;
 b=CifzRIl/pU2bBVZY9VjCenfbj4Tbu+abfp3ItEBbBeZjeNkzQyRAkG3F4oqg7pzpqY
 28PUYE1MvbdjaQmt8pXxC8aQUPiqnSTeLtFmC4hPbv1bAqk4Fjj1Z+24dqsjd0YKTAgW
 4uLUPxtUe9kwogeTZxpSIMh1Qmbxfo7x9ds8Q4AyfbZ7N5ixNiVQaZM/JYjiMuq+Px0o
 FbmmR+jehr+XhKVv08jI40Dqh92QSvNK/2EcmTYtH0+FVwM1Ai4FbAiBjzloaSQQirD7
 3Q2Aed0a26WsVuh6Gp6e0EoK+8YNBCdGBCISiOigqalww+snvZzfPBzn3sTCbkS87OFU
 mfLg==
X-Gm-Message-State: AOAM533aSkeIvpxY3h1yao/ECuL9vdTzdOsUUEoOgFYyccb1pu+lKeoy
 1Fv6R1NAv81qjjipEOk3p6cvkA==
X-Google-Smtp-Source: ABdhPJztZTyw+bmocNf7v219fVjrS54WLBWjpFOU83bnXkMYMyJnkEJknVx8iTY8VxKJLYNvw4dCkw==
X-Received: by 2002:a1c:1c8:: with SMTP id 191mr8724294wmb.90.1637405607530;
 Sat, 20 Nov 2021 02:53:27 -0800 (PST)
Received: from [192.168.8.104] (9.red-95-126-194.staticip.rima-tde.net.
 [95.126.194.9])
 by smtp.gmail.com with ESMTPSA id z11sm2378256wrt.58.2021.11.20.02.53.26
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 20 Nov 2021 02:53:26 -0800 (PST)
Subject: Re: [PATCH v11 22/26] linux-user: Add LoongArch cpu_loop support
To: Song Gao <gaosong@loongson.cn>, qemu-devel@nongnu.org
References: <1637302410-24632-1-git-send-email-gaosong@loongson.cn>
 <1637302410-24632-23-git-send-email-gaosong@loongson.cn>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <643c9f7c-c4f7-843c-08e3-fd5bf803b350@linaro.org>
Date: Sat, 20 Nov 2021 11:53:22 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
MIME-Version: 1.0
In-Reply-To: <1637302410-24632-23-git-send-email-gaosong@loongson.cn>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::335
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::335;
 envelope-from=richard.henderson@linaro.org; helo=mail-wm1-x335.google.com
X-Spam_score_int: -38
X-Spam_score: -3.9
X-Spam_bar: ---
X-Spam_report: (-3.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-2.625,
 PDS_HP_HELO_NORDNS=0.001, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
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
Cc: Xiaojuan Yang <yangxiaojuan@loongson.cn>, laurent@vivier.eu
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 11/19/21 7:13 AM, Song Gao wrote:
> +        case EXCP_ADE:
> +            force_sig_fault(TARGET_SIGSEGV, TARGET_SEGV_MAPERR, env->badaddr);
> +            break;

No longer required; should be handled correctly by cpu_loop_exit_sigsegv.

Otherwise,
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>



r~

