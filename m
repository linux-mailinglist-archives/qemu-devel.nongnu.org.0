Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A1A9E4381EB
	for <lists+qemu-devel@lfdr.de>; Sat, 23 Oct 2021 06:56:57 +0200 (CEST)
Received: from localhost ([::1]:54104 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1me95U-0005C5-Oa
	for lists+qemu-devel@lfdr.de; Sat, 23 Oct 2021 00:56:56 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:56434)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1me93V-0004FI-HJ
 for qemu-devel@nongnu.org; Sat, 23 Oct 2021 00:54:53 -0400
Received: from mail-pj1-x102c.google.com ([2607:f8b0:4864:20::102c]:52940)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1me93T-0007Qt-KI
 for qemu-devel@nongnu.org; Sat, 23 Oct 2021 00:54:53 -0400
Received: by mail-pj1-x102c.google.com with SMTP id oa4so4313358pjb.2
 for <qemu-devel@nongnu.org>; Fri, 22 Oct 2021 21:54:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=Wk3MDCZWwW6JdgiXHyLxwtKJtVixvpfmdl/A8R2f9ck=;
 b=p1sgh7xmJq29CNXHNR6MJVgkkleoTtOElJzNkSlX9J6JnlSD5tFFBan3hyOYwc0+BF
 DEEMnc81LlNE7ZplbN/GyqBD31S3HMu7hvBDi+MzZPNVuPhLjGGn2zZNNFhMgtf5CBwJ
 LFXj0JryBJ8Qx2B3jVpQ70/78GiL9CUenuIgQhOpwMs1MYnOaJlBO6zgOGrst/2gJqOE
 KCulx0rphoBAFZJqR345hnelyhGbKCuqWKpJD+1vlyKjCWUWbSXXlvBDf1NuS23rO4kt
 +k4+UcDY3QLQqKJ+Bw8kUqbg229C4Ni0zkhhW1mE9AeWiPabOYNuU6Z2c10Jq66SZmCm
 DEgw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=Wk3MDCZWwW6JdgiXHyLxwtKJtVixvpfmdl/A8R2f9ck=;
 b=05oh1Sd87Qe/R1KuvM9YT5Lgmp+w9uTtTY5wuk6mSouu0Cwuac1XxRpFnPkyTChMM4
 6J8c7wRhRjXSuO1oIELe3fw4lo8Wp4mxc0Y+T7B5sRFKqFLcPlOIgW5/Ebk9Of5HzPsA
 M98qUueGNUmCKss4xl5k5H5U9gx9ybEJ1i9sMfDjdks0KAOpoqA1BkvaNyao1CFlE7Tk
 a+vdTFgnrRlfzCcLNIlBM74OmeMlSGn2PbijClMydV1iCPUBTdR385fZ3vHicTeyiHJH
 yc247YFPc3mbIEaLcuOeogjyhq7tGnuiWntX82//Crb4ZIFjpoUSb/d08HGYVCLFkqK4
 73WA==
X-Gm-Message-State: AOAM5330MlzB37FOCopIohviRnXHaF8yjuAxKhCiCUvy1ZPdOTPlPhUC
 HtWPrfjQuvcg65YnBX0AwGnDfQ==
X-Google-Smtp-Source: ABdhPJzXPsA+wAXPUMHX1EtvBMycZFmsZMr/DcJK8nHsIcI9/PAnAcysSeLiqMIINEKA9co+5XinfQ==
X-Received: by 2002:a17:90a:a08d:: with SMTP id
 r13mr19040852pjp.191.1634964890255; 
 Fri, 22 Oct 2021 21:54:50 -0700 (PDT)
Received: from [192.168.1.11] ([71.212.134.125])
 by smtp.gmail.com with ESMTPSA id t4sm12139625pfj.13.2021.10.22.21.54.49
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 22 Oct 2021 21:54:49 -0700 (PDT)
Subject: Re: [PATCH 17/33] target/ppc: Implement Vector Insert from VSR using
 GPR index insns
To: matheus.ferst@eldorado.org.br, qemu-devel@nongnu.org, qemu-ppc@nongnu.org
References: <20211021194547.672988-1-matheus.ferst@eldorado.org.br>
 <20211021194547.672988-18-matheus.ferst@eldorado.org.br>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <552f22d9-fa45-4dda-02db-2befc53fc559@linaro.org>
Date: Fri, 22 Oct 2021 21:54:48 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <20211021194547.672988-18-matheus.ferst@eldorado.org.br>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::102c;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x102c.google.com
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
> -        qemu_log_mask(LOG_GUEST_ERROR, "Invalid index for VINS" #SUFFIX "%cX"  \
> -                      " at 0x" TARGET_FMT_lx ", RA = " TARGET_FMT_ld " > %d\n",\
> -                      c, env->nip, idx, maxidx);                               \
> +        qemu_log_mask(LOG_GUEST_ERROR, "Invalid index for VINS" #SUFFIX "%cX/" \
> +                      "VINS" #SUFFIX "V%cX at 0x" TARGET_FMT_lx ", RA = "      \
> +                      TARGET_FMT_ld " > %d\n", c, c, env->nip, idx, maxidx);   \

Maybe just begin with "vector insert element", since this eventually gets used for 
vinsert* as well.  At which point the FOO/BAR/BAZ format becomes excessive.


r~

