Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id AE1873A08A1
	for <lists+qemu-devel@lfdr.de>; Wed,  9 Jun 2021 02:49:25 +0200 (CEST)
Received: from localhost ([::1]:42294 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lqmPM-0005jZ-PD
	for lists+qemu-devel@lfdr.de; Tue, 08 Jun 2021 20:49:24 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38434)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lqmMh-0003DG-J9
 for qemu-devel@nongnu.org; Tue, 08 Jun 2021 20:46:39 -0400
Received: from mail-pg1-x530.google.com ([2607:f8b0:4864:20::530]:43795)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lqmMb-000441-2e
 for qemu-devel@nongnu.org; Tue, 08 Jun 2021 20:46:39 -0400
Received: by mail-pg1-x530.google.com with SMTP id e22so17953611pgv.10
 for <qemu-devel@nongnu.org>; Tue, 08 Jun 2021 17:46:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:references:from:message-id:date:user-agent:mime-version
 :in-reply-to:content-language:content-transfer-encoding;
 bh=kvCaA4w107vpYjDLy/NvOpdPSVG5jzDqtXtBXoWmdPU=;
 b=q7U2NICQRMrT5uln+f7aidvQBk8Cfrpl8exG9dE/G5XDSGHodLIUToQfgP/5X4YMqg
 VA1j4InJorapIHuH4k94pV8of9i90dz5sNNseAekZfjzynOwND45XNuiiZk+eBbEihKr
 HIWZaBLpeXke3pK2URsll/lkHw8a76zrKSfw9gtTbag6w7viE25x8DJwWwifV4maHW3x
 dntTAZ+bFAo7JU/u67lFIKJ21lEUPyzt9KnNZ0HREzs/bhtlG8xbUt7UbQq51ovP3Rdq
 iYJcBULOY2q0OZNmAhgZZ6dkOEzCR6Ev265OzRzEW4z1AU5kKA6s2dXsuLkPqt5jJvd/
 0y9w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=kvCaA4w107vpYjDLy/NvOpdPSVG5jzDqtXtBXoWmdPU=;
 b=NOd+7QwB67BnKdqckZ1wQ3ofJiaQAaqv+ByonT2IALLFTUfY9PKoQm3LeoSWmCLgiW
 mcFbcb4i+BUXQGMoSMHazQWTY/rVlZk0FjW+J86WeuMxPQNqSyygRDNIK9JUeDjM87mY
 Y2spSfnfwp7pOVKaJvSrJbtuYvdW37mXSDdt79ZjReXCPTwWVoKFnlMoe0/5GabkXbH5
 3poNYZooaKYDsTnyQOoF8Wybr3t4aPjHxJvVjWAgsPwtut0Qr3LxtdXoyCaU8FTx0lDL
 7ltgh9qCsrmqOzb2vHv8I0IjBcFgJVzvsltaMLsCdzLtFQT3yZOukNE5pRiySL9QVdzu
 twTg==
X-Gm-Message-State: AOAM530WAVp6dUh2TTko9bIz0O35w+QCT3XE2BZS3OmNngoPMfkQN1+i
 FsnqpZnrHchiplbAyHwdluv83ZoYUB8r6g==
X-Google-Smtp-Source: ABdhPJw0HVOFRazsDTRoogIn///mkeUuaX3GXMIt3egr6M39ITMeMiMddAk1bNupy59YBJEDuKIDXg==
X-Received: by 2002:a05:6a00:1794:b029:2ee:c59c:56bf with SMTP id
 s20-20020a056a001794b02902eec59c56bfmr2541867pfg.2.1623199590145; 
 Tue, 08 Jun 2021 17:46:30 -0700 (PDT)
Received: from [192.168.1.11] (174-21-70-228.tukw.qwest.net. [174.21.70.228])
 by smtp.gmail.com with ESMTPSA id
 a4sm15490205pjw.46.2021.06.08.17.46.29
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 08 Jun 2021 17:46:29 -0700 (PDT)
Subject: Re: [PATCH 29/55] target/arm: Implement MVE VMLALDAV
To: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org
References: <20210607165821.9892-1-peter.maydell@linaro.org>
 <20210607165821.9892-30-peter.maydell@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <a9200eb0-0f53-55eb-c6bc-40a683157b42@linaro.org>
Date: Tue, 8 Jun 2021 17:46:28 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <20210607165821.9892-30-peter.maydell@linaro.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::530;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x530.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 6/7/21 9:57 AM, Peter Maydell wrote:
> +static bool trans_VMLALDAV_S(DisasContext *s, arg_vmlaldav *a)
> +{
> +    MVEGenDualAccOpFn *fns[4][2] = {

static const, otherwise,
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~

