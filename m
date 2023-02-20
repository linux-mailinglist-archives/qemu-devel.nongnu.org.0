Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C7D3569D3D9
	for <lists+qemu-devel@lfdr.de>; Mon, 20 Feb 2023 20:09:32 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pUBXO-0006Qc-7B; Mon, 20 Feb 2023 14:09:22 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pUBXL-0006Fp-QP
 for qemu-devel@nongnu.org; Mon, 20 Feb 2023 14:09:19 -0500
Received: from mail-pj1-x1036.google.com ([2607:f8b0:4864:20::1036])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pUBXJ-0001KX-B2
 for qemu-devel@nongnu.org; Mon, 20 Feb 2023 14:09:19 -0500
Received: by mail-pj1-x1036.google.com with SMTP id
 nw10-20020a17090b254a00b00233d7314c1cso2492440pjb.5
 for <qemu-devel@nongnu.org>; Mon, 20 Feb 2023 11:09:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=oANFMiyRtcFFJruFtgg5gh0+RzklqMnM7+t0W790hjU=;
 b=fvXrtST7hEATBpAcGl11gpF1W6pEjSsd8D+vL2XiDQiLIsQHYNqhexDAYDS+jHeYVi
 RZeLxtqmgIigmajHHpPklUJswHalStQzZo7yzPLU5YO3v/mSRqmmxDcsrrmnhh5KdrjJ
 0vmA3+uRQteMHudTFbLDWyQeUWICU03WMWOvRBC386IV9M/+KpU5K4i6n6ZN1clM0WuZ
 or0jUkpl+BwDVN69UiXH2kBhkBET6kCFZHLllTrIlpmgxH4OK8AAWuV5KN+9Xe5z1ZOJ
 +yEMB8K1Ho2opRH+UXUNh+5rsB7DQ2Q3rxq0IepHm010M1R8yoFBInw1AZ0Iq8brQRWs
 oSbA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=oANFMiyRtcFFJruFtgg5gh0+RzklqMnM7+t0W790hjU=;
 b=Qin73JTUXjAXcwzNzLWxJEiVy6KxWsg7MHM/lh0mrXQHmn8A+mBcJP1VweVV1oiQDj
 cFowdZdOI9SWphWYUgeMLM7ZlTi6gEb1uGgS6YbqW9kqpvB7utVL/lacw97CaXlXyj8K
 GcKZVOabJLB99rSUiFLe/9Tf+fqK57XNwypNLtYNwQVk6VHnxx4DoLfeGYwprZ6AXwBQ
 eisKyvAchV2bz6dn95y1o5TOQbvCJXUan4gVgO3TqG9lEfY4GeYg79rydoFAuFFZTLwp
 cPbAHF/9USo968gO+8YuGAHXp51Zr5c9QAS8U8k1SR2H2U53jSDmwShmZS4TogtdGUXH
 y3rw==
X-Gm-Message-State: AO0yUKXo+OujFGBKclV4Pupwt77kfiS9TSuNQZTrWGzPo78Umt8burGC
 9YKaTab179S3TC3k2cT74cnswg==
X-Google-Smtp-Source: AK7set9z7367Bvq9n5ZDEnq77e/f8hDeg7f71wmuajK6WqyW+yjBOKgjM9+EStjsFxy233Iui4zidA==
X-Received: by 2002:a17:903:18c:b0:199:4934:9d31 with SMTP id
 z12-20020a170903018c00b0019949349d31mr5429284plg.20.1676920155711; 
 Mon, 20 Feb 2023 11:09:15 -0800 (PST)
Received: from [192.168.6.128] (rrcs-173-198-77-218.west.biz.rr.com.
 [173.198.77.218]) by smtp.gmail.com with ESMTPSA id
 u11-20020a170902b28b00b0019aaccb665bsm8261543plr.245.2023.02.20.11.09.14
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 20 Feb 2023 11:09:15 -0800 (PST)
Message-ID: <5add3a11-b959-8774-5271-f5b6caf82462@linaro.org>
Date: Mon, 20 Feb 2023 09:09:12 -1000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.1
Subject: Re: [PATCH 2/9] hw/usb/hcd-ohci: Use OHCIState type definition
Content-Language: en-US
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>,
 qemu-devel@nongnu.org
Cc: Gerd Hoffmann <kraxel@redhat.com>, Markus Armbruster <armbru@redhat.com>
References: <20230220150515.32549-1-philmd@linaro.org>
 <20230220150515.32549-3-philmd@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20230220150515.32549-3-philmd@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1036;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1036.google.com
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

On 2/20/23 05:05, Philippe Mathieu-Daudé wrote:
> Forward-define the type first, then use it for the ohci_die() handler.
> 
> Signed-off-by: Philippe Mathieu-Daudé<philmd@linaro.org>
> ---
>   hw/usb/hcd-ohci.c |  2 +-
>   hw/usb/hcd-ohci.h | 10 ++++++----
>   2 files changed, 7 insertions(+), 5 deletions(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~

