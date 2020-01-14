Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9E50413A80C
	for <lists+qemu-devel@lfdr.de>; Tue, 14 Jan 2020 12:12:24 +0100 (CET)
Received: from localhost ([::1]:37076 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1irK7T-0004Ri-9E
	for lists+qemu-devel@lfdr.de; Tue, 14 Jan 2020 06:12:23 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:48209)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <alex.bennee@linaro.org>) id 1irJxf-0001cW-6V
 for qemu-devel@nongnu.org; Tue, 14 Jan 2020 06:02:16 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <alex.bennee@linaro.org>) id 1irJxe-0007U8-18
 for qemu-devel@nongnu.org; Tue, 14 Jan 2020 06:02:15 -0500
Received: from mail-wm1-x342.google.com ([2a00:1450:4864:20::342]:56245)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <alex.bennee@linaro.org>)
 id 1irJxd-0007Tt-Qm
 for qemu-devel@nongnu.org; Tue, 14 Jan 2020 06:02:13 -0500
Received: by mail-wm1-x342.google.com with SMTP id q9so13224414wmj.5
 for <qemu-devel@nongnu.org>; Tue, 14 Jan 2020 03:02:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=references:user-agent:from:to:cc:subject:in-reply-to:date
 :message-id:mime-version:content-transfer-encoding;
 bh=xapXEXsQvmkLueFpCx1Od3KtZFUB49fuDfl8xft62VI=;
 b=dT+CSyEyHOS7ODvK2d9Q90Pj8QYbB0Ed6V+M9VCRUZl8gfAEusde/LVZcSxQ9WUHHO
 yw+0X5zButTipqEtoZ1Dm+YMKJAJzlq06BS2rT2aT8wSqyqSAQE+BhI97x3YPFYIa4ya
 uKpBWWIESb+cO+6ZD/dlLP9whuFhmSbTCF5gKsSqtbMt0P9chlhyO++4R1I9yrhrtVYB
 KTEyXUzxJPtsa0PHh+TRtDQ+KBAIWQDF6CdqGFAMFRgpFQ1sZ8KBTLEU7umiipNRntxC
 N7Hdo91p1YM5dYJ0IGiQYbkGZ47HZBmhfRa2x5nfnBehxSA8rkAH8bPTOX2W92Aj+POO
 jnag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:references:user-agent:from:to:cc:subject
 :in-reply-to:date:message-id:mime-version:content-transfer-encoding;
 bh=xapXEXsQvmkLueFpCx1Od3KtZFUB49fuDfl8xft62VI=;
 b=XcJgXed9Yl1dk3vTHeq6m13kemREgeagsWmrJj29ToUeiZ7RaEtIqBV14U3e02mODv
 vW0vzt0+CLAsDmWTiMGL7s0CwjXzyCwc3f/UoEhQ3THNKvIVLSJyHMABkS95H1LN3EBA
 Nas0MSjG3RjNm/BS3d/43NHMI56DyqfK6yh8EMk1u319A8hopYGX3qqIoPW2zkZQ8vqi
 LPXNGAy42qklkTLYyQWh+k3NDej3dpgCmGZ55v7PqQWfDdItH+rwRUWc/3iqQFMhAkjP
 2KmbYWp7bJrwo1EBmcT53mbCCv853lIiNjXArzDjuOv25pRlnFFbejXHIaMPphN3rYxO
 hxdQ==
X-Gm-Message-State: APjAAAUzQsbWYP6N3tdaPbhbnvzTHg5EbR3EA/7fWZrSRQL/z323atY+
 u75Z5j2I3zINn0rXGFphMt6ilw==
X-Google-Smtp-Source: APXvYqw2Usg8XLdj/vpKesaneG+UHHzXD8MMTN/F6k3bw/Y8OIhss01YauIyuhYwy6Cx5n0Cb2suPA==
X-Received: by 2002:a7b:c74c:: with SMTP id w12mr26247660wmk.1.1578999732275; 
 Tue, 14 Jan 2020 03:02:12 -0800 (PST)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id d16sm20324146wrg.27.2020.01.14.03.02.10
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 14 Jan 2020 03:02:11 -0800 (PST)
Received: from zen (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 616C31FF87;
 Tue, 14 Jan 2020 11:02:10 +0000 (GMT)
References: <20200114030138.260347-1-jkz@google.com>
User-agent: mu4e 1.3.6; emacs 28.0.50
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Josh Kunz <jkz@google.com>
Subject: Re: [PATCH 0/4] migration: Replace gemu_log with qemu_log
In-reply-to: <20200114030138.260347-1-jkz@google.com>
Date: Tue, 14 Jan 2020 11:02:10 +0000
Message-ID: <87h80ymhcd.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2a00:1450:4864:20::342
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
Cc: armbru@redhat.com, riku.voipio@iki.fi, qemu-devel@nongnu.org,
 laurent@vivier.eu
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


Josh Kunz <jkz@google.com> writes:

<snip>
>
> Not tested:
>   * Build/logging with bsd-user. I do not have easy access to a BSD
> system.

If you have the time we have vm-build-netbsd:

  make vm-build-netbsd EXTRA_CONFIGURE_OPTS=3D"--disable-system"
=20=20
Which will create a NetBSD image for you and run the build through it.
Other images are available ;-)

--=20
Alex Benn=C3=A9e

