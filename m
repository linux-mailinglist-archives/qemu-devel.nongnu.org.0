Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 924356EA857
	for <lists+qemu-devel@lfdr.de>; Fri, 21 Apr 2023 12:28:25 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1ppnz5-0003w9-UQ; Fri, 21 Apr 2023 06:27:19 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1ppnz3-0003vA-Ic
 for qemu-devel@nongnu.org; Fri, 21 Apr 2023 06:27:17 -0400
Received: from mail-wm1-x329.google.com ([2a00:1450:4864:20::329])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1ppnz1-0004db-TJ
 for qemu-devel@nongnu.org; Fri, 21 Apr 2023 06:27:17 -0400
Received: by mail-wm1-x329.google.com with SMTP id
 5b1f17b1804b1-3f178da21b2so16558895e9.1
 for <qemu-devel@nongnu.org>; Fri, 21 Apr 2023 03:27:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1682072833; x=1684664833;
 h=content-transfer-encoding:in-reply-to:references:cc:to:from
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=UxnQBgNCCYRpnenL/0UOFpdbFbKWLhKfc2XyN0EBS9c=;
 b=XSZWaEOsLOSoR1KLZhRN2t6QRgZKZm5pNBjY6Pd7VCc4rk7WXF8wNScN8Fj1tWhFE6
 mKUjtDtSb7vPBAPcL+J720bf9TuvuYD8HUamjZg9jHD4bIKYRGqrhQZWA+pU4CSHfWuk
 jvF1KjO/1Mlm6/CytQO3bMHl7X9LWCj1q2oU8AArBrHpBFwLnREidWYev5d+v86G/nkx
 5ZGHfzSOmZN8A0eTnJXJsrNVXzk0zDIDYvePmbjOpo/9YQIF0hTQyGcfFDR3aVDz+2LY
 bl0B6Qj/0FYrYRwPsstEnld6fYFet1zdIpJ4j2c7oZHF34sUZWD9BjQBw26tgE8PA6uG
 xSow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1682072833; x=1684664833;
 h=content-transfer-encoding:in-reply-to:references:cc:to:from
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=UxnQBgNCCYRpnenL/0UOFpdbFbKWLhKfc2XyN0EBS9c=;
 b=QWEIt/pDu2hXifmPbixYYJYpqg0+ISkiPW0FWC2+liOV2c5T0lad2nPov0wOosVaH4
 JKzGJ9BUV31jRzvPIVoaAbItQteLnp4EJAQgwjRtO0E+rqnytb16WqNtVCsdqoLXhvjx
 AnxjXJqJ4MbMwFLrXSkrtRtnJIjMtrEDv/AaFTOwmd9N3HvyOuaVpNkoNHmDM/dvYVmV
 vhm7stjCPrlPzVgb41F5g5EmXDwO+As6lNgxhyC8JJn/V3/PSlB49kn3ibn3mN7JsATp
 2LrDOgifLaZorz7v5LN/8XH0qhTHKT90ykNZcf97/8eJWQqeWOrXQeKaO+uot0lm3zce
 /Nng==
X-Gm-Message-State: AAQBX9ecEKHBAtKQLEpfUHgyXOmji2ruWNa/09i3gWDVmJy6yTfLpM62
 qZW0DXWrh10G6b3APjW1a8Cl9g==
X-Google-Smtp-Source: AKy350ZYi6yBL04z/ftE8mDwQbQPTMUCSAkTux3Ys5YyfzrURSYbw8hJLpOf9yvg/mI7k7lcxhCfWA==
X-Received: by 2002:a05:600c:228a:b0:3f0:46d4:b391 with SMTP id
 10-20020a05600c228a00b003f046d4b391mr1333185wmf.6.1682072833603; 
 Fri, 21 Apr 2023 03:27:13 -0700 (PDT)
Received: from [192.168.69.115] (min31-h02-176-184-28-119.dsl.sta.abo.bbox.fr.
 [176.184.28.119]) by smtp.gmail.com with ESMTPSA id
 b5-20020a056000054500b002e5ff05765esm4097740wrf.73.2023.04.21.03.27.10
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 21 Apr 2023 03:27:13 -0700 (PDT)
Message-ID: <03d111a2-183b-1226-6097-58966325a47b@linaro.org>
Date: Fri, 21 Apr 2023 12:27:09 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.10.0
Subject: Re: [PATCH v4 1/6] tests/requirements.txt: bump up avocado-framework
 version to 101.0
Content-Language: en-US
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
To: Cleber Rosa <crosa@redhat.com>, John Snow <jsnow@redhat.com>
Cc: =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 Jan Richter <jarichte@redhat.com>, qemu-devel <qemu-devel@nongnu.org>,
 Peter Maydell <peter.maydell@linaro.org>,
 Bastian Koppelmann <kbastian@mail.uni-paderborn.de>,
 Markus Armbruster <armbru@redhat.com>, Beraldo Leal <bleal@redhat.com>,
 Thomas Huth <thuth@redhat.com>, Stefan Hajnoczi <stefanha@redhat.com>,
 =?UTF-8?Q?Marc-Andr=c3=a9_Lureau?= <marcandre.lureau@redhat.com>,
 =?UTF-8?Q?Daniel_P=2e_Berrang=c3=a9?= <berrange@redhat.com>,
 Radoslaw Biernacki <rad@semihalf.com>,
 Leif Lindholm <quic_llindhol@quicinc.com>,
 Paolo Bonzini <pbonzini@redhat.com>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 qemu-arm <qemu-arm@nongnu.org>, Kautuk Consul <kconsul@linux.vnet.ibm.com>,
 Hariharan T S <hariharan.ts@linux.vnet.ibm.com>
References: <20230417134321.3627231-1-alex.bennee@linaro.org>
 <20230417134321.3627231-2-alex.bennee@linaro.org>
 <CAFn=p-bqK-RsMo8wVy2zCxU=iAkXG1t9xVuoqLSN0UbTYKPgwQ@mail.gmail.com>
 <87pm82e74d.fsf@linaro.org> <74be23e6-015b-cb1d-967e-65fc32347553@linaro.org>
 <CAFn=p-boa4C1P0mJob=spZGMi4ECA-D5yNovHxC6-VTwkKJoHg@mail.gmail.com>
 <9a0a7b21-8798-d5d3-bf4b-f1de38e82581@redhat.com>
 <fb01dbfa-426a-f87c-620b-c5e7b6d6598e@linaro.org>
In-Reply-To: <fb01dbfa-426a-f87c-620b-c5e7b6d6598e@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::329;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x329.google.com
X-Spam_score_int: -37
X-Spam_score: -3.8
X-Spam_bar: ---
X-Spam_report: (-3.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-1.669,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
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

On 21/4/23 12:07, Philippe Mathieu-Daudé wrote:
> On 21/4/23 06:09, Cleber Rosa wrote:

> Manually using "avocado run --test-runner=nrunner" helps running the
> tests but the console output is never displayed (see [*]) and once
> finished Avocado lets various QEMU processes running in detached
> mode, wasting resources.=

Using this patch:

$ ./tests/venv/bin/avocado --show=console -V run -t arch:aarch64 
tests/avocado/boot_*
tests/avocado/boot_linux_console.py:BootLinuxConsole.test_aarch64_raspi3_atf: 
ERROR
tests/avocado/boot_linux_console.py:BootLinuxConsole.test_aarch64_xlnx_versal_virt: 
ERROR

Not asking for the console output at least show the test being
processed (similar to old runner):

$ ./tests/venv/bin/avocado run -t machine:raspi3b tests/avocado/boot_*
Fetching asset from 
tests/avocado/boot_linux_console.py:BootLinuxConsole.test_aarch64_raspi3_atf
JOB ID     : 1c963c12f7f07e109ef8480ddf204f02e61f8b8d
JOB LOG    : 
/Users/philmd/avocado/job-results/job-2023-04-21T12.24-1c963c1/job.log
  (1/1) 
tests/avocado/boot_linux_console.py:BootLinuxConsole.test_aarch64_raspi3_atf: 
STARTED
  (1/1) 
tests/avocado/boot_linux_console.py:BootLinuxConsole.test_aarch64_raspi3_atf: 
ERROR: ConnectError: Failed to establish session: EOFError\n	Exit code: 
1\n	Command: ./qemu-system-aarch64 -display none -vga none -chardev 
socket,id=mon,fd=11 -mon chardev=mon,mode=control -machine raspi3b 
-serial null -chardev socket,id=console,path=/var/folders... (0.31 s)
RESULTS    : PASS 0 | ERROR 1 | FAIL 0 | SKIP 0 | WARN 0 | INTERRUPT 0 | 
CANCEL 0
JOB TIME   : 2.20 s

Test summary:
tests/avocado/boot_linux_console.py:BootLinuxConsole.test_aarch64_raspi3_atf: 
ERROR


