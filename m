Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B8C856FBF48
	for <lists+qemu-devel@lfdr.de>; Tue,  9 May 2023 08:35:13 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pwGvf-0004Mz-9x; Tue, 09 May 2023 02:34:31 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pwGvT-0004JQ-Mv
 for qemu-devel@nongnu.org; Tue, 09 May 2023 02:34:21 -0400
Received: from mail-ej1-x636.google.com ([2a00:1450:4864:20::636])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pwGvP-00085g-VS
 for qemu-devel@nongnu.org; Tue, 09 May 2023 02:34:18 -0400
Received: by mail-ej1-x636.google.com with SMTP id
 a640c23a62f3a-965c3f9af2aso784603566b.0
 for <qemu-devel@nongnu.org>; Mon, 08 May 2023 23:34:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1683614053; x=1686206053;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=3Ne8FvHqg18bgK5N096fbtPcL3Bmqls3/SMzbTdBkg4=;
 b=X/iEcdQf3SKavvLINgYWn+N4wVnqTf/QZRiVVTfeyBU8SROmOg4ED29TCVmn4CVzIj
 G2vbuGnCg+WuqIRE8RdBFtEjoWQ1GvknabpJZKtXdXdy4Jn3+x1/mj1Mz3YfkVfKQIDa
 21d/O5Rswal5OdQAZICzUf+Hll9QyV2XL9Wo2lBA/rRSKCExcI1rE5m4gj56CJCG/9oL
 fNjLfEZOnrlM80SzXuweFItw0zeP+DTVCi9xRm4g4roEICIm2RYtoE/scWJ0X0yCycwv
 n37p0PN3VTPCQz6yGXLOY/HuQJ2fgkEhRMCDCdwvc46N0/oW+67VSvw1p7k/cRJr6kG7
 Z7vA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1683614053; x=1686206053;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=3Ne8FvHqg18bgK5N096fbtPcL3Bmqls3/SMzbTdBkg4=;
 b=fagSA8DV3silfq9eEjUL38TKM9Lx74erVnnvzTndx/GlB6W1R1F9H31Qwl/V8WfmSK
 x1EKD6NmSX3V4zJCqi/VL11MG/gnezfWk61HhsiE0Y635xqGm6XJMU/wAuZNKfx0Moak
 pJr9OprWHpDL+INjvZln/EkFEuT4fWa5uwrh5poLw9vQV56y8f/QI6AH4kT1glPGN2nu
 v8FPZBE65G5gH+tSKF5vuwxRCmPojPY7PubyC67PB6vAYG9NcrmwXXOnmsJf1gtfuiq+
 yS1Rr6YFALY3qQRzhI9xIwKJrHpfjns877v0UFgl/LsZu9xscpSrDxxFxGGYS8VZEhCP
 DrrA==
X-Gm-Message-State: AC+VfDwD+asdm0sHBJ6JbT7zW1FYc5sDGFCSC5/Tc6L9TJQvNIQ2Jn97
 xTj2WMbjJeszQDpH1q4J2Ygw+g==
X-Google-Smtp-Source: ACHHUZ7f5gvGqlUkBLAnkPH2Fo3PwEptZuYK2Hf9CNlHqFVv03pLmNUUP9rk0Qpl8xN3Ve0A8+f8Dg==
X-Received: by 2002:a17:907:6295:b0:94e:cbfb:5fab with SMTP id
 nd21-20020a170907629500b0094ecbfb5fabmr11205667ejc.75.1683614052785; 
 Mon, 08 May 2023 23:34:12 -0700 (PDT)
Received: from [192.168.110.227] ([91.223.100.36])
 by smtp.gmail.com with ESMTPSA id
 k14-20020a170906128e00b009660df2e6c6sm882614ejb.168.2023.05.08.23.34.10
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 08 May 2023 23:34:12 -0700 (PDT)
Message-ID: <8806b989-6142-d99f-e107-2533936222ea@linaro.org>
Date: Tue, 9 May 2023 07:34:06 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.0
Subject: Re: [PULL 00/13] Compression code patches
To: Juan Quintela <quintela@redhat.com>, qemu-devel@nongnu.org
Cc: Thomas Huth <thuth@redhat.com>, Peter Xu <peterx@redhat.com>,
 Leonardo Bras <leobras@redhat.com>, Laurent Vivier <lvivier@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>
References: <20230508185209.68604-1-quintela@redhat.com>
Content-Language: en-US
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20230508185209.68604-1-quintela@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2a00:1450:4864:20::636;
 envelope-from=richard.henderson@linaro.org; helo=mail-ej1-x636.google.com
X-Spam_score_int: -38
X-Spam_score: -3.9
X-Spam_bar: ---
X-Spam_report: (-3.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-1.802,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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

On 5/8/23 19:51, Juan Quintela wrote:
> The following changes since commit 792f77f376adef944f9a03e601f6ad90c2f891b2:
> 
>    Merge tag 'pull-loongarch-20230506' ofhttps://gitlab.com/gaosong/qemu  into staging (2023-05-06 08:11:52 +0100)
> 
> are available in the Git repository at:
> 
>    https://gitlab.com/juan.quintela/qemu.git  tags/compression-code-pull-request
> 
> for you to fetch changes up to c323518a7aab1c01740a468671b7f2b517d3bca6:
> 
>    migration: Initialize and cleanup decompression in migration.c (2023-05-08 15:25:27 +0200)
> 
> ----------------------------------------------------------------
> Migration PULL request (20230508 edition, take 2)
> 
> Hi
> 
> This is just the compression bits of the Migration PULL request for
> 20230428.  Only change is that we don't run the compression tests by
> default.
> 
> The problem already exist with compression code.  The test just show
> that it don't work.
> 
> - Add migration tests for (old) compress migration code (lukas)
> - Make compression code independent of ram.c (lukas)
> - Move compression code into ram-compress.c (lukas)
> 
> Please apply, Juan.

Applied, thanks.  Please update https://wiki.qemu.org/ChangeLog/8.1 as appropriate.


r~


