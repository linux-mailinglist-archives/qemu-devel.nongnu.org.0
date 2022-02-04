Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7B6344A9A86
	for <lists+qemu-devel@lfdr.de>; Fri,  4 Feb 2022 15:00:53 +0100 (CET)
Received: from localhost ([::1]:43626 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nFz8u-00042M-JD
	for lists+qemu-devel@lfdr.de; Fri, 04 Feb 2022 09:00:52 -0500
Received: from eggs.gnu.org ([209.51.188.92]:32834)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1nFz27-0008Pb-JS
 for qemu-devel@nongnu.org; Fri, 04 Feb 2022 08:53:51 -0500
Received: from [2a00:1450:4864:20::42f] (port=46907
 helo=mail-wr1-x42f.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1nFz25-0003KS-Aj
 for qemu-devel@nongnu.org; Fri, 04 Feb 2022 08:53:51 -0500
Received: by mail-wr1-x42f.google.com with SMTP id l25so11409651wrb.13
 for <qemu-devel@nongnu.org>; Fri, 04 Feb 2022 05:53:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=references:user-agent:from:to:cc:subject:date:in-reply-to
 :message-id:mime-version:content-transfer-encoding;
 bh=0piNcH9B7WFk5xOtqo8WHwxcT88mt9oJSrW6gEknXbM=;
 b=kHxh+4E550cp1N/f1PsJLiMV9A/Ta9Dg+tCOpWGRLPjOrmDbxtKbDqBjfWRc+lM28m
 mpKMy4OPR9krvqK9AL2UxCeibQuEng8vCv3zG7pcEhqCdgSkpPoKWdJJ6O3HupP5WdHZ
 5kEmFBFhlW3w83jHpcqNDNunzid+WSzOLi0TBK54q+Tc+41uhnu96t84rZGNOIGEd2Is
 Dzej7oNExUnc3BBCwEIj3SIxeIAIGFfJpCibJcJiVPhOaQLyVGjHQpca0xU2NUpDgnce
 dpdW0ZfeWj1LFMtgiroGrUtaeFyPVRKVM1prxdnhR5GMRkhfzQ37j1J9pqJVl0iQLb6t
 wOWw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:references:user-agent:from:to:cc:subject:date
 :in-reply-to:message-id:mime-version:content-transfer-encoding;
 bh=0piNcH9B7WFk5xOtqo8WHwxcT88mt9oJSrW6gEknXbM=;
 b=kHgrCzAz4k+A1XKR7GNK80eTHmMpFxKbxz8ExUSKKVW9HwyCi5uogqw6nNJIBoCDkV
 fnBpwFE4fPGYYvhnAkAIviqctvp13b8zmOnbfw6rGx891M6Fl20QHC+WVarqrEAfgkK9
 JuBvLeLwdTBQAJIq+dlgKIrNIl9LEITMr3oN4qFxmmB0azfE78NydF7fCvdurXTl/2Zx
 keYoVUAK/opfSxfHm8NT9epkjG/FaF8TDWGEux+SyQPUdLqNHYJvK6aa9P/zlKKiNHtd
 UD1PYPUBJHiab0FcWkfRLFT6GK+yjOI8r8v1JQdxE8GZhNfrKPn2way5Wtm9IqX9VDBW
 /H4A==
X-Gm-Message-State: AOAM530o4EPxTtFaARgk/Q1YdggJtuwjA474u5ITzQ9rWkiqpbDd0nOG
 qzpeCeQ/7x52NX6OCVcFhrnx0Q==
X-Google-Smtp-Source: ABdhPJxUbX6fO+8+P4GZ+kigPEWnXZrlcdmGOhaa/a4/j1oxVCGASCeJW1noQ6I+Zo9uJUwBgX2TNA==
X-Received: by 2002:a05:6000:4d:: with SMTP id
 k13mr2575026wrx.625.1643982827927; 
 Fri, 04 Feb 2022 05:53:47 -0800 (PST)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id m11sm8813831wmi.16.2022.02.04.05.53.46
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 04 Feb 2022 05:53:46 -0800 (PST)
Received: from zen (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 21B2B1FFB7;
 Fri,  4 Feb 2022 13:53:46 +0000 (GMT)
References: <cover.1641987128.git.viresh.kumar@linaro.org>
 <20220204072104-mutt-send-email-mst@kernel.org>
User-agent: mu4e 1.7.6; emacs 28.0.91
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: "Michael S. Tsirkin" <mst@redhat.com>
Subject: Re: [PATCH 0/2] virtio: Add vhost-user-gpio device's support
Date: Fri, 04 Feb 2022 13:52:47 +0000
In-reply-to: <20220204072104-mutt-send-email-mst@kernel.org>
Message-ID: <874k5espp1.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::42f
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::42f;
 envelope-from=alex.bennee@linaro.org; helo=mail-wr1-x42f.google.com
X-Spam_score_int: -12
X-Spam_score: -1.3
X-Spam_bar: -
X-Spam_report: (-1.3 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 PDS_HP_HELO_NORDNS=0.001, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
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
Cc: Viresh Kumar <viresh.kumar@linaro.org>,
 Vincent Guittot <vincent.guittot@linaro.org>, qemu-devel@nongnu.org,
 stratos-dev@op-lists.linaro.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


"Michael S. Tsirkin" <mst@redhat.com> writes:

> On Wed, Jan 12, 2022 at 05:04:57PM +0530, Viresh Kumar wrote:
>> Hello,
>>=20
>> This patchset adds vhost-user-gpio device's support in Qemu. The support=
 for the
>> same has already been added to virtio specification and Linux Kernel.
>>=20
>> A Rust based backend is also in progress and is tested against this patc=
hset:
>>=20
>> https://github.com/rust-vmm/vhost-device/pull/76
>
> So I'm waiting for v2 of this, right?

If you can give any pointers for how to properly instantiate the stub in
qtest then we can spin v2 pretty quickly. I tried but it didn't work:

  Subject: [RFC PATCH] tests/qtest: attempt to enable tests for virtio-gpio=
 (!working)
  Date: Fri, 21 Jan 2022 15:15:34 +0000
  Message-Id: <20220121151534.3654562-1-alex.bennee@linaro.org>
  X-Mailer: git-send-email 2.30.2
  In-Reply-To: <20220120040234.ehcjcdr6wrvlz3yc@vireshk-i7>
  References: <20220120040234.ehcjcdr6wrvlz3yc@vireshk-i7>

it's all a bit opaque as to why it didn't.

>
>> --
>> Viresh
>>=20
>> Viresh Kumar (2):
>>   hw/virtio: add boilerplate for vhost-user-gpio device
>>   hw/virtio: add vhost-user-gpio-pci boilerplate
>>=20
>>  hw/virtio/Kconfig                   |   5 +
>>  hw/virtio/meson.build               |   2 +
>>  hw/virtio/vhost-user-gpio-pci.c     |  69 ++++++
>>  hw/virtio/vhost-user-gpio.c         | 343 ++++++++++++++++++++++++++++
>>  include/hw/virtio/vhost-user-gpio.h |  35 +++
>>  5 files changed, 454 insertions(+)
>>  create mode 100644 hw/virtio/vhost-user-gpio-pci.c
>>  create mode 100644 hw/virtio/vhost-user-gpio.c
>>  create mode 100644 include/hw/virtio/vhost-user-gpio.h
>>=20
>> --=20
>> 2.31.1.272.g89b43f80a514


--=20
Alex Benn=C3=A9e

