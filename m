Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C3EFF6EC0A6
	for <lists+qemu-devel@lfdr.de>; Sun, 23 Apr 2023 16:57:31 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pqb8J-0003wB-4b; Sun, 23 Apr 2023 10:56:07 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pqb8H-0003vj-2X
 for qemu-devel@nongnu.org; Sun, 23 Apr 2023 10:56:05 -0400
Received: from mail-wr1-x42b.google.com ([2a00:1450:4864:20::42b])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pqb8D-0007oZ-L4
 for qemu-devel@nongnu.org; Sun, 23 Apr 2023 10:56:04 -0400
Received: by mail-wr1-x42b.google.com with SMTP id
 ffacd0b85a97d-2fe3fb8e2f7so2059877f8f.0
 for <qemu-devel@nongnu.org>; Sun, 23 Apr 2023 07:56:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1682261759; x=1684853759;
 h=content-transfer-encoding:in-reply-to:references:to:from
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=JgrvWSHgS1JxXg78rjwdgkRT3Rt/IypoheTGcHtNH5U=;
 b=cZ2Hf2lWnsYFVoFzMy8nSDNQkZxsR3uAGYOVExOEBqOakcTFJMGN4Y8waTMrXaokcY
 O+5hwezy25NVdPeXw5X1fNJ5EUb6+ARZbdxmPNm6JAB5lUsHExom/K9hclr6kv286eRe
 alhKgrbOGyQfwdKDLIeVLdq24LOYgWsoWFpUznpg6HhOVmg/xCi5Y0xSWGGBViTr2hka
 4JprBebRKa48tsJTCvo5KylFcm9kEo2uVwR7Ont5R/HXCee8cjAqBgjUfYrz63dguwPh
 pxwzNDPf76NIpPS6QN0/M9vvVH1PP8sOhSS+gLajtg2+r6b5YQRh1eju87KYiEX0WSnq
 XBqw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1682261759; x=1684853759;
 h=content-transfer-encoding:in-reply-to:references:to:from
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=JgrvWSHgS1JxXg78rjwdgkRT3Rt/IypoheTGcHtNH5U=;
 b=iWpa5V3WWHFE0Jfn9fNJG7FxUgr2lxCYE10DFRQMiNp1YPeErYB0VbW9em1Mkw5/jo
 FqV9HkdR2SkxfDpQLXr7e7JDNXncCIRmR6OXCocR5h3BGMo7hrqtabPEG/gj2bOCrKIo
 lsUUaMYrZxhk404LEYXc8MtHAX/A1eYae6eU3lpBKqIBxQutHGbs1Sk5iA60wh2N59q4
 KCMV9r08SaSdBl/XxUc/HriG/s61xLea48QCN0vpLGIjchXfNHrgNYcsmPcep6bXogq5
 1NmzaB1oezZHGs+mQN/COgw0GEQn8qTqQaxyuJfDI9jroVhAFsCIS4T+vmk37hFCKF4/
 Omdw==
X-Gm-Message-State: AAQBX9egwuXgpMZfZpG26phgCUe0ltxMaOIDXckrRc3PYSm6Ua2oeAsF
 QyWZqpbZu7e/GQIng0A4oYKEU8bLg3+EtR0v/U6IgQ==
X-Google-Smtp-Source: AKy350YQZJ9nKN360wYx2zQ2L0L2sMyChbraZPxDAVjA/Ms7yYSdjPiAI+0mNLHQugW9wi+HiWv2gg==
X-Received: by 2002:a5d:428f:0:b0:2f5:ac53:c04f with SMTP id
 k15-20020a5d428f000000b002f5ac53c04fmr8362858wrq.28.1682261759611; 
 Sun, 23 Apr 2023 07:55:59 -0700 (PDT)
Received: from [10.43.4.99] (cust-west-loneq8-46-193-226-34.wb.wifirst.net.
 [46.193.226.34]) by smtp.gmail.com with ESMTPSA id
 j3-20020a5d6183000000b002faaa9a1721sm8773757wru.58.2023.04.23.07.55.58
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 23 Apr 2023 07:55:59 -0700 (PDT)
Message-ID: <a18af54b-632b-1214-8a85-8821574605c0@linaro.org>
Date: Sun, 23 Apr 2023 15:55:57 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.0
Subject: Re: [PULL 00/15] tcg patch queue
Content-Language: en-US
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
References: <20230423101950.817899-1-richard.henderson@linaro.org>
In-Reply-To: <20230423101950.817899-1-richard.henderson@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42b;
 envelope-from=richard.henderson@linaro.org; helo=mail-wr1-x42b.google.com
X-Spam_score_int: -42
X-Spam_score: -4.3
X-Spam_bar: ----
X-Spam_report: (-4.3 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-2.143,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

On 4/23/23 11:19, Richard Henderson wrote:
> Merge the first set of reviewed patches from my queue.
> 
> r~
> 
> The following changes since commit 6dd06214892d71cbbdd25daed7693e58afcb1093:
> 
>    Merge tag 'pull-hex-20230421' ofhttps://github.com/quic/qemu  into staging (2023-04-22 08:31:38 +0100)
> 
> are available in the Git repository at:
> 
>    https://gitlab.com/rth7680/qemu.git  tags/pull-tcg-20230423
> 
> for you to fetch changes up to 3ea9be33400f14305565a9a094cb6031c07183d5:
> 
>    tcg/riscv: Conditionalize tcg_out_exts_i32_i64 (2023-04-23 08:46:45 +0100)
> 
> ----------------------------------------------------------------
> tcg cleanups:
>    - Remove tcg_abort()
>    - Split out extensions as known backend interfaces
>    - Put the separate extensions together as tcg_out_movext
>    - Introduce tcg_out_xchg as a backend interface
>    - Clear TCGLabelQemuLdst on allocation
>    - Avoid redundant extensions for riscv

Applied, thanks.  Please update https://wiki.qemu.org/ChangeLog/8.1 as appropriate.


r~


