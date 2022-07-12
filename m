Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E6F6157116F
	for <lists+qemu-devel@lfdr.de>; Tue, 12 Jul 2022 06:27:29 +0200 (CEST)
Received: from localhost ([::1]:59562 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oB7Ue-0005v2-H9
	for lists+qemu-devel@lfdr.de; Tue, 12 Jul 2022 00:27:28 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33000)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1oB7R0-0001sp-NQ
 for qemu-devel@nongnu.org; Tue, 12 Jul 2022 00:23:44 -0400
Received: from mail-pj1-x102b.google.com ([2607:f8b0:4864:20::102b]:47052)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1oB7Qz-0004w3-7U
 for qemu-devel@nongnu.org; Tue, 12 Jul 2022 00:23:42 -0400
Received: by mail-pj1-x102b.google.com with SMTP id
 t5-20020a17090a6a0500b001ef965b262eso6783635pjj.5
 for <qemu-devel@nongnu.org>; Mon, 11 Jul 2022 21:23:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=j9Yob4wV1UTBgrJLjZd4u76Zd+vn4Nt2nsMN1P8FO3E=;
 b=mXON4zts8HmI8s8cCihyRoRRbB59l2ZgK3OcQbfuTTuKcyXDWMk3mHxGMY9MIz5bAJ
 ZICh2SvAkL2FuUcXeOebUwXoFoIokeLRtZVHcOUB9rYJVL8SrMu4+yk/x23xPcZH9nIo
 SYR0VK8Y5D38umnODQVXt8sbF7nUQcMnwiVOUimr2+HRZt23Yvl84dB6Kn/LMc+2gvQK
 w1TTEI5sUc56UitHwtu5ITilZx7dYII1ThBGuqQ4PxkVPu4knN3LJrxwHkW99J1PQM9v
 GsTXUKVFvFqcpnmdQlK392w6Dg9cCl97n4c1cIV0N3xpJsKmCAX2cqisIjjTXJiF5C1A
 HS1w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=j9Yob4wV1UTBgrJLjZd4u76Zd+vn4Nt2nsMN1P8FO3E=;
 b=w/WdiMdxpIrENdH5+Yid0EhQ28R7hWRHw0eORWTiQcPnI3OMyKn5zQhYec7lPnHcxl
 EfYuhTuhRBtg+n22FCfaUPYDIQFrBhJ+Uh7NAOX32Mv30mB17FQmjenq5b6PvESqCrjz
 2dlGeNWjCahiqtuh3/HT/0sKoZoEtVd1jMpzXLg6s2OdoPXtOgFHnqPqTdLNDMd2nrAx
 ndncaJtgqz34TMPghaDVzvpegqG92ihQLZ8kxxAxNQLA0waHl5nnQW11HpwWAoqGcgbA
 nJQotscQRC0g79GXFCbItUdAsgs6yZEAzUaMalPaygn5TaWuKkeeoY0QMv6Rb3b6HoIu
 qIaw==
X-Gm-Message-State: AJIora/LVxd2lUl93MOw8Bw02GJYXHKe27uZzkPRQE73PDhVjzVN49M+
 YxlN4vyer02jwlxbsEY2p5IjBw==
X-Google-Smtp-Source: AGRyM1vCIMfaFPGRkzP2ECdsg52j2ZGhhooZgO+e1XtmqvYVnJgg2naY4uCq81Xi0PQPzlJm8a2r9w==
X-Received: by 2002:a17:90a:9bc5:b0:1ef:8084:ada1 with SMTP id
 b5-20020a17090a9bc500b001ef8084ada1mr2006769pjw.172.1657599817471; 
 Mon, 11 Jul 2022 21:23:37 -0700 (PDT)
Received: from [192.168.138.227] ([122.255.60.245])
 by smtp.gmail.com with ESMTPSA id
 f10-20020aa79d8a000000b005251f4596f0sm5421274pfq.107.2022.07.11.21.23.33
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 11 Jul 2022 21:23:37 -0700 (PDT)
Message-ID: <c56ebcdc-c238-8375-f6e5-a7f28c5a49ad@linaro.org>
Date: Tue, 12 Jul 2022 09:53:23 +0530
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.1
Subject: Re: [PATCH 1/3] target/s390x: fix handling of zeroes in vfmin/vfmax
Content-Language: en-US
To: Ilya Leoshkevich <iii@linux.ibm.com>, David Hildenbrand
 <david@redhat.com>, Cornelia Huck <cohuck@redhat.com>,
 Thomas Huth <thuth@redhat.com>, Aurelien Jarno <aurelien@aurel32.net>,
 Peter Maydell <peter.maydell@linaro.org>,
 =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>
Cc: qemu-s390x@nongnu.org, qemu-devel@nongnu.org,
 Christian Borntraeger <borntraeger@linux.ibm.com>,
 Ulrich Weigand <ulrich.weigand@de.ibm.com>
References: <20220712015717.3602602-1-iii@linux.ibm.com>
 <20220712015717.3602602-2-iii@linux.ibm.com>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20220712015717.3602602-2-iii@linux.ibm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::102b;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x102b.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
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

On 7/12/22 07:27, Ilya Leoshkevich wrote:
> vfmin_res() / vfmax_res() are trying to check whether a and b are both
> zeroes, but in reality they check that they are the same kind of zero.
> This causes incorrect results when comparing positive and negative
> zeroes.
> 
> Fixes: da4807527f3b ("s390x/tcg: Implement VECTOR FP (MAXIMUM|MINIMUM)")
> Co-developed-by: Ulrich Weigand<ulrich.weigand@de.ibm.com>
> Signed-off-by: Ilya Leoshkevich<iii@linux.ibm.com>
> ---
>   target/s390x/tcg/vec_fpu_helper.c | 4 ++--
>   1 file changed, 2 insertions(+), 2 deletions(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~

