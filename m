Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8DE3848E909
	for <lists+qemu-devel@lfdr.de>; Fri, 14 Jan 2022 12:19:45 +0100 (CET)
Received: from localhost ([::1]:48408 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n8KcS-0007MB-D4
	for lists+qemu-devel@lfdr.de; Fri, 14 Jan 2022 06:19:44 -0500
Received: from eggs.gnu.org ([209.51.188.92]:39446)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1n8KUA-0006xP-Na
 for qemu-devel@nongnu.org; Fri, 14 Jan 2022 06:11:10 -0500
Received: from [2a00:1450:4864:20::334] (port=37480
 helo=mail-wm1-x334.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1n8KU8-0004Tl-8f
 for qemu-devel@nongnu.org; Fri, 14 Jan 2022 06:11:10 -0500
Received: by mail-wm1-x334.google.com with SMTP id
 l12-20020a7bc34c000000b003467c58cbdfso7107439wmj.2
 for <qemu-devel@nongnu.org>; Fri, 14 Jan 2022 03:11:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=FSDPFCz0dJKLXTwRuDuKX2YqfSP9Y17OqOQbsJowVaM=;
 b=jay4IUlXZ+bGWeOHtktC9Vc3wW0uM7S40T8414zPqdcFuGPZv5kXiGdJB0UYewBvKT
 p3j4bxgJLddM2SLFQAdc1E+fXd7kArgKAEYOgxUhqmM114OjFLFNj6uD58hemLMe1oWu
 kQcgUuq21dNPLPKhyYmZVCAjpTfRRi6erYwjZNy94wsYxbDD2lox09qrL31IIgq8l/1s
 KgEFyn7As9oJt+IcMmodIuS2nILZfq2VQYwJkjjuJwaH2yfvEdP5SXCnlz7t67NmrMgt
 A2BGN3hEPhpFpW4bAiHaIle/7Tenf6sLfW6i+ilcCL5rrJmheOsscF9W4koTorcd7kY+
 vDNg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:message-id:date:mime-version:user-agent
 :subject:content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=FSDPFCz0dJKLXTwRuDuKX2YqfSP9Y17OqOQbsJowVaM=;
 b=jcf+XPfIQZuUxaDcmHDp7uo65SHE1t/Rc9GtKBzPaeTiOQubYl6HdPhD+4hqH1TpHB
 ifMNMshsyZNKUHQSZwPWBSt0HjE/T73XNBPJUZcnjRYFRuRtoh78NiqdtFLlo1ToLaSV
 +qOw7N6LR7v3vl0idW0evR0EC1ZhINttv5dvK1ZDB7M+ZOr5qQPKmvgmP0Zc4LLbEVYL
 U6m2cTBhgvAwiWSd/cRE6JNI1sH/DBDqasc7lvzrbyGlV6A1JvA7z1nc/TnwwAg1sQE4
 0tePjt3+5qaDTvp4K5Zb7miGuQ6RWtaiHWTXa0wWMO1mOjxdinIs8Z4FMvl1g7XEyK++
 FZBQ==
X-Gm-Message-State: AOAM5334tEmbLHPjy/tMOdpqAhD8kviUL0fLCvp/uYCk+gN1tfDr2+ej
 HP+m9sn2hJ/AetzVwaRFj3hXi4+9pnBorXLS
X-Google-Smtp-Source: ABdhPJwGfwpLnPi0VYVGS0VWhL2UMZu52221yZA1kS/9ps32+1sp4D5nK9MdFoyzx/ss0mSnmRGV/w==
X-Received: by 2002:a7b:c772:: with SMTP id x18mr7597150wmk.158.1642158666614; 
 Fri, 14 Jan 2022 03:11:06 -0800 (PST)
Received: from ?IPV6:2a01:e34:ec40:49e0:48b5:8fce:b44b:d951?
 ([2a01:e34:ec40:49e0:48b5:8fce:b44b:d951])
 by smtp.gmail.com with ESMTPSA id o12sm6083139wrc.69.2022.01.14.03.11.05
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 14 Jan 2022 03:11:06 -0800 (PST)
Message-ID: <b5fb1e68-69f1-5ee8-baef-245c32d929f6@amsat.org>
Date: Fri, 14 Jan 2022 12:11:05 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:91.0)
 Gecko/20100101 Thunderbird/91.5.0
Subject: Re: [PATCH 1/2] build-sys: fix undefined ARCH error
Content-Language: en-US
To: marcandre.lureau@redhat.com, qemu-devel@nongnu.org
Cc: pbonzini@redhat.com
References: <20220114084312.3725242-1-marcandre.lureau@redhat.com>
In-Reply-To: <20220114084312.3725242-1-marcandre.lureau@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::334
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::334;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wm1-x334.google.com
X-Spam_score_int: -6
X-Spam_score: -0.7
X-Spam_bar: /
X-Spam_report: (-0.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.248,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.248, NICE_REPLY_A=-0.001,
 PDS_HP_HELO_NORDNS=0.001, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
Reply-to:  =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
From:  =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= via <qemu-devel@nongnu.org>

On 14/1/22 09:43, marcandre.lureau@redhat.com wrote:
> From: Marc-André Lureau <marcandre.lureau@redhat.com>
> 
> ../qga/meson.build:76:4: ERROR: Key ARCH is not in the dictionary.
> 
> Fixes commit 823eb013 ("configure, meson: move ARCH to meson.build")
> 
> Signed-off-by: Marc-André Lureau <marcandre.lureau@redhat.com>
> ---
>   qga/meson.build | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)

Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>

