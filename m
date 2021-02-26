Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0C96F32662C
	for <lists+qemu-devel@lfdr.de>; Fri, 26 Feb 2021 18:14:08 +0100 (CET)
Received: from localhost ([::1]:37030 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lFggp-0007lc-26
	for lists+qemu-devel@lfdr.de; Fri, 26 Feb 2021 12:14:07 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:57964)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lFgH5-0000N4-Nb
 for qemu-devel@nongnu.org; Fri, 26 Feb 2021 11:47:31 -0500
Received: from mail-wr1-x429.google.com ([2a00:1450:4864:20::429]:33547)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lFgH3-0003sN-3u
 for qemu-devel@nongnu.org; Fri, 26 Feb 2021 11:47:31 -0500
Received: by mail-wr1-x429.google.com with SMTP id 7so9221699wrz.0
 for <qemu-devel@nongnu.org>; Fri, 26 Feb 2021 08:47:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=D/O09bHy8yuKZFphbTe+QLU4rdYY24fMe8KjzDqc8ps=;
 b=lWZaPXfYs26Z+d2w3Qx2IyYLD52dHzPMf07HvbMbwvyQ5aqlicJmf3mRvF+yOgMYzl
 5Z0x8DlyRCdu1Wjf1V7bVS6fydLe2TfDYTAbGmbgPaKUv0e5SwgHXdRX+1YxtnloBX8c
 zC/cfgYXbaiZQZk0V0fCZsIlq6KAW/dSUSt9tCxvRJhGIOOfbHNeQOp/6+OhIDYq4Nhm
 NSfz13vEhsPF8kNfNuv+HhWAqfZ88f5oKqvB/Vwk+KWz93Ff4kcN/XFu+IUjwiENmKbR
 UZUPBmkCSWZDJMb57l000SFuVVvu+lXmLbgkc6xRQCIbXzUcYHTgcrqnjpsyB6FIwozC
 hyNQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:subject:to:cc:references:from:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=D/O09bHy8yuKZFphbTe+QLU4rdYY24fMe8KjzDqc8ps=;
 b=UxdDnzQpdfhleF9Zr2uhYfV73kWNSL/al95Bkn1V3ORSxiCm+xsPyTlM62rfNee5ia
 peh+y6VO02aCSh+9XmEnC5IfC6JBTfXr5ZE9MWbDdQM9L4Kyf1o7w0aO/41q+7Zb9+b2
 eDDmwM1AM/Alloh6e2E/4EBLbCHq+abM5PgoG64e/4+sLYdlzZ698a9Nm4sjuRJQ8S5R
 IhlLNsQCslJkmp4SjKZ85WAQxop+kdrcpyZNGZp7eD5SS1c9iEQJM6L+pL0V6CP/4g5W
 dUY7ZXy1VAUJYoe0amE1OgDbWGW43JaDHwZ6Trh7eS+6u6QE/Bac05t7Ex09l8lso1O1
 oKSA==
X-Gm-Message-State: AOAM5338292VOTRzUbjMKXu4gVKGN2UvHkZ876/MEgt/zZzWr6dIZA7D
 P8n3vyVswVQ5VBv7tykkxWU=
X-Google-Smtp-Source: ABdhPJwXpK89Z+cUoUhHjL4orHFqbJWK6sVpnqRtB4BYgES8foe10a95qKpwR57BUyLafAGAsjjhDQ==
X-Received: by 2002:a5d:6b42:: with SMTP id x2mr4067767wrw.117.1614358044881; 
 Fri, 26 Feb 2021 08:47:24 -0800 (PST)
Received: from [192.168.1.36] (68.red-83-57-175.dynamicip.rima-tde.net.
 [83.57.175.68])
 by smtp.gmail.com with ESMTPSA id u4sm5707125wrm.24.2021.02.26.08.47.24
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 26 Feb 2021 08:47:24 -0800 (PST)
Subject: Re: [PATCH 2/2] target/i386: Split out do_fsave, do_frstor,
 do_fxsave, do_fxrstor
To: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org
References: <20210226162022.375654-1-richard.henderson@linaro.org>
 <20210226162022.375654-3-richard.henderson@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
Message-ID: <05a6b4db-039d-d23a-e721-b1bb45e274c9@amsat.org>
Date: Fri, 26 Feb 2021 17:47:22 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.0
MIME-Version: 1.0
In-Reply-To: <20210226162022.375654-3-richard.henderson@linaro.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::429;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wr1-x429.google.com
X-Spam_score_int: -17
X-Spam_score: -1.8
X-Spam_bar: -
X-Spam_report: (-1.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.25, NICE_REPLY_A=-0.349,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: pbonzini@redhat.com, cfontana@suse.de, ehabkost@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 2/26/21 5:20 PM, Richard Henderson wrote:
> The helper_* functions must use GETPC() to unwind from TCG.
> The cpu_x86_* functions cannot, and directly calling the
> helper_* functions is a bug.  Split out new functions that
> perform the work and can be used by both.
> 
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>  target/i386/tcg/fpu_helper.c | 50 ++++++++++++++++++++++++------------
>  1 file changed, 34 insertions(+), 16 deletions(-)

Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>

