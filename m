Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 87881501ECA
	for <lists+qemu-devel@lfdr.de>; Fri, 15 Apr 2022 00:57:03 +0200 (CEST)
Received: from localhost ([::1]:53060 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nf8Oc-0006E2-85
	for lists+qemu-devel@lfdr.de; Thu, 14 Apr 2022 18:57:02 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34242)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1nf8Mp-0004vj-6k
 for qemu-devel@nongnu.org; Thu, 14 Apr 2022 18:55:11 -0400
Received: from mail-wr1-x42e.google.com ([2a00:1450:4864:20::42e]:35816)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1nf8Mm-0008J4-Gf
 for qemu-devel@nongnu.org; Thu, 14 Apr 2022 18:55:10 -0400
Received: by mail-wr1-x42e.google.com with SMTP id k22so8765041wrd.2
 for <qemu-devel@nongnu.org>; Thu, 14 Apr 2022 15:55:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=user-agent:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=7ngexE+py4AuPu7QtzVPbC1jEX/AUcxDnEFN/c0EeoA=;
 b=Vfr0ZVBd0apF8HAy93Qq+zo2p5u9wWux1DPF58+Nms4j4ej4Mc9hcMYVImgXxkfcp+
 smprdlY198KXaoukuQwjv6TecH1QzCjXzVzokUULgqHfz5DZti/hrK5/gCjXKj3WDKVA
 mw1QOsi4eK6TuVYM5YyV2AcCCE9KCjV7bsKPzZdf+E946jACgXvv5ZOxzvZNFl//WIz7
 WSe0rU4chck4xWaVZv6E3JOgrhKHzngkSD8GwvAVIP8qIiiJDEO4ZzxPnBVNZroNGZTa
 MOZgMSesAWJJTC+5OVCTl2MxagOfmTGahsxT/H2Lu2YKe0k8uK3DrUiHhHKadTq5BR9w
 yBQA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:user-agent:from:to:cc:subject:date:message-id
 :mime-version:content-transfer-encoding;
 bh=7ngexE+py4AuPu7QtzVPbC1jEX/AUcxDnEFN/c0EeoA=;
 b=v44J15OiDDqXpI2GJIVlC/5Fbprds1RLe3KF0H1uMwZM8lIMr2Z8UN5IJW3IbHhRU2
 riUEAMHctokCDh67XIhTHtE0w2LVf8E3MK31mk2Ph1GJC32j9oaKiyI7EcP0/aN3jvxQ
 Zdtc1bOxL+gsGJCg2il7UrqlfmNkAfWCICYHsuyQfVaRXgRFk5Zrbh4hmhaQaQCr0/cV
 HWxcwFKGy8cKdKNS/Cv7SQi09VNPcZMYr9Zr3ziRse4u5MTUAdWQEFyeDaud/SjihX5I
 wsKVh/Aij6fV0PVpafy010ZNf4AqBikKMnzvDR9pHH2xnWxvFkG3a2YNp2RwPfVnXbvD
 1/XQ==
X-Gm-Message-State: AOAM531SBBL8eu7RD9qs7smXt1TZ1zTOMbYNNxFp9Y25vGr/CflpvpfI
 LglsNFN0/0OJJPg2FKLBL6EnlA==
X-Google-Smtp-Source: ABdhPJwY5q8nXuQphEdDkk7Lq6G3ALhp8/rB8uafGdREcm7+vYiX6ojGKYn7+7o3w6rgVRbm3wPTtw==
X-Received: by 2002:a5d:6d8f:0:b0:204:101e:753f with SMTP id
 l15-20020a5d6d8f000000b00204101e753fmr3591531wrs.707.1649976906335; 
 Thu, 14 Apr 2022 15:55:06 -0700 (PDT)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id
 2-20020a1c1902000000b00380d3873d6asm3259623wmz.43.2022.04.14.15.55.04
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 14 Apr 2022 15:55:04 -0700 (PDT)
Received: from zen (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 1C22C1FFB7;
 Thu, 14 Apr 2022 23:55:04 +0100 (BST)
User-agent: mu4e 1.7.12; emacs 28.1.50
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Eric Auger <eauger@redhat.com>
Subject: Re: 
Date: Thu, 14 Apr 2022 23:53:59 +0100
Message-ID: <87tuavs2bb.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::42e;
 envelope-from=alex.bennee@linaro.org; helo=mail-wr1-x42e.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Cc: Laurent Vivier <lvivier@redhat.com>, Thomas Huth <thuth@redhat.com>,
 slp@redhat.com, mathieu.poirier@linaro.org, mst@redhat.com,
 viresh.kumar@linaro.org, qemu-devel@nongnu.org, stefanha@redhat.com,
 marcandre.lureau@redhat.com, Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


Eric Auger <eauger@redhat.com> writes:

> Hi Alex,
>
> On 4/7/22 5:00 PM, Alex Benn=C3=A9e wrote:
>> When trying to work out what the virtio-net-tests where doing it was
>> hard because the g_test_trap_subprocess redirects all output to
>> /dev/null. Lift this restriction by using the appropriate flags so you
>> can see something similar to what the vhost-user-blk tests show when
>> running.
>>=20
>> While we are at it remove the g_test_verbose() check so we always show
>> how the QEMU is run.
>>=20
>> Signed-off-by: Alex Benn=C3=A9e <alex.bennee@linaro.org>
>> ---
>>  tests/qtest/qos-test.c | 7 +++----
>>  1 file changed, 3 insertions(+), 4 deletions(-)
>>=20
>> diff --git a/tests/qtest/qos-test.c b/tests/qtest/qos-test.c
>> index f97d0a08fd..c6c196cc95 100644
>> --- a/tests/qtest/qos-test.c
>> +++ b/tests/qtest/qos-test.c
>> @@ -89,9 +89,7 @@ static void qos_set_machines_devices_available(void)
>>=20=20
>>  static void restart_qemu_or_continue(char *path)
>>  {
>> -    if (g_test_verbose()) {
>> -        qos_printf("Run QEMU with: '%s'\n", path);
>> -    }
>> +    qos_printf("Run QEMU with: '%s'\n", path);
>>      /* compares the current command line with the
>>       * one previously executed: if they are the same,
>>       * don't restart QEMU, if they differ, stop previous
>> @@ -185,7 +183,8 @@ static void run_one_test(const void *arg)
>>  static void subprocess_run_one_test(const void *arg)
>>  {
>>      const gchar *path =3D arg;
>> -    g_test_trap_subprocess(path, 0, 0);
>> +    g_test_trap_subprocess(path, 0,
>> +                           G_TEST_SUBPROCESS_INHERIT_STDOUT | G_TEST_SU=
BPROCESS_INHERIT_STDERR);
> While workling on libqos/pci tests on aarch64 I also did that but I
> noticed there were a bunch of errors such as:
>
> /aarch64/virt/generic-pcihost/pci-bus-generic/pci-bus/virtio-net-pci/virt=
io-net/virtio-net-tests/vhost-user/multiqueue:
> qemu-system-aarch64: Failed to set msg fds.
> qemu-system-aarch64: vhost VQ 0 ring restore failed: -22: Invalid
> argument (22)
> qemu-system-aarch64: Failed to set msg fds.
> qemu-system-aarch64: vhost VQ 1 ring restore failed: -22: Invalid
> argument (22)
> qemu-system-aarch64: Failed to set msg fds.
> qemu-system-aarch64: vhost VQ 2 ring restore failed: -22: Invalid
> argument (22)
> qemu-system-aarch64: Failed to set msg fds.
> qemu-system-aarch64: vhost VQ 3 ring restore failed: -22: Invalid
> argument (22)
>
> I see those also when running with x86_64-softmmu/qemu-system-x86_64
> (this is no aarch64 specific).

I think this is a symptom of an unclean tear down (which might be too
much to ask for our fake vhost backend) or something we should handle
better. I still have to get my gpio test working so I'll have a look
tomorrow.


>
> I don't know if it is an issue to get those additional errors?
>
> Thanks
>
> Eric
>
>>      g_test_trap_assert_passed();
>>  }
>>=20=20
>>=20


--=20
Alex Benn=C3=A9e

