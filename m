Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id ED6626AA30
	for <lists+qemu-devel@lfdr.de>; Tue, 16 Jul 2019 16:02:53 +0200 (CEST)
Received: from localhost ([::1]:49358 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.86_2)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1hnO2f-0007lf-1k
	for lists+qemu-devel@lfdr.de; Tue, 16 Jul 2019 10:02:53 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33500)
 by lists.gnu.org with esmtp (Exim 4.86_2)
 (envelope-from <richard.henderson@linaro.org>) id 1hnO2M-0007NC-St
 for qemu-devel@nongnu.org; Tue, 16 Jul 2019 10:02:35 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <richard.henderson@linaro.org>) id 1hnO2F-0006Jd-UH
 for qemu-devel@nongnu.org; Tue, 16 Jul 2019 10:02:30 -0400
Received: from mail-pl1-x634.google.com ([2607:f8b0:4864:20::634]:42110)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <richard.henderson@linaro.org>)
 id 1hnO2C-0006Ff-Pn
 for qemu-devel@nongnu.org; Tue, 16 Jul 2019 10:02:25 -0400
Received: by mail-pl1-x634.google.com with SMTP id ay6so10166863plb.9
 for <qemu-devel@nongnu.org>; Tue, 16 Jul 2019 07:02:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:openpgp:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=R8IiI/P95mFIcWgI0Nf4uK47wQOQ7aeo6sIky2SDAsE=;
 b=bXgpt+CivTLAlQWBI06PDiQbwNbIU9IE/dYgtw67mRtIN5azSiu92j3Bfb0xRvY4AD
 7Rn7QCAKQEkcTiejvRLHe5snK3i+9kfy7hXkAYTtuIMxYo/nAFORSExk9tKnizqPHsgt
 ToeZbOO47/qOSIJ3u+iYgCF4bJuZWNRxjKmDFPrbnr51g3FQJlpSQ36ZcE8vuPMC/SCK
 Rsckr5rLKAESSll+MIDBef3gnKd3/GNRfHIq69dgDapMLY+MYsu8dIAP6Pp+JLWYFlMs
 0loJYshw3naN3UnhGVI0/76d+BPiDk/g5ExCgV7rIGsl+iOjpSP6ahidnjqszFOWK8c4
 AXdQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:openpgp:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=R8IiI/P95mFIcWgI0Nf4uK47wQOQ7aeo6sIky2SDAsE=;
 b=oScvIVJiKy2pzOA30wPyGQvOZbGTECxjecjIYBuuhvly/et+mxBJdTl1kYFDSSGVDW
 kZ4XVtboCfzR43mnUuvvkAcvekWuU3AkIvH1obQSsl9gM+rXCK2zDh4P5qXFXKaXwIyC
 HksJfnTljqYbESlhrlmbZzhgBuTglZSq5wU7ovaUJ9AsxfRiOWAzT+PFYHLXfHPO0lgm
 zPPAfn3/32c71QQJS+ynYZbSxas3ZheF0UnJ8Q3dDtz+fbkgHYLEQacwBdwDhrG6owd+
 U8LeFOb3W5QQTh9GS680LzFCrTHxeQTjJ7VP+mkD+HIOTpT/mbXFu0rUn3cyLPciFrUS
 rNkw==
X-Gm-Message-State: APjAAAWrn0haQgr3o8mgMJHAzMe3KEoxljIOwM6h88oi+ChtypOsNR16
 YuwGGSwK1sqYLgoiq+MLHszPpoxcT2o=
X-Google-Smtp-Source: APXvYqwMfHxPfHpu9mMgozSFr7ksa3SGWb9jrjeAhWu2gFBMYhhdo+vY5i11erDG0IUkqpidiNQPCw==
X-Received: by 2002:a17:902:b591:: with SMTP id
 a17mr34588838pls.96.1563285738065; 
 Tue, 16 Jul 2019 07:02:18 -0700 (PDT)
Received: from [192.168.1.11] (97-113-176-6.tukw.qwest.net. [97.113.176.6])
 by smtp.gmail.com with ESMTPSA id p65sm21170470pfp.58.2019.07.16.07.02.16
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Tue, 16 Jul 2019 07:02:17 -0700 (PDT)
To: Peter Maydell <peter.maydell@linaro.org>, Laszlo Ersek <lersek@redhat.com>
References: <20181102171638.24069-1-peter.maydell@linaro.org>
 <20181102171638.24069-9-peter.maydell@linaro.org>
 <3e3d2018-3993-f651-8e94-5bea612bd776@redhat.com>
 <CAFEAcA_FtoHOUv_cPgfO7GrZ8Ug9cKCvmY2z75i9DaAQ8Qx+gQ@mail.gmail.com>
From: Richard Henderson <richard.henderson@linaro.org>
Openpgp: preference=signencrypt
Message-ID: <2745eb9d-c2a2-30a8-c1d0-b8cb3ee43705@linaro.org>
Date: Tue, 16 Jul 2019 07:02:15 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.7.2
MIME-Version: 1.0
In-Reply-To: <CAFEAcA_FtoHOUv_cPgfO7GrZ8Ug9cKCvmY2z75i9DaAQ8Qx+gQ@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2607:f8b0:4864:20::634
Subject: Re: [Qemu-devel] [PULL 08/10] target/arm: Conditionalize some
 asserts on aarch32 support
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
Cc: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>,
 =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 7/16/19 12:03 PM, Peter Maydell wrote:
> The intention of the assertion really is to catch QEMU bugs
> where we got the ID register values wrong in our emulated
> CPUs. Perhaps we should relax all these assertions to only
> testing if we're using TCG, not KVM ?

Perhaps.  In some instances if ID register values are wrong we would then not
migrate properly, but none of the checks we're currently doing of this sort
would catch those particular cases.


r~

