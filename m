Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DDF7D6FF4E5
	for <lists+qemu-devel@lfdr.de>; Thu, 11 May 2023 16:45:19 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1px7X6-0003sE-5F; Thu, 11 May 2023 10:44:40 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1px7X4-0003rZ-6n
 for qemu-devel@nongnu.org; Thu, 11 May 2023 10:44:38 -0400
Received: from mail-wr1-x429.google.com ([2a00:1450:4864:20::429])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1px7X1-00035d-7q
 for qemu-devel@nongnu.org; Thu, 11 May 2023 10:44:37 -0400
Received: by mail-wr1-x429.google.com with SMTP id
 ffacd0b85a97d-2f27a9c7970so8315547f8f.2
 for <qemu-devel@nongnu.org>; Thu, 11 May 2023 07:44:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1683816273; x=1686408273;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=AnI0i88N6DmDgn8jNa6WKY185YzcmDrAz2V1oW+jpKE=;
 b=l1J4mZaz1y2N7D8LjeMnOdqsqmEyeJCBf14qPNQIWJ+IF+xcqG6Jq20Zp8hd85X8ux
 0mq5rQOqiCUMmA91m6WAsT0AHPCuFK4eul7SbTLKXu4iNVFtqdGiBMM0w1D2RlmNGf1Z
 Jy+EBWwuBfv/q3oERnHxfOCXLPPl1OHJ/FuEoZdNm0qbRiHlCQJ7OaNg8pp56s5ZiYYe
 NjvDhaTjoRwd52ufYiXOIRrR3RtgOvT+waiMJcO1FKfIFAlxUDE+Gu70Ff2MQdJVFciM
 4KF3f+tttCIvHX5zdD8qWNEM3X8uhVgvHBu1jBSbN7T5AxWu7tmgTmsN0M9JnZlUb+vt
 8B+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1683816273; x=1686408273;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=AnI0i88N6DmDgn8jNa6WKY185YzcmDrAz2V1oW+jpKE=;
 b=SOMe8k14cWKp0Vk/1XXpPmCyv08jROcyaRf55xsH8sjuN9JUensAA0r9H+ymH9WfpD
 fdd6uidAO1VT/lqMRmEVi4CpXCe72NBxKZgtL1ZP4s+vWcwmWx1mABIT05aIy7eUpfxt
 mexchi9kV6snu6cT3zsHjzLa3Q7j+150yOVXStULNKcEO994yIjoyTA8s2vVZosd9GrG
 cVh70JBiErVxNQupCtPIXJv2CmxxXW+H8B/KCbL+IUxiczvUTEBukvWE/HCP5vknZKnK
 E2d+5K5/llpmn2i6MnBsb4CeKZ2rO6J+bOLK4pchMS8T6gI8t69EEvJbMG1QJmj6i1Ck
 /Gzg==
X-Gm-Message-State: AC+VfDx2y/1Djj41a85RvdYbmSAWjApdQ1JPVngXGkDXT9r1VHTp8M0O
 kMK92aXMWeGpMcoxp+qs5I3l9A==
X-Google-Smtp-Source: ACHHUZ5rSNEyeE295U0nqaJfXFzv19A1XeYa4xRrKYXu0xLwWV6IFPRAYUqmlUzYFNvZT3IgjTU8ug==
X-Received: by 2002:a5d:51c3:0:b0:2f9:4fe9:74bb with SMTP id
 n3-20020a5d51c3000000b002f94fe974bbmr13540327wrv.40.1683816273359; 
 Thu, 11 May 2023 07:44:33 -0700 (PDT)
Received: from [192.168.110.227] ([85.9.250.243])
 by smtp.gmail.com with ESMTPSA id
 x14-20020adfec0e000000b002ca864b807csm20855718wrn.0.2023.05.11.07.44.32
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 11 May 2023 07:44:33 -0700 (PDT)
Message-ID: <d81e662c-5fc6-a5a5-5598-f8d902d84333@linaro.org>
Date: Thu, 11 May 2023 15:44:30 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.0
Subject: Re: [PATCH v2] s390x/tcg: Fix LDER instruction format
Content-Language: en-US
To: Ilya Leoshkevich <iii@linux.ibm.com>, David Hildenbrand
 <david@redhat.com>, Thomas Huth <thuth@redhat.com>
Cc: qemu-devel@nongnu.org, qemu-s390x@nongnu.org
References: <20230511134726.469651-1-iii@linux.ibm.com>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20230511134726.469651-1-iii@linux.ibm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2a00:1450:4864:20::429;
 envelope-from=richard.henderson@linaro.org; helo=mail-wr1-x429.google.com
X-Spam_score_int: -41
X-Spam_score: -4.2
X-Spam_bar: ----
X-Spam_report: (-4.2 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-2.124,
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

On 5/11/23 14:47, Ilya Leoshkevich wrote:
> It's RRE, not RXE.
> 
> Found by running valgrind's none/tests/s390x/bfp-2.
> 
> Fixes: 86b59624c4aa ("s390x/tcg: Implement LOAD LENGTHENED short HFP to long HFP")
> Reviewed-by: David Hildenbrand<david@redhat.com>
> Signed-off-by: Ilya Leoshkevich<iii@linux.ibm.com>
> ---
> 
> v1:https://lists.gnu.org/archive/html/qemu-devel/2022-11/msg00209.html
> v1 -> v2: Rebased.
> 
>   target/s390x/tcg/insn-data.h.inc | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>


r~

