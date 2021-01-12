Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 43DC22F3429
	for <lists+qemu-devel@lfdr.de>; Tue, 12 Jan 2021 16:30:08 +0100 (CET)
Received: from localhost ([::1]:35386 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kzLcV-0000jG-Bo
	for lists+qemu-devel@lfdr.de; Tue, 12 Jan 2021 10:30:07 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:36068)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1kzLaz-0007ss-HS
 for qemu-devel@nongnu.org; Tue, 12 Jan 2021 10:28:33 -0500
Received: from mail-pj1-x1034.google.com ([2607:f8b0:4864:20::1034]:33047)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1kzLax-0007io-S9
 for qemu-devel@nongnu.org; Tue, 12 Jan 2021 10:28:33 -0500
Received: by mail-pj1-x1034.google.com with SMTP id w1so1657251pjc.0
 for <qemu-devel@nongnu.org>; Tue, 12 Jan 2021 07:28:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=ws/4/XaHzQHD0Z2TK3gcMNEXK5pkDcY4u+pIDK0gE4A=;
 b=BuQ7ssFbErunNdxcMfMIXF9RE6QCsjpI1gm412jspjvEWzEtyiYCcXMB5Qp/jX6YVR
 gjhodKR9FOmQWmeHpmOyWdY7NymAyRPPZvNS8y5zAYci94j36H84Uz++/38Kxksl9uTk
 pPySjVIYdJsXYWERC0YZHEzYL5q6VsfswwxWk6lNptk1K6YSYSOJ3yiwrxRy50ryEfuj
 Tn1vekNWMntkDpDin5VJn6ZA2aTzX3RXdnGqZbZuvt8SF/ShtaKodBZekST/ptpC2rOs
 2EOGDHxTgSRB8SZBiFWwjJWT9EKLM3tdl5IkOx2VbRNDX/tOdxrUvWzGSjwWpYhtWt3y
 GVCA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=ws/4/XaHzQHD0Z2TK3gcMNEXK5pkDcY4u+pIDK0gE4A=;
 b=PtHm1JNAJDNVH0GgOW9sUumiTrkT4VELNAwxmdaaJYFwL2e5vBxaXmXvjZbQhvk9UR
 cCIKmEt/ev5PhupUdUa0odw+LmuDNmCAYWLeVSwmBVx3tlkoHpcEs5Yte0VuyYfzXNsh
 UJemjpdwwML3dATpyU5WymTlbWLGcKZpPAKG+eS90I2BkUDuojA2jwndgKsrdkF9ScHH
 HSjzjjbIzFalJY/NUnPB4mBXxenI9klnRRzKCoReamLV6TMfTNBmhx88KFgVLoiFbRzC
 IrisNpjeNKRgiTmpX+9A0Wr167sdL5bOpcSSY2fAZXeKP3D3pfUrxYcssUtVpV5XQv9/
 956g==
X-Gm-Message-State: AOAM531wWODQrDLcuTK2Y6HF6GLRMH6BSuPPprNHITKyenKza2x7u47d
 L2UvxK9FzcUyExV/1IV+W1rzAA==
X-Google-Smtp-Source: ABdhPJxTIWhLBZ9GjcYORLndWia+etAFUSm7tJIvHJ23+1vNgd3V+qG9eVN2Iy3kFAv42KX3t01t9g==
X-Received: by 2002:a17:90b:3545:: with SMTP id
 lt5mr2298985pjb.95.1610465310539; 
 Tue, 12 Jan 2021 07:28:30 -0800 (PST)
Received: from [10.25.18.36] (rrcs-173-197-107-21.west.biz.rr.com.
 [173.197.107.21])
 by smtp.gmail.com with ESMTPSA id g3sm3789261pjt.34.2021.01.12.07.28.28
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 12 Jan 2021 07:28:29 -0800 (PST)
Subject: Re: [PATCH] hvf: guard xgetbv call.
To: Roman Bolshakov <r.bolshakov@yadro.com>
References: <X91h2yoy7qVrO1kv@Hills-Mac-Pro.local>
 <X/lDozXFWfR4AZAU@SPB-NB-133.local>
 <CAFEAcA9bMbPFj=xFiHgDVg1X14kZOt0Bre-uH0fcjJzsaSk0qA@mail.gmail.com>
 <X/pccrqIQ9/N57j6@SPB-NB-133.local>
 <8da22f7f-7379-cffe-5fdd-94fd5ddece32@linaro.org>
 <4a24ae1a-8114-a840-b6bf-ae3a301f6232@linaro.org>
 <X/vUjHCd81PvEflw@SPB-NB-133.local>
 <259b9e96-1f69-4e4a-16ef-7034e19ed1ef@linaro.org>
 <X/1Uc7Ohb+lqEFsU@SPB-NB-133.local>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <fae77484-1f18-58cc-2b90-bd88c415ee30@linaro.org>
Date: Tue, 12 Jan 2021 05:28:26 -1000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <X/1Uc7Ohb+lqEFsU@SPB-NB-133.local>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1034;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1034.google.com
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
 QEMU Developers <qemu-devel@nongnu.org>, Cameron Esfahani <dirty@apple.com>,
 John Arbuckle <programmingkidx@gmail.com>, Hill Ma <maahiuzeon@gmail.com>,
 Paolo Bonzini <pbonzini@redhat.com>, Richard Henderson <rth@twiddle.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 1/11/21 9:49 PM, Roman Bolshakov wrote:
>> I would have xgetbv and all of the cpuid values cached at startup, and all
>> three places would read global variables.
>>
> 
> It makes sense, thanks for the clarification.
> 
> Do you think it should be part of the change Hill is doing or it might
> be a follow-up cleanup patch?

Could be follow-up, yes.


r~

