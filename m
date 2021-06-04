Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2E18539B995
	for <lists+qemu-devel@lfdr.de>; Fri,  4 Jun 2021 15:10:59 +0200 (CEST)
Received: from localhost ([::1]:52544 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lp9bG-0003t1-1Y
	for lists+qemu-devel@lfdr.de; Fri, 04 Jun 2021 09:10:58 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57992)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lp9aK-0002zF-D5; Fri, 04 Jun 2021 09:10:00 -0400
Received: from mail-ed1-x52a.google.com ([2a00:1450:4864:20::52a]:39753)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lp9aG-0006Zj-Nu; Fri, 04 Jun 2021 09:09:59 -0400
Received: by mail-ed1-x52a.google.com with SMTP id dj8so11088322edb.6;
 Fri, 04 Jun 2021 06:09:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=MqRyYQ+I+iFUDaFFWtEOFoxn5b1kujZnNRO2/JIpxjk=;
 b=eeLaU9hgZu7mx/Rdken3bv6UmHJbZL8rHDank42/oL99iVuwhAtj2vVOcARhF5rH4Y
 PPrX+7MlaxQYkOHeuPtRIyro8f8UepvBluRPFpMSA8nbZOfLCnGqN+6FBPGoQQ4MoxrQ
 fTuO5UJAmHQ7Flbtxk2io8XRRNlrDdOzQv5BQ6TQbllkPXEnlqZrbvfHQwIpXvj+9N1p
 /UogmmYj2AHlJyJowvnbHoTGt/BQFk03A1D8FME2IpZd+E4ojxNxHkdkXxs/n/mIH/68
 RlQZGTA6s9Wtoipo1lgs4JNfhYAo2/sQ9+QkcXp5WJvBOTD2NHMm+2YD8IJNIZSyqegE
 F2Jw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:subject:to:cc:references:from:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=MqRyYQ+I+iFUDaFFWtEOFoxn5b1kujZnNRO2/JIpxjk=;
 b=KFb1Fd+j6EENkKUI9lWXd4KZzaKTwFm57TPKXmTnKHRsgLw4wwBRUalKB6629aBInk
 kvDWEpzzsVdAH3CZaSNcPhGsHvOjELjv1GO2mJaoxqmQV8phR6GPs/QaeShXJiVMfaYl
 eBpuAXLvm36wCBxZiYH7XM/YEh1HB/eftQQXjBOrlIBHXbLsRwUSfG5+4+PNL3ADQrNm
 sYpVhDg1xAqsnGHkJvDUZCQhJ2HCG/PcBi5OcoX/i56x1ZLomJORLy8ElFg0cJcS75dD
 clvCQI/Cb63CZ1MTfMY7vZXwkU3hI5js3zbPwmk6k5bzcG9HSZfHMRRVqDVERtcDWDYE
 XmCQ==
X-Gm-Message-State: AOAM532M60QJkrRDQZWJc4/yuvruA7NULato8BEAb/CZRTxfFZNYWF68
 rWxT6NWw5gycblv/AYudm+E=
X-Google-Smtp-Source: ABdhPJxSrU/LGE3ZMw8WJ7Nm6uztGex+WrWkBHFFITwrND7SYTFKT1sKpf82nJd2Aw9T5yEOkf17hg==
X-Received: by 2002:a50:8dc6:: with SMTP id s6mr4663953edh.50.1622812194359;
 Fri, 04 Jun 2021 06:09:54 -0700 (PDT)
Received: from [192.168.1.36] (235.red-83-57-168.dynamicip.rima-tde.net.
 [83.57.168.235])
 by smtp.gmail.com with ESMTPSA id y1sm2696938ejl.7.2021.06.04.06.09.53
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 04 Jun 2021 06:09:53 -0700 (PDT)
Subject: Re: [PATCH v2] hw/intc/arm_gicv3_cpuif: Tolerate spurious EOIR writes
To: Jean-Philippe Brucker <jean-philippe@linaro.org>, peter.maydell@linaro.org
References: <20210604130352.1887560-1-jean-philippe@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
Message-ID: <49e31608-6271-e7a4-9760-6ad4ce51430b@amsat.org>
Date: Fri, 4 Jun 2021 15:09:52 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.1
MIME-Version: 1.0
In-Reply-To: <20210604130352.1887560-1-jean-philippe@linaro.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::52a;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-ed1-x52a.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.249, NICE_REPLY_A=-0.59,
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
Cc: shashi.mallela@linaro.org, qemu-arm@nongnu.org, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 6/4/21 3:03 PM, Jean-Philippe Brucker wrote:
> Commit 382c7160d1cd ("hw/intc/arm_gicv3_cpuif: Fix EOIR write access
> check logic") added an assert_not_reached() if the guest writes the EOIR
> register while no interrupt is active.
> 
> It turns out some software does this: EDK2, in
> GicV3ExitBootServicesEvent(), unconditionally write EOIR for all
> interrupts that it manages. This now causes QEMU to abort when running
> UEFI on a VM with GICv3. Although it is UNPREDICTABLE behavior and EDK2
> does need fixing, the punishment seems a little harsh, especially since
> icc_eoir_write() already tolerates writes of nonexistent interrupt
> numbers. Display a guest error and tolerate spurious EOIR writes.
> 
> Fixes: 382c7160d1cd ("hw/intc/arm_gicv3_cpuif: Fix EOIR write access check logic")
> Signed-off-by: Jean-Philippe Brucker <jean-philippe@linaro.org>
> ---
> v2: Added qemu_log_mask() (so I didn't keep the Reviewed-by tag)
> v1: https://lore.kernel.org/qemu-devel/20210603110012.1182530-1-jean-philippe@linaro.org/
> 
> ---
>  hw/intc/arm_gicv3_cpuif.c | 5 ++++-
>  1 file changed, 4 insertions(+), 1 deletion(-)

Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>

