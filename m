Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A5B70339F95
	for <lists+qemu-devel@lfdr.de>; Sat, 13 Mar 2021 18:41:36 +0100 (CET)
Received: from localhost ([::1]:44426 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lL8Gd-0008FJ-CU
	for lists+qemu-devel@lfdr.de; Sat, 13 Mar 2021 12:41:35 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:33800)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lL8Du-0006Th-VU
 for qemu-devel@nongnu.org; Sat, 13 Mar 2021 12:38:47 -0500
Received: from mail-wm1-x334.google.com ([2a00:1450:4864:20::334]:35811)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lL8Ds-0007Ns-MX
 for qemu-devel@nongnu.org; Sat, 13 Mar 2021 12:38:46 -0500
Received: by mail-wm1-x334.google.com with SMTP id
 c76-20020a1c9a4f0000b029010c94499aedso17664453wme.0
 for <qemu-devel@nongnu.org>; Sat, 13 Mar 2021 09:38:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=oLfRo4tzYZQ9YlFoKFHUUbUH5ROYPjge/MMJ16tDWms=;
 b=VGeEdABXtLrfwi9YfaTgFpTizUGv0a1EckWmiRTcqG09e96El3YblFDYM0wa8tEi+F
 QWfTdgqUfy5BEr7lpFZWY+MDXnF14OVRRol938eXfF5gqyBaAEVpzFUTLfpBUxAYYMnF
 +/gMCZ4Bseu+AFes+NKsFq5g1EPFvtH8qgEvL7bT8qpBF//DQB3153VT5yb/YVwA8gFT
 Q0UoLWtHIyfl+GSLO8ft18l/It/PGLxu8lfl32HrkGt5r+HZaZVsYnm+OQ0QSazghlfl
 V3i2JRag1UBelzliSTpUrQP641dQrtWbfGxekVfShS1RNpfRnv4IOq7e1NV34AAbv6mz
 +Gkg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:subject:to:cc:references:from:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=oLfRo4tzYZQ9YlFoKFHUUbUH5ROYPjge/MMJ16tDWms=;
 b=AxyCPcmRyFXiMlh5UoulOqt0S5/XPNP7QeyRMrUMc4KTB6RLpK53lt5tTRaS3TfMlN
 TtXDRe1yMQfhB7QA0T2raXAQv1QX351wMHwZffif8bjRKdyU3T1Hq74rfMRqDEAt6Bwf
 E3VQrnVnfAkIOnQCBCqJ7xhXuuX4kx4RxqMwPjmyhN6l6CQvtB8uI3d8Q3vx+8RATjlF
 Nu6ZHhm40DNlyESmUqrtIXXI5jv2ZT/Z8dU2Ce9x7IYHk60+H46+w/J6IEpNZyLVgaZp
 qFDbsXz/KO6QfSFHx3GqVAtIWZaN64hJSB0ceL6BP7Sa4Nf8MqqrGoKTYc01bqTDUxqB
 qOzg==
X-Gm-Message-State: AOAM533lwZCwbtK6PycskueErbFEtNkO6f2Hxc/B4Uq7BLXd/DpQMBZo
 baFLC/4FCwQlG50+H2pS3Q4=
X-Google-Smtp-Source: ABdhPJyen2BDkxFU3K+TqRTRrzNJnxMCOc7FRoAogKk+CVGhgMAEPTG61BBCZ49b8InF0sJcmVOPog==
X-Received: by 2002:a05:600c:203:: with SMTP id
 3mr18500730wmi.88.1615657121940; 
 Sat, 13 Mar 2021 09:38:41 -0800 (PST)
Received: from [192.168.1.36] (17.red-88-21-201.staticip.rima-tde.net.
 [88.21.201.17])
 by smtp.gmail.com with ESMTPSA id 18sm7183121wmj.21.2021.03.13.09.38.40
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 13 Mar 2021 09:38:41 -0800 (PST)
Subject: Re: [PATCH 09/26] accel/tcg: Inline cpu_gen_init
To: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org
References: <20210311002156.253711-1-richard.henderson@linaro.org>
 <20210311002156.253711-10-richard.henderson@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
Message-ID: <f5e75bd4-3d6a-b565-f8e2-a09513f48c90@amsat.org>
Date: Sat, 13 Mar 2021 18:38:40 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.0
MIME-Version: 1.0
In-Reply-To: <20210311002156.253711-10-richard.henderson@linaro.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::334;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wm1-x334.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.25,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.249, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: r.bolshakov@yadro.com, j@getutm.app
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 3/11/21 1:21 AM, Richard Henderson wrote:
> It consists of one function call and has only one caller.
> 
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>  accel/tcg/translate-all.c | 7 +------
>  1 file changed, 1 insertion(+), 6 deletions(-)

Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>

