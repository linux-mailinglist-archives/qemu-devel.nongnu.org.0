Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0A0E339AA8F
	for <lists+qemu-devel@lfdr.de>; Thu,  3 Jun 2021 20:56:41 +0200 (CEST)
Received: from localhost ([::1]:52348 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1losWG-0004cJ-1C
	for lists+qemu-devel@lfdr.de; Thu, 03 Jun 2021 14:56:40 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50986)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1losUl-0003ce-NO
 for qemu-devel@nongnu.org; Thu, 03 Jun 2021 14:55:07 -0400
Received: from mail-pl1-x633.google.com ([2607:f8b0:4864:20::633]:40954)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1losUj-0005Fq-Nh
 for qemu-devel@nongnu.org; Thu, 03 Jun 2021 14:55:07 -0400
Received: by mail-pl1-x633.google.com with SMTP id e7so3371551plj.7
 for <qemu-devel@nongnu.org>; Thu, 03 Jun 2021 11:55:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=YYYyZYf25IXa1WTd42JPVFX9hwQfB2FW9XYLcL4ksYc=;
 b=WnsvqL78h/4QOZ0KCNE90Z36KA2FQ4IrUwsKmyg9ygGufylxl6eOqIBz2y1zj5z5AT
 gQ8MDlBRa0jSNcJq+UjSqr3yu10Zh0u6BW3hjlr45SAivtD0EdC5F9Ix2eYtVTCtFnLx
 bLjH+l4GsjOICDOZS+F1BRa4fjtzFpiQh03mmafHjQI0hdwHEBsjo4abrkGiDj4ckbjm
 QobquRbrFXUazdH9rjOMCy9mM1cDhLdvHgHLxDPp+FfVTVs0HR7AnNq3UI380heEGJuk
 BRY+OWZxE4T8inXwp6MoOo6QOqCXFBh76h2ZtffHlgtRoj3m93zUq/OOuJ0xBBUNW58D
 H+Gg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=YYYyZYf25IXa1WTd42JPVFX9hwQfB2FW9XYLcL4ksYc=;
 b=tbWZx/ZeuoOohzC8715XqgZKKWh+ATd07ZuAJ6b0aHZ3MRGSr6fOpQjiTPllnOEmML
 BrKdvekRDJvOgDS+cZrCnY38w9WwE2HQgVybSRcrWI01LGX8Ku8qb8nWwljMozP2RMHj
 BMVjJU5j4uASE05+HkBJhOxRmV+ykyuxJ342Pno5LgDHMFCSmpRPEbg5O0sugUEfV+Zo
 4Jax7RT/mQWzlZrMVdpmgwWHTNpiw+IlRxq9dAwcoZh5QFb1OKYLmSWJn8GiMyNyR1NV
 5ve7LXLvGApStMNsN4t/LeZu3oxLbyolnM/C2v2RR9OMCeA3CIOTLyEm52lB4Nd6oh54
 r/JQ==
X-Gm-Message-State: AOAM531+FAA7ARkHUrnJDxPy1JiLvkvwXVJD4kj8FoQAVqd4dS5KXBEJ
 q2WxtJu1ewyZbozvQ0zMqkI/xw==
X-Google-Smtp-Source: ABdhPJyxaez0LW3DG+gW5kPk4kT6c8hPejjDsFt7MysN6PaaLo/0FeoB8I3Uwn+LK3YzTyKSyISA/Q==
X-Received: by 2002:a17:902:d3ca:b029:104:ebfd:a554 with SMTP id
 w10-20020a170902d3cab0290104ebfda554mr572754plb.13.1622746504218; 
 Thu, 03 Jun 2021 11:55:04 -0700 (PDT)
Received: from [192.168.1.11] (174-21-70-228.tukw.qwest.net. [174.21.70.228])
 by smtp.gmail.com with ESMTPSA id
 a4sm2687329pjw.46.2021.06.03.11.55.03
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 03 Jun 2021 11:55:03 -0700 (PDT)
Subject: Re: [PATCH 2/3] hw/acpi: Provide function acpi_ghes_present()
To: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org
References: <20210603171259.27962-1-peter.maydell@linaro.org>
 <20210603171259.27962-3-peter.maydell@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <584f30be-6beb-81d4-5c72-30639617606d@linaro.org>
Date: Thu, 3 Jun 2021 11:55:02 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <20210603171259.27962-3-peter.maydell@linaro.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::633;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x633.google.com
X-Spam_score_int: -26
X-Spam_score: -2.7
X-Spam_bar: --
X-Spam_report: (-2.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.603,
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
Cc: Igor Mammedov <imammedo@redhat.com>, Dongjiu Geng <gengdongjiu1@gmail.com>,
 Swetha <swjoshi@microsoft.com>, "Michael S. Tsirkin" <mst@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 6/3/21 10:12 AM, Peter Maydell wrote:
> Allow code elsewhere in the system to check whether the ACPI GHES
> table is present, so it can determine whether it is OK to try to
> record an error by calling acpi_ghes_record_errors().
> 
> (We don't need to migrate the new 'present' field in AcpiGhesState,
> because it is set once at system initialization and doesn't change.)
> 
> Signed-off-by: Peter Maydell<peter.maydell@linaro.org>
> ---
>   include/hw/acpi/ghes.h |  9 +++++++++
>   hw/acpi/ghes-stub.c    |  5 +++++
>   hw/acpi/ghes.c         | 17 +++++++++++++++++
>   3 files changed, 31 insertions(+)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~

