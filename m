Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 285A437F701
	for <lists+qemu-devel@lfdr.de>; Thu, 13 May 2021 13:44:06 +0200 (CEST)
Received: from localhost ([::1]:54658 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lh9l7-0005g1-8b
	for lists+qemu-devel@lfdr.de; Thu, 13 May 2021 07:44:05 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50484)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lh9hO-0002wo-SU
 for qemu-devel@nongnu.org; Thu, 13 May 2021 07:40:15 -0400
Received: from mail-qt1-x835.google.com ([2607:f8b0:4864:20::835]:44977)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lh9hL-0002JK-Gm
 for qemu-devel@nongnu.org; Thu, 13 May 2021 07:40:14 -0400
Received: by mail-qt1-x835.google.com with SMTP id y12so19463545qtx.11
 for <qemu-devel@nongnu.org>; Thu, 13 May 2021 04:40:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=ijBsiBT8QwQONl96Ri9lDvzAdsuOq39eVSZlngu10JM=;
 b=eWcePguwhtzreKX+js3BCqlAKKtPln9xkPY07m4Eo0JGejOL4OxJRUaYZmR0Q2i08n
 OE3gkp57gG+8/uMHHf1iaR9Vwj6iAGKe6PaU48vvgz8viczg0ev2L/Z+dCU7GWALRu1u
 YOQQbI4za/vN57GrhgMOQn2ho9dKMcMh0MS3oQwAP0k8v/Fl3sb9P3+pPoPoDPYvkRCl
 dQ7JULrJzbRcpjs/Z1E2tKGnV4d9J5myHozHdFBe/zKMSrsI0EoQhxvVLtNWIGKItd/r
 m0TTMlFSFE7NUzffE8zxgB7tXIYZ27AN01YgulJNfUBFlkqrYD4wWBTvG9ABGeRoLH9r
 zLWA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=ijBsiBT8QwQONl96Ri9lDvzAdsuOq39eVSZlngu10JM=;
 b=klKsQ2GM6FQxwwYDhvrjUPvLJVqG50Xv4o0UgUMNopzu9lfmWbWd5cIwfQL0hcLx2v
 1SIJ+D/te+wBR8KmmSnmouiEzVR3C1ENIHzddfBDHioz6YRRaV8cptBJBY+8nDvTncqJ
 KPRjknNwsRnqtaFmWZyXlQmsPu2Vg0casDZFRlG04HcLON5MqRWozxduPdxMyNwuob6E
 Kzlag0FcY5O/2L8X2vHNu6HUun3Y8dWajWfb1dZKpzkDljplVoDe7l4gNuw7cKcIS8zQ
 EAUyF7+PwrSdmTXoOMF1BpF23dhfsyxgniZKe0E1OiB3SN7rHEqzdcjMIERb+FZxGEar
 VIXQ==
X-Gm-Message-State: AOAM531dcplMfNxI3cUECLp9VwQSuOLO4KUMhMVhlVTrEPvwwhih6D6l
 IaA3swfLy1zcExGfP6OcAZAGCA==
X-Google-Smtp-Source: ABdhPJwIOrZEgY8O2TwHznzkGJBPlylOmOdLbgQPu8ucKnsVtIU0z4v6N0UsWyAH0qnGL9df82nvSg==
X-Received: by 2002:ac8:59cf:: with SMTP id f15mr9506575qtf.89.1620906010109; 
 Thu, 13 May 2021 04:40:10 -0700 (PDT)
Received: from [192.168.183.155] (163.189-204-200.bestelclientes.com.mx.
 [189.204.200.163])
 by smtp.gmail.com with ESMTPSA id b1sm2009488qtt.67.2021.05.13.04.40.08
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 13 May 2021 04:40:09 -0700 (PDT)
Subject: Re: [PATCH v4 31/31] target/ppc: Move addpcis to decodetree
To: matheus.ferst@eldorado.org.br, qemu-devel@nongnu.org, qemu-ppc@nongnu.org
References: <20210512185441.3619828-1-matheus.ferst@eldorado.org.br>
 <20210512185441.3619828-32-matheus.ferst@eldorado.org.br>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <399687e2-7770-6c3e-c74a-3586fdfbaf54@linaro.org>
Date: Thu, 13 May 2021 06:40:06 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <20210512185441.3619828-32-matheus.ferst@eldorado.org.br>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::835;
 envelope-from=richard.henderson@linaro.org; helo=mail-qt1-x835.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
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
Cc: lagarcia@br.ibm.com, bruno.larsen@eldorado.org.br,
 luis.pires@eldorado.org.br, f4bug@amsat.org, david@gibson.dropbear.id.au
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 5/12/21 1:54 PM, matheus.ferst@eldorado.org.br wrote:
> From: Matheus Ferst<matheus.ferst@eldorado.org.br>
> 
> Signed-off-by: Matheus Ferst<matheus.ferst@eldorado.org.br>
> ---
>   target/ppc/insn32.decode                   | 6 ++++++
>   target/ppc/translate.c                     | 9 ---------
>   target/ppc/translate/fixedpoint-impl.c.inc | 7 +++++++
>   3 files changed, 13 insertions(+), 9 deletions(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~

