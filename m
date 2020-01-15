Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2076B13D05D
	for <lists+qemu-devel@lfdr.de>; Wed, 15 Jan 2020 23:55:18 +0100 (CET)
Received: from localhost ([::1]:33718 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1irrZE-0006PG-T0
	for lists+qemu-devel@lfdr.de; Wed, 15 Jan 2020 17:55:16 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:42053)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <richard.henderson@linaro.org>) id 1irrYR-0005wW-93
 for qemu-devel@nongnu.org; Wed, 15 Jan 2020 17:54:28 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <richard.henderson@linaro.org>) id 1irrYQ-0007Dl-7Z
 for qemu-devel@nongnu.org; Wed, 15 Jan 2020 17:54:27 -0500
Received: from mail-pf1-x444.google.com ([2607:f8b0:4864:20::444]:37661)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <richard.henderson@linaro.org>)
 id 1irrYQ-0007D3-05
 for qemu-devel@nongnu.org; Wed, 15 Jan 2020 17:54:26 -0500
Received: by mail-pf1-x444.google.com with SMTP id p14so9216333pfn.4
 for <qemu-devel@nongnu.org>; Wed, 15 Jan 2020 14:54:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=tr5vJHb3uDT+O2mN2W7qy1j5IR9fMbuiG5JV2TeiUr8=;
 b=PL7pvNqZYzisEAhdEOkftzi/ZumRsvAnyjuFTdtl30UmaBIYM3t/zvw8CCIDEIEi60
 qXLO+AIQQ/qYrzZTBZH5Tv+Hb9T+rhKA4d77opyveds+ojW6g/4u+Xagh5hvd3GpZnji
 AP1z5wVdmPJtdiBr6ClRPZNX95jrIy6iJ2BNGE8uIcVS6pA8T1bgr7hJjtP1RXIHMN6a
 uLtEZogzY/46nKzTVcjTTYseZ7uCmhGcSzFwIuvLNoHTq/JrUqh4f+cIH6R2guhl/ppg
 akRhfRENB6/A3mhv9j7RKUmJgpb3DMvrvpAUHzBmi4pVfDq6quDnkyFrrfSx3AynB7TX
 rKJw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=tr5vJHb3uDT+O2mN2W7qy1j5IR9fMbuiG5JV2TeiUr8=;
 b=Sjncv6+1g5fyLI7ll2aT/9gDl2rJeEM5Fjw2t1YxFTnW+N0PgAILLTeXHS7+X7QB4G
 2cA6KWP7Jeu31iuLO5QtaObkFDuFAn4XZGO3rsc57FhUVAHFxv6BD8dT366g93rJfKE5
 Nn0sloNbCEEzNXfCNHG7BDuVfzEyP8HKJ/Kzn5SAg/Q2yVjLHTQPSx2C3yGYYJwCD2iC
 Idns0nxlb2LX9dC40R4HlmuQkypND4ZyqEkCPagApPm275/Z2kuqhh+XGDp8xO1a4qVM
 /9lO/EN4vK+WlOibrJT3BZXppk/4IBKJ/JoN7gcgX0yQWBWrmLVG9Ja3roEe19H12avu
 ZCAw==
X-Gm-Message-State: APjAAAXbEn1OBnT73yFrSvcHXm4DCTvuucRo3e+EpHUGz618Qc+/SEfT
 TF44HLq5ka170rMvsoTeNmRBLg==
X-Google-Smtp-Source: APXvYqw2gAYd/tposAiiEU6ZWvd30UDLUYSbTm1FbuqOkRh6k4vE2lN9Ymo6SqV824In9X6xCS2ImQ==
X-Received: by 2002:a63:1b54:: with SMTP id b20mr35484886pgm.312.1579128864652; 
 Wed, 15 Jan 2020 14:54:24 -0800 (PST)
Received: from [192.168.3.43] (rrcs-66-91-136-155.west.biz.rr.com.
 [66.91.136.155])
 by smtp.gmail.com with ESMTPSA id x11sm22078793pfn.53.2020.01.15.14.54.22
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 15 Jan 2020 14:54:24 -0800 (PST)
Subject: Re: [PATCH v5 18/22] tests/tcg/aarch64: add a gdbstub testcase for
 SVE registers
To: =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 qemu-devel@nongnu.org
References: <20200114150953.27659-1-alex.bennee@linaro.org>
 <20200114150953.27659-19-alex.bennee@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <f31669c6-ee62-6019-a09a-85a133eb68ae@linaro.org>
Date: Wed, 15 Jan 2020 12:54:20 -1000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.2.2
MIME-Version: 1.0
In-Reply-To: <20200114150953.27659-19-alex.bennee@linaro.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2607:f8b0:4864:20::444
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
Cc: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 1/14/20 5:09 AM, Alex Bennée wrote:
> A very simple test case which sets and reads SVE registers while
> running a test case. We don't really need to compile a SVE binary for
> this case but we will later so keep it simple for now.
> 
> Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
> 
> ---
> v5
>   - properly plumb in
>   - skip if fails to connect
> ---
>  tests/.gitignore                      |  1 +
>  tests/tcg/aarch64/Makefile.target     | 15 +++++
>  tests/tcg/aarch64/gdbstub/test-sve.py | 81 +++++++++++++++++++++++++++
>  3 files changed, 97 insertions(+)
>  create mode 100644 tests/tcg/aarch64/gdbstub/test-sve.py

I don't understand how this is working.  What's the process that provides the
container for the register state?

I would have expected *some* binary to be used, even if it is only "int main()
{ return 0; }".



r~

