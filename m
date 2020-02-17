Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 74CAB161BAF
	for <lists+qemu-devel@lfdr.de>; Mon, 17 Feb 2020 20:35:09 +0100 (CET)
Received: from localhost ([::1]:52026 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1j3mAe-0000Hu-F0
	for lists+qemu-devel@lfdr.de; Mon, 17 Feb 2020 14:35:08 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:55949)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <richard.henderson@linaro.org>) id 1j3m7z-0004v4-Jx
 for qemu-devel@nongnu.org; Mon, 17 Feb 2020 14:32:24 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <richard.henderson@linaro.org>) id 1j3m7y-0004hA-Jm
 for qemu-devel@nongnu.org; Mon, 17 Feb 2020 14:32:23 -0500
Received: from mail-pl1-x641.google.com ([2607:f8b0:4864:20::641]:41995)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <richard.henderson@linaro.org>)
 id 1j3m7y-0004gm-Dv
 for qemu-devel@nongnu.org; Mon, 17 Feb 2020 14:32:22 -0500
Received: by mail-pl1-x641.google.com with SMTP id e8so7107777plt.9
 for <qemu-devel@nongnu.org>; Mon, 17 Feb 2020 11:32:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=DOSc99TPq+iHWlIgbzJ98LWgMViJiAlVN8DFv6VjtBA=;
 b=QsCKlaQkYVj6rDoM/+5WjouLYSuNH/AJU5W5HkWNj3xRDpTqF73y//2U8GqWVBheTc
 eMWrwHivf4S9KNR0QJQb8tyt3GF+Qpvg1dXRf1IprmTidoLNTPeEu/Y23nymWiY3XGa7
 2UM8HsW+vQb4vWuoOwOh1Qqg4Uvl13FNxd0k6pRZeQO3Zn6Pw0ws3TwBwGlg3F5lRCUL
 hst0ZHbAcNZjncxn55o2/AgZqu9RiD57XHbnmYtJrIFP5db4d9g4zeDJu9sRc+fZSFBF
 5aCTa7bASQcs+GPAt936s8x4CjPf8VmOt9kvnPn6Wn5+xCM/q1C61dJa0x/Z1IcOzNY2
 2nvQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=DOSc99TPq+iHWlIgbzJ98LWgMViJiAlVN8DFv6VjtBA=;
 b=IJBMFnLU6mlvmlk2pwlCirflPCbI8QhQffeFOzau1sJEOEtemRb7v8Sy2mJe0ts3q4
 keHn4T5q9JgeMNJW9UzyUyiJnC3mTNMMUiqnmbFG/jSCOF0B5E6HrlYrGKF1ji9vX9/D
 ewEcCzSheEV0Q7L3q8YRxOLqt45Rs84QxZOf76AZ7XfK2+tVosC8Mww2UJJyx8kZu1yo
 VqaLlZ7Pc/03tipsEsDB4mjaI902C3/uwwHTQpOzeL73NUqf30sMUvMrYLSHqqd1Zts7
 daQnVHaHt4+Oc3LWBQIUYYnPkt9onrcrf/kUNDgMsUbKlaPXrtScKTpOKmUnq7GiQk1J
 IBKg==
X-Gm-Message-State: APjAAAWUndq/Sq4rsVJGjLqbRFevl4ayOa7ZVQ4bWNoiD9zZPeOqa5dE
 Ecd6Go1+VZOBrqlXx1JSlqOD/A==
X-Google-Smtp-Source: APXvYqyfllLbbEpdE18gyCGovn2cazfA2AGd8dTNHoW9+V0PgzIew5ffQNFIS3DAIqgLOp9ABHA27Q==
X-Received: by 2002:a17:902:6b84:: with SMTP id
 p4mr16690136plk.15.1581967941502; 
 Mon, 17 Feb 2020 11:32:21 -0800 (PST)
Received: from [192.168.1.11] (97-126-123-70.tukw.qwest.net. [97.126.123.70])
 by smtp.gmail.com with ESMTPSA id
 c19sm1733138pgh.8.2020.02.17.11.32.20
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 17 Feb 2020 11:32:20 -0800 (PST)
Subject: Re: [PATCH v5 59/79] ppc/e500: use memdev for RAM
To: Igor Mammedov <imammedo@redhat.com>, qemu-devel@nongnu.org
References: <20200217173452.15243-1-imammedo@redhat.com>
 <20200217173452.15243-60-imammedo@redhat.com>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <87567786-b225-8d53-1992-8b9487f465f3@linaro.org>
Date: Mon, 17 Feb 2020 11:32:19 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.4.1
MIME-Version: 1.0
In-Reply-To: <20200217173452.15243-60-imammedo@redhat.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2607:f8b0:4864:20::641
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
Cc: Paolo Bonzini <pbonzini@redhat.com>
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
> Acked-by: David Gibson <david@gibson.dropbear.id.au>
> ---
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>


r~


