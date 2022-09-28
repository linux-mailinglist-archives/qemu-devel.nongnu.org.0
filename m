Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 34B965EE264
	for <lists+qemu-devel@lfdr.de>; Wed, 28 Sep 2022 18:58:01 +0200 (CEST)
Received: from localhost ([::1]:51448 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1odaNk-00076t-AH
	for lists+qemu-devel@lfdr.de; Wed, 28 Sep 2022 12:58:00 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:55308)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1odaG0-0005f9-M5
 for qemu-devel@nongnu.org; Wed, 28 Sep 2022 12:50:15 -0400
Received: from mail-pj1-x102a.google.com ([2607:f8b0:4864:20::102a]:37384)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1odaFx-0001aK-Sa
 for qemu-devel@nongnu.org; Wed, 28 Sep 2022 12:49:59 -0400
Received: by mail-pj1-x102a.google.com with SMTP id
 u59-20020a17090a51c100b00205d3c44162so3090152pjh.2
 for <qemu-devel@nongnu.org>; Wed, 28 Sep 2022 09:49:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date;
 bh=1IKxUFSNGwoHqldMuM/VV8u5bnK1GBzBpKzhno/gxDc=;
 b=VwkX2QDF2fcPkBjR8c7JzIsSE3xgGMWLyWrV2sthj9RF9UJ7JwDlTt9Ji39uZABrOh
 cO3icN5brfa8WxRMitTmeYWlV1cM3EEfjXnXtweF6bBiOIMUZcLfKl3Cb5DPFzE9NhrT
 XUg5S5JMhQzIzeQ43sHc8sftCZgL4aJST8LTclpwOj8tua2YrsBO8gTAmQj7diy2GLd+
 tP4zwwGGVQYpKsuyzlJycn/w/cima+Wyi9VcmR/lxiKIr2HukZ/K04RFvvFJUvGqBCqD
 HEQQiiEm97IGTxbdhsuob7QtDrcxgHs3urEzMjJtiEXGbSxY6k67qkaPdxzv93uQUbDS
 wkOQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date;
 bh=1IKxUFSNGwoHqldMuM/VV8u5bnK1GBzBpKzhno/gxDc=;
 b=jecWK/XoDFr8nPb9djVrXwDsDMuAAOdrwXdZyropA2oy8vfoGlNjaVMcpJCym0P30v
 YB/K3rO5b5ZEUouv516G9z04Hd1oMNoH1CdBorMksVBg/+04JLyXKcJ8J9W6zfaBnaiE
 iqoiDl5y6+G5RtKl+bbGdbgiVaHo2y4LCxMHGZJ5aOLSqyWMxA/ULvqmEVGaamA1gPrY
 CfIuWgtk6rZFbCbFn6gmP9dg1efEP1DUlxw5quVXR/TXwZWSMuvNHQWMeuwmA8HQCN7I
 VjdO39IZ3UdMuqjtfqH4B53cP5X0NYm4mRQZTlCFAA5TtyDLgAVqSTEVF3aWeQlvV2hC
 eIzw==
X-Gm-Message-State: ACrzQf2wgVtB4LStiN0u05NmE2pwr++O0Q54/B1uvDxWhKeQq5CPQpEJ
 iNMxVb/kNGoTqbas9/ixpXFeFw==
X-Google-Smtp-Source: AMsMyM5YtuxXU5wQl7XxYYlu3Og1sw6rGDOx5wOUbC10CN/TflfwVT8jKwT5rQDamh4FdtRlgG4Bng==
X-Received: by 2002:a17:903:247:b0:179:b5e1:54b7 with SMTP id
 j7-20020a170903024700b00179b5e154b7mr728324plh.84.1664383796387; 
 Wed, 28 Sep 2022 09:49:56 -0700 (PDT)
Received: from ?IPV6:2602:47:d49d:ec01:986f:cb56:6709:4057?
 ([2602:47:d49d:ec01:986f:cb56:6709:4057])
 by smtp.gmail.com with ESMTPSA id
 m1-20020a17090a34c100b00205f4db8120sm1618576pjf.4.2022.09.28.09.49.55
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 28 Sep 2022 09:49:55 -0700 (PDT)
Message-ID: <eb65b452-828b-0875-586a-e7ea5595092c@linaro.org>
Date: Wed, 28 Sep 2022 09:49:54 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PATCH v3 04/15] target/arm: ensure KVM traps set appropriate
 MemTxAttrs
Content-Language: en-US
To: =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, Peter Maydell <peter.maydell@linaro.org>,
 Paolo Bonzini <pbonzini@redhat.com>,
 "open list:Overall KVM CPUs" <kvm@vger.kernel.org>
References: <20220927141504.3886314-1-alex.bennee@linaro.org>
 <20220927141504.3886314-5-alex.bennee@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20220927141504.3886314-5-alex.bennee@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::102a;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x102a.google.com
X-Spam_score_int: -43
X-Spam_score: -4.4
X-Spam_bar: ----
X-Spam_report: (-4.4 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-2.319,
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 9/27/22 07:14, Alex Bennée wrote:
> Although most KVM users will use the in-kernel GIC emulation it is
> perfectly possible not to. In this case we need to ensure the
> MemTxAttrs are correctly populated so the GIC can divine the source
> CPU of the operation.
> 
> Signed-off-by: Alex Bennée<alex.bennee@linaro.org>
> 
> ---
> v3
>    - new for v3
> ---
>   target/arm/kvm.c | 12 ++++++++----
>   1 file changed, 8 insertions(+), 4 deletions(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>


r~

