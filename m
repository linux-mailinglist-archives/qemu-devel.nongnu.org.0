Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9742C34A77B
	for <lists+qemu-devel@lfdr.de>; Fri, 26 Mar 2021 13:43:03 +0100 (CET)
Received: from localhost ([::1]:60464 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lPlnp-0001fd-QU
	for lists+qemu-devel@lfdr.de; Fri, 26 Mar 2021 08:43:01 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:56844)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lPlmK-0000od-7E
 for qemu-devel@nongnu.org; Fri, 26 Mar 2021 08:41:28 -0400
Received: from mail-oi1-x230.google.com ([2607:f8b0:4864:20::230]:43635)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lPlmH-000748-Ro
 for qemu-devel@nongnu.org; Fri, 26 Mar 2021 08:41:27 -0400
Received: by mail-oi1-x230.google.com with SMTP id n8so5538406oie.10
 for <qemu-devel@nongnu.org>; Fri, 26 Mar 2021 05:41:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=vbjHslwiHXklxb/etHW9QYUV8zJCR820B1OeMR6VLgI=;
 b=bWi02tOxaqTHxi6sYtPQNVeEMNUBmAa7EltKOfcg3xNaccObPQU8Tif++SAsyAsozj
 /YVKI0EY3l3KgTEk4tGKDPeUPPyN787Jzq/EkUqEcqw8g4eiQTxbEUyiVBaGD2gzz+HX
 LYRxkfegOfL273eHii7K1b1pGFAG+MpscmiBpXhjtIQoROl2L8ptzpjKTo+6KuFsCBc/
 dqE36wKwt9swXztuGpbJm88xj09jRx2ikmGVUi8E1U0muAx143B5pVG1qibCDYiV849x
 nKOp2sN6U+HTgO1WxMxHUjUo9cTiEZ72lT+OnEhRtFPek6Cn3FAV1HSY7Dlyzrsafk+l
 wKxA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=vbjHslwiHXklxb/etHW9QYUV8zJCR820B1OeMR6VLgI=;
 b=KBTFt6T5Ro5l5rCctIY9hUmflXjoOjiy99yIc3xgf/yzQ3+SeY3p+DB/AKgLL7MRTS
 Ptcz+lKiMfibFpnj0Hv7/Y7NsY3A9kC9V+oOQe8uBdgHtZKBqafiHIJ6ABl/PUxrcwRN
 i7utA6xo998MvGBoP+JtAhYDe1uv/pK+Y3bKwjFek6RW9BMmVy8pe1rf8Amx8q0rsKyF
 1jr9b6tmgxUOBYgkXvbkx/6tI98Zv//qN6RhAlw+IwzrFFuusvXHaQ5HKs3XtSe6eWBb
 O46i2RZgRRJMUVcfVbVdiAqUSXV82akzS5ObokwnFk1OxB8eJ6VgBvVp4bLCfsFjRx4I
 r/VA==
X-Gm-Message-State: AOAM532Ok6GOgKejGhLW1S+spdqBuansZQkKhO2c1UrgOjcn9694rIzZ
 jKau9o07BjdH+w4Ys861HJRLYkaHRDPfxP52
X-Google-Smtp-Source: ABdhPJzywR6CUdO9x91hulK3FKuzTw6SooQCAM8MgaAx2qmgxko1a5os60331wL7tUpR4ekKhHUncA==
X-Received: by 2002:aca:ab85:: with SMTP id u127mr9591652oie.113.1616762484262; 
 Fri, 26 Mar 2021 05:41:24 -0700 (PDT)
Received: from [172.24.51.127] (168.189-204-159.bestelclientes.com.mx.
 [189.204.159.168])
 by smtp.gmail.com with ESMTPSA id h59sm2056917otb.29.2021.03.26.05.41.23
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 26 Mar 2021 05:41:23 -0700 (PDT)
Subject: Re: [PATCH v5 10/10] target/ppc: Validate hflags with CONFIG_DEBUG_TCG
To: David Gibson <david@gibson.dropbear.id.au>
References: <20210323184340.619757-1-richard.henderson@linaro.org>
 <20210323184340.619757-11-richard.henderson@linaro.org>
 <YFqD5JOVEXVFv9Tr@yekko.fritz.box> <YFxONrbZarGMH34O@yekko.fritz.box>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <0ea867e5-e2f5-954f-a07d-5a71090985e3@linaro.org>
Date: Fri, 26 Mar 2021 06:41:21 -0600
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.1
MIME-Version: 1.0
In-Reply-To: <YFxONrbZarGMH34O@yekko.fritz.box>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::230;
 envelope-from=richard.henderson@linaro.org; helo=mail-oi1-x230.google.com
X-Spam_score_int: 12
X-Spam_score: 1.2
X-Spam_bar: +
X-Spam_report: (1.2 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1, DKIM_VALID=-0.1,
 DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_SBL_CSS=3.335, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: qemu-ppc@nongnu.org, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 3/25/21 2:47 AM, David Gibson wrote:
> On Wed, Mar 24, 2021 at 11:12:20AM +1100, David Gibson wrote:
>> On Tue, Mar 23, 2021 at 12:43:40PM -0600, Richard Henderson wrote:
>>> Verify that hflags was updated correctly whenever we change
>>> cpu state that is used by hflags.
>>>
>>> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
>>
>> Applied to ppc-for-6.0, thanks.
> 
> Alas, this appears to cause a failure in the 'build-user' test on
> gitlab CI :(.  I haven't managed to reproduce it locally, so I'm not
> sure what's going on.

I guess you mean e.g.

https://gitlab.com/dgibson/qemu/-/jobs/1126364147

?  I'll have a look.


r~

