Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BC560372DE9
	for <lists+qemu-devel@lfdr.de>; Tue,  4 May 2021 18:19:59 +0200 (CEST)
Received: from localhost ([::1]:58518 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ldxmA-0000pv-Rc
	for lists+qemu-devel@lfdr.de; Tue, 04 May 2021 12:19:58 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:55072)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1ldxba-00088x-23
 for qemu-devel@nongnu.org; Tue, 04 May 2021 12:09:04 -0400
Received: from mail-pf1-x42f.google.com ([2607:f8b0:4864:20::42f]:42515)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1ldxbU-0002qx-Tj
 for qemu-devel@nongnu.org; Tue, 04 May 2021 12:09:01 -0400
Received: by mail-pf1-x42f.google.com with SMTP id h127so3336273pfe.9
 for <qemu-devel@nongnu.org>; Tue, 04 May 2021 09:08:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=pmp0N9VA/tZfp7AwYbBLxCY62s19XFMlZjwYrU3lwdw=;
 b=CJ0SViV++T65/NKJOEaAF2Fk2Z/IuwqMI5FW5+m4AD5fqX1//6zxPjiwsdYPhxhi8g
 vsWinqC0RO4tG1rnEumREVxiF8MNKWVNC3b0dE014OGwIbjYMGxhx9fXBM+L/KBZmAsZ
 3tb4j8IKl4Ei83R6OxyqP05F1EMwWgf0iCrSvywqTh1DWY5miXPU3UJ2IPkiNrNIbjzR
 WvFcrZqEQweUqCENKFCMV92gXy98c9LLUDkz18Cvs+sH2DhQ9sPtOr/44GHlEFcihnrp
 6ka//HHOZW86287nElRL8k7RoDUftIdIzG9fSoADWDzqV1gHykJwfdM6zK4x3iSG8Y7z
 4VaQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=pmp0N9VA/tZfp7AwYbBLxCY62s19XFMlZjwYrU3lwdw=;
 b=ZuaeO1o0Xk5STyzCATrj/DRg8WsB9fSH5a2VYtdT1nduDFik/lhJ28ytFBmkRKl2Ul
 C0rMhcJm787D2mxFQmiRrfwoUkihA1HGlJvzfH5QW51+6RDCOImv5GLOz/02gw9GtsZb
 4xhGCz5NH4ZOxyV7fttJ7lcV7RcqmcY6ofEcmb7zClQ36pXNJGSRh006Dxq/Y3DXsXsl
 tPzxGF+pZrZfjwaMNyCGcOuWZC2cJpLtvZb0xR1x8W5EdzaW0s0Sh1a94tfKmz0n8wQe
 XGKqoNluO7d213xpU8krPrPmiIWPZqs1GhOEWFIK9PO4KWlYX5b9DjKJEmcXlsUf+W8p
 Qw1g==
X-Gm-Message-State: AOAM531GGJBakE+ALfwIzBdb5QUQUbA1/FXWk4z4WuN1VXVgB0pzejB7
 EICfc4pdDA/ArYsITvvkC29X7w==
X-Google-Smtp-Source: ABdhPJw47Gf2IyPH9DAPLFKDODXOV1CzwnD7eLRUrQSYGdk/iGy3Uq2kcfuOQOinf2BHLsP1R7VFpw==
X-Received: by 2002:a63:a47:: with SMTP id z7mr23558640pgk.350.1620144533065; 
 Tue, 04 May 2021 09:08:53 -0700 (PDT)
Received: from [192.168.1.11] ([71.212.144.24])
 by smtp.gmail.com with ESMTPSA id o21sm4178600pgd.63.2021.05.04.09.08.52
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 04 May 2021 09:08:52 -0700 (PDT)
Subject: Re: [PATCH v4 3/5] target/ppc: move SPR R/W callbacks to translate.c
To: "Bruno Larsen (billionai)" <bruno.larsen@eldorado.org.br>,
 qemu-devel@nongnu.org
References: <20210504140157.76066-1-bruno.larsen@eldorado.org.br>
 <20210504140157.76066-4-bruno.larsen@eldorado.org.br>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <ccfd2298-63b1-44f8-1bd3-bb4889d91202@linaro.org>
Date: Tue, 4 May 2021 09:08:51 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.1
MIME-Version: 1.0
In-Reply-To: <20210504140157.76066-4-bruno.larsen@eldorado.org.br>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::42f;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x42f.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
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
Cc: farosas@linux.ibm.com, luis.pires@eldorado.org.br,
 lucas.araujo@eldorado.org.br, fernando.valle@eldorado.org.br,
 qemu-ppc@nongnu.org, matheus.ferst@eldorado.org.br,
 david@gibson.dropbear.id.au
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 5/4/21 7:01 AM, Bruno Larsen (billionai) wrote:
> Moved all read and write callbacks for SPRs away from
> translate_init.c.inc and into translate.c; these functions are
> TCG only, so this motion is required to enable building with
> the flag disable-tcg
> 
> Signed-off-by: Bruno Larsen (billionai) <bruno.larsen@eldorado.org.br>

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

> +/*****************************************************************************/
> +/* SPR READ/RITE CALLBACKS */

WRITE.


r~

