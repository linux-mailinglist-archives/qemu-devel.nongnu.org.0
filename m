Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A826D68352F
	for <lists+qemu-devel@lfdr.de>; Tue, 31 Jan 2023 19:29:36 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pMvNR-0007h3-9F; Tue, 31 Jan 2023 13:29:06 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pMvNN-0007gT-VG
 for qemu-devel@nongnu.org; Tue, 31 Jan 2023 13:29:01 -0500
Received: from mail-pl1-x62a.google.com ([2607:f8b0:4864:20::62a])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pMvNL-0005iy-Rd
 for qemu-devel@nongnu.org; Tue, 31 Jan 2023 13:29:01 -0500
Received: by mail-pl1-x62a.google.com with SMTP id n13so475374plf.11
 for <qemu-devel@nongnu.org>; Tue, 31 Jan 2023 10:28:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=qcvfqzSNIoyUG9DiU0ob2J3U/+QMched3LDysaXh2Co=;
 b=ur3eTDMGyDKDaHx1uWh4x2WLFIs7idxk9m+HwyignwFcI1JbWPCU8TyiEr5Wo4Q8fX
 +3qgotn1H91VyfPGLqE+i+G7V5NKjOyecmknKD1WeZT4bDMVnL5SQ5u4B6HoXcov+klE
 OKjK8e1rpyAQoEc6i2R5gx+vn5tsdbdNx2nv2Y63Gn31lMX5EWaXBIau3McPeSGT6Wzu
 wpSpmH5DSpbLaj07gkXAFGXYgsGIIWJFwHqDxOKaxthtcpMO9boeofeU64ujmdaiPqgJ
 QOQAfyhDFYiwzE52i/HI/0IYfcx/pk1MjvyEngb6rt2Sx8o4y7SndW3Ym16zzh4k+6rM
 ScFQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=qcvfqzSNIoyUG9DiU0ob2J3U/+QMched3LDysaXh2Co=;
 b=5lDb6n+godrnqcHxdiBXcGHfFg+wi/rjwI/oio80cbMWlaAJ3BlHS1HoSnC5393crM
 8CLNYBARjKDx7jcKZ3ak+PtyebbcDamX39u5fcs9iep53D3aaO8VXleVIP93OHbeRJ22
 o5/G4SC6i/eiY5GmnNCb1T+LeqqUw5rqANZTAWLmUjpuwrVqiLIiB6hiYynEd+ez5iql
 dxYFkZ7kCmhguWYikvpqm9XoenMfLPvhwuiYahKwgjx9ImstRKDpX9NUM3JStdCsGINI
 IlrdfRWB2AOd31WvJ9SoHTsF1xAgsr/vF2493pQZt1vM+kCM1HE7iufMXsWcsVAS7UtY
 m+Tg==
X-Gm-Message-State: AO0yUKVDuHEoWkv5zcS19xAS5bo2A1fFJjucTaTLMR7FZl5gdPYjQr8i
 6upcwfsh7MKMKPbyfJdBIHQHPA==
X-Google-Smtp-Source: AK7set/4oxYiZnmRuheL6PJSpMZXyn5NBGgXloBVpgiN3wbzbWq2E0nX7K9W5WgmBK+5lJfw8iC4GA==
X-Received: by 2002:a17:902:f1cb:b0:194:46e0:1b61 with SMTP id
 e11-20020a170902f1cb00b0019446e01b61mr505170plc.63.1675189737887; 
 Tue, 31 Jan 2023 10:28:57 -0800 (PST)
Received: from [192.168.50.50] (rrcs-173-197-98-118.west.biz.rr.com.
 [173.197.98.118]) by smtp.gmail.com with ESMTPSA id
 bf6-20020a170902b90600b00176b84eb29asm10055788plb.301.2023.01.31.10.28.56
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 31 Jan 2023 10:28:57 -0800 (PST)
Message-ID: <8a1e26f1-a5f5-2c6a-f732-00f1d150bd55@linaro.org>
Date: Tue, 31 Jan 2023 08:28:53 -1000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.2
Subject: Re: [PATCH] tests/tcg/s390x: Use -nostdlib for softmmu tests
Content-Language: en-US
To: Ilya Leoshkevich <iii@linux.ibm.com>, David Hildenbrand <david@redhat.com>
Cc: Christian Borntraeger <borntraeger@linux.ibm.com>, qemu-s390x@nongnu.org, 
 qemu-devel@nongnu.org
References: <20230131182057.2261614-1-iii@linux.ibm.com>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20230131182057.2261614-1-iii@linux.ibm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::62a;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x62a.google.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.09,
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

On 1/31/23 08:20, Ilya Leoshkevich wrote:
> The code currently uses -nostartfiles, but this does not prevent
> linking with libc. On Fedora there is no cross-libc, so the linking
> step fails.
> 
> Fix by using the more comprehensive -nostdlib (that's also what
> probe_target_compiler() checks for as well).
> 
> Fixes: 503e549e441e ("tests/tcg/s390x: Test unaligned accesses to lowcore")
> Signed-off-by: Ilya Leoshkevich<iii@linux.ibm.com>
> ---
>   tests/tcg/s390x/Makefile.softmmu-target | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~

