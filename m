Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 85397161B31
	for <lists+qemu-devel@lfdr.de>; Mon, 17 Feb 2020 20:03:02 +0100 (CET)
Received: from localhost ([::1]:51168 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1j3lfZ-0003Xq-JE
	for lists+qemu-devel@lfdr.de; Mon, 17 Feb 2020 14:03:01 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:50986)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <richard.henderson@linaro.org>) id 1j3le6-0002Vn-Ql
 for qemu-devel@nongnu.org; Mon, 17 Feb 2020 14:01:32 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <richard.henderson@linaro.org>) id 1j3le5-0001zv-Vb
 for qemu-devel@nongnu.org; Mon, 17 Feb 2020 14:01:30 -0500
Received: from mail-pl1-x644.google.com ([2607:f8b0:4864:20::644]:42776)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <richard.henderson@linaro.org>)
 id 1j3le5-0001zY-Ou
 for qemu-devel@nongnu.org; Mon, 17 Feb 2020 14:01:29 -0500
Received: by mail-pl1-x644.google.com with SMTP id e8so7076618plt.9
 for <qemu-devel@nongnu.org>; Mon, 17 Feb 2020 11:01:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=tEmx3WEhDoho+/eUbnNKpae0yPyjdbWLb7TyyWXGlR0=;
 b=RVOY4FNra7RBZGkSa+MVSOYWRUNMFlE4wznRUpzeZkV7pRQtxWSjoriFQS54yOzeoU
 CQ3Q90pW3xlY6eQ2ogXMgiP3q3VJfaaUBnUVT4KQctY6zosSbNQcFgCFE2vI4q3eYVir
 3CKkopQiYfJyTy3uGO/L/+lLbAdGX9ESltRXIBNc8Fve5UDzRqTZ4YD721bhSjEpZFRs
 D2lamg9gW248lGXE0sGh5BWZQ9MjcJZSI6ymSlPBoF/x5bUGGxBQYKbqwAg8h9r9wK5s
 S+yuRAgWT50L0MYEvbtkDMV9Y6M94s+XZ+mskfWH45vwhFYE/gBjwKWvrJps6q7pWkfL
 ACUA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=tEmx3WEhDoho+/eUbnNKpae0yPyjdbWLb7TyyWXGlR0=;
 b=svg7DfbCry5NOOWjfHVj7dNCGrKcEEi/TX1/peKd3+3LMcyAcN1JlffFwm1Cxxcw7m
 ERBeeFOLbFQth/vNWbmMUWEsqVcujnbg3p905axtdTBkg1DuNnRkXFoxHc4f0i7OVvud
 7bTlSSXc3nRMfgyH/QbN/MF6qMWiDi+ANOZbaVx/4HwP6Rbi6K+I71zuN3WWSiwGpzi9
 76sDwfYtzk8HIW3G1jOjwZR7F3d/gG4338K51/MbgUVPi7k9/sFVf4B5ysyOb+Txrmc+
 f5z7hsDtbDghlTz1m28D38oAKMdXGd5xxG6ZVNAonO4FPLcC+YV40Z3HOgQ6pONqyn/O
 er/Q==
X-Gm-Message-State: APjAAAWGAKEPbJTC65puRXfav5GyZX3yOTw9BL4gEDfNH5Bok76vfNTM
 DOHdIevMOAk1p9LKXYnCx4cStQ==
X-Google-Smtp-Source: APXvYqyq02P47hfmLORP8WuEAS21qD0TbyrRZZW71uwaL3pivwrRTRQalkLKgkcUdTAX7HQx/P5l6A==
X-Received: by 2002:a17:902:be04:: with SMTP id
 r4mr16988415pls.315.1581966088722; 
 Mon, 17 Feb 2020 11:01:28 -0800 (PST)
Received: from [192.168.1.11] (97-126-123-70.tukw.qwest.net. [97.126.123.70])
 by smtp.gmail.com with ESMTPSA id
 d3sm1114843pfn.113.2020.02.17.11.01.27
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 17 Feb 2020 11:01:27 -0800 (PST)
Subject: Re: [PATCH v5 21/79] arm/mcimx7d-sabre: use memdev for RAM
To: Igor Mammedov <imammedo@redhat.com>, qemu-devel@nongnu.org
References: <20200217173452.15243-1-imammedo@redhat.com>
 <20200217173452.15243-22-imammedo@redhat.com>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <cb820f07-0ce5-df9d-49eb-453344752f70@linaro.org>
Date: Mon, 17 Feb 2020 11:01:26 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.4.1
MIME-Version: 1.0
In-Reply-To: <20200217173452.15243-22-imammedo@redhat.com>
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
Cc: andrew.smirnov@gmail.com, Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 2/17/20 9:33 AM, Igor Mammedov wrote:
> memory_region_allocate_system_memory() API is going away, so
> replace it with memdev allocated MemoryRegion. The later is
> initialized by generic code, so board only needs to opt in
> to memdev scheme by providing
>   MachineClass::default_ram_id
> and using MachineState::ram instead of manually initializing
> RAM memory region.
> 
> PS:
>  remove no longer needed MCIMX7Sabre
> 
> Signed-off-by: Igor Mammedov <imammedo@redhat.com>
> Reviewed-by: Andrew Jones <drjones@redhat.com>
> ---
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>


r~


