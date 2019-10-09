Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D8A49D135B
	for <lists+qemu-devel@lfdr.de>; Wed,  9 Oct 2019 17:59:18 +0200 (CEST)
Received: from localhost ([::1]:51816 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1iIEMv-0006nV-IX
	for lists+qemu-devel@lfdr.de; Wed, 09 Oct 2019 11:59:17 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45638)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <richard.henderson@linaro.org>) id 1iI1tV-0001hy-0U
 for qemu-devel@nongnu.org; Tue, 08 Oct 2019 22:40:05 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <richard.henderson@linaro.org>) id 1iI1IA-0007zA-Pp
 for qemu-devel@nongnu.org; Tue, 08 Oct 2019 22:01:31 -0400
Received: from mail-yb1-xb44.google.com ([2607:f8b0:4864:20::b44]:37393)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <richard.henderson@linaro.org>)
 id 1iI1IA-0007xn-JV
 for qemu-devel@nongnu.org; Tue, 08 Oct 2019 22:01:30 -0400
Received: by mail-yb1-xb44.google.com with SMTP id z125so219446ybc.4
 for <qemu-devel@nongnu.org>; Tue, 08 Oct 2019 19:01:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:openpgp:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=KLC1qHeYjrGOJoAvGRswiHaRhVsCxf4DwneQs8vXDII=;
 b=DfI9gLylfMQAnqdayMM5AkRqPvRODms4PRKpeeeKxfcfdefhNiOGdxH05SopdI2NvC
 uXCTY4BuzDpckE9kpbsd1TbDjriZCcy3ROt6lpjCDDA920TNEiYkff+Ml64kCi8pJiDK
 eVYSleQElYOwGksh4NcaXV2q3BRHXtkH1a89Q97adodx45UiWeL6kIpYYwGO9AvEO/qf
 5zAAwkzV9PHjNXo3NOsfBUdQaXw8zJsinr8prvXgtJdOuuw9lOjKokgbuXVIk0hs8GOB
 JbYkvIGEf6y6PWp3dwpBGFN7IG6h0N0Jv2w2GfDJh8xn9qocifRyGK8huZve9vB+ceFH
 erow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:openpgp:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=KLC1qHeYjrGOJoAvGRswiHaRhVsCxf4DwneQs8vXDII=;
 b=plk6AnUq2e4pt1U8YlsJrSxnQfOpEXxSXh/4YoQ7+Vr6JBlwstEMDF4670k3lvQPN4
 S+mXXvaNCmtndmWE+9BFXt6eYQAmHibjFlhEElQRRs+1gZizlceBcAX3TmlaJ609E9C5
 p6EvrcAfwPgEDqMjJ8DB5Lgz9aIjh0YplLtzyt/QxZPCJAhVCmbp8gHK/ivk9m6x3liF
 MQUOnI1J4+Tv2M/NOAtnu6rscr/fAA3YduPcVsdp49nuLLIsTMih/xXmTh7IKm/exByW
 +QTNNJezm0ChYAZeMPNj5IKqAi2dcxVMGIVYjhBkdDG+mMEL7Hu+X5qjfYY0vfi0ZBMS
 13Dg==
X-Gm-Message-State: APjAAAVHsPSnbP7XAN6i4kOd7FHRLjxBBNQp9RuBxrdyJGjoN/A2JJ2y
 UETzRroPSk2lNWD5rH3riSkK5g==
X-Google-Smtp-Source: APXvYqxoNfNK2dvPPy9hewiN3EQwXMR/AfXcbjZ37v8b30GggR4VTwvNj9OGZo22nzUgZv7Vhmo74w==
X-Received: by 2002:a25:bd8c:: with SMTP id f12mr468238ybh.379.1570586489921; 
 Tue, 08 Oct 2019 19:01:29 -0700 (PDT)
Received: from [192.168.1.44] (67.216.144.16.pool.hargray.net. [67.216.144.16])
 by smtp.gmail.com with ESMTPSA id z127sm220651ywd.45.2019.10.08.19.01.21
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Tue, 08 Oct 2019 19:01:29 -0700 (PDT)
Subject: Re: [PATCH v2 15/21] hw/timer/exynos4210_rtc.c: Switch 1Hz ptimer to
 transaction-based API
To: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org
References: <20191008171740.9679-1-peter.maydell@linaro.org>
 <20191008171740.9679-16-peter.maydell@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
Openpgp: preference=signencrypt
Message-ID: <e721d8ae-db00-523f-57e2-cfe11a17b91c@linaro.org>
Date: Tue, 8 Oct 2019 22:01:13 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <20191008171740.9679-16-peter.maydell@linaro.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2607:f8b0:4864:20::b44
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
Cc: Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 10/8/19 1:17 PM, Peter Maydell wrote:
> Switch the exynos41210_rtc 1Hz ptimer over to the transaction-based
> API. (We will switch the other ptimer used by this device in a
> separate commit.)
> 
> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
> ---
>  hw/timer/exynos4210_rtc.c | 10 ++++++++--
>  1 file changed, 8 insertions(+), 2 deletions(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~

