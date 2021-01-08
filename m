Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0F84C2EF88B
	for <lists+qemu-devel@lfdr.de>; Fri,  8 Jan 2021 21:11:11 +0100 (CET)
Received: from localhost ([::1]:59402 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kxy6H-0002Qa-Hq
	for lists+qemu-devel@lfdr.de; Fri, 08 Jan 2021 15:11:09 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:54168)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1kxy4d-0001l3-Nl
 for qemu-devel@nongnu.org; Fri, 08 Jan 2021 15:09:27 -0500
Received: from mail-pg1-x536.google.com ([2607:f8b0:4864:20::536]:46235)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1kxy4b-0002Om-1A
 for qemu-devel@nongnu.org; Fri, 08 Jan 2021 15:09:27 -0500
Received: by mail-pg1-x536.google.com with SMTP id c22so8275274pgg.13
 for <qemu-devel@nongnu.org>; Fri, 08 Jan 2021 12:09:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=lB68adO6GrIyK320+aTFNTpiiJBBuCJBQZObKpChUMY=;
 b=HQekSAIz+3mdrcj378y3SzlysmDaVv4O0JdmdMiFwerukroC0ey4tlcENlhcQaQzEo
 A5/folDv+Z8kav6FvAXB5dc8vGJZqISV9QO3qAxtRh4+DT8DFDXHyAejzXNewCZCTyA9
 gxxOelchZofvUm7Zke+SMJC9FOB3BZscfZK51mY9X75HtVQkghg/lp/JSIRa3JkVhhJI
 e+MvHXtFxgm1GySJHHq8TsAkU2rWaVoakKLoo/bnian8pqLSiioUslzKPsYALm9lSU7t
 MdiePuJYKHsbSBeV/CAOd5rHaD96s8b4xDO17q0DZquijKKdh/Ijshqy1aJ5NxJMhJnU
 VY2w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=lB68adO6GrIyK320+aTFNTpiiJBBuCJBQZObKpChUMY=;
 b=hWAUHpgCE+3DQdbEs/RjxtKyWApc4y784y8FEU7Wh35Oul2OtWZvpGo3HOROnAz7Jw
 6c8BH5n2PT27cJZUuyB1b70L/7OWBinN7pjsmeURrbrzoD44POsimKr5Dcl1PkfJ+mWN
 a2Yek1tr3cJaSkFCAqoyV1+yaCF9b8QYTO5LVhQhnIkkA+Zr1Xywq0C0pF7gS0Cql/4E
 BpPmGMQVBFtePf8txJTDC7XaDcatcluDcaOnP7pE2/iHSXo5UQL8/8ZK61+OYn0wve7C
 6nfBA3c8S2Lj9Y+02N2FJS7roDrXeHaInJJS3pAqxqR7+Nbw5R7kw060kSxwxl9TBVxv
 94RQ==
X-Gm-Message-State: AOAM533k9xD/oyi6TFNyTwBgX/UMrlx3KOcB7iCQ5MVJvkYmlGlHcCjr
 pMjqUce6QK8X8vjprzXE6H0sHQ==
X-Google-Smtp-Source: ABdhPJwzVq5jEosN93vIs/MFprcwAC1yYzhFdJ+LpR0Ionjn4P5T7hk1gzA7uuhV5nbhbftDJr5+aQ==
X-Received: by 2002:a63:170f:: with SMTP id x15mr8635801pgl.157.1610136563457; 
 Fri, 08 Jan 2021 12:09:23 -0800 (PST)
Received: from [10.25.18.7] (rrcs-173-197-107-21.west.biz.rr.com.
 [173.197.107.21])
 by smtp.gmail.com with ESMTPSA id a131sm10794419pfd.171.2021.01.08.12.09.21
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 08 Jan 2021 12:09:22 -0800 (PST)
Subject: Re: [PATCH] target/arm: Don't decode insns in the XScale/iWMMXt space
 as cp insns
To: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org
References: <20210108195157.32067-1-peter.maydell@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <93a29bfc-bc4c-b46c-3e8c-9be3ef40356a@linaro.org>
Date: Fri, 8 Jan 2021 10:09:19 -1000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20210108195157.32067-1-peter.maydell@linaro.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::536;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x536.google.com
X-Spam_score_int: -22
X-Spam_score: -2.3
X-Spam_bar: --
X-Spam_report: (-2.3 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.241,
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
Cc: qemu-stable@nongnu.org, Guenter Roeck <linux@roeck-us.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 1/8/21 9:51 AM, Peter Maydell wrote:
> In commit cd8be50e58f63413c0 we converted the A32 coprocessor
> insns to decodetree. This accidentally broke XScale/iWMMXt insns,
> because it moved the handling of "cp insns which are handled
> by looking up the cp register in the hashtable" from after the
> call to the legacy disas_xscale_insn() decode to before it,
> with the result that all XScale/iWMMXt insns now UNDEF.
> 
> Update valid_cp() so that it knows that on XScale cp 0 and 1
> are not standard coprocessor instructions; this will cause
> the decodetree trans_ functions to ignore them, so that
> execution will correctly get through to the legacy decode again.
> 
> Cc: qemu-stable@nongnu.org
> Reported-by: Guenter Roeck <linux@roeck-us.net>
> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
> ---
> With this Guenter's test image now successfully boots
> and shuts down again.
> ---

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~


