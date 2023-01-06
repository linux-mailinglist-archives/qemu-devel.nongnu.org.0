Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 535FD660A60
	for <lists+qemu-devel@lfdr.de>; Sat,  7 Jan 2023 00:47:44 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pDwQR-0002A2-0S; Fri, 06 Jan 2023 18:47:03 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pDwQO-00026U-RL
 for qemu-devel@nongnu.org; Fri, 06 Jan 2023 18:47:00 -0500
Received: from mail-pl1-x62c.google.com ([2607:f8b0:4864:20::62c])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pDwQM-00026C-I6
 for qemu-devel@nongnu.org; Fri, 06 Jan 2023 18:46:59 -0500
Received: by mail-pl1-x62c.google.com with SMTP id p24so3323821plw.11
 for <qemu-devel@nongnu.org>; Fri, 06 Jan 2023 15:46:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=Vs09lEGvaTqGtUW/vqrniaNFMF6r176kAlYQWEVWlOU=;
 b=lqeffZPTnebxTwV/87qq6VlLE7VQITx9ne75Gzwhd88r/LjKARb5+SXdMwjzb2wjrW
 LfrjtAhuITWwbtdRHMd2caMCblMdZpj1PVzcTtzlw7MCvGTtKaUOUAiRRr7sxt85ScYc
 SvBOeopo0Y18CoOuRLjzghtPNhMVUgPe0cd6K3czv+AfbjSykSLR4b9jX5Fx34vcf0Mn
 rBvkpvq4cRUJZUC6uUTWdqZjzwNRAqE8iUOFLyp0um1A67ptTI1NhSbzKMMnwJcutR7j
 QU+9QdL4eexrgO2ukeL1mLHyCZVNO4XKpeYu28etJHmtDHSx3WcSEzFgAU5o8k8nHgTW
 9wtA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=Vs09lEGvaTqGtUW/vqrniaNFMF6r176kAlYQWEVWlOU=;
 b=tlr+LuPm0ZSjPBQpI85y7eAAc5/qcWTdZnDRfwVDV5JzM9uq4RuX2UbGYlEpNhBe1R
 xfxriQxza5tcHMFH52bXj7FWH5XkGeSJB3HWVdJBhuBQm/27uIhUrzcefwfweyC8OnOY
 qNE47+wIbbbzM7G2kOmeSJ3KAPB3Fc2+GV4EyXCJ5dSoFmxZ+ZwMt+pLx1wBNFrpE7au
 ghtwdLNI1taIu6sxzVcEV7e68THDBlhnX8jcKLPIAPr+A4iNEArbaHbMePZmgayaOFnM
 GBQ+Tdz/nVua0p6VUx2NkL3o03NmhwCFbBK+ccwoSYzChe52OT4JMD6h4YMH13qG64N4
 yWVQ==
X-Gm-Message-State: AFqh2koIOFCEX3vFDsk1GE0Ozo0t6QNvkOrL8xDAkk/9JK1vrgl8JuYE
 1f3ZyZA8UHcTGTkdWJ/7J/NriQ==
X-Google-Smtp-Source: AMrXdXu3E2cZlG7WOVYiq5hwkgzyelmIhUlsMo/27zve+ESNNtIUNNxCIS/LoLiW9Pouv3EUb30/Lg==
X-Received: by 2002:a17:902:9687:b0:193:e89:f5ff with SMTP id
 n7-20020a170902968700b001930e89f5ffmr3372646plp.28.1673048816759; 
 Fri, 06 Jan 2023 15:46:56 -0800 (PST)
Received: from ?IPV6:2602:47:d48c:8101:9d81:5b04:51d7:acae?
 ([2602:47:d48c:8101:9d81:5b04:51d7:acae])
 by smtp.gmail.com with ESMTPSA id
 u16-20020a170902e5d000b00172fad607b3sm1428355plf.207.2023.01.06.15.46.55
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 06 Jan 2023 15:46:56 -0800 (PST)
Message-ID: <df78c474-d5db-d01e-c34b-43f40c9f1fb4@linaro.org>
Date: Fri, 6 Jan 2023 15:46:54 -0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.2
Subject: Re: [PATCH v2 20/21] gdbstub: move syscall handling to new file
Content-Language: en-US
To: =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 qemu-devel@nongnu.org
References: <20230105164320.2164095-1-alex.bennee@linaro.org>
 <20230105164320.2164095-21-alex.bennee@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20230105164320.2164095-21-alex.bennee@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::62c;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x62c.google.com
X-Spam_score_int: -49
X-Spam_score: -5.0
X-Spam_bar: -----
X-Spam_report: (-5.0 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-2.939,
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

On 1/5/23 08:43, Alex Bennée wrote:
> +++ b/gdbstub/syscalls.c
> @@ -0,0 +1,230 @@
> +/*
> + * GDB Syscall Handling
> + *
> + * GDB can execute syscalls on the guests behalf, currently used by
> + * the various semihosting extensions. As this interfaces with a guest
> + * ABI we need to build it per-guest (although in reality its a 32 or
> + * 64 bit target_ulong that is the only difference).
> + *
> + * Copyright (c) 2003-2005 Fabrice Bellard
> + * Copyright (c) 2023 Linaro Ltd
> + *
> + * SPDX-License-Identifier: LGPL-2.0+
> + */
> +
> +#include "qemu/osdep.h"
> +#include "cpu.h"
> +#include "semihosting/semihost.h"
> +#include "sysemu/runstate.h"
> +#include "gdbstub/user.h"
> +#include "gdbstub/syscalls.h"
> +#include "trace.h"
> +#include "internals.h"
> +
> +/* Common state */
> +extern GDBState gdbserver_state;

This belongs in internals.h; I should have picked up on it earlier vs the other incorrect 
delarations in softmmu.c, user.c, user-target.c.

Otherwise,
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>


r~

