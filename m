Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 94A5F3F62C8
	for <lists+qemu-devel@lfdr.de>; Tue, 24 Aug 2021 18:37:22 +0200 (CEST)
Received: from localhost ([::1]:44108 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mIZQP-0005Oz-MP
	for lists+qemu-devel@lfdr.de; Tue, 24 Aug 2021 12:37:21 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:56092)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1mIZLR-0001GH-2B
 for qemu-devel@nongnu.org; Tue, 24 Aug 2021 12:32:13 -0400
Received: from mail-wm1-x32a.google.com ([2a00:1450:4864:20::32a]:41930)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1mIZLP-0000jw-73
 for qemu-devel@nongnu.org; Tue, 24 Aug 2021 12:32:12 -0400
Received: by mail-wm1-x32a.google.com with SMTP id
 c129-20020a1c35870000b02902e6b6135279so2758087wma.0
 for <qemu-devel@nongnu.org>; Tue, 24 Aug 2021 09:32:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=V5PaqHbKEndefQFOf8cjoZPIy0nEBXcgTVtcJQi5yzA=;
 b=hEozwYthUK9dXP8AvI+BQGPBLFGdG88/J9bhRsYugy12f/ZfIjm0XDX30KwxzjbN1f
 n/CMuqj30VgWT7kT6I+Hy/dHbbKezTfZG5ZhJcjBLc20EJQSWYAPhmIXpCVU1/6GPX7N
 L2c7kGTA7FfZPer4BvJQkPCrt3didxaBeYIOUfQ3o1GnCddSY/mFqoZkX7tPbqYr8nGY
 dr9uXOrniWUk8fp1Nk9mcwEj7RraKxFFJnCXCHicxkl8ttwVqak5mS/IPnXiLYj2yDEQ
 IQmGjxi2oYxSZlzTzjdDP3Td5b1qyI9jkwUdJv25RsJH1Svppmll1naeGkktL5hWYdMc
 MVng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:subject:to:cc:references:from:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=V5PaqHbKEndefQFOf8cjoZPIy0nEBXcgTVtcJQi5yzA=;
 b=VRU+ls/6Hjq6Ag0b00rgp7Ve/VI/6jKL7IUsiY1SdHbB/M+7Su6MpdCAndLLbbJr5k
 eZDWqApwD2yY312rIxC+2ancU6OUBe35AaxathsSafu4D5kOz83DpFW+2LUfdW2slIoj
 V4JwiOEk04rt3MTC+wpXDlRDr+nhVbMKFo7eZEKs4aFjXbqWfhVpsupssR4VZVzFJPOU
 HfBgbRYxSTfs6lMmcpnqPZnLUsP7dFpZd+K0N4mbSnd6QS4NZq3Z9NTudxsnr5GQGOUP
 2yQFgsnZONgTiA3plO92qQCa0BWbiPx3/MRkxBwVdOk4gjS9WLRBASBPGPZ9jizVW8Lx
 pePw==
X-Gm-Message-State: AOAM532Bwg6Iwgu1NcrLJ21ki+HUxQsQbc3i+IBiCHIEC3uae0zUPyBD
 kiRh9V5U1PSAEVPD8UoZ6eE=
X-Google-Smtp-Source: ABdhPJzVWPUX8RBao2HY/RXgSdcX4R6xqAwO3UsYUpkW75cwL3lMxF4xufF14QRyZCL/3grDBIo1vA==
X-Received: by 2002:a1c:a793:: with SMTP id q141mr4888490wme.157.1629822729607; 
 Tue, 24 Aug 2021 09:32:09 -0700 (PDT)
Received: from [192.168.1.36] (163.red-83-52-55.dynamicip.rima-tde.net.
 [83.52.55.163])
 by smtp.gmail.com with ESMTPSA id g138sm2167869wmg.34.2021.08.24.09.32.08
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 24 Aug 2021 09:32:09 -0700 (PDT)
Subject: Re: [PATCH v2 04/30] linux-user: Zero out target_siginfo_t in
 force_sig()
To: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org
References: <20210822035537.283193-1-richard.henderson@linaro.org>
 <20210822035537.283193-5-richard.henderson@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
Message-ID: <4885bafa-47d0-5fec-433f-a09ef2cab1b4@amsat.org>
Date: Tue, 24 Aug 2021 18:32:07 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20210822035537.283193-5-richard.henderson@linaro.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32a;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wm1-x32a.google.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.25,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.25, NICE_REPLY_A=-1.305,
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
Cc: peter.maydell@linaro.org, laurent@vivier.eu
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 8/22/21 5:55 AM, Richard Henderson wrote:
> From: Peter Maydell <peter.maydell@linaro.org>
> 
> The target_siginfo_t we populate in force_sig() will eventually
> get copied onto the target's stack. Zero it out so that any extra
> padding in the sifields union is consistently zero when the guest
> sees it.
> 
> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
> Message-Id: <20210813131809.28655-5-peter.maydell@linaro.org>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>  linux-user/signal.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)

Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>

