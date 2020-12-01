Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 223952CA76A
	for <lists+qemu-devel@lfdr.de>; Tue,  1 Dec 2020 16:54:35 +0100 (CET)
Received: from localhost ([::1]:44100 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kk7z7-0000xo-Lr
	for lists+qemu-devel@lfdr.de; Tue, 01 Dec 2020 10:54:33 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:40910)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1kk7xt-0000CE-9p
 for qemu-devel@nongnu.org; Tue, 01 Dec 2020 10:53:17 -0500
Received: from mail-ot1-x341.google.com ([2607:f8b0:4864:20::341]:41770)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1kk7xq-0006Fv-7p
 for qemu-devel@nongnu.org; Tue, 01 Dec 2020 10:53:17 -0500
Received: by mail-ot1-x341.google.com with SMTP id j21so1950834otp.8
 for <qemu-devel@nongnu.org>; Tue, 01 Dec 2020 07:53:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:references:from:message-id:date:user-agent:mime-version
 :in-reply-to:content-language:content-transfer-encoding;
 bh=zAXOBFFar0ef1XB2xVRkglOP08JbejR/BbShpLggLqc=;
 b=pdW9CkLVF6QdPVN+PaFGv0v4/hvxoQrsZCsNCZF0gj2sVMYjIUzNG+Na//qX7DtDgt
 ToD7UaF2jimrd9U84aVtODESg0DwzSrG6j26jh7HNi91xhLnyRkQrIc2OwkatmXcmEHm
 Ys8KwChZUkvKFnts0AZHpD/IlBiLv9bhF18DYqkFmLg+0P4GBo9L5Dxq/BXWP/UvtoEI
 4tGjWzjgthTHfXxKKiGbmXkzQkd9hJ6splPaZu02LGzBzNt9Yq3MfOU/rOqndVI8VNcy
 aUKaaCjcXYzWOCYhads/Hh6eU12P3gJjfsofHgxsHV5E9/FB71qFOxlfC7+wJGnRcA2h
 yljw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=zAXOBFFar0ef1XB2xVRkglOP08JbejR/BbShpLggLqc=;
 b=BNaTYAySxnzryteX07bj+TfK4naexKH8de1vNXkmu1VpWyBHifORQHfwfZHMz1FoRJ
 Z+ereriFE7I8ZiMqpPE3TZIsj0sc0voiXYj3OfhLoWJawgLVm4H0a13uLzzeSUOseil1
 tk0QjoDyOQIpQ/3TMPVeqFqwJaTkZXwP5o+7jaV9SomcFD8ZyJBVXZaSNZ81uRSPXWce
 3leL6+R9Hzh3HW0uOrpJXeLpnrJi+ptmOSCljEDzbngxV7gFhDYOokzJFyB5c0mWzqXw
 GlfuE1NWB8F5J9ZGwTfxNDVm7IqBT2+nY1Hoy/dMDFx4JdXuUeC8tiad2JMsgv2APnzl
 KDrw==
X-Gm-Message-State: AOAM533wCnXSIG3hGfk9MQab0eKI9w5gN2LqCQ9z3LywM842hECa4HP7
 tb6OuAdnTjBM652ybp4eQZ1EFTOJyjw1rVnm
X-Google-Smtp-Source: ABdhPJzRYhlTzeGVrSxJVkp/iiE6/xjxOvoVFmf3SNfXOq2qrcsDLaIfqMgmynspAQd8zm+9SCjDQQ==
X-Received: by 2002:a9d:505:: with SMTP id 5mr2319698otw.370.1606837992683;
 Tue, 01 Dec 2020 07:53:12 -0800 (PST)
Received: from [172.24.51.127] (168.189-204-159.bestelclientes.com.mx.
 [189.204.159.168])
 by smtp.gmail.com with ESMTPSA id h64sm472904oib.33.2020.12.01.07.53.11
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 01 Dec 2020 07:53:11 -0800 (PST)
Subject: Re: [PATCH v2 23/28] target/arm: Implement CCR_S.TRD behaviour for SG
 insns
To: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org
References: <20201119215617.29887-1-peter.maydell@linaro.org>
 <20201119215617.29887-24-peter.maydell@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <fadc03e2-d55f-4b91-ab1a-5b78aa24af24@linaro.org>
Date: Tue, 1 Dec 2020 09:53:09 -0600
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20201119215617.29887-24-peter.maydell@linaro.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::341;
 envelope-from=richard.henderson@linaro.org; helo=mail-ot1-x341.google.com
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
> Add the code in the SG insn implementation for the new behaviour.
> 
> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
> ---
>  target/arm/m_helper.c | 86 +++++++++++++++++++++++++++++++++++++++++++
>  1 file changed, 86 insertions(+)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~



