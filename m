Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 58FE7486EA8
	for <lists+qemu-devel@lfdr.de>; Fri,  7 Jan 2022 01:20:46 +0100 (CET)
Received: from localhost ([::1]:36774 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n5czt-0000Iy-FQ
	for lists+qemu-devel@lfdr.de; Thu, 06 Jan 2022 19:20:45 -0500
Received: from eggs.gnu.org ([209.51.188.92]:43972)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1n5cxh-0007EG-MA
 for qemu-devel@nongnu.org; Thu, 06 Jan 2022 19:18:29 -0500
Received: from [2607:f8b0:4864:20::42d] (port=42884
 helo=mail-pf1-x42d.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1n5cxf-00048E-B7
 for qemu-devel@nongnu.org; Thu, 06 Jan 2022 19:18:29 -0500
Received: by mail-pf1-x42d.google.com with SMTP id t19so3792060pfg.9
 for <qemu-devel@nongnu.org>; Thu, 06 Jan 2022 16:18:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=sx0HpUpxUEidgVJKFewjQNUgxdObKLQZwaCTMGF6xWc=;
 b=MaO7Bauz4OyGeF/qyoPYCoK50iYoX3NY50AgTwV2YJ80E1K2dNMxmyv8WGVusCe1FU
 gr0DU8sViahtafIZeggVjla9vnlEF/G4tRKk2DtyNUWcErQ8xACKb2HP55ENVHB459f5
 HApbGBO5/4tYpZ/U0XuFx7zcZ5rJueocDc/vFKfF4tKLB3pwA/i4vf6pXIhAt4nQn4aL
 Z4B/gj9F55zR4NGBOiwIG8DEBrQ7qT/hxqtkZdpng5DfsQ7KULuQqPVTMpYb06/35Avs
 QuImV6hMmE7CBv/ggkSgsEjTmOjidfYVLgj+ilHIKy2RCE9v5qLko9YrD4W0uFpazms6
 sHkQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=sx0HpUpxUEidgVJKFewjQNUgxdObKLQZwaCTMGF6xWc=;
 b=qx02D3sgu1WCyZ70aQRAvpMVDAstw2KyY23Z3AFUjvPkf5/oGXi9BI/QNdmyfTZu4A
 lSBx7LkUYm6RR/+IVoTqH1WPyT9fCs1bNaPk7vqWDL1OII3M/49td9OqyVX2Qjs95Wpo
 uBqc3MSa4A8c20uskx72mWc2eci2jLtzwMXRPDAtaEU0TgO2TSP2b/QM0whU1C6GI7Ve
 zcL45fKedHUJjN3AJbYeFLvHf5lkhKr8yFMFaE/reGZ2lTeI35qmk9jIPHpO4zh5/AsA
 Xw9oh72v4Q6OhU5eH7V4Kv+ylNEcaB3dVqTREOMLP46whPrtrvkXnHOtXXY4oFV8Gq2R
 s8nA==
X-Gm-Message-State: AOAM530DjlrTyNmSL9LB6HslhqbgRvsZ6FVpMdasAiw1Bd8z3xa8+Imr
 RPAWacxnbmkq3FmSTvS8w+4ounwLTouA2g==
X-Google-Smtp-Source: ABdhPJzE8X2KmEgp8q+KKQ0OlPQ7kBBJQXdnHJsc9J0MFsSw7cLd6pRTcdLFUYi8IAyPlR8NNLRbGQ==
X-Received: by 2002:a63:1748:: with SMTP id 8mr54097477pgx.33.1641514705975;
 Thu, 06 Jan 2022 16:18:25 -0800 (PST)
Received: from [192.168.1.13] (174-21-75-75.tukw.qwest.net. [174.21.75.75])
 by smtp.gmail.com with ESMTPSA id hk13sm3839346pjb.35.2022.01.06.16.18.25
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 06 Jan 2022 16:18:25 -0800 (PST)
Subject: Re: [PATCH v2 2/9] hw/pci: Restrict pci-bus stub to sysemu
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>,
 qemu-devel@nongnu.org
References: <20220104085431.2122999-1-f4bug@amsat.org>
 <20220104085431.2122999-3-f4bug@amsat.org>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <9d142734-f5d8-213e-2b33-2ebeb64d2321@linaro.org>
Date: Thu, 6 Jan 2022 16:18:24 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
MIME-Version: 1.0
In-Reply-To: <20220104085431.2122999-3-f4bug@amsat.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::42d
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::42d;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x42d.google.com
X-Spam_score_int: -39
X-Spam_score: -4.0
X-Spam_bar: ----
X-Spam_report: (-4.0 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-2.691,
 RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: Fam Zheng <fam@euphon.net>, Hannes Reinecke <hare@suse.com>,
 qemu-block@nongnu.org, David Hildenbrand <david@redhat.com>,
 John Snow <jsnow@redhat.com>, "Michael S. Tsirkin" <mst@redhat.com>,
 Yuval Shaia <yuval.shaia.ml@gmail.com>, Peter Xu <peterx@redhat.com>,
 Keith Busch <kbusch@kernel.org>, Klaus Jensen <its@irrelevant.dk>,
 Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 1/4/22 12:54 AM, Philippe Mathieu-Daudé wrote:
> From: Philippe Mathieu-Daudé<philmd@redhat.com>
> 
> Neither tools nor user-mode emulation require the PCI bus stub.
> 
> Signed-off-by: Philippe Mathieu-Daudé<philmd@redhat.com>
> Signed-off-by: Philippe Mathieu-Daudé<f4bug@amsat.org>
> ---
>   stubs/meson.build | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~

