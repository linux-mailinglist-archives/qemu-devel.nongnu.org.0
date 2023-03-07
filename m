Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3E1276AF744
	for <lists+qemu-devel@lfdr.de>; Tue,  7 Mar 2023 22:11:09 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pZeZv-0008Mf-Q1; Tue, 07 Mar 2023 16:10:35 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pZeZm-0008Gm-SZ
 for qemu-devel@nongnu.org; Tue, 07 Mar 2023 16:10:29 -0500
Received: from mail-wm1-x32b.google.com ([2a00:1450:4864:20::32b])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pZeZk-0004ia-Gv
 for qemu-devel@nongnu.org; Tue, 07 Mar 2023 16:10:25 -0500
Received: by mail-wm1-x32b.google.com with SMTP id
 l7-20020a05600c4f0700b003e79fa98ce1so8046267wmq.2
 for <qemu-devel@nongnu.org>; Tue, 07 Mar 2023 13:10:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1678223423;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=YCV5LOyTGgtdFU+4CWvcWi585a8IvRRksARVtWjnWmg=;
 b=UmbMv2R7Ahy/0wo//L3Ub1jCL/J1rQnc1lG6xIUNdceM/IfHQ1W+LMF1IkaMkCmH1K
 /DaZ7oGoWjk2lLVICJ3HT1Z/Qq3322+9o/LgBTi1Se+OP2kaG4/aoJyioe/z5lDd5umB
 f7MHK2M401toOvzV08bSIKAYka40GoiKQ4cP8u5nnJEu3v8kSJbaToeqCeaWTM39PD7g
 jNbD6W96PbRY8nI9LuWE8XDsX5oV+ieD7ODkMQkDNdMArppnRhGykJWFnyv0NNEpKTn9
 y8kALfkImyp3UOtRY7wNanCZcW+OfQCIwovcqFlU6OogiiKUYvoX0p9F9xpwXjhV5b4S
 tGmA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1678223423;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=YCV5LOyTGgtdFU+4CWvcWi585a8IvRRksARVtWjnWmg=;
 b=uLOgG0PGxszWN+bocGfZ7xPiyfI9hOEbmoMpNKHus5FNIWnK+Qho3CGCu5Wewajc+i
 yorcUqh9F2tHVJoSESesM4hWEJrgrQoWd5hFqV9xfCFDgBhx/b2B1dMDUKPOFZhoXoCE
 ssSf0mL3GPCO7SjDD5Z08+KA6DRETAqb4yshDQVPEym9JaWgTzU0tiElBSQoJ2yPNf9P
 09jgapB49/ufE1rT7eR0bEybJgkYNwqi5pprbRyiIJPiFT402oUKJz6nD29BcylupOl8
 5YpWI/218DbjucQ8K1Rw5N/WqN3d10Dm74PpSMQ0yJWTiH4B6lzj852PQ2zo4G1JvL7E
 8nKA==
X-Gm-Message-State: AO0yUKWJtzj9MjYjKze8shuyH3tIUU6T0IadHUQ4r9rfDpUmgKCDR2Qh
 3MaHV83vbOszutBvcX1gtq2qfg==
X-Google-Smtp-Source: AK7set8wp8f9j7OUfoKzkuiFmYNz9d9olNCl9pKaztX6oTDciKI2MOEhptAjH3nqP5VbZLaz4FaGKA==
X-Received: by 2002:a05:600c:470c:b0:3ea:f710:bdad with SMTP id
 v12-20020a05600c470c00b003eaf710bdadmr13958543wmo.29.1678223423106; 
 Tue, 07 Mar 2023 13:10:23 -0800 (PST)
Received: from [192.168.1.115] (126.red-88-28-13.dynamicip.rima-tde.net.
 [88.28.13.126]) by smtp.gmail.com with ESMTPSA id
 j40-20020a05600c1c2800b003dd1bd0b915sm19515162wms.22.2023.03.07.13.10.21
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 07 Mar 2023 13:10:22 -0800 (PST)
Message-ID: <83cb9ac3-717a-0690-f28d-5f9fc74521b9@linaro.org>
Date: Tue, 7 Mar 2023 22:10:20 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.8.0
Subject: Re: [PATCH v2 2/3] block: make BlockBackend->disable_request_queuing
 atomic
Content-Language: en-US
To: Stefan Hajnoczi <stefanha@redhat.com>, qemu-devel@nongnu.org
Cc: Hanna Reitz <hreitz@redhat.com>, Kevin Wolf <kwolf@redhat.com>,
 qemu-block@nongnu.org, Emanuele Giuseppe Esposito <eesposit@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>
References: <20230307210427.269214-1-stefanha@redhat.com>
 <20230307210427.269214-3-stefanha@redhat.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
In-Reply-To: <20230307210427.269214-3-stefanha@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32b;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x32b.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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

On 7/3/23 22:04, Stefan Hajnoczi wrote:
> This field is accessed by multiple threads without a lock. Use explicit
> qatomic_read()/qatomic_set() calls. There is no need for acquire/release
> because blk_set_disable_request_queuing() doesn't provide any
> guarantees (it helps that it's used at BlockBackend creation time and
> not when there is I/O in flight).
> 
> Signed-off-by: Stefan Hajnoczi <stefanha@redhat.com>
> Reviewed-by: Hanna Czenczek <hreitz@redhat.com>
> ---
>   block/block-backend.c | 7 ++++---
>   1 file changed, 4 insertions(+), 3 deletions(-)

Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>


