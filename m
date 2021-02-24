Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C072E32347B
	for <lists+qemu-devel@lfdr.de>; Wed, 24 Feb 2021 01:32:55 +0100 (CET)
Received: from localhost ([::1]:60296 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lEi6o-0005jv-PE
	for lists+qemu-devel@lfdr.de; Tue, 23 Feb 2021 19:32:54 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:36906)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lEi5I-0004aU-I0
 for qemu-devel@nongnu.org; Tue, 23 Feb 2021 19:31:22 -0500
Received: from mail-pg1-x52b.google.com ([2607:f8b0:4864:20::52b]:41395)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lEi5F-000455-4R
 for qemu-devel@nongnu.org; Tue, 23 Feb 2021 19:31:19 -0500
Received: by mail-pg1-x52b.google.com with SMTP id t11so287280pgu.8
 for <qemu-devel@nongnu.org>; Tue, 23 Feb 2021 16:31:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=e7ur4r/F4UC6pxcmPUe8rLeEdwOc9TbFAvtUqu1Clzs=;
 b=h8fXCrxj2RFDkj4EbCJHaifob32E2FM3U7XDV+9WP5duYMijZGJ63P7uok8a9sEE/H
 k1wDhhiAepJDPDXSWlz80aRUtRqwvO41e8CCCXxpnhAtjl+jwepggQVl8OaBPKrBni67
 I42EgfvauFdI61LlzcJkOPypbArjRl27swhxNXAn4UcvhPmBsaSoScGAONXhQma4941C
 6EGIzhKgK2Zqt/5q+aVrYKPW/xtZh2A27cnqXzrMpCoddFDM3P1VZfwJOIBD3V8XS0Qe
 0Gsj/q1hxBcxg4SJ19KCeUVUAlkJAj6gixOIw7oRI8bKjnPsZYJFZDDw9cHQd98kzMCx
 A/aQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=e7ur4r/F4UC6pxcmPUe8rLeEdwOc9TbFAvtUqu1Clzs=;
 b=XLr4+oxoet3aBmPZ6sqffmWI2JoIL764Ni3+eRbXNIfDjW0a0lcL2kbY4yoD/oP6gb
 OQHsoduZs8/XXiOesb5jBVlVrpeMvaWcZ4e8uIKZpkTaAEuX+WVoJFnIJZSwoVsSp0+K
 9xqKEO07M1kx3P/V2FZdvS3yoG7C5g7aQWmgrqUd6MQbv8xqjhv53fydMMc9T5xEdtpV
 r21m+llzmA2whCRJLGK4oWJt5ukROQZd8/3Y5AGlOU1Tcp3iaEF+tAJGgtXkVmUrG7sC
 Mb1BdO2MKoKVJY3VYUQ6eaBL4IH2P8sfe5ANAZpJmTyOLyjj/y8HiohEEqZxN2lVp150
 YTNA==
X-Gm-Message-State: AOAM533oWd3/tPC/Ltz77WMHtXsbF/qdwKKfwQhq/hAKpqogiCIbUtx9
 78Yz/oYVbWGjOuWLGMuLlf9vJg==
X-Google-Smtp-Source: ABdhPJw1hH04X6jqzGEgnVz1sKejMmMcQ0ipIyr1BfrO+zQl6WQxh3eIowPTsCnosZrjz6q6h3DuGQ==
X-Received: by 2002:a62:ed01:0:b029:1c8:c6c:16f0 with SMTP id
 u1-20020a62ed010000b02901c80c6c16f0mr4642645pfh.80.1614126675570; 
 Tue, 23 Feb 2021 16:31:15 -0800 (PST)
Received: from [192.168.1.11] (174-21-84-25.tukw.qwest.net. [174.21.84.25])
 by smtp.gmail.com with ESMTPSA id h5sm134895pgv.87.2021.02.23.16.31.14
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 23 Feb 2021 16:31:15 -0800 (PST)
Subject: Re: [PATCH v2 2/2] target/riscv: Call check_access() before
 tcg_temp_new()
To: Alex Richardson <Alexander.Richardson@cl.cam.ac.uk>
References: <20210222184940.43169-1-Alexander.Richardson@cl.cam.ac.uk>
 <20210222184940.43169-2-Alexander.Richardson@cl.cam.ac.uk>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <7725686f-fec7-5787-22e1-fe5be84c24a4@linaro.org>
Date: Tue, 23 Feb 2021 16:31:13 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20210222184940.43169-2-Alexander.Richardson@cl.cam.ac.uk>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::52b;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x52b.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: "open list:RISC-V TCG CPUs" <qemu-riscv@nongnu.org>,
 Sagar Karandikar <sagark@eecs.berkeley.edu>,
 Bastian Koppelmann <kbastian@mail.uni-paderborn.de>,
 "open list:All patches CC here" <qemu-devel@nongnu.org>,
 Alistair Francis <Alistair.Francis@wdc.com>,
 Palmer Dabbelt <palmer@dabbelt.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 2/22/21 10:49 AM, Alex Richardson wrote:
> ---
>  target/riscv/insn_trans/trans_rvh.c.inc | 16 ++++++++--------
>  1 file changed, 8 insertions(+), 8 deletions(-)

Any particular reason?

At first I thought this was a macro with a hidden return, but it isn't.  I
would understand a cleanup like

    if (check_access(ctx)) {
       TCGv t0 = tcg_temp_new();
       TCGv t1 = tcg_temp_new();
       ...

where we do not generate the rest of the code if we raised an exception.
Alternately, if the nesting seems ugly,

    if (!check_access(ctx)) {
        return true;
    }
    ...
    return true;


r~

