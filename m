Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7045459EE6D
	for <lists+qemu-devel@lfdr.de>; Tue, 23 Aug 2022 23:50:05 +0200 (CEST)
Received: from localhost ([::1]:54796 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oQbme-00027i-Iw
	for lists+qemu-devel@lfdr.de; Tue, 23 Aug 2022 17:50:04 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47716)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1oQblJ-0000Ui-MJ
 for qemu-devel@nongnu.org; Tue, 23 Aug 2022 17:48:41 -0400
Received: from mail-pl1-x630.google.com ([2607:f8b0:4864:20::630]:38771)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1oQblI-0007ay-1l
 for qemu-devel@nongnu.org; Tue, 23 Aug 2022 17:48:41 -0400
Received: by mail-pl1-x630.google.com with SMTP id x19so13988101plc.5
 for <qemu-devel@nongnu.org>; Tue, 23 Aug 2022 14:48:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc; bh=QowsUwQ2vG7ITBKJSnwdTp6JGxr7tTOzmyihrwh3PGI=;
 b=RCOn0j7EdCfyn3kW4wMhp66VOF7GQrWu4rNXkrXnliguOvoxL2WKqER2Ab3llIIZxx
 dbxF2XBXans8dBAPIT2CGMau4ajdkZpbgza3WZ5N9Uks7Y+NqITCFRjgAf001ZEU7jhT
 KZbbJMJk7eVkboXkY0DbhJ/SZ5ZsT6ycvBksJEaWinfT9fchNW4hkqB7UN3nNmps8g0z
 vmeDErdg5TkCt2PqPGb3jMlYOnxRn1HqhmM6yA2abuVDWy8uXJqZrkOiaED7V7/o0OiO
 FjttkwupUKQjYGgCaLra9P4VNNBXrZYU8sHzCZb6ulA9Ivnz3MY1tfZ4nphSar2DxyPA
 v0hg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc;
 bh=QowsUwQ2vG7ITBKJSnwdTp6JGxr7tTOzmyihrwh3PGI=;
 b=bdtVuVX+mEw2uxDLBGpKMW/VBYKg22Hxr/EeliybvzW9m8+LKCjfnx6UNfdR6kmsrO
 khJGNEK/NiU6YIeIGOWu4jlQLxP4L45hYNc/SfvBRznK2IDjjT7yPDRjKWuTblgRxp+8
 jI5T35DMzRLvsNlQfGBVURaksSpfEAI+Z0E0n8vip/TrgEFYEhCqJbcxSVBOcg+WPXj+
 Ld/OUH6tF2t2GQQSlyR4GryxnPJFz5cNjO2yfY4aPGdx/dar9/G/Bk8T1h0owuR3Jr6U
 Lr2KifuVlea+j+m4ZlnDfKyJ3S0RZWNekutczTtaUzsYApBdvkE73wqymnVXhlokBHR1
 hu2g==
X-Gm-Message-State: ACgBeo3l1a3BFXQ1QKNohSnjRZyp2WeGilM2nt5QznyU5ki5lDE52lfg
 3aG/MXLHRA7oZ6Qu6r8zZ7mmJmksfRKmeg==
X-Google-Smtp-Source: AA6agR5F0QCyyGSNKFVAEvKJIqJkM0rZmY79SQG2oK+XQJAxFyBvydEtqz09PeVkY8DUEYSfx44bDw==
X-Received: by 2002:a17:90b:1c04:b0:1fb:6b2c:ca8f with SMTP id
 oc4-20020a17090b1c0400b001fb6b2cca8fmr3704881pjb.88.1661291314462; 
 Tue, 23 Aug 2022 14:48:34 -0700 (PDT)
Received: from ?IPV6:2602:47:d49d:ec01:46f9:77b4:ec0a:c2d9?
 ([2602:47:d49d:ec01:46f9:77b4:ec0a:c2d9])
 by smtp.gmail.com with ESMTPSA id
 d62-20020a623641000000b0052d2cd99490sm11276317pfa.5.2022.08.23.14.48.33
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 23 Aug 2022 14:48:33 -0700 (PDT)
Message-ID: <ebd1e692-7264-ca8f-3076-b945cd0c84b7@linaro.org>
Date: Tue, 23 Aug 2022 14:48:32 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PATCH 0/6] target/arm: Fix v8 AArch32 RAZ ID regs; implement
 FEAT_ETS
Content-Language: en-US
To: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org
References: <20220819110052.2942289-1-peter.maydell@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20220819110052.2942289-1-peter.maydell@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::630;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x630.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 8/19/22 04:00, Peter Maydell wrote:
> The main aim of this patchset is to implement FEAT_ETS.
> FEAT_ETS provides tighter guarantees on some memory orderings
> involving translation table walks that permit guest code to
> skip the context-synchronization event they would otherwise
> need to do after a TLB maintenance operation. QEMU already
> provides the tighter guarantees this feature requires, so
> all we need to do is advertise it in the ID registers...
> 
> ...except that it turns out that for AArch32 this is done
> in ID_MMFR5, which is a new-in-v8.6 register that we don't
> implement yet. So we need to provide it. And while I was
> doing that I noticed that we accidentally forgot to
> implement a big chunk of the "reserved for future ID
> registers, must RAZ" cp15 space for v8 AArch32. So the
> big bit of the patchset is sorting that out :-)

Thanks, queued to target-arm.next.


r~

