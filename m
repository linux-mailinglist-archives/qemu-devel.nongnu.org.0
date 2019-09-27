Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9E93BC09D7
	for <lists+qemu-devel@lfdr.de>; Fri, 27 Sep 2019 18:53:08 +0200 (CEST)
Received: from localhost ([::1]:53608 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1iDtUR-0007U4-Hg
	for lists+qemu-devel@lfdr.de; Fri, 27 Sep 2019 12:53:07 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40348)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <richard.henderson@linaro.org>) id 1iDsmz-00028t-6b
 for qemu-devel@nongnu.org; Fri, 27 Sep 2019 12:08:14 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <richard.henderson@linaro.org>) id 1iDsmw-0004OW-M7
 for qemu-devel@nongnu.org; Fri, 27 Sep 2019 12:08:12 -0400
Received: from mail-pg1-x544.google.com ([2607:f8b0:4864:20::544]:34645)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <richard.henderson@linaro.org>)
 id 1iDsmw-0004Ml-B3
 for qemu-devel@nongnu.org; Fri, 27 Sep 2019 12:08:10 -0400
Received: by mail-pg1-x544.google.com with SMTP id y35so3774020pgl.1
 for <qemu-devel@nongnu.org>; Fri, 27 Sep 2019 09:08:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:openpgp:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=vPA0E/bNeovAx/hJ0RV/Q+VaC4xu2MfWcvyvvNKFDmA=;
 b=DVPNVVaMNuJYJOtq6PLbSWg+XebUX3NUW9pvaPIzV2G7avuAjDEWHeAHGCRnBHleEf
 EenQjggr9ERDid7aFNaw7z4NWoqJu8GC6RJKJOqobaxsmS4Rae0g0r7ZtxbKapwTeHsz
 zuOW3rrWCg0ubPmvLynBsk0UH7g7pJWcjI2mjEgXnki61uM0Lg57ihUNgcVtn4J9FkgR
 CfVczh77Ws3fAR6NfwWR70+NsGKefLEM0CwcPVhGk4ch82USxdan5rIH22MnfB8pxb1t
 ahgj8BxXj7n5lry3j7R2VzR8CCvPg0VYx+bilitfp/ixFO83N35QaU4Uidz2mFFs0uPd
 SSgg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:openpgp:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=vPA0E/bNeovAx/hJ0RV/Q+VaC4xu2MfWcvyvvNKFDmA=;
 b=h3P/6aW2YQifHBd+qEjnBLOE+6vlnzamhxSt1QZrUPEZwg4/fCF/xaRiZDoKWtElJP
 40k5AJccwagTK1yVOscx8cQS5381m3FndE9TcOnKUwnXqDjwP/MD8EyXxJFAPw0IjMfW
 Y9l7v+jXWuRaSYXgLfsMzVyf1r1qbFpmwgc6PoMTFNSgSjvy3kSBRy/yUP5oAxgZRcpi
 jm7D/wfEwIlt5KdR6N8jHzLe32OW9ZO1QZVk3PmtWbz7skjg3s0R70AG23pdKpzwGIRv
 nYlvC26DoKz+cZ21iQogT8wWZWUba00nU4KBZ6tnElRWzTlU/RriQy58fy4wrww34sK3
 HV+Q==
X-Gm-Message-State: APjAAAV6Ds50nq5QVVWoJmE+h/34TfpbeL4MOYFIy0QQHgP4gzzlEZn3
 zoS58oA/YisIrfG5NWpEq401Xw==
X-Google-Smtp-Source: APXvYqxOWble+lhcyuCUXtD3pF7kOb2q+73pxU9fjq3hAtUlGf3BFdj85VH156VScCwlVGq+/Mt+SQ==
X-Received: by 2002:a63:2006:: with SMTP id g6mr9882499pgg.287.1569600488873; 
 Fri, 27 Sep 2019 09:08:08 -0700 (PDT)
Received: from [172.20.32.216] ([12.157.10.118])
 by smtp.gmail.com with ESMTPSA id e6sm5611024pfl.146.2019.09.27.09.08.07
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Fri, 27 Sep 2019 09:08:07 -0700 (PDT)
Subject: Re: [PATCH v3 08/18] target/s390: Return exception from
 mmu_translate_real
To: David Hildenbrand <david@redhat.com>, qemu-devel@nongnu.org
References: <20190926162615.31168-1-richard.henderson@linaro.org>
 <20190926162615.31168-9-richard.henderson@linaro.org>
 <73b5d922-a7b1-ac62-3195-f0e35a6478b3@redhat.com>
From: Richard Henderson <richard.henderson@linaro.org>
Openpgp: preference=signencrypt
Message-ID: <bd55cebc-5a60-1c4b-24e0-0b9c505af622@linaro.org>
Date: Fri, 27 Sep 2019 09:08:05 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <73b5d922-a7b1-ac62-3195-f0e35a6478b3@redhat.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2607:f8b0:4864:20::544
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
Cc: qemu-s390x@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 9/27/19 3:44 AM, David Hildenbrand wrote:
> Note that
> 
> [PATCH v1 2/5] s390x/mmu: Implement ESOP-2 and
> access-exception-fetch/store-indication facility
> 
> also messes with the tec (which is okay), but also with the ILEN on
> instruction fetches.

Yes, I saw that minor conflict.  Easy to fix up.


r~

