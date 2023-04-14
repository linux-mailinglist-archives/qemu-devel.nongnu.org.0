Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7799B6E24CF
	for <lists+qemu-devel@lfdr.de>; Fri, 14 Apr 2023 15:54:08 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pnJr6-0005ui-PV; Fri, 14 Apr 2023 09:52:48 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pnJqx-0005mg-Ga
 for qemu-devel@nongnu.org; Fri, 14 Apr 2023 09:52:40 -0400
Received: from mail-wr1-x42e.google.com ([2a00:1450:4864:20::42e])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pnJqt-0001LD-Pt
 for qemu-devel@nongnu.org; Fri, 14 Apr 2023 09:52:38 -0400
Received: by mail-wr1-x42e.google.com with SMTP id q6so6117916wrc.3
 for <qemu-devel@nongnu.org>; Fri, 14 Apr 2023 06:52:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1681480352; x=1684072352;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=slmmoslylIXLT6WqdO7p/4Lsd8RRdinkwB/2XzjjzqA=;
 b=ldG7Z4gJsgfVAMAPPjOpKwVmZ4IaKOTNc8XbJUEAOEHMnVlw32iikE7zLr3QagBLUs
 dnwjBjcZfSVIX7fpsHv3Pc7badGrmSYwL5vhiJHgQodLhkP+9EGKq+3tH3/6+4bm7T/j
 e3RBLreQtnV0RlYCByrPJ4X08tT3jyz9cXR+QeDUuEZ2oVQWdZUiY5rl9vptpHEdlUfX
 ueOEePBtYI8nAuZw3D3kJZvRQaB7ElTpT5WC3gLShkBroe1V8DePjpDpPB4of3PNKiIp
 LCPUPi5xdr+B26RBa09LRyill94qIPhPWxeQ6Fl1rbLtLhBTd5fsqNpNe9sb/Ir4lKDf
 w5PA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1681480352; x=1684072352;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=slmmoslylIXLT6WqdO7p/4Lsd8RRdinkwB/2XzjjzqA=;
 b=HteVwakOMTinS4dzOpGdJ2XPeMSFPMkEt+1Ohl5VxCAE1aKZ//LZF6lXyeu72lVybC
 mwl5cd3pz0ZfMQ3TMxclMbXla9rYW1aitho9i9FFcg+L+b/Qq86qBZ7qMz8t+PGHolLO
 nnGV8H9aMEuuR9/FBv3vsIsbQAEJfb+ajPtfMU6y/mGLrR/Vd//KkhpSm53IneFS/4j1
 7TLOQYOxIQnqDCdt+Fgr/ScuDRLvwxogRNA5l0DksSzdsvg9e3mwyKiwTbcQ01IBZeTy
 HGjE1a0KjMibTmyvgJDI8g8LlFCLpFhdo4rymOVLMBoXn9zj9K7kgOFggKCBOb7S9Q9N
 vJ3A==
X-Gm-Message-State: AAQBX9fkhz2jsKONsh3bNBWNq5VWD8sFDEso6D2CDB/S8K7kQnBcnvFs
 rpSdmR5gp5EyjCqrDz5eEPkMkw==
X-Google-Smtp-Source: AKy350aqyaBQXZZVW+bEUZDptq8Y46+rFjlNFsqRvixYp5zyGpGCDTcya6oP7Vv4hDS/1BUBZbtFkQ==
X-Received: by 2002:a5d:4091:0:b0:2ef:af48:7b0e with SMTP id
 o17-20020a5d4091000000b002efaf487b0emr3996462wrp.69.1681480351733; 
 Fri, 14 Apr 2023 06:52:31 -0700 (PDT)
Received: from [192.168.69.115] ([176.187.204.198])
 by smtp.gmail.com with ESMTPSA id
 v7-20020a5d6b07000000b002de9a0b0a20sm3576389wrw.113.2023.04.14.06.52.30
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 14 Apr 2023 06:52:31 -0700 (PDT)
Message-ID: <c55f3aca-9e4f-29be-6df5-de024b43c9ca@linaro.org>
Date: Fri, 14 Apr 2023 15:52:29 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.9.1
Subject: Re: [PATCH] hw/core: Move numa.c into the target independent source
 set
Content-Language: en-US
To: Thomas Huth <thuth@redhat.com>, qemu-devel@nongnu.org
Cc: Markus Armbruster <armbru@redhat.com>,
 Stefan Hajnoczi <stefanha@redhat.com>
References: <20230413182636.139356-1-thuth@redhat.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
In-Reply-To: <20230413182636.139356-1-thuth@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42e;
 envelope-from=philmd@linaro.org; helo=mail-wr1-x42e.google.com
X-Spam_score_int: -43
X-Spam_score: -4.4
X-Spam_bar: ----
X-Spam_report: (-4.4 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-2.282,
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

On 13/4/23 20:26, Thomas Huth wrote:
> There is nothing that depends on target specific macros in this
> file, so we can move it to the common source set to avoid that
> we have to compile this file multiple times (one time for each
> target).
> 
> Signed-off-by: Thomas Huth <thuth@redhat.com>
> ---
>   hw/core/meson.build | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)

Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>



