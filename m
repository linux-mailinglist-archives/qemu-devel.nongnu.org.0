Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E9B906B2040
	for <lists+qemu-devel@lfdr.de>; Thu,  9 Mar 2023 10:38:33 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1paCi7-0006D7-PG; Thu, 09 Mar 2023 04:37:19 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1paCi3-0006CT-TA
 for qemu-devel@nongnu.org; Thu, 09 Mar 2023 04:37:17 -0500
Received: from mail-wm1-x335.google.com ([2a00:1450:4864:20::335])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1paCi1-0007M1-Pz
 for qemu-devel@nongnu.org; Thu, 09 Mar 2023 04:37:15 -0500
Received: by mail-wm1-x335.google.com with SMTP id j3so697699wms.2
 for <qemu-devel@nongnu.org>; Thu, 09 Mar 2023 01:37:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1678354630;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=bW8XoArmI1pBGQpfR+MufKOOeeBI/tL9FS3GIxI/UVA=;
 b=QvftGIHASod4edAsWj49FiZspK+wLM2RlTMOnZP1yfIzkMJ68nOStdNZSvXbft1CEo
 RXYw1KUGgAKJYg1aKpTfiM+PxG9V0B7cxf7utZXVWWSmmwjCBA7LTlLjlf8Q9nfjr/9k
 /HOh/rv0gmXnsu+lNn6qokePl9aphSirLH6gBFcJD04aIZEvrK8zWCOQcWo+9xYaO2bn
 brs2jOaDZ4FfHEGDNjuguoCujM3G0YOZqfWfXFtwPXuxbzl+9/laMDSehGzlhtr1vRpj
 nBINSNAnTjgAVKuYbZYZo9MFe8+mmoLlRSJjyxnp6tKs2kR9VqVf5HMvfiWDMBfRgi+W
 m5hg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1678354630;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=bW8XoArmI1pBGQpfR+MufKOOeeBI/tL9FS3GIxI/UVA=;
 b=BqCjw8QuhAITIRzbwhJxOjqULaUT1+Uwm+4M0RMAXOwuZwthAF4WKPNpc+Vx9uyOHS
 Li8arYLzb2+rz0+Q8IwxVKNKvSAy+BslaGI6AkvOlRmOIeSZpUYs0QHYAH4TpsYXbt80
 jiZts8Bj9xSVyfL6CW6+P+TLPes8nS7Xw9TyGwvC0MRXQfPgwU72vmnSgFn6JiOvWNfM
 cDvBwHUdlyMhdLguFYp+nzlHl5aGS/asXOT+VqfriWgbX7cbkdMhxPWthD5xb5wsJ8VA
 hEsM0hzfdrk2FiGJ7DXqD2BEGPG+6OsB03mT7HkOrZRCCSe5lUXH2/rjTh/REvA/rhFN
 ApEw==
X-Gm-Message-State: AO0yUKVFlSxO0wyKB2aJu0lc6SWbhZlOHSm25/OYtP40EfmJ/GMwRGxc
 lCDXgzNIXjpFBpIgdeiM2/qUDw==
X-Google-Smtp-Source: AK7set+INdSluAud4DMmP89eYCvSR5UGSYo1wMRZlTQ/ft+kgeLgK2zkiT16cZ/oYtttWiqLAcbxJw==
X-Received: by 2002:a05:600c:1e14:b0:3ea:edd7:1f1f with SMTP id
 ay20-20020a05600c1e1400b003eaedd71f1fmr18744587wmb.40.1678354630340; 
 Thu, 09 Mar 2023 01:37:10 -0800 (PST)
Received: from [192.168.30.216] ([81.0.6.76]) by smtp.gmail.com with ESMTPSA id
 c22-20020a7bc856000000b003dc4a47605fsm2065858wml.8.2023.03.09.01.37.09
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 09 Mar 2023 01:37:09 -0800 (PST)
Message-ID: <24cbe68a-2cdc-6d2c-1025-d0b2fa3e71e3@linaro.org>
Date: Thu, 9 Mar 2023 10:37:08 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.8.0
Subject: Re: [PATCH 0/3] block: remove separate bdrv_file_open callback
Content-Language: en-US
To: Paolo Bonzini <pbonzini@redhat.com>, qemu-devel@nongnu.org
Cc: qemu-block@nongnu.org
References: <20230309085051.308664-1-pbonzini@redhat.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
In-Reply-To: <20230309085051.308664-1-pbonzini@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::335;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x335.google.com
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

On 9/3/23 09:50, Paolo Bonzini wrote:
> The value of the bdrv_file_open is sometimes checked to distinguish
> protocol and format drivers, but apart from that there is no difference
> between bdrv_file_open and bdrv_open.
> 
> However, they can all be distinguished by the non-NULL .protocol_name
> member.  Change the checks to use .protocol_name instead of .bdrv_file_open,
> and unify the two callbacks.

Nice cleanup. Series:

Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>

> Paolo Bonzini (3):
>    block: make assertion more generic
>    block: do not check bdrv_file_open
>    block: remove separate bdrv_file_open callback


