Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6043143806D
	for <lists+qemu-devel@lfdr.de>; Sat, 23 Oct 2021 00:54:05 +0200 (CEST)
Received: from localhost ([::1]:60152 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1me3QK-0005BZ-0p
	for lists+qemu-devel@lfdr.de; Fri, 22 Oct 2021 18:54:04 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48294)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1me3PS-0004M1-Lm
 for qemu-devel@nongnu.org; Fri, 22 Oct 2021 18:53:10 -0400
Received: from mail-pf1-x436.google.com ([2607:f8b0:4864:20::436]:45766)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1me3PR-0006xj-5k
 for qemu-devel@nongnu.org; Fri, 22 Oct 2021 18:53:10 -0400
Received: by mail-pf1-x436.google.com with SMTP id f11so4878418pfc.12
 for <qemu-devel@nongnu.org>; Fri, 22 Oct 2021 15:53:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=2qq6zRPnZSwf6Ha0ZgJPRXW+BaU5sT2bbF/CNYHMeGQ=;
 b=fdBBd7P+GJSlv/jMuuRqo0wzstPIjgyvByVjz/ihb/3Uw06IiykxBStmyxjIsfxxTd
 vcB6x1egEIu/U3WvinjAVFYphDMfOTaxKI6YelifS3v1X5EelCYJAKgp1plpCjGHWN+w
 VJ7owFhdGNWwC1GfaYOooDANHKyR/Dkf6qZz5k+tyDJVIahBZIDCKWZnywo9OSePL/QR
 DTPlfBaqcHGLxIVj0Ps7Hlz8vSnWAim3dAdBSoSDW2oWpaBG1Q09KK/u4gAdWVLBBYge
 iFFVuAC0QQqP/8of9kqB493692md0NnvD0V1fMEtMpxeajc5BP8h38CKsAN2HDr3IXJF
 YCuw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=2qq6zRPnZSwf6Ha0ZgJPRXW+BaU5sT2bbF/CNYHMeGQ=;
 b=LcvsHvhpHHgnLC8J/LIOAkux8vGJBnNDRN1m7unyuC3TEbe09sB0/BUNHW+kal4H5A
 D61vc3WpX4OYhbQAhcD0K5EuAt69/Qh1xpzMysa55DJfeERZ22DoLd+Vj0lp5Kjzq3jk
 fKZ6hrTSTexK+M9EBokMdYW0vIL2LL5QvnVQhvJZN6xuvwkJAyDf3N6+eCxgyYkbnIsm
 emPzSarlDVOAN9b+yB6O4889WA59o39uqNlvKKsw86gl4g5B3lJYnKW7izd62XBiRtYq
 vJm49cHCsM+/4EGlNevAZEFgqJge8qa+rlu87TtHxgL0rGqgRJlHX3CCjmSsYa4JETJp
 WZcQ==
X-Gm-Message-State: AOAM533/+aoKM9lxCHw5U1a982lpiMbgW3U797CpWLS2p5Bo2+eU8k9n
 aWE0qjQPOL+gAi2JZFUnqr/rtA==
X-Google-Smtp-Source: ABdhPJzclf6ECqQ25BPmIabS1PU2jovznjM/iTfRkOb8MTWaxxPB/Zjo+DxFLUAkGs8p18uz9YioZQ==
X-Received: by 2002:a63:230c:: with SMTP id j12mr1948309pgj.1.1634943187622;
 Fri, 22 Oct 2021 15:53:07 -0700 (PDT)
Received: from [192.168.1.11] ([71.212.134.125])
 by smtp.gmail.com with ESMTPSA id y9sm10568841pjj.6.2021.10.22.15.53.06
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 22 Oct 2021 15:53:06 -0700 (PDT)
Subject: Re: [PATCH 05/33] target/ppc: Move LQ and STQ to decodetree
To: matheus.ferst@eldorado.org.br, qemu-devel@nongnu.org, qemu-ppc@nongnu.org
References: <20211021194547.672988-1-matheus.ferst@eldorado.org.br>
 <20211021194547.672988-6-matheus.ferst@eldorado.org.br>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <519a8ba2-a37c-bba8-a23d-4eab08f3b45c@linaro.org>
Date: Fri, 22 Oct 2021 15:53:04 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <20211021194547.672988-6-matheus.ferst@eldorado.org.br>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::436;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x436.google.com
X-Spam_score_int: -37
X-Spam_score: -3.8
X-Spam_bar: ---
X-Spam_report: (-3.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-1.742,
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
Cc: lucas.castro@eldorado.org.br, luis.pires@eldorado.org.br, groug@kaod.org,
 david@gibson.dropbear.id.au
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 10/21/21 12:45 PM, matheus.ferst@eldorado.org.br wrote:
> From: Matheus Ferst<matheus.ferst@eldorado.org.br>
> 
> Signed-off-by: Matheus Ferst<matheus.ferst@eldorado.org.br>
> ---
>   target/ppc/insn32.decode                   |  11 ++
>   target/ppc/translate.c                     | 156 +--------------------
>   target/ppc/translate/fixedpoint-impl.c.inc |  98 +++++++++++++
>   3 files changed, 114 insertions(+), 151 deletions(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~

