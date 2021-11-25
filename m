Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6C77845D821
	for <lists+qemu-devel@lfdr.de>; Thu, 25 Nov 2021 11:19:29 +0100 (CET)
Received: from localhost ([::1]:53250 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mqBqi-0004d8-Fg
	for lists+qemu-devel@lfdr.de; Thu, 25 Nov 2021 05:19:28 -0500
Received: from eggs.gnu.org ([209.51.188.92]:39122)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mqBoi-0001R5-J9
 for qemu-devel@nongnu.org; Thu, 25 Nov 2021 05:17:25 -0500
Received: from [2a00:1450:4864:20::32e] (port=34629
 helo=mail-wm1-x32e.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mqBod-0000fA-2k
 for qemu-devel@nongnu.org; Thu, 25 Nov 2021 05:17:20 -0500
Received: by mail-wm1-x32e.google.com with SMTP id
 m25-20020a7bcb99000000b0033aa12cdd33so640775wmi.1
 for <qemu-devel@nongnu.org>; Thu, 25 Nov 2021 02:17:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=SsDwkVsOXqtDAJrN+hipUMt37hnVVBXQM1r51CqIidY=;
 b=R2uudkw2AE7x2Z/52oAgD/+O+f+qFDGFIXrgKWSd3caWW/HnCqqJR8OWnCxgXC7s3N
 vi0gSArzBfL5GKUPc7z581JfFpcg9bXu4oqGCwGdk8n218z4w35s6PiyPkrqx+kBRHH3
 jgCRHZ7un7tzmrgpzOljOtn9BRvFw8SKVur3IthqXDpKCry6cB915wHka4zJQaPcjhe8
 3P+LcATe2AIfWokN7ZmhkDneEKIzK33a1cJoWgKTVPSVK6Et9lh9ldYdur+GDZDyfIsc
 4mTdhYIRqmzWi7TMPz5CeHIoGUlctDJg95EEOPi+Vu1vd+vzU3bousa3SvE+8YrmxQRy
 vPYg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=SsDwkVsOXqtDAJrN+hipUMt37hnVVBXQM1r51CqIidY=;
 b=z6u3zCIyqJkK3UttX+CKUsMNjZnJLX5YFZwBW1HNRPORLkZhS+C8GnSWyXNVkz9voO
 XvVAFQZT1D2QqA+7bZWAE4AojqRrkCH/DVcs047bh/Awl24JKybLJxMOdr4RJLdig4Ch
 sgZ9/9h8po+YZYYBdz3XFwvD1i55HoUdtHMfOMfBlE0ZdsBl5ziKAO8OJmNI1+GR3aAd
 zcDAW7Yky4W0ji4b19CoOHCKcRQbXnKOANtyh4MGnMpfNb2liAjz66cmfriJvyBphEEa
 0jLzeCcMNwLeH8otQA5raYj+pa9PtsrnD1sax6igFXzRbfzqmgdyB9gkenLT5XkCjpGY
 J67w==
X-Gm-Message-State: AOAM533WQ7gMydLJDsS4MhiPJlhtDuchAq7pZXF8zC1AraYVuPqPha+0
 tE4uKNmeM9JzSkUb7eKSkzBeEQ==
X-Google-Smtp-Source: ABdhPJzvI6+rukbMv8DJyqjdDPW2H1eFy8XnNL5carag8xxiy+Y1czbPCJ5Qc58urrijpcIlKwL8xw==
X-Received: by 2002:a1c:f60a:: with SMTP id w10mr5696133wmc.53.1637835437571; 
 Thu, 25 Nov 2021 02:17:17 -0800 (PST)
Received: from [192.168.1.147] (149.164.14.37.dynamic.jazztel.es.
 [37.14.164.149])
 by smtp.gmail.com with ESMTPSA id x4sm7119183wmi.3.2021.11.25.02.17.16
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 25 Nov 2021 02:17:17 -0800 (PST)
Subject: Re: [PATCH v3 1/3] target/ppc: Fixed call to deferred exception
To: "Lucas Mateus Castro (alqotel)" <lucas.araujo@eldorado.org.br>,
 qemu-devel@nongnu.org, qemu-ppc@nongnu.org
References: <20211124172523.3598396-1-lucas.araujo@eldorado.org.br>
 <20211124172523.3598396-2-lucas.araujo@eldorado.org.br>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <ed1e603b-0fad-5079-a8f7-8482e494c729@linaro.org>
Date: Thu, 25 Nov 2021 11:17:13 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
MIME-Version: 1.0
In-Reply-To: <20211124172523.3598396-2-lucas.araujo@eldorado.org.br>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::32e
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::32e;
 envelope-from=richard.henderson@linaro.org; helo=mail-wm1-x32e.google.com
X-Spam_score_int: -53
X-Spam_score: -5.4
X-Spam_bar: -----
X-Spam_report: (-5.4 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-4.1,
 PDS_HP_HELO_NORDNS=0.001, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: danielhb413@gmail.com, mark.cave-ayland@ilande.co.uk, pc@us.ibm.com,
 david@gibson.dropbear.id.au, matheus.ferst@eldorado.org.br, clg@kaod.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 11/24/21 6:25 PM, Lucas Mateus Castro (alqotel) wrote:
> mtfsf, mtfsfi and mtfsb1 instructions call helper_float_check_status
> after updating the value of FPSCR, but helper_float_check_status
> checks fp_status and fp_status isn't updated based on FPSCR and
> since the value of fp_status is reset earlier in the instruction,
> it's always 0.
> 
> Because of this helper_float_check_status would change the FI bit to 0
> as this bit checks if the last operation was inexact and
> float_flag_inexact is always 0.
> 
> These instructions also don't throw exceptions correctly since
> helper_float_check_status throw exceptions based on fp_status.
> 
> This commit created a new helper, helper_fpscr_check_status that checks
> FPSCR value instead of fp_status and checks for a larger variety of
> exceptions than do_float_check_status.
> 
> Since fp_status isn't used, gen_reset_fpstatus() was removed.
> 
> The hardware used to compare QEMU's behavior to was a Power9.
> 
> Signed-off-by: Lucas Mateus Castro (alqotel) <lucas.araujo@eldorado.org.br>
> ---
>   target/ppc/fpu_helper.c            | 48 ++++++++++++++++++++++++++++++
>   target/ppc/helper.h                |  1 +
>   target/ppc/translate/fp-impl.c.inc |  9 ++----
>   3 files changed, 52 insertions(+), 6 deletions(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>


r~

