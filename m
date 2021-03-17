Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1032833FA04
	for <lists+qemu-devel@lfdr.de>; Wed, 17 Mar 2021 21:34:31 +0100 (CET)
Received: from localhost ([::1]:53370 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lMcs9-0005an-Ei
	for lists+qemu-devel@lfdr.de; Wed, 17 Mar 2021 16:34:29 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39278)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lMcnQ-0003Rd-Sv
 for qemu-devel@nongnu.org; Wed, 17 Mar 2021 16:29:36 -0400
Received: from mail-wm1-x32f.google.com ([2a00:1450:4864:20::32f]:54120)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lMcnP-0001OX-Aa
 for qemu-devel@nongnu.org; Wed, 17 Mar 2021 16:29:36 -0400
Received: by mail-wm1-x32f.google.com with SMTP id g20so2235506wmk.3
 for <qemu-devel@nongnu.org>; Wed, 17 Mar 2021 13:29:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:to:cc:from:subject:message-id:date:user-agent:mime-version
 :content-language:content-transfer-encoding;
 bh=N0nbkACfz/b0Xj9DeLbAclVL2Q5OYu6zKM8PMOIzGRY=;
 b=TCuQY1EB6qIKpeCa4DMQ2S8LIycndK9ofcGC/GDz+rjKX/2AScYoPqMsCwwyIK9zCc
 7Xajo78Qn/xo2aNrjGoAkQH9OYSGC6/uK/Vr3+Z0GgAv5JwWWnM+THUkFc8zbHvJK1H8
 9d3HNHPbaYgDwlStsF0bvsZPqTlIYR1Du47PVD/EstoE18J277cpEdztXBVT6b2fV2Fp
 NtwFQ4YJIrQibXKIWjPG3SQ2sRoo7TnTxCXjCEvwNFbgocNaoTSIu377lKThTnY1iw7j
 cIJdlRem5q46cEv92eNEQ4QDcyWCggkQYAM6uA+sDb+v0UHjWwHlD4NJyNH9hY3Rlnfj
 jkiw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:to:cc:from:subject:message-id:date
 :user-agent:mime-version:content-language:content-transfer-encoding;
 bh=N0nbkACfz/b0Xj9DeLbAclVL2Q5OYu6zKM8PMOIzGRY=;
 b=OzIQOSn34bL5yDBGBRsmLMffWx7+Encu+gwUVwCn2ZSMdpsxiPM9toPWSdP4R7sQfH
 hAAD7ahZwHMZxRlNMrCjVRveg8joHwtdA9RKtbNsqMfvHkTd7evSoF2d16/Fm+h54f21
 oc5uuImTwCaejGuBBgcoCL5B374+lBQbeu66eecsOOXeW8mD3am4vvZKdAoc0LoMxNT+
 nZPQHecKZpxsMMJiN9mThaGOx7yhQuDU+i1CWF1Th1uMAdg/rtmGpLSskV1yy3PrEktm
 dMzk+U7ovptnF9w2kr4JgiAfGawQsRAwrQ3ujAFU2i0x/EiWG5WK1si/JCn2MDIqzPvU
 KiYQ==
X-Gm-Message-State: AOAM532gtS7ydN4LouJu6QaFjxTGfmDym4B9xiXS8eFwYIa0N9runkfs
 k7yhvn+myib68MkkJOQ7ofA=
X-Google-Smtp-Source: ABdhPJy3OhN+vExp2rSuftyWIDpMi3GBPrceExiXvU3aXUNDpY0GJeGH/evPeHB107KJFCyq1FNF1A==
X-Received: by 2002:a05:600c:190a:: with SMTP id
 j10mr510860wmq.140.1616012973661; 
 Wed, 17 Mar 2021 13:29:33 -0700 (PDT)
Received: from [192.168.1.36] (17.red-88-21-201.staticip.rima-tde.net.
 [88.21.201.17])
 by smtp.gmail.com with ESMTPSA id v189sm4903wme.39.2021.03.17.13.29.32
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 17 Mar 2021 13:29:33 -0700 (PDT)
To: =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 Peter Maydell <peter.maydell@linaro.org>, Cleber Rosa <crosa@redhat.com>,
 "Daniel P . Berrange" <berrange@redhat.com>, Thomas Huth <thuth@redhat.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
Subject: Serious doubts about Gitlab CI
Message-ID: <cb9d0504-aba5-3114-d121-694a5247764c@amsat.org>
Date: Wed, 17 Mar 2021 21:29:32 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.0
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32f;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wm1-x32f.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.25,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: Paolo Bonzini <pbonzini@redhat.com>, qemu-devel <qemu-devel@nongnu.org>,
 Stefan Hajnoczi <stefanha@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Hi,

For some (unclear) reason I got my free tier Gitlab account renewed and
lost the privilege for users opening account before the quota limit.

I pushed a single branch to my namespace repo to trigger a pipeline.
1h later I was surprised to see the pipeline was stuck, having completed
99 jobs of 119. Looking closer there is a red comment on top of the
pipeline:

 philmd has exceeded its pipeline minutes quota. Unless you buy
 additional pipeline minutes, no new jobs or pipelines in its projects
 will run. [Buy more Pipelines minutes]

So I exhausted my 400 monthly minutes credit.

From this FAQ:
https://about.gitlab.com/pricing/faq-consumption-cicd/#managing-your-cicd-minutes-usage

Q. What happens if I hit the CI/CD Minutes allotted limit and forget to
purchase additional CI/CD Minutes?

A. You will not be able to run new jobs until you purchase additional
CI/CD Minutes, or until the next month when you receive your monthly
allotted CI/CD Minutes.

Q. Will I be notified before I hit my limit on CI/CD Minutes?

A. You will receive notification banners in-app when your group has less
than 30%, 5% or exceeded your total allotted CI/CD minutes.

I indeed received 3 warnings in 7 minutes.

Now I'm having serious doubts about Gitlab usefulness for the QEMU
community...

Some screenshots FWIW:

https://pasteboard.co/JT51wGR.png
https://pasteboard.co/JT51Rqq.png
https://pasteboard.co/JT52fNL.png

Regards,

Phil.

