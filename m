Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C184B5A9A2B
	for <lists+qemu-devel@lfdr.de>; Thu,  1 Sep 2022 16:25:43 +0200 (CEST)
Received: from localhost ([::1]:57606 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oTl8X-0000OZ-RH
	for lists+qemu-devel@lfdr.de; Thu, 01 Sep 2022 10:25:41 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:55442)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1oTl6r-0007Eb-DH
 for qemu-devel@nongnu.org; Thu, 01 Sep 2022 10:23:57 -0400
Received: from mail-wm1-x330.google.com ([2a00:1450:4864:20::330]:37447)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1oTl6p-0005YO-C8
 for qemu-devel@nongnu.org; Thu, 01 Sep 2022 10:23:57 -0400
Received: by mail-wm1-x330.google.com with SMTP id
 c131-20020a1c3589000000b003a84b160addso772355wma.2
 for <qemu-devel@nongnu.org>; Thu, 01 Sep 2022 07:23:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:message-id:in-reply-to:date
 :subject:cc:to:from:user-agent:references:from:to:cc:subject:date;
 bh=bMiWJN3ga/eTwuhi2tmIQMZ6SvFKSOno5w1cmFEb/qE=;
 b=QLgxNRbKLKZ987vTAIcmyRU9WPUKQtSRCCUvVT4gAgdvw9QsDrQEZ1uJk4Gz7AtSIF
 ta5Z48+ZBpYpJyU5+FDMwn3zNvzlUqM1EjI5h9JhUofISncSN44wqNSliHG20ON7ViuN
 mQtfXLn77XIKmqqtVp8RTHDizPrQiZVTluo1rZ9KmJjsnr/361skahzhRCywkNuKoTiV
 LjyIiXQWA7Q5Z4kPGo0MDwTfO1O0TKAyjvfkAEQoX7vLiOfGRDbyAw8wc99eehTznroW
 LtcZ+MjF4raOfDUqvUUB6rHkGc/Xu8bFdFMMQdnGGU8W8LvPzRTYe6WuYo4/dB4uDT1Y
 FaSg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:in-reply-to:date
 :subject:cc:to:from:user-agent:references:x-gm-message-state:from:to
 :cc:subject:date;
 bh=bMiWJN3ga/eTwuhi2tmIQMZ6SvFKSOno5w1cmFEb/qE=;
 b=FKHYe55NhZ/9RGS9V1biOUEjL7TjscwvabUgmHBXeoZRf/ZnAXXrtaUDgujEQjuvqq
 RQ5RHYHtfN4ujez9253eH0vDXL0hN+GqZeIdCavzpDzJ0QGGEt5GKssPjwQ3KIuo/D2u
 38+JUgP4agqQEk+QMJQTQby2OdpxciyzDkZNf0odRYns3ozPIGpHYc3WNVqK0Plc7ICD
 bx5CmUmNk6M930/yX8IDpqxN/PPPEr195PBKyUOusad9XnbhEB2JVK8XabAzfRwzQEFB
 o8jv6BrenDmebbu1IektSZzM8SqBHOnnZgkeNw3+tyrqdlrrXBf8+wlxoI0AEvc5PNDt
 pg6A==
X-Gm-Message-State: ACgBeo1MoZpRo/EQR5RXkUG2tSxjcgvpxz7pSMSMwIIpaQdz3/saE6C+
 885Qv17obZHHC1PKETgoLQTXfWwLNsRO5g==
X-Google-Smtp-Source: AA6agR5ZbCjy5PddjNMq5C3ZDN0jMj5n037bCDAMIptz3zYhw2/F7HZ5EsoBiYHzQl8Yd9HH80vqBA==
X-Received: by 2002:a05:600c:3514:b0:3a5:dc71:d9c4 with SMTP id
 h20-20020a05600c351400b003a5dc71d9c4mr5473735wmq.42.1662042232900; 
 Thu, 01 Sep 2022 07:23:52 -0700 (PDT)
Received: from zen.linaroharston ([185.81.254.11])
 by smtp.gmail.com with ESMTPSA id
 m5-20020a5d4a05000000b00225213fd4a9sm15193614wrq.33.2022.09.01.07.23.52
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 01 Sep 2022 07:23:52 -0700 (PDT)
Received: from zen (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id E2F7C1FFB7;
 Thu,  1 Sep 2022 15:23:51 +0100 (BST)
References: <87a67kphih.fsf@linaro.org> <87wnaonxug.fsf@linaro.org>
 <5ba3509f-7125-42ea-93fc-552e88928b32.lzw194868@alibaba-inc.com>
User-agent: mu4e 1.9.0; emacs 28.1.91
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: =?utf-8?B?5YiY5b+X5Lyf?= <zhiwei_liu@c-sky.com>
Cc: "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>, Mark Burton
 <mburton@qti.qualcomm.com>, "Edgar  E. Iglesias"
 <edgar.iglesias@gmail.com>, Richard Henderson
 <richard.henderson@linaro.org>, Paolo Bonzini <pbonzini@redhat.com>, Peter
 Maydell <peter.maydell@linaro.org>, Song Gao <gaosong@loongson.cn>,
 Xiaojuan Yang <yangxiaojuan@loongson.cn>, =?utf-8?Q?C=C3=A9dric?= Le Goater
 <clg@kaod.org>, Palmer Dabbelt <palmer@dabbelt.com>, Alistair Francis
 <alistair.francis@wdc.com>, Bin Meng <bin.meng@windriver.com>, David
 Gibson <david@gibson.dropbear.id.au>, Markus Armbruster
 <armbru@redhat.com>, Michael Roth <michael.roth@amd.com>, Luc Michel
 <luc@lmichel.fr>, Damien Hedde <damien.hedde@greensocs.com>, Alessandro Di
 Federico <ale@rev.ng>
Subject: Re: =?utf-8?B?5Zue5aSN77yaQW55?= interest in a QEMU emulation BoF
 at KVM Forum?
Date: Thu, 01 Sep 2022 15:23:09 +0100
In-reply-to: <5ba3509f-7125-42ea-93fc-552e88928b32.lzw194868@alibaba-inc.com>
Message-ID: <87tu5rmavc.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::330;
 envelope-from=alex.bennee@linaro.org; helo=mail-wm1-x330.google.com
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


"=E5=88=98=E5=BF=97=E4=BC=9F" <zhiwei_liu@c-sky.com> writes:

> These topics are interesting.  I have two questions.
>
> 1. Can we join it on online?  If so, could you share the meeting link
> before the meeting.

I will try to find out.

>
> 2. If it is only offline, could you share the meeting content to the
> public?

I'll certainly try and write up some minutes for the list.

>
> Thanks,
> Zhiwei=20
>
>  ------------------------------------------------------------------
>  =E5=8F=91=E4=BB=B6=E4=BA=BA=EF=BC=9AAlex Benn=C3=A9e <alex.bennee@linaro=
.org>
>  =E5=8F=91=E9=80=81=E6=97=B6=E9=97=B4=EF=BC=9A2022=E5=B9=B49=E6=9C=881=E6=
=97=A5(=E6=98=9F=E6=9C=9F=E5=9B=9B) 01:08
>  =E6=94=B6=E4=BB=B6=E4=BA=BA=EF=BC=9Aqemu-devel@nongnu.org <qemu-devel@no=
ngnu.org>
>  =E6=8A=84=E3=80=80=E9=80=81=EF=BC=9AMark Burton <mburton@qti.qualcomm.co=
m>; Edgar E. Iglesias <edgar.iglesias@gmail.com>; Richard
>  Henderson <richard.henderson@linaro.org>; Paolo Bonzini <pbonzini@redhat=
.com>; Peter Maydell
>  <peter.maydell@linaro.org>; Song Gao <gaosong@loongson.cn>; Xiaojuan Yan=
g <yangxiaojuan@loongson.cn>;
>  "C=C3=A9dric Le Goater" <clg@kaod.org>; Palmer Dabbelt <palmer@dabbelt.c=
om>; Alistair Francis
>  <alistair.francis@wdc.com>; Bin Meng <bin.meng@windriver.com>; David Gib=
son <david@gibson.dropbear.id.au>;
>  Markus Armbruster <armbru@redhat.com>; Michael Roth <michael.roth@amd.co=
m>; Luc Michel <luc@lmichel.fr>;
>  Damien Hedde <damien.hedde@greensocs.com>; Alessandro Di Federico <ale@r=
ev.ng>
>  =E4=B8=BB=E3=80=80=E9=A2=98=EF=BC=9ARe: Any interest in a QEMU emulation=
 BoF at KVM Forum?
>
>  Alex Benn=C3=A9e <alex.bennee@linaro.org> writes:
>
>  qemu-devel keeps bouncing the message so replying with a cut down CC lis=
t.
>
>  > Hi,
>  >
>  > Given our slowly growing range of TCG emulations and the evident
>  > interest in keeping up with modern processor architectures is it worth
>  > having an emulation focused BoF at the up-coming KVM Forum?
>  >
>  > Some potential topics for discussion I could think of might include:
>  >
>  >  * Progress towards heterogeneous vCPU emulation
>  >
>  >  We've been making slow progress in removing assumptions from the
>  >  various front-ends about their global nature and adding accel:TCG
>  >  abstractions and support for the translator loop. We can already have
>  >  CPUs from the same architecture family in a model. What else do we ne=
ed
>  >  to do so we can have those funky ARM+RiscV+Tricore heterogeneous
>  >  models? Is it library or something else?
>  >
>  >  * External Device Models
>  >
>  >  I know this is a contentious topic given the potential for GPL
>  >  end-runs. However there are also good arguments for enabling the
>  >  testing of open source designs without having forcing the
>  >  implementation of a separate C model to test software. For example if
>  >  we hypothetically modelled a Pi Pico would it make sense to model the
>  >  PIO in C if we could just compile the Verilog for it into a SystemC
>  >  model? Would a plethora of closed device models be the inevitable
>  >  consequence of such an approach? Would it matter if we just
>  >  concentrated on supporting useful open source solutions?
>  >
>  >  * Dynamic Machine Models
>  >
>  >  While we try and avoid modelling bespoke virtual HW in QEMU
>  >  (virt/goldfish not withstanding ;-) there is obviously a desire in the
>  >  EDA space to allow such experimentation. Is this something we can
>  >  provide so aspiring HW engineers can experiment with system
>  >  architectures without having to form QEMU and learn QOM. There have
>  >  been suggestions about consuming device trees or maybe translating to
>  >  QMP calls and adding support for wiring devices together. Given the
>  >  number of forks that exist is this something that could be better
>  >  supported upstream without degenerating into messy hacks?
>  >
>  >  * A sense of time
>  >
>  >  Currently we have the fairly limited support for -icount in QEMU. At
>  >  the same time we have no desire to start expanding frontends with
>  >  the details cost models required for a more realistic sense of time to
>  >  be presented. One suggestion is to expand the TCG plugin interface to
>  >  allow for the plugin to control time allowing as much or little logic
>  >  to be pushed there as we like and freeing up frontends from ever havi=
ng
>  >  to consider it.
>  >
>  > Are any of these topics of interest? Are there any other emulation
>  > topics people would like to discuss?
>
>  --=20
>  Alex Benn=C3=A9e


--=20
Alex Benn=C3=A9e

