Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4E2156B1599
	for <lists+qemu-devel@lfdr.de>; Wed,  8 Mar 2023 23:50:09 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pa2bA-0000dd-SI; Wed, 08 Mar 2023 17:49:28 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pa2b8-0000cJ-Ry
 for qemu-devel@nongnu.org; Wed, 08 Mar 2023 17:49:26 -0500
Received: from mail-pf1-x42d.google.com ([2607:f8b0:4864:20::42d])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pa2b7-0007hp-Dp
 for qemu-devel@nongnu.org; Wed, 08 Mar 2023 17:49:26 -0500
Received: by mail-pf1-x42d.google.com with SMTP id n5so255727pfv.11
 for <qemu-devel@nongnu.org>; Wed, 08 Mar 2023 14:49:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1678315764;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=mjlHO+S5KN1MFThZdWLZLNhQbnD8AoC7IDaoSSkKUQU=;
 b=FqfRFwwtfi1TMF4W6CUWOCJQNEGeGPo3EBzR/IDn8Iz9mY9e5+s2XZE7+ZcEbot+RW
 Z6LETc5ZHiuxP4Y2nHxfIV61VQVaGTBEOPlfEDVV6XK7BOeJmK36vPFl0eDyuKIRdkiN
 hVv0MFxBB19C8xA0weYabdHXPq3xh0d+x2Sl5JM8poAuOuj8LzZV5sIr5l2CsuDJZjfw
 UtkKvYXp9SKek1x4dqBUXPFiS9NpPblq8yDerRFrZj+29UsDVvXiscFcQSAyCKTmK/qG
 b6j7NET2fnNemnyH6rBPEUTQj94mOyCnTccWfZBb9QJ7gsetuDbCXwJLaa2lpTm++M+K
 AVoA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1678315764;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=mjlHO+S5KN1MFThZdWLZLNhQbnD8AoC7IDaoSSkKUQU=;
 b=DuV0kDrkp/bo9TagKjxRVla5+FZwgOAjLe2jl7w2HtHef8yZJ0lojDahauZDy91IAA
 VvwOXpyHFS2H/SRy8JjoGKWUh0zW92TLeSpHPpk3SiuJPGIOmercA77Sy90Oh94LCLpO
 eQMAkth7i+SKLc5NgofNMnq5l4Lt/bupj3HQDwNujCDlpeooK/epjINmoC0kQLWFR9m0
 zR5J+zpb3xRg12plTlgwoeYVfrp6PmxEKPZ5+brp/aq8ATit7HCvcEoZu46qiTMf5A4A
 fJt/oWT5B7fRPYJV+aqb5kzmEy4Bp/kEWSzGVQ3abjDfINyoSGSMBRXjfq9mvrGgcLAm
 nzoA==
X-Gm-Message-State: AO0yUKVAYNKediJi8lC7buH/ywkmsZsNnXtULBdVQrnUUMWwAZooDTRd
 VTBDTi2mecC5Ok7nBicmVYoIXA==
X-Google-Smtp-Source: AK7set+d3wO55wPcD/mf36Il99DlX/ITaEksHR5RUWU0qcyLnP3O4B3lKk34tyj5+LDQodfSbKCHiw==
X-Received: by 2002:aa7:980c:0:b0:5dc:2064:f7c4 with SMTP id
 e12-20020aa7980c000000b005dc2064f7c4mr19102278pfl.10.1678315763875; 
 Wed, 08 Mar 2023 14:49:23 -0800 (PST)
Received: from ?IPV6:2602:ae:154a:9f01:acd:bde4:fbf6:cc41?
 ([2602:ae:154a:9f01:acd:bde4:fbf6:cc41])
 by smtp.gmail.com with ESMTPSA id
 b9-20020aa78109000000b005d72e54a7e1sm9823497pfi.215.2023.03.08.14.49.23
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 08 Mar 2023 14:49:23 -0800 (PST)
Message-ID: <af2fbbc8-35b4-3d7e-7604-ac2c8e50ff00@linaro.org>
Date: Wed, 8 Mar 2023 14:49:21 -0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.1
Subject: Re: [PATCH v2 2/2] tests/tcg/s390x: Add C(G)HRL test
Content-Language: en-US
To: Nina Schoetterl-Glausch <nsg@linux.ibm.com>, qemu-devel@nongnu.org
Cc: David Hildenbrand <david@redhat.com>, Ilya Leoshkevich
 <iii@linux.ibm.com>, Thomas Huth <thuth@redhat.com>, qemu-s390x@nongnu.org
References: <20230308210226.2847503-1-nsg@linux.ibm.com>
 <20230308210226.2847503-3-nsg@linux.ibm.com>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20230308210226.2847503-3-nsg@linux.ibm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::42d;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x42d.google.com
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

On 3/8/23 13:02, Nina Schoetterl-Glausch wrote:
> Test COMPARE HALFWORD RELATIVE LONG instructions.
> Test that the bytes following the second operand do not affect the
> instruction.
> Test the sign extension performed on the second operand.
> 
> Signed-off-by: Nina Schoetterl-Glausch<nsg@linux.ibm.com>
> ---

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~

