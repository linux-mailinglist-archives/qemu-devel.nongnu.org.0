Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E0BB855229B
	for <lists+qemu-devel@lfdr.de>; Mon, 20 Jun 2022 19:10:38 +0200 (CEST)
Received: from localhost ([::1]:33896 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o3Kv7-0003ME-I5
	for lists+qemu-devel@lfdr.de; Mon, 20 Jun 2022 13:10:37 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33688)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1o3Ktl-0002Sf-C6
 for qemu-devel@nongnu.org; Mon, 20 Jun 2022 13:09:13 -0400
Received: from mail-pg1-x535.google.com ([2607:f8b0:4864:20::535]:44919)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1o3Kti-0003LT-Li
 for qemu-devel@nongnu.org; Mon, 20 Jun 2022 13:09:13 -0400
Received: by mail-pg1-x535.google.com with SMTP id a14so1188986pgh.11
 for <qemu-devel@nongnu.org>; Mon, 20 Jun 2022 10:09:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=sIgIaBMmTDZ1A5XjkXM+UibhDNB7KUfn9ji4IqYCG7k=;
 b=ohNgiGwICYRFS9ezx+7yeSc7MpIcTdTu2V2SL47dzvZosh87fBWbru5l606M/iRTgV
 hijPUXeKw2H8x+/5lYd7BnRNCQPXzVrPyxFDsbhSE4AdjU+vJV7Na2VUHN3pf1qhlijQ
 Gks+9xsE4SfGPJxfLQRv3Y9YkiQIrUZ0uEGsBT0wK4E1uM4IOg0uovFLZKTLUM1dDqAP
 7EzxhI3+EOm/4bZSDDana/rOoyZMdoOgDXRL//aaJr+cKoN+AiwiXelwSgbM3qOypoNy
 BZ78r3x+S0FAuScTvbfVQpGAfJR0d8zJX3WpTQzHnzVV3CiwoLq2kUNpPqjxkUtGUHoO
 iM/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=sIgIaBMmTDZ1A5XjkXM+UibhDNB7KUfn9ji4IqYCG7k=;
 b=zviTiO4Nv1H9L1pTHugkXaEJHv28CeJy0OLval9KTgIslBXhNC/r/+4nHVA3flCaPh
 8QK8Ok1TxIMK8nAT1ysVust3V9a3rxAha8x/fZ/khDfnvAotwxzO5URQnlDXEbPHMMxG
 9m+T6biVrFtO5J0OkbALeeixje+Oar3EM71VOSL8y8vbEdNJUcA2+oc2E9O91DaVeioY
 Z80epyJrjGJw5xsV8tJ3XPaD62IMOEwdpRsce2Uchwx4Mr68++8+LenCYncPmoMy8IcC
 V3wmvp0I+RH51wwFNgZEnlJPcu+oZcsboUwDh+WAUa6IOSovx34+TTNLJmeg8hg8Na2b
 hYqA==
X-Gm-Message-State: AJIora+uEctJa45dNnqdLLolkWYMyHY151RkI4OlcEBS5cfN+UbQMrrG
 lbCEkISZh0gnRF7pxXnJHIyfXA==
X-Google-Smtp-Source: AGRyM1twF9SU0trAGr/5FJHclfdroUvqNwP1iOpu7Pii53s34bfY0IxW3GyPSRensYGXFg+1fRIE8g==
X-Received: by 2002:a63:5b42:0:b0:408:8710:13b0 with SMTP id
 l2-20020a635b42000000b00408871013b0mr22867807pgm.584.1655744948895; 
 Mon, 20 Jun 2022 10:09:08 -0700 (PDT)
Received: from ?IPV6:2602:47:d49e:3c01:a3e0:8a80:7b85:aea6?
 ([2602:47:d49e:3c01:a3e0:8a80:7b85:aea6])
 by smtp.gmail.com with ESMTPSA id
 l4-20020a170903120400b001638a171558sm8995795plh.202.2022.06.20.10.09.08
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 20 Jun 2022 10:09:08 -0700 (PDT)
Message-ID: <1fefcdec-8707-6352-0300-89c0fbd02352@linaro.org>
Date: Mon, 20 Jun 2022 10:09:06 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.1
Subject: Re: [PATCH] target/arm: Catch invalid kvm state also for hvf
Content-Language: en-US
To: Alexander Graf <agraf@csgraf.de>, Peter Maydell <peter.maydell@linaro.org>
Cc: qemu-arm@nongnu.org, qemu-devel@nongnu.org
References: <20220620160819.65191-1-agraf@csgraf.de>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20220620160819.65191-1-agraf@csgraf.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::535;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x535.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 6/20/22 09:08, Alexander Graf wrote:
> -    if (kvm_enabled()) {
> +    if (kvm_enabled() || hvf_enabled()) {

I think this should be !tcg_enabled().  No hw virtualization can use EL3 (or M-profile), 
only full emulation from TCG.  There is such a thing as ARM on Windows, so I can imagine 
that WHPX may make a future appearance here.

(MTE may eventually be supported by virtualization, but it's not there yet.)


>          if (arm_feature(env, ARM_FEATURE_M)) {
>              error_setg(errp,
> -                       "Cannot enable KVM when using an M-profile guest CPU");
> +                       "Cannot enable KVM or HVF when using an M-profile guest CPU");
>              return;
>          }

You can get the accelerator name from

     AccelClass *ac = ACCEL_GET_CLASS(current_accel());
     const char *name = ac->name;


r~

