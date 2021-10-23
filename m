Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 27B1E438587
	for <lists+qemu-devel@lfdr.de>; Sat, 23 Oct 2021 23:21:13 +0200 (CEST)
Received: from localhost ([::1]:37446 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1meOS0-0004eL-7m
	for lists+qemu-devel@lfdr.de; Sat, 23 Oct 2021 17:21:12 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35704)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1meOQT-0003m6-Az
 for qemu-devel@nongnu.org; Sat, 23 Oct 2021 17:19:37 -0400
Received: from mail-pf1-x433.google.com ([2607:f8b0:4864:20::433]:43570)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1meOQR-0007gB-FI
 for qemu-devel@nongnu.org; Sat, 23 Oct 2021 17:19:36 -0400
Received: by mail-pf1-x433.google.com with SMTP id 187so6825063pfc.10
 for <qemu-devel@nongnu.org>; Sat, 23 Oct 2021 14:19:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=f9wYs23s3q3dG9YWAla1ZrXZZ3pkiHL/XYDHgjMGVaQ=;
 b=d+AMK/hCkTSpOzaQONhuerXs+hCJy99FBGPKRvW8z/W29eWyA40eza75wxtryHm69A
 3J7ukC/+8jXsrzzvEeLL1YdH/FgBmdxkm5/g4gBluOPteI59d6wIE9ya+llCm79enKf1
 IBLhbQk+3iPqgZHOj5Ic5SguXbDGaHCLWesvYx4arWOQglQbJ/jxaZXtsScedhnTny3/
 bt3YFBZx+GCRvENLZfQe5GOuj3hEjFWhjfkvAqP/j7UFTLdXhf7H0WkOpB7s0CQ6VQJC
 ysI5SXZXbEU/maVr7Dy35DTL6mDm7jjm/Ue4b2xquoGdtMpOGqczPllgnn+1V6D2nUuH
 962A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=f9wYs23s3q3dG9YWAla1ZrXZZ3pkiHL/XYDHgjMGVaQ=;
 b=KGfLKf7mrsghflxaFPZrvav3kB9bk9hyrPOPKMgU6CMSM/caJYvKIyCvLFFROGU6Iy
 C6+rel8feStVNr4r68MNvgOVHxz20DzYE8yM1m+W0jyLw8VyHC4brHnbDaXyFrS0G/nD
 ZIxGT1d2VxDGYxgNjAQrRoNXFiINL/S4nqiZim9E0uzJ3fH0eiennOdzG0t78CAXKjzS
 GDhEu4zNG3IJa2qa1lJgc8Ilv6CIKNFbemYVihSkQs2aUvru3+z9/FsfpaWrhJLvqI2C
 g7vuLFVAThS9VaDxwCsXY5MWwUr5GPZ3rfKsI3UB5KijJX1rq0kGblz0e9BamHsmhRe0
 0NFw==
X-Gm-Message-State: AOAM531JfuFJ783RM3ZkMXAhkRbbndnXl2FpNW2ZqcXRvzK+6e0VqkXA
 A2uXYEkpFdgY2oWYu+ATI7BTPw==
X-Google-Smtp-Source: ABdhPJyIV++DHY0jusafSN/Ymh1DfGLwqFQ/b2oyaFt52n50Yl3/EaSnpFtKuhc3idyHtCO59Gbntw==
X-Received: by 2002:a05:6a00:1344:b0:44c:4cd7:4d4b with SMTP id
 k4-20020a056a00134400b0044c4cd74d4bmr8257432pfu.50.1635023974259; 
 Sat, 23 Oct 2021 14:19:34 -0700 (PDT)
Received: from [192.168.1.11] ([71.212.134.125])
 by smtp.gmail.com with ESMTPSA id on17sm17574138pjb.47.2021.10.23.14.19.33
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 23 Oct 2021 14:19:33 -0700 (PDT)
Subject: Re: [PATCH 31/33] target/ppc: implemented XXSPLTIDP instruction
To: matheus.ferst@eldorado.org.br, qemu-devel@nongnu.org, qemu-ppc@nongnu.org
References: <20211021194547.672988-1-matheus.ferst@eldorado.org.br>
 <20211021194547.672988-32-matheus.ferst@eldorado.org.br>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <f746d465-1af6-f1c2-4391-f6a30dd83e5f@linaro.org>
Date: Sat, 23 Oct 2021 14:19:32 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <20211021194547.672988-32-matheus.ferst@eldorado.org.br>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::433;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x433.google.com
X-Spam_score_int: -38
X-Spam_score: -3.9
X-Spam_bar: ---
X-Spam_report: (-3.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-1.781,
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
Cc: lucas.castro@eldorado.org.br,
 "Bruno Larsen \(billionai\)" <bruno.larsen@eldorado.org.br>,
 luis.pires@eldorado.org.br, groug@kaod.org, david@gibson.dropbear.id.au
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 10/21/21 12:45 PM, matheus.ferst@eldorado.org.br wrote:
> From: "Bruno Larsen (billionai)"<bruno.larsen@eldorado.org.br>
> 
> Implemented the instruction XXSPLTIDP using decodetree.
> 
> Signed-off-by: Bruno Larsen (billionai)<bruno.larsen@eldorado.org.br>
> Signed-off-by: Matheus Ferst<matheus.ferst@eldorado.org.br>
> ---
>   target/ppc/insn64.decode            |  2 ++
>   target/ppc/translate/vsx-impl.c.inc | 10 ++++++++++
>   2 files changed, 12 insertions(+)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~

