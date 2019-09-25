Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B9748BE36F
	for <lists+qemu-devel@lfdr.de>; Wed, 25 Sep 2019 19:37:45 +0200 (CEST)
Received: from localhost ([::1]:55366 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1iDBEW-0007UA-9t
	for lists+qemu-devel@lfdr.de; Wed, 25 Sep 2019 13:37:44 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:52073)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <richard.henderson@linaro.org>) id 1iDBDP-0006rB-Gp
 for qemu-devel@nongnu.org; Wed, 25 Sep 2019 13:36:36 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <richard.henderson@linaro.org>) id 1iDBDO-0007eX-A8
 for qemu-devel@nongnu.org; Wed, 25 Sep 2019 13:36:35 -0400
Received: from mail-pg1-x543.google.com ([2607:f8b0:4864:20::543]:33100)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <richard.henderson@linaro.org>)
 id 1iDBDO-0007cY-1n
 for qemu-devel@nongnu.org; Wed, 25 Sep 2019 13:36:34 -0400
Received: by mail-pg1-x543.google.com with SMTP id i30so251234pgl.0
 for <qemu-devel@nongnu.org>; Wed, 25 Sep 2019 10:36:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:openpgp:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=8FtJ4kSv+fBASLFltN6A+y8E6bJ4Hebmn/tO3/QW1WE=;
 b=TqWpHbXngy4qjQViCRFv384tktV2GcdaN2Ig1LPTeGbj8Jqw0dnGXbiFTxlUGo5i+f
 Sk6qTXY5jlO9hp2+1PqUw3j0tQ7zfpd4uPvTBtHcUOzpFqfMga9vsGgfjlHCINDoQk9s
 +ZCO3csghBbE3XCjQPnvGa36GrPkIwUxbJu1QksINtvNgvhmZS84RxV4zl0vH+fikvo/
 wmIsnI2hHUP0hZIjzDWVf9XpoHcfozNVPsRCDwgP7qDXJzn6yrn7Rv/2Cmo3AbjiQaVW
 YM1fQilUm596iKhj8bAi+zTvSXiHx6ZpHi1W0aRAjtmlF4anT0R2OlAcXxXrCpZu3dqW
 llwg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:openpgp:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=8FtJ4kSv+fBASLFltN6A+y8E6bJ4Hebmn/tO3/QW1WE=;
 b=sK7uONSCxG9CPttwfX6Mg3vXOj8XJg7HePeiw2Yw/S439g3YHThMJr1YeoRrsEHAvZ
 ZAbcjZL7OvWfa2L+84B58UcMlNGla0HXbj+kaqjbn5dp5fsF5nqdY+GG1/fXaVwiBqgW
 xPKHlHEH0Wow555wNBishvRz4UJwu2HjTCccQavAqDaC6VT7LGLkopjXlrcsEgG3w3Oi
 gshyIM1FBin566DvFYbxuLDdP/jFsMYy/B5OCjZxi6RL6CF0CFimH4DKAeYD1NA6xb5w
 cL2PpKmq/mZDywcysz2ENCL4sqX2HKEjVsWlbb7oM5DZSPNZA8EPA4ldfv0EZyhV9Rc+
 XJeg==
X-Gm-Message-State: APjAAAVXfmAf1Qn8pxES7BzgHjbXZ92EJaGdB6PEiQdHRRWhCEiQl/tj
 KjzL5lGS7Va/671wgodMuUjPMA==
X-Google-Smtp-Source: APXvYqz6fRpyv0f6advnFNRoGePmKK4IDYY75PJIWXimw2mhQ2PtwQipC5aVUUT5eFk7sEle95hmPg==
X-Received: by 2002:aa7:8edd:: with SMTP id b29mr10987739pfr.138.1569432992796; 
 Wed, 25 Sep 2019 10:36:32 -0700 (PDT)
Received: from [172.20.32.216] ([12.206.46.61])
 by smtp.gmail.com with ESMTPSA id ep10sm11372530pjb.2.2019.09.25.10.36.31
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Wed, 25 Sep 2019 10:36:32 -0700 (PDT)
Subject: Re: [PATCH v4 06/16] cputlb: Introduce TLB_BSWAP
To: =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>
References: <20190923230004.9231-1-richard.henderson@linaro.org>
 <20190923230004.9231-7-richard.henderson@linaro.org>
 <87zhita6w9.fsf@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
Openpgp: preference=signencrypt
Message-ID: <87a14f8a-62bf-2d0c-4e11-d23ac28d095f@linaro.org>
Date: Wed, 25 Sep 2019 10:36:29 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <87zhita6w9.fsf@linaro.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2607:f8b0:4864:20::543
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
Cc: pbonzini@redhat.com, qemu-devel@nongnu.org, stefanha@redhat.com,
 david@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 9/24/19 11:25 AM, Alex Bennée wrote:
>> -
>> -            /* The backing page may or may not require I/O.  */
>> -            tlb_addr &= ~TLB_WATCHPOINT;
>> -            if ((tlb_addr & ~TARGET_PAGE_MASK) == 0) {
>> -                goto do_aligned_access;
>> -            }
>>          }
>>
>            /* We don't apply MO_BSWAP to op here because we want to
>             * ensure the compiler can always unfold and dead-code away
>             * the final load_memop in the fast path. If you try the
>             * you will find the assert will get you ;-)
>             */

I added

+        /*
+         * Keep these two load_memop separate to ensure that the compiler
+         * is able to fold the entire function to a single instruction.
+         * There is a build-time assert inside to remind you of this.  ;-)
+         */


r~

