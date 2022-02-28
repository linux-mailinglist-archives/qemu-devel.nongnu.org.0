Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 99DFC4C6F19
	for <lists+qemu-devel@lfdr.de>; Mon, 28 Feb 2022 15:15:21 +0100 (CET)
Received: from localhost ([::1]:42186 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nOgo4-0002wJ-N8
	for lists+qemu-devel@lfdr.de; Mon, 28 Feb 2022 09:15:20 -0500
Received: from eggs.gnu.org ([209.51.188.92]:42578)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1nOgaQ-00009b-Qi
 for qemu-devel@nongnu.org; Mon, 28 Feb 2022 09:01:18 -0500
Received: from [2a00:1450:4864:20::42c] (port=40548
 helo=mail-wr1-x42c.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1nOgaO-0006A6-U2
 for qemu-devel@nongnu.org; Mon, 28 Feb 2022 09:01:14 -0500
Received: by mail-wr1-x42c.google.com with SMTP id n14so15593976wrq.7
 for <qemu-devel@nongnu.org>; Mon, 28 Feb 2022 06:01:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=references:user-agent:from:to:cc:subject:date:in-reply-to
 :message-id:mime-version:content-transfer-encoding;
 bh=YK2MX24l191eA/iTd+cxAxNISxJ69MtYggEaMHoEUEg=;
 b=ijbrckumSC+oSzFTR1ywAm1rjpuniN+N2pPa0ocynmELleYkA9vI9C46YC+bvcjokM
 aSf9bIhjNauxXE6DAZ9hLN8zoLL033a+uoN6lqq8w0PfNxya/0+67Eui2zRjC2Iag9yl
 4EN8BTpb2QPvAepxiC3IEVBqo+AAQoHLrdj9d3XCGfa3gmco8NZsDyx+ZYkBmTKvtS3u
 Ed0EQXbc/eCDXaFaTkbKd5j/7B0jj6Nrytwl4w2ybrVXjQTQSxc64E/2/pUUKG8RHKUc
 qv/A8JIFcGBm5cudiyGwBptXuNIIFaGVXOL9MWOsfUnmLk1idBXcm616LTCFKJ1ca3fb
 y3yQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:references:user-agent:from:to:cc:subject:date
 :in-reply-to:message-id:mime-version:content-transfer-encoding;
 bh=YK2MX24l191eA/iTd+cxAxNISxJ69MtYggEaMHoEUEg=;
 b=gTFbSr0Y+Z4FgGIKQ02YGObAGOSu2MW8XK/OA8IVDHDk7Lx6fxOaITQOQffMKFgsih
 Vple4JSdH0fpI9Xgsn5Qi6V6KOU9+VeYiuFvlFwgVXJgWPLpsPc4v2apwfPOHUrkQwCm
 rhnHm2puAbb/MdHqsVAGwLGnTCV0QBZaO/QbPDzNY9Qgsh8WmhtfW8/TiwSuqjlGSshR
 EKS0C2oY/mX1dqn2gzEND5fj5gVZc70QgPARFNdh1cPFaeesEwU4TNm61YOsWmMkaPl4
 Gz0OyFFkyK18JAEDPupD3wNt9I5pDS0f0x9kW1cMtTM0T7eZ4k2dF1dBCJZwZOxW9skh
 PO3g==
X-Gm-Message-State: AOAM531ZKkzlZmSo1V8tiRdfu5rnFKGF4/wjHxTtmOzV6OCtfqmVU0I+
 TeYatpabCo5w3RAHPzjjQG9ZqQ==
X-Google-Smtp-Source: ABdhPJzalc60jhQ1q6NGR/GBtA8J0xLLsspYd5npR9Npp6l/R/Bb249zaJnt1rsrZjcJjgbV7IiyUg==
X-Received: by 2002:adf:a109:0:b0:1ed:c2bd:8a57 with SMTP id
 o9-20020adfa109000000b001edc2bd8a57mr15521730wro.612.1646056869678; 
 Mon, 28 Feb 2022 06:01:09 -0800 (PST)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id
 a8-20020a056000100800b001e30ef6f9basm15237651wrx.18.2022.02.28.06.01.08
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 28 Feb 2022 06:01:08 -0800 (PST)
Received: from zen (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id D87E61FFB7;
 Mon, 28 Feb 2022 14:01:07 +0000 (GMT)
References: <20220225172021.3493923-1-alex.bennee@linaro.org>
 <20220225172021.3493923-14-alex.bennee@linaro.org>
 <61d197db-c44e-3354-f1e5-bea48019bb1e@linaro.org>
User-agent: mu4e 1.7.9; emacs 28.0.91
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Richard Henderson <richard.henderson@linaro.org>
Subject: Re: [PATCH v2 13/18] tests/tcg: add vectorised sha512 versions
Date: Mon, 28 Feb 2022 13:58:57 +0000
In-reply-to: <61d197db-c44e-3354-f1e5-bea48019bb1e@linaro.org>
Message-ID: <87zgmbm6os.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::42c
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::42c;
 envelope-from=alex.bennee@linaro.org; helo=mail-wr1-x42c.google.com
X-Spam_score_int: -6
X-Spam_score: -0.7
X-Spam_bar: /
X-Spam_report: (-0.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 PDS_HP_HELO_NORDNS=0.659, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.29
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

> On 2/25/22 07:20, Alex Benn=C3=A9e wrote:
>> +++ b/tests/tcg/i386/Makefile.target
>> @@ -71,3 +71,9 @@ TESTS=3D$(MULTIARCH_TESTS) $(I386_TESTS)
>>     # On i386 and x86_64 Linux only supports 4k pages (large pages
>> are a different hack)
>>   EXTRA_RUNS+=3Drun-test-mmap-4096
>> +
>> +sha512-sse: CFLAGS=3D-msse4.1 -O3
>> +sha512-sse: sha512.c
>> +	$(CC) $(CFLAGS) $(EXTRA_CFLAGS) $< -o $@ $(LDFLAGS)
>> +
>> +TESTS+=3Dsha512-sse
>
> The default cpu, qemu32, only implements sse3, not sse4.1, so we get a
> guest SIGILL.  We can execute this with -cpu max, or we could limit
> the vectorization.

OK I'll add:

run-sha512-vector: QEMU_OPTS+=3D-cpu max

TESTS+=3Dsha512-sse=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=
=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=
=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20

>
>
> r~


--=20
Alex Benn=C3=A9e

