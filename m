Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 50CCD438581
	for <lists+qemu-devel@lfdr.de>; Sat, 23 Oct 2021 23:08:11 +0200 (CEST)
Received: from localhost ([::1]:56776 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1meOFO-0006Vs-FI
	for lists+qemu-devel@lfdr.de; Sat, 23 Oct 2021 17:08:10 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33178)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1meODz-0005k0-I1
 for qemu-devel@nongnu.org; Sat, 23 Oct 2021 17:06:43 -0400
Received: from mail-pl1-x62d.google.com ([2607:f8b0:4864:20::62d]:46646)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1meODj-000877-R0
 for qemu-devel@nongnu.org; Sat, 23 Oct 2021 17:06:42 -0400
Received: by mail-pl1-x62d.google.com with SMTP id c4so1289929plg.13
 for <qemu-devel@nongnu.org>; Sat, 23 Oct 2021 14:06:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=+6IaHHQlEItCWrcLMd051az3IyYgeyOhdDS+Q9pAcGA=;
 b=Ga5vTEMEPXZhnsjPXLa6eRKGhdnFbllq1gTuJXzcnrpM2DzRgnikei/M3jq7pj81J8
 zBr+uej9BcNvhwdRzMm5I7kIcuk54vlUy0U3U+KGXOpjTk+TsASZXOyhDcs5oCVn7xSA
 W0y0DCRSVg8WwbralxTnxkIlXKRVvt35SfZskFOTrhtdai011KOehA1gh2M5gNvojD08
 F8LuEOr0rcM685KFq3Hgtx8APoLCNbBX/mXfv0cGdZ1c4OaGbDpxfGJ0MJ6SU6weMYaF
 9vxJUqC6WQKahgC79c2eRd1tT8E2Ed3Meb2e9vzgQusS9dDbsX8cKht21Fh3OafEI+5O
 0gzQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=+6IaHHQlEItCWrcLMd051az3IyYgeyOhdDS+Q9pAcGA=;
 b=VYbVhF5huZnqj8OlIJ9ab7WBStcvozAwreQw16mrcokEY66y9+uvFiPmCB/qxOLXRA
 zBit5LKhCuvIRW67oIgC8uc0T0PBuoYZ2Jemwh6fHB4Oe7+cKKCHIfsPsA8AxcvGpgtp
 uPoWpc/XsxVIl9oQpuaLotaxFGnuQTvln1SU1aAuepnLYInGgc7zqfzTe59FjvhwuQp2
 QKsxRdu6yYChkPwFkS/Mgx1/lYSWsQjeaM2R3c+8XDSwmpVt2NJdSK2SmPpQ0Qww8N8E
 KFBTsLZmsqVpbGjQfTwbRAzsnfLA1uRWtyXTVpDH5WcBvlYwynsRqADV1vZLpGAAWKkE
 WFQQ==
X-Gm-Message-State: AOAM530WLAaBcJizX74VBjKkkkmhuzESKtrJNLWQ3/AFkHK01f/NoAGt
 UZCxgmQdSctcDQSKAUsFT9vNjQ==
X-Google-Smtp-Source: ABdhPJwZ7nsq/3rvYzdrB9foDXxi0yNwYRMTfJ3C1+XIK9vB4HSlGKeepCGNlTIxpyBNsXE5+oyj2Q==
X-Received: by 2002:a17:90b:4c12:: with SMTP id
 na18mr24449458pjb.205.1635023186402; 
 Sat, 23 Oct 2021 14:06:26 -0700 (PDT)
Received: from [192.168.1.11] ([71.212.134.125])
 by smtp.gmail.com with ESMTPSA id b10sm13502016pfi.122.2021.10.23.14.06.25
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 23 Oct 2021 14:06:26 -0700 (PDT)
Subject: Re: [PATCH 28/33] target/ppc: moved XXSPLTIB to using decodetree
To: matheus.ferst@eldorado.org.br, qemu-devel@nongnu.org, qemu-ppc@nongnu.org
References: <20211021194547.672988-1-matheus.ferst@eldorado.org.br>
 <20211021194547.672988-29-matheus.ferst@eldorado.org.br>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <b4b4ca62-1a6a-a121-eaa4-57cfa0721af6@linaro.org>
Date: Sat, 23 Oct 2021 14:06:24 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <20211021194547.672988-29-matheus.ferst@eldorado.org.br>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::62d;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x62d.google.com
X-Spam_score_int: -38
X-Spam_score: -3.9
X-Spam_bar: ---
X-Spam_report: (-3.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-1.781,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
> Changed the function that handles XXSPLTIB emulation to using
> decodetree, but still use the same logic as before
> 
> Signed-off-by: Bruno Larsen (billionai)<bruno.larsen@eldorado.org.br>
> Signed-off-by: Matheus Ferst<matheus.ferst@eldorado.org.br>
> ---
>   target/ppc/insn32.decode            |  5 +++++
>   target/ppc/translate/vsx-impl.c.inc | 20 ++++++--------------
>   target/ppc/translate/vsx-ops.c.inc  |  1 -
>   3 files changed, 11 insertions(+), 15 deletions(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~

