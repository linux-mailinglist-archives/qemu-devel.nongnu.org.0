Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C13106A1400
	for <lists+qemu-devel@lfdr.de>; Fri, 24 Feb 2023 00:52:57 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pVLO1-000105-3g; Thu, 23 Feb 2023 18:52:29 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pVLNy-0000zM-GH
 for qemu-devel@nongnu.org; Thu, 23 Feb 2023 18:52:26 -0500
Received: from mail-pj1-x1029.google.com ([2607:f8b0:4864:20::1029])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pVLNx-0003RF-05
 for qemu-devel@nongnu.org; Thu, 23 Feb 2023 18:52:26 -0500
Received: by mail-pj1-x1029.google.com with SMTP id
 q31-20020a17090a17a200b0023750b69614so968919pja.5
 for <qemu-devel@nongnu.org>; Thu, 23 Feb 2023 15:52:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=qQHEwStqPQKlhu5rmZuSBYwXrJbncweW3S1WGTrQIiw=;
 b=IAlc3++xrNLGeUGekX7pinFdbMUZZSr5tosU2dMRGLHDbSe53/GfxeEjBziOIfnwx9
 8W3hR+UukPkJmoL66L7U4oqpa4FB3fU4xAVUWWdsoZGGSpKKaGuRckRYeCQJrMG5CkBr
 1hitdqA62VqIfPzfwfNzPGLaUYYqCIbkN2/tZSL84KbGxizsz35jGJl7SSsQZr+nTimM
 SPxqI+qzZNyib8c+hQ2Puq4D92gthZ5PK9F3VNxpy6wPCDAwrCgSYh2yRG8tGtK4IdLQ
 5yO5/5BFtUTdxeY8891qIHWsvuvZgqG5yuYB+aqyYfW+XA8d/mtj69BvYQjTLLe3hD4L
 D98w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=qQHEwStqPQKlhu5rmZuSBYwXrJbncweW3S1WGTrQIiw=;
 b=SBDmr9DHqPUzGi8sX5tGPGskOt9IV790ED4Lpwoe0LXRRQXMWReH21moHw56TVfjRq
 nZJG1+PDwvKIsEXkUrayEU505ERgeK6ToS61L13RVXk4PFjNEpgnEA+mS6H7exz/Y0Fc
 vAv6/aC9x0ZpcadprsN8rrycnjWpzKgO4gvhh5uFk6SqGlvjOzcoq+Uxddmre1fALw0k
 OU5sQCoNsGSkvFJ2Erxiq8HA/hvlldy9NvS7asyXqClW39GuGqW/+bTZxTBKt+vGSRXb
 1tZb4Rnex69sm5MUIjRCGA/7Wck7mSHwKMHxXzTOew8ysM4HJ2oDQT/yJfAVbwG+IPAt
 uB9w==
X-Gm-Message-State: AO0yUKUL8OKF1Jd6o58YNmdJXSIlBqThQJ5HUBlU0QVdDg3vddtoq8DE
 tY+wOBTgWe8NevZqtcO2NTvESA==
X-Google-Smtp-Source: AK7set95B+SweL4UhidCtDrKt468v9nT1dljeCnIxsvCz5Qh1q8ogYp2yCN1ROz5Q7hRaTh73yTlIA==
X-Received: by 2002:a17:90a:804c:b0:234:3e54:35c2 with SMTP id
 e12-20020a17090a804c00b002343e5435c2mr16571472pjw.25.1677196343431; 
 Thu, 23 Feb 2023 15:52:23 -0800 (PST)
Received: from [192.168.54.227] (rrcs-173-198-77-218.west.biz.rr.com.
 [173.198.77.218]) by smtp.gmail.com with ESMTPSA id
 h3-20020a17090a648300b00230ffcb2e24sm246244pjj.13.2023.02.23.15.52.21
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 23 Feb 2023 15:52:22 -0800 (PST)
Message-ID: <34898a39-701c-215f-1727-2cf97a8216cd@linaro.org>
Date: Thu, 23 Feb 2023 13:52:17 -1000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.1
Subject: Re: [PATCH v4 7/7] dump: Rename x86-specific file as win_dump_x86.c
Content-Language: en-US
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>,
 qemu-devel@nongnu.org
Cc: Thomas Huth <thuth@redhat.com>, Janosch Frank <frankja@linux.ibm.com>,
 =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 =?UTF-8?Q?Marc-Andr=c3=a9_Lureau?= <marcandre.lureau@redhat.com>
References: <20230223231755.81633-1-philmd@linaro.org>
 <20230223231755.81633-8-philmd@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20230223231755.81633-8-philmd@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1029;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1029.google.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.09,
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

On 2/23/23 13:17, Philippe Mathieu-Daudé wrote:
> win_dump.c is x86 specific. Rename it as such in case
> someone is willing to add win_dump-aarch64 :)

I think this is premature.  I would *hope* there's a lot in here that would be shared.


r~

