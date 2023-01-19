Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BBA946743DE
	for <lists+qemu-devel@lfdr.de>; Thu, 19 Jan 2023 22:01:21 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pIc0w-00076E-Eb; Thu, 19 Jan 2023 16:00:02 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pIc0t-000759-Uh
 for qemu-devel@nongnu.org; Thu, 19 Jan 2023 15:59:59 -0500
Received: from mail-pj1-x1035.google.com ([2607:f8b0:4864:20::1035])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pIc0n-0003AM-Tq
 for qemu-devel@nongnu.org; Thu, 19 Jan 2023 15:59:59 -0500
Received: by mail-pj1-x1035.google.com with SMTP id o13so3642940pjg.2
 for <qemu-devel@nongnu.org>; Thu, 19 Jan 2023 12:59:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=69fDUbv8400cPV+DD4TZdQobLi/nCiTV7sgNP4F/wlg=;
 b=uKRj0wgxDY8NoqCK8lz2KCP9K2AZxmGB58JXnh2SsX8UD0m+6nGkwWNqahLD5WPVOq
 gKQsIFv9bVRy7W6KrYBOEMTZmYoOsHnihlYipybw4nCdTFRwe0TjIkuhCI3sQA1f9yYu
 d44d2rBaUmojJ0MRgpUd87WZM7Ic9J+VME0r/ext6BspOtXNYWFBUO7Z6nfilRZz6MpC
 dGoBQrhIpNc9k+fa8Hr0w29g2/DJXJ8vd+VLfQj2i9K14YVVSRp8ZMLZNPZOwwwuW7Yd
 kcKOxJzk6PXCiIPmQPQJKCL97j1xD812HUaGostqxsISM9ZU49avQ4q3E1r7JMBLnlez
 1Xzg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=69fDUbv8400cPV+DD4TZdQobLi/nCiTV7sgNP4F/wlg=;
 b=nqde9hA5eGD5uXNrUZaBkxHUSmd4dZ68FqoiLxQQ3kRoevmBjT4Nk8rKM6IKKU8YXT
 l5JIdOYffLY3bkQiMYpHVSwufpfPAs7wQBy9KuJHYYSlVgumD5fva7dmgE+T3NdmiNiX
 x+qk2FzeKkVJdd25HgI8xJilOauKlejppDue/OLnV5gqmIk5QIWyoJHfFk9YAJr+ay4g
 4a2fTB3BDWUbYG9Z+yjClXHHFQtJriVyi+TgJrpfBu3g4fL00asEpxSwlmompyGZD+W9
 r7uoHLVwXVTgBIDQcpo2Grsg6oAV/1FeCNUS42CiN+iIzg+nqzLoYOiG4HRxW1FkaSQA
 FLeA==
X-Gm-Message-State: AFqh2kolecR+BFvoaa1L1rWnwthpBy+hhEMqoAeVNSXlGHEoU742fIKm
 GIp1UStGM0UT+cM8byavFAYfmA==
X-Google-Smtp-Source: AMrXdXuisKAbUpvD/wVpFgCa8uYTtMvvhOTP4IYamNnJ+zyld2jeAuJgLZCOFabtKhLDLGTM0aO9jg==
X-Received: by 2002:a17:903:328b:b0:194:cd07:a8bb with SMTP id
 jh11-20020a170903328b00b00194cd07a8bbmr3390890plb.30.1674161992136; 
 Thu, 19 Jan 2023 12:59:52 -0800 (PST)
Received: from [192.168.5.146] (rrcs-173-198-77-218.west.biz.rr.com.
 [173.198.77.218]) by smtp.gmail.com with ESMTPSA id
 y7-20020a1709027c8700b00194afb5a3ebsm5144134pll.21.2023.01.19.12.59.50
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 19 Jan 2023 12:59:51 -0800 (PST)
Message-ID: <66733227-0058-2150-6995-e34223883987@linaro.org>
Date: Thu, 19 Jan 2023 10:59:47 -1000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.2
Subject: Re: [PATCH v2 02/11] tests/qtest/boot-serial-test: Simplify
 test_machine() a bit
Content-Language: en-US
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>,
 qemu-devel@nongnu.org
Cc: Juan Quintela <quintela@redhat.com>, Laurent Vivier <lvivier@redhat.com>, 
 Paolo Bonzini <pbonzini@redhat.com>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>, qemu-arm@nongnu.org,
 Fabiano Rosas <farosas@suse.de>, Thomas Huth <thuth@redhat.com>
References: <20230119145838.41835-1-philmd@linaro.org>
 <20230119145838.41835-3-philmd@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20230119145838.41835-3-philmd@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1035;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1035.google.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.094,
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

On 1/19/23 04:58, Philippe Mathieu-Daudé wrote:
> Slighly modify test_machine() to simplify next commit review.
> 
> Signed-off-by: Philippe Mathieu-Daudé<philmd@linaro.org>
> ---
>   tests/qtest/boot-serial-test.c | 21 +++++++--------------
>   1 file changed, 7 insertions(+), 14 deletions(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~

