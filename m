Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D0C3A3AD92E
	for <lists+qemu-devel@lfdr.de>; Sat, 19 Jun 2021 11:54:24 +0200 (CEST)
Received: from localhost ([::1]:56192 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1luXgF-0001SP-Se
	for lists+qemu-devel@lfdr.de; Sat, 19 Jun 2021 05:54:23 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40144)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1luXUC-0003k6-4N; Sat, 19 Jun 2021 05:41:56 -0400
Received: from mail-wr1-x434.google.com ([2a00:1450:4864:20::434]:37874)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1luXUA-0006zK-Dd; Sat, 19 Jun 2021 05:41:55 -0400
Received: by mail-wr1-x434.google.com with SMTP id i94so13568111wri.4;
 Sat, 19 Jun 2021 02:41:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=ri69kZQ91JaIXajsuEki2PJZBkyyykSGr20fua9IPN8=;
 b=OBNQ3wgNxTU2dMu+qxkOVd9c/MEH8exITdpDvCfl7fXe6viNoWSa+9MDMDSBaf3T+4
 gcqiX5zyoYJ8/rb+d8st6z3ItbZlfbZ7w66j/Han0KTGMkZqufnXtbyNQc1gjo+U9Afe
 ktNtV1r2n2lfqmL7q5YklHRr1hcMUiXGK5NfPSVO4Kk2esPvBSgYLEjFP2/Mwndr8m8f
 BiBosS3WFGlsbEQ2zlTsH+p4l2tgxSDSq7GH1OLZgwLDNuIQ6d+2ALf96bIZOMFO1ckU
 XqKySd3eDEfK2Xpn1+8C1tvSPy9ZnLZ3TAX0zFOK8EHdhY5ZkEYo1+LDcKZH0/Qwe+rW
 RSnQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:subject:to:cc:references:from:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=ri69kZQ91JaIXajsuEki2PJZBkyyykSGr20fua9IPN8=;
 b=htTq2/i+oxNXBZbtLMGO9amE2uV3pQiPQO51JUdMB4AzVEF29HhvRcFC/F3LSjisPx
 0bsG1a2G170eKyaEvnroq9WUsxysSoLFsaDhr1ZOV2AwRMZsyTkYfTXgGrNZ11b1cFgV
 DfF3o0gLyjMJk/I8geG4f1jkV5cP5bcFR95/wKDRbILZenJ+6GS8x/1Uj7MZfRrKa0tu
 Ia93Iv4CAuNkzZt8wZFSrHYxXjIMFEiELzg7l41lzhYskpGiqe1GCYQTJYU3YBKYAMcf
 SFj/enmdpITDS6/s3SdsDYT6tecWzKaySZK31tAsIYoOs5dSHUExswly8+Iq86I4zp9m
 6mLQ==
X-Gm-Message-State: AOAM530JwHXhn5xZtZcDChKCE2q2Wi+MwPUGh8xE4XSsuW1qS/IjwP6V
 jGjHpO9sakDqhGA6EmydbmCwak+mu2IZqA==
X-Google-Smtp-Source: ABdhPJyJQ6X+xGIEaRjD+XzrZmE1gFHp2OvA0tQMgRB93h8ObxGStSnbmgslr9T77IoFYctYPtcDPA==
X-Received: by 2002:a5d:6992:: with SMTP id g18mr16950525wru.73.1624095712208; 
 Sat, 19 Jun 2021 02:41:52 -0700 (PDT)
Received: from [192.168.1.36] (93.red-83-35-24.dynamicip.rima-tde.net.
 [83.35.24.93])
 by smtp.gmail.com with ESMTPSA id u12sm827951wrq.50.2021.06.19.02.41.51
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 19 Jun 2021 02:41:51 -0700 (PDT)
Subject: Re: [PATCH 2/2] tcg: Allocate sufficient storage in
 temp_allocate_frame
To: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org
References: <20210619045700.46907-1-richard.henderson@linaro.org>
 <20210619045700.46907-3-richard.henderson@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
Message-ID: <4a45599d-a8cb-f6d0-6498-d33e8d939ac3@amsat.org>
Date: Sat, 19 Jun 2021 11:41:50 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.1
MIME-Version: 1.0
In-Reply-To: <20210619045700.46907-3-richard.henderson@linaro.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::434;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wr1-x434.google.com
X-Spam_score_int: -16
X-Spam_score: -1.7
X-Spam_bar: -
X-Spam_report: (-1.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.249, NICE_REPLY_A=-0.202,
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
Cc: sw@weilnetz.de, qemu-stable@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 6/19/21 6:57 AM, Richard Henderson wrote:
> This function should have been updated for vector types
> when they were introduced.
> 
> Cc: qemu-stable@nongnu.org
> Fixes: d2fd745fe8b
> Resolves: https://gitlab.com/qemu-project/qemu/-/issues/367
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>  tcg/tcg.c | 32 +++++++++++++++++++++++++++-----
>  1 file changed, 27 insertions(+), 5 deletions(-)

Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>

