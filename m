Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D55D92EFB42
	for <lists+qemu-devel@lfdr.de>; Fri,  8 Jan 2021 23:35:09 +0100 (CET)
Received: from localhost ([::1]:47846 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ky0Lc-0002g0-VX
	for lists+qemu-devel@lfdr.de; Fri, 08 Jan 2021 17:35:08 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:50550)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1ky0KE-0001je-Ox
 for qemu-devel@nongnu.org; Fri, 08 Jan 2021 17:33:43 -0500
Received: from mail-pj1-x1031.google.com ([2607:f8b0:4864:20::1031]:50975)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1ky0KC-0005GC-3d
 for qemu-devel@nongnu.org; Fri, 08 Jan 2021 17:33:42 -0500
Received: by mail-pj1-x1031.google.com with SMTP id lj6so4428318pjb.0
 for <qemu-devel@nongnu.org>; Fri, 08 Jan 2021 14:33:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=0hER6CK+Qtb8Bjy/Ktns56cKHbxMqNzSvuPBlZa/m2g=;
 b=lRgKeMoQxf1w+CpNs6J7qf+2YIQsNq0DcBXf6uKWsLR4pVyH+LRIGSVJkFV15LxVHC
 Ehkm86CHSviIW9AGi4x2lxDFknpLhLqdsCX+PI4LoUQ4v7WKnZDd4JplUhpTPIlNs765
 9BktfK0Oyc0wR70brDPFwf+eFeBFbNgdbhN77rcwGdTmH4mCc4bLeqT1yMpm51epJUFx
 lDIpoUgmbCTL8Nlsmix+e1RpWgq7Gdx0Ch74ajRDAVHH+phJ4kP+5gVmHEOsQTvcSSIm
 nASKxD/5OSYKu6Q5SB9RZDtthmo6uccx9evyRXDgaIpBdbkxJInH+J9d+V26+a6ess0z
 Csig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=0hER6CK+Qtb8Bjy/Ktns56cKHbxMqNzSvuPBlZa/m2g=;
 b=ae+2MGQjkluqvO+PjCwGkkC2f4wEWz43Ej44U5W3KoLhSBZcojUgt+sw3D23IlYvXF
 jtjoHbIb71E9ZnHmXffiopJ24d2CWTvIeSj+0weg0WJIX5O+0PjlRqr8sWYduJ7XuLJ+
 m0BRd/OL9sp4uKxRhA3n09SSaHV3QxmwCNfjWLf5WYEKrSDy83JLTLHNnP9KzGg4neHs
 uQIk4LJtZoq95wM2SBMWmQmJLZSvQZ2ovD5fA+nzN8zrkGnLs+3sRbiBQaB/ZA/DffXf
 MVHoxMQ1WngZTdMbBWr1f7UnsME8UbJQTTZIkZ5V4jOM0TPvbOAofoxG0F+qQGk5GMTk
 oQYQ==
X-Gm-Message-State: AOAM532tlIc1pRpBIRCeMG6xXuB3hnY7DdqTFkOY1aWJaYzqYG2T6kmc
 1xXrOJIfih8bm/J0bcPAK+pRSA==
X-Google-Smtp-Source: ABdhPJwNxpeTF6Y+Kf/tStmPqm8vDtisGR1wUOXYx+zC8MvWl2tNSUIqQYz9g5fi3+n9/oC1tZ7yzQ==
X-Received: by 2002:a17:902:9896:b029:dc:3306:8aa7 with SMTP id
 s22-20020a1709029896b02900dc33068aa7mr9165927plp.6.1610145218302; 
 Fri, 08 Jan 2021 14:33:38 -0800 (PST)
Received: from [10.25.18.7] (rrcs-173-197-107-21.west.biz.rr.com.
 [173.197.107.21])
 by smtp.gmail.com with ESMTPSA id x1sm11171526pgj.37.2021.01.08.14.33.36
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 08 Jan 2021 14:33:37 -0800 (PST)
Subject: Re: [PATCH v3 3/6] target/arm: make ARMCPU.ctr 64-bit
To: Leif Lindholm <leif@nuviainc.com>, qemu-devel@nongnu.org
References: <20210108185154.8108-1-leif@nuviainc.com>
 <20210108185154.8108-4-leif@nuviainc.com>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <49ed5e5a-411d-2947-40d7-844554770519@linaro.org>
Date: Fri, 8 Jan 2021 12:33:33 -1000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20210108185154.8108-4-leif@nuviainc.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1031;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1031.google.com
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
Cc: Laurent Desnogues <laurent.desnogues@gmail.com>,
 Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 1/8/21 8:51 AM, Leif Lindholm wrote:
> When FEAT_MTE is implemented, the AArch64 view of CTR_EL0 adds the
> TminLine field in bits [37:32].
> Extend the ctr field to be able to hold this context.
> 
> Signed-off-by: Leif Lindholm <leif@nuviainc.com>
> ---
>  target/arm/cpu.h | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~


