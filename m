Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 678ED452D8C
	for <lists+qemu-devel@lfdr.de>; Tue, 16 Nov 2021 10:08:50 +0100 (CET)
Received: from localhost ([::1]:35740 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mmuSP-0004QI-ID
	for lists+qemu-devel@lfdr.de; Tue, 16 Nov 2021 04:08:49 -0500
Received: from eggs.gnu.org ([209.51.188.92]:33448)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mmuRV-0003k9-Iv
 for qemu-devel@nongnu.org; Tue, 16 Nov 2021 04:07:54 -0500
Received: from [2a00:1450:4864:20::42e] (port=35637
 helo=mail-wr1-x42e.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mmuRT-0006co-Hs
 for qemu-devel@nongnu.org; Tue, 16 Nov 2021 04:07:53 -0500
Received: by mail-wr1-x42e.google.com with SMTP id i5so36149017wrb.2
 for <qemu-devel@nongnu.org>; Tue, 16 Nov 2021 01:07:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=n7jzbm2zZd/JfU5QzO7vB8C5QDCaxtrgmdbk9LVfjto=;
 b=nsxiC9S/Pazk4WZghnIajGs40W3qAeRepLyw/eCetNZvW44GPZvAmaqGOFdoJP6Lfo
 cNo1cb8b7xyRAphxW65MEnlSOYyWkXjKO2sIZkDTL4XcHZcz3CnkHVPghqqB1D+RggDv
 +6Zx8CkLyuygtuGvre1wskYNKfwhTExgwPaOsuunQzCfEQmbCoCsTKxorPMhkEie5iM6
 fz+aqfJdhqzQ5ZtarDrkFIZjjC0qqZKXAfhK1ZdRMKg0zosKWY+rIJDxpNmPHb8Fhh8v
 qfV8dU+xp7S7Ln80ZLu2fBm2crWXxF/Ireyczf3KahMyxKfTn9mF1aR+dOUg0/Fm6ThF
 vf+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=n7jzbm2zZd/JfU5QzO7vB8C5QDCaxtrgmdbk9LVfjto=;
 b=WHYKmdgkQaOECa7r57vaqBHU9wvrhaBs+fcLY/QSvkQI2/fPegVCwO7UD5Vv3Q2Tsp
 KObcWomYzbi0XibF05ukxQqT9sY6lYDYylFx5Aiir0YQqsuQbSJ7aoiZ52Ed9TlCWk8Z
 ZMIG3siHkoaFDx89QaXwBph+G+oWnDrAU1QLK2WQksJD2VR1Dg0t5tGBgkGDvoNJyvv4
 BCqV8aBKIrJPVa5qg5dqyibpKTyR/tz6E/nxs+x7Gs9iJLxxHP1gDSSUn9Y+e95tYRfW
 dH/2ebiUUCIAUGQ8E3Qqapi4hOf4yjo5F1FOYyWkay6qM5aMvI0Dc9gN84gD295Glcnv
 xrwQ==
X-Gm-Message-State: AOAM533VNqL31HW3v9XQfJ1X9L+t9CeCdJ29wKVxKApMCb+UdcU0BnK8
 wqX1E+KAlhNHE99smb3ztGlxYQ==
X-Google-Smtp-Source: ABdhPJxkS3iGztpBgd8gWy9wfihxzW5uDKd9MsJ8AFslnOB38xtky6qwk9HyNGmHAwvCyN7mMhArNg==
X-Received: by 2002:a5d:6da2:: with SMTP id u2mr6717836wrs.273.1637053666325; 
 Tue, 16 Nov 2021 01:07:46 -0800 (PST)
Received: from [192.168.8.105] (145.red-37-158-173.dynamicip.rima-tde.net.
 [37.158.173.145])
 by smtp.gmail.com with ESMTPSA id h15sm1999677wmq.32.2021.11.16.01.07.44
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 16 Nov 2021 01:07:45 -0800 (PST)
Subject: Re: [PATCH v1 3/6] tests/vm: don't build using TCG by default
To: =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 qemu-devel@nongnu.org
References: <20211115142915.3797652-1-alex.bennee@linaro.org>
 <20211115142915.3797652-4-alex.bennee@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <089d3574-68e0-1cbd-f6b9-6f954452acbd@linaro.org>
Date: Tue, 16 Nov 2021 10:07:41 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
MIME-Version: 1.0
In-Reply-To: <20211115142915.3797652-4-alex.bennee@linaro.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::42e
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::42e;
 envelope-from=richard.henderson@linaro.org; helo=mail-wr1-x42e.google.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-1.446,
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
Cc: fam@euphon.net, Thomas Huth <thuth@redhat.com>, berrange@redhat.com,
 f4bug@amsat.org, Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Willian Rampazzo <willianr@redhat.com>, stefanha@redhat.com, crosa@redhat.com,
 pbonzini@redhat.com, aurelien@aurel32.net
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 11/15/21 3:29 PM, Alex Bennée wrote:
> While it is useful to run these images using TCG their performance
> will not be anything like the native guests. Don't do it by default.
> 
> Fixes:https://gitlab.com/qemu-project/qemu/-/issues/393
> Signed-off-by: Alex Bennée<alex.bennee@linaro.org>
> ---
>   tests/vm/Makefile.include | 17 +++++++++++++----
>   1 file changed, 13 insertions(+), 4 deletions(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~

