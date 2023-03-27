Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DFB536CAA7E
	for <lists+qemu-devel@lfdr.de>; Mon, 27 Mar 2023 18:23:14 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pgpcD-00027u-BZ; Mon, 27 Mar 2023 12:22:37 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pgpc6-00026v-Ne
 for qemu-devel@nongnu.org; Mon, 27 Mar 2023 12:22:30 -0400
Received: from mail-pl1-x635.google.com ([2607:f8b0:4864:20::635])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pgpc4-0002Ta-5q
 for qemu-devel@nongnu.org; Mon, 27 Mar 2023 12:22:29 -0400
Received: by mail-pl1-x635.google.com with SMTP id kc4so8907536plb.10
 for <qemu-devel@nongnu.org>; Mon, 27 Mar 2023 09:22:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1679934142;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=QX1lzkdRlsqReyZXk2eij5YHgtB+eWFFC4ArPqzvOL8=;
 b=OAIkRj322ArOTNdOL9q67XTUKlofHv2ZhIX/zwxMRfCWTzQiwG/7npao88y7Mid+JV
 4+AUkru66YZ7mfIZIcZOi7dkXwwX/gCZq5FSK1E11xRacMrvgXwf1mIOR2C0bBmj4Aw9
 OiUg4W2Xzauy+zj34fEIu8WJFX1NJctXwgcS0f2ew563HUECJsA7hShz8dAYCtCk9SVp
 etzFfo4Slegam+S+4xk0pLKHMaICZ6poZpLaQ4qhS+pe/ET3Uzw9775f6c93au5l6RxV
 unlBcZoHHZnV/eK7KBVD2kK8XkpiQdxkbz1+giQRt3hqo4ewSIWqeDeOIM1WhkmZmjcX
 tdyA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1679934142;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=QX1lzkdRlsqReyZXk2eij5YHgtB+eWFFC4ArPqzvOL8=;
 b=v3fDCh1y/41igxIXaRWPYLmH7ae0mex8gXM/LfBc/57nejR1n0wrBYwwhM9IgCQoNT
 MMLu7S1TSPk9BQLQXhsixioVG3YOl3mYL32ZBaLnOy4DlGxrEl8bAg+hZ/F2XSzTarw9
 DNVguzzZfqmDTPeTcgbdr+ZrP3sC267YfvMNiGRxSwzzkkqQICD2/XLkCanyYi6PZBXe
 y6sa7H4b1zpevVWraeS/1TWMtiTp4ugWMND3rXp6ZFp9h3h/NqmeAyh+GX4pEH2toMfM
 DBfKs65GWBAzXmNJwLYbjjO5hoieFryftwuud8tCldvtYxvWeee7fHRjw6JnM6sbLfkU
 uJqg==
X-Gm-Message-State: AAQBX9fTDxMDY4gmwTXGkm1bfLXr+w1wIv4ZW1E3S5ls1XiRIwmr3T4A
 n5Tnpry+GDesmR/LVSJhUei83A==
X-Google-Smtp-Source: AKy350aUSQVYKdwy5/T5ti7OPTU/uYo+2yRWzy8upcTWTTw6h1HMhCNgfWP3WNWVSo8T/YgMDK3+9g==
X-Received: by 2002:a17:903:41cd:b0:1a1:b65a:2072 with SMTP id
 u13-20020a17090341cd00b001a1b65a2072mr16015529ple.59.1679934142027; 
 Mon, 27 Mar 2023 09:22:22 -0700 (PDT)
Received: from ?IPV6:2602:ae:1544:6601:6705:aa17:3641:e634?
 ([2602:ae:1544:6601:6705:aa17:3641:e634])
 by smtp.gmail.com with ESMTPSA id
 q18-20020a170902789200b00185402cfedesm19434867pll.246.2023.03.27.09.22.21
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 27 Mar 2023 09:22:21 -0700 (PDT)
Message-ID: <5cc3192b-d8f1-e6c7-e41b-fbe2e000844b@linaro.org>
Date: Mon, 27 Mar 2023 09:22:19 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Subject: Re: [PATCH v6 04/25] target/riscv: Remove mstatus_hs_{fs, vs} from
 tb_flags
Content-Language: en-US
To: liweiwei <liweiwei@iscas.ac.cn>, qemu-devel@nongnu.org
Cc: qemu-riscv@nongnu.org, alistair.francis@wdc.com, palmer@dabbelt.com,
 zhiwei_liu@linux.alibaba.com, fei2.wu@intel.com
References: <20230325105429.1142530-1-richard.henderson@linaro.org>
 <20230325105429.1142530-5-richard.henderson@linaro.org>
 <e6b11b5d-aee7-0aba-c836-dd5e6c713d6d@iscas.ac.cn>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <e6b11b5d-aee7-0aba-c836-dd5e6c713d6d@iscas.ac.cn>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::635;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x635.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

On 3/26/23 18:34, liweiwei wrote:
> We seems only need to know whether fs/vs is dirty,  so maybe we can just use a bool for 
> them to save more bits from TB_FLAGS.

No, we also need disabled.  That is checked in REQUIRE_FPU, require_rvv, etc.


r~

