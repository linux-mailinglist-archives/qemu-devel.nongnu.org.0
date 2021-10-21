Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 224E3436BDE
	for <lists+qemu-devel@lfdr.de>; Thu, 21 Oct 2021 22:14:48 +0200 (CEST)
Received: from localhost ([::1]:56316 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mdeSc-0005gm-W4
	for lists+qemu-devel@lfdr.de; Thu, 21 Oct 2021 16:14:47 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36796)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mdeJ1-0001qj-VO
 for qemu-devel@nongnu.org; Thu, 21 Oct 2021 16:04:52 -0400
Received: from mail-pj1-x1030.google.com ([2607:f8b0:4864:20::1030]:40591)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mdeIy-0006BM-V1
 for qemu-devel@nongnu.org; Thu, 21 Oct 2021 16:04:51 -0400
Received: by mail-pj1-x1030.google.com with SMTP id
 n36-20020a17090a5aa700b0019fa884ab85so3978582pji.5
 for <qemu-devel@nongnu.org>; Thu, 21 Oct 2021 13:04:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=B3bbawASsnLUok/cr8hm3VVPOBR8/ecw9TijlubUaPA=;
 b=RvBhp+7CxFYyAqcJPoCvFEpxENksz+y/sMOPhEmU64+TegQ6HHtZxpsHGy5Fn3cFIW
 Xi8TyrzOPqAjtw9Ygs3HBoXbkkWx6lvOVIDrcfytQO0qUIC0iLNcfVaxMG83JbHLSKUD
 3ETO6fFdJDsx0pweSN1nZBq3Xa9+IQVVi1j9uz2NIuDCu2RHtbSXh+HLuYz6dPkvgJCV
 rpdjdd+ZESobSaeLBoa8jbDbrR2sEViSV4VVYt2ax+s/WnEbxm8/g60fKq17DKd6QPIz
 zNmXcIJj37ubOMpQ1mhiEVPOkxwmbaWC1Z6Snf42wNCRCoAABM7LCLYO0yTTb/SMgh98
 dkFQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=B3bbawASsnLUok/cr8hm3VVPOBR8/ecw9TijlubUaPA=;
 b=IrpZPLt1O+9qqpgtmWQ4wcSF4J2REcZc2vV1pJHGBdTFUjnTFWO2p4C1G+2u3P4EMf
 +DGULJ5Kpkssy/O0D5nRY3xt+MeE2Ys74+eXJZ6of+Zz18DNznf/+2s6w2V+XGOFulyL
 +lM52xsZwcrhzSOchIcaGcyCpQb1Yn3Et+dzS2ONqF0VRLzEobfNvy51tBQ8jriUiCH9
 xOtPcKQdsbjfKr412qHLRy1xzqaGQ2Nx7fB/hTVfUC3F2ZS3io7f2tNYm3XN3fQpUSxR
 fyGzc7MhRCuHEwKSLJQMuCa7Ob6iazy6dAHe0KwL9yoP5xQ1yW0AJv3+IFaQ2JpcZJKT
 V27g==
X-Gm-Message-State: AOAM533686fGCqwDlyv6nu4reo9p0vIGfHHu7aDM8GNysMnpQLtJeWmF
 vD401d8dz3ytKnDLfF7yx3LmCg==
X-Google-Smtp-Source: ABdhPJx2FxnQO49VNnpXMbbYxqZh8azDiFIg+YCekGaXsqxzSbKr4Em9M0cYx21PiLQpL2enH+UiDQ==
X-Received: by 2002:a17:90a:b314:: with SMTP id
 d20mr9100119pjr.174.1634846686886; 
 Thu, 21 Oct 2021 13:04:46 -0700 (PDT)
Received: from [192.168.1.11] ([71.212.134.125])
 by smtp.gmail.com with ESMTPSA id e8sm7537840pfn.45.2021.10.21.13.04.45
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 21 Oct 2021 13:04:46 -0700 (PDT)
Subject: Re: [PATCH v3 03/22] host-utils: introduce uabs64()
To: Luis Pires <luis.pires@eldorado.org.br>, qemu-devel@nongnu.org,
 qemu-ppc@nongnu.org
References: <20210910112624.72748-1-luis.pires@eldorado.org.br>
 <20210910112624.72748-4-luis.pires@eldorado.org.br>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <e324a9af-daab-273b-e448-33386c79e4e6@linaro.org>
Date: Thu, 21 Oct 2021 13:04:44 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <20210910112624.72748-4-luis.pires@eldorado.org.br>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1030;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1030.google.com
X-Spam_score_int: -49
X-Spam_score: -5.0
X-Spam_bar: -----
X-Spam_report: (-5.0 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-2.867,
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
Cc: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>, groug@kaod.org,
 Eduardo Habkost <ehabkost@redhat.com>, david@gibson.dropbear.id.au
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 9/10/21 4:26 AM, Luis Pires wrote:
> Introduce uabs64(), a function that returns the absolute value of
> a 64-bit int as an unsigned value. This avoids the undefined behavior
> for common abs implementations, where abs of the most negative value is
> undefined.

I do question the comment there wrt undefined. We compile with -fwrapv, which means that 
*no* overflow is undefined; we always have properly truncated twos-compliment values.


r~

