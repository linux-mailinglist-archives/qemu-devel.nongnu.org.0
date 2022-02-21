Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0BEBD4BDA8F
	for <lists+qemu-devel@lfdr.de>; Mon, 21 Feb 2022 16:29:29 +0100 (CET)
Received: from localhost ([::1]:54254 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nMAcy-00037e-0Q
	for lists+qemu-devel@lfdr.de; Mon, 21 Feb 2022 10:29:28 -0500
Received: from eggs.gnu.org ([209.51.188.92]:45894)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1nMAax-0002A7-Go
 for qemu-devel@nongnu.org; Mon, 21 Feb 2022 10:27:23 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:44239)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1nMAau-0005VL-0y
 for qemu-devel@nongnu.org; Mon, 21 Feb 2022 10:27:22 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1645457239;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=NpflJte7Gxf+jLEZwMemQ7wcZOnoNrfbiTVPTO/Y+O8=;
 b=P7m7WtlKB0BmHDMGYchFhNZyOTJ7J1DHr8tjUfIxfxyWRS8LuLnkWRXR0D/v/ywmcSGXqL
 A/cO+15Ligu2jr+yvYR/O8A3J8wq2DsBQI5sCcpaBeJ/KCISrbOi1zKUbi29oaKP43mTaH
 bCVos8Hb0LkXQdYQfhWkuEuHmpT11GE=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-581-KSAFZsS4P76zwMvyyl8Mog-1; Mon, 21 Feb 2022 10:27:16 -0500
X-MC-Unique: KSAFZsS4P76zwMvyyl8Mog-1
Received: by mail-wr1-f69.google.com with SMTP id
 v17-20020adf8b51000000b001e336bf3be7so7570499wra.1
 for <qemu-devel@nongnu.org>; Mon, 21 Feb 2022 07:27:15 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=NpflJte7Gxf+jLEZwMemQ7wcZOnoNrfbiTVPTO/Y+O8=;
 b=GJfj907uj4x/eXa6OjkPOIzshA1ttbeKQ0qak7b7ZTxRoCB9ElfUv7qnGBD0CNjqzr
 SYkKckoraMiOsvUCj60ODCfAXDem98hyJTKmxk4N21i3vlVl+vf63lFXmOCL6ONCJfsO
 UlsIupLCBZIu0KasYRyiomg+LESF92lDsybAgjfnsdsV2t+o7VJl/ddFFReRTuaTEIAc
 1xfrT9n5KMwRmmT6/JyCmUpn/0Dc7Cfw49/rwQzVhFMzwG6Egm7wa+5gGG23yVgGV5ft
 Bm/u1SeEpQfs5/Xs7MSXyrZy0IadisRR8LTdWYio3RK+pQiGDaa7TZkfYCGm2753Y0vj
 lzWA==
X-Gm-Message-State: AOAM531ReafjzQPcaGPVEqkvTgD3DLnXBfv6D+xM7B+uohaTr/LmUsqS
 zuVh0916OvDcOKlL128peZ14hxhGyu0EMS4Jlq79rLlvaJ6E1ZRw2XIxH5a31qQGBn7HtwYWk4b
 ZbVyEZMjbVrbuUbM=
X-Received: by 2002:a5d:480f:0:b0:1e4:bc52:f51b with SMTP id
 l15-20020a5d480f000000b001e4bc52f51bmr15370009wrq.448.1645457234905; 
 Mon, 21 Feb 2022 07:27:14 -0800 (PST)
X-Google-Smtp-Source: ABdhPJwqME6j0lBzxDR/xRSCvhbb+XMWLgviUoWuFJryB22ajSJeQyY0uWno5QUkvRdVsDiodoabRQ==
X-Received: by 2002:a5d:480f:0:b0:1e4:bc52:f51b with SMTP id
 l15-20020a5d480f000000b001e4bc52f51bmr15369994wrq.448.1645457234670; 
 Mon, 21 Feb 2022 07:27:14 -0800 (PST)
Received: from [192.168.8.104] (tmo-098-218.customers.d1-online.com.
 [80.187.98.218])
 by smtp.gmail.com with ESMTPSA id z3sm9282947wmp.42.2022.02.21.07.27.13
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 21 Feb 2022 07:27:13 -0800 (PST)
Message-ID: <7eac43ef-25c8-461e-aec8-b07eebc92073@redhat.com>
Date: Mon, 21 Feb 2022 16:27:12 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: 'make check-acceptance' failing on s390 tests?
To: Peter Maydell <peter.maydell@linaro.org>,
 QEMU Developers <qemu-devel@nongnu.org>
References: <CAFEAcA9uVgPzkYHZk3jFNKj6d-rOh25gNFM_bKz=G7G+0B=1+A@mail.gmail.com>
From: Thomas Huth <thuth@redhat.com>
In-Reply-To: <CAFEAcA9uVgPzkYHZk3jFNKj6d-rOh25gNFM_bKz=G7G+0B=1+A@mail.gmail.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=thuth@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01,
 WEIRD_PORT=0.001 autolearn=ham autolearn_force=no
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
Cc: "Daniel P. Berrange" <berrange@redhat.com>, Beraldo Leal <bleal@redhat.com>,
 Cornelia Huck <cohuck@redhat.com>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 qemu-s390x <qemu-s390x@nongnu.org>, Cleber Rosa <crosa@redhat.com>,
 =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 18/02/2022 16.04, Peter Maydell wrote:
> Hi; is anybody else seeing 'make check-acceptance' fail on some of
> the s390 tests?
> 
>   (009/183) tests/avocado/boot_linux.py:BootLinuxS390X.test_s390_ccw_virtio_tcg:
> INTERRUPTED: Test interrupted by SIGTERM\nRunner error occurred:
> Timeout reached\nOriginal status: ERROR\n{'name':
> '009-tests/avocado/boot_linux.py:BootLinuxS390X.test_s390_ccw_virtio_tcg',
> 'logdir': '/mnt/nvmedisk/linaro/qemu-from-laptop/qemu/build/clang/tests/results/j...
> (900.20 s)
> 
> 
>   (090/183) tests/avocado/machine_s390_ccw_virtio.py:S390CCWVirtioMachine.test_s390x_fedora:
> FAIL: b'1280 800\n' != b'1024 768\n' (26.79 s)
> 
> 
> I've cc'd Daniel because the 090 at least looks like a resolution
> baked into the test case, and commit de72c4b7c that went in
> last month changed the EDID reported resolution from 1024x768
> to 1280x800.

Yes, that seems to be right - since the default monitor resolution changed, 
the screenshot now has a different size, too. I sent a patch here:

https://lists.gnu.org/archive/html/qemu-devel/2022-02/msg04473.html

> Not sure about the timeout on the boot test: the avocado log
> shows it booting at least as far as
> "Kernel 5.3.7-301.fc31.s390x on an s390x (ttysclp0)"
> and then there's no further output until the timeout.
> Unfortunately the avocado log doesn't seem to include useful
> information like "this is the string we were waiting to see", so
> I'm not sure exactly what's gone wrong there.
> 
> (I continue to find the Avocado tests rather opaque: when you
> get a series of green OK's that's fine, but when you get a failure
> it's often non-obvious why it failed or how to do simple things
> like "rerun just that one failed test" or "run the failing command,
> interactively on the command line".)

For me, it's even worse with the tests/avocado/boot_linux.py - none of them 
is working on my local laptop, so I was always ignoring them until now. 
FWIW, I'm seeing this python backtrace in the log:

  Reproduced traceback from: 
/home/thuth/tmp/qemu-build/tests/venv/lib64/python3.6/site-packages/avocado/core/test.py:770
  Traceback (most recent call last):
    File "/home/thuth/tmp/qemu-build/tests/avocado/boot_linux.py", line 30, 
in test_pc_i440fx_tcg
      self.launch_and_wait(set_up_ssh_connection=False)
    File 
"/home/thuth/tmp/qemu-build/tests/avocado/avocado_qemu/__init__.py", line 
636, in launch_and_wait
      cloudinit.wait_for_phone_home(('0.0.0.0', self.phone_home_port), 
self.name)
    File 
"/home/thuth/tmp/qemu-build/tests/venv/lib64/python3.6/site-packages/avocado/utils/cloudinit.py", 
line 192, in wait_for_phone_home
      s = PhoneHomeServer(address, instance_id)
    File 
"/home/thuth/tmp/qemu-build/tests/venv/lib64/python3.6/site-packages/avocado/utils/cloudinit.py", 
line 173, in __init__
      HTTPServer.__init__(self, address, PhoneHomeServerHandler)
    File "/usr/lib64/python3.6/socketserver.py", line 456, in __init__
      self.server_bind()
    File "/usr/lib64/python3.6/http/server.py", line 136, in server_bind
      socketserver.TCPServer.server_bind(self)
    File "/usr/lib64/python3.6/socketserver.py", line 470, in server_bind
      self.socket.bind(self.server_address)
  TypeError: an integer is required (got type NoneType)

... no clue how to debug these problems, though.

> The 090 failure didn't cause the merge to be rejected because
> in commit 333168efe5c8 we disabled both these tests when
> running on GitLab.
> 
> Suggestion: we should either disable tests entirely (except
> for manual "I want to run this known-flaky test") or not at
> all, rather than disabling them only on GitLab. If I'm running
> 'make check-acceptance' locally I don't want to be distracted
> by tests we know to be dodgy, any more than if I were running
> the CI on GitLab.

IIRC I only saw the occasional hangs of the test on Gitlab, and never on my 
local host ... but I see your point ... I'm fine if we replace the 
@skipIf(os.getenv('GITLAB_CI')...) there with a 
@skipUnless(os.getenv('AVOCADO_ALLOW_FLAKY_TESTS')...) or something similar. 
Would you have some spare time to write such a patch?

  Thomas


