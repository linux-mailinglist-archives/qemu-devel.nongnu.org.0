Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 95D2739A977
	for <lists+qemu-devel@lfdr.de>; Thu,  3 Jun 2021 19:45:17 +0200 (CEST)
Received: from localhost ([::1]:37542 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lorPA-0001Vg-IO
	for lists+qemu-devel@lfdr.de; Thu, 03 Jun 2021 13:45:16 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35414)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lorNV-0000Zh-Hi
 for qemu-devel@nongnu.org; Thu, 03 Jun 2021 13:43:33 -0400
Received: from mail-pl1-x635.google.com ([2607:f8b0:4864:20::635]:42571)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lorNT-0006UW-VM
 for qemu-devel@nongnu.org; Thu, 03 Jun 2021 13:43:33 -0400
Received: by mail-pl1-x635.google.com with SMTP id v13so3263571ple.9
 for <qemu-devel@nongnu.org>; Thu, 03 Jun 2021 10:43:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=gyJEJbe3qSDyTfBto5DwjNT4Oro7AM/9dr/yLOYbuxk=;
 b=Z8ckZUiLFo3G5vWYktlBL+Zi5MaUs77LW8sOA11IZHf9VAXiJpzWMWe2iJFcwxlmI8
 UEcaVnNnwoU3+t8biQ2Yq1a/4utI9+2eYF0J3m3WfvB2NZishMcge9cOSszi8QzZQt6u
 ccAoMTfjj+DDY8QY95Ci4zk9BSPsts+fczKTMzNk2p9EHVu7IUIZE0bV6NZuVWOb4oCw
 1pcyPp7mpxMgkI3sf1JeuRFmj153ohRrh0eP/yglPDe7YonI+3qyk8OeqeqEFYDtLdEr
 YD7EnamB/s+zC3aQQCby63AF+6wTeWKXU27epi/NWJEugR2B4EKq9gkuAx1RWi1vnMDq
 1Q6w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=gyJEJbe3qSDyTfBto5DwjNT4Oro7AM/9dr/yLOYbuxk=;
 b=A0wKycWgXFW1cWTJ4KnoKQJyZ5u27Ttq38DwUOLWpsR74zLUngQZ+11Xk+UXkoKh4m
 fGDdli7zVl1YcYJq5HqmtMqnx+vX845zPlzeXhdeOak0lH3jAUJk6e0LlCLAyLP/mGpZ
 Tsf0IOpk5r7VlzOlU6nJhBN0dQUVYNOJIg/vH8ZgkhH4XUsG7cJWdNVeznAZ9MSq91Y0
 7IUnoRfh+6C1AMAkgGSMM+APJv9d+UVnZNPTEmDMtp3bk4xpHj9jiUbqzaVAnif5kzJP
 9YQ/xLjp0I7l5CiSjdf95JXwltGZCPuCNmcOPKYPHYVTb23X1EL1Rgv+VvV/3ZwJQKrP
 8jtQ==
X-Gm-Message-State: AOAM530PNkvlAGDcjL7VFpwv9BAn1FyQzyBcD1bl5kaKrD5vD4/+Cwod
 rHAmWmQY98F7R1Hq1baua4W3Fg==
X-Google-Smtp-Source: ABdhPJxS47bM2E1ri1Th9m9Zvbki29BKb891cxnQwBaUmlwamf5b4ZxaVBA/AuTdWgZU196C7had4A==
X-Received: by 2002:a17:90a:e409:: with SMTP id
 hv9mr12388194pjb.126.1622742210655; 
 Thu, 03 Jun 2021 10:43:30 -0700 (PDT)
Received: from [192.168.1.11] (174-21-70-228.tukw.qwest.net. [174.21.70.228])
 by smtp.gmail.com with ESMTPSA id
 o9sm2765383pjp.51.2021.06.03.10.43.29
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 03 Jun 2021 10:43:30 -0700 (PDT)
Subject: Re: [PATCH v2 20/26] s390x/tcg: Implement 32/128 bit for VECTOR FP
 TEST DATA CLASS IMMEDIATE
To: David Hildenbrand <david@redhat.com>, qemu-devel@nongnu.org
References: <20210517142739.38597-1-david@redhat.com>
 <20210517142739.38597-21-david@redhat.com>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <0d24ed70-c64b-6f1e-3656-1b69afb3b793@linaro.org>
Date: Thu, 3 Jun 2021 10:43:28 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <20210517142739.38597-21-david@redhat.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::635;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x635.google.com
X-Spam_score_int: -26
X-Spam_score: -2.7
X-Spam_bar: --
X-Spam_report: (-2.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.603,
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
Cc: Peter Maydell <peter.maydell@linaro.org>, Thomas Huth <thuth@redhat.com>,
 Cornelia Huck <cohuck@redhat.com>, Halil Pasic <pasic@linux.ibm.com>,
 Christian Borntraeger <borntraeger@de.ibm.com>, qemu-s390x@nongnu.org,
 =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 Aurelien Jarno <aurelien@aurel32.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 5/17/21 7:27 AM, David Hildenbrand wrote:
> Signed-off-by: David Hildenbrand<david@redhat.com>
> ---
>   target/s390x/helper.h           |  2 ++
>   target/s390x/translate_vx.c.inc | 23 ++++++++++++++--
>   target/s390x/vec_fpu_helper.c   | 47 +++++++++++++++++++++++++++++++++
>   3 files changed, 70 insertions(+), 2 deletions(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~

