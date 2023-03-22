Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id F32A56C5A2C
	for <lists+qemu-devel@lfdr.de>; Thu, 23 Mar 2023 00:16:19 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pf7Sv-0000Wc-4B; Wed, 22 Mar 2023 19:01:57 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pf7Ss-0000WE-OV
 for qemu-devel@nongnu.org; Wed, 22 Mar 2023 19:01:54 -0400
Received: from mail-pl1-x62a.google.com ([2607:f8b0:4864:20::62a])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pf7Sr-0005Ab-DX
 for qemu-devel@nongnu.org; Wed, 22 Mar 2023 19:01:54 -0400
Received: by mail-pl1-x62a.google.com with SMTP id z19so10260589plo.2
 for <qemu-devel@nongnu.org>; Wed, 22 Mar 2023 16:01:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1679526112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=ReUryx4gvbmL6JuYVbeBQ/DwzgdscFh2cRootuKwalI=;
 b=HaS/3e1DZGHtmimyUSFqrB46JCFgLUczs78+0lsmc1FEwRluWRcF96reV4Td5vsows
 jDGiVCzuSVyHTENQOPBIvHS9wy+dA+jwQnB7MX1E78OwnDSce5Bc+dE5+iV5ZegrqrQ5
 REbGavtzg7QyTlp9a+O4NYLeEAj3geLh29NAM+Kp6/CZN6YTxa1WY/z183txucnMuEkV
 R5lIcHyup6aWlyFzNrzOvQ777L2VBhMPItH4NDr8httLwBtricyn5ukTTsrV8h14Qata
 zgrtNcw+/Nwre/+UjRCmS4yFtkUJAGlaMdVXV0VO4f5f1RelAzvSBrEqiIX0GF0nUzpC
 6xtQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1679526112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=ReUryx4gvbmL6JuYVbeBQ/DwzgdscFh2cRootuKwalI=;
 b=XAnCc4+EkQSIVsDJBq9DH24NIXjEXSXpFunomXw7bhrkrK/fuFDesRqDlwhjGvly9N
 4FEAHKdNkT07TPP1obzAPxgaxxSM3VzasKw43Ei2KZtoNYY1R6bV7m+AAxGxBWDCmlJE
 MHw61Bx63IEwvsXd6XSHgVjd9273l69wwQFkuGReL4tocXpH+UEqu7Qdf6Ao/bNf66J/
 Uc5315CFM4mnwB44TL8HIrNgv/ISqWOUrdda3DbmVQ72KurMhdYj9P5PZZ/yO7OqI0es
 qIrniQ5HBkeuJU513PL7YAbTlyD7uia6DK+gtzkv9oRKEXhe4XCL+LjCHialOxCzR112
 yzIA==
X-Gm-Message-State: AO0yUKW4yIJjfRE9tsKhwZEaqFEE9hSqyQlqdZ0HeWQNPiMRjxoTYNRD
 ec92w5yzeY3PWeoqiIdLv4OgVw==
X-Google-Smtp-Source: AK7set91Y/TxFCTTdHcU84bCfgLZMWohrWdHuauIyzOsI8O9WWD2niON4urfPz0uCLkWo2Pf3dHKHw==
X-Received: by 2002:a17:90a:50:b0:23f:ebf2:d3e9 with SMTP id
 16-20020a17090a005000b0023febf2d3e9mr5472371pjb.6.1679526112101; 
 Wed, 22 Mar 2023 16:01:52 -0700 (PDT)
Received: from ?IPV6:2602:ae:1544:6601:226e:47e1:b8cd:a957?
 ([2602:ae:1544:6601:226e:47e1:b8cd:a957])
 by smtp.gmail.com with ESMTPSA id
 e21-20020a17090a4a1500b0023b415305a4sm30381pjh.43.2023.03.22.16.01.51
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 22 Mar 2023 16:01:51 -0700 (PDT)
Message-ID: <9e1799a7-bb14-7639-1792-717fc34a1844@linaro.org>
Date: Wed, 22 Mar 2023 16:01:49 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Subject: Re: [PATCH v2 7/7] target/arm: Add CPU properties for most v8.3 PAC
 features
Content-Language: en-US
To: Aaron Lindsay <aaron@os.amperecomputing.com>
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org,
 Vincent Dehors <vincent.dehors@smile.fr>,
 =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 Peter Maydell <peter.maydell@linaro.org>
References: <20230222193544.3392713-1-aaron@os.amperecomputing.com>
 <20230222193544.3392713-8-aaron@os.amperecomputing.com>
 <c79aa318-0fa9-e93e-56dc-c084de47f645@linaro.org>
 <ZBtm15EMqUZHRx3a@strawberry.localdomain>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <ZBtm15EMqUZHRx3a@strawberry.localdomain>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::62a;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x62a.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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

On 3/22/23 13:36, Aaron Lindsay wrote:
> I have not played around with this further. Do you feel this is
> important to look into prior to merging this patchset (since QARMA3
> isn't the default)?

No, a mere curiosity.


r~


