Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3162E700CAA
	for <lists+qemu-devel@lfdr.de>; Fri, 12 May 2023 18:13:12 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pxVN5-0004Sz-EM; Fri, 12 May 2023 12:11:55 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <marcin.juszkiewicz@linaro.org>)
 id 1pxVN3-0004Sa-KJ
 for qemu-devel@nongnu.org; Fri, 12 May 2023 12:11:53 -0400
Received: from mail-lj1-x22f.google.com ([2a00:1450:4864:20::22f])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <marcin.juszkiewicz@linaro.org>)
 id 1pxVN1-0004HP-PS
 for qemu-devel@nongnu.org; Fri, 12 May 2023 12:11:53 -0400
Received: by mail-lj1-x22f.google.com with SMTP id
 38308e7fff4ca-2ac82c08542so103453181fa.2
 for <qemu-devel@nongnu.org>; Fri, 12 May 2023 09:11:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1683907909; x=1686499909;
 h=content-transfer-encoding:in-reply-to:organization:from:references
 :cc:to:content-language:subject:user-agent:mime-version:date
 :message-id:from:to:cc:subject:date:message-id:reply-to;
 bh=LmMqtvpuVvsWNXvq79fqeCWxYOr+Z5E/6xkLNQol2P8=;
 b=gbXNPyOez+mFTXdml0PY5UHLzaqNPOC4xiwuN9w3yGprfBsIVmUwVNFuegHnTLwRs8
 rfxtrmR2VAi+sMO6vVlh5OPTs4TSD1Z4tw2SuH5UoMB/v3rgFFPQYSsNx8BVS71+bRzQ
 640OcuYqzQzL8lq7PzJWqoDYs6H9eIPB39bAOPoay6W0blupmNiJPrweYVgYfLzXTAZI
 mJcAcP/0/JRaGeEPQxFxa/MBNStVVQHVdRtlgoSZFPh8+QJpWlyCoFIGmdnUIckK83ub
 ANnqvEkAKIlIYN0opcMWE2ozvMt0S5HVol8+VSUrAjioDphN88qzO7BKWXRJ1CuBjqnU
 5wPQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1683907909; x=1686499909;
 h=content-transfer-encoding:in-reply-to:organization:from:references
 :cc:to:content-language:subject:user-agent:mime-version:date
 :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=LmMqtvpuVvsWNXvq79fqeCWxYOr+Z5E/6xkLNQol2P8=;
 b=MTaijQFojQVzSIFxxBlpnnuqGD+78f/wQCuLHzisCFdMwdPqNlLPBhi16tdhKBg04n
 o62U4lp+v5oBcdZoY8Raxn5uzz/UXD5brBv2TG3B4OlLcWdxJldrItCnd5hhoANJhmSD
 jjbqWGQ92W47mI/VEMAnUfF/clVz/ZC+8KfHGE4gIlb4FnrbFOmZ8JL+lr6Gy7/4nbqR
 B3bO38TKLuqgLqcrsvMmQBbMTZzBQXVshtHhCV4T5/BjrPx9o+uN94s4fRD2yTbV4tAq
 AL23Yjf7OJ/rP/0EJ5wjUbdFxYzFWwzzhvQLlT1wAi9bP/kt+gstQDIPbqQPX5g27C4j
 jo1Q==
X-Gm-Message-State: AC+VfDzntBMrRCnEyw+ruK3Rl66aREnDAhZHnwxZ8tcnYfMFeHREjavS
 AioTzCegdzoRIhjgTdmz/thKlw==
X-Google-Smtp-Source: ACHHUZ451WNmM/ZPLVMjoqGd/Ngf6iuC/3Ln/P+tzLq/lk1caAUcX5KV+wGeIRxXjEj03DCaCFN1wA==
X-Received: by 2002:a2e:9bd7:0:b0:2a8:ea1e:bde9 with SMTP id
 w23-20020a2e9bd7000000b002a8ea1ebde9mr4819461ljj.45.1683907909725; 
 Fri, 12 May 2023 09:11:49 -0700 (PDT)
Received: from [192.168.200.206] (83.11.34.59.ipv4.supernova.orange.pl.
 [83.11.34.59]) by smtp.gmail.com with ESMTPSA id
 i1-20020a056512006100b004f148aa91f9sm1526337lfo.286.2023.05.12.09.11.48
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 12 May 2023 09:11:49 -0700 (PDT)
Message-ID: <b85b70da-f5d6-c067-cb26-3af7d1ac1862@linaro.org>
Date: Fri, 12 May 2023 18:11:48 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.0
Subject: Re: [PATCH] sbsa-ref: switch default cpu core to Neoverse-N1
Content-Language: pl-PL, en-GB, en-HK
To: Leif Lindholm <quic_llindhol@quicinc.com>,
 Peter Maydell <peter.maydell@linaro.org>
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org
References: <20230506183417.1360427-1-marcin.juszkiewicz@linaro.org>
 <CAFEAcA-d2_3xXMNwMG+-WOw=y=zandSM24-GfcJ8s=3etqACcQ@mail.gmail.com>
 <88e30a90-71c3-0ded-8412-0f3af6ec3b37@quicinc.com>
From: Marcin Juszkiewicz <marcin.juszkiewicz@linaro.org>
Organization: Linaro
In-Reply-To: <88e30a90-71c3-0ded-8412-0f3af6ec3b37@quicinc.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::22f;
 envelope-from=marcin.juszkiewicz@linaro.org; helo=mail-lj1-x22f.google.com
X-Spam_score_int: -39
X-Spam_score: -4.0
X-Spam_bar: ----
X-Spam_report: (-4.0 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-1.845,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
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

W dniu 12.05.2023 o 18:02, Leif Lindholm pisze:
> Longer-term, I still want to move to "max" as the default, but that is 
> likely to require some invasive changes to TF-A, and this is already a 
> huge improvement.

Firmware was main reason why I not moved to "max". It is easier to keep 
system running when it models already existing core.

For me "max" stopped booting when FEAT_FGT landed in QEMU. Took over 3 
months to enable it in TF-A.

