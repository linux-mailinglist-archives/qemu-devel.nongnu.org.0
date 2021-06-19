Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4AA243AD89D
	for <lists+qemu-devel@lfdr.de>; Sat, 19 Jun 2021 10:32:50 +0200 (CEST)
Received: from localhost ([::1]:52752 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1luWPI-0005sN-Ie
	for lists+qemu-devel@lfdr.de; Sat, 19 Jun 2021 04:32:48 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60562)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1luWO1-00051W-Gm
 for qemu-devel@nongnu.org; Sat, 19 Jun 2021 04:31:29 -0400
Received: from mail-wm1-x32f.google.com ([2a00:1450:4864:20::32f]:40486)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1luWNz-0004UC-U2
 for qemu-devel@nongnu.org; Sat, 19 Jun 2021 04:31:29 -0400
Received: by mail-wm1-x32f.google.com with SMTP id
 n35-20020a05600c3ba3b02901cdecb6bda8so10120020wms.5
 for <qemu-devel@nongnu.org>; Sat, 19 Jun 2021 01:31:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=references:user-agent:from:to:cc:subject:date:in-reply-to
 :message-id:mime-version:content-transfer-encoding;
 bh=uOxaa42syouv7cemVCIMhV0GsIwlF4g5BQ0aQTAAlTA=;
 b=WOaH9+GNpGC5l2qNB0QVCv/3d2lG2nvhEZwwh6tyW0mBkr0VMLl7bShoWSHCfhElHD
 S3SRqXJAlZ1SvuVOjsoHQY4Qvnu1y8gG2jGvsU03CbTLFywvMrnW50Zkxww2rOySG8qN
 H7JXoRNmI43fhWPoJbVmQ2CUupZq79ox2pkFXNSUqAFprPxmBVPSnp6siBmhAyfFfYmI
 cCKXrZAKO1wmfPBNqYq3bCBy8kNFfBQmL8ZS1Aj97lblUmLbpVI1ky3NLBAcv2B75ESH
 dZ/adFnXTqFHsRnsG39NwBvNaAUAwSyQcKRnRKpZiPr43aQfx41vCC0696VHlhaWKL0y
 Y9Vw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:references:user-agent:from:to:cc:subject:date
 :in-reply-to:message-id:mime-version:content-transfer-encoding;
 bh=uOxaa42syouv7cemVCIMhV0GsIwlF4g5BQ0aQTAAlTA=;
 b=Oqtfq2gCWuZ/iHdx1noL4e4cWT6KhjUabLDHZDL5X14LR8uOC3/A40rnvHDHf6HfJl
 Iy14q25iFLD+H98tnp/doTHa5oUyTXtPcTBuKlYji+ogeS3lAJNO1r2L40Sp6GKlSfKB
 MskNzwgSOLJSL+jWNGMguhsItH4lEsvfcNRnSGMP9jpXN2dPGsTnoUuIUixcpL4eKAmW
 0nfbD0yjV+uaaiSQRMZ7M2SKM43pjfc0N2N6G3GL0gAJ4H+pXRKN0JYfCcG0O8KTkj58
 Z9TD+Y8NRJiB/NkWpgXCldQJr+DUZ8C9V5M5g6der8U7BNfYsS03J6iBrAarM1RLtIaI
 x3Jg==
X-Gm-Message-State: AOAM5311E13B+kkVYaoZci/7e4WJc6DTCn3xXXnKd0XiTRM4ut6Y1tXE
 StsvEPN8m08Rh11SCZp1rukWYg==
X-Google-Smtp-Source: ABdhPJyA9YFcFqVxH5q79I/BoULq5TotmztAWs0cSILhkYZeOJiQFIahC2gJCxKbH3LLtoWcp7gmzQ==
X-Received: by 2002:a05:600c:21cf:: with SMTP id
 x15mr11846003wmj.78.1624091485636; 
 Sat, 19 Jun 2021 01:31:25 -0700 (PDT)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id 11sm2816912wmf.20.2021.06.19.01.31.24
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 19 Jun 2021 01:31:24 -0700 (PDT)
Received: from zen (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 0058E1FF7E;
 Sat, 19 Jun 2021 09:31:23 +0100 (BST)
References: <20210618093253.25074-1-alex.bennee@linaro.org>
 <8cf3b584-c490-d3a2-8bfb-b49a27f851bf@linaro.org>
User-agent: mu4e 1.5.13; emacs 28.0.50
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Richard Henderson <richard.henderson@linaro.org>
Subject: Re: [RFC PATCH] tests/tcg: skip the signals test for hppa for now
Date: Sat, 19 Jun 2021 09:31:00 +0100
In-reply-to: <8cf3b584-c490-d3a2-8bfb-b49a27f851bf@linaro.org>
Message-ID: <874kdu6ysk.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::32f;
 envelope-from=alex.bennee@linaro.org; helo=mail-wm1-x32f.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
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
Cc: qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


Richard Henderson <richard.henderson@linaro.org> writes:

> On 6/18/21 2:32 AM, Alex Benn=C3=A9e wrote:
>> While Richard has some patches that fix the instability on other
>> architectures the hppa signal support still needs vdso support before
>> we can make this reliable. So for now skip the test.
>
> Patches for a vdso posted.

Ah ok I shall look on Monday. You sure have a soft spot for that old
architecture ;-)

>
> r~
>
>> Signed-off-by: Alex Benn=C3=A9e <alex.bennee@linaro.org>
>> Cc: Richard Henderson <richard.henderson@linaro.org>
>> ---
>>   tests/tcg/hppa/Makefile.target | 4 ++++
>>   1 file changed, 4 insertions(+)
>> diff --git a/tests/tcg/hppa/Makefile.target
>> b/tests/tcg/hppa/Makefile.target
>> index 8bf01966bd..71791235f6 100644
>> --- a/tests/tcg/hppa/Makefile.target
>> +++ b/tests/tcg/hppa/Makefile.target
>> @@ -4,3 +4,7 @@
>>     # On parisc Linux supports 4K/16K/64K (but currently only 4k
>> works)
>>   EXTRA_RUNS+=3Drun-test-mmap-4096 # run-test-mmap-16384 run-test-mmap-6=
5536
>> +
>> +# There is a race that causes this to fail about 1% of the time
>> +run-signals: signals
>> +	$(call skip-test, $<, "BROKEN awaiting vdso support")
>>=20


--=20
Alex Benn=C3=A9e

