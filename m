Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id EE4774B7469
	for <lists+qemu-devel@lfdr.de>; Tue, 15 Feb 2022 19:36:32 +0100 (CET)
Received: from localhost ([::1]:33452 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nK2gi-0005EM-3F
	for lists+qemu-devel@lfdr.de; Tue, 15 Feb 2022 13:36:32 -0500
Received: from eggs.gnu.org ([209.51.188.92]:53962)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1nK2T6-0007ir-VV
 for qemu-devel@nongnu.org; Tue, 15 Feb 2022 13:22:29 -0500
Received: from [2a00:1450:4864:20::331] (port=33794
 helo=mail-wm1-x331.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1nK2T5-0004Ut-3w
 for qemu-devel@nongnu.org; Tue, 15 Feb 2022 13:22:28 -0500
Received: by mail-wm1-x331.google.com with SMTP id
 bg19-20020a05600c3c9300b0034565e837b6so1501767wmb.1
 for <qemu-devel@nongnu.org>; Tue, 15 Feb 2022 10:22:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=references:user-agent:from:to:cc:subject:date:in-reply-to
 :message-id:mime-version:content-transfer-encoding;
 bh=JhuSl5KR2CF7otyd7995uMQNrm1iYcFGJIaTQGE9tHg=;
 b=Qba8uXWw0gO+KFL3eQCmu4LwRyi9BOhpfjrDBHBJ2UWC1dZWO/N4r0weBpVBs+2VKh
 ixM+uhLe+ym4qXa090JcNsqABMMjYHaCIRn/y0eb6Of0a0ggrPv3KbnVheXa2/YCVguX
 YTdXY0hAxiUKUnwNWXWPnCK+APMKe5PYJhcYHUDcdtzCNkDVnh5LxJXs9gwjGpkIoRlz
 yQ1HBZkF48K/Kq0xPRd89isNF9PmMAvn0wRzF0D/mSo8kw5VdkQ37GQqV7GknbP5khCm
 sz/KvUCWUJpanNDCee2pEUjH0DNSyuZljknFbLa1gv1QzeGiBLSz/uZF1vLyTIPYg8Rb
 I7Hw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:references:user-agent:from:to:cc:subject:date
 :in-reply-to:message-id:mime-version:content-transfer-encoding;
 bh=JhuSl5KR2CF7otyd7995uMQNrm1iYcFGJIaTQGE9tHg=;
 b=yUUTGPwZ5v0cDZTBIrB+wgJGkAx11jZdc1FHMS6oUuSLjt1RG1rRFRQCDFTSlsxXX8
 cwIkl1Z5klVUSxdCcDzALY3Ux6fYc6GNqtjTGmoVRtIb5F6LEtiJ663yDpgLyW/3dr09
 zZCg8pzwe4SWJpkUC2dq8Qp+lFUQwqBNT14oVKbowmnNYPBiAdumDrRZX5/cL0n0UtYA
 tWMQ2sv55X65Y83XQZcXnvdajdPvm44EpJzl6N4E7r9QGFzg8MCmlN/FpFjgiYjRCXLS
 S7hy711IwM3Zla98/EeIKt+vHTSArb780OKbMyXSkXdgD/qrJqpMw32VVFvs8UNUGZLV
 WS6Q==
X-Gm-Message-State: AOAM532vQJos8174Ijzbb3hA6C9zbkWZo1i68XXc2n1ZTZUF6pQ0EjSM
 C46PJcFy2ABTjgkI7I9i0SYQgA==
X-Google-Smtp-Source: ABdhPJzil9VufRN5NMddfkHyDzBGIjAP6hSbtNbPTQfa2t6Dv2LEzll4LXUbN3fi75zdrmMCFGxJBw==
X-Received: by 2002:a1c:a942:0:b0:37b:e02c:5ac2 with SMTP id
 s63-20020a1ca942000000b0037be02c5ac2mr4275441wme.12.1644949344212; 
 Tue, 15 Feb 2022 10:22:24 -0800 (PST)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id b7sm22764695wrp.23.2022.02.15.10.22.23
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 15 Feb 2022 10:22:23 -0800 (PST)
Received: from zen (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 739DC20329;
 Tue, 15 Feb 2022 18:22:22 +0000 (GMT)
References: <CAFEAcA9cMZoj18gq7Ksv5PRoU1wRmXvW_e9UE73C_MEB7wTroQ@mail.gmail.com>
User-agent: mu4e 1.7.7; emacs 28.0.91
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Peter Maydell <peter.maydell@linaro.org>
Subject: Re: "make check-acceptance" takes way too long
Date: Tue, 15 Feb 2022 18:14:34 +0000
In-reply-to: <CAFEAcA9cMZoj18gq7Ksv5PRoU1wRmXvW_e9UE73C_MEB7wTroQ@mail.gmail.com>
Message-ID: <87ee44c7mp.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::331
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::331;
 envelope-from=alex.bennee@linaro.org; helo=mail-wm1-x331.google.com
X-Spam_score_int: -3
X-Spam_score: -0.4
X-Spam_bar: /
X-Spam_report: (-0.4 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 PDS_HP_HELO_NORDNS=0.904, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
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
Cc: Richard Henderson <richard.henderson@linaro.org>,
 Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 "Daniel P. Berrange" <berrange@redhat.com>,
 QEMU Developers <qemu-devel@nongnu.org>, Cleber Rosa <crosa@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


Peter Maydell <peter.maydell@linaro.org> writes:

> "make check-acceptance" takes way way too long. I just did a run
> on an arm-and-aarch64-targets-only debug build and it took over
> half an hour, and this despite it skipping or cancelling 26 out
> of 58 tests!
>
> I think that ~10 minutes runtime is reasonable. 30 is not;
> ideally no individual test would take more than a minute or so.
>
> Output saying where the time went. The first two tests take
> more than 10 minutes *each*. I think a good start would be to find
> a way of testing what they're testing that is less heavyweight.
>
>  (01/58) tests/acceptance/boot_linux.py:BootLinuxAarch64.test_virt_tcg_gi=
cv2:
> PASS (629.74 s)
>  (02/58) tests/acceptance/boot_linux.py:BootLinuxAarch64.test_virt_tcg_gi=
cv3:
> PASS (628.75 s)

So I've done some digging and tried some alternative images but I'm
running into two things:

 - -cpu max is slow without ,pauth-impdef=3Don
 - for some reason the distro cloud images cause 2 orders of magnitude more=
 TB
   invalidates

For example a very simple Alpine boot:

  Translation buffer state:
  gen code size       810926227/1073659904
  TB count            1514678
  TB avg target size  17 max=3D2048 bytes
  TB avg host size    292 bytes (expansion ratio: 16.8)
  cross page TB count 0 (0%)
  direct jump count   1035828 (68%) (2 jumps=3D772419 50%)
  TB hash buckets     439751/524288 (83.88% head buckets used)
  TB hash occupancy   42.96% avg chain occ. Histogram: [0,10)%|=E2=96=84=E2=
=96=81=E2=96=88=E2=96=81=E2=96=81=E2=96=87=E2=96=81=E2=96=85=E2=96=81=E2=96=
=82|[90,100]%
  TB hash avg chain   1.056 buckets. Histogram: 1|=E2=96=88=E2=96=81  =E2=
=96=81=E2=96=81|10

  Statistics:
  TB flush count      0
  TB invalidate count 550632
  TLB full flushes    0
  TLB partial flushes 1488833
  TLB elided flushes  12085180
  [TCG profiler not compiled]

which unsurprisingly has this at the top of the perf profile:

  20.17%  qemu-system-aar  qemu-system-aarch64      [.] do_tb_phys_invalida=
te=20=20=20
   3.60%  qemu-system-aar  qemu-system-aarch64      [.] helper_lookup_tb_ptr
=20=20=20
Versus my Debian Bullseye testing image (with all of systemd):

  Translation buffer state:
  gen code size       899208739/1073577984
  TB count            1599725
  TB avg target size  18 max=3D2048 bytes
  TB avg host size    318 bytes (expansion ratio: 17.2)
  cross page TB count 0 (0%)
  direct jump count   1067312 (66%) (2 jumps=3D826284 51%)
  TB hash buckets     816402/1048576 (77.86% head buckets used)
  TB hash occupancy   36.57% avg chain occ. Histogram: [0,10)%|=E2=96=85 =
=E2=96=88  =E2=96=86=E2=96=81=E2=96=83=E2=96=81=E2=96=82|[90,100]%
  TB hash avg chain   1.027 buckets. Histogram: 1|=E2=96=88=E2=96=81=E2=96=
=81  =E2=96=81|9

  Statistics:
  TB flush count      0
  TB invalidate count 7763
  TLB full flushes    0
  TLB partial flushes 1066791
  TLB elided flushes  973569
  [TCG profiler not compiled]

with a more reasonable balance:

   4.21%  qemu-system-aar  qemu-system-aarch64         [.] get_phys_addr_lp=
ae
   4.16%  qemu-system-aar  qemu-system-aarch64         [.] helper_lookup_tb=
_ptr

I'm open to ideas as to what might cause that.

--=20
Alex Benn=C3=A9e

