Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id AE75A2D354A
	for <lists+qemu-devel@lfdr.de>; Tue,  8 Dec 2020 22:34:36 +0100 (CET)
Received: from localhost ([::1]:33938 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kmkcy-00010u-6T
	for lists+qemu-devel@lfdr.de; Tue, 08 Dec 2020 16:34:35 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:58336)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1kmjN8-0005WA-KG
 for qemu-devel@nongnu.org; Tue, 08 Dec 2020 15:14:08 -0500
Received: from mail-oi1-x243.google.com ([2607:f8b0:4864:20::243]:36502)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1kmjN6-0000mS-PC
 for qemu-devel@nongnu.org; Tue, 08 Dec 2020 15:14:06 -0500
Received: by mail-oi1-x243.google.com with SMTP id x16so20810226oic.3
 for <qemu-devel@nongnu.org>; Tue, 08 Dec 2020 12:14:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=xl/TS9x5xatLLtp4ATXfa719cnvfEWdJ9Gm0md/qKPw=;
 b=J3+CmK2eafK7N18BzEj/zP3nErGBSfj9prCIp2Ubs287l9XBUGc+NzPEYOLH53u1wW
 jQGSzJkxq+y/MYfWuED8HNRoK0eKJtuNaPpXNTi4t50mi1Rt0yvWNU8Ac8W9I0qGPkcB
 wUQ5gVjmKYRqtJhpc7Arp5sz1EtgQuJedb63/IJJueOQ5/i4CqpoxMz28EJLl5+nmi7p
 In95duhKnu6lPhHejowmKpmqUsKiXK5bb2qRDsOVHJbp2DSCVCcRO85HnNhQtK7yFtKM
 gx2OvAkJA7yrFw8S/Kx+Ko5XMI4FP41ZGmJviVYdRlGt8zupw5rqIf8HWjp6THY55vTq
 yioQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=xl/TS9x5xatLLtp4ATXfa719cnvfEWdJ9Gm0md/qKPw=;
 b=Olf+XtjdaS+BiIqnP/iyMNlAOw5sfWGpwxktyCIgYjfsl8pCpq+EGlAyiHVzTlDR9P
 C6Aa8j1XbgdHbHqnaBh0CidxsBnNrIy5bpxryG5bfzEitanXBsGOMDKXwejqrb1nWA6n
 gckW06Ms7jk+6sP43GgY14bE4/4GCdK9tYKjGo7rVX+e2Bb4OaXO9m0Sa9F2DPRMg1tR
 rolaXa9+fXzKmvJcCpenOh0by4um9CKWRIOYnyIhrpnuBvn4ARj0rdlyAQeybairEF1q
 c3ykaYTnwFfDsOA2Gv0B+wxzzSoseJObvPpfDAXU8ybb/OPX4V5F2zcNyI5NyfZy8+iy
 YWLQ==
X-Gm-Message-State: AOAM531Ie0RHkvckVnMsc+aLqp8siqosiFBqEiomCSv89WWjqQYsaTAd
 AgJ2WRG/xEa6QujQkmM45jM+Ng==
X-Google-Smtp-Source: ABdhPJx9T1X9v75PAb4XAibj52kj0WMaRbKxlRRwXjULYFCDJPWlf4lofu49NRzbhJBdsjEyrZPxDQ==
X-Received: by 2002:aca:b345:: with SMTP id c66mr4181226oif.55.1607458443012; 
 Tue, 08 Dec 2020 12:14:03 -0800 (PST)
Received: from [10.10.121.52] (fixed-187-189-51-144.totalplay.net.
 [187.189.51.144])
 by smtp.gmail.com with ESMTPSA id m109sm3611613otc.30.2020.12.08.12.14.01
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 08 Dec 2020 12:14:02 -0800 (PST)
Subject: Re: [PATCH 1/4] target/arm: Fixup special cross page case for sve
 continuous load/store
To: LIU Zhiwei <zhiwei_liu@c-sky.com>, qemu-devel@nongnu.org
References: <20201207044655.2312-1-zhiwei_liu@c-sky.com>
 <20201207044655.2312-2-zhiwei_liu@c-sky.com>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <db6fc9eb-0134-23d4-e0d9-55951e14c2c1@linaro.org>
Date: Tue, 8 Dec 2020 14:13:59 -0600
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20201207044655.2312-2-zhiwei_liu@c-sky.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::243;
 envelope-from=richard.henderson@linaro.org; helo=mail-oi1-x243.google.com
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
Cc: peter.maydell@linaro.org, alex.bennee@linaro.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 12/6/20 10:46 PM, LIU Zhiwei wrote:
> If the split element is also the first active element of the vector,
> mem_off_first[0] should equal to mem_off_split.
> 
> Signed-off-by: LIU Zhiwei <zhiwei_liu@c-sky.com>
> ---
>  target/arm/sve_helper.c | 7 ++++---
>  1 file changed, 4 insertions(+), 3 deletions(-)
> 
> diff --git a/target/arm/sve_helper.c b/target/arm/sve_helper.c
> index 5f037c3a8f..91d1d24725 100644
> --- a/target/arm/sve_helper.c
> +++ b/target/arm/sve_helper.c
> @@ -4282,9 +4282,10 @@ static bool sve_cont_ldst_pages(SVEContLdSt *info, SVEContFault fault,
>           * to generate faults for the second page.  For no-fault,
>           * we have work only if the second page is valid.
>           */
> -        if (info->mem_off_first[0] < info->mem_off_split) {
> -            nofault = FAULT_FIRST;
> -            have_work = false;
> +        if (info->mem_off_first[0] == info->mem_off_split) {
> +            if (nofault) {
> +                have_work = false;
> +            }

There are two separate bugs here.  The first is as you describe, and applies
only to the first line.

The second is the assignment of an enumerator to a boolean, and the incorrect
unconditional clearing of have_work.  The change could more consisely be

-  nofault = FAULT_FIRST;
-  have_work = false;
+  /* For nofault, we only have work if the second page is valid. */
+  have_work = !nofault;

We can either split the two changes, or improve the patch comment.


r~

