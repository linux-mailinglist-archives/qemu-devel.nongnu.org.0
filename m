Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 774CF48710C
	for <lists+qemu-devel@lfdr.de>; Fri,  7 Jan 2022 04:08:56 +0100 (CET)
Received: from localhost ([::1]:47528 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n5fcd-0000yA-6P
	for lists+qemu-devel@lfdr.de; Thu, 06 Jan 2022 22:08:55 -0500
Received: from eggs.gnu.org ([209.51.188.92]:45468)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1n5fb3-0005p2-K7
 for qemu-devel@nongnu.org; Thu, 06 Jan 2022 22:07:17 -0500
Received: from [2607:f8b0:4864:20::52e] (port=34305
 helo=mail-pg1-x52e.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1n5fav-00058S-K2
 for qemu-devel@nongnu.org; Thu, 06 Jan 2022 22:07:16 -0500
Received: by mail-pg1-x52e.google.com with SMTP id g22so4286171pgn.1
 for <qemu-devel@nongnu.org>; Thu, 06 Jan 2022 19:07:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=4QFSt/X+2r40YGUcQPccF0R/rGwusLa3IwqVwk3HKuo=;
 b=ng+cTmAhIkvP5WCMSGiyLzR4vOX3/zl3iT1hl3aW/zu9c7l43KEV/LDpJCxgdmCMv3
 vKFuq9NopIqAJgIovnt0bcQRAAY/6idsvT8E7O35FJjH29+CCYtXgnkNJrzS3gUVOX5I
 EhsNKUhkaWd+rZRnqaB0Olhxeh4DCX5vqelUHeE+Pr3FfIXrbdfKbZ0JOnXG8WQPFfrY
 UFM+x4dvDzrjgMWXJWKWZVWmCtxvvpQjOEcmOstEh9Vm3AuYH4l1kSfFOn8XZa0kqIWy
 oWRXYXMgT4knAio9TUFgz3HAniPtuB720/mELo0LJg8bXwZwYUkOHpmgDvApWYFuDClH
 qCTA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=4QFSt/X+2r40YGUcQPccF0R/rGwusLa3IwqVwk3HKuo=;
 b=OhnLB7IB20ULV6Edyb68wAcEMXtQo9s9d0tByoDY+MxBdGj9Xkee3KXQ2pxkOjb6ok
 q4cdTYKGt2N3iofurDGmclb7YDdYDXQBECT+hM6v3MPKSYwUZ0RpqxOJOA6ihYNHHq7r
 rqMEe91hIUaGJI/C1whhwroCAsf1TpCLxJ/PM6N1Sqv5/3LmG+3q4P0P/L/n7TyKJCIE
 /TsBVGOccx38eLZt3UsRqTWzoUQ4WxBkw+KVFyzqhuja+9stD9w92fzaVp9cfPJ5f+hS
 JNpdIXSOrx8/tRHMTn3h8XpzCvYwBlcHuuedTZG0AQ0RKE00RVP2eTk1IAJUK5Qt1Ra+
 3P9Q==
X-Gm-Message-State: AOAM533phonm2zFcZkX+8w2qBph/Oc/u8ayuAKK4RxYOsoeVAwJppqox
 J305ErVjt7xTPIaNsp2q6yfFxg==
X-Google-Smtp-Source: ABdhPJzryOz6ghKzBUvQMEFDZwThBwcyPRdqYuEkhBy6OsCz0xxiDN5gLF8xIcXodj/L29yTNj8Ssg==
X-Received: by 2002:a63:2023:: with SMTP id g35mr55714402pgg.432.1641524828182; 
 Thu, 06 Jan 2022 19:07:08 -0800 (PST)
Received: from [192.168.1.13] (174-21-75-75.tukw.qwest.net. [174.21.75.75])
 by smtp.gmail.com with ESMTPSA id 4sm3711329pfy.191.2022.01.06.19.07.07
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 06 Jan 2022 19:07:07 -0800 (PST)
Subject: Re: [PATCH v2 3/7] target/ppc: powerpc_excp: Group unimplemented
 exceptions
To: Fabiano Rosas <farosas@linux.ibm.com>, qemu-devel@nongnu.org
References: <20220105204029.4058500-1-farosas@linux.ibm.com>
 <20220105204029.4058500-4-farosas@linux.ibm.com>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <02bae488-7c8c-b933-d885-ed62741538b3@linaro.org>
Date: Thu, 6 Jan 2022 19:07:06 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
MIME-Version: 1.0
In-Reply-To: <20220105204029.4058500-4-farosas@linux.ibm.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::52e
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::52e;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x52e.google.com
X-Spam_score_int: -39
X-Spam_score: -4.0
X-Spam_bar: ----
X-Spam_report: (-4.0 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-2.691,
 RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793, SPF_HELO_NONE=0.001,
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
Cc: danielhb413@gmail.com, qemu-ppc@nongnu.org, clg@kaod.org,
 david@gibson.dropbear.id.au
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 1/5/22 12:40 PM, Fabiano Rosas wrote:
> Signed-off-by: Fabiano Rosas<farosas@linux.ibm.com>
> Reviewed-by: Cédric Le Goater<clg@kaod.org>
> ---
>   target/ppc/excp_helper.c | 77 +++++-----------------------------------
>   1 file changed, 8 insertions(+), 69 deletions(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~

