Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A368B67F187
	for <lists+qemu-devel@lfdr.de>; Fri, 27 Jan 2023 23:56:15 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pLXd6-0005G6-4O; Fri, 27 Jan 2023 17:55:32 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pLXd4-0005Fw-SH
 for qemu-devel@nongnu.org; Fri, 27 Jan 2023 17:55:30 -0500
Received: from mail-pj1-x1035.google.com ([2607:f8b0:4864:20::1035])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pLXd3-0002g4-ED
 for qemu-devel@nongnu.org; Fri, 27 Jan 2023 17:55:30 -0500
Received: by mail-pj1-x1035.google.com with SMTP id m11so6017247pji.0
 for <qemu-devel@nongnu.org>; Fri, 27 Jan 2023 14:55:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=wSxIl2C6hNVqqACPMXH7QK6LcU4k4p1S2BfbYZstHQ4=;
 b=F5HLS87Rur934u/odbdstwgSxYEYqB3m8Y3Sfqlm9HF1HfyLGFY3DP+Zz7lPNsQKel
 G+cMv/BiBVkKuQvq5HBSmgf11TbwOj8k8G3d11Pe2X1bAMDuSggNso7WLfXkDoqi+Fgf
 2lMkZH/aKksb5VmanE7p2wCzNUIDrhyHbXPCIBm9u23lJmQfoaonTa+hrNdiWQsI9V2M
 idkaqKmKm1YkqtJ3JPmH+R3SzFikrR6pOhCjll77oBYl7ZNqZS5Gw2Jk0yV30Fr29+qq
 ZQekyhIHR4yryZ01vcb8UqxmuAht/pyQvr1TYmbguEATgkuDZEgmdSG0qF1ORwChXGLp
 br5w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=wSxIl2C6hNVqqACPMXH7QK6LcU4k4p1S2BfbYZstHQ4=;
 b=YuochyNefE7GewGuYZJsTPebpcj+WQWvck56TPtvxoKvqC86swOkCqZXzDKnFEgLF+
 k4FFej4n3HXYoTn24HxTRNUD7xweCHwyLw+K3PT78nV1xG5s6Ov0A296HQgfpCzhUXTK
 s0jhfFeFRhlKzxy3TgO9nTR6apGEnUosktp7cvQMvWD2yRLw3dmiRLaJk+dZbcunu6iR
 BgepqGplFcLz/11EG1X18kMDE9Bn8n6kTDiZRWXDDbci4yprYkFFx7NZZ0mjN4gHT6Rp
 FJpZ2cZEUyRYAMMqmdCRdwmjMDMZDDZ3GEsZhaJuJZoscJeAvZZmQamNKJ58xOP2b6Ub
 iIdQ==
X-Gm-Message-State: AO0yUKVCenaZ5V41Fle7c85PKy9K5edgRDF+cxd1E+ivqwAG5usj0F0V
 mPPLhF5axAKz1ArXu14N3VXtRW8pNyncA7VT
X-Google-Smtp-Source: AK7set9yQqKGqM/CCpFGxgLaA63t6oVcucWj5gqG3MQIDLz82VhHPFQIMpd6WLhprTxkin/SnkaKoQ==
X-Received: by 2002:a17:90b:17c2:b0:22b:fd64:c48e with SMTP id
 me2-20020a17090b17c200b0022bfd64c48emr13853932pjb.14.1674860127405; 
 Fri, 27 Jan 2023 14:55:27 -0800 (PST)
Received: from [192.168.50.174] (rrcs-173-197-98-118.west.biz.rr.com.
 [173.197.98.118]) by smtp.gmail.com with ESMTPSA id
 a6-20020a17090a688600b00223ed94759csm5568783pjd.39.2023.01.27.14.55.26
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 27 Jan 2023 14:55:26 -0800 (PST)
Message-ID: <ec946e70-acd2-5c7f-692f-daaa81fe1c3f@linaro.org>
Date: Fri, 27 Jan 2023 12:55:24 -1000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.2
Subject: Re: [PATCH v2] linux-user: Fix SO_ERROR return code of getsockopt()
Content-Language: en-US
To: Helge Deller <deller@gmx.de>, Laurent Vivier <laurent@vivier.eu>
Cc: qemu-devel@nongnu.org
References: <20221216101033.8352-1-deller@gmx.de>
 <8ec83c02-0e87-90c2-835d-e01a330b1969@vivier.eu>
 <db38ab56-d632-8cb4-9e60-aef83477ca74@gmx.de>
 <059795f6-97f0-b112-1802-fc47668986a5@vivier.eu> <Y9QzNzXg0hrzHQeo@p100>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <Y9QzNzXg0hrzHQeo@p100>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1035;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1035.google.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-1.148,
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

On 1/27/23 10:25, Helge Deller wrote:
> Add translation for the host error return code of:
>      getsockopt(19, SOL_SOCKET, SO_ERROR, [ECONNREFUSED], [4]) = 0
> 
> This fixes the testsuite of the cockpit debian package with a
> hppa-linux guest on a x86-64 host.
> 
> Signed-off-by: Helge Deller<deller@gmx.de>
> ---

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~

