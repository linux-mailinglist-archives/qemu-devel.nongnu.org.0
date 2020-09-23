Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2EC56275A98
	for <lists+qemu-devel@lfdr.de>; Wed, 23 Sep 2020 16:48:02 +0200 (CEST)
Received: from localhost ([::1]:39762 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kL63s-0002pV-Vy
	for lists+qemu-devel@lfdr.de; Wed, 23 Sep 2020 10:48:01 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:55660)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1kL62O-0002Iv-4H
 for qemu-devel@nongnu.org; Wed, 23 Sep 2020 10:46:28 -0400
Received: from mail-pj1-x1044.google.com ([2607:f8b0:4864:20::1044]:37992)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1kL62M-0007BH-CE
 for qemu-devel@nongnu.org; Wed, 23 Sep 2020 10:46:27 -0400
Received: by mail-pj1-x1044.google.com with SMTP id u3so3278909pjr.3
 for <qemu-devel@nongnu.org>; Wed, 23 Sep 2020 07:46:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=HATRwnc/nm5QVVZvAFuvVMu82uedF2gD2RdkFq2tlKE=;
 b=K83TfOinY6unS3bE4CvHM8ePVuvb4f+ww0/e2gGXOtxuv7KfUmTiNDvtwMuUTyAJSx
 Ogn1t5OfuDaAO/h5RD9in8NnKxGBDqIi+5CALdfqJ2sIsGDGk95OEqyHA/x7YyAgcFoA
 NLODAIsL+c6wwmOF5tJ5SABf1Vgk6lvQfBB+yilHgYZa8NccmKRtehUzggGO0781ZiRG
 k801bbYPAdnQWYR4pXZBD6iTtx1/cU8uJ5a9oLjtaQC3ozD6w0/IqygI2xz3/9qvzWwv
 pLrifRGM9zzWqAFJfIF/Gasp4bSwwfrAC18E03aHxdXADER+GliJkXSiwffwX7ILbn0T
 NGKA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=HATRwnc/nm5QVVZvAFuvVMu82uedF2gD2RdkFq2tlKE=;
 b=mURu+LLbg04F1GhXaqxShGSGV7km7FStLe/qtPr1H4oGqXNNqv6Xdv24SzEEPYfUVt
 ik78/jMc4liuZzAN2e0YmIzk19axt1TbGvTaI3psLJYOw2N2gcfjnka9CqQhW+8ftOHn
 ie10pUhHJQTm/jAm04xlbBZV/wt6CqjJ/YnYEX+n7eK7dT5fPkw1ZTUnywukO22KFl+D
 ODUzfxydyUzNvgjrfpMBqlGhCQrE5FmHCKp8scTapJIfM3S7Y76TKGn6fRW+uDsr/Gi4
 SoezRBzPFNYjUj6eRcyNUkAqSr31lKJ1IeuetPOgRljxqcVNQhVEYTaWaRE2GkZy3/CO
 Nu1Q==
X-Gm-Message-State: AOAM530PovP5Kzl++7RTP5IchsyMCb5ZpxPd1UxQu4+JxbhovjChCmSc
 PeK5RHpPZXQftm9Nq6WPnT/HTQ==
X-Google-Smtp-Source: ABdhPJxRtVXrdf1Pn4I77wTqfTjP2rXqP3ReZzvEnypPJVGESP5VFDVTIlPvhJiJ1+CJ2V3lHAzAAg==
X-Received: by 2002:a17:90a:ab8f:: with SMTP id
 n15mr8385113pjq.139.1600872384950; 
 Wed, 23 Sep 2020 07:46:24 -0700 (PDT)
Received: from [192.168.1.11] ([71.212.141.89])
 by smtp.gmail.com with ESMTPSA id t186sm174968pgc.49.2020.09.23.07.46.23
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 23 Sep 2020 07:46:23 -0700 (PDT)
Subject: Re: [PATCH v3 51/81] target/arm: Pass separate addend to {U, S}DOT
 helpers
To: LIU Zhiwei <zhiwei_liu@c-sky.com>, qemu-devel@nongnu.org
References: <20200918183751.2787647-1-richard.henderson@linaro.org>
 <20200918183751.2787647-52-richard.henderson@linaro.org>
 <a0ad74b1-8445-710a-3d87-0310011e9163@c-sky.com>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <300c780c-0167-0a87-58b9-2fff8ab91190@linaro.org>
Date: Wed, 23 Sep 2020 07:46:21 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <a0ad74b1-8445-710a-3d87-0310011e9163@c-sky.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1044;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1044.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: peter.maydell@linaro.org, alex.bennee@linaro.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 9/23/20 3:01 AM, LIU Zhiwei wrote:
> 
> 
> On 2020/9/19 2:37, Richard Henderson wrote:
>> For SVE, we potentially have a 4th argument coming from the
>> movprfx instruction.  Currently we do not optimize movprfx,
>> so the problem is not visible.
> Hi Richard,
> 
> I am a little confused.  If it is not immediately preceded by a MOVPRFX
> instruction, the addend will
> still be used.
> 
> Is it right?

If movprfx is not used, then the addend register will be the same as the
destination register.

r~

