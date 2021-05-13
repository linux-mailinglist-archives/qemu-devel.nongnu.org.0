Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BC2AE37F804
	for <lists+qemu-devel@lfdr.de>; Thu, 13 May 2021 14:34:05 +0200 (CEST)
Received: from localhost ([::1]:33138 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lhAXU-0001Mf-QD
	for lists+qemu-devel@lfdr.de; Thu, 13 May 2021 08:34:04 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:32868)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lhASA-0003YZ-Rh
 for qemu-devel@nongnu.org; Thu, 13 May 2021 08:28:35 -0400
Received: from mail-qk1-x730.google.com ([2607:f8b0:4864:20::730]:34712)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lhAS9-0005oM-6P
 for qemu-devel@nongnu.org; Thu, 13 May 2021 08:28:34 -0400
Received: by mail-qk1-x730.google.com with SMTP id v8so7278505qkv.1
 for <qemu-devel@nongnu.org>; Thu, 13 May 2021 05:28:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=C1rjxkQ6001E3aAppoM+c+gxxMD89ua8PablAiN2hcQ=;
 b=irbuJg4If3akfwyIMhy2K8Kw7FnSxS+0IWwSjhRHjxvz/ks+d4Fc4PVfxBFkhZDIhJ
 VZzbYHn+w1BfXR493PIk//TQjoIGT6U65Fp2Vn/nBN2t4oxdY2j7EoSx88ugmVthUk/y
 oQfHs1EuIcME/AusqZ2txu+KisBJdxTpUysLJAxrwOuv0Bmy2vjlCurPILz5JBHAPSRa
 hPpvbGHsU+n3twMg7xU7QI5GOxAgPS1qzwhjW7YcEGEyxxDYNds7TNWrHppiLJ9C8JJ8
 JWu9zbH2Jk98L1wU27gRouAJKIQdjNROGhUv/MJNtXxQb8vGME1yVfsSNe/fnxROjZVt
 4p5Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=C1rjxkQ6001E3aAppoM+c+gxxMD89ua8PablAiN2hcQ=;
 b=JKPmSALUkfR99QxRoR+AAUlXVSFUSdzbRG9+7+3WB/91gGKDGtWFDOTqhYpx1rs9DN
 5FPH7RtciOym5C0IjmRy/WZ1YOllOmWF9ivAxuxSxmrndrTokYZIJ81gUvlfaCY+0p2S
 qPV9PWmUw81tp9fOibVmUeIJKW8In5QHSg1vS2OeDFtrKou9YJ6ZF4gwvKNp48h8kyM1
 9QppP4PtOuel5KMnBbgphXw3HAwsfAZRt0ZhIVBJFXijDo8qhIobRFVBgpBwk4/6XB86
 7RJ+OIzPTW7IY8vK6ixgMyL+zX5Y6tnMBxuZuWVT1fIBg9EQIyOOgQ983BkQk2PlwJQG
 7n2w==
X-Gm-Message-State: AOAM531O8Ym7br7ESKY8xTtR2NsgKs17ZdhWx2wny4v+2b/ggY65WbkG
 n99A/fjBu99Z55qFDqFBmgsTCA==
X-Google-Smtp-Source: ABdhPJyXF38fsFpEZafloLaTw+jPgkl536lnDC1AXYsAV0tBG3NH+33/P/59viCFrFDctIL6TltIpw==
X-Received: by 2002:a05:620a:4515:: with SMTP id
 t21mr38066647qkp.442.1620908912057; 
 Thu, 13 May 2021 05:28:32 -0700 (PDT)
Received: from [192.168.183.155] (163.189-204-200.bestelclientes.com.mx.
 [189.204.200.163])
 by smtp.gmail.com with ESMTPSA id w196sm2238449qkb.90.2021.05.13.05.28.31
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 13 May 2021 05:28:31 -0700 (PDT)
Subject: Re: [PATCH 29/72] softfloat: Move pick_nan to softfloat-parts.c.inc
To: David Hildenbrand <david@redhat.com>, qemu-devel@nongnu.org
References: <20210508014802.892561-1-richard.henderson@linaro.org>
 <20210508014802.892561-30-richard.henderson@linaro.org>
 <24f81b2c-ae42-ab34-3b57-08514d32620e@redhat.com>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <e9e07380-152a-f6b3-78b2-22966222758e@linaro.org>
Date: Thu, 13 May 2021 07:28:29 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <24f81b2c-ae42-ab34-3b57-08514d32620e@redhat.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::730;
 envelope-from=richard.henderson@linaro.org; helo=mail-qk1-x730.google.com
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
Cc: alex.bennee@linaro.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 5/12/21 1:16 PM, David Hildenbrand wrote:
> I find the "*parts_pick_nan(&a, &b, s);" part a little ugly to read...

Yeah, thankfully that's transitional and gets cleaned up later.


r~

