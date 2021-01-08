Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2B1832EF860
	for <lists+qemu-devel@lfdr.de>; Fri,  8 Jan 2021 20:50:36 +0100 (CET)
Received: from localhost ([::1]:37352 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kxxmM-0000Bh-2b
	for lists+qemu-devel@lfdr.de; Fri, 08 Jan 2021 14:50:34 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:48892)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1kxxjG-0006gz-VU
 for qemu-devel@nongnu.org; Fri, 08 Jan 2021 14:47:23 -0500
Received: from mail-pj1-x102c.google.com ([2607:f8b0:4864:20::102c]:56279)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1kxxjE-0002wj-QK
 for qemu-devel@nongnu.org; Fri, 08 Jan 2021 14:47:22 -0500
Received: by mail-pj1-x102c.google.com with SMTP id p12so4196694pju.5
 for <qemu-devel@nongnu.org>; Fri, 08 Jan 2021 11:47:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=mzDF2cpJFX9MBz42160E8fOsXUPaDi1peA7NaIadYUA=;
 b=sP73nBUJgBncTHjUmwBoJwAiQ2FcjN874d+gUljeNhBqMJW5GXvALgJJUDJM5yjzGQ
 jfyvhTw2ktkdAVpNktKPwH9WqBQTDeeTKNjNYGzIbfFP8YZpR4YdhUeFhd5hHWhqWgUu
 6hyKiMyZjf9wiIDfNyyRwjjLFChZy+NHfWQ3fixJjbD7+DfSb7SHWOt7Ai6fs9twtSyb
 2wPYCGfUISWZoUMsFDy9jbG1wqKMOOtjI3GPrcxlSCUF2myCgZkmY71MY9cGyMQ/WxKL
 BupfgHYDS2lnQvgHE9BrzJaFMJ2JA2vtG27WlM7oWNExCYjTwd9dzDTXNv0Jisbm+Hpn
 ED8g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=mzDF2cpJFX9MBz42160E8fOsXUPaDi1peA7NaIadYUA=;
 b=W1J9G8cAZcu4p5bKH+OgUcaMq29VE0mVPZw8Yyw/smCGiwoNiw+34g2bejD2h2Y02d
 4WCxwKYyVdcV202wOYQ9TmHKn7EgdpzyEQeNUPuddbWZbMOm09AFaeZk/HTnYIp8y1ha
 pIwWMTeYW53Q82lGzfWy2goT1zHO8NcXJXgkelPCuwx7V6hJZxAtDFVc7jbBjPaN1i2/
 38fOOioIv4JKcNdhXv1vRr58y3BGKhKf2RYBXgZqCk2QhAbiUQWSBEVLcsQbkj0Ces2t
 80vnADfNFBILpTAn95+tlbfNn+33uw9a6bK7ZrSRljpdVi9DQxEMsB8H3tDrxszaPmpv
 CTRg==
X-Gm-Message-State: AOAM5308LFdtd7czcDkGwK8lBRXNhJPSLyBa7IX0fjU4xDxFpXfeTcvF
 2QyP+Ebycf8Xnq5Iomit0Gh+SA==
X-Google-Smtp-Source: ABdhPJxR6Vf+NpHBMjxJfuPqkmOElX4oeOAJU4H8mmpLT0h/6fS1DdhloSZgIzjOfWTUclNbKfv24Q==
X-Received: by 2002:a17:90a:bd13:: with SMTP id
 y19mr5207116pjr.24.1610135239358; 
 Fri, 08 Jan 2021 11:47:19 -0800 (PST)
Received: from ?IPv6:2607:fb90:58e:547c:94a4:bdef:7aa2:3a7c?
 ([2607:fb90:58e:547c:94a4:bdef:7aa2:3a7c])
 by smtp.gmail.com with ESMTPSA id d6sm5836739pjh.24.2021.01.08.11.47.17
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 08 Jan 2021 11:47:18 -0800 (PST)
Subject: Re: [PATCH v2 4/4] s390x/tcg: Ignore register content if b1/b2 is
 zero when handling EXECUTE
To: David Hildenbrand <david@redhat.com>, qemu-devel@nongnu.org
References: <20210108132049.8501-1-david@redhat.com>
 <20210108132049.8501-5-david@redhat.com>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <26d48678-1eb5-b9b2-433a-e277cf3146ce@linaro.org>
Date: Fri, 8 Jan 2021 09:47:14 -1000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20210108132049.8501-5-david@redhat.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::102c;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x102c.google.com
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
Cc: qemu-s390x@nongnu.org, Cornelia Huck <cohuck@redhat.com>,
 Thomas Huth <thuth@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 1/8/21 3:20 AM, David Hildenbrand wrote:
> In our EXECUTE fast path, we have to ignore the content of r0, if
> specified by b1 or b2.
> 
> Fixes: d376f123c7de ("target/s390x: Re-implement a few EXECUTE target insns directly")
> Signed-off-by: David Hildenbrand <david@redhat.com>
> ---
>  target/s390x/mem_helper.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~


