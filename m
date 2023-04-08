Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 73FF66DB7B8
	for <lists+qemu-devel@lfdr.de>; Sat,  8 Apr 2023 02:18:25 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pkwGT-0004oN-Jt; Fri, 07 Apr 2023 20:17:09 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pkwGR-0004oB-0e
 for qemu-devel@nongnu.org; Fri, 07 Apr 2023 20:17:07 -0400
Received: from mail-pj1-x102e.google.com ([2607:f8b0:4864:20::102e])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pkwGL-0006mx-Uz
 for qemu-devel@nongnu.org; Fri, 07 Apr 2023 20:17:06 -0400
Received: by mail-pj1-x102e.google.com with SMTP id
 j14-20020a17090a7e8e00b002448c0a8813so4594912pjl.0
 for <qemu-devel@nongnu.org>; Fri, 07 Apr 2023 17:17:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1680913019;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=W7cwNQrhKFMtaLgzbF1sx/y8o+P1z23KbhinULFm+gc=;
 b=em19M48QhkYSSHPVPnPx3CBQeDPaBNoUVnovdrq69dJTBmnna4fWnqm96S09zwVhj6
 SPIuz3TlxjPmkdMk6KyWGgjZYfvivLawGALDYsN6SXT+hGkBjGsV2p0ahSO1uVcq5MNv
 GSg2HF5VY5ma8dHV5LwAEDH/dDprkrTD5VUko9hGQIfj8jzz7wt4DqwuCUw0F162cDZy
 JtFmJ2einuPBhc/NgQPWQHgBo2VWek6bMFNIAaacQ6p7NOZdYcYikpcVWZwKUdXm0G3R
 Ayy2D336Uu8kZmd03N3WkOqyoy76vmmcolin7aUrfmbUm/WOhHjbbNEoBz1INDCiCUiA
 PNXw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1680913019;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=W7cwNQrhKFMtaLgzbF1sx/y8o+P1z23KbhinULFm+gc=;
 b=Ba82ye+net12shnNgjfpWuedSEuwKWbD64+7usHO7oqHgS9D5ilVnpb+Glp/MGIcc8
 VWnv/rqFVCZC+C95VTGBWsanBdpBW+8EsTtP4K5XP6YqhtiUBAKqRRGjpvNi5gYpzMbi
 RVsC9188PUXAQqHdC/bXRk9LcF+cG/xlaeOrbJpqR0WafVgzsaKddjtq95pootwUHEgP
 QUFlYhusQNIgmZTLuSqY2yxcBYsuFMEcPqZa4SoBN8MhCvL7nMe7zKi/S+ZK4tGo5mdd
 Y1BFpLWDF2+CX+EWWhmjmjusqzjzpQBnLY/UKpaD6maIJOjrYTJVI19as9bZ5RHRNtjB
 xZWg==
X-Gm-Message-State: AAQBX9e0V2ENK6iSuWgh8UjuOrlVCt3v0ozAi3pgRASy15+zQHEH5MRC
 3ntjFKbuEoRUQ15Z/Yxlb4nS/w==
X-Google-Smtp-Source: AKy350Z6S/V6iPcFxAsexzytePwFO9OrjXUaunvxoRyTjJA47ucqwC2NcJ6HQ7t06511pumZwpjjCw==
X-Received: by 2002:a05:6a20:2a0a:b0:de:9f78:f677 with SMTP id
 e10-20020a056a202a0a00b000de9f78f677mr4233959pzh.23.1680913019625; 
 Fri, 07 Apr 2023 17:16:59 -0700 (PDT)
Received: from ?IPV6:2602:ae:1541:f901:8bb4:5a9d:7ab7:b4b8?
 ([2602:ae:1541:f901:8bb4:5a9d:7ab7:b4b8])
 by smtp.gmail.com with ESMTPSA id
 z14-20020aa785ce000000b0062dd1c55346sm3596844pfn.67.2023.04.07.17.16.58
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 07 Apr 2023 17:16:59 -0700 (PDT)
Message-ID: <4cd70b77-807a-07be-c82d-d62eaf3b19ee@linaro.org>
Date: Fri, 7 Apr 2023 17:16:57 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.0
Subject: Re: [PATCH 1/2] accel/stubs: Remove kvm_flush_coalesced_mmio_buffer()
 stub
Content-Language: en-US
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>,
 Thomas Huth <thuth@redhat.com>, qemu-devel@nongnu.org
Cc: Paolo Bonzini <pbonzini@redhat.com>, =?UTF-8?Q?Alex_Benn=c3=a9e?=
 <alex.bennee@linaro.org>, kvm@vger.kernel.org
References: <20230405161356.98004-1-philmd@linaro.org>
 <20230405161356.98004-2-philmd@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20230405161356.98004-2-philmd@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::102e;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x102e.google.com
X-Spam_score_int: -40
X-Spam_score: -4.1
X-Spam_bar: ----
X-Spam_report: (-4.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-2.03,
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

On 4/5/23 09:13, Philippe Mathieu-Daudé wrote:
> kvm_flush_coalesced_mmio_buffer() is only called from
> qemu_flush_coalesced_mmio_buffer() where it is protected
> by a kvm_enabled() check. When KVM is not available, the
> call is elided, there is no need for a stub definition.

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>


r~

