Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 017CA4C04E0
	for <lists+qemu-devel@lfdr.de>; Tue, 22 Feb 2022 23:48:57 +0100 (CET)
Received: from localhost ([::1]:50996 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nMdxn-00006n-LI
	for lists+qemu-devel@lfdr.de; Tue, 22 Feb 2022 17:48:55 -0500
Received: from eggs.gnu.org ([209.51.188.92]:56974)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nMdw1-0007ib-9Z
 for qemu-devel@nongnu.org; Tue, 22 Feb 2022 17:47:05 -0500
Received: from [2607:f8b0:4864:20::62d] (port=40495
 helo=mail-pl1-x62d.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nMdvy-0003Dt-Hk
 for qemu-devel@nongnu.org; Tue, 22 Feb 2022 17:47:04 -0500
Received: by mail-pl1-x62d.google.com with SMTP id l8so16984904pls.7
 for <qemu-devel@nongnu.org>; Tue, 22 Feb 2022 14:47:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=uyDNKsNYlvg8QVCj9I1SymsrYCXknquWWQjr3HMTjeE=;
 b=hXOTaAMYRKZIYsJHipHMyx0eSTNSm0ceXfGYSEC4WBMgSMP/YBTz0UTvkJCERw5GBm
 2116aXHlQVFYcg56Q1vyaJienOXMCEOQ+j5PmtKPO7Je1pxmV+AcEKU5w7l90hf+IYO6
 YkVrRcv4sFLY/YiH0C8vLgXYe5DVLgMFoWuNJGGiWS3rc8WN/Xxs99SuCtZDtMfsFuGs
 KtJkYWzXlTLnIaW4q9ADRzycBhKSzqxVt4kC1/++h3fQRN2PVWOazuoArRvbkn63Mf2T
 nmMh7CbgmupRYey7PDOyzTuGwHbDiSjOgdCIM43/w7XrYagRWi7n5EHgbDJJJHsPOLBm
 VgLw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=uyDNKsNYlvg8QVCj9I1SymsrYCXknquWWQjr3HMTjeE=;
 b=JwcUzQ2xdZUe6S81DckDXEJ71CtGNItN0Stwtb4ougbCQrmkZyVd490CQ3Ks78bWip
 Wr/2pOBF/bo5KAVOHqXAUqyThzgpGD8/S9nJuOF5hLcUI5bOjCZ6QTs8Irw0pEHV/3oq
 RMZLsX0GbSITVw/hI7m2OD8Z/d4CS5w1PBl2cGhjUf0eLBjbEFlGLQqeEZL7EM9aVsTv
 iR/MyXlK1vu1RDzrtLyG4IaaBhS2Y12Um0BRxI1cYrvQttQYe6h81Wm3fdX7DEnP1lYf
 QaW1Dz5ZsftaE/I42oKal0uu0HKN/WQUH2IilO+GEXWOFC+jMq2Wusaf/hvvcDubrVDm
 7iuA==
X-Gm-Message-State: AOAM530WbwcgCGekQkMVIcXwDF7A9og8GvucCpNPj+n2bHhiliNbSqVx
 edCIsR9hDAk62QLbV4wjDq+DUA==
X-Google-Smtp-Source: ABdhPJzkL7Q7WaTeMLefKtLIolKkQr2G2OJmbgoB5OkCxW/mrfsFigW0OGNzZyUajxOOOjdt4zzi1w==
X-Received: by 2002:a17:90a:d3d1:b0:1bb:fdc5:182 with SMTP id
 d17-20020a17090ad3d100b001bbfdc50182mr6332344pjw.206.1645570020800; 
 Tue, 22 Feb 2022 14:47:00 -0800 (PST)
Received: from [192.168.4.112] (cpe-50-113-46-110.hawaii.res.rr.com.
 [50.113.46.110]) by smtp.gmail.com with ESMTPSA id
 fv9-20020a17090b0e8900b001b8b01e2479sm682613pjb.16.2022.02.22.14.46.59
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 22 Feb 2022 14:47:00 -0800 (PST)
Message-ID: <cb12f3e7-cb60-ffca-a576-0c3d8c145c9f@linaro.org>
Date: Tue, 22 Feb 2022 12:46:57 -1000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [PATCH v4 30/47] target/ppc: Implement xxpermx instruction
Content-Language: en-US
To: matheus.ferst@eldorado.org.br, qemu-devel@nongnu.org, qemu-ppc@nongnu.org
References: <20220222143646.1268606-1-matheus.ferst@eldorado.org.br>
 <20220222143646.1268606-31-matheus.ferst@eldorado.org.br>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20220222143646.1268606-31-matheus.ferst@eldorado.org.br>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::62d
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::62d;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x62d.google.com
X-Spam_score_int: -6
X-Spam_score: -0.7
X-Spam_bar: /
X-Spam_report: (-0.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
 PDS_HP_HELO_NORDNS=0.659, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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
Cc: groug@kaod.org, danielhb413@gmail.com, clg@kaod.org,
 david@gibson.dropbear.id.au
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 2/22/22 04:36, matheus.ferst@eldorado.org.br wrote:
> From: Matheus Ferst<matheus.ferst@eldorado.org.br>
> 
> Signed-off-by: Matheus Ferst<matheus.ferst@eldorado.org.br>
> ---
>   target/ppc/helper.h                 |  1 +
>   target/ppc/insn64.decode            |  8 ++++++++
>   target/ppc/int_helper.c             | 20 ++++++++++++++++++++
>   target/ppc/translate/vsx-impl.c.inc | 22 ++++++++++++++++++++++
>   4 files changed, 51 insertions(+)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~

