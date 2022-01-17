Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 20C814905C6
	for <lists+qemu-devel@lfdr.de>; Mon, 17 Jan 2022 11:18:40 +0100 (CET)
Received: from localhost ([::1]:56220 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n9P5z-0007XQ-93
	for lists+qemu-devel@lfdr.de; Mon, 17 Jan 2022 05:18:39 -0500
Received: from eggs.gnu.org ([209.51.188.92]:55560)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1n9P4t-00064v-8K
 for qemu-devel@nongnu.org; Mon, 17 Jan 2022 05:17:31 -0500
Received: from [2a00:1450:4864:20::535] (port=36508
 helo=mail-ed1-x535.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1n9P4r-0004ND-Ey
 for qemu-devel@nongnu.org; Mon, 17 Jan 2022 05:17:30 -0500
Received: by mail-ed1-x535.google.com with SMTP id 30so63486295edv.3
 for <qemu-devel@nongnu.org>; Mon, 17 Jan 2022 02:17:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=references:user-agent:from:to:cc:subject:date:in-reply-to
 :message-id:mime-version:content-transfer-encoding;
 bh=cdym548LObcobwWBt3B1fKItFZPGFQ9j8Mszpeyd6dI=;
 b=f2RLL6iOH9FDfR0TtCWTjMRhreElXBNSKHNNzhthbDJ62hlSvUaf2zS226PoN4t7o+
 rH5JOTSkBnwBY4+F5OhfbLiCfh5I6TMvIOu/L2pWOb+GRxzAON2zIR4fXrg/k4M3z4N1
 o5grQQtWYF1n5dqy0RI9kNGP5RopCDJ6KqVPw7S+c0BUbQ9ozzt8Ljm5fl0Jl2kGGwXM
 53ejONZiqW+cx8DEe2ziA9yWJi3O+LrTd/Zlym8X9kASlPVi+KiGSgIBmdCv7Elq6rXT
 du2YheIp+9twSfsl4FR+/GL4/nSj04KsjYstsWKqdbzvfGmV5q2wm0FonS+2z9ADm3mW
 KrkA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:references:user-agent:from:to:cc:subject:date
 :in-reply-to:message-id:mime-version:content-transfer-encoding;
 bh=cdym548LObcobwWBt3B1fKItFZPGFQ9j8Mszpeyd6dI=;
 b=0hIBgzC1ZM5AZAqj/OwGGw5qFPxavGBFfQwkrgS0QYXuxUgCWmGPTmYY68uMDdFh8h
 hIAzIWopvlIusSv6+osWsMLIHKOOjc21bW+EnqkK4jP986Z5YITVLH9ck02pqKw9PI3q
 pwLWqaVE9nR82VttCysSkWkTFFEkNjLZZ7mbt8qhP2BIGs8zfKRpoPqMHfhQfxgvI7hR
 P6jPY/0QYkQ83Z1YUElJg/4c2OMeEshesbswQZxfLBC/1Tvv1fv8y7EZnXLbL4VNQDn5
 TJfKcFSKDkIAt25j8dILBEtszueO38I8fqYhQkVrdMGO61xaUBmy1Znv8nMDMwEo2wRm
 tRsw==
X-Gm-Message-State: AOAM530T3Jws3JJAZfHaD2pwjrbXOJVLqIcblOLTYcCvKNVikryKx6gz
 tDFjlfOVLqYA9wfYqMJK4VM5qw==
X-Google-Smtp-Source: ABdhPJwTvkQbikoUs2rwf56dzbFyCjRnVVsZEB7xLbqF/TwREzDKS68F/Ux5Ypz3niTT8nXaOzFr0Q==
X-Received: by 2002:a17:907:3ea2:: with SMTP id
 hs34mr16122171ejc.191.1642414646950; 
 Mon, 17 Jan 2022 02:17:26 -0800 (PST)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id mp9sm4211180ejc.106.2022.01.17.02.17.25
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 17 Jan 2022 02:17:25 -0800 (PST)
Received: from zen (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 351EE1FFB7;
 Mon, 17 Jan 2022 10:17:25 +0000 (GMT)
References: <cover.1641987128.git.viresh.kumar@linaro.org>
 <20220117034606-mutt-send-email-mst@kernel.org>
User-agent: mu4e 1.7.5; emacs 28.0.91
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: "Michael S. Tsirkin" <mst@redhat.com>
Subject: Re: [PATCH 0/2] virtio: Add vhost-user-gpio device's support
Date: Mon, 17 Jan 2022 10:11:21 +0000
In-reply-to: <20220117034606-mutt-send-email-mst@kernel.org>
Message-ID: <871r16br9n.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::535
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::535;
 envelope-from=alex.bennee@linaro.org; helo=mail-ed1-x535.google.com
X-Spam_score_int: -12
X-Spam_score: -1.3
X-Spam_bar: -
X-Spam_report: (-1.3 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 PDS_HP_HELO_NORDNS=0.001, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
>
> I'm reluctant to add this with no tests in tree.
> Want to write a minimal libhost-user based backend?

This is going to be a problem going forward as we have more out-of-tree
backends written as a first preference. While the first couple of vhost
devices have C implementations in contrib before we worked on the rust
version I think we are getting to the point of skipping a first C
version for future devices.

However I notice we have qtest/vhost-user-test.c so would that be enough
to ensure we can instantiate the device and a basic vhost-user
initialisation sequence doesn't cause it to crap out. This obviously
won't be exercising the virtq processing itself but does that really
exercise any of QEMU's boilerplate anyway?

> We also need some maintainers to step up.

You mean more reviewers for the vhost and virtio sections of QEMU's
maintainers?

>
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

