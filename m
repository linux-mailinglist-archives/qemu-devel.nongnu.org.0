Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 52F2F50A21D
	for <lists+qemu-devel@lfdr.de>; Thu, 21 Apr 2022 16:23:34 +0200 (CEST)
Received: from localhost ([::1]:43534 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nhXiX-0008NM-6P
	for lists+qemu-devel@lfdr.de; Thu, 21 Apr 2022 10:23:33 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39104)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1nhXLc-0003mG-UW
 for qemu-devel@nongnu.org; Thu, 21 Apr 2022 09:59:54 -0400
Received: from mail-ej1-x635.google.com ([2a00:1450:4864:20::635]:40622)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1nhXLa-0007Tp-80
 for qemu-devel@nongnu.org; Thu, 21 Apr 2022 09:59:51 -0400
Received: by mail-ej1-x635.google.com with SMTP id y20so10218729eju.7
 for <qemu-devel@nongnu.org>; Thu, 21 Apr 2022 06:59:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=references:user-agent:from:to:cc:subject:date:in-reply-to
 :message-id:mime-version:content-transfer-encoding;
 bh=VKmEaFPh+NYjYmw1ou6tHIVr7UBT84Wdd56FeFbZBh4=;
 b=i9ffeAW2aFD3JPw7mlKuqJ1PbczKpgFwWxDb7D3Uk1QEN+1Uq/osY3PdbtczUIez4x
 4vQLtL3uo0elMzpNxyQ3GQm/L3LeqINbgtpqzVNkeUg9FnctGEDB95BdcQNAraie7dqB
 PWA4ZTbzuCIm+01XqHxBhFSVu22ce8npISOu8NSTzZwvCxe0AtxviKjxS4Wjpo9+n9h2
 qq7ER33/H6+fJEUhTREhIbktF8XMpi9oNT0AoeHszZzXzIv97DmvH6RihmP+Zaej5HDY
 Ej3Ry5RagKQVZmsGSJ+VzW93eY7NigOvD/WxClR/dZrHzT4AFjJlX7bToKo3uzMIceuw
 WKrQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:references:user-agent:from:to:cc:subject:date
 :in-reply-to:message-id:mime-version:content-transfer-encoding;
 bh=VKmEaFPh+NYjYmw1ou6tHIVr7UBT84Wdd56FeFbZBh4=;
 b=u9xMXqfSLX+Qtj4cQRTH1eMIpYaD6EkIl/k/fAi/9nt4PWPSwGH2XvP0oo0TqWooiq
 IfXhJWofVKgjdSmD9sRCbADA/5Xitab1zM3jW35dhanRe5H6xdbKQXysohWc22ZSEajX
 GRkjV6uqw+rgUd0oVi/VkXI/qOvo9zETGoMde4BU3N1X9IGcunjfv8cd/E1vGDXvmU4F
 enzsEJEHXgEOIfHe0bi6u8NNTTeblZbhOXofaNgtEVM9nclNBEbEg+FhNH8ma4nJ4WpB
 /mD3pArddcopBGjbDWltiZLjWizTFy3NWJQ0QmOLqJGsT7zELH+apxQin2l9yL5wBMjm
 1/1g==
X-Gm-Message-State: AOAM532NhTqBpEnmy+RuwNBy70z7bxMj5yPBE1W30vAyYVDKXtxvGxwN
 lsmgtSmKBr4ruVHPOaa9nLKA8Q==
X-Google-Smtp-Source: ABdhPJy5m0zAuUzrDOzGxzmukPKx2BNsdqH0VdWQdh9Q5MKiFv/cDJm1UktimwFlws/w5FsdQCxrQA==
X-Received: by 2002:a17:907:3e94:b0:6ef:f135:4b with SMTP id
 hs20-20020a1709073e9400b006eff135004bmr9903768ejc.609.1650549588771; 
 Thu, 21 Apr 2022 06:59:48 -0700 (PDT)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id
 q27-20020a170906145b00b006efecc47831sm2522340ejc.7.2022.04.21.06.59.47
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 21 Apr 2022 06:59:47 -0700 (PDT)
Received: from zen (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id D07AC1FFB7;
 Thu, 21 Apr 2022 14:59:46 +0100 (BST)
References: <20220407150042.2338562-1-alex.bennee@linaro.org>
 <738a5f8a-a14b-ad07-5d4d-ece8b6ddbd2c@redhat.com>
 <YmFRk5Nkd/AesL1C@stefanha-x1.localdomain>
User-agent: mu4e 1.7.13; emacs 28.1.50
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Stefan Hajnoczi <stefanha@redhat.com>
Subject: Re: [RFC PATCH] tests/qtest: pass stdout/stderr down to subtests
Date: Thu, 21 Apr 2022 14:57:55 +0100
In-reply-to: <YmFRk5Nkd/AesL1C@stefanha-x1.localdomain>
Message-ID: <87mtgev8od.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::635;
 envelope-from=alex.bennee@linaro.org; helo=mail-ej1-x635.google.com
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
 viresh.kumar@linaro.org, qemu-devel@nongnu.org, Eric Auger <eauger@redhat.com>,
 marcandre.lureau@redhat.com, Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


Stefan Hajnoczi <stefanha@redhat.com> writes:

> [[PGP Signed Part:Undecided]]
> On Thu, Apr 14, 2022 at 07:25:54PM +0200, Eric Auger wrote:
>> Hi Alex,
>>=20
>> On 4/7/22 5:00 PM, Alex Benn=C3=A9e wrote:
>> > When trying to work out what the virtio-net-tests where doing it was
>> > hard because the g_test_trap_subprocess redirects all output to
>> > /dev/null. Lift this restriction by using the appropriate flags so you
>> > can see something similar to what the vhost-user-blk tests show when
>> > running.
>> >=20
>> > While we are at it remove the g_test_verbose() check so we always show
>> > how the QEMU is run.
>> >=20
>> > Signed-off-by: Alex Benn=C3=A9e <alex.bennee@linaro.org>
>> > ---
>> >  tests/qtest/qos-test.c | 7 +++----
>> >  1 file changed, 3 insertions(+), 4 deletions(-)
>> >=20
>> > diff --git a/tests/qtest/qos-test.c b/tests/qtest/qos-test.c
>> > index f97d0a08fd..c6c196cc95 100644
>> > --- a/tests/qtest/qos-test.c
>> > +++ b/tests/qtest/qos-test.c
>> > @@ -89,9 +89,7 @@ static void qos_set_machines_devices_available(void)
>> >=20=20
>> >  static void restart_qemu_or_continue(char *path)
>> >  {
>> > -    if (g_test_verbose()) {
>> > -        qos_printf("Run QEMU with: '%s'\n", path);
>> > -    }
>> > +    qos_printf("Run QEMU with: '%s'\n", path);
>> >      /* compares the current command line with the
>> >       * one previously executed: if they are the same,
>> >       * don't restart QEMU, if they differ, stop previous
>> > @@ -185,7 +183,8 @@ static void run_one_test(const void *arg)
>> >  static void subprocess_run_one_test(const void *arg)
>> >  {
>> >      const gchar *path =3D arg;
>> > -    g_test_trap_subprocess(path, 0, 0);
>> > +    g_test_trap_subprocess(path, 0,
>> > +                           G_TEST_SUBPROCESS_INHERIT_STDOUT | G_TEST_=
SUBPROCESS_INHERIT_STDERR);
>> While workling on libqos/pci tests on aarch64 I also did that but I
>> noticed there were a bunch of errors such as:
>>=20
>> /aarch64/virt/generic-pcihost/pci-bus-generic/pci-bus/virtio-net-pci/vir=
tio-net/virtio-net-tests/vhost-user/multiqueue:
>> qemu-system-aarch64: Failed to set msg fds.
>> qemu-system-aarch64: vhost VQ 0 ring restore failed: -22: Invalid
>> argument (22)
>> qemu-system-aarch64: Failed to set msg fds.
>> qemu-system-aarch64: vhost VQ 1 ring restore failed: -22: Invalid
>> argument (22)
>> qemu-system-aarch64: Failed to set msg fds.
>> qemu-system-aarch64: vhost VQ 2 ring restore failed: -22: Invalid
>> argument (22)
>> qemu-system-aarch64: Failed to set msg fds.
>> qemu-system-aarch64: vhost VQ 3 ring restore failed: -22: Invalid
>> argument (22)
>>=20
>> I see those also when running with x86_64-softmmu/qemu-system-x86_64
>> (this is no aarch64 specific).

I think it's a case of things not being cleanly taken down leaving
dangling sockets. I suspect the qemu instance should shutdown before the
fake vhost-user daemon.

>>=20
>> I don't know if it is an issue to get those additional errors?
>
> I see the same errors on
> /x86_64/pc/i440FX-pcihost/pci-bus-pc/pci-bus/virtio-net-pci/virtio-net/vi=
rtio-net-tests/vhost-user/.
>
> On the other hand, "make check" is happy (and silent) when run on the
> command-line.
>
> If the CI enables more verbose output then these messages might be
> diffed and interpreted as failures, but I didn't check the CI scripts.
>
> As long as GitLab CI is happy I think it's okay to merge this patch, but
> it would be interesting to investigate the reason for these messages.

Well this is all part of trying to get a working test case for the gpio
vhost-user device. So far I'm adding verbose output to try and divine
all the secret moving parts that go to make the test work.

>
> Stefan
>
> [[End of PGP Signed Part]]


--=20
Alex Benn=C3=A9e

