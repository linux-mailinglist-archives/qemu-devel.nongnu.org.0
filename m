Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 151CE1619C5
	for <lists+qemu-devel@lfdr.de>; Mon, 17 Feb 2020 19:35:23 +0100 (CET)
Received: from localhost ([::1]:50500 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1j3lEn-0003OW-Jo
	for lists+qemu-devel@lfdr.de; Mon, 17 Feb 2020 13:35:21 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:46677)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <richard.henderson@linaro.org>) id 1j3lCc-0001A1-2E
 for qemu-devel@nongnu.org; Mon, 17 Feb 2020 13:33:06 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <richard.henderson@linaro.org>) id 1j3lCa-0003Zc-SZ
 for qemu-devel@nongnu.org; Mon, 17 Feb 2020 13:33:05 -0500
Received: from mail-pl1-x644.google.com ([2607:f8b0:4864:20::644]:32907)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <richard.henderson@linaro.org>)
 id 1j3lCa-0003Z2-J3
 for qemu-devel@nongnu.org; Mon, 17 Feb 2020 13:33:04 -0500
Received: by mail-pl1-x644.google.com with SMTP id ay11so7070861plb.0
 for <qemu-devel@nongnu.org>; Mon, 17 Feb 2020 10:33:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=zf44bj5oux32Vpd/pLGHe003vx++Jyja07rTyXZgt4Q=;
 b=MHdJcUZXaD+t8sTQeZ67rKfvOKHShSVnIRPmRBc4bqiSLpQtRnrflVd4KoaB6vkRSc
 YzWpxL7Z3AxrC8nh06IvQ9Agl5Zwl37HitbbmnJDmci3ci1SxETZWTpiGZg5+ywxsQ9/
 nci/Ep3xdF5D9+ZXMiAp1Sb323QfSSYFBkohQ0sU6euq6gDbcFO7T4zROb17VVnE/I8J
 53f/jaYn2Lihl1HdrjTCYPCitSuZgKh47Z6u/lyuF8pfhhpmc1Bdqft47TtLnskV+Gax
 vanfgRGVU2v3FiYV0HxMz5uBVzxlkH8O9jvTfE7q1nfRxTfivngjScaSY5ZQz6IDxUWD
 +w2g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=zf44bj5oux32Vpd/pLGHe003vx++Jyja07rTyXZgt4Q=;
 b=FFe5jDE2KlCzQ6zyk4DEBDmQ3ZuIK4rj90oLQ9Imu+dQsw+BhDMYd28oBwQSn38CDO
 1e02RCfgEqA+HHbN0+RtnAf51nve/ajJbkZ+E95P5+qSxT6uwK1Yx/+PxA/m5a5zqtth
 gVrtKyIdVcQqQEL5V0jiEaQP0clTIBm10IlOyKLoEQmWG4+J6+9r4zzWjmrAUXAEW1gT
 jjJfeZYXPi7hN+YoqXaONy540kS6r+CuS9SkTXFvnHBRsXzW/MRqUJEEomF839E5t9qU
 xOMNcBHK2W5N6b2ERp2akkgO+Ex7mYJYZrkT5dTDQvzfQDBQtLETGN53y1OG09tKxemQ
 r0tA==
X-Gm-Message-State: APjAAAUcUmLbAqcddit8GxgwnQkspcweXqoqnlLOhanwSON63wLT82Ec
 zlFSpfx0h59ZjkLJ9KF874RTnQ==
X-Google-Smtp-Source: APXvYqzCNSjSUwnHRQvoKTLMPSkwrF8g/PQZAAc/KUgrtjzwQtacOazDK98JfROP89fk9nlbKPK5AQ==
X-Received: by 2002:a17:902:694c:: with SMTP id
 k12mr16770983plt.329.1581964383338; 
 Mon, 17 Feb 2020 10:33:03 -0800 (PST)
Received: from [192.168.1.11] (97-126-123-70.tukw.qwest.net. [97.126.123.70])
 by smtp.gmail.com with ESMTPSA id
 199sm1159798pfv.81.2020.02.17.10.33.02
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 17 Feb 2020 10:33:02 -0800 (PST)
Subject: Re: [PATCH v5 41/79] hppa: use memdev for RAM
To: Igor Mammedov <imammedo@redhat.com>, qemu-devel@nongnu.org
References: <20200217173452.15243-1-imammedo@redhat.com>
 <20200217173452.15243-42-imammedo@redhat.com>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <6410d8c9-9335-9a18-fa4a-1278f3039191@linaro.org>
Date: Mon, 17 Feb 2020 10:33:00 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.4.1
MIME-Version: 1.0
In-Reply-To: <20200217173452.15243-42-imammedo@redhat.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2607:f8b0:4864:20::644
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
Cc: Paolo Bonzini <pbonzini@redhat.com>, deller@gmx.de, rth@twiddle.net
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 2/17/20 9:34 AM, Igor Mammedov wrote:
> memory_region_allocate_system_memory() API is going away, so
> replace it with memdev allocated MemoryRegion. The later is
> initialized by generic code, so board only needs to opt in
> to memdev scheme by providing
>   MachineClass::default_ram_id
> and using MachineState::ram instead of manually initializing
> RAM memory region.
> 
> Signed-off-by: Igor Mammedov <imammedo@redhat.com>
> ---
> CC: rth@twiddle.net
> CC: deller@gmx.de
> ---
>  hw/hppa/machine.c | 10 +++-------
>  1 file changed, 3 insertions(+), 7 deletions(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>


r~

