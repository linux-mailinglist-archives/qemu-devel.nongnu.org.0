Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 476252FF5AE
	for <lists+qemu-devel@lfdr.de>; Thu, 21 Jan 2021 21:19:35 +0100 (CET)
Received: from localhost ([::1]:42600 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l2gQX-0004w6-Rk
	for lists+qemu-devel@lfdr.de; Thu, 21 Jan 2021 15:19:33 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:43430)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1l2gOJ-00038X-Mq
 for qemu-devel@nongnu.org; Thu, 21 Jan 2021 15:17:16 -0500
Received: from mail-pg1-x532.google.com ([2607:f8b0:4864:20::532]:33266)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1l2gOH-0002Rr-RU
 for qemu-devel@nongnu.org; Thu, 21 Jan 2021 15:17:15 -0500
Received: by mail-pg1-x532.google.com with SMTP id n25so2121345pgb.0
 for <qemu-devel@nongnu.org>; Thu, 21 Jan 2021 12:17:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=lUgAlrh8Dr3rGM529OFEPRP+rqyMsI9PQ8PocbGawjY=;
 b=PGhFYiP6R5soGRfKdwhZLIRth+LMxLrQ8rZ/5+kpUJjYFh5IPmCRJVNGk2Ry7jjUz1
 OspWfW7c+Hx6rXz/lDic8+CpJ42Rcosx5DLxAQ8GjgG+c275Ii/60HjATwoaMda0l5WO
 mZ+IwxPskYvjPmCKHuyIT7Vc3UM1p9tsADZIDkhCBrlgZTE3L+A3YhrnXKfdEB+o43NC
 ZsI7TwP1cyWhaQc2etdyQTqZSpOnwpAff3tU+fLwor72htS0dcOkLBG7Pgn2oJ+PZr/+
 /s3LOthus31Q5mOgavSlfqX3mz4BVAoFfV9DAKiQgDzrz2oPBp45jwCst7TDdLCzMrnw
 JIuA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=lUgAlrh8Dr3rGM529OFEPRP+rqyMsI9PQ8PocbGawjY=;
 b=VSWk4Het7WX88bStfkaEaOMAEc4H89dZLfL6BUZwAmLBlKSYraCR7mmABO/8bJDH+x
 eGtUvV/CneehtjYokMqclH3eYzvwjnAhEWwytKWDlDZMCbai6mH+bFQ+Ew/6DA0d2zLj
 R0xdpHYuWb/vXvTOhkhGVBpw6jwEaYrJxHYuf+uqKAxIZv4CgpnNM/NxtAtd2syQOYUN
 OezJ2DJUiEa0YQszz1KXFi8DsbafpiyraHc9DxgprjBh8ozmrWv45BtKF9b1EUPV32Fg
 cFUZDaMgzPlk0cgI3ae9iDdgf94oo9mVhzZSz05PsIEl3YwkGTNFm8IG6JxJkLw/w4Nw
 PjNg==
X-Gm-Message-State: AOAM5318wFVeql3PcfqbC0ux8ARFkxXNRSw4dpISkX3+WG1Fy/s6n0rl
 aGQzRSlquwtKOESRVoc1+aVjNyMzcxY4yA==
X-Google-Smtp-Source: ABdhPJxhOudxqWZWYaPW6wqpfaBEYfhmxzatIKPHVxja7ce3CoA/4MmlCdUwHrCUSGRo574zCYy7XQ==
X-Received: by 2002:a63:db54:: with SMTP id x20mr1021337pgi.200.1611260232246; 
 Thu, 21 Jan 2021 12:17:12 -0800 (PST)
Received: from [192.168.3.43] (cpe-66-75-72-126.hawaii.res.rr.com.
 [66.75.72.126])
 by smtp.gmail.com with ESMTPSA id a18sm6452439pfg.107.2021.01.21.12.17.10
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 21 Jan 2021 12:17:11 -0800 (PST)
Subject: Re: [PATCH 0/5] tcg: Dynamically allocate temporaries
To: BALATON Zoltan <balaton@eik.bme.hu>
References: <20210119183428.556706-1-richard.henderson@linaro.org>
 <7595e6e-bc3d-d626-656b-e7ba3bfd8b90@eik.bme.hu>
 <4d24ab64-6b6-ae28-4e34-9d68c99a4a48@eik.bme.hu>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <4281450c-4f38-e613-3b1f-9febbb2be8fc@linaro.org>
Date: Thu, 21 Jan 2021 10:17:08 -1000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <4d24ab64-6b6-ae28-4e34-9d68c99a4a48@eik.bme.hu>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::532;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x532.google.com
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
Cc: lvivier@redhat.com, alistair23@gmail.com, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 1/21/21 10:09 AM, BALATON Zoltan wrote:
> On Wed, 20 Jan 2021, BALATON Zoltan wrote:
>> On Tue, 19 Jan 2021, Richard Henderson wrote:
>>> My recent change for caching tcg constants has, in a number of cases,
>>> overflowed the statically allocated array of temporaries.  Change to
>>> dynamic allocation.
>>
>> This seems to work for me so
>>
>> Tested-by: BALATON Zoltan <balaton@eik.bme.hu>
>>
>> but have you done any performance tests to check that this actually improves
>> emulation speed? To mee it seems slower. Booting AmigaOS on sam460ex with
>> c0dd6654f207 (just before your TCG series) takes:
>>
>> real    0m33.829s
>> user    0m34.432s
>> sys    0m0.296s
>>
>> but on HEAD with this series:
>>
>> real    0m44.381s
>> user    0m46.058s
>> sys    0m0.532s
>>
>> This is noticable decrease in speed also without measuring it. With just
>> increasing the TCG_MAX_TEMPS to 2048 on 7c79721606be without this series I get:
>>
>> real    0m42.681s
>> user    0m44.208s
>> sys    0m0.435s
>>
>> So the performance regression is somewhere in the original series not in this
>> fix up series.
> 
> I've tried to do more measurements to identify where it got slower but I could
> not reproduce it today. I'm now getting around 42 seconds both before and after
> the series so not sure what made it faster before but it's probably not because
> of a code change then.

That's reassuring.  I hadn't been able to measure a performance regression myself.

(The kind of TB that caused this SEGV thread and creates oodles of temps seems
to be an outlier.  Otherwise there should be very little change to non-vector
code.)


r~

