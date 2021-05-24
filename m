Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 52D3438E7F9
	for <lists+qemu-devel@lfdr.de>; Mon, 24 May 2021 15:46:02 +0200 (CEST)
Received: from localhost ([::1]:59546 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1llAu9-0000WD-ES
	for lists+qemu-devel@lfdr.de; Mon, 24 May 2021 09:46:01 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60504)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1llAsv-00080v-Gx
 for qemu-devel@nongnu.org; Mon, 24 May 2021 09:44:45 -0400
Received: from mail-pg1-x52d.google.com ([2607:f8b0:4864:20::52d]:34586)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1llAst-0000K1-Ve
 for qemu-devel@nongnu.org; Mon, 24 May 2021 09:44:45 -0400
Received: by mail-pg1-x52d.google.com with SMTP id l70so20143255pga.1
 for <qemu-devel@nongnu.org>; Mon, 24 May 2021 06:44:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=Vb0y0vXi4ceo5XMP1870eceilWFjs0QUNE82DmFck2I=;
 b=B9k7yHlih2Ho0dgM6iVKessQM+iftKgP3KoT5sO6/RI/leXDjvtXT8HFBNJpZvoaby
 9HunfXSvzjBhcqukor8ns8/vGouIut3G1mPajPlfsqtuKM2f3gmW2b6WgVA7yLieQy3Z
 eulUyieC2XlyPoyEiEVnd8iVkr5I3PIVhrn9Q/U+YbekiJ4ldhiRjMmW3SmB96fo7dTC
 H74oNsiaJWy7tliEXOwKjUIKIZKZCtaNSSNhuXHsC9r5oh53KR4sXPMNz8PmmzjzQKZk
 VcgiJeNBNzhsNdNmI1WDkBFZLlHQXFKtsWTeON3xPr9KojPwzx2iDALlCT8WJiRNloXQ
 ePJg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=Vb0y0vXi4ceo5XMP1870eceilWFjs0QUNE82DmFck2I=;
 b=Y6vVIIpRT6IddJxa5vhZv8Cu0cxhC3DUbORmhu02HrC+1TsY2JwA/ECAL5NKUevJq2
 3g5ZCSnKwx2+qzFJoORhoi+kfxfcsrwDRaeZee6YYtCBMA8ypjP6V0mmRdJSi/AT25Zz
 9Fmtc6Xrsho9meKPHC7KkLPo0tvudD0ZS5urFbkAp4FXefg1krurbinvmQoHbp+WALDx
 Uy4UcW9cxYbXefHc8cFj3k7D/aRMEJ5FWboz0yXYtsvcnZubbSl+o5W0x/Bsa9dfWuHX
 OpMIpVCsN5klYW9bsipf96yxR+9XYwVkfz1bNs20qJSup875CFU5O9PWNy6hCf9JtTYc
 B2/w==
X-Gm-Message-State: AOAM530j4iRjYBbJ2U9NNpkOpoGA3R5q12sPnAGPIBkLh7nKthgb2Gpc
 KBu4zisA3pD9Np1xJ3nTIYqtRA==
X-Google-Smtp-Source: ABdhPJyHB0MUUVuMch/KKi1/aMMmbbDkkdqmneNTKyZi1/OekRnyuOBlualqn94XzOMUWHNmvxtsiA==
X-Received: by 2002:a62:7c46:0:b029:2dc:cb24:b5b1 with SMTP id
 x67-20020a627c460000b02902dccb24b5b1mr24706886pfc.77.1621863882489; 
 Mon, 24 May 2021 06:44:42 -0700 (PDT)
Received: from [192.168.1.11] (174-21-70-228.tukw.qwest.net. [174.21.70.228])
 by smtp.gmail.com with ESMTPSA id
 j9sm7085254pfc.220.2021.05.24.06.44.42
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 24 May 2021 06:44:42 -0700 (PDT)
Subject: Re: [PATCH 1/6] hw/arm/mps2-tz: Don't duplicate modelling of SRAM in
 AN524
To: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org
References: <20210510190844.17799-1-peter.maydell@linaro.org>
 <20210510190844.17799-2-peter.maydell@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <ab21f19f-76d2-0bdf-5f26-ff6082855285@linaro.org>
Date: Mon, 24 May 2021 06:44:40 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <20210510190844.17799-2-peter.maydell@linaro.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::52d;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x52d.google.com
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
Cc: Devaraj Ranganna <devaraj.ranganna@linaro.org>,
 Kumar Gala <kumar.gala@linaro.org>, Kevin Townsend <kevin.townsend@linaro.org>,
 Jimmy Brisson <jimmy.brisson@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 5/10/21 12:08 PM, Peter Maydell wrote:
> The SRAM at 0x2000_0000 is part of the SSE-200 itself, and we model
> it that way in hw/arm/armsse.c (along with the associated MPCs).  We
> incorrectly also added an entry to the RAMInfo array for the AN524 in
> hw/arm/mps2-tz.c, which was pointless because the CPU would never see
> it.  Delete it.
> 
> The bug had no guest-visible effect because devices in the SSE-200
> take priority over those in the board model (armsse.c maps
> s->board_memory at priority -2).
> 
> Signed-off-by: Peter Maydell<peter.maydell@linaro.org>
> ---
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~

