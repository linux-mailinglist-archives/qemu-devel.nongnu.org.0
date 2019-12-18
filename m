Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E62EC125325
	for <lists+qemu-devel@lfdr.de>; Wed, 18 Dec 2019 21:21:53 +0100 (CET)
Received: from localhost ([::1]:60214 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ihfpQ-0003xG-RN
	for lists+qemu-devel@lfdr.de; Wed, 18 Dec 2019 15:21:52 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:46112)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <richard.henderson@linaro.org>) id 1ihfo4-0003JO-B9
 for qemu-devel@nongnu.org; Wed, 18 Dec 2019 15:20:29 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <richard.henderson@linaro.org>) id 1ihfo2-0005LJ-Ua
 for qemu-devel@nongnu.org; Wed, 18 Dec 2019 15:20:27 -0500
Received: from mail-pg1-x543.google.com ([2607:f8b0:4864:20::543]:38792)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <richard.henderson@linaro.org>)
 id 1ihfo2-0005Ha-8G
 for qemu-devel@nongnu.org; Wed, 18 Dec 2019 15:20:26 -0500
Received: by mail-pg1-x543.google.com with SMTP id a33so1862654pgm.5
 for <qemu-devel@nongnu.org>; Wed, 18 Dec 2019 12:20:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=e0F0O5XBsMvA6TFnNmXgjcc4PZlPDbOS60e2ICRnBf8=;
 b=ReDrUKnywIGJbaTsMy/auWkGB8LPssXluYZt0Gr/tynRYUb/CKJjrCHJgfMdoxbKKI
 Nn+GCjrNrsBPaphuWhWtLg2IOnBdXKvMOQe9ZOUhU3q9FAfZPqmcdXRuq5I9dOffl9KB
 Igc8hB2zknS04dx4pAW+kecBkpQKlymE2r/mfBhd0CuxkR7qjhB1Et9Y65Awg4MJPiMt
 93rmAPAuBpdAZml4FBw5BCMWd+gx4VNvc2RbOQnXdUKqgos450IB/f1QnyM5c4RI+rPG
 CRbbpNyDUgejWHAef5VDzdTUGXmBBGqr8aZwWR3aeEiHEsKBKDhU+WetwwShgPU9Fi31
 2uRw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=e0F0O5XBsMvA6TFnNmXgjcc4PZlPDbOS60e2ICRnBf8=;
 b=snu0A3jlfFZxBij/xNgpP6rz4GOUTR35h9n8yTtVpJ1rhegDamQ7SIE5+Esm+UzDJj
 zqPsni896U9tk8qBWC6ET9R7p1g8BdJBqJVQDcmp3YLpzD9mGo4tK8uR5tfLYYj1WwnD
 eTAuxaIlgTBoSdfBA1TtDX2178OR5K6lQuBS12/9AjEWWRTSznZIMlHj2VuNIa8O6oWK
 aey7dVfpmqN0DEY1u2ylA3QzNRvZM6PRX0e9tdef2VU7FGDC0h6eXdTGmbBbtdBvJNOS
 PyKeliJlOrQDM8QdUR7iHa2ZQQbcFlJ2pA8ELsCQzBHfhCtJaIFIypwVMvWAWkMsUJ6t
 utGQ==
X-Gm-Message-State: APjAAAWYK4ShLic5ubn1B/5xel/DnEqPvroFn52N6dq+G3q902S2eGnk
 VJF+TrKAnEpZbVVasM6LmZrd6A==
X-Google-Smtp-Source: APXvYqyC6nsJ598nxWFCRrSBW9fXqdLaopHZS+dIH1PjffQM5MsiiFQTgK3eM0eEHF8pF5jC9fC0eg==
X-Received: by 2002:a62:7b54:: with SMTP id w81mr5124131pfc.127.1576700424336; 
 Wed, 18 Dec 2019 12:20:24 -0800 (PST)
Received: from ?IPv6:2605:e000:c74f:dc00:6838:d2b2:17e2:8445?
 ([2605:e000:c74f:dc00:6838:d2b2:17e2:8445])
 by smtp.gmail.com with ESMTPSA id q13sm3918673pjc.4.2019.12.18.12.20.22
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 18 Dec 2019 12:20:23 -0800 (PST)
Subject: Re: [PATCH v1 4/4] tests/tcg: add a dumb-as-bricks semihosting
 console test
To: =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 qemu-devel@nongnu.org
References: <20191218180029.6744-1-alex.bennee@linaro.org>
 <20191218180029.6744-5-alex.bennee@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <593c8577-b1f8-f821-94cd-cf017300043a@linaro.org>
Date: Wed, 18 Dec 2019 10:20:20 -1000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.2.2
MIME-Version: 1.0
In-Reply-To: <20191218180029.6744-5-alex.bennee@linaro.org>
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
Cc: pbonzini@redhat.com, keithp@keithp.com,
 "open list:ARM TCG CPUs" <qemu-arm@nongnu.org>,
 Peter Maydell <peter.maydell@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 12/18/19 8:00 AM, Alex Bennée wrote:
> We don't run this during check-tcg as we would need to check stuff is
> echoed back. However we can still build the binary so people can test
> it manually.
> 
> Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
> ---
>  tests/tcg/aarch64/system/semiconsole.c    | 36 +++++++++++++++++++++++
>  tests/tcg/aarch64/Makefile.softmmu-target |  9 +++++-
>  2 files changed, 44 insertions(+), 1 deletion(-)
>  create mode 100644 tests/tcg/aarch64/system/semiconsole.c

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>


r~

