Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CA5D55114E7
	for <lists+qemu-devel@lfdr.de>; Wed, 27 Apr 2022 12:43:20 +0200 (CEST)
Received: from localhost ([::1]:39018 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1njf8e-0002W7-Ei
	for lists+qemu-devel@lfdr.de; Wed, 27 Apr 2022 06:43:19 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60246)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1njf3Y-0000Nf-Oe
 for qemu-devel@nongnu.org; Wed, 27 Apr 2022 06:38:00 -0400
Received: from mail-wr1-x429.google.com ([2a00:1450:4864:20::429]:33705)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1njf3X-0000Dw-0w
 for qemu-devel@nongnu.org; Wed, 27 Apr 2022 06:38:00 -0400
Received: by mail-wr1-x429.google.com with SMTP id x18so1925474wrc.0
 for <qemu-devel@nongnu.org>; Wed, 27 Apr 2022 03:37:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=references:user-agent:from:to:cc:subject:date:in-reply-to
 :message-id:mime-version:content-transfer-encoding;
 bh=JBs7b3orh4TDsRbroNyV978a179s+iUv8bosfxO977M=;
 b=xjBhM/Dk+jkDxmqWTUYbAMYPD/ssFSQF1Zssi716Ri1gYpU4ObvZoRDRcoMiB0KPM9
 Hzy5sHgDnJySwfHr6meyh1B2E/rYUAw+OElnIxtLuaA7M1+DPPgtoBeMiTqz0vj+WbHf
 F8WpStdmuxlfgfNPns5CztpMAApRbpgUnAjDMmGjGYtP6WUoAnyGg3rtXvLlGEVAFwb/
 vIYNalMJEwoR7posfvGh0HmZnbotrmGjZA9UwpkRLuDOrtn8XN/kW1Mk9/8uGFMZQbzn
 dSAjMue5SDi6qfM7cPO0BqLSNjrx1DLspbA8JX3YXCic5PLKRGyV4SKIhNyETUYMZU1X
 C2tA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:references:user-agent:from:to:cc:subject:date
 :in-reply-to:message-id:mime-version:content-transfer-encoding;
 bh=JBs7b3orh4TDsRbroNyV978a179s+iUv8bosfxO977M=;
 b=PvOyRTpFGW+/i9rpdOzt2L/KYrckZxyqch0N9HmFTt7LfgRmNGWSCfThzo0m7BSA7E
 qF2f6rK/G+sGAPBgT9n5mGMoMuzpJ2CRKOR7vfkU65/A6AiQavznvNAxkDPF3YXN9G7H
 4Cp1KRGHCaPAWM7heYtRPUBphB1/PRvy43yk9/F9fDZDTPynOt7QQRXj403GamiPv8Z7
 8rHost38VWOzCLcvfsbk/9LsiXZDHZnZRuHdNyszZCM4oBXZzaV724Xum3+mnQeaweF9
 aZlO8Yg3EQPaWZZnM6dZ39iLwHMXo1SDCaj6iG8SBhiCEcGEACf88UphI1w0gXaGibNC
 BsOg==
X-Gm-Message-State: AOAM5315Tef9ni4b/kPLLCufrl7A9/YtkSMvwW8Z7bFib7jOVUq6ZKW1
 /5/J/bqPZN9mledHg8Ys80Ps2Q==
X-Google-Smtp-Source: ABdhPJxllwKCjsUh8WWr0GbyAzfSFNxwCOv2RsVvgl5oc9THonQNVGxck+aonsliG8S3QVhgOXKKpA==
X-Received: by 2002:a05:6000:510:b0:203:e469:f0a3 with SMTP id
 a16-20020a056000051000b00203e469f0a3mr22132301wrf.710.1651055875817; 
 Wed, 27 Apr 2022 03:37:55 -0700 (PDT)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id
 n5-20020adf8b05000000b00207a4fd0185sm13372759wra.7.2022.04.27.03.37.54
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 27 Apr 2022 03:37:54 -0700 (PDT)
Received: from zen (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id E8A4B1FFB7;
 Wed, 27 Apr 2022 11:37:53 +0100 (BST)
References: <20220427051926.295223-1-richard.henderson@linaro.org>
User-agent: mu4e 1.7.13; emacs 28.1.50
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Richard Henderson <richard.henderson@linaro.org>
Subject: Re: [PATCH] target/arm: Use field names for accessing DBGWCRn
Date: Wed, 27 Apr 2022 11:37:49 +0100
In-reply-to: <20220427051926.295223-1-richard.henderson@linaro.org>
Message-ID: <87wnfa4xry.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::429;
 envelope-from=alex.bennee@linaro.org; helo=mail-wr1-x429.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
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
Cc: qemu-arm@nongnu.org, qemu-devel@nongnu.org, Chris Howard <cvz185@web.de>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


Richard Henderson <richard.henderson@linaro.org> writes:

> While defining these names, use the correct field width of 5 not 4 for
> DBGWCR.MASK.  This typo prevented setting a watchpoint larger than 32k.
>
> Reported-by: Chris Howard <cvz185@web.de>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>

Reviewed-by: Alex Benn=C3=A9e <alex.bennee@linaro.org>

--=20
Alex Benn=C3=A9e

