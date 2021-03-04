Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8A5B932DB51
	for <lists+qemu-devel@lfdr.de>; Thu,  4 Mar 2021 21:46:33 +0100 (CET)
Received: from localhost ([::1]:49280 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lHurf-0003XL-Ot
	for lists+qemu-devel@lfdr.de; Thu, 04 Mar 2021 15:46:32 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:60932)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lHuga-00013F-Hh
 for qemu-devel@nongnu.org; Thu, 04 Mar 2021 15:35:04 -0500
Received: from mail-pf1-x432.google.com ([2607:f8b0:4864:20::432]:45789)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lHugX-0004u3-Vl
 for qemu-devel@nongnu.org; Thu, 04 Mar 2021 15:35:03 -0500
Received: by mail-pf1-x432.google.com with SMTP id j12so19763398pfj.12
 for <qemu-devel@nongnu.org>; Thu, 04 Mar 2021 12:35:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:references:from:message-id:date:user-agent:mime-version
 :in-reply-to:content-language:content-transfer-encoding;
 bh=cFoFhqRA5r4dBSOzdMfGhRBEZAuexVVP/n7UE3UBNOk=;
 b=xo0AJHbCwkqoJrSicJiwrrbtA6bY7e2D6MY+kLxLdhLEM2wPqumrKpFwLsnWkQ/6fJ
 2u0nQj9tZc/Kf7I77s0fCsacYrdO/iGecV2NFmgwA7NSGSQO/vgjERa1THbzxtTkBlJ7
 QcYfQWS6Hb92ZIF1VTiIv4MICr4yAVaU+FjQdlltay2cIBvjZf+RmkVkiPyzANW6ea5/
 a3+lZrTnCAmVRGXuf2h9Mar3y0GTlfAfWrBpD4eXC6OF1hHr6cIPRH/11IlM7sz7kuTh
 /4DxK8ipkptAJI4FGSqttM8GoT7q3vNpaTmRj5ZXpark7lYy/qzh2WSfSF0TUSWNfb5w
 KXXg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=cFoFhqRA5r4dBSOzdMfGhRBEZAuexVVP/n7UE3UBNOk=;
 b=i/Jej7NGwcjFsL30OcGxIQE2ePUR6HALPojtwOAVfs4kNNRHxCERlsp2MwkIafBgI+
 6Ydp2GBCDnowbABA0O9/NlENhyNxtsbmQGBNByEKPWdVhdgkyJHJNc49KX0E+3Clftpg
 uS+PVZgTUEgkWg+qP7i2/XYdrxvyjvEAz2+4S/2FFXCIiXLxrySbtkgD7ut46JnBJ85H
 tdQd95BGiwz8y7dwh+MfL8YiMLjak3ynD5jYI06jZOgyeh7GTXsLVAmzmiSgf/R2iusF
 Y4Z1TyiKqcl3biilN18ESQE6wmrwJdBly3vK+C6iMYvRXq2hxDV13Ehr30J98Nvhc3rQ
 gQuw==
X-Gm-Message-State: AOAM5310rJohO870WPn2njmU/N0COVgXcKU/MSoU1ksa8lMZGsjx9y/R
 eQfY6wN/Afd6n+a6ZqE+zjD44gvSP5v9Qg==
X-Google-Smtp-Source: ABdhPJyIhALDT14Ca69CrAGIJGN5pjCXbgbAG5LPINhCpcAMQwa6MAS487JrXInIxF9GR0YXn8k5aw==
X-Received: by 2002:aa7:9154:0:b029:1ee:fa0d:24dd with SMTP id
 20-20020aa791540000b02901eefa0d24ddmr5381073pfi.17.1614890100450; 
 Thu, 04 Mar 2021 12:35:00 -0800 (PST)
Received: from [192.168.1.11] ([71.212.131.83])
 by smtp.gmail.com with ESMTPSA id y2sm254220pgf.7.2021.03.04.12.34.59
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 04 Mar 2021 12:35:00 -0800 (PST)
Subject: Re: [PATCH 33/44] hw/arm/armsse: Add support for TYPE_SSE_TIMER in
 ARMSSEDeviceInfo
To: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org
References: <20210219144617.4782-1-peter.maydell@linaro.org>
 <20210219144617.4782-34-peter.maydell@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <f73b9067-17e5-39e3-cbf8-843bc6ceae6d@linaro.org>
Date: Thu, 4 Mar 2021 12:34:57 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.1
MIME-Version: 1.0
In-Reply-To: <20210219144617.4782-34-peter.maydell@linaro.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::432;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x432.google.com
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 2/19/21 6:46 AM, Peter Maydell wrote:
> The SSE-300 has four timers of type TYPE_SSE_TIMER; add support in
> the code for having these in an ARMSSEDeviceInfo array.
> 
> Signed-off-by: Peter Maydell<peter.maydell@linaro.org>
> ---

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~

