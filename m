Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id F42056F20E1
	for <lists+qemu-devel@lfdr.de>; Sat, 29 Apr 2023 00:36:12 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1psWgl-0001Q1-J4; Fri, 28 Apr 2023 18:35:39 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1psWgh-0001Pi-TM
 for qemu-devel@nongnu.org; Fri, 28 Apr 2023 18:35:35 -0400
Received: from mail-wm1-x32d.google.com ([2a00:1450:4864:20::32d])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1psWgf-0006nH-Tq
 for qemu-devel@nongnu.org; Fri, 28 Apr 2023 18:35:35 -0400
Received: by mail-wm1-x32d.google.com with SMTP id
 5b1f17b1804b1-3f19afc4f60so1193615e9.1
 for <qemu-devel@nongnu.org>; Fri, 28 Apr 2023 15:35:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1682721332; x=1685313332;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=wcIcBWFparvJl9zqBu6UosahOTUhgE1Q8VQ2JrL7r1c=;
 b=h0zvG2ErzE498WaaLtzM5msQ1hQOwdvg4YQdrVO6/pQ7xdebj6msM5rK/xGim0B67s
 aigUvr3z6noQV9OvYjuMmsfAaxw3D5pTpF9OmqPYwc3BIsnXqZLZC6rLhVSptVgpZvw3
 8/L2/eXIGj7vRuLLActbH/e+vrGKO6o9HX7oqmtZoUe1t9wIeOqE+QmGtrxsuzsoaTT6
 41/S/+AgutJJz1PXqfUK8BXQFXYhaLpUYJJXJgXG22TqunX4IsTBPKGsQpP+rZVD4IR8
 OOvD9hGwMjC0Iv2n5LvRaSSEl3S3tPygBRC2VWJax7EJ6X08brV73/Ph1Sc7DR2tOeyw
 Hi2w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1682721332; x=1685313332;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=wcIcBWFparvJl9zqBu6UosahOTUhgE1Q8VQ2JrL7r1c=;
 b=EwxE04DM6Vc/wX5eWAUZ5GWGiGbJbecb2ZnjZKkRUzXL1PY4JSqDIHPkimJ7woG9rJ
 WLncTvno9uVh2AibCphAL/niYGsTQk5tIsP7VcHzNdKJMpCXk/feqPeKEJRX3gEwlnMN
 8rJXKNQc+eIfk2ju19STZjXKy3bVih696GIn7EDldcm1dmNepU3YTHwXyrXXHhNTYAXL
 IEReTuHff0uMh1dIo/rLF8SFlFOuwmB9zWDKj9NBws6u2cg6Cs7o3ROwKGgNTJ2H9hTS
 YHR+BjZgsvZiz9VZ3bg1zEt+wg1GizbN4z8cwrgWHBbWaJ8y76z0pxw+Rl9wECBnMUan
 oj1Q==
X-Gm-Message-State: AC+VfDy5au0ljRuLT3+ssyKe7LtBonWYZ6jG82sOZ5TLRbfAEVkFxmFn
 VO6fSoJZquJEhcUbPKMqwaSX+Q==
X-Google-Smtp-Source: ACHHUZ4K/N5RGajbgM73CYvMYLQxmJvdftGBFgXdn23xZL0I3jg2UbKLZeC/cxvAPC/NxuYuPyAjOg==
X-Received: by 2002:a1c:7417:0:b0:3f1:8ff5:b773 with SMTP id
 p23-20020a1c7417000000b003f18ff5b773mr4867855wmc.6.1682721332496; 
 Fri, 28 Apr 2023 15:35:32 -0700 (PDT)
Received: from [192.168.192.175] (47.red-88-28-19.dynamicip.rima-tde.net.
 [88.28.19.47]) by smtp.gmail.com with ESMTPSA id
 u19-20020a05600c00d300b003f17eaae2c9sm25640380wmm.1.2023.04.28.15.35.29
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 28 Apr 2023 15:35:32 -0700 (PDT)
Message-ID: <2270f306-5857-5f17-f8e1-fe2f15151da0@linaro.org>
Date: Fri, 28 Apr 2023 23:35:25 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.10.0
Subject: Re: [PATCH v11 04/13] target/arm: Do not expose all -cpu max features
 to qtests
Content-Language: en-US
To: Fabiano Rosas <farosas@suse.de>, qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, Peter Maydell <peter.maydell@linaro.org>,
 Richard Henderson <richard.henderson@linaro.org>,
 =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 Paolo Bonzini <pbonzini@redhat.com>, Claudio Fontana <cfontana@suse.de>,
 Eduardo Habkost <ehabkost@redhat.com>, Alexander Graf <agraf@csgraf.de>,
 Cornelia Huck <cohuck@redhat.com>
References: <20230426180013.14814-1-farosas@suse.de>
 <20230426180013.14814-5-farosas@suse.de>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
In-Reply-To: <20230426180013.14814-5-farosas@suse.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32d;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x32d.google.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-1.422,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
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

On 26/4/23 20:00, Fabiano Rosas wrote:
> We're about to move the TCG-only -cpu max configuration code under
> CONFIG_TCG. To be able to do that we need to make sure the qtests
> still have some cpu configured even when no other accelerator is
> available.
> 
> Delineate now what is used with TCG-only and what is also used with
> qtests to make the subsequent patches cleaner.
> 
> Signed-off-by: Fabiano Rosas <farosas@suse.de>
> ---
>   target/arm/cpu64.c | 12 +++++++++---
>   1 file changed, 9 insertions(+), 3 deletions(-)

https://lore.kernel.org/qemu-devel/ae65d59f-5e16-24bb-aece-ccdd504fe75e@linaro.org/

Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>

https://lore.kernel.org/qemu-devel/4d744ee9-372b-c1f1-0d0f-be06b4b63c6f@linaro.org/

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>


