Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C5C91471BF2
	for <lists+qemu-devel@lfdr.de>; Sun, 12 Dec 2021 18:48:43 +0100 (CET)
Received: from localhost ([::1]:33626 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mwSxm-00008h-LM
	for lists+qemu-devel@lfdr.de; Sun, 12 Dec 2021 12:48:42 -0500
Received: from eggs.gnu.org ([209.51.188.92]:48446)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mwSvy-0007t8-RG
 for qemu-devel@nongnu.org; Sun, 12 Dec 2021 12:46:50 -0500
Received: from [2607:f8b0:4864:20::102f] (port=53955
 helo=mail-pj1-x102f.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mwSvx-0008G9-0A
 for qemu-devel@nongnu.org; Sun, 12 Dec 2021 12:46:50 -0500
Received: by mail-pj1-x102f.google.com with SMTP id iq11so10314882pjb.3
 for <qemu-devel@nongnu.org>; Sun, 12 Dec 2021 09:46:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=AKMOGb7yZGExG+0aoc1hwSTg7fxXwyQ5vqIvI95dVWg=;
 b=rQwI+KjxjyhwBmsBsBEphW/jwP0nhmmH2aLUKZjdkzIbUITR3i3VGHRi4r/XZGBapd
 +OBtCDRx2cdRSwA9R5xNPXMzfv8sue/6F81I8dNWAG2/wzExIEUnbxiRXYAdYUpWXtPb
 InI2yOGLjkR9yU88yczr9wpx90I2eabEpXoka3tvw2VYO5Ih308h7/1w0TgFp85uJiR0
 DP5rb3zk75AFYu21ZAAVOK/zwGcABTGcqr5MUMUxIkY8QXh3lKVuDM0ttvArc55y/oK0
 q2BlZMdj4XG6EpOWMrBF+gbInFL4VbBRPq83VvDlfPoo8bo7AeeuPvWWSpFx/gki47Qz
 ucvA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=AKMOGb7yZGExG+0aoc1hwSTg7fxXwyQ5vqIvI95dVWg=;
 b=u1Vo5hVsbx7ez5SWQtfIPg6X49SM9Ke8uPVPIkTmNOPzukb436YkBKuQH7CJlarskg
 7ApyBIBWGipjAfiNeauD6aqgTX2U4ID64I8Um7kPDCQTQAxnNjYd2tgdBfq5QBOSk6e/
 Aq+Vg+gJLnqtQ7U0rgVgjnYB6XHn+uWx3fuhyEhyLl4pB6L+yML6WyWsRqoORTbfDRs0
 o2qZZ1Kzm1WZh6cY5WqB1rxp9n27RU/YU/OZrbwYzlORauRE/glO8DErKPF9P9+yDFQG
 pkPsjqHYjxY/sY3YC/fbPWdNCqStrw47jgrWo0cJWch4ZkGZOb49SwQBadDj51K7HDvH
 gulA==
X-Gm-Message-State: AOAM530CNGD0mCrLH8aw3pG05Wx/H+czM+jbDtItlSD0WYJsgFyYpvD2
 tKs46BPeHKRx38l6L+ji2V3tqg==
X-Google-Smtp-Source: ABdhPJx80cNCNPa6sS3QVSBqD5JPccVaTvCQ8V8CCtyXrUVYaIL3DTMZg0HmAVyakEGmEkbFTu5YYg==
X-Received: by 2002:a17:902:e852:b0:142:19fe:982a with SMTP id
 t18-20020a170902e85200b0014219fe982amr91929254plg.13.1639331207458; 
 Sun, 12 Dec 2021 09:46:47 -0800 (PST)
Received: from [192.168.1.11] (174-21-75-75.tukw.qwest.net. [174.21.75.75])
 by smtp.gmail.com with ESMTPSA id h5sm9408195pfi.46.2021.12.12.09.46.46
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 12 Dec 2021 09:46:46 -0800 (PST)
Subject: Re: [PATCH 05/26] hw/intc/arm_gicv3_its: Don't return early in
 extract_table_params() loop
To: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org
References: <20211211191135.1764649-1-peter.maydell@linaro.org>
 <20211211191135.1764649-6-peter.maydell@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <c9b07fc5-4355-e89b-2859-66518acf687b@linaro.org>
Date: Sun, 12 Dec 2021 09:46:45 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
MIME-Version: 1.0
In-Reply-To: <20211211191135.1764649-6-peter.maydell@linaro.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::102f
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::102f;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x102f.google.com
X-Spam_score_int: -33
X-Spam_score: -3.4
X-Spam_bar: ---
X-Spam_report: (-3.4 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-2.051,
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
Cc: Shashi Mallela <shashi.mallela@linaro.org>,
 =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 12/11/21 11:11 AM, Peter Maydell wrote:
> In extract_table_params() we process each GITS_BASER<n> register.  If
> the register's Valid bit is not set, this means there is no
> in-guest-memory table and so we should not try to interpret the other
> fields in the register.  This was incorrectly coded as a 'return'
> rather than a 'break', so instead of looping round to process the
> next GITS_BASER<n> we would stop entirely, treating any later tables
> as being not valid also.
> 
> This has no real guest-visible effects because (since we don't have
> GITS_TYPER.HCC != 0) the guest must in any case set up all the
> GITS_BASER<n> to point to valid tables, so this only happens in an
> odd misbehaving-guest corner case.
> 
> Fix the check to 'break', so that we leave the case statement and
> loop back around to the next GITS_BASER<n>.
> 
> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
> ---
> I suspect this was an accidental result from a refactoring at
> some point in the development of the ITS code.

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~

