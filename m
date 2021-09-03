Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id F0D99400762
	for <lists+qemu-devel@lfdr.de>; Fri,  3 Sep 2021 23:17:40 +0200 (CEST)
Received: from localhost ([::1]:40654 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mMGZA-0000wa-1U
	for lists+qemu-devel@lfdr.de; Fri, 03 Sep 2021 17:17:40 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59814)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mMGWC-0005Az-3I
 for qemu-devel@nongnu.org; Fri, 03 Sep 2021 17:14:36 -0400
Received: from mail-wm1-x330.google.com ([2a00:1450:4864:20::330]:52030)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mMGW9-0003NP-Ru
 for qemu-devel@nongnu.org; Fri, 03 Sep 2021 17:14:35 -0400
Received: by mail-wm1-x330.google.com with SMTP id u15so158162wmj.1
 for <qemu-devel@nongnu.org>; Fri, 03 Sep 2021 14:14:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=c6nxYpmamXey7IyT4t3Zgq7aQkF4HPryP+sT8gKzGrc=;
 b=jqrDZvdB4tcV7z77Mad5GECy23Hog2Sl6KiEdoNhPZfJn46hV1zBkNPvyUIWH5nuww
 oElI30slZ/+N8gZmkB56MMGZMvpHSInoVljl3TCPL2H3M/I1D5H0v48gkKxutD1XX/hH
 C8tENZbum5wK9bYNN501I/6wWzBD4mWlrHmD9KT3qdC3XT5TS5q5KBwEdacndq1gciAE
 qyazyWaYy2mZeBFsw9LZ+DCDHAjm1+/lSFQEllPn4yckJdLQGW+8QY37CwP0ylHR8ein
 aPd/hFmn4y9OKyq1sTjqAb6dL5paT+Q0nQc2h6y465+d66yYmlCoSaZcBiJ9jzoWL1em
 4vWA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=c6nxYpmamXey7IyT4t3Zgq7aQkF4HPryP+sT8gKzGrc=;
 b=MlHfwikGqcMLtkrMiqJpAKVy/ZkWXz0cp+4uOz9RFXjCQCZ2OnqTT3Pvd0B9cPXlYq
 BvL1GjC9DkPmqNHgA2WR0WvMo/UNth9UW7jQ4MnDi9gNCiFZx/uVvfakJzaNWEAUI1b5
 bcCnwXdHzUAgcf5NneOTNW6Tsk3atK1lN9W+NXx4E5c7fFEx3JUxqP8a0RXfiDctVr6D
 cZzBxsDQY7QZ0/5hUjOIR2Y0FOPttEj7d4gfS3qoNnzSbCf04u1YzqfaApdsGXXXrXQz
 xS7xNPrLz7q5zcQnMcTMhb44nBZg9ogD/yDz1jASyvpOY8A6dyMT8oSiYZkn2SasgluB
 UryQ==
X-Gm-Message-State: AOAM531y/ZlONnaXvL6YyFFJKpJt1o2EWJ+ECgs7MTSaZL2rSIO4agOn
 3JsC3Xz1567kJ4jxsCrMDTS29Q==
X-Google-Smtp-Source: ABdhPJxFns6wRtG3od3wc4YkMS3T7xDtvnISw46maIsNZFCxNx2ZeXIJif7zBZeHnNU0T6z2NdqKQw==
X-Received: by 2002:a7b:c850:: with SMTP id c16mr646637wml.22.1630703672210;
 Fri, 03 Sep 2021 14:14:32 -0700 (PDT)
Received: from [192.168.8.107] (190.red-2-142-216.dynamicip.rima-tde.net.
 [2.142.216.190])
 by smtp.gmail.com with ESMTPSA id y11sm407769wru.0.2021.09.03.14.14.31
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 03 Sep 2021 14:14:31 -0700 (PDT)
Subject: Re: [PATCH v2 11/19] libdecnumber: Introduce decNumberIntegralToInt128
To: Luis Pires <luis.pires@eldorado.org.br>, qemu-devel@nongnu.org,
 qemu-ppc@nongnu.org
References: <20210831164007.297781-1-luis.pires@eldorado.org.br>
 <20210831164007.297781-12-luis.pires@eldorado.org.br>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <e08391b3-2663-92c7-c3a0-7919da1339ad@linaro.org>
Date: Fri, 3 Sep 2021 23:14:29 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <20210831164007.297781-12-luis.pires@eldorado.org.br>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2a00:1450:4864:20::330;
 envelope-from=richard.henderson@linaro.org; helo=mail-wm1-x330.google.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.888,
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
Cc: groug@kaod.org, david@gibson.dropbear.id.au
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 8/31/21 6:39 PM, Luis Pires wrote:
> +    if (decNumberIsSpecial(dn) || (dn->exponent < 0) ||
> +       (dn->digits + dn->exponent > 39)) {
> +        goto Invalid;
> +    } else {

No need for the goto and the else.  Pick one.  Probably the goto, since you need it anyway 
for the other overflow cases.

Otherwise,
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>


r~

