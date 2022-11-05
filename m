Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E507261A64D
	for <lists+qemu-devel@lfdr.de>; Sat,  5 Nov 2022 01:11:38 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1or6ly-000655-Qx; Fri, 04 Nov 2022 20:10:54 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1or6lx-00064v-BF
 for qemu-devel@nongnu.org; Fri, 04 Nov 2022 20:10:53 -0400
Received: from mail-ot1-x336.google.com ([2607:f8b0:4864:20::336])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1or6lv-0005pa-S7
 for qemu-devel@nongnu.org; Fri, 04 Nov 2022 20:10:53 -0400
Received: by mail-ot1-x336.google.com with SMTP id
 cn2-20020a056830658200b0066c74617e3dso3556604otb.2
 for <qemu-devel@nongnu.org>; Fri, 04 Nov 2022 17:10:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=OwGIKHLN3SVvwxmuFe+uJIR78ji8kbqtZ5Y4K1Hr3d8=;
 b=k71fk8/gIxi6KBx3YL6gzs7XqPYdgh1sqoO40nkhHB8loGEAFBeTSFueCKF7IkRkOm
 fmQkvpIeyC5j2SHEZB3cBhbaaOMkYFqrx+YOM4Xdd6NY+UCM02qiFpHgG8cT7ESAq7II
 2OAXDv9tX+1EhnOpBVbKzqIDAFyz1y2E0OwcJOO9OzLdFErluZ8O4ciDfoASZr0VmkZd
 4kqnzf4x/l7H9Q5cPImvMXZXULQcqcdo25clR48RxKGOIfG2lrvXpzhplSSFmGdSXOsS
 onIK/6VUC/l9OHhkNStb16GD6MgRE1LYfJ33uNv42DoCqQtU/zm+11v8rpIdcTZSAK4H
 7cqw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=OwGIKHLN3SVvwxmuFe+uJIR78ji8kbqtZ5Y4K1Hr3d8=;
 b=DSTyyod2vxQZnH15eB3bT2Fv1es16128arEPz7vAa/c4CGBTbnnXDxVo4oJ9rUKtWm
 a+TDOJWh1iNRg5j/dVP542dhJX2OP8oRnTJ1h4g6uQqoEpkoiiSBHsk586bG73TbPvBB
 C7LlWtEPxjWUyG4F4sPWT8/UYpUeTLZ7/PAhTTViQkXBFKy60F5Fb6hq+blMUdz/IWrT
 uHMMqJATi9LcoUk/4PkVZmt0SbiCbLC9vsrGDA72jCpdasLH8CVqgWiF5RPwvxvTKw9d
 44FUT6fjDluC58DSy7PTS5uyoLqmv9LezoZIoIuP/0ot3hd4tVk+VZkujC7UQfUHHRYE
 DlSg==
X-Gm-Message-State: ACrzQf11gwcNZ3i5kM7LQVmX+YrnNuYML3fBE/OOhH75goQUEGHubrKD
 O1h2apr+GD2qPIivmxUfaHwRrA==
X-Google-Smtp-Source: AMsMyM5ClmMyIPPnZFjuYe3Pg/yn+amP+wgQ6U+0px+4EoH9ORjLI7trqy29SUiJVsKVoMFlUQZrvw==
X-Received: by 2002:a05:6830:648c:b0:66c:6a63:dd99 with SMTP id
 ck12-20020a056830648c00b0066c6a63dd99mr11262240otb.368.1667607050549; 
 Fri, 04 Nov 2022 17:10:50 -0700 (PDT)
Received: from [192.168.229.227] ([172.58.176.28])
 by smtp.gmail.com with ESMTPSA id
 5-20020a9d0685000000b0066c47384ffesm285509otx.74.2022.11.04.17.10.44
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 04 Nov 2022 17:10:49 -0700 (PDT)
Message-ID: <505a3236-ea15-9a06-8fa5-5ba1bc2f2b97@linaro.org>
Date: Sat, 5 Nov 2022 11:10:37 +1100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.2.2
Subject: Re: [PATCH v3 06/11] Hexagon (target/hexagon) Remove next_PC from
 runtime state
Content-Language: en-US
To: Taylor Simpson <tsimpson@quicinc.com>, qemu-devel@nongnu.org
Cc: philmd@linaro.org, ale@rev.ng, anjo@rev.ng, bcain@quicinc.com,
 quic_mathbern@quicinc.com
References: <20221104192631.29434-1-tsimpson@quicinc.com>
 <20221104192631.29434-7-tsimpson@quicinc.com>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20221104192631.29434-7-tsimpson@quicinc.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::336;
 envelope-from=richard.henderson@linaro.org; helo=mail-ot1-x336.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
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
Sender: "Qemu-devel" <qemu-devel-bounces@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

On 11/5/22 06:26, Taylor Simpson wrote:
> The imported files don't properly mark all CONDEXEC instructions, so
> we add some logic to hex_common.py to add the attribute.
> 
> Signed-off-by: Taylor Simpson<tsimpson@quicinc.com>
> ---
>   target/hexagon/cpu.h                |  1 -
>   target/hexagon/gen_tcg.h            |  6 ++++++
>   target/hexagon/macros.h             |  2 +-
>   target/hexagon/translate.h          |  2 +-
>   target/hexagon/op_helper.c          |  6 +++---
>   target/hexagon/translate.c          | 29 +++++++++++++++++++++++------
>   target/hexagon/gen_helper_funcs.py  |  4 ++++
>   target/hexagon/gen_helper_protos.py |  3 +++
>   target/hexagon/gen_tcg_funcs.py     |  3 +++
>   target/hexagon/hex_common.py        | 20 ++++++++++++++++++++
>   10 files changed, 64 insertions(+), 12 deletions(-)

Acked-by: Richard Henderson <richard.henderson@linaro.org>

r~

