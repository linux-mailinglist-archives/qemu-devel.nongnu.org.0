Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 34F48320618
	for <lists+qemu-devel@lfdr.de>; Sat, 20 Feb 2021 17:05:48 +0100 (CET)
Received: from localhost ([::1]:49690 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lDUlO-00026G-Pp
	for lists+qemu-devel@lfdr.de; Sat, 20 Feb 2021 11:05:46 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:44068)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lDUjX-0001YS-Sw
 for qemu-devel@nongnu.org; Sat, 20 Feb 2021 11:03:51 -0500
Received: from mail-pf1-x42f.google.com ([2607:f8b0:4864:20::42f]:37942)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lDUjW-0004GZ-7C
 for qemu-devel@nongnu.org; Sat, 20 Feb 2021 11:03:51 -0500
Received: by mail-pf1-x42f.google.com with SMTP id 201so767445pfw.5
 for <qemu-devel@nongnu.org>; Sat, 20 Feb 2021 08:03:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=49x56GGIdcxQ86P5vvffrgipXEOOm0tvwa51Jx+dMuE=;
 b=JJgOfinWAwvqJfiG2dGgHgSUGHtDcbpkjK3c9HhlQBzqsA2jek3nBq5WN1OSjXVKOp
 Y/jpzib1cXCRQNCfpmLj10BwvGyWkOwrpcZB5Oz6RyGe5r8/q2i3hIuwtKI3++VcvG00
 /jyOPixUIjO594Q3JDt623MdjFkjIMZMQ/m71HRhg/e2VU9c4PTBZe1fk49oLoUsVe0J
 NCT5lVOKUe2wpmAHXsSHMf+NDwP+qdk9Bo+v/Vt9b/Cf2yZd/cbA8KQchyZvbbbk1cjM
 Vn8/JLlx7j4D4YHRueBUZQ7KJqva+Yek6F3uwFD8Hll0g05Md1oUnwVtXgsNeH5Wr5gU
 EBEQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=49x56GGIdcxQ86P5vvffrgipXEOOm0tvwa51Jx+dMuE=;
 b=RPNx8XlHipNMgXciInNmeqjXDJwIVOwCRNTg+uTIT8lpSTvbASkrViuFg8D11vXFeV
 IXdrdJDMUo1cKo770p6dScowKfbqpl69ThuxRffiRsbaEDttYBrnxzcMlW364FPU5JVN
 XGgZBwYttX7ZXg9KNwv7NdI0EcGWmPC0b0l5BzU11+nrBN0vlIaWrXjTaVeRnRsXuTQM
 YYNqVNLZnpTq9UIyFpPJSVT3BEBs+HuEHjDAg+rEfgrfxSbnjAZ18LuksKbXgkkjIcRr
 G5LP3UIhbmeYIJxBeI/oDYCYv95qVXx7WsMKgI8HjV2IXaepSRJQGyXGiddj10fmeGM4
 PjPQ==
X-Gm-Message-State: AOAM531W5zpMrBK4t7SGFTCjIu0Kf0JQT9RIBhZg8xEqI2Gdbesg0N0Z
 CUMCM+ZvVwt8ScWyFOUGPrJWudLJzMjhiw==
X-Google-Smtp-Source: ABdhPJxwUzAAO629NIIfkPB/HzFe6azBbo3hQiGouqpwwYIoLO0mohrHiqcRXd+mDPLgO4fIQu7Rgg==
X-Received: by 2002:a65:4bc3:: with SMTP id p3mr12813944pgr.318.1613837028519; 
 Sat, 20 Feb 2021 08:03:48 -0800 (PST)
Received: from [192.168.7.36] (24-113-145-216.wavecable.com. [24.113.145.216])
 by smtp.gmail.com with ESMTPSA id
 e12sm12717540pjj.23.2021.02.20.08.03.47
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 20 Feb 2021 08:03:47 -0800 (PST)
Subject: Re: [PATCH v4] target/cris: Plug leakage of TCG temporaries
To: =?UTF-8?Q?Stefan_Sandstr=c3=b6m?= <stefans@axis.com>
References: <20210219124416.28178-1-stefans@axis.com>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <deaf8faa-9e84-71c4-ddac-914a198af21f@linaro.org>
Date: Sat, 20 Feb 2021 08:03:45 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20210219124416.28178-1-stefans@axis.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::42f;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x42f.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
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
Cc: "Edgar E . Iglesias" <edgar.iglesias@xilinx.com>,
 "Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
 "open list:All patches CC here" <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 2/19/21 4:44 AM, Stefan Sandström wrote:
> From: Stefan Sandstrom <stefans@axis.com>
> 
> Add and fix deallocation of temporary TCG registers in CRIS code
> generation.
> 
> Tested-by: Edgar E. Iglesias <edgar.iglesias@xilinx.com>
> Reviewed-by: Edgar E. Iglesias <edgar.iglesias@xilinx.com>
> Change-Id: I17fce5d95bdc4418337ba885d53ba97afb1bafcc
> Signed-off-by: Stefan Sandström <stefans@axis.com>
> ---
>  target/cris/translate.c         | 124 ++++++++++++++++++++++----------
>  target/cris/translate_v10.c.inc |  70 ++++++++++++------
>  2 files changed, 135 insertions(+), 59 deletions(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~

