Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B8BDA6F47C2
	for <lists+qemu-devel@lfdr.de>; Tue,  2 May 2023 17:52:53 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1ptsIh-0004Dr-3H; Tue, 02 May 2023 11:52:23 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1ptsIf-0004Dj-GZ
 for qemu-devel@nongnu.org; Tue, 02 May 2023 11:52:21 -0400
Received: from mail-wm1-x329.google.com ([2a00:1450:4864:20::329])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1ptsId-0003JL-LY
 for qemu-devel@nongnu.org; Tue, 02 May 2023 11:52:21 -0400
Received: by mail-wm1-x329.google.com with SMTP id
 5b1f17b1804b1-3f19a80a330so24700525e9.2
 for <qemu-devel@nongnu.org>; Tue, 02 May 2023 08:52:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1683042735; x=1685634735;
 h=content-transfer-encoding:in-reply-to:from:references:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=YbrD/W8jBAcWJDmWhpMcbQp9B3Xl/RbJsTTN3GNYDCM=;
 b=kPzF5sENHbNysNMyY4NECd4Pn0noARZqoRjUiv5WGMmttPPzaHs+kFGY4dVnWvuH6H
 M3mmZonp8XsuHF3G9Xn7Mp7NdDtmDmlo1K4NYFu1bnNLDi/0E8VAoK+zLe2FrcXlixX/
 KF/wAu6ZMpf9YUcXMPdUHMeybUJZZcbx2/TqSf0CwyUb7adfAUAKwbBj9NvdiFZvAGVb
 ctJnaLUec4ThPgThr9tKdkm9e1Y17Gg2bhmRKRc1EdthBI9YGcrLce8myug3THv7Uy4X
 cA6tNG4PniNJQkM6KAyQEJFnGds6IFVsGFrByd78EEBUoZhuWHOfRnY04osjU9GGBbS8
 MJqg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1683042735; x=1685634735;
 h=content-transfer-encoding:in-reply-to:from:references:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=YbrD/W8jBAcWJDmWhpMcbQp9B3Xl/RbJsTTN3GNYDCM=;
 b=USIhiXwsVi3JhUi9vNKicE/yIiAP+kdK1ISIvMvAEDnomHgGjqjTDm5BwjRXYrrVnK
 icQyLjXmDroFdpTQR8Bur/aTE9CkfoOwGWC3v+WdElww8LOBIOMpzjdXxC43akJ5EXh2
 DQpnQXP/ukkb4kdQpW3xVWGk9hWIzyr4OjVA+GIsEdBCbiSSfmlGNwGciqaiAorTe5D6
 7pKibpbtxsZg/Z4p9Tnw35OpzqF8nBFw2dEQZppIB4XLjlPrGw8RIV8XyFkuAqPczSCI
 Vs7dPm0H/z4itGmBbLcAh1ELzoH9HU5BUltWWSiSSE6+hDC8mijqBudXiDyBM/Z4xf/h
 iHoA==
X-Gm-Message-State: AC+VfDx+FmxxqyJwpP6/nAFq79QDlkF3K4J6/Agm3jeJFf9PWTMTvwPA
 GOZsrKEI+DKsiroM8EMHiu8zEW6mwqMFtZXJbfyG3A==
X-Google-Smtp-Source: ACHHUZ5Lbh/hvi4B9p4Psu/jyKttWmlLlWwQzmV4IPKF2WcjP6WXaHqPNFiHNtyPHQGX5CWcL25Lqg==
X-Received: by 2002:a05:600c:ac8:b0:3f1:819d:d050 with SMTP id
 c8-20020a05600c0ac800b003f1819dd050mr11818096wmr.37.1683042735140; 
 Tue, 02 May 2023 08:52:15 -0700 (PDT)
Received: from ?IPV6:2a02:c7c:74db:8d00:ad29:f02c:48a2:269c?
 ([2a02:c7c:74db:8d00:ad29:f02c:48a2:269c])
 by smtp.gmail.com with ESMTPSA id
 v9-20020a05600c444900b003f173be2ccfsm52004152wmn.2.2023.05.02.08.52.14
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 02 May 2023 08:52:14 -0700 (PDT)
Message-ID: <4141b7a3-b288-7431-918f-959a3d97f526@linaro.org>
Date: Tue, 2 May 2023 16:52:13 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.0
Subject: Re: proposed schedule for 8.1 release
Content-Language: en-US
To: Peter Maydell <peter.maydell@linaro.org>,
 QEMU Developers <qemu-devel@nongnu.org>
References: <CAFEAcA_=Zp9YBcJDsCZ-UoMUyjBoG8XMkgfjS3_iGX9hWzM0=Q@mail.gmail.com>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <CAFEAcA_=Zp9YBcJDsCZ-UoMUyjBoG8XMkgfjS3_iGX9hWzM0=Q@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2a00:1450:4864:20::329;
 envelope-from=richard.henderson@linaro.org; helo=mail-wm1-x329.google.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-1.422,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

On 5/2/23 15:44, Peter Maydell wrote:
> Hi; I figured we could put some dates into the proposed 8.1
> schedule. Here's a starter:
> 
> 2023-07-11 Soft feature freeze
> 2023-07-18 Hard feature freeze. Tag rc0
> 2023-07-25 Tag rc1
> 2023-08-01 Tag rc2
> 2023-08-08 Tag rc3
> 2023-08-15 Release; or tag rc4 if needed
> 2023-08-22 Release if we needed an rc4
> 
> (dates picked largely to ensure that we don't slip into
> September)
> 
> Richard, you're doing merges, so the most important
> question is whether this works for you :-)

Looks reasonable.  I have some holiday scheduled between rc0 and rc1, but I'm sure we can 
work that out.


r~


