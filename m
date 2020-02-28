Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5DC321741F3
	for <lists+qemu-devel@lfdr.de>; Fri, 28 Feb 2020 23:25:13 +0100 (CET)
Received: from localhost ([::1]:54544 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1j7o4F-0000UB-VP
	for lists+qemu-devel@lfdr.de; Fri, 28 Feb 2020 17:25:11 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:44280)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <richard.henderson@linaro.org>) id 1j7o3U-0008O0-MZ
 for qemu-devel@nongnu.org; Fri, 28 Feb 2020 17:24:25 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <richard.henderson@linaro.org>) id 1j7o3T-0005I6-L0
 for qemu-devel@nongnu.org; Fri, 28 Feb 2020 17:24:24 -0500
Received: from mail-pf1-x441.google.com ([2607:f8b0:4864:20::441]:33644)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <richard.henderson@linaro.org>)
 id 1j7o3T-0005Dk-El
 for qemu-devel@nongnu.org; Fri, 28 Feb 2020 17:24:23 -0500
Received: by mail-pf1-x441.google.com with SMTP id n7so2427559pfn.0
 for <qemu-devel@nongnu.org>; Fri, 28 Feb 2020 14:24:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=LDKcCQrJ4exTysNpbESaXVg67i7nnbIKyjv3uxqKM8c=;
 b=ODMhL+jh1Jyj14pdOKkkwznHPVvdTu25FHkvzUTbDTiUxVtokR0+6AFDl5l661J44q
 E5/WrigMrRRaUKwpC5Uu1+jyWff3yD9qi5Q3IGWwpny0WTWVpMj9CLYTLwd79E48eHY/
 LK+vAfxZoy3z8uJ3WYKf3p8phqPKy2ukQe79CKQBvR5AnfKMM0fw1tbYcCZFkk8v6JrO
 qnxeMazHghCvnnJKOmyv8fI+BY+jNFu1xqBjT1lbq0t4BvpySpNtOtTQeLmEChQb+i1h
 2D+RfMwBBHqBcR+wUbAqv1iFWnjy8VMkOYhZQ7EN/uFceru+1nVBDWXZgQ4Wh3ca3qlB
 VQpA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=LDKcCQrJ4exTysNpbESaXVg67i7nnbIKyjv3uxqKM8c=;
 b=S8X6NCNncl1QTMGkQ1g+SucixvuIwWNS1e4jL1wscalJ+35cO7WAq8sJehmBPtNSWV
 wLedvRX6QkSSUmF6yCoUAHhCUwRP1NWiai88D8d3CM2581vFIsDfyCzdY6pu4Tbm5wDH
 m71IG7/s0k7aP1X9ZN4RaF5hOFV17mtx6HQCY7meSJwtyIEBjR0AU9bT8BzxvHpn1G7j
 h42FBQOtN8ygAiedtI10KmRxm6VkbrPjtee35+bvvxPdWa5iDnBlRxMrbTEv8BViyGhG
 pNNLSr4w0XN4SrEYr88m/fFDn17afhbl91PMKk90VJfvyn2zNVbBRDQ0ehksgA9TTV3D
 sFvg==
X-Gm-Message-State: APjAAAXVciq7wf4hZMFyq6PCIau6ZbipKKMcd/SVC/jy/ep7Cj2ZDUig
 j4fycq+s7bGS9zk5SVcxTEpiSw==
X-Google-Smtp-Source: APXvYqxU6/k1GzhETwD0jJID3PdCWVEo7WzwNaZe3rVRtmVxpHDJ0FEVaNO2PocsPSCodjkFCDMfXQ==
X-Received: by 2002:aa7:8299:: with SMTP id s25mr6256714pfm.261.1582928661951; 
 Fri, 28 Feb 2020 14:24:21 -0800 (PST)
Received: from [192.168.1.11] (97-126-123-70.tukw.qwest.net. [97.126.123.70])
 by smtp.gmail.com with ESMTPSA id
 f9sm11994710pfd.141.2020.02.28.14.24.20
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 28 Feb 2020 14:24:21 -0800 (PST)
Subject: Re: [PATCH v4 1/7] target/arm: Improve masking of HCR RES0 bits
To: Peter Maydell <peter.maydell@linaro.org>
References: <20200225180831.26078-1-richard.henderson@linaro.org>
 <20200225180831.26078-2-richard.henderson@linaro.org>
 <CAFEAcA8ipK0nZioEgbNq5B1L-tqA+rzn-C2yyfet4_4yNVnYqA@mail.gmail.com>
 <e4a70637-f4b7-eaa7-237a-57053c5a63cc@linaro.org>
 <CAFEAcA-8a4eQXf+LRS3KLURyyEPpPm9uh6q6r6D-1-sh3t8Pdw@mail.gmail.com>
 <5c484ae5-b4da-8eae-c10a-547c670c89e5@linaro.org>
 <CAFEAcA96AZB765TizrPLJYfXhx=KUcb_feL3JK1WNmf5dRSR0w@mail.gmail.com>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <08a6a113-4082-246c-2aeb-4424b921caa4@linaro.org>
Date: Fri, 28 Feb 2020 14:24:19 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.4.1
MIME-Version: 1.0
In-Reply-To: <CAFEAcA96AZB765TizrPLJYfXhx=KUcb_feL3JK1WNmf5dRSR0w@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2607:f8b0:4864:20::441
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
Cc: qemu-arm <qemu-arm@nongnu.org>, QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 2/28/20 11:03 AM, Peter Maydell wrote:
> It occurs to me that we should check what the required
> semantics are for the opposite half of the register
> if the guest writes to one half of it via hcr_writehigh()
> or hcr_writelow() -- is the un-accessed half supposed
> to stay exactly as it is, or is it ok for the
> RES0-for-aarch32 bits to get squashed in the process?
> That would seem at least a bit odd even if it's valid,
> so maybe better to do aarch32 RES0 masking in
> hcr_writehigh() and hcr_writelow()?

Hmm.  You're thinking of a situation in which

 1) EL3 invokes EL2 with aa64 which sets HCR_EL2,
 2) EL3 invokes EL2 in aa32 which sets HCR which
    as a side-effect clears some of the bits in HCR2
 3) EL3 invokes EL2 with aa64 again and HCR_EL2
    incorrectly has some high bits clear.

I can't find any language that explicitly says, but "architecturally mapped"
means that the bits backing the storage must be the same.  So while it isn't
legal for aa32 to set HCR2 bit 8 (HCR_EL2.APK), I imagine that it would still
read as written.

So I think you're correct that we shouldn't alter the half B when writing to
half A.

Perhaps I should do some masking for aa32 in arm_hcr_el2_eff.


r~

