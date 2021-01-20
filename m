Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4A2072FD914
	for <lists+qemu-devel@lfdr.de>; Wed, 20 Jan 2021 20:08:35 +0100 (CET)
Received: from localhost ([::1]:43222 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l2IqH-0000hH-VJ
	for lists+qemu-devel@lfdr.de; Wed, 20 Jan 2021 14:08:33 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:42304)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1l2Imm-0007wt-Ve
 for qemu-devel@nongnu.org; Wed, 20 Jan 2021 14:04:57 -0500
Received: from mail-pj1-x1030.google.com ([2607:f8b0:4864:20::1030]:37029)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1l2Imk-0005wK-Fq
 for qemu-devel@nongnu.org; Wed, 20 Jan 2021 14:04:56 -0500
Received: by mail-pj1-x1030.google.com with SMTP id g15so2797332pjd.2
 for <qemu-devel@nongnu.org>; Wed, 20 Jan 2021 11:04:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:from:to:cc:references:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=d//+lZ/2ZHRc+D7mLJFt46s5ptS84ySycRmgigDu7XU=;
 b=Ih7AKuvyCdvH6oMrzzMhs8rQhlWqIr15lzhb0bPakzrSnLOqhDFjfTFKNHbD/PrHcO
 9k9Q0QLjuEUlCpuV6ppD9oi3qv5gLWob2eTn0K3zELw+vg5cgUra77aaZNmAu+4ZVBSm
 FofEDE/TXthPNckpwlfrYH5yeQd/QbeZyqbl+iDQVHsxliNYzmoy6yJNYqKl8mt80DKs
 /3QlOaCQEK8ia65jz+bf+E7w4U1IEQIGWKjblU3nDp8rDAg2ZF2pYpQMQ0HJ8f67ZRCn
 PypJDoE8PYzii2PGa1v1lxew9NIqEJ5MDrYBuQer45+70wFGMCi1+T0pU/lZJEEq1E2K
 3tnQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:from:to:cc:references:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=d//+lZ/2ZHRc+D7mLJFt46s5ptS84ySycRmgigDu7XU=;
 b=FZJAvBvBvmuepCAR03uBLiLrJuml6hGaARatgQnCTOevxjaHFJW1ADxlApk/KngDOU
 TaQpbxG3tdgAsO+HYb0B/RaO31NwGyjYzrPPawsnzTZwNwUChEBqhIwTxxxrDrOaOtH9
 p8/251TJdOuAfIkGBUnPx/aLr/LR+nrYLVxvJcfRGEc5+P51MD5+B9PJlpcP5QkdfaQb
 OZ83SL0zWQbB8weEWV8c4qo2kkQJycQkILnJ6V5IamUc1eDAlz3Gvl4ehJnV+VxuH1pw
 sBmuKCMlalRsvWb/k1u9urGAhQ2fwgr3gNXF/cfm6WL6k82Eplc8H2VTMgnGEthv4R45
 hEWw==
X-Gm-Message-State: AOAM533XOZs4NBmufoGhIwLHfdYttTBm7tAVMRQQGnQUAZjkMrsJO15+
 /GZaTA+qydQ1KTAu5wEDgZNHRw==
X-Google-Smtp-Source: ABdhPJxYyFKR2h21HeOkUbXJFQFRjawkz84ptYO4JtvCsPvtYfS/XvXXmH8v5YBTo4BWINbq/acZJA==
X-Received: by 2002:a17:90a:ae07:: with SMTP id
 t7mr6907864pjq.115.1611169491914; 
 Wed, 20 Jan 2021 11:04:51 -0800 (PST)
Received: from [192.168.3.43] (cpe-66-75-72-126.hawaii.res.rr.com.
 [66.75.72.126])
 by smtp.gmail.com with ESMTPSA id b5sm2986244pfi.1.2021.01.20.11.04.50
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 20 Jan 2021 11:04:50 -0800 (PST)
Subject: Re: [PATCH] target/arm: Implement ID_PFR2
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
References: <20210120035233.948436-1-richard.henderson@linaro.org>
Message-ID: <26b358c0-38ad-2316-0f9c-f11cbd5823f9@linaro.org>
Date: Wed, 20 Jan 2021 09:04:47 -1000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20210120035233.948436-1-richard.henderson@linaro.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1030;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1030.google.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.094,
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
Cc: peter.maydell@linaro.org, alex.bennee@linaro.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 1/19/21 5:52 PM, Richard Henderson wrote:
> This was defined at some point before ARMv8.4, and will
> shortly be used by new processor descriptions.
> 
> Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
> 
> I've pulled this out of a largely defunct 2019 branch.  This will
> be required for the cortex-a76.  Aside from simplistic isar changes,
> this is unchanged from its April 2019 review, so I did keep the r-b.
> 

Ho hum, the patch is missing the change to kvm64 to pull the value out of the
test vm.


r~

