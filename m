Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 40BD33C5E47
	for <lists+qemu-devel@lfdr.de>; Mon, 12 Jul 2021 16:22:18 +0200 (CEST)
Received: from localhost ([::1]:58706 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m2wp7-0006DO-Az
	for lists+qemu-devel@lfdr.de; Mon, 12 Jul 2021 10:22:17 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42860)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1m2wo6-0005Fd-0v; Mon, 12 Jul 2021 10:21:14 -0400
Received: from mail-wr1-x432.google.com ([2a00:1450:4864:20::432]:44860)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1m2wo4-0001ea-E1; Mon, 12 Jul 2021 10:21:13 -0400
Received: by mail-wr1-x432.google.com with SMTP id f9so20201437wrq.11;
 Mon, 12 Jul 2021 07:21:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=Sq0ttdjpDSIMveEICqJHSEJXNaIe2NyoZtztj9IRPnw=;
 b=HOajYmiJopg4BvFheVPsXN0gl3cFmkujRk9NcUhhp8JrdM0rAVoGMNJzfk73Zneww5
 TJOwtU7NIyt2m60bIZnBhvnGxkwtb9gPW0Yd9CyFG623c/dMRYb+HtrLz4FJ3aljT6LR
 kaLmqQ2etr/pVpKN2xIWjyLWVmatnwfT2BKFZfVtJNFsTGvm3SJbq7E8tTi3oXNTT25H
 TG4a13B+9PhsmOv7EIdCM64mg2a2izLbNydrZ1mwhQ4B9HXSsJ18RbjuX0Lg9oi7twXr
 NUjPZyR1Vfp0SgQhXRogAwalHDFY6WNyQVB7F7tSHgXQUWr6l61SkkFhMLvlw7TLli5u
 HmIg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:subject:to:cc:references:from:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=Sq0ttdjpDSIMveEICqJHSEJXNaIe2NyoZtztj9IRPnw=;
 b=T2Zxf6sHbJbQMitIceYEusOCrKnOVW9oP8x5JEKN0FKhrTpZxZBK5yaRst6h5OFiEX
 io+SZ+l7I0KcJWUgAh4oIuDm+IAJodDE0mXgE6js8iR3wY827BWdHo20DxKLDGH9CCb0
 DboFl8EGnzVnOnn5WrDBN61ooX2gNPfVlivgrA15suPrTOv0ca2Puv33lhisBV1kPoZp
 nRC6QX9gygR+r5vMAVBYDcGjIm2Shv3547DxTNMjIEUzpMF6Q8e1EEd7aQ5s8Zg5O0YV
 Ksoxz+JymDSKuG3Km7zQ0cMUafvSJKq2Bnj0SFIHwEagOkD6Y5NStr/QriALZUxU6m7X
 QiZQ==
X-Gm-Message-State: AOAM533pnIjDqvc/egVkefjGanwlsKa92dOdF/gUzwv+gC43rO0szS8y
 349ZB9gGWm4PzBUMEFxAwR2Q8t7lIKtMEA==
X-Google-Smtp-Source: ABdhPJx8EmJt1tEV+e3UiSgsjRQqqrwdjJHeIBORb26SEn77zzSm0bDqW+pfrIXjdhNRc5wMMW3MaA==
X-Received: by 2002:adf:e4d1:: with SMTP id v17mr6367012wrm.206.1626099670131; 
 Mon, 12 Jul 2021 07:21:10 -0700 (PDT)
Received: from [192.168.1.27] (abayonne-654-1-142-116.w86-222.abo.wanadoo.fr.
 [86.222.93.116])
 by smtp.gmail.com with ESMTPSA id f5sm15750477wrg.67.2021.07.12.07.21.08
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 12 Jul 2021 07:21:09 -0700 (PDT)
Subject: Re: [PATCH] hw: timer: Add i.MX sysctr timer implementation
To: Peter Maydell <peter.maydell@linaro.org>,
 Daniel Baluta <daniel.baluta@gmail.com>
References: <20210707113937.72602-1-daniel.baluta@oss.nxp.com>
 <CAFEAcA_L7nrw4zBV7pKYcV+H+4qJT60PFkJYA_w-8FSwOqNmXw@mail.gmail.com>
 <CAEnQRZCJC4WmrGy6NnMmwUkscjn-HcOQmvni580t58b4s7pFKQ@mail.gmail.com>
 <CAFEAcA-ZS0anZESVD0+bLE23K6Z_TSS-=NqRZGsK-buQ9OTkyA@mail.gmail.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
Message-ID: <6b3bbab4-b5fc-bf4a-5556-051a27522c11@amsat.org>
Date: Mon, 12 Jul 2021 16:21:08 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <CAFEAcA-ZS0anZESVD0+bLE23K6Z_TSS-=NqRZGsK-buQ9OTkyA@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2a00:1450:4864:20::432;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wr1-x432.google.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.248,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.248, NICE_REPLY_A=-1.479,
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
Cc: Mancas Viorica <vioricamancas@yahoo.com>,
 Daniel Baluta <daniel.baluta@oss.nxp.com>,
 Daniel Baluta <daniel.baluta@nxp.com>, QEMU Developers <qemu-devel@nongnu.org>,
 qemu-arm <qemu-arm@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 7/12/21 4:02 PM, Peter Maydell wrote:
> On Mon, 12 Jul 2021 at 14:58, Daniel Baluta <daniel.baluta@gmail.com> wrote:
>>
>> On Wed, Jul 7, 2021 at 10:21 PM Peter Maydell <peter.maydell@linaro.org> wrote:
>>>
>>> On Wed, 7 Jul 2021 at 12:39, Daniel Baluta <daniel.baluta@oss.nxp.com> wrote:
>>>>
>>>> From: Viorica Mancas <vioricamancas@yahoo.com>
>>>>
>>>> The System Counter (SYS_CTR) is a programmable system counter, which provides a
>>>> shared time base to multiple processors. It is intended for applications where the counter
>>>> is always powered on, and supports multiple unrelated clocks.
>>>>
>>>> This system counter can be found on NXP i.MX8MN.
>>>>
>>>> Signed-off-by: Viorica Mancas <vioricamancas@yahoo.com>
>>>> Signed-off-by: Daniel Baluta <daniel.baluta@nxp.com>
>>>
>>> Is there a board model or an update to an existing board that
>>> would use this device? We don't usually take device models that
>>> are completely unused upstream.
>>
>> Hi Peter,
>>
>> This can be found in i.MX8MN board. Should we add this patch together
>> with the upcoming patches for i.MX8?
> 
> Yeah, you should start with a board model plus a minimal
> set of devices as the initial part to try to upstream.

And documentation/test for this new board, so others know how to
use your board, and tests will protect your code for regressions.

