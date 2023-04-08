Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CA9116DBC91
	for <lists+qemu-devel@lfdr.de>; Sat,  8 Apr 2023 21:12:36 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1plDyx-0005lN-BG; Sat, 08 Apr 2023 15:12:15 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1plDyv-0005l9-QL
 for qemu-devel@nongnu.org; Sat, 08 Apr 2023 15:12:13 -0400
Received: from mail-pl1-x632.google.com ([2607:f8b0:4864:20::632])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1plDyu-00041b-8M
 for qemu-devel@nongnu.org; Sat, 08 Apr 2023 15:12:13 -0400
Received: by mail-pl1-x632.google.com with SMTP id ji2so2936497plb.0
 for <qemu-devel@nongnu.org>; Sat, 08 Apr 2023 12:12:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1680981131;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=IMDGs5W8o0Hc3pXd+1nb96neDhAhAM5b0hxuSasxJpU=;
 b=q/XPcJLUu9tOt78yhu5ktcza326yD3FywZK7J/6hBVN7DbsUeKYNp3C07436TfcY79
 s/ENjTRygsPxctRWgiOlrVHLwq19XCH3U+bMs931f694uqylnuZB0gtcaiUv/Xpar2DV
 5s3qSLoRo2kgz0B2ONTGDdLYQM3lX8ILLQXwNTlWLMEdY4CLikx8zTtXgY/hGp7MV7Tt
 Ca6GcSzIfo53d3Gnmq4GhXQqMlp13MMaKg1Pmghk72m084ZYjYVQd4mO96a62zgK1gp3
 tCnvEigzcNziH3SfICTCPrwPF3cjbtU7tG61HTriPowQV/NJkmxuBzHMcPVrvD1Ah65J
 IyCg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1680981131;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=IMDGs5W8o0Hc3pXd+1nb96neDhAhAM5b0hxuSasxJpU=;
 b=5bhNsFGokNvECPDS+BDPcpIUtqg07+Lngxw4epb4wxF1CGlRArIZpIq9hERm7qGkp0
 mYAl6wL5rthdul8ymUWx87rxMnyKYhUadRlo2g0bFbuFjOcGvFRbxgCS85otpgD5EriE
 7vHzueYmT6df2MJlboiIxeb5+MKRZh4ZmZPQ5RxZ0K51l3v1NWRu5bsic1pu1353GWSE
 70piWe2TyyBvhm3Y10gNBd4VhxM4oYpgSMZfgevMXUcv1+0s6U8bbyqduGslLkm80WdC
 9le4yVBpsO4J9fWeL27G2GU1gVuqbGAXSvviA/eBp7yftWZ73ncusstE6TCGGM282Xz6
 A/uA==
X-Gm-Message-State: AAQBX9eM9CAHqk+anW55Y0XNYp4a0OL5jZPwptdu+1n/JoPsguFsBgfa
 hveODI78C5KqKiWdTVwkdqrhzA==
X-Google-Smtp-Source: AKy350aOclJzeZkCHuYIa8eW5HDUh9EhhEvpwoxPwDSRVgyGYukApZsft7F1adxWo15DbEzkDo1TCA==
X-Received: by 2002:a17:903:27cd:b0:1a5:2b7b:57e8 with SMTP id
 km13-20020a17090327cd00b001a52b7b57e8mr2277887plb.26.1680981131027; 
 Sat, 08 Apr 2023 12:12:11 -0700 (PDT)
Received: from ?IPV6:2602:ae:1541:f901:fcd:4458:21c7:367e?
 ([2602:ae:1541:f901:fcd:4458:21c7:367e])
 by smtp.gmail.com with ESMTPSA id
 jl12-20020a170903134c00b0019e88d9bed3sm4855911plb.210.2023.04.08.12.12.10
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 08 Apr 2023 12:12:10 -0700 (PDT)
Message-ID: <2eed30d8-918f-666f-bb71-76d46869044a@linaro.org>
Date: Sat, 8 Apr 2023 12:12:08 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.0
Subject: Re: [PATCH 11/16] bsd-user: Implement do_sysctl_kern_proc_filedesc
Content-Language: en-US
To: Warner Losh <imp@bsdimp.com>, qemu-devel@nongnu.org
Cc: reinoud@netbsd.org, riastradh@netbsd.org, ryoon@netbsd.org,
 jrtc27@jrtc27.com, kevans@freebsd.org, Brad Smith <brad@comstyle.com>,
 Stacey Son <sson@FreeBSD.org>
References: <20230405213612.15942-1-imp@bsdimp.com>
 <20230405213612.15942-12-imp@bsdimp.com>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20230405213612.15942-12-imp@bsdimp.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::632;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x632.google.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.113,
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

On 4/5/23 14:36, Warner Losh wrote:
> From: Stacey Son<sson@FreeBSD.org>
> 
> Implement do_sysctl_kern_proc_filedesc. This pulls kern.proc.filedesc
> out of the host kernel and converts it to the guest's format.
> 
> Signed-off-by: Stacey Son<sson@FreeBSD.org>
> Signed-off-by: Warner Losh<imp@bsdimp.com>
> ---
>   bsd-user/freebsd/os-sys.c | 193 ++++++++++++++++++++++++++++++++++++++
>   bsd-user/qemu.h           |   3 +
>   2 files changed, 196 insertions(+)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~

