Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 122A432D860
	for <lists+qemu-devel@lfdr.de>; Thu,  4 Mar 2021 18:12:28 +0100 (CET)
Received: from localhost ([::1]:57186 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lHrWV-0003Q1-3I
	for lists+qemu-devel@lfdr.de; Thu, 04 Mar 2021 12:12:27 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:46364)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lHrUS-0001TQ-T5
 for qemu-devel@nongnu.org; Thu, 04 Mar 2021 12:10:20 -0500
Received: from mail-pj1-x102c.google.com ([2607:f8b0:4864:20::102c]:40608)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lHrUQ-0006Ks-C6
 for qemu-devel@nongnu.org; Thu, 04 Mar 2021 12:10:20 -0500
Received: by mail-pj1-x102c.google.com with SMTP id o6so7497754pjf.5
 for <qemu-devel@nongnu.org>; Thu, 04 Mar 2021 09:10:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:references:from:message-id:date:user-agent:mime-version
 :in-reply-to:content-language:content-transfer-encoding;
 bh=MGt+ihZVtHOBWwg9Z8lGP1hpPwL6eMH1fZ9Un1ypzpg=;
 b=CzdV/bcZ3PEA0kcX9dtgj+xBuwOqJhEj+P8+0IJVedE47ISZ+HnfEwVTNeFz/wnRx9
 gC3yF0AQ9YM1UG4QL1iRPR5od7iTNGYtr6W0JwFC543hmXfG/mhDIBnXyXqH5jPh+rnk
 sEeMEq+8NKFOVBoTh1b06emKv+P3mTCsT9hvh7F4VVXU3EcWDSwwlWKUYt0poDKeKNKG
 HAfFulfEasuUFo4/3SfRfP/Yzu8a6MqWncA237JvCfBNP1aXjnTKYU0C8IjwUM/8YwsI
 UZDKeXbwZIaJQBocug0cHXNl5ayJdEmxxepcU3nVP4i8bIT9Q7X/+v/aETI71gqC7x0h
 Z7Nw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=MGt+ihZVtHOBWwg9Z8lGP1hpPwL6eMH1fZ9Un1ypzpg=;
 b=XlCYBb9/D4r0riKFeWNxPULGxCl22zXH5PQyRX+zq9nYfQTSy0r+E1tt3UKI9itEwb
 awmHQEwdXoRbrCKUSyIXqEwTlFg/wyE1z495rfxVSqDQlslwjSQjtvi6Rp8hKwE3rL0t
 yQCmvo/U/Mtp+Kz4jlvW2UTAQo9TpZP/9w74J/DhBYmtZvFlFc5tYcCSt2PFXmLNzyG6
 M9eNTLpRdCfa0stdXcrGOMUiHa49CJNigy+Ubs3eaj9u9TP/6wsLXHGhQxH8XlcN1Gn4
 24Rgtw7GUXpvT7jWOTXrvjyI7ROs7f9SKK6JFYE672UwalkZ1J35VNoDnu0pyux0yO2U
 i0MQ==
X-Gm-Message-State: AOAM530ydQRu6+4uiTSOm5ZtS+CYywH8iq/N3ct421sZlrYbpN4N8UFx
 oCNO+GaRtBLYQ3RLP1OLveSPC+ozA/qkvw==
X-Google-Smtp-Source: ABdhPJw5/hu3+g3WHCqQZo84KIuuNu56mLIg2esKCg73kgp7XXmXHqZKhhY3KrTQM3sUAaunX9d0hQ==
X-Received: by 2002:a17:902:d487:b029:e4:a950:6df2 with SMTP id
 c7-20020a170902d487b02900e4a9506df2mr4665989plg.79.1614877814669; 
 Thu, 04 Mar 2021 09:10:14 -0800 (PST)
Received: from [192.168.1.11] ([71.212.131.83])
 by smtp.gmail.com with ESMTPSA id y63sm3189pfy.68.2021.03.04.09.10.13
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 04 Mar 2021 09:10:13 -0800 (PST)
Subject: Re: [PATCH 05/44] hw/arm/armsse: Introduce SSE subsystem version
 property
To: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org
References: <20210219144617.4782-1-peter.maydell@linaro.org>
 <20210219144617.4782-6-peter.maydell@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <bbddf31a-42c8-4acd-d31e-83868e74534b@linaro.org>
Date: Thu, 4 Mar 2021 09:10:11 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.1
MIME-Version: 1.0
In-Reply-To: <20210219144617.4782-6-peter.maydell@linaro.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::102c;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x102c.google.com
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

On 2/19/21 6:45 AM, Peter Maydell wrote:
> We model Arm "Subsystems for Embedded" SoC subsystems using generic
> code which is split into various sub-devices which are configurable
> by QOM properties to handle the behaviour differences between the SSE
> subsystems we implement.  Currently the only sub-device which needs
> to change is the IOTKIT_SYSCTL device, and we do this with a mix of
> properties that directly specify divergent behaviours (eg
> CPUWAIT_RST) and passing it the SYS_VERSION register value as a way
> for it to distinguish IoTKit from SSE-200.
> 
> The "pass SYS_VERSION" approach is already a bit hacky, since the
> IOTKIT_SYSCTL device has to know that the different part of the
> register value happens to be bits [31:28].  For SSE-300 this register
> is renamed SOC_IDENTITY and has a different format entirely, all of
> whose fields can be configured by the SoC integrator when they
> integrate the SSE into their SoC, and so "pass SYS_VERSION" breaks
> down completely.
> 
> Switch to using a simple integer property representing an
> internal-to-QEMU enumeration of the SSE flavour.  For the moment we
> only need this in IOTKIT_SYSCTL, but as we add SSE-300 support a few
> of the other devices will also need to know.
> 
> We define and permit a value for the SSE-300 so we can start using
> it in subsequent commits which add SSE-300 support.
> 
> The now-redundant is_sse200 flag in IoTKitSysCtl will be removed
> in the following commit.
> 
> Signed-off-by: Peter Maydell<peter.maydell@linaro.org>

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~


