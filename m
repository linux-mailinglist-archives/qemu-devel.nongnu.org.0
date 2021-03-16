Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9A6BB33D230
	for <lists+qemu-devel@lfdr.de>; Tue, 16 Mar 2021 11:53:12 +0100 (CET)
Received: from localhost ([::1]:58940 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lM7K3-0005zx-IM
	for lists+qemu-devel@lfdr.de; Tue, 16 Mar 2021 06:53:11 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47956)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1lM7G7-0002pW-40
 for qemu-devel@nongnu.org; Tue, 16 Mar 2021 06:49:10 -0400
Received: from mail-ed1-x52c.google.com ([2a00:1450:4864:20::52c]:41646)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1lM7G2-0000nv-TC
 for qemu-devel@nongnu.org; Tue, 16 Mar 2021 06:49:06 -0400
Received: by mail-ed1-x52c.google.com with SMTP id z1so20907406edb.8
 for <qemu-devel@nongnu.org>; Tue, 16 Mar 2021 03:49:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=references:user-agent:from:to:cc:subject:date:in-reply-to
 :message-id:mime-version:content-transfer-encoding;
 bh=+HleSKeoiCNIEjGMZhk2YVMenpA6DUgIqUZLHm+zjCo=;
 b=CR7YXrsTb47Uyqhw6Ql8VT562rRmVEUu78ctDkS7t7anCEjIOqaK/cBhVlBDTtfsKd
 I2G9GuCsJd04NMiePDd8ITz8Yo/8Y7uCtz20PdMsa5eQjv2UAMfQlR7PAxTYt8XA2tOU
 4gd6NBIZehCSPszKdyJfISQ+p4rwVkwVONtIpPFpSGaAuoLVFIhhcqo6rMdYHGTUe6A4
 8J+5LW6bWRwKjY/w9Nu8EuIBup3GVUbXda4hBYeoa05jdsHJPu6YgkbVtGwaUyKeC4DY
 GqYiKnGGtFeYzCQqVjvsIQUuxW51tjVxjxrAgu5C7R9Z++cF6pCpWt2vI7NK0qEXIOQ6
 Oc2A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:references:user-agent:from:to:cc:subject:date
 :in-reply-to:message-id:mime-version:content-transfer-encoding;
 bh=+HleSKeoiCNIEjGMZhk2YVMenpA6DUgIqUZLHm+zjCo=;
 b=o7YjuELKB9JQFc19NbJgwRMFgfp6StxokaHGqZMNwoZUkxWRrsHmV5rsXg9NXTz3ul
 m3Q91+D4SYhRSyTcA9qTVZGJvKK/lwl35ZQa/h0No39mNpmALF0gLg/CSXqI9w1HzYFf
 eySer5w3+1WIXFwRBPROLSZxOk0MFwaNg5oic4t9qR5mOS4H3arYUeXgvBnH6ZV46xbK
 u7sjk9jhjMGlWSCAWSuzeYf1MBrPISZgMxH54955VZbJoqVFuzwXFNOwnRQmWcDUSCi1
 Fd2BOcQSaW5aaCBQEPbZdnhH6ZwSlDPNzW3P+tGE/2+ljnG7xWGbWEDcdTTRFo30qOv3
 KB+Q==
X-Gm-Message-State: AOAM530yBb6RvcVgrIJf+2rktmOmIekPokooaUlP3P6y1BYojASdMYio
 FXIItALLW+gaD+D53YySc2ThPg==
X-Google-Smtp-Source: ABdhPJwlBXjufjCbDrANFeLtA0hfU7HKGV5f64wbjwAn23FNWke25rJ87QxRspsAK6iJkgSS+KOM6w==
X-Received: by 2002:aa7:dc56:: with SMTP id g22mr35450875edu.219.1615891741072; 
 Tue, 16 Mar 2021 03:49:01 -0700 (PDT)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id c10sm10037050edt.64.2021.03.16.03.49.00
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 16 Mar 2021 03:49:00 -0700 (PDT)
Received: from zen (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 87DC21FF7E;
 Tue, 16 Mar 2021 10:48:59 +0000 (GMT)
References: <20210315170439.2868903-1-philmd@redhat.com>
User-agent: mu4e 1.5.10; emacs 28.0.50
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <philmd@redhat.com>
Subject: Re: [PATCH] hw/core: Only build guest-loader if libfdt is available
Date: Tue, 16 Mar 2021 10:48:53 +0000
In-reply-to: <20210315170439.2868903-1-philmd@redhat.com>
Message-ID: <87eegf8jc4.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::52c;
 envelope-from=alex.bennee@linaro.org; helo=mail-ed1-x52c.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: Christian Borntraeger <borntraeger@de.ibm.com>,
 Alistair Francis <alistair.francis@wdc.com>, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com> writes:

> Add a Kconfig entry for guest-loader so we can optionally deselect
> it (default is built in), and add a Meson dependency on libfdt.
>
> This fixes when building with --disable-fdt:
>
>   /usr/bin/ld: libcommon.fa.p/hw_core_guest-loader.c.o: in function `load=
er_insert_platform_data':
>   hw/core/guest-loader.c:56: undefined reference to `qemu_fdt_add_subnode'
>   /usr/bin/ld: hw/core/guest-loader.c:57: undefined reference to `qemu_fd=
t_setprop'
>   /usr/bin/ld: hw/core/guest-loader.c:61: undefined reference to `qemu_fd=
t_setprop_string_array'
>   /usr/bin/ld: hw/core/guest-loader.c:68: undefined reference to `qemu_fd=
t_setprop_string'
>   /usr/bin/ld: hw/core/guest-loader.c:74: undefined reference to `qemu_fd=
t_setprop_string_array'
>   collect2: error: ld returned 1 exit status
>
> Fixes: a33ff6d2c6b ("hw/core: implement a guest-loader to support static =
hypervisor guests")
> Reported-by: Christian Borntraeger <borntraeger@de.ibm.com>
> Tested-by: Christian Borntraeger <borntraeger@de.ibm.com>
> Signed-off-by: Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com>

Queued to for-6.0/assorted-fixes, thanks.

--=20
Alex Benn=C3=A9e

