Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3E4EF2CA6ED
	for <lists+qemu-devel@lfdr.de>; Tue,  1 Dec 2020 16:25:59 +0100 (CET)
Received: from localhost ([::1]:38928 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kk7XS-0002Lg-1o
	for lists+qemu-devel@lfdr.de; Tue, 01 Dec 2020 10:25:58 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:60846)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1kk7Rd-00059u-B5
 for qemu-devel@nongnu.org; Tue, 01 Dec 2020 10:20:01 -0500
Received: from mail-ot1-x342.google.com ([2607:f8b0:4864:20::342]:43577)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1kk7Rb-0003LZ-BD
 for qemu-devel@nongnu.org; Tue, 01 Dec 2020 10:19:57 -0500
Received: by mail-ot1-x342.google.com with SMTP id f12so1945522oto.10
 for <qemu-devel@nongnu.org>; Tue, 01 Dec 2020 07:19:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:references:from:message-id:date:user-agent:mime-version
 :in-reply-to:content-language:content-transfer-encoding;
 bh=5B3yeB35yot3p12PYJ10IHM6JJWcgLJzOSFKLmKrIB8=;
 b=aUEfCh/iCA4FyfT8RMwfTwsQJNUP/V8MkBrqp1LrgdgYoR4FTq+x4zoihcFnAv3XBU
 aalNUEcYjH5uOi4HjWOZK/E6biPOc32fSUwa2tlK6xyKk2SUkJGU7bzw3vJ2lZkYr/Xa
 c9HZY+MYt/GUp4AP7QaMDbaZwbVjDnNit3B4RQgucnQvyugRu7IGolgTIImNb0lee0pE
 3o0a1WCSqTxn5zaFDbX0ahhqyl6GXg0DLgc6AZzk7YDuaLkOpSwCAYMtvFzHFZbIo6/F
 GXmNBOds0g1s81K+BO7coGAjtQEPzP8SLVdm0eE6V11koGbikLSbQKKWNjJNsYF9aScx
 frug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=5B3yeB35yot3p12PYJ10IHM6JJWcgLJzOSFKLmKrIB8=;
 b=KnNZlhtueJO/t1fK2/DrQFZde+cSybmQ2oETqMpg+7WMIa2kZqOLZC+fCWG9f7z0lj
 yRFbGDkSGDiXbDiAb2sKSJdwdMsWXmY0b6RZbEl/FWbO5Xsizps74RTPMr8MlOM8TfR2
 /DgF/z5WEaJnnCSD5iyGvXCk30K00rQ+AeK2H9fuJfPielLSavMAwy/XCEGiOt6BnQDQ
 hC/PgKQYn0zBoPp45JTdjKZU6zmgSdLn22Adi4ILA2gqAlGZJqkAaomMhh7R/Zo0eMlj
 4xrb2VZnlO57l3UJI7NVUo7UoxdVOREqmi24hCwQsrMnjy2EamIpO1hfehRcjY3Mes5o
 mfMA==
X-Gm-Message-State: AOAM5321tO8dgld/uELIf/BJB81uiFQrQSUpf5odG9mfL9ZipZNFm/cQ
 8ccj9/vTJygFCwL9+Ci9GRTu/24y8U8qTMHO
X-Google-Smtp-Source: ABdhPJw/HM2bJ/a2Lo+ShXG5lOiEgWa13Zg30KkZcSvCNMJM42+vDr0Jm5nOt5znALvw9Mlg3V5Biw==
X-Received: by 2002:a9d:3ba5:: with SMTP id k34mr127010otc.198.1606835993671; 
 Tue, 01 Dec 2020 07:19:53 -0800 (PST)
Received: from [172.24.51.127] (168.189-204-159.bestelclientes.com.mx.
 [189.204.159.168])
 by smtp.gmail.com with ESMTPSA id s15sm430914oou.44.2020.12.01.07.19.52
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 01 Dec 2020 07:19:53 -0800 (PST)
Subject: Re: [PATCH v2 22/28] hw/intc/armv7m_nvic: Support v8.1M CCR.TRD bit
To: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org
References: <20201119215617.29887-1-peter.maydell@linaro.org>
 <20201119215617.29887-23-peter.maydell@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <b5a6d9ac-4173-8752-7ed1-560c7bd61614@linaro.org>
Date: Tue, 1 Dec 2020 09:19:50 -0600
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20201119215617.29887-23-peter.maydell@linaro.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::342;
 envelope-from=richard.henderson@linaro.org; helo=mail-ot1-x342.google.com
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

On 11/19/20 3:56 PM, Peter Maydell wrote:
> v8.1M introduces a new TRD flag in the CCR register, which enables
> checking for stack frame integrity signatures on SG instructions.
> This bit is not banked, and is always RAZ/WI to Non-secure code.
> Adjust the code for handling CCR reads and writes to handle this.
> 
> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
> ---
>  target/arm/cpu.h      |  2 ++
>  hw/intc/armv7m_nvic.c | 26 ++++++++++++++++++--------
>  2 files changed, 20 insertions(+), 8 deletions(-)


Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~

