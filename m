Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DBCB23210C9
	for <lists+qemu-devel@lfdr.de>; Mon, 22 Feb 2021 07:19:03 +0100 (CET)
Received: from localhost ([::1]:50476 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lE4Yg-0007Po-V3
	for lists+qemu-devel@lfdr.de; Mon, 22 Feb 2021 01:19:02 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:48264)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lE4Wa-0006SN-HG
 for qemu-devel@nongnu.org; Mon, 22 Feb 2021 01:16:52 -0500
Received: from mail-pg1-x530.google.com ([2607:f8b0:4864:20::530]:37815)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lE4WY-00054N-LA
 for qemu-devel@nongnu.org; Mon, 22 Feb 2021 01:16:52 -0500
Received: by mail-pg1-x530.google.com with SMTP id 23so1482923pgg.4
 for <qemu-devel@nongnu.org>; Sun, 21 Feb 2021 22:16:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=TdIVrUpMNekCxD7pa1gpRHeC5Ck+cGCLQOkmnu101CM=;
 b=OT2ia8+sHF6ltLgWSHaTziAIloFWwn5CHZkaUercuxA9LI3YPbzaXj/BX+WaCl/GpT
 g35Js7W7hh9KxY72VrElgEAUBuWd98UgLfR/BJ7vfc4DJC848F3kEyPKaFfcuIDHOHKp
 gFCFcBz+uGK1OdclcvHBjvysYOQ3zQbZ4IKJmMzB+UXTeiIUka2XfSt5X6klTfIVSkvk
 KGy5qf2LgIebG+qjmuEcgGqvgGH4PpXne4JzFc7RR6cidB/oIfDobyloQcaaJj7JeqP5
 a6WDqKGBxls6NOAu6eDIpNVaFvvNABmbAtEGlDM9qirvXrWDOQIoB4Qbt7h+YRAr0aR9
 CT2g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=TdIVrUpMNekCxD7pa1gpRHeC5Ck+cGCLQOkmnu101CM=;
 b=D1rrtlYZm4qoBUO37aH+tg6iw7g7BW+btkxjAbn8PhYY4hW/vwiiN+NmrbhWSRp+68
 1OGJ/GlvGBKpJvwSopr31TaMK1afNVXs+8zlHY0ucnGgiyWEyM5kKNsxMRRFS7xXc+4k
 Kcn0Ur98daMRHqv5L4o8vijaae80El8iu02+psphloPCzRNDAFrcWE94kYf1djmW96+u
 MJQG7QALK64L4Vi1j7ERk+NEWwYwJ1zQOXyCkDkWWbR+KIULzJhq1J+4bwxaAhKnYYZK
 S830La+9xo+Z590r2+J21SELJ8iBGIW7LsGrj1KGqX/3i0H2uKA3jvExr+AvbAQV8tNM
 /j4w==
X-Gm-Message-State: AOAM5335kpf1hyEikZkExKmhtJqHAX/8ATRc0ZRruDywt+75xiivMrxV
 TM4otRkHWnZ8CHYDXstlXmU+PSLAAe0Eew==
X-Google-Smtp-Source: ABdhPJwBpiV/DI3vu6f2YiiOyzzWKqe+5sTGJL9Ts2tkWY+ahOJi1dr4T6kDAPJK5ykQgyA7CSWygg==
X-Received: by 2002:a63:215f:: with SMTP id s31mr18568616pgm.146.1613974609354; 
 Sun, 21 Feb 2021 22:16:49 -0800 (PST)
Received: from [192.168.1.11] (174-21-84-25.tukw.qwest.net. [174.21.84.25])
 by smtp.gmail.com with ESMTPSA id q2sm6465280pfl.158.2021.02.21.22.16.48
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 21 Feb 2021 22:16:49 -0800 (PST)
Subject: Re: [RFC v1 03/38] arm: tcg: only build under CONFIG_TCG
To: Claudio Fontana <cfontana@suse.de>
References: <20210221092449.7545-1-cfontana@suse.de>
 <20210221092449.7545-4-cfontana@suse.de>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <527861be-7ac5-a8cd-c4e0-1cb95709533b@linaro.org>
Date: Sun, 21 Feb 2021 22:16:47 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20210221092449.7545-4-cfontana@suse.de>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::530;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x530.google.com
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
Cc: qemu-devel <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 2/21/21 1:24 AM, Claudio Fontana wrote:
> Signed-off-by: Claudio Fontana <cfontana@suse.de>
> ---
>  target/arm/tcg/meson.build | 6 +++---
>  1 file changed, 3 insertions(+), 3 deletions(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~


