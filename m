Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E5DA5440BE3
	for <lists+qemu-devel@lfdr.de>; Sat, 30 Oct 2021 23:36:19 +0200 (CEST)
Received: from localhost ([::1]:52544 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mgw1S-00069s-IU
	for lists+qemu-devel@lfdr.de; Sat, 30 Oct 2021 17:36:18 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43400)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mgw05-0005KV-TR
 for qemu-devel@nongnu.org; Sat, 30 Oct 2021 17:34:53 -0400
Received: from mail-pj1-x102f.google.com ([2607:f8b0:4864:20::102f]:39825)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mgw00-0004Hb-FA
 for qemu-devel@nongnu.org; Sat, 30 Oct 2021 17:34:53 -0400
Received: by mail-pj1-x102f.google.com with SMTP id
 y14-20020a17090a2b4e00b001a5824f4918so6539955pjc.4
 for <qemu-devel@nongnu.org>; Sat, 30 Oct 2021 14:34:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=WfzcLQikIhmXVskSOY+5e7RUOZO//igy37JkvEXSubA=;
 b=mKeSvbkBXWPhlSjjlPt4uVwKh/8ad+H8i6iqFOaVYZ7cw87Ha7lQAgHyzn60MgnJQI
 lCNPkAPrrAN3xKDfgWUc08x2d2GQsYGzwFf/KiDgWy+K9gvPNaefGBPkl8Ti0YuNnTPf
 yn6aiCBKi9KUk/2SFrwJNBjAY/nTqXtEfU2yrQKjyVma83Bg7cq3b4Wb8665sEsOnXkJ
 TZ4pMI8AO6Zf+xvi7FQC99aLLmR3P5573N6d0pBVdHrtJNRBzYSf4/pemCa5cgdKTcLD
 LPdCDZoR56MS0OIHs8cI/NLffH0bJ7ZhrnZiU/A0eTPKbHBS4OzjdB0x7lpA4KwgVD0s
 koOA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=WfzcLQikIhmXVskSOY+5e7RUOZO//igy37JkvEXSubA=;
 b=W01wW3NR6PAzScdaSq91UUCIBSDRiLuzx4e0W7MGkVgQcWNcWV69iKyH8Oa0kF3r64
 +GywiHXj0iZh4pkUnEETX1YDOcAd6owLsvZFuZgxPIRTImIKP5vHN0xDzjXpt+PF/gge
 TZWRdzAQ7QLpXqszfZeu4MVjhPEj6gnAw/UzfhSyvtOApSnVuUDQAUE2bq+SzbV4uK+D
 uh+fxBgM1iAWb0F3aPypbNHE3nFYiWjAohUqbsz/MxHxvbwigaTxuKSp2ckSae0x1Hw+
 QeGP1sYpigkOcnaNO5l2KoK2ijZfev+k4ditBDFtLhIdUrHCBhD5UkdguVmjLXq7TtYE
 IGSA==
X-Gm-Message-State: AOAM5323ggACg3KMsOGBxzM8rPkf41SwLX2TZipb8AVj1hJGrlJggZEP
 mASsfzUzDCp84Q8v7JfMvEgM2Q==
X-Google-Smtp-Source: ABdhPJwwPPohJb4KIdKOFYemEyGoLHaOFP4zySvU4LSL1z2oC/HBxPoc/cI1fXBOTbS6L3ZS4Dq87w==
X-Received: by 2002:a17:90a:fd13:: with SMTP id
 cv19mr1318567pjb.54.1635629686880; 
 Sat, 30 Oct 2021 14:34:46 -0700 (PDT)
Received: from [192.168.1.11] (174-21-75-75.tukw.qwest.net. [174.21.75.75])
 by smtp.gmail.com with ESMTPSA id n29sm6337149pfv.29.2021.10.30.14.34.46
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 30 Oct 2021 14:34:46 -0700 (PDT)
Subject: Re: [PATCH v2 12/34] target/ppc: Implement vclzdm/vctzdm instructions
To: matheus.ferst@eldorado.org.br, qemu-devel@nongnu.org, qemu-ppc@nongnu.org
References: <20211029202424.175401-1-matheus.ferst@eldorado.org.br>
 <20211029202424.175401-13-matheus.ferst@eldorado.org.br>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <96ba5484-809b-4d44-d5d2-2b0c02dea742@linaro.org>
Date: Sat, 30 Oct 2021 14:34:44 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <20211029202424.175401-13-matheus.ferst@eldorado.org.br>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::102f;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x102f.google.com
X-Spam_score_int: -44
X-Spam_score: -4.5
X-Spam_bar: ----
X-Spam_report: (-4.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-2.426,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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

On 10/29/21 1:24 PM, matheus.ferst@eldorado.org.br wrote:
> From: Matheus Ferst<matheus.ferst@eldorado.org.br>
> 
> The signature of do_cntzdm is changed to allow reuse as GVecGen3i.fni8.
> The method is also moved out of #ifdef TARGET_PPC64, as PowerISA doesn't
> say vclzdm and vctzdm are 64-bit only.
> 
> Signed-off-by: Luis Pires<luis.pires@eldorado.org.br>
> Signed-off-by: Matheus Ferst<matheus.ferst@eldorado.org.br>
> ---
> v2:
> - Inline implementation of cntlzdm/cnttzdm
> ---
>   target/ppc/insn32.decode                   |  2 ++
>   target/ppc/translate/fixedpoint-impl.c.inc |  4 +--
>   target/ppc/translate/vmx-impl.c.inc        | 32 ++++++++++++++++++++++
>   3 files changed, 35 insertions(+), 3 deletions(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~

