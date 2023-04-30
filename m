Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7E4B96F2A7E
	for <lists+qemu-devel@lfdr.de>; Sun, 30 Apr 2023 21:41:25 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1ptCtn-0002FH-Sd; Sun, 30 Apr 2023 15:39:55 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1ptCtm-0002Ey-Jp
 for qemu-devel@nongnu.org; Sun, 30 Apr 2023 15:39:54 -0400
Received: from mail-wr1-x42e.google.com ([2a00:1450:4864:20::42e])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1ptCtk-0005NO-KP
 for qemu-devel@nongnu.org; Sun, 30 Apr 2023 15:39:54 -0400
Received: by mail-wr1-x42e.google.com with SMTP id
 ffacd0b85a97d-2f40b891420so1740251f8f.0
 for <qemu-devel@nongnu.org>; Sun, 30 Apr 2023 12:39:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1682883590; x=1685475590;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=gbZjYJnVyBjKdKSks9HqAQHBu4OxNfi+8/7g4RTmybQ=;
 b=jkTyDCZ/Alelb1LWvOI4UG4CwGRDwnBYhNgKufTZZJQbhtRZ6bB7VZkrno9iEVTLyl
 Q5aAy+iJ2IbeN0EsBOmabTWvWmphIEeYssZAfPNIvgg/t6iN4AML0FVPNgFQpxSF8Oc4
 3obTqI7fyN30Jzxh6IW1xIZACRGzNd4YMvjDaPn4X6eywaZ6nPk6gOPrPpj9miweDBIe
 oU+z3ctbzo1B6stegiO0sC8ec5IRKuraXV6WkKur7wqHw0xpspJJlmM6XfdKurc2pfBg
 t9st/Mjr86Y4kJIxYtfMtq2zmlDGHQJPFu7cT0SX0+gYm/lwTPoC9SJBvz54AXYd60W3
 HBug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1682883590; x=1685475590;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=gbZjYJnVyBjKdKSks9HqAQHBu4OxNfi+8/7g4RTmybQ=;
 b=VEJUD6eadq1MKjbubzaou67vfgJlEehNaMzwkQEcikiTAgtrqMb3flTUIMjmFG+MPM
 +0i2GCFiN2I48DYQuBOZrZz+63W3myKhkI3OBLB9I7meZpyPKmTukbxbJwzm3e4c9XdF
 zJEfQAQoSZO6m3kpjGjKfjITon4WA+Z2QrK2f7OWcyWy785zc/eSZIFHVTFhWYKYJkrN
 SeRXfV2aWg43pZm2DLw9gdqOyW/TjnzqIwhAmOE9qQdYFjTOCUOxqtA0UluGkB1PdyaI
 Ys7n+R5SPiCyTwSRpkPQ5/h37VOQfifbR9LEfceZtCCuxgDhadSdjZSDU1/nanVQBCjT
 V0pQ==
X-Gm-Message-State: AC+VfDxXkx7YZybGMELJ9iJwvuus2OSSf1ZQWudnR4Wo4D7iTcXCFdd/
 9Twx4TnDFaCo1dfFnG0YZxTySA==
X-Google-Smtp-Source: ACHHUZ4uV/QQk9G1pd2jZi5tdnG0v3QThl9kXqrmrUAtGKcv57j0OFxXg/1jn27EOVOWSrCbIIryrg==
X-Received: by 2002:a5d:6e0f:0:b0:2ff:613c:af5d with SMTP id
 h15-20020a5d6e0f000000b002ff613caf5dmr8328110wrz.36.1682883590322; 
 Sun, 30 Apr 2023 12:39:50 -0700 (PDT)
Received: from [172.20.3.80] ([83.240.141.98])
 by smtp.gmail.com with ESMTPSA id
 y4-20020adffa44000000b002f013fb708fsm26882721wrr.4.2023.04.30.12.39.49
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 30 Apr 2023 12:39:49 -0700 (PDT)
Message-ID: <5fa36e80-87d0-34be-0ec2-cb1564ae1ac8@linaro.org>
Date: Sun, 30 Apr 2023 20:39:48 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.10.0
Subject: Re: [PATCH] hw/usb/canokey: change license to GPLv2+
Content-Language: en-US
To: "Hongren (Zenithal) Zheng" <i@zenithal.me>,
 =?UTF-8?Q?Daniel_P=2e_Berrang=c3=a9?= <berrange@redhat.com>,
 Gerd Hoffmann <kraxel@redhat.com>, "Canokeys.org" <contact@canokeys.org>,
 MkfsSion <mkfssion@mkfssion.com>
Cc: qemu-devel@nongnu.org, Peter Maydell <peter.maydell@linaro.org>
References: <ZE5z+2WbvVpTa82H@Sun>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
In-Reply-To: <ZE5z+2WbvVpTa82H@Sun>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42e;
 envelope-from=philmd@linaro.org; helo=mail-wr1-x42e.google.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-1.422,
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

On 30/4/23 15:58, Hongren (Zenithal) Zheng wrote:
> Apache license is considered by some to be not compatible
> with GPLv2+. Since QEMU as combined work is GPLv2-only,
> these two files should be made compatible.
> 
> Reported-by: "Daniel P. Berrangé" <berrange@redhat.com>
> Link: https://lore.kernel.org/qemu-devel/ZEpKXncC%2Fe6FKRe9@redhat.com/
> Signed-off-by: Hongren (Zenithal) Zheng <i@zenithal.me>
> ---
>   hw/usb/canokey.c | 2 +-
>   hw/usb/canokey.h | 2 +-
>   2 files changed, 2 insertions(+), 2 deletions(-)

Thank you!

Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>


