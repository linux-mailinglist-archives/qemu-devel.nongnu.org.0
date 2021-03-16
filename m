Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B745B33E24D
	for <lists+qemu-devel@lfdr.de>; Wed, 17 Mar 2021 00:43:35 +0100 (CET)
Received: from localhost ([::1]:48330 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lMJLa-0006Dr-JS
	for lists+qemu-devel@lfdr.de; Tue, 16 Mar 2021 19:43:34 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33302)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lMJJw-0005FV-PD
 for qemu-devel@nongnu.org; Tue, 16 Mar 2021 19:41:52 -0400
Received: from mail-wm1-x32d.google.com ([2a00:1450:4864:20::32d]:37742)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lMJJu-0003Uq-7V
 for qemu-devel@nongnu.org; Tue, 16 Mar 2021 19:41:51 -0400
Received: by mail-wm1-x32d.google.com with SMTP id
 f22-20020a7bc8d60000b029010c024a1407so2399058wml.2
 for <qemu-devel@nongnu.org>; Tue, 16 Mar 2021 16:41:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=jszWC9F3vzhHRs+yhi5xxuwdhIm51a9AlCLcXwZVsPs=;
 b=HYW7Ce2Rcy0PWPMteZB9SdhMzyvk0i12x7jlV2z2Try3lIXCZ505PavThgrVMbEr7U
 BPj3rjGMbw0ROoIy7fAja35FFUnpgyrJ11bugRLcniP0CBU8ltSLdXY6c5QuS3dZ7Vpm
 piYflA2GV6SfrRYl7e8IWlqwYfqhCuehb3T4yF3C55QtCNREVKBBZbcvQ4YMUkUmR2ib
 qjJ/cEBhaS1X5k5VCrE3mYS9ZuxUfynQ8mLgP7evd9gM7CVg49H+JHuSg5fngiMupdXU
 1su454nHISVFrfFfW3MnBBsIfq8BzgwrBPgtdo+Jr7WlWqJ1RQUa81J6r0184MmuU8jS
 lsPg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:subject:to:cc:references:from:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=jszWC9F3vzhHRs+yhi5xxuwdhIm51a9AlCLcXwZVsPs=;
 b=tqg0LIrabgdwHGj2lSVM3BvP9s2S57cUU0BtqNBf+V3yaC1tZrG0q5kIL+HO/pQvGB
 VaVhsz199GE4r4cb5tJCxSnxuC2WVE6akUoRb/Sv57H1XHGLaujYeSNnyU3PUQN0SKEJ
 PXmf/36dRhDNxs7TPdntEe49gfqE3NKCgsK0xPKU4fDA5l3sBkBPxDRsZEHZeYU8xXNn
 Bly6NWI4O52SZITZzkS8mLJOiExSjTrsM8QbcSG1krjmlBXFUNgwRhyfF3db8/M/2c8N
 NXmABDxKX8b18Hry2+sbxjBgvXaCK/sXyu5fRWV/+AtIIEvESdyAfR0tpeRe9cNfMi6j
 pxVg==
X-Gm-Message-State: AOAM530GPdcgUkFH2ZEZ30Kszi4DDBWBUmcQdGlBwbD+J8KzpTXpUadE
 rTsAea8GV+rgECcmC4NBx84w0mlFyVahHA==
X-Google-Smtp-Source: ABdhPJzO4CC34h61gULGTn851BOZAhViSNRrSvXtkTh0RZcdBtczt6NTi+2hz1M3v9ygyIk91gMF6w==
X-Received: by 2002:a1c:1b8f:: with SMTP id b137mr56744wmb.174.1615938107064; 
 Tue, 16 Mar 2021 16:41:47 -0700 (PDT)
Received: from [192.168.1.36] (17.red-88-21-201.staticip.rima-tde.net.
 [88.21.201.17])
 by smtp.gmail.com with ESMTPSA id w131sm758258wmb.8.2021.03.16.16.41.46
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 16 Mar 2021 16:41:46 -0700 (PDT)
Subject: Re: [PATCH v5 40/57] tcg/tci: Split out tcg_out_op_v
To: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org
References: <20210311143958.562625-1-richard.henderson@linaro.org>
 <20210311143958.562625-41-richard.henderson@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
Message-ID: <1986d681-0a7b-4163-eeda-1587837a98e4@amsat.org>
Date: Wed, 17 Mar 2021 00:41:45 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.0
MIME-Version: 1.0
In-Reply-To: <20210311143958.562625-41-richard.henderson@linaro.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32d;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wm1-x32d.google.com
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
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>  tcg/tci/tcg-target.c.inc | 14 ++++++++++----
>  1 file changed, 10 insertions(+), 4 deletions(-)

Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>

