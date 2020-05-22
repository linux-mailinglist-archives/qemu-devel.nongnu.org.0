Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D2F671DDE8D
	for <lists+qemu-devel@lfdr.de>; Fri, 22 May 2020 06:11:59 +0200 (CEST)
Received: from localhost ([::1]:35250 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jbz2K-0000n3-MU
	for lists+qemu-devel@lfdr.de; Fri, 22 May 2020 00:11:56 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54978)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1jbz1Q-00087c-MR
 for qemu-devel@nongnu.org; Fri, 22 May 2020 00:11:01 -0400
Received: from mail-pg1-x544.google.com ([2607:f8b0:4864:20::544]:45453)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1jbz1N-0007A2-T2
 for qemu-devel@nongnu.org; Fri, 22 May 2020 00:10:59 -0400
Received: by mail-pg1-x544.google.com with SMTP id f21so1396272pgg.12
 for <qemu-devel@nongnu.org>; Thu, 21 May 2020 21:10:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:from:to:cc:references:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=3Iyz4uHT0LRZihDEEbnS062fz76simjmrMpHlqYbWxo=;
 b=IHW3fMPejb40KOwZQ7riLu9PSasW/Oo4YJUyrqv32XiEXwohsGTL8kt67HrnMGnW57
 xCNkfEU4vIbT9RTJaiScQLgiqsjHNxOR9ZOB80/G5EtD3f+lFALDTGTTiZCfoQyfgf8t
 /m0ADWrP9Ov3d4eDFfTZyIc9vYfq2fsMFNAH7MxQhK1ADLHT3KzeT7ged3IoVnP6tfDE
 ITBmFuGhltkz/5I3Fbt6XvMLoChppNykuypHpBRJrL6/j+roJg8Jywotj+lWiIGy0F1Q
 koi/7LdcsERCn/gpxvGrfDExthxWwqyJHHfqrThLQCJzoDdPCBY8sC7zMEhXv83bakPn
 dyXQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:from:to:cc:references:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=3Iyz4uHT0LRZihDEEbnS062fz76simjmrMpHlqYbWxo=;
 b=owFHS8TE8XsGcH4nIvqNCxEw/gtLcqUM+kIcVQ9T1mCTUdl903KQ/hk2m+I+0eGl83
 HZMS5pRtdM2HkmwLe03Cx9LgsBx7iG2dl+RR7gbsUfz9Xzk8RcheVAg+u2Zdv7kD3tio
 u9OBYtEAYl0gr+VgMdje2r3NkyuBaYdEYZdNhsfq2aftuU6gycEcfBlG/z0KUA/imfj+
 GgS/10cSyf/gYRiSyiffqIfzn973Pr5Q08Zoe7UjglPhvR8ceEc/+mVmWNVJS585J/QP
 Rhjq/2e7Amstk57X8sKyxtZ3n/9HA0X33i9H7AlCJzmoFZVY9Vafv8K6ceBMTqPzLB7+
 LlgQ==
X-Gm-Message-State: AOAM530S+GZFWzZrBwDv6TA5fWa5e01afs8dRJl7litr6IP4VYCdCrCR
 C3v1GA1SaAVIcy3xQYOJZN1mrQ==
X-Google-Smtp-Source: ABdhPJzH9j+1GyvRBvEc3pXgb0cZ0A+e3ANd5a9wTbFIrxcsDNUvlbecHdM06DQz4oequ+3RSv1Y1A==
X-Received: by 2002:a63:3483:: with SMTP id b125mr2682732pga.136.1590120655970; 
 Thu, 21 May 2020 21:10:55 -0700 (PDT)
Received: from [192.168.1.11] (174-21-143-238.tukw.qwest.net. [174.21.143.238])
 by smtp.gmail.com with ESMTPSA id o69sm79744pfd.213.2020.05.21.21.10.54
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 21 May 2020 21:10:55 -0700 (PDT)
Subject: Re: [PATCH v3 25/25] ppc64: Clean up reginfo handling
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
References: <20200522023440.26261-1-richard.henderson@linaro.org>
 <20200522023440.26261-26-richard.henderson@linaro.org>
Message-ID: <4abb151c-2a1b-f57f-0e5a-4d4723b4c943@linaro.org>
Date: Thu, 21 May 2020 21:10:53 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.7.0
MIME-Version: 1.0
In-Reply-To: <20200522023440.26261-26-richard.henderson@linaro.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::544;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x544.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_PASS=-0.001,
 URIBL_BLOCKED=0.001 autolearn=_AUTOLEARN
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
Cc: alex.bennee@linaro.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 5/21/20 7:34 PM, Richard Henderson wrote:
> +    return memcmp(m, a, sizeof(*m));

Ho hum.  memcmp(...) == 0.  Fixed locally.


r~

