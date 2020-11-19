Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 47F532B9DF4
	for <lists+qemu-devel@lfdr.de>; Fri, 20 Nov 2020 00:10:53 +0100 (CET)
Received: from localhost ([::1]:45656 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kft4l-0005ca-CK
	for lists+qemu-devel@lfdr.de; Thu, 19 Nov 2020 18:10:52 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:38846)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1kft3U-00056L-Gb
 for qemu-devel@nongnu.org; Thu, 19 Nov 2020 18:09:34 -0500
Received: from mail-pl1-x642.google.com ([2607:f8b0:4864:20::642]:33220)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1kft3S-0007M2-MH
 for qemu-devel@nongnu.org; Thu, 19 Nov 2020 18:09:32 -0500
Received: by mail-pl1-x642.google.com with SMTP id t18so3837488plo.0
 for <qemu-devel@nongnu.org>; Thu, 19 Nov 2020 15:09:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:from:to:cc:references:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=LUy6OoktVpkA/G6Us17vPuqsww8Bx+GNQa04Wu3fSjc=;
 b=I8/UCk5aBDTyiI7SbsxcYabFD9aduWVHl5sXfJisXaGrlPeXC3hguqluleADRhu1uv
 luxnBN07785uMxRFVSygJZp/rSRJiG4GGynLjYWb+A8U5o2x2A++SnbeXmA5E6CRwb/Z
 9tQGShL12/QZxJjsrJXm+0dPr2IFt0EJoW7mHIqY9oNKEVTsnoPvVOiRAHj5vdbNSuRA
 hzgSIBKTS2Zk+QRKKqFtZuHCKAHsQX1b/jYt+fpEDe0JIh2jWmmYG6kJoauygAXqWmnQ
 sfANqrAa0GFEDWSwgSBdkIl2WEQVvJQdJ7/UoZq7Td6WAeuJCr95Ovswn6qC8jwc1QGh
 ntLg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:from:to:cc:references:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=LUy6OoktVpkA/G6Us17vPuqsww8Bx+GNQa04Wu3fSjc=;
 b=Abubm3sydBy/6H9qZDdIOqHLtlsUTE1wnLSqq7Fg+abA/wcsv9F4u5ZCcXI7ekHHm0
 wqs2ZGtoZbL7BluvWfS8kw7qCbibJHSMcqnv7oUKJCg9a3fWLZqFURv+WhbP6w0KIdfO
 vkf/4ysJR3R5pfUsobFa4CtxosTRN3cMrGxSadbkMJYoglwaWTx1/GDL9EYXRN96VAey
 ePa4m5e8VtbJ8VXpTeYV6OW+V85eyyBBAvfinTQnn9ZkRjnDjWeAm2A8HHMA4RDBqpyQ
 purwr70OXyZLB4p+munDyKVeez1J88BXTeppAOCs2ZzKRL6NCW/ItKGU0I3tDUpWDXbI
 9+7g==
X-Gm-Message-State: AOAM531WLngMQe8Cz4JRmCj8KV6sKMerwg1tWkRreFN3j+ywoIhNu3G/
 vVb+PVxlZaJ1uwGsitzl2xNKB/+yFqcZfA==
X-Google-Smtp-Source: ABdhPJzOmNbaHqNJcpy9VYJ3uTp5NVETouoq+bwx59buB2AuorEA4wbFFeaJloN9UZWA1JY06DI7WA==
X-Received: by 2002:a17:902:b94b:b029:d8:f78e:c03f with SMTP id
 h11-20020a170902b94bb02900d8f78ec03fmr10621721pls.47.1605827369404; 
 Thu, 19 Nov 2020 15:09:29 -0800 (PST)
Received: from [192.168.1.11] ([71.212.141.89])
 by smtp.gmail.com with ESMTPSA id 21sm1046456pfw.105.2020.11.19.15.09.28
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 19 Nov 2020 15:09:28 -0800 (PST)
Subject: Re: [PATCH 2/4] linux-user/mips64: Support o32 ABI syscalls
From: Richard Henderson <richard.henderson@linaro.org>
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>,
 qemu-devel@nongnu.org
References: <20201119161710.1985083-1-f4bug@amsat.org>
 <20201119161710.1985083-3-f4bug@amsat.org>
 <969a01ac-ca23-7c0e-ee61-8d75177df0a5@linaro.org>
Message-ID: <f8504ee1-c41a-5588-6c63-cfc71b0c1470@linaro.org>
Date: Thu, 19 Nov 2020 15:09:26 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <969a01ac-ca23-7c0e-ee61-8d75177df0a5@linaro.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::642;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x642.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Laurent Vivier <laurent@vivier.eu>, Aurelien Jarno <aurelien@aurel32.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 11/19/20 3:08 PM, Richard Henderson wrote:
> On 11/19/20 8:17 AM, Philippe Mathieu-Daudé wrote:
>> +#if defined(TARGET_ABI_MIPSO32)
>> +#define TARGET_SYSCALL_OFFSET 4000
>> +#include "syscall_o32_nr.h"
> 
> Where does this get built?

Ah, I see, next patch.

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~




