Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8926B6667CE
	for <lists+qemu-devel@lfdr.de>; Thu, 12 Jan 2023 01:37:11 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pFla4-0007PS-7v; Wed, 11 Jan 2023 19:36:32 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pFla2-0007PJ-7A
 for qemu-devel@nongnu.org; Wed, 11 Jan 2023 19:36:30 -0500
Received: from mail-pl1-x630.google.com ([2607:f8b0:4864:20::630])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pFla0-0001eC-Ij
 for qemu-devel@nongnu.org; Wed, 11 Jan 2023 19:36:29 -0500
Received: by mail-pl1-x630.google.com with SMTP id p24so18545398plw.11
 for <qemu-devel@nongnu.org>; Wed, 11 Jan 2023 16:36:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=0UYHDDae1iv/G5gKuoIFtCIUfU69f+LvCONAgmbNqUM=;
 b=ctxuXbzWEi7mk/iAp54vHW3MbCrLZLJgFn9emQUpJ9g64wgJpvlirzysz5RDgR7knF
 kE+b5Dg9pFupbVPoNMyrHy/qoChqiR3/42j8abef1Qudbro13UsNL6xrIInVMqtzwxVx
 QS2VNBD3JGVuwT57YR3jdD0SbN/MUY4EEJXXZTu31WhllMvUR5822tIEiXKBFhhq+hnh
 Ai6y9IONw2ixjuwUcV6z9ZQlttYyb68P5FKZv+YFseD0EBhK/bzNl/29aH0kTcT/dYIS
 Bn6vFJk0tfG3ReQPTqsUgnZ1mCYAWfN5Ob+FqrUXu3e96kTxSsUDNMbqS7zPZ9vGoq91
 rn8g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=0UYHDDae1iv/G5gKuoIFtCIUfU69f+LvCONAgmbNqUM=;
 b=xxdMe1P6r9bbDALFmjjbh6jYpSkxgNdniru6gDjocJBlgNLj3fHqgLVCork9Shi9n8
 qv7UswyORweXgOcomm6W0wbhErXcA1agj85XXF3i8Donkw3wcVj0s88/J006YsGp9tp9
 5ynogJTlyvV77Uezr4zPuaxuFRtCyzUlKb0VU/yUkGJX77LTQqh+JTbv3z+lc2G4JaGg
 lOqXuDxdjL5GbFAn/feb9JBDVHIu4AXf+ZoaXysiNicWOaLIZO+LN+WHpelT6xaF+ofE
 LrgEDHBpiGlZpjLxdW2te6oNLDQjuUooRIcPTFmvTOx+4sdnpiMGN0zQ6NNQveel6+/J
 LR5g==
X-Gm-Message-State: AFqh2kqF4GAMacfdOApRQjLLLS1PzkWdKp4Zv97N3zHhJ+wV5afzQKbK
 jvn6gWv/YyvG0A2Idy5ogk4RBltXt/9HWPJu
X-Google-Smtp-Source: AMrXdXsX5DApCAtEc3UbTopZPxJ5GrkzOwGw7yUGq92f0bzMJSe/dlJ2qN+v42uRjPqkfqBBbzWPmQ==
X-Received: by 2002:a17:902:6f17:b0:193:1c62:29c8 with SMTP id
 w23-20020a1709026f1700b001931c6229c8mr13444078plk.51.1673483787170; 
 Wed, 11 Jan 2023 16:36:27 -0800 (PST)
Received: from [192.168.5.146] (rrcs-173-198-77-218.west.biz.rr.com.
 [173.198.77.218]) by smtp.gmail.com with ESMTPSA id
 k16-20020a170902c41000b00178b77b7e71sm4013851plk.188.2023.01.11.16.36.25
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 11 Jan 2023 16:36:26 -0800 (PST)
Message-ID: <6ff6b453-b97e-70f9-6a86-3b65a01887f1@linaro.org>
Date: Wed, 11 Jan 2023 08:54:11 -1000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.2
Subject: Re: [PATCH 17/26] tests/tcg: add memory-sve test for aarch64
Content-Language: en-US
To: =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 qemu-devel@nongnu.org
References: <20230110173922.265055-1-alex.bennee@linaro.org>
 <20230110173922.265055-18-alex.bennee@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20230110173922.265055-18-alex.bennee@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::630;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x630.google.com
X-Spam_score_int: -4
X-Spam_score: -0.5
X-Spam_bar: /
X-Spam_report: (-0.5 / 5.0 requ) BAYES_00=-1.9, DATE_IN_PAST_03_06=1.592,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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

On 1/10/23 09:39, Alex Bennée wrote:
> This will be helpful in debugging problems with tracking SVE memory
> accesses via the TCG plugins system.
> 
> Signed-off-by: Alex Bennée<alex.bennee@linaro.org>
> Cc: Robert Henry<robhenry@microsoft.com>
> Cc: Aaron Lindsay<aaron@os.amperecomputing.com>
> ---
>   tests/tcg/aarch64/Makefile.softmmu-target | 7 +++++++
>   tests/tcg/aarch64/system/boot.S           | 3 ++-
>   2 files changed, 9 insertions(+), 1 deletion(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~

