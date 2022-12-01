Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1544D63F971
	for <lists+qemu-devel@lfdr.de>; Thu,  1 Dec 2022 21:53:34 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p0qXO-0003AO-Ka; Thu, 01 Dec 2022 15:52:06 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1p0qXJ-00039O-TP
 for qemu-devel@nongnu.org; Thu, 01 Dec 2022 15:52:03 -0500
Received: from mail-pg1-x52f.google.com ([2607:f8b0:4864:20::52f])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1p0qXI-000184-5j
 for qemu-devel@nongnu.org; Thu, 01 Dec 2022 15:52:01 -0500
Received: by mail-pg1-x52f.google.com with SMTP id v3so2685057pgh.4
 for <qemu-devel@nongnu.org>; Thu, 01 Dec 2022 12:51:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=1Zq2TcQl96kAMY51syzfzoGkaSEtPzKWt3CXboqFrwM=;
 b=BGkKj46bG2AyGiqwcVw5VzUDAv448tp5lYefOKl7SdurubpDREpFMLrZJrDNhYLLMM
 gw8aQ/3T5Ucf7KONP+4TU5jQfUyAC2fAoLovTBGXjtAIcuLo4wSAE2Sa04SZRxPC0UZ8
 p5QsmGVjLb5rZDPf0Ll6NeJKn8MQ8NlToY6ngVDnGdKooKoSdIN3JAwnkltMuZzwt2n8
 mxgNNmFXYMZxOSnqWt/aV7v4zJahbUlJ1w9OiseFFgShOqApmsxs4SeIJkMgeSSYeuIQ
 89etmGxZjKMiLdf/EMhacwR3yA9+lTwP5De1PxY+QSJhAE/JF7AmtsJKFTV/2OV4zyV0
 al7A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=1Zq2TcQl96kAMY51syzfzoGkaSEtPzKWt3CXboqFrwM=;
 b=iKE6zL2FqwufstGAEdccA5rZaK6YJ1vbr2SCHfs2jvRMWHsOSxt31M3R4PaChqRzvJ
 /rx6wxu6dIPS77iktvuOKTFchPXgnpx3JawB7C4boI7EayyBOke5gsLKiv8rONeVV7HI
 W1gf7Y0bzdnxfGm+daxQsxMo3x68zRFAbvgzVu0eVNehjNPgLkJeID8v4XGoQu/YxTNY
 4gYS2M6PrQINcqSO7kZIyAaA2BWQ6uM35kt2e9FO/Kpp2khqE/F5Cp4UcRVv4v0JcqKs
 i/tpjeCHNAEntAV6z234N06kAuFgsqx/TwErj1ukDyvHnQXFk+qANcM6p7VxkY+l0oVB
 iRrw==
X-Gm-Message-State: ANoB5pkonQW+CxHb0up+31nu1z9PFQGiY4OZua5HEYOEWwLnE866FQz5
 /yh3HKzn2Nec/a/xSXe4owIHWw==
X-Google-Smtp-Source: AA0mqf4yfVNUyVcmdrqdtw0GIUwZgoc0XubcnmUHfAtx4RBlkrT3V3Mqnj2jN9szw+cVKW/DOnIFiw==
X-Received: by 2002:a63:b513:0:b0:477:3052:248c with SMTP id
 y19-20020a63b513000000b004773052248cmr48140598pge.179.1669927917544; 
 Thu, 01 Dec 2022 12:51:57 -0800 (PST)
Received: from ?IPV6:2602:47:d48a:1201:e3cc:2e37:17d4:f1d5?
 ([2602:47:d48a:1201:e3cc:2e37:17d4:f1d5])
 by smtp.gmail.com with ESMTPSA id
 a15-20020aa78e8f000000b005743cdde1a7sm3636630pfr.82.2022.12.01.12.51.56
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 01 Dec 2022 12:51:56 -0800 (PST)
Message-ID: <2ab9d798-4feb-62d3-3713-aa12235a7034@linaro.org>
Date: Thu, 1 Dec 2022 12:51:55 -0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.2
Subject: Re: [PATCH v2 for-8.0] target/s390x/tcg: Fix and improve the SACF
 instruction
Content-Language: en-US
To: Thomas Huth <thuth@redhat.com>, qemu-devel@nongnu.org,
 David Hildenbrand <david@redhat.com>, Ilya Leoshkevich <iii@linux.ibm.com>
Cc: qemu-s390x@nongnu.org
References: <20221201184443.136355-1-thuth@redhat.com>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20221201184443.136355-1-thuth@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::52f;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x52f.google.com
X-Spam_score_int: -23
X-Spam_score: -2.4
X-Spam_bar: --
X-Spam_report: (-2.4 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.257,
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

On 12/1/22 10:44, Thomas Huth wrote:
> The SET ADDRESS SPACE CONTROL FAST instruction is not privileged, it can be
> used from problem space, too. Just the switching to the home address space
> is privileged and should still generate a privilege exception. This bug is
> e.g. causing programs like Java that use the "getcpu" vdso kernel function
> to crash (see https://bugs.debian.org/cgi-bin/bugreport.cgi?bug=990417#26 ).
> 
> While we're at it, also check if DAT is not enabled. In that case the
> instruction is supposed to generate a special operation exception.
> 
> Resolves: https://gitlab.com/qemu-project/qemu/-/issues/655
> Signed-off-by: Thomas Huth <thuth@redhat.com>
> ---

Looks ok, as far as it goes.  We appear to be missing the check for CR0_SECONDARY, which 
is unpredictable for SACF but mandatory for SAC.

I'll give you

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

for fixing the incorrect IF_PRIV check, which by itself should be enough to fix the Java 
issue.


r~

