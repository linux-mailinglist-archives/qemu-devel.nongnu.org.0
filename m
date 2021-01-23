Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6C85B3011AB
	for <lists+qemu-devel@lfdr.de>; Sat, 23 Jan 2021 01:28:24 +0100 (CET)
Received: from localhost ([::1]:50024 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l36mt-00076d-1x
	for lists+qemu-devel@lfdr.de; Fri, 22 Jan 2021 19:28:23 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:39688)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <rebecca@nuviainc.com>)
 id 1l36lp-0006h1-PU
 for qemu-devel@nongnu.org; Fri, 22 Jan 2021 19:27:18 -0500
Received: from mail-oi1-x230.google.com ([2607:f8b0:4864:20::230]:35812)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <rebecca@nuviainc.com>)
 id 1l36lo-0000Jm-6f
 for qemu-devel@nongnu.org; Fri, 22 Jan 2021 19:27:17 -0500
Received: by mail-oi1-x230.google.com with SMTP id w8so8066490oie.2
 for <qemu-devel@nongnu.org>; Fri, 22 Jan 2021 16:27:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=nuviainc-com.20150623.gappssmtp.com; s=20150623;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=8y4dLxeZiuCxBQZtPnoC3dyUuJpmNGUQX9rpBEkMGmI=;
 b=TdcmrOwtXgTHRYQM5LTUknkMtB0K6dIepWijb2geOc9XjyjURYZ0BXEEVgKQ4qinLL
 hu8ODSHH9kyrdOK3NYO80KEEojNCVNKsJsYpk/xB8eYC4elutC+YCxqIsb4JqKQzp/Zz
 cp/fWrXw++HaYZ2g0fXnsHD29rfCRsgsbXgEkQ2UmwTueC74Oxz0oC5Yp/Fs2yx00YOM
 vowB/1tWSuRAa+DJ//bYibJ+uvaRbjh0RO/RQ0W7U4b9uZoMYAyn0je9hM8SuwQ/RZrv
 2aSKkR8OR3u+vDUoxYexp165NhJmJ4hBduIVZ4bLUNoyoTL+4gwg8XWF4Pg2cIlNOGSk
 ql4g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=8y4dLxeZiuCxBQZtPnoC3dyUuJpmNGUQX9rpBEkMGmI=;
 b=l8uQa4WqM8juy5tu4Y2wc+HtF2qOO9SIqScJGukqAAckbzjH9LNPBGJ2826CVpJG1Z
 91A8NKTnshUXtj1mwmTftnIBgqP5QbIUQqyGl6jtzKz3hILGx/DauZr9uoT00g9zb/3W
 aq1P9a2kOwyCP8Nz8IyX5bY2J84xKE0j/vSGn95MSY55JcpwwmaTO0DoZ+i0FNMFdIsK
 y9x4u+TI77s5S2Ouxal86klLUgC2vHd7jvF6lT4JJas51RU/VXp6FhRekItsVi1QZIfi
 IbtWsDnQTjnDgnRkuD5mB2GBD764qAdbFazu0jOsQrxoa82qKakNrofSsjt5UdEWwmPB
 /+aw==
X-Gm-Message-State: AOAM53365nbgUhtS6NrWTuBMTtRRp18Q99NSCBD8prlqc1zzQlxt1pqm
 c1eIMSL8hIljyZr6GAkHpVV6dQ==
X-Google-Smtp-Source: ABdhPJxD92Vpp96LvkHz7l6KCOwtjL8kICuEm68DrNdp2V8vYMj10qn5awl8Ii9Qe30gDnKzAoRlsA==
X-Received: by 2002:aca:e0c5:: with SMTP id x188mr5103556oig.20.1611361633662; 
 Fri, 22 Jan 2021 16:27:13 -0800 (PST)
Received: from [10.0.10.142] (c-174-52-16-57.hsd1.ut.comcast.net.
 [174.52.16.57])
 by smtp.gmail.com with ESMTPSA id x4sm1999765otq.73.2021.01.22.16.27.12
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 22 Jan 2021 16:27:13 -0800 (PST)
Subject: Re: [PATCH v2 3/3] target/arm: Set ID_AA64PFR0.DIT and ID_PFR0.DIT to
 1 for "max" AA64 CPU
To: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org
References: <20210122044537.1823-1-rebecca@nuviainc.com>
 <20210122044537.1823-4-rebecca@nuviainc.com>
 <bdb8ccbf-c95c-f6f3-b0af-1e0baf3fabec@linaro.org>
From: Rebecca Cran <rebecca@nuviainc.com>
Message-ID: <e17c5f6a-7e31-8cac-0358-d6066364a9e6@nuviainc.com>
Date: Fri, 22 Jan 2021 17:27:11 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.1
MIME-Version: 1.0
In-Reply-To: <bdb8ccbf-c95c-f6f3-b0af-1e0baf3fabec@linaro.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::230;
 envelope-from=rebecca@nuviainc.com; helo=mail-oi1-x230.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, NICE_REPLY_A=-0.221, RCVD_IN_DNSWL_NONE=-0.0001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Peter Maydell <peter.maydell@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 1/22/21 2:06 PM, Richard Henderson wrote:
> On 1/21/21 6:45 PM, Rebecca Cran wrote:
>> Enable FEAT_DIT for the "max" AARCH64 CPU.
>>
>> Signed-off-by: Rebecca Cran <rebecca@nuviainc.com>
>> Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
>> ---
>>   target/arm/cpu64.c | 5 +++++
>>   1 file changed, 5 insertions(+)
> 
> There is also a 32-bit "max" cpu in cpu.c.

Thanks. I've fixed it in the next revision.

