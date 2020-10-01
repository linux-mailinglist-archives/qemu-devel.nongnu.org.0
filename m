Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A46AA280402
	for <lists+qemu-devel@lfdr.de>; Thu,  1 Oct 2020 18:34:35 +0200 (CEST)
Received: from localhost ([::1]:54120 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kO1XO-00032g-O1
	for lists+qemu-devel@lfdr.de; Thu, 01 Oct 2020 12:34:34 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41776)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1kO1NR-0002CZ-UB
 for qemu-devel@nongnu.org; Thu, 01 Oct 2020 12:24:17 -0400
Received: from mail-ot1-x344.google.com ([2607:f8b0:4864:20::344]:38630)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1kO1NN-0002bg-9F
 for qemu-devel@nongnu.org; Thu, 01 Oct 2020 12:24:17 -0400
Received: by mail-ot1-x344.google.com with SMTP id y5so6016490otg.5
 for <qemu-devel@nongnu.org>; Thu, 01 Oct 2020 09:24:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=C9ussE90WnLlKASX4LTrg6PF9y0o58ummgqb4z7B8kI=;
 b=h7YqAsh/Shao9Pl6FgwA7ywr3x253TGsJxC2QOfOq7c7l/OmPdawlWG8P50LPAnRR2
 NshExd9V06e85/bqF0b+M0QuSOFnIhy103BI12IbdaFD0QcGGCKSaeVk1o9FTFan1pdl
 70DpgqM07Xm7s8P8/vznNt0VRp4ddIWOidRLRdb5GFnjyfX6qLvOIIKQdO2LfRz02iSa
 GUOdjwmfcr8bzwtvsJD1Qm8vabS70T7NJW1LvTl6okuDHZ4wXqF/SYpS1jZUXAfa3V3x
 Gd6fDevYRrMFONSREOdj/2ZxiXI0AwK93GtFZjtUNii9qflVXUpekSuXKiQZdZVqIiXZ
 zwww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=C9ussE90WnLlKASX4LTrg6PF9y0o58ummgqb4z7B8kI=;
 b=KkXUetEfzZAFYXCiFPLumyUCeQsJdlR73CpI3DdA3LPHN4060VOaSIUlPUgwlyP7by
 mvre+DFD0D9o9JdV0W628K7YjEgMw/J5MVJcIPc04d+U2ZXzyY9iM36gWXdjj1FIcVrx
 l+UvWqphCQheLI6Bldd37VXcRpxDs3mu3us28+L8+goA7xKjel6B9HzKg6skO54IdXV8
 H9WnytNpoA9nVdh0q+eopsU253goAYToeaMP930KB7/ozX2FnnNUfQqEnjM2SnCDMd55
 S/BU6IhUlHPU7xj/ZG1z8qpqGwHERmdJTQ9JYaIuxaveUdZ9o3cGa6O15bLG5sdG2cWZ
 aqUw==
X-Gm-Message-State: AOAM530LiTXJs1DkGp0WDUBxgPeiuim6Sm8xZCcpzOZNipQJ6ApIugoD
 OHEGQfGadUCVTvitGNrxuWnkXA==
X-Google-Smtp-Source: ABdhPJwjIpIX25YJyuR/QTnf3//c04lcp8q84aTWRAy76mzRoknnL3RL/s8a9+ydjjxuFW8v3t7KIA==
X-Received: by 2002:a05:6830:1f16:: with SMTP id
 u22mr5245944otg.118.1601569452279; 
 Thu, 01 Oct 2020 09:24:12 -0700 (PDT)
Received: from [10.10.73.179] (fixed-187-189-51-144.totalplay.net.
 [187.189.51.144])
 by smtp.gmail.com with ESMTPSA id c19sm1384719ooq.35.2020.10.01.09.24.10
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 01 Oct 2020 09:24:11 -0700 (PDT)
Subject: Re: [PATCH v1 13/20] s390x/tcg: Implement 32/128 bit for VECTOR FP
 PERFORM SIGN OPERATION
To: David Hildenbrand <david@redhat.com>, qemu-devel@nongnu.org
References: <20200930145523.71087-1-david@redhat.com>
 <20200930145523.71087-14-david@redhat.com>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <8c79baa4-cc21-2414-862f-b4aa8f0cfee5@linaro.org>
Date: Thu, 1 Oct 2020 11:24:09 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20200930145523.71087-14-david@redhat.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::344;
 envelope-from=richard.henderson@linaro.org; helo=mail-ot1-x344.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
X-Spam_score_int: -23
X-Spam_score: -2.4
X-Spam_bar: --
X-Spam_report: (-2.4 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.26,
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
Cc: qemu-s390x@nongnu.org, Cornelia Huck <cohuck@redhat.com>,
 Thomas Huth <thuth@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 9/30/20 9:55 AM, David Hildenbrand wrote:
> Signed-off-by: David Hildenbrand <david@redhat.com>
> ---
>  target/s390x/translate_vx.c.inc | 100 +++++++++++++++++++++-----------
>  1 file changed, 67 insertions(+), 33 deletions(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>


r~


