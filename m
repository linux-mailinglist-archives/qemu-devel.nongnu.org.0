Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D81CC3B8345
	for <lists+qemu-devel@lfdr.de>; Wed, 30 Jun 2021 15:36:51 +0200 (CEST)
Received: from localhost ([::1]:36786 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lyaOY-0006Ak-B2
	for lists+qemu-devel@lfdr.de; Wed, 30 Jun 2021 09:36:50 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35008)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lyaKh-0001bM-K5
 for qemu-devel@nongnu.org; Wed, 30 Jun 2021 09:32:51 -0400
Received: from mail-pg1-x534.google.com ([2607:f8b0:4864:20::534]:44800)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lyaKc-0002vo-62
 for qemu-devel@nongnu.org; Wed, 30 Jun 2021 09:32:51 -0400
Received: by mail-pg1-x534.google.com with SMTP id u14so2250227pga.11
 for <qemu-devel@nongnu.org>; Wed, 30 Jun 2021 06:32:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=xJPDnNkR3y8P6sW0pj2XcjIP5SAYeQaHSbm9CTjvjvs=;
 b=wZ//6X/a+9fNVj+SaO3yvSRYVF4PxZBTlUe/kP/+GDLYoccDUCOF7kYiYYvoEgLtut
 GZnmSsf3iwX4w6GXc0821ttQiyPRU9Pr+rkf5CvQZr+YcxptoWedFWGRaUkPXh9sz0Pn
 sdrddJoHvtUqlRjyCej/H0sZMeDg1XK+mA12Idi2/PU51aA2r69UiRlMkvADscswoMDD
 nOAP1gP/DeOD4gvEelieTr+d5hyaQ3/Hliu2QZpcPpSO/M+IR/Ov71G7BhdnB2FPyTB1
 IMlbv6vX2JFgDUxbvtiUYiXsbKPc+9FtHIwVW/k/VkO6boH2WFM02+AelLvrE0PZ5Qbl
 CM1Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=xJPDnNkR3y8P6sW0pj2XcjIP5SAYeQaHSbm9CTjvjvs=;
 b=gFWl0MLJjIdkoYt85AfxoLB33XqcBOtp4ZqJdtbWvueNLpePmH7QapGxisuZ15KFE/
 PxDIlHrSPe621+YXK8rIyte4GyUO2m23XcAOAfJ0RwxtpxBRcMKv2q0SSp/LUqYtO6nx
 kZ9GXWNPdPLLJ+3p8tlwkTekKGzOTJf5iW5KKZcRusbP9WQBrjuQGeNRG3jxVEE2Qe28
 f9ymz4vHMogWfXlSWCcDVLVaO/8jEWv9xDlxxDmtcBKZpPdS/QCPL9A1kMNYIoW3Q91I
 H53uof8S8ibV8B5N4e5XEkUWrDcN0DXdjeKwr3Zwor42yvzvMuk2ssWQ8J7e+zDnfquh
 ghDw==
X-Gm-Message-State: AOAM533pDdmMbVvmgCAJLVDVwBj/At0gmS1PlRjE6w89pHW6TpL90dv+
 S/c4SV4FmUhXbXtCflZRE6hUXkLv7hGaUg==
X-Google-Smtp-Source: ABdhPJyhiBWpa3f6Ka+vF1Ys5POYCM4Iw30jt8TzP0ZwQRiyeLDjT7BR72rNOOAPGBeo8t/3rALVrg==
X-Received: by 2002:a62:8c8d:0:b029:301:7970:ab46 with SMTP id
 m135-20020a628c8d0000b02903017970ab46mr36410793pfd.48.1625059964445; 
 Wed, 30 Jun 2021 06:32:44 -0700 (PDT)
Received: from [192.168.1.11] ([71.212.149.176])
 by smtp.gmail.com with ESMTPSA id lm21sm7017233pjb.8.2021.06.30.06.32.43
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 30 Jun 2021 06:32:44 -0700 (PDT)
Subject: Re: [PATCH v2] target/s390x: Fix CC set by CONVERT TO FIXED/LOGICAL
To: Ulrich Weigand <uweigand@de.ibm.com>
References: <20210628163520.GA15209@oc3748833570.ibm.com>
 <0ec4b69c-02cb-0b1c-e980-9b462ab3a615@linaro.org>
 <20210630104926.GB29019@oc3748833570.ibm.com>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <bfd0db3d-284b-dcca-bc80-306fbdf9cc7a@linaro.org>
Date: Wed, 30 Jun 2021 06:32:42 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20210630104926.GB29019@oc3748833570.ibm.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::534;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x534.google.com
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
Cc: thuth@redhat.com, david@redhat.com, cohuck@redhat.com,
 qemu-devel@nongnu.org, Ulrich Weigand <ulrich.weigand@de.ibm.com>,
 qemu-s390x@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 6/30/21 3:49 AM, Ulrich Weigand wrote:
>> I'm thinking that should be able to remove TCGv_i32 cc_op in the
>> translator and manually write back to the slot instead.  We already
>> do a good job of caching the value within DisasContext -- I imagine
>> that the final code wouldn't even change too much.
> 
> I see.  If this works out, I'll update my patch accordingly
> -- please let me know.

I posted that on Monday:

https://patchew.org/QEMU/20210629002930.3013776-1-richard.henderson@linaro.org/

There are actually slightly fewer stores to the cc_op slot in the generated code, because 
some of them migrate to the helpers.  But for normal integer code the generated *is* 
identical.


r~

