Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C36F11EC832
	for <lists+qemu-devel@lfdr.de>; Wed,  3 Jun 2020 06:08:18 +0200 (CEST)
Received: from localhost ([::1]:56028 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jgKhN-0006dl-CH
	for lists+qemu-devel@lfdr.de; Wed, 03 Jun 2020 00:08:17 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:46458)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1jgKgV-000679-NF
 for qemu-devel@nongnu.org; Wed, 03 Jun 2020 00:07:23 -0400
Received: from mail-pf1-x443.google.com ([2607:f8b0:4864:20::443]:44447)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1jgKgU-00044m-Fo
 for qemu-devel@nongnu.org; Wed, 03 Jun 2020 00:07:23 -0400
Received: by mail-pf1-x443.google.com with SMTP id f3so683567pfd.11
 for <qemu-devel@nongnu.org>; Tue, 02 Jun 2020 21:07:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=g24X9QcOYtd4hp5yp/fnc6wO6BCI6cOwSuUAaUtuqSE=;
 b=UwFOyr4OcP/PjJAZTI2gAkhVTpzlbnIZmxsEBMX4O8U0AJHEc9uetESlTSLN72WA/p
 mgD+TA+PyGGpiKXMoA84Ldwkg7oyXof/P1LTxzGnmHIcQGghZo0Mm1PMNVVCIbHZk1Cu
 pmIehnvHJEvSMeFGjiqCUc6cvtJratS1k5VIx3eZDEFaEPkpXcTaL6RndA0vQU9LBVSN
 2RN2nTTTumv0S/MOO5XUg/8KndLHf+/yImohz0ohUKLT8p2OmtOHOorK2owGjTaI3URO
 uM2TdR34dFCzNrjvXXlPsXOGjanUNdBIeEueE9fANBIY9naZ1tqtDEuB3I32ZKJV681y
 9bXw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=g24X9QcOYtd4hp5yp/fnc6wO6BCI6cOwSuUAaUtuqSE=;
 b=gKFwuqNLSq7JesDeYjRMl7Z1E4FTmTX/VIuuRzjxKJksqCdWMdIh5brKyRA7CbdBaX
 ZTU9fG9pxIrvelWNoiB7osCBNo05sA1ZcqpHnMk3AXPV/vguGC5TX2DsBqfHJeTu5Aa0
 pBD+Kf/IwJMpij16ufUTHbWKMMY98e3UZ/4Wn51iuvuCsGaZxhv1so46wJELWMsEVpPw
 cX/lyCYrdu5oLnwTfqhoXVIYLBKZbiH5/pEItpWiMaWMplc0m0Imp7kslzeuZ0373mtZ
 Tn55zs1h777XnzmDhKYaJ1fuRlFHuLdZ/d0Z6GRZCRtGlTCY5qiT0Q7cogDed1E81AEw
 p4lA==
X-Gm-Message-State: AOAM531dpiEb3XqT311aNL9HeE64/uOr8Djl8NrnmL7GIgAcgyIfJBHw
 gPWHcQ7d2JWHSvmhtrUZxZwEIw==
X-Google-Smtp-Source: ABdhPJw5xdA3jT70Ex/+RRMMEJdOwqlJuNpVlVsIJwsRx1iv8ymbJ5huNmf2DFMaQHGWJI1d3SV1xQ==
X-Received: by 2002:a17:90a:8d11:: with SMTP id
 c17mr3106202pjo.201.1591157240217; 
 Tue, 02 Jun 2020 21:07:20 -0700 (PDT)
Received: from [192.168.1.11] (174-21-143-238.tukw.qwest.net. [174.21.143.238])
 by smtp.gmail.com with ESMTPSA id z9sm550215pjr.39.2020.06.02.21.07.18
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 02 Jun 2020 21:07:19 -0700 (PDT)
Subject: Re: [PATCH v7 00/42] target/arm: Implement ARMv8.5-MemTag, system mode
To: qemu-devel@nongnu.org
References: <159115053272.18153.3452088585693299325@45ef0f9c86ae>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <616b90eb-aba8-525c-2060-69442d141bad@linaro.org>
Date: Tue, 2 Jun 2020 21:07:17 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.8.0
MIME-Version: 1.0
In-Reply-To: <159115053272.18153.3452088585693299325@45ef0f9c86ae>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::443;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x443.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_PASS=-0.001,
 URIBL_BLOCKED=0.001 autolearn=_AUTOLEARN
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
Cc: peter.maydell@linaro.org, qemu-arm@nongnu.org, steplong@quicinc.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 6/2/20 7:15 PM, no-reply@patchew.org wrote:
> This series seems to have some coding style problems.

Hmph, some of these are real.
I'll fix for v8, with other review.


r~

