Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E350B6DBC96
	for <lists+qemu-devel@lfdr.de>; Sat,  8 Apr 2023 21:16:18 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1plE2n-0008Ee-C4; Sat, 08 Apr 2023 15:16:13 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1plE2h-0007xK-6M
 for qemu-devel@nongnu.org; Sat, 08 Apr 2023 15:16:10 -0400
Received: from mail-pl1-x631.google.com ([2607:f8b0:4864:20::631])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1plE2e-0004uy-Dl
 for qemu-devel@nongnu.org; Sat, 08 Apr 2023 15:16:06 -0400
Received: by mail-pl1-x631.google.com with SMTP id o2so1535075plg.4
 for <qemu-devel@nongnu.org>; Sat, 08 Apr 2023 12:16:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1680981363;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=dO5mP0nMk4iN83RUsd+w2e5lmWKlhoCqx+MVGKsRC4A=;
 b=Cfsf9OZIX887G4fsA0Vfbhun2dwFhxVc+NdIy+1Zx2ftY5dQAcwcgWXNXAaT5acC+v
 8voRRdvd/GwFgxmgCD4/JSH1Al4TH8Tqov2P62hSfj0Gdc7LGhUVUhcBz/qWSXpHBtEh
 sfKgX1ZIyUsGcThkTS8WFCtUebUrikG/anTjHVMaDg3Rocu6Wa9+4wQBX+qxoZ5d2FYq
 XryOb5bYweEUa6eXVzWWmQwPuT8TK6lP9wQsDnBCXty7Q+Re8g8S3/08VqaCcpgzJ/D3
 vg8lMCfD/H8VZEUWft3hfhjL6SfoLfUshaCWCQzFqIIA9BvKm8HGz0LCsbzE5y0NZ2Hz
 bO2g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1680981363;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=dO5mP0nMk4iN83RUsd+w2e5lmWKlhoCqx+MVGKsRC4A=;
 b=Uh4gn29Weu6qOD4LU3mlGp0t4vXUChjOQ3JHMXre1lLU2c/XERyvmIxbOjd9YL9KC8
 DD/KzX39E0irzFAvFs9L7EyLHfvLYVczBqkOx2X4vwS8psMyzfsI8tlwWmv0fSF3Q/L2
 zsx2jYpxz1hTsEej9GGOIVCuJ/09c9XRD6Q0buzX8jDoGzKAPaElr7mFzINl0WrdNiO3
 CbyDk/jvP+0A7XSIcnN61JXEs7bvhNsic2UReklPQY6MYumDhTu3HxJE6AcbBkbqPgMT
 HsMJ4tundnRrYfwxy4kNNlALYfLlN3Mp++7D95dKZ1Sy/D9p7W1fJHI6QAsNNi9OPyuF
 lI8A==
X-Gm-Message-State: AAQBX9do3W0IaUY5C3Lh28wK5vBgtGldWgYYYLSD08ERAhLNw62PEwDG
 pEtpvFrJq/Dw9m8dWt4C9LM/mg==
X-Google-Smtp-Source: AKy350ZVApYtG79xG3U/KhQ0m6sObbKs/pR57lZMwt28j37CtH7ZRwfPi+cYs6yK/nCStk7g6HyvrA==
X-Received: by 2002:a17:90a:41:b0:23f:1165:b49f with SMTP id
 1-20020a17090a004100b0023f1165b49fmr7213913pjb.38.1680981362971; 
 Sat, 08 Apr 2023 12:16:02 -0700 (PDT)
Received: from ?IPV6:2602:ae:1541:f901:fcd:4458:21c7:367e?
 ([2602:ae:1541:f901:fcd:4458:21c7:367e])
 by smtp.gmail.com with ESMTPSA id
 f9-20020a17090a638900b002465a7fc0cfsm2864026pjj.44.2023.04.08.12.16.02
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 08 Apr 2023 12:16:02 -0700 (PDT)
Message-ID: <0aafc76c-19e2-2fb8-a764-69f4d2fee11e@linaro.org>
Date: Sat, 8 Apr 2023 12:16:00 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.0
Subject: Re: [PATCH 16/16] bsd-user: Implement SIGSYS on arm
Content-Language: en-US
To: Warner Losh <imp@bsdimp.com>, qemu-devel@nongnu.org
Cc: reinoud@netbsd.org, riastradh@netbsd.org, ryoon@netbsd.org,
 jrtc27@jrtc27.com, kevans@freebsd.org, Brad Smith <brad@comstyle.com>
References: <20230405213612.15942-1-imp@bsdimp.com>
 <20230405213612.15942-17-imp@bsdimp.com>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20230405213612.15942-17-imp@bsdimp.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::631;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x631.google.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.113,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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

On 4/5/23 14:36, Warner Losh wrote:
> When a system call returns ENOSYS, send a SIGSYS to the process (to
> generate a core dump).
> 
> Signed-off-by: Warner Losh<imp@bsdimp.com>
> ---
>   bsd-user/arm/target_arch_cpu.h | 8 ++++++++
>   1 file changed, 8 insertions(+)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~

