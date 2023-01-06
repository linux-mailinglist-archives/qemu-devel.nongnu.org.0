Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 38E2D660997
	for <lists+qemu-devel@lfdr.de>; Fri,  6 Jan 2023 23:37:15 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pDvJp-0005iL-GM; Fri, 06 Jan 2023 17:36:09 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pDvJm-0005hz-VO
 for qemu-devel@nongnu.org; Fri, 06 Jan 2023 17:36:07 -0500
Received: from mail-pl1-x630.google.com ([2607:f8b0:4864:20::630])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pDvJk-0007U4-Jf
 for qemu-devel@nongnu.org; Fri, 06 Jan 2023 17:36:05 -0500
Received: by mail-pl1-x630.google.com with SMTP id 17so3238392pll.0
 for <qemu-devel@nongnu.org>; Fri, 06 Jan 2023 14:36:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=thzXRMKujGuTwxUfFSvr7vSXfUROk2P609oRj//x9PI=;
 b=Fs0TEBxFyiEhiBx0CaqZT9m4nhJph7rHKGfZxfm8c9dRyV24ef13OfxXFPsqfn0znN
 hyHjA/h44R6vOwkjzQhzDfltDqhfoXLAgYRKu61XhXUJWhAeD2qKKQTN5kpQziLPyaAb
 oRHKJVka4p/fdc6XyHEHgbXKSyNc0mlum56Jk96qM+IR58amw5PglMNgTv2Os6q+R1Zf
 m/mYSFVoJksDrW2jOT9cxbpHtNJxjECGb1zgB6hwuPYx90wnvJt2Dd4gQlucAcnFPsDx
 LU5JEhBA21+h8beIi/YHEhq14qGqj4ljtJCsSGj2+Xp4npt49XK4me8f6JAmq+K/9sbn
 MwxQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=thzXRMKujGuTwxUfFSvr7vSXfUROk2P609oRj//x9PI=;
 b=iXrA8GEl5i4CUmOTmtKzhMub2OGwoSMaviHmNOrXHbz5QY3KuDSG2QUm3ltmZ4PiFX
 O2bUkpqG25+DeimjW0jtEQPS/tDh896Wx2UE/2Z4EOtzMzR3Xa78kBEFs2hPlyLeRScM
 c6s7EMs63qYXDf6FG+J+GDKrLHEAz5Up7L40wcP0FQrhl5SVP9yF2YXUWdliPKrx/kPG
 ggquaJ3M6tjRGnjg0SUOAboBbCQyA+ASvgHt9brLtO1j/SWEq7hE2cD8h86BRa6ykudM
 veKtD2lysusCTAQ7Tvlr9eil2xL92z2cO3jP1/lJZFxrLxgI0CqjFOGrlBaR0+dQe/Pb
 yySA==
X-Gm-Message-State: AFqh2kquwlag7fb0Orc8zThkpJGNTU4M4/N1MuLV+KFHap/9W6YZWIjS
 PkTu7gi5m+D1WnOFRlUCDJmioQ==
X-Google-Smtp-Source: AMrXdXset1mhmEfjW0OkZZZkeJfpdaJsOZyW6HjozK5EWoMIOyEvacAunKd3nLg8gopicb1tqNsxdw==
X-Received: by 2002:a17:902:bf01:b0:189:c47b:af27 with SMTP id
 bi1-20020a170902bf0100b00189c47baf27mr56002854plb.10.1673044562950; 
 Fri, 06 Jan 2023 14:36:02 -0800 (PST)
Received: from ?IPV6:2602:47:d48c:8101:9d81:5b04:51d7:acae?
 ([2602:47:d48c:8101:9d81:5b04:51d7:acae])
 by smtp.gmail.com with ESMTPSA id
 o17-20020a170902d4d100b00189d4c666c8sm1408495plg.153.2023.01.06.14.36.02
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 06 Jan 2023 14:36:02 -0800 (PST)
Message-ID: <f010b794-3616-5970-6a5d-13f6f650737f@linaro.org>
Date: Fri, 6 Jan 2023 14:36:00 -0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.2
Subject: Re: [RFC PATCH 16/40] target/arm: Represent the entire MPIDR_EL1
Content-Language: en-US
To: Peter Maydell <peter.maydell@linaro.org>
Cc: qemu-devel@nongnu.org, pbonzini@redhat.com, berrange@redhat.com,
 eduardo@habkost.net, armbru@redhat.com, ajones@ventanamicro.com,
 alex.bennee@linaro.org
References: <20230103181646.55711-1-richard.henderson@linaro.org>
 <20230103181646.55711-17-richard.henderson@linaro.org>
 <CAFEAcA-m32sjkQSSkM1QopiqKgn+4OLTxs+c3w-+zck8Ns86yg@mail.gmail.com>
 <b52d4a65-3aa7-d9f1-a589-a0db64ee5e78@linaro.org>
 <CAFEAcA8SrKxe9XZCuuPCneFtTgAbe8Hs1neZmjenNXd04dWu_w@mail.gmail.com>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <CAFEAcA8SrKxe9XZCuuPCneFtTgAbe8Hs1neZmjenNXd04dWu_w@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::630;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x630.google.com
X-Spam_score_int: -49
X-Spam_score: -5.0
X-Spam_bar: -----
X-Spam_report: (-5.0 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-2.939,
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

On 1/6/23 14:14, Peter Maydell wrote:
> +    if (arm_feature(env, ARM_FEATURE_V7MP)) {
> +        cpu->mpidr_el1 |= (1u << 31);   /* M */
> +        if (cpu->core_count == 1) {
> +            cpu->mpidr_el1 |= 1 << 30;  /* U */
> +        }
> +    }
> 
> This is wrong, incidentally -- a single Cortex A9, A53, etc does
> not set the U bit. (It's "a cluster with 1 core in it", not
> "a uniprocessor system".)

Hmph.  It would have been handy to have the "uniprocessor" term defined somewhere in the 
architecture manual, since they appear to be using it in a specialized way.


r~

