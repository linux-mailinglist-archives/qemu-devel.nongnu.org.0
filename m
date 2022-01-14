Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 17EAB48EBC5
	for <lists+qemu-devel@lfdr.de>; Fri, 14 Jan 2022 15:39:02 +0100 (CET)
Received: from localhost ([::1]:50846 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n8NjJ-0001e8-2k
	for lists+qemu-devel@lfdr.de; Fri, 14 Jan 2022 09:39:01 -0500
Received: from eggs.gnu.org ([209.51.188.92]:48186)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1n8NGB-0007vx-3F
 for qemu-devel@nongnu.org; Fri, 14 Jan 2022 09:08:56 -0500
Received: from [2a00:1450:4864:20::42f] (port=44966
 helo=mail-wr1-x42f.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1n8NG9-0002yf-JL
 for qemu-devel@nongnu.org; Fri, 14 Jan 2022 09:08:54 -0500
Received: by mail-wr1-x42f.google.com with SMTP id k18so15772624wrg.11
 for <qemu-devel@nongnu.org>; Fri, 14 Jan 2022 06:08:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=references:user-agent:from:to:cc:subject:date:in-reply-to
 :message-id:mime-version:content-transfer-encoding;
 bh=XSOvOhd9lIclNKKyrqE6dBBkuEhgGoc1Yxy3uJWYbyw=;
 b=TNUJ2pe/cmTEqrIO3YvDAtL7eRCeXIz16weaOpimvkXjWsEI+ZA+4HNztWD5jEgfhH
 L7NJPpywWybg5wHxe6oy67bhtUCT0EovK4hrWZnPH3e8ObC64fG6w6D5iKHXdIY0b2sK
 DSibJHgDTtkMalXrj6PRuyGYc9U+hw15JrdrydMjxluIvezFasSTRKJU08CBwTcAUd/e
 /Dln0R6WsNjzUf5P1elrNIPxaSvvgHkJF6CZSvCb3aa0y1BHuJRvsptLkaLrQ5DP2ERe
 K3023NHxrMms8DJs8n94PFK/1WrQNYmHHd/qjzq/SSi1D05+yMxGiGnhR1KcA3L1F9ME
 X3sQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:references:user-agent:from:to:cc:subject:date
 :in-reply-to:message-id:mime-version:content-transfer-encoding;
 bh=XSOvOhd9lIclNKKyrqE6dBBkuEhgGoc1Yxy3uJWYbyw=;
 b=2Scy1569FLkF5Y47MqU6nq1TbzsT+3SpyQEzo5HnS7/uD9MzZCjdqUBTX2P4a7Nd0L
 R9/KD0UOXSknPajb3n8hYd959dFP4obGPW1fFpcAGUMZA5xdErVX44FhZk6RsVnabJ+t
 dRaj41rGS2h7jkMsSp9XFVkh97aBkwdstkV+9nZncw11/WKm+V7G6lZ4Fo1/fazvuwQO
 rV7PWjZamlDooGyWSIansBGxofe3w33T7QwexNm+VzoeQD11uYvHsVmDXDm/qPwbhKpS
 HmYUlLQpbqz/L0/ZUcZGfV9vBDM93vBUakWjJ7uUoQNT+H6e1kkg46ua6lqkbJEZ1Py4
 drKw==
X-Gm-Message-State: AOAM5304Ske92CZ9lsL37yxIzMzL9Zzg3LnJoRYp4KuYpnGlhiUoauO8
 XrtBUu4wasK0nY3lsJOOcSDetw==
X-Google-Smtp-Source: ABdhPJy62jQQB2mLpzg4dquT++ZgQ8EaSzQNEEYkuoxmZ82azff55LcPVgrGPZjWMwYieO4K0zR0uA==
X-Received: by 2002:a5d:484f:: with SMTP id n15mr8392422wrs.625.1642169331672; 
 Fri, 14 Jan 2022 06:08:51 -0800 (PST)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id e12sm2193177wrg.33.2022.01.14.06.08.50
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 14 Jan 2022 06:08:50 -0800 (PST)
Received: from zen (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 25F761FFB7;
 Fri, 14 Jan 2022 14:08:50 +0000 (GMT)
References: <cover.1641987128.git.viresh.kumar@linaro.org>
 <5390324a748194a21bc99b1538e19761a8c64092.1641987128.git.viresh.kumar@linaro.org>
User-agent: mu4e 1.7.5; emacs 28.0.91
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Viresh Kumar <viresh.kumar@linaro.org>
Subject: Re: [PATCH 1/2] hw/virtio: add boilerplate for vhost-user-gpio device
Date: Fri, 14 Jan 2022 14:06:31 +0000
In-reply-to: <5390324a748194a21bc99b1538e19761a8c64092.1641987128.git.viresh.kumar@linaro.org>
Message-ID: <87zgny8l59.fsf@linaro.org>
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
Cc: stratos-dev@op-lists.linaro.org,
 Vincent Guittot <vincent.guittot@linaro.org>, qemu-devel@nongnu.org,
 "Michael S. Tsirkin" <mst@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


Viresh Kumar <viresh.kumar@linaro.org> writes:

> This creates the QEMU side of the vhost-user-gpio device which connects
> to the remote daemon. It is based of vhost-user-i2c code.
>
> Signed-off-by: Viresh Kumar <viresh.kumar@linaro.org>
<snip>
> +++ b/include/hw/virtio/vhost-user-gpio.h
> @@ -0,0 +1,35 @@
> +/*
> + * Vhost-user GPIO virtio device
> + *
> + * Copyright (c) 2021 Viresh Kumar <viresh.kumar@linaro.org>
> + *
> + * SPDX-License-Identifier: GPL-2.0-or-later
> + */
> +
> +#ifndef _QEMU_VHOST_USER_GPIO_H
> +#define _QEMU_VHOST_USER_GPIO_H
> +
> +#include "hw/virtio/virtio.h"
> +#include "hw/virtio/vhost.h"
> +#include "hw/virtio/vhost-user.h"
> +#include "standard-headers/linux/virtio_gpio.h"

Hmm this fails:

  In file included from ../../hw/virtio/vhost-user-gpio.c:13:
  /home/alex/lsrc/qemu.git/include/hw/virtio/vhost-user-gpio.h:15:10: fatal=
 error: standard-headers/linux/virtio_gpio.h: No such file or directory
     15 | #include "standard-headers/linux/virtio_gpio.h"
        |          ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
  compilation terminated.

The usual solution is to create a patch that imports the headers using:

  ./scripts/update-linux-headers.sh

either from the current mainline (or your own tree if the feature is in
flight) and mark the patch clearly as not for merging.

--=20
Alex Benn=C3=A9e

