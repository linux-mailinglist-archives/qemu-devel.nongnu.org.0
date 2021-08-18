Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DDE483F0D74
	for <lists+qemu-devel@lfdr.de>; Wed, 18 Aug 2021 23:37:33 +0200 (CEST)
Received: from localhost ([::1]:57036 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mGTFc-0008R5-TP
	for lists+qemu-devel@lfdr.de; Wed, 18 Aug 2021 17:37:32 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57618)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1mGT93-0000Rq-WA
 for qemu-devel@nongnu.org; Wed, 18 Aug 2021 17:30:47 -0400
Received: from mail-wr1-x433.google.com ([2a00:1450:4864:20::433]:46024)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1mGT92-0006ja-1Y
 for qemu-devel@nongnu.org; Wed, 18 Aug 2021 17:30:45 -0400
Received: by mail-wr1-x433.google.com with SMTP id v4so5604583wro.12
 for <qemu-devel@nongnu.org>; Wed, 18 Aug 2021 14:30:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=C9JMpycgzxuKWuX/VleaWnGVKHt87D6w7BJt1gZRYq4=;
 b=YcpF3WpAmR+wluCFDO+q4oVGODEQ3reHvCArmK2+wW9TsXv/ZYz6UdMe7gCbr8RsQj
 8+vFPXJFq2SuNa7XyXLq7Rcykx3wLMF0BfkYdDbJP0wFY2i30dGRs3ARZbYara8qiqNE
 92BhRyAm9ywFMFbpoy4I0CCIvZXu/ewpKNgywDIeUNaDUXplRiR/ObgXOUe2oyB9+4eM
 a3wCTJ43qmER4STX0iaB32fLW+F19Y1x3oq2sxDB0qDIGfyi4sfWge1Pg811jU4kwkJy
 fll96VpMnRZ+QFpSjSWRoD7hN6pz9pTFeMC9cwUho4NVls4zDve1dQ/K8NL4YExU4Ze8
 2j3w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:subject:to:cc:references:from:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=C9JMpycgzxuKWuX/VleaWnGVKHt87D6w7BJt1gZRYq4=;
 b=pdyT7mzN5TkWmGv6MneMPCqc8GHECMGa8k0mmZoy5zcP/i0xgKYJSLJOGzPgWqrJBJ
 xG7wsQqgSJScr8OGCmCHfhj+iu2v6bYUPe6DEL2YgRhX7K4p9ipjJpGik8nDTm0Tiu9v
 mlpVfNhLaRTOtp9hsTC7OH2rzo2gLYKb1tMndCeu4eSV13Z5E0s3PjUUdMhqfjEuvGXE
 pSJokuGZ6XaCHG+EDtp7HcbjJrxP9+QCDt6OLAFTeU6ZSBGL1Rdw2o/9UM+b4J0LLsEp
 dIXBXBow52L7Q6bWKf1E7toTA4bLk9Wx3chp3jySIfkr+7iQdA+bIWqS0Y7LGigL8Ec6
 Zqag==
X-Gm-Message-State: AOAM533j4EqR752W0rUSSBWWPPFHRIfL5a77X3M6ftQmIgBLv429nSsm
 2LUIuRkW9yFCxEsrYdGb38k=
X-Google-Smtp-Source: ABdhPJzF21hapFPldNAXeVDSU7hGk8KJkd3ppd6NsWTNpSYhWKLqvEH8TjxIrsQXYbC46soC6Y+k9w==
X-Received: by 2002:a5d:5592:: with SMTP id i18mr12901994wrv.271.1629322242816; 
 Wed, 18 Aug 2021 14:30:42 -0700 (PDT)
Received: from [192.168.1.36] (163.red-83-52-55.dynamicip.rima-tde.net.
 [83.52.55.163])
 by smtp.gmail.com with ESMTPSA id m7sm5852923wmq.29.2021.08.18.14.30.41
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 18 Aug 2021 14:30:42 -0700 (PDT)
Subject: Re: [PATCH 2/5] target/mips: Replace GET_LMASK() macro by
 get_lmask(32) function
To: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org
References: <20210818164321.2474534-1-f4bug@amsat.org>
 <20210818164321.2474534-3-f4bug@amsat.org>
 <20f15f25-42c1-7f05-9ccd-53b0d796c201@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
Message-ID: <b544071c-30b5-ba61-e942-ab2c5d61e20a@amsat.org>
Date: Wed, 18 Aug 2021 23:30:40 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20f15f25-42c1-7f05-9ccd-53b0d796c201@linaro.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::433;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wr1-x433.google.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.249, NICE_REPLY_A=-1.961,
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
Cc: Thomas Huth <thuth@redhat.com>,
 Aleksandar Rikalo <aleksandar.rikalo@syrmia.com>,
 Aurelien Jarno <aurelien@aurel32.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 8/18/21 7:09 PM, Richard Henderson wrote:
> On 8/18/21 6:43 AM, Philippe Mathieu-Daudé wrote:
>> -    if (GET_LMASK(arg2) <= 2) {
>> +    if (get_lmask(env, arg2, 32) <= 2) {
> 
> Whatever you decide to do with respect to the previous patch, the result
> of get_lmask is constant across the function and should be computed only
> once.

Oops I missed that, thanks.

