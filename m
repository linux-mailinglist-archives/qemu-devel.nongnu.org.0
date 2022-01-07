Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1D429487D6F
	for <lists+qemu-devel@lfdr.de>; Fri,  7 Jan 2022 21:03:28 +0100 (CET)
Received: from localhost ([::1]:52638 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n5vSQ-0000lU-Ur
	for lists+qemu-devel@lfdr.de; Fri, 07 Jan 2022 15:03:27 -0500
Received: from eggs.gnu.org ([209.51.188.92]:53472)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1n5vOp-0006rK-TM
 for qemu-devel@nongnu.org; Fri, 07 Jan 2022 14:59:44 -0500
Received: from [2607:f8b0:4864:20::530] (port=35547
 helo=mail-pg1-x530.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1n5vOl-0001DA-GA
 for qemu-devel@nongnu.org; Fri, 07 Jan 2022 14:59:43 -0500
Received: by mail-pg1-x530.google.com with SMTP id v25so6321209pge.2
 for <qemu-devel@nongnu.org>; Fri, 07 Jan 2022 11:59:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:references:from:message-id:date:user-agent:mime-version
 :in-reply-to:content-language:content-transfer-encoding;
 bh=00WCYSwU54tlf8RYzoImrI3YFYK87c+rq1zZq2Ty4Y8=;
 b=g5H6YrG1uI2w/XHkWZFnO3dG+CZPtAyrMwphdx0WrAtt3oudIRhqnpSnHgjGDFUAgu
 Ub69HjBWi6R2SEAJl7bjKyP7exenC32N5xlZRyVPwmR7sFxjsFd7dwK29fPXyCP8GxwP
 k0n2dR4dGvmwKX9ffd7703cYBIhUHyTzs86hy2sB3aM7kw+DrzzZGZLXVXcoYEZWR7xc
 /wDGHrJyEmcOfv/PkzrMqEEHlCNdGS8KWJ2iKnzNsSFtuF1ngQaXiYF8/Mo4d4tDTLw3
 zeMvhNeREF9YmLB1GOIQUrf61Z3IAMVq13I97OOpZp3Hf6woHGN9aRomA1//nHBmQZUb
 Lqww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:subject:to:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=00WCYSwU54tlf8RYzoImrI3YFYK87c+rq1zZq2Ty4Y8=;
 b=zlCXfczit0Ppshtg11LTJyEIEYh+9/UFbeNoT+me8IibfbDIi7F8tDa5831ELIFkOL
 aJSg15TKbbU5iR7/Ax7eE5aAlkZVSDtx1FZBM4UqKWqhAVtZgRJgkOef71dyCCSoiGfU
 BP59uBNXvWsS9mxq5TL3wlDEVOY8KHAkZw9WT7ygH/R88wat+932j22uCJWYS+W/0TiO
 5c4UPOyI1iEKcpyNsEwqloQ7glxaA/kYc1yeOLVbXdJDSROIcyGzB3eclk5kLl8pE5Jz
 i0qRunkAxOUzBQIAIJP4gf4v0KGumIkbro3cfC3UxstWJxY9XjPK41EYNiqrF9r1pAOC
 acDw==
X-Gm-Message-State: AOAM530k6j5gt9TMkvozihKBbtmvYnGLIawu0WgbueixqAEjGZvYaK4R
 kk4kf1STxpVaQ8dzCHy+fkgFDtZSx1HvNg==
X-Google-Smtp-Source: ABdhPJz3Ro/CIoaA/wI7lcJBurD/k2FdAw1R8pMTEGatrGmXJxL8rpC/XyxKT4fglG19dHNNBBGclA==
X-Received: by 2002:a63:7155:: with SMTP id b21mr3705350pgn.525.1641585570713; 
 Fri, 07 Jan 2022 11:59:30 -0800 (PST)
Received: from [192.168.1.13] (174-21-75-75.tukw.qwest.net. [174.21.75.75])
 by smtp.gmail.com with ESMTPSA id q17sm6825104pfj.119.2022.01.07.11.59.30
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 07 Jan 2022 11:59:30 -0800 (PST)
Subject: Re: [PATCH] configure: do not create roms/seabios/config.mak if
 SeaBIOS not present
To: Paolo Bonzini <pbonzini@redhat.com>, qemu-devel@nongnu.org
References: <20220107114717.509665-1-pbonzini@redhat.com>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <5692c7c3-43a1-6f2e-c0be-8f11414006ab@linaro.org>
Date: Fri, 7 Jan 2022 11:59:28 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
MIME-Version: 1.0
In-Reply-To: <20220107114717.509665-1-pbonzini@redhat.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::530
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::530;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x530.google.com
X-Spam_score_int: -39
X-Spam_score: -4.0
X-Spam_bar: ----
X-Spam_report: (-4.0 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-2.691,
 RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793, SPF_HELO_NONE=0.001,
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 1/7/22 3:47 AM, Paolo Bonzini wrote:
> If roms/seabios/Makefile is not present, the configure script
> is not creating the roms/seabios directory anymore (commit
> 5dce7b8d8c, "configure: remove DIRS", 2021-12-18); thus, creating
> roms/seabios/config.mak fails.
> 
> The easiest thing to do is to not create the file, since it will not
> be used.
> 
> Signed-off-by: Paolo Bonzini<pbonzini@redhat.com>
> ---
>   configure | 6 ++++--
>   1 file changed, 4 insertions(+), 2 deletions(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~

