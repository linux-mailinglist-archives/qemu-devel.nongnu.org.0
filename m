Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DCAF833E1E2
	for <lists+qemu-devel@lfdr.de>; Wed, 17 Mar 2021 00:08:49 +0100 (CET)
Received: from localhost ([::1]:42162 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lMInw-0004Ni-Vo
	for lists+qemu-devel@lfdr.de; Tue, 16 Mar 2021 19:08:49 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:55188)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lMIlH-000283-4s
 for qemu-devel@nongnu.org; Tue, 16 Mar 2021 19:06:03 -0400
Received: from mail-wr1-x432.google.com ([2a00:1450:4864:20::432]:41947)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lMIlF-0004P4-OS
 for qemu-devel@nongnu.org; Tue, 16 Mar 2021 19:06:02 -0400
Received: by mail-wr1-x432.google.com with SMTP id b9so8282359wrt.8
 for <qemu-devel@nongnu.org>; Tue, 16 Mar 2021 16:06:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=sCNhZcgihFvXYoPQP4y06aEn3pLzFCrlcqA181Wuqgo=;
 b=XxjtL3VqT92SrS0o2gmSqmUPhXE4Opycd46N4xAC5y5jQL9WUn167S/HujGJKplwlj
 uBSNTt6yiz2g4XTa14ZM++6HrR5s95fdrqybsnulO3enpdIZsqnB4pyE12yB9KXmPDc1
 ny8ec6VAoP+eTCbgWnfA+ndU01Cwm9aCtudAd35K31jEeSBaiSvwgz3rWU1XO72h8hsE
 uF4qEGW+zX2OGnhT/fCXbVD7Go6fLbKFL9QCWnaAcrBKPaiHoKlun/WOrzCXloCFJWZh
 gXhDAd4TQmapgEK6DBWyjLCe2UPodcXPFl8sr7Epor6RfcNcCfsfvD/BI68vWTSVbpcc
 ToGA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:subject:to:cc:references:from:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=sCNhZcgihFvXYoPQP4y06aEn3pLzFCrlcqA181Wuqgo=;
 b=LEBxkW9MwO+1+ER7bkITmGHNR5H3pzztJmUBqDRPhIv/nU+X8jeOsFDkTPRPyznwg2
 G0UbruxoDXkgvlB4RoLBhvnHt/d/PI4rhI72e2mBbn6k2Th8jaeOND/Ulzb2A/p9LIyM
 l5134FA8ZCqr647HoaUHvhCqXF9eEBdyw74I8Y9bGzEN7g06be9c+6oa8mjzwj1S79+i
 RXfSrlc9lw9Z68YEa1vR48xcFrKsgK0DvsB9gDPqsyaI0/o3c8MwkaBzJHNR7mdBW9XL
 sXudcsPvbAZPOWqW0hcBXhCPrTU8ube4ZfVH6VFku9VklnRs/pLNSFn+88RSLvndXLTH
 RqrQ==
X-Gm-Message-State: AOAM532NRACynvldlbUWIy6hYjt0F74nrh63SBV9CWkBRX6aCMSqpQ/t
 8dHtHhQwPrCa7HvVhYlvx7g=
X-Google-Smtp-Source: ABdhPJysDIjJMTUU4pCcD0izKsAk2J1iFZxyM96fKZX8vN6L65DXN2EXssvtoGnGPxGRhjhfsWmb7w==
X-Received: by 2002:a5d:4fc5:: with SMTP id h5mr1314144wrw.33.1615935960437;
 Tue, 16 Mar 2021 16:06:00 -0700 (PDT)
Received: from [192.168.1.36] (17.red-88-21-201.staticip.rima-tde.net.
 [88.21.201.17])
 by smtp.gmail.com with ESMTPSA id h8sm12829137wrt.94.2021.03.16.16.05.59
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 16 Mar 2021 16:05:59 -0700 (PDT)
Subject: Re: [PATCH v5 12/57] tcg/tci: Reuse tci_args_l for exit_tb
To: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org
References: <20210311143958.562625-1-richard.henderson@linaro.org>
 <20210311143958.562625-13-richard.henderson@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
Message-ID: <b9fbd963-f7d0-d3ec-7aca-e2a2bcdbdc26@amsat.org>
Date: Wed, 17 Mar 2021 00:05:58 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.0
MIME-Version: 1.0
In-Reply-To: <20210311143958.562625-13-richard.henderson@linaro.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::432;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wr1-x432.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.25, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: sw@weilnetz.de, alex.bennee@linaro.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 3/11/21 3:39 PM, Richard Henderson wrote:
> Do not emit a uint64_t, but a tcg_target_ulong, aka uintptr_t.
> This reduces the size of the constant on 32-bit hosts.
> The assert for label != NULL has to be removed because that
> is a valid value for exit_tb.
> 
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>  tcg/tci.c                | 13 ++++---------
>  tcg/tci/tcg-target.c.inc |  2 +-
>  2 files changed, 5 insertions(+), 10 deletions(-)

Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>

