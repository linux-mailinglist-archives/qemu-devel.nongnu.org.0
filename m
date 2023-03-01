Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9B4056A6B01
	for <lists+qemu-devel@lfdr.de>; Wed,  1 Mar 2023 11:44:41 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pXJwU-0006O0-PY; Wed, 01 Mar 2023 05:44:14 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pXJwR-0006N2-DJ
 for qemu-devel@nongnu.org; Wed, 01 Mar 2023 05:44:11 -0500
Received: from mail-wm1-x332.google.com ([2a00:1450:4864:20::332])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pXJwP-0003hw-TG
 for qemu-devel@nongnu.org; Wed, 01 Mar 2023 05:44:11 -0500
Received: by mail-wm1-x332.google.com with SMTP id
 o11-20020a05600c4fcb00b003eb33ea29a8so7040949wmq.1
 for <qemu-devel@nongnu.org>; Wed, 01 Mar 2023 02:44:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1677667448;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=EWILjlbpqPDkwwgYhqqVnHdu6hv7prnzqRtq851YOI0=;
 b=H3sPnI9/l/R74Ht4pkgzonoVdbBUGE0QLdDwfu+czWaTOQpGPpkS5d6DRPfsAc+8fA
 ncckvYVO5CYlr7Wpj7V31TRS0UAzkB8a04Z/zuqrKAnw4rCshRjOybkOnoAyYlTDPXYi
 is19d1mRwZwp7laOmJZiAGXw860oMMKs/ZPiL/iAsvJUZflLS9ZVMA+5yCXgZHwUGCy2
 p62bpls9/fpsUJlr3/dXGMw0LjS3eO1PleaOpc9dO491nY2Xt8vTM16U9L9JkkkXFXpQ
 4CjEtLIMx+erWyyyfA6OZMPNrSL3UF7//bY12YqOYfDko77gq0UkB1XIMLVvVEy2wdV8
 i+0A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1677667448;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=EWILjlbpqPDkwwgYhqqVnHdu6hv7prnzqRtq851YOI0=;
 b=2nbbsNmxGXH1i4extqjKS8AC06LlLj5SzZoAAjcYu1oHB2g1wdohYQ/KNhUF3SA0VL
 Jni0nluN/Gsc6+IuTB+2FpPhv6lda6dTDi4c85bxiwV7FUEHoPD9YawFhZzRcIuGFzzY
 0vrT2u32CeicEZWfwsPng7L4i3ua06wKnw9WbNPwC0kundLc/3Eis9qf8ylO0ND+uAcH
 dbJqPyI2TWrzCM/1Anki8n+d1NZsaAd6R6yCFsXUuS0giAmjTgjLzP2oSTRjQwTLWNZa
 0dp1pNr7oZmZUGeyLJNyRSqtd1anGnuhGYDfVBvFyRVcgvaMCsVvv6wJ/Vo1Aur5OQOS
 GdeQ==
X-Gm-Message-State: AO0yUKWUonpGDM8FndtR8rjIGBii0GMzulkd6STVwLKgXAA7aJPZlIh7
 kVA8Laeukm8qiZUALkJRkgpgyQ==
X-Google-Smtp-Source: AK7set9foEZT8aN6zPnA937hIN3w+Of3XoY0wJwfCDGRfy9EGf5pqE3pqH407VI/0GsxuMUfxm8fpA==
X-Received: by 2002:a05:600c:4e88:b0:3eb:3945:d406 with SMTP id
 f8-20020a05600c4e8800b003eb3945d406mr4669280wmq.16.1677667448276; 
 Wed, 01 Mar 2023 02:44:08 -0800 (PST)
Received: from [192.168.30.216] ([81.0.6.76]) by smtp.gmail.com with ESMTPSA id
 i13-20020adfe48d000000b002c5539171d1sm12459113wrm.41.2023.03.01.02.44.04
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 01 Mar 2023 02:44:07 -0800 (PST)
Message-ID: <cce553f5-fef9-28d0-8e4c-2fc0d82a02af@linaro.org>
Date: Wed, 1 Mar 2023 11:44:03 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.8.0
Subject: Re: [PATCH v3 22/24] gitlab: move the majority of artefact handling
 to a template
Content-Language: en-US
To: =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>
Cc: qemu-devel@nongnu.org, =?UTF-8?Q?Marc-Andr=c3=a9_Lureau?=
 <marcandre.lureau@redhat.com>, =?UTF-8?Q?Daniel_P=2e_Berrang=c3=a9?=
 <berrange@redhat.com>, Michael Roth <michael.roth@amd.com>,
 Peter Maydell <peter.maydell@linaro.org>, Kevin Wolf <kwolf@redhat.com>,
 Beraldo Leal <bleal@redhat.com>, Alexander Bulekov <alxndr@bu.edu>,
 Aurelien Jarno <aurelien@aurel32.net>, Markus Armbruster
 <armbru@redhat.com>, Darren Kenny <darren.kenny@oracle.com>,
 Hanna Reitz <hreitz@redhat.com>, Cleber Rosa <crosa@redhat.com>,
 John Snow <jsnow@redhat.com>, Ed Maste <emaste@freebsd.org>,
 qemu-arm@nongnu.org, Fam Zheng <fam@euphon.net>,
 Thomas Huth <thuth@redhat.com>, Yonggang Luo <luoyonggang@gmail.com>,
 qemu-block@nongnu.org, Paolo Bonzini <pbonzini@redhat.com>,
 Stefan Hajnoczi <stefanha@redhat.com>, Bandan Das <bsd@redhat.com>,
 Li-Wen Hsu <lwhsu@freebsd.org>, Pavel Dovgalyuk <pavel.dovgaluk@ispras.ru>,
 Laurent Vivier <lvivier@redhat.com>,
 Bastian Koppelmann <kbastian@mail.uni-paderborn.de>,
 Qiuhao Li <Qiuhao.Li@outlook.com>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>
References: <20230228190653.1602033-1-alex.bennee@linaro.org>
 <20230228190653.1602033-23-alex.bennee@linaro.org>
 <85fa3961-eb23-8d93-b4e4-e3e4227fac26@linaro.org> <87a60xe9q3.fsf@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
In-Reply-To: <87a60xe9q3.fsf@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::332;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x332.google.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.092,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

On 28/2/23 22:55, Alex Bennée wrote:
> 
> Philippe Mathieu-Daudé <philmd@linaro.org> writes:
> 
>> On 28/2/23 20:06, Alex Bennée wrote:
>>> To avoid lots of copy and paste lets deal with artefacts in a
>>> template. This way we can filter out most of the pre-binary object and
>>> library files we no longer need as we have the final binaries.
>>> build-system-alpine also saved .git-submodule-status so for
>>> simplicity
>>> we bring that into the template as well.
>>> As an example the build-system-ubuntu artefacts before this patch
>>> where around 1.3 GB, after dropping the object files it comes to 970
>>> MB.
>>> Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
>>> ---
>>>    .gitlab-ci.d/buildtest-template.yml | 16 ++++++
>>>    .gitlab-ci.d/buildtest.yml          | 81 +++++++++++------------------
>>>    2 files changed, 46 insertions(+), 51 deletions(-)
>>
>> This is still kludging the fact that 'make check-qtest' rebuild
>> the world even if QEMU binaries are present. Still an improvement, so
>> Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>
> 
> Is something being missed by:
> 
>      # Avoid recompiling by hiding ninja with NINJA=":"
>      - make NINJA=":" $MAKE_CHECK_ARGS
> 
> ?

Sorry, I wasn't looking at the correct pipeline.

