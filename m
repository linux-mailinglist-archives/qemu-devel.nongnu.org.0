Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D3555696EB5
	for <lists+qemu-devel@lfdr.de>; Tue, 14 Feb 2023 21:54:25 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pS2Im-0004Iw-IJ; Tue, 14 Feb 2023 15:53:24 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pS2Ik-0004HD-T0
 for qemu-devel@nongnu.org; Tue, 14 Feb 2023 15:53:22 -0500
Received: from mail-pj1-x1036.google.com ([2607:f8b0:4864:20::1036])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pS2Ii-0006JH-Sh
 for qemu-devel@nongnu.org; Tue, 14 Feb 2023 15:53:22 -0500
Received: by mail-pj1-x1036.google.com with SMTP id
 oa11-20020a17090b1bcb00b002341a2656e5so5097711pjb.1
 for <qemu-devel@nongnu.org>; Tue, 14 Feb 2023 12:53:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=LcbXsMw8Ioho1gLdjYtQ1KhMADyHlbcKI5jxxSF04DY=;
 b=JfTjAmt2rferzn+u27GIgxuhkmrLg/GSH7P710S8UHkfrB3T81whUwkESesUwybewy
 00RDTJtxUgjPkRNfLVuY3Hz/+wATLqAqwjV7E60bqDP2TMXpYwdCQwqvI0lbY9SfTHbV
 RcNsnbYbFImYLqVp8o/YD7YIEypWC/yNwiGTrECsmkFX5dKhhuohW+/CsDVTIALDeF44
 bMqgQHuF3ch+qFtBwQb2SjAitdmdL2ZfLRDcCfgC6z0DU/1p88byS+L2N11o056PB7uL
 5pzqjG5mXskDMWnMGwR1pZ9Jd1rqaIwsjybR8WF8WidvOhxXqmPdILtTPzRN3MivYedC
 ZfSw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=LcbXsMw8Ioho1gLdjYtQ1KhMADyHlbcKI5jxxSF04DY=;
 b=HqcYYme5xna+vie6402fb09J+hkQBdW7auxRmPuBGWm//IKTMKh8I8CBBPpRPae3du
 jz6wGGXrpfYxNnMha7iKZcxz7jQnp6LEN6ZLnN4TiO2R9bdhWp/RhsPLTtiH7HqX3Nrb
 RpCMT+nyWJSu/aB8kgx/smMCxswkLqcvJX9SxatGF1gQUrN25ogzHovV1V2MP11TFbjG
 TZU8Petquwlt15iZx7g+IfSijqiIwVuoVl+lzxpX13czzyHO9AAkDNAKXQKCAD9Yo/m+
 4b2C6gb36mPh+Xrz2kwpTrRLfL2BAvpxQa93I9FoM0GkVpU7qR84uWy0Y87PAFeTrjkq
 H2Kw==
X-Gm-Message-State: AO0yUKXNgoeZQ5o0NJ7fBGZMPvRYQWbCbEW3iud+5lLIB/8nygTAosRi
 TUQqSyot69IXV+y5qFtX4p7Tyw==
X-Google-Smtp-Source: AK7set9D6C1Ro6yJMYUNEK8L9m5zXbOyhgUpi0Z/US/sBvECqn8fu6FXM3Oz5wQqfU5dND9q5s3c9g==
X-Received: by 2002:a17:903:11c6:b0:19a:7ef5:4c98 with SMTP id
 q6-20020a17090311c600b0019a7ef54c98mr64144plh.2.1676407999318; 
 Tue, 14 Feb 2023 12:53:19 -0800 (PST)
Received: from [192.168.192.227] (rrcs-74-87-59-234.west.biz.rr.com.
 [74.87.59.234]) by smtp.gmail.com with ESMTPSA id
 k22-20020a170902761600b00196217f1219sm10632998pll.70.2023.02.14.12.53.17
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 14 Feb 2023 12:53:18 -0800 (PST)
Message-ID: <22c03784-05b7-7e8a-6c7f-83e0ed76794e@linaro.org>
Date: Tue, 14 Feb 2023 10:53:14 -1000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.1
Subject: Re: [PATCH v2 05/12] bsd-user: Helper routines oidfmt
Content-Language: en-US
To: Warner Losh <imp@bsdimp.com>, qemu-devel@nongnu.org
Cc: =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 Paolo Bonzini <pbonzini@redhat.com>, kevans@freebsd.org, f4bug@amsat.org,
 Thomas Huth <thuth@redhat.com>, Stacey Son <sson@FreeBSD.org>,
 Sean Bruno <sbruno@FreeBSD.org>, Juergen Lock <nox@jelal.kn-bremen.de>,
 Raphael Kubo da Costa <rakuco@FreeBSD.org>
References: <20230214002757.99240-1-imp@bsdimp.com>
 <20230214002757.99240-6-imp@bsdimp.com>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20230214002757.99240-6-imp@bsdimp.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1036;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1036.google.com
X-Spam_score_int: -24
X-Spam_score: -2.5
X-Spam_bar: --
X-Spam_report: (-2.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.35,
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

On 2/13/23 14:27, Warner Losh wrote:
> From: Stacey Son<sson@FreeBSD.org>
> 
> oidfmt uses undocumented system call to get the type of the sysctl.
> 
> Co-Authored-by: Sean Bruno<sbruno@FreeBSD.org>
> Signed-off-by: Sean Bruno<sbruno@FreeBSD.org>
> Co-Authored-by: Juergen Lock<nox@jelal.kn-bremen.de>
> Signed-off-by: Juergen Lock<nox@jelal.kn-bremen.de>
> Co-Authored-by: Raphael Kubo da Costa<rakuco@FreeBSD.org>
> Signed-off-by: Raphael Kubo da Costa<rakuco@FreeBSD.org>
> Signed-off-by: Stacey Son<sson@FreeBSD.org>
> Reviewed-by: Warner Losh<imp@bsdimp.com>
> Signed-off-by: Warner Losh<imp@bsdimp.com>
> ---
>   bsd-user/freebsd/os-sys.c | 32 ++++++++++++++++++++++++++++++++
>   1 file changed, 32 insertions(+)

Acked-by: Richard Henderson <richard.henderson@linaro.org>

r~

